From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH v2 1/2] xen: credit2: rb-tree for
 runqueues
Date: Fri, 18 Jan 2019 16:09:15 +0100
Message-ID: <1a25c901ffbf70d3f798395efc3e44a3e0a33075.camel@suse.com>
References: <20181223142134.7857-1-kpraveen.lkml@gmail.com>
 <20181223142134.7857-2-kpraveen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2167111825856278425=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=c7wu=P2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gkW6q-0005YO-Ex
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 15:31:04 +0000
In-Reply-To: <20181223142134.7857-2-kpraveen.lkml@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Praveen Kumar <kpraveen.lkml@gmail.com>, xen-devel@lists.xenproject.org
Cc: george.dunlap@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org


--===============2167111825856278425==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-iTiyk0ntt3V50Zlk5+Uu"


--=-iTiyk0ntt3V50Zlk5+Uu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2018-12-23 at 19:51 +0530, Praveen Kumar wrote:
> diff --git a/xen/common/sched_credit2.c b/xen/common/sched_credit2.c
> index 623a325ceb..2463a25f87 100644
> --- a/xen/common/sched_credit2.c
> +++ b/xen/common/sched_credit2.c
> @@ -471,7 +472,7 @@ custom_param("credit2_runqueue",
> parse_credit2_runqueue);
>  struct csched2_runqueue_data {
>      spinlock_t lock;           /* Lock for this
> runqueue                     */
> =20
> -    struct list_head runq;     /* Ordered list of runnable
> vms               */
> +    struct rb_root runq;       /* Runqueue is an
> rbtree                      */
>
I wouldn't change the comment. It's useful to know that the idea is to
use this field to keep a list of runnable vcpus, and that we want it to
be ordered, which is what the comment currently says.

It's pointless to state that we're using an rb-tree, because once can
tell that, by just looking at the data type.

Actually, the comment says "Ordered list of runnable vms", while I
think it would be better if it said "Ordered list of runnable vcpus".

Changing "vms" to "vcpus" does not belong in this patch, strictly
speaking, but if you want to do that, I could live with that. If you
don't want to do it, then don't, and just leave the comment alone.

> @@ -604,6 +605,28 @@ static inline bool has_cap(const struct
> csched2_vcpu *svc)
>      return svc->budget !=3D STIME_MAX;
>  }
> =20
> +static void rb_runq_insert(struct rb_root *root,
> +                           struct csched2_vcpu *svc,
> +                           int *pos)
> +{
> +    struct csched2_vcpu *entry =3D NULL;
>
I'd call this (something like) 'parent_svc'.

It makes it easier to understand what's actually happening in the loop
below.

> +    struct rb_node **node =3D &root->rb_node;
> +    struct rb_node *parent =3D NULL;
> +
> +    while (*node) {
> +        parent =3D *node;
> +        entry =3D rb_entry(parent, struct csched2_vcpu, runq_elem);
> +        if ( svc->credit < entry->credit )
> +            node =3D &parent->rb_left;
> +        else
> +            node =3D &parent->rb_right;
> +
> +        (*pos)++;
> +    }

> @@ -1789,6 +1803,7 @@ static void park_vcpu(struct csched2_vcpu *svc)
>       * In both cases, we also add it to the list of parked vCPUs of
> the domain.
>       */
>      __set_bit(_VPF_parked, &v->pause_flags);
> +
>      if ( vcpu_on_runq(svc) )
>      {
>          runq_remove(svc);
>
Unrelated change. Don't do it. :-)

> @@ -2087,6 +2102,8 @@ csched2_vcpu_sleep(const struct scheduler *ops,
> struct vcpu *vc)
>      }
>      else if ( vcpu_on_runq(svc) )
>      {
> +        printk(XENLOG_WARNING "%s : %d : vcpu on runq rb !\n",
> __func__, __LINE__);
> +
>
So, this, and all the various other lines similar to this are/have been
useful for debugging, I guess?

That is ok, but I don't think they should land upstream. If you think
they (or maybe some of them) should, then make it/them proper debugging
output.

And, probably, do that in its own patch, as it would not be related to
what the data structure used for the runqueues is.

But again, IMO, you can get rid of all of them.

>          ASSERT(svc->rqd =3D=3D c2rqd(ops, vc->processor));
>          update_load(ops, svc->rqd, svc, -1, NOW());
>          runq_remove(svc);

> @@ -2764,8 +2783,10 @@ csched2_vcpu_migrate(
>      if ( unlikely(!cpumask_test_cpu(new_cpu,
> cpupool_domain_cpumask(d))) )
>      {
>          ASSERT(system_state =3D=3D SYS_STATE_suspend);
> +
>          if ( vcpu_on_runq(svc) )
>          {
>
Stray new-line again.

> @@ -3206,17 +3227,18 @@ csched2_runtime(const struct scheduler *ops,
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
> +        struct rb_node *node =3D rb_last(runq);
> =20
Comment style. And I think I'd say "Check the rightmost element in the
tree, which is the one with the highest credits"

> +        struct csched2_vcpu *swait =3D runq_elem(node);
>
I think we can do:

  struct csched2_vcpu *swait =3D runq_elem(rb_last(runq));

Yeah, matter of taste, mostly. Still...

Anyway, if you keep the code like this, no blanks in-between
definitions. And you instead want one between the last definition and
the if below.

>          if ( ! is_idle_vcpu(swait->vcpu)
>               && swait->credit > 0 )
>          {
>              rt_credit =3D snext->credit - swait->credit;
>          }
>      }
> -
>      /*
>       * The next guy on the runqueue may actually have a higher
> credit,
>
Spurious change.

>       * if we've tried to avoid migrating him from a different cpu.

> @@ -3350,9 +3372,8 @@ runq_candidate(struct csched2_runqueue_data
> *rqd,
>          snext =3D csched2_vcpu(idle_vcpu[cpu]);
> =20
>   check_runq:
> -    list_for_each_safe( iter, temp, &rqd->runq )
> -    {
> -        struct csched2_vcpu * svc =3D list_entry(iter, struct
> csched2_vcpu, runq_elem);
> +    for (iter =3D rb_last(&rqd->runq); iter !=3D NULL; iter =3D
> rb_prev(iter)) {
> +        struct csched2_vcpu * svc =3D rb_entry(iter, struct
> csched2_vcpu, runq_elem);
>=20
I was about to comment about the fact that doing a for() is not the
same as doing the list_for_each_safe() (because of the *_safe() part).

However, looking better, I don't think I see why list_for_each_safe()
(I mean, as opposed to just list_for_each()) was used in the first
place.

So, yes, I think this is actually ok. Anyone, if there's something I'm
missing, please, point it out. :-D

> @@ -3762,8 +3784,8 @@ csched2_dump(const struct scheduler *ops)
>              dump_pcpu(ops, j);
> =20
>          printk("RUNQ:\n");
> -        list_for_each( iter, runq )
> -        {
> +
> +        for (iter =3D rb_last(runq); iter !=3D NULL; iter =3D
> rb_prev(iter)) {
>              struct csched2_vcpu *svc =3D runq_elem(iter);
> =20
>              if ( svc )
>
Ok, this makes sense. Have you verified that the runqueue is printed in
credits order in the dump?

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-iTiyk0ntt3V50Zlk5+Uu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlxB7CkACgkQFkJ4iaW4
c+6tlw/+O6+Qb/KlDS+NrL9aK7ZtBv0wUA0809PEHcOWGXP6KRQh4766N7fO9LdG
dsH7A8MiAHlPL0UFIwymqVi/5/bTFlezTyulWoDKebVsz28ChByoQHppwYjuBiJf
HS/CJidnr0mw8TVIROTvrMGDXMzZ5DdEXXxf0I2ujXNW5LZ5lWJtvUrQ9A45HczG
ltNsVbkS2YaI5/pyxvRnhy2S4Hx2GzJBkk38qa68gxCOyzXj7xPbjcAnXw4Xukf/
1ndQwyF1WgijLWh7x3Bwz0JqkD0n0Fx3mn5MV+YuRf/NJzzibajF7IO4cVAiSkiv
4b74hAa5y+3NcJlPdP7G7lfQYwLwU8jGXP9FtCipy6Xz3P6Zz3eyEyYQlIL8vGyy
ehs8JQ5xTcyoaXKqXvcDAQ+82GtNqtlkkulXFpm3SErgRfPnAvbeCrm3Anm9VFO+
GxDN9w7jrpJ5XW7FliFt4yFgkQ9UTM9ZGZeTJb8sLYvACiIbebWptGZ3EVubOzFt
srpXJQmrQA1Hmv/bncmiUDR4/VM3M8blRNssocnKdKHA5G7ykQ1TCPfK0IaXouQc
Z1qLQqgl5+hUA6U6Ft+EGZIZEZNW+Veaxq4HoR/F+XnPguIvzgGkF06xrUKmBsBM
+XHCZPTN6fEcR35+dxzSexGDXd89QdnSG+IQov1UlWh1/Qt/6pI=
=ksTA
-----END PGP SIGNATURE-----

--=-iTiyk0ntt3V50Zlk5+Uu--



--===============2167111825856278425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2167111825856278425==--
