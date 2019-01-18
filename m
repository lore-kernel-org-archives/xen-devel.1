From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH 2/2] xen: credit2: cached attribute for
 next runqueue entry
Date: Fri, 18 Jan 2019 16:45:47 +0100
Message-ID: <db96a6b66a1ef2f6a6297d7c4ac7e498fc2cbf2a.camel@suse.com>
References: <20181223142134.7857-1-kpraveen.lkml@gmail.com>
 <20181223142134.7857-3-kpraveen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8610783481978562885=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=c7wu=P2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gkWKq-0006Zw-PM
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 15:45:32 +0000
In-Reply-To: <20181223142134.7857-3-kpraveen.lkml@gmail.com>
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


--===============8610783481978562885==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-OvlE9VSIoVBO5GELSk++"


--=-OvlE9VSIoVBO5GELSk++
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2018-12-23 at 19:51 +0530, Praveen Kumar wrote:
> --- a/xen/common/sched_credit2.c
> +++ b/xen/common/sched_credit2.c
> @@ -473,6 +473,7 @@ struct csched2_runqueue_data {
>      spinlock_t lock;           /* Lock for this
> runqueue                     */
> =20
>      struct rb_root runq;       /* Runqueue is an
> rbtree                      */
> +    struct rb_node *next_elem; /* Cached entry to run
> next                   */
>
I don't like the name much. IIRC, in Linux, the field was called
'rb_leftmost'. So we can call it rb_rightmost.

Or maybe something like rq_rightmost, or rq_first (or runq_first).

And in the comment, I'd say something like, "vcpu with highest credits
in the runq"

> @@ -1301,6 +1302,7 @@ runq_insert(const struct scheduler *ops, struct
> csched2_vcpu *svc)
>  {
>      unsigned int cpu =3D svc->vcpu->processor;
>      struct rb_root *runq =3D &c2rqd(ops, cpu)->runq;
> +    struct csched2_runqueue_data *rqd =3D svc->rqd;
>      int pos =3D 0;
> =20
>      ASSERT(spin_is_locked(per_cpu(schedule_data,
> cpu).schedule_lock));
> @@ -1314,6 +1316,7 @@ runq_insert(const struct scheduler *ops, struct
> csched2_vcpu *svc)
>      ASSERT(!(svc->flags & CSFLAG_scheduled));
> =20
>      rb_runq_insert(runq, svc, &pos);
> +    rqd->next_elem =3D rb_last(runq);
> =20
Ah, ok, yes, using rb_last() here (and in runq_remove()) is indeed
better than doing it int runq_candidate().

Still not what I had in mind, though.

In fact, the whole point of this "let's cache the rightmost element"
would be to avoid having to call rb_last() pretty much at all.

How? Well, basically, inside the while() that you're adding here in
runq_insert(), you make a note about whether the new vcpu has been
inserted in the righmost spot of the tree. And if it was, you update
the cache.

Similarly, when removing a vcpu, you check whether you are removing the
rightmost element of the tree. And if you are, you update the cache.


For instance, see how they've been doing this in CFS (before the rb-
tree cached helpers were introduced), when inserting a task in the
runqueue:

https://elixir.bootlin.com/linux/v3.15/source/kernel/sched/fair.c#L490

and when removing it:

https://elixir.bootlin.com/linux/v3.15/source/kernel/sched/fair.c#L526

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-OvlE9VSIoVBO5GELSk++
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlxB9KsACgkQFkJ4iaW4
c+50vA//asJIRMob8CU/QvZkTZbwx6k5dlKZFQVJmXTFCbW65xRTLk66y4+Ihx3i
A2tOgsTkLyzpI/WAw2yEgnz+nqDeQAacvDLj8/DOLX93yoRYhLrYl1CuCyc8Er6z
xoJKq29chOonfHxzaM+b6lTCCN7XFmWVgMpIpW9tXM+v5CYMgcPLJXdFVBeZtLuh
jSEilFAtxYfBcQbx/3BJoXXoPHl4A4u33IGA4Kr30dNYavO4PiBNNF005OxVqSi5
g4PIk6GTfHUenPSqDY8Ux1uHqFXJMs/8jtVMDKuyFwenC+M6ZxEXnYcq1cSpPtrf
2z0ShjGISIqt72SK5AJUZAaEzbuxo8XjsWPb4lKHyv5RZexHBNCL9IyisXiUFS0B
adn6mrmRJGZP5J14NhvNm0UBXqF2XkhdrlBW6QmDTe/+gN4CmfE8Lo9DOWfZfEel
9+AFPEVIOEu8gmcIYtD27NSMtaX7BM2Z/Uikut9ro7u2VKFoU6EBmOYCXnv6DzWf
L2Tafi2tyqqxPM50SawU18vsYm3SLHd0ixcfELdmNy5lU2nKxiHDrLnNxxL8dAEv
eZLExpGEo4PwJGfAt9HUyv3jgWSWAuGH1UI2dmREnuH1Hq+mh4rlboa0+k1LaYJm
/bDffdJQM0pY6kHMmggbBD461hW1rHXrKWYactBdWD0moQUXD7o=
=cIho
-----END PGP SIGNATURE-----

--=-OvlE9VSIoVBO5GELSk++--



--===============8610783481978562885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8610783481978562885==--
