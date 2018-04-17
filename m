From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH 1/1] xen: credit2: rb-tree for runqueues
Date: Tue, 17 Apr 2018 12:46:11 +0200
Message-ID: <e70b5f0797a7636de199e61290f6d769d88d2b63.camel@suse.com>
References: <20180403165505.8441-1-kpraveen.lkml@gmail.com>
 <20180403165505.8441-2-kpraveen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2252172649545153763=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180403165505.8441-2-kpraveen.lkml@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Praveen Kumar <kpraveen.lkml@gmail.com>, xen-devel@lists.xen.org
Cc: george.dunlap@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org


--===============2252172649545153763==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-dUbJ1Y+T9mJaCvHMKH/G"


--=-dUbJ1Y+T9mJaCvHMKH/G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-04-03 at 22:25 +0530, Praveen Kumar wrote:
> The patch optimized the sorted credit2 runq from simple linked list
> to
> rb-tree implementation. This way we will gain performance and
> scalability when the number of vCPUs are huge.
>=20
> Signed-off-by: Praveen Kumar <kpraveen.lkml@gmail.com>

> --- a/xen/common/sched_credit2.c
> +++ b/xen/common/sched_credit2.c
> @@ -600,6 +601,29 @@ static inline bool has_cap(const struct
> csched2_vcpu *svc)
>      return svc->budget !=3D STIME_MAX;
>  }
> =20
> +static void runq_insert_rb(struct rb_root *root,
> +                           struct csched2_vcpu *svc,
> +                           int *pos)
>
I'd call this rb_insert() or rb_runq_insert(), but that's taste (and
it's certainly a minor thing).

> +{
> +    struct csched2_vcpu *entry =3D NULL;
> +    struct rb_node **node =3D &root->rb_node;
> +    struct rb_node *parent =3D NULL;
> +
> +    while (*node) {
> +        parent =3D *node;
> +        entry =3D rb_entry(parent, struct csched2_vcpu, runq_elem);
> +        // Check if we are maintaining the sorted
>
Pointless comment. I'd leave the line blank (but that's taste again).

> +        if ( svc->credit < entry->credit )
> +            node =3D &parent->rb_left;
> +        else
> +            node =3D &parent->rb_right;
> +
> +        (*pos)++;
> +    }
> +    rb_link_node(&svc->runq_elem, parent, node);
> +    rb_insert_color(&svc->runq_elem, root);
> +}
>
Wait, where's the part where we cache which element is the one with the
highest credits? (And the same applies to the tree-removal function, of
course.)

In fact, we need a field for storing such a cache in the runqueue data
structure as well, and we need to keep it updated.

Linux (recently) added an rb-tree variant that do this internally, see
cd9e61ed1eebb "rbtree: cache leftmost node internally", and how such a
variant is used, e.g. 2161573ecd693 "sched/deadline: replace earliest
dl and rq leftmost caching".

So, I'd say that we either import that from there, or do the caching of
leftmost element explicitly where needed. Note that, however, that
Linux's variant caches leftmost, because they always use rb-trees for
structures where the head of the queue is the element with the
_smallest_ key.

In our case here, we want the queue ordered in descending credit order,
so it must be thought carefully whether or not we could use the new
variant (maybe "just" inverting the binary search tree relationship),
or we'd need another one that caches righmost.

I would suggest we do not try to use the rb_*_cached() functions, and
cache rightmost explicitly in runqueue_data.

> @@ -3201,17 +3225,21 @@ csched2_runtime(const struct scheduler *ops,
> int cpu,
>       * 2) If there's someone waiting whose credit is positive,
>       *    run until your credit ~=3D his.
>       */
> -    if ( ! list_empty(runq) )
> +    if ( ! RB_EMPTY_ROOT(runq) )
>      {
> -        struct csched2_vcpu *swait =3D runq_elem(runq->next);
> +        // Find the left most element, which is the most probable
> candidate
> +        struct rb_node *node =3D rb_first(runq);
>=20
Err... is it? Isn't the leftmost element the one with the _least_
credits? It looks to me that we want rb_last().

And IAC, we don't want to have to traverse the tree to get the runnable
vcpu with the highest credit, we want it available in O(1) time.

That's why we want to cache it.

> +        // TODO Can we take rb_next ?
> +        //struct rb_node *node =3D &rb_next(root->rb_node);
> +
What do you mean here?

> +        struct csched2_vcpu *swait =3D runq_elem(node);
>          if ( ! is_idle_vcpu(swait->vcpu)
>               && swait->credit > 0 )
>          {
>              rt_credit =3D snext->credit - swait->credit;
>          }
>      }

> @@ -3345,9 +3373,8 @@ runq_candidate(struct csched2_runqueue_data
> *rqd,
>          snext =3D csched2_vcpu(idle_vcpu[cpu]);
> =20
>   check_runq:
> -    list_for_each_safe( iter, temp, &rqd->runq )
> -    {
> -        struct csched2_vcpu * svc =3D list_entry(iter, struct
> csched2_vcpu, runq_elem);
> +    for (iter =3D rb_first(&rqd->runq); iter !=3D NULL; iter =3D
> rb_next(iter)) {
> +        struct csched2_vcpu * svc =3D rb_entry(iter, struct
> csched2_vcpu, runq_elem);
>
Same as above. I don't think this is from where we want to start. And
no matter whether we want to start from rb_first() or rb_last(), we
certainly don't want to have to traverse the tree to get to there.

> @@ -3761,8 +3789,8 @@ csched2_dump(const struct scheduler *ops)
>              dump_pcpu(ops, j);
> =20
>          printk("RUNQ:\n");
> -        list_for_each( iter, runq )
> -        {
> +
> +        for (iter =3D rb_first(runq); iter !=3D NULL; iter =3D
> rb_next(iter)) {
>
And the same applies here as well. I think that, if we want the
runqueue printed in the proper order, we need to start from the
righmost, and use rb_prev().

Oh, and about caching, I'd say it is okay if you want to turn this into
a series, the first patch of which does not have it, and you introduce
it in the second patch.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-dUbJ1Y+T9mJaCvHMKH/G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrV0HQACgkQFkJ4iaW4
c+68CBAA0eK9axhS/Vny+Tm3Df5oXqrmxZvQt4De0Y3jZs9T8IdF7PvgPrXjl87V
ZB34fV/0hWaGNJxy92AqhBUFlY951LZ+6EYvHYOnwAk+AndlKUZMQkayVO8Uzo8f
MxXZCArPxkUgV3NenzB//Ir+YN3cmA6AnIKJyNsmOc8F1aU/Q+l+0kU2uQomHaLg
N59AlO0VFbBJT2PruF8RqeQ22Lvc0Ukw8YHCl3/KIuaHYZCzqFb1CqCsS8JUnlbn
0FzJ1gjHW6Wn/p7YXsL++jKyyMRsn5P/oInVdvRxGe28mADAKWQXkTnjmWWcg9ap
iduJJUv5ZtAAlwyL14oxKeBTGzq42gmQwrRv+Vl+KGDPO1RCeMC9uhD52cwWGWgV
S53b1TuT2T2JYGdX5dRzhvEUrE+qj6Fvq+fn7bYrYFV0L81dJmD9VEP8w+x1v/7O
HJnZ5R7zJ4fwYqF7enCk6g70irL96pcGtrnd1Zxh/k8SaNe75YWStTwZktmLdAd7
1CNEj7AFUqj+efMgO7nHQhlO5AUf3QdZLZb/ySCyxiRsYw8ksl706Qy/pbD4b7ak
NtmCSLvEVKoZtqA7efDDKtQhhqyePFg5taOj1xvexkhhMmZJwMVTwB3nBQwh2JdR
CZSBE6LVpoY98W1DTJAz9yDKt2CzYlLsYTNISmz/0c8Tqhc8ME0=
=ucwZ
-----END PGP SIGNATURE-----

--=-dUbJ1Y+T9mJaCvHMKH/G--



--===============2252172649545153763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2252172649545153763==--
