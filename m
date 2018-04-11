From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: crash in csched_load_balance after xl vcpu-pin
Date: Wed, 11 Apr 2018 13:00:55 +0200
Message-ID: <df3133033961e04956c4e56a4509dbf2930cfb7d.camel@suse.com>
References: <20180410085729.GA472@aepfle.de>
 <1FC4A4E4-BA31-4B3A-9D3A-7E31CAAC9AE5@citrix.com>
 <fb3c729d6f2f98e8663287fcd4746bd2c11994e1.camel@suse.com>
 <95482342-8b80-e295-badf-6b20ad09276f@citrix.com>
 <6924f2c528355dd77a4876c5dd51b3e4b0c948f7.camel@suse.com>
 <f4b652f2-4bc5-d3e7-31a1-18cfb0c6bd4d@citrix.com>
 <960702b6d9dfb67bfae72ae02ae502210695416b.camel@suse.com>
 <20180410203741.GF7177@aepfle.de>
 <67eef3b540612c6161131160da08323858ae979e.camel@suse.com>
 <9c857d1a-d592-8db5-827c-30fbc97477e0@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4956395313648519396=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9c857d1a-d592-8db5-827c-30fbc97477e0@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Olaf Hering <olaf@aepfle.de>
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============4956395313648519396==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-P8KKCBo0/7PV+avAz8+J"


--=-P8KKCBo0/7PV+avAz8+J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-04-11 at 11:37 +0100, George Dunlap wrote:
> On 04/10/2018 11:59 PM, Dario Faggioli wrote:
> >=20
> > So, basically, the race is between context_saved() and
> > vcpu_set_affinity(). Basically, vcpu_set_affinity() sets the
> > VPF_migrating pause flags on a vcpu in a runqueue, with the intent
> > of
> > letting either a vcpu_sleep_nosync() or a reschedule remove it from
> > there, but context_saved() manage to see the flag, before the
> > removal
> > can happen.
> >=20
> Yep, that looks correct.  I had considered some sort of race between
> set_affinity() and context_switch(), but just never noticed that it
> could omit to take the vcpu off the runqueue.
>=20
Yeah, it's very subtle. IN fact, when I considered that race, I was
assuming that, if we are in context_saved() with VPF_migrating set, the
vcpu can't be in any runqueue, as the scheduler would have seen it was
not runnable, and not queue it.

I was missing the fact that someone could raise the flag on a vcpu
which is already in the runqueue, between when the scheduler lock is
dropped, and this check in context_saved()!

> > TBH, I have actually never fully understood what that comment
> > really
> > meant, what the barrier was protecting, and how... e.g., isn't it
> > missing its paired one? In fact, there's another comment, clearly
> > related, right in vcpu_set_affinity(). But again I'm a bit at loss
> > at
> > properly figuring out what the big idea is.
>=20
> I think the idea is to make sure that the change to v->is_running
> happens before whatever happens to come next (i.e., that the compiler
> doesn't reorder the write as part of its normal optimization
> activities).  As it happens nothing that comes next looks like it
> really
> needs such ordering (particularly as you can't reorder things over a
> function call, AFAIUI), but it's good to have those in place in case
> anybody *does* add that sort of thing.
>=20
Sure, I wasn't planning to remove them. I was curious, and in
particular, I was curious of whether they were actually meant at trying
to prevent this (or a similar) race... I'll do a bit of archeology, if
I find some time.

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-P8KKCBo0/7PV+avAz8+J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlrN6ucACgkQFkJ4iaW4
c+7Jqw//XLrgTtmMVFbG/MH/ScT6Zid0J1A2kua9UM1Sj8VWoo9yyA0oGieveb6R
qpfIwDN9AqMAJLI5hVtUixbN+UPnuBCgLc6duO3vyta7g6CmyQCJYYzr0CjwM6xb
YC10QvW6m7gHksSvPoKs8Wy8CAe2iwnKcHCE3IV54iTLYXTMc3lcnXj2OUYS5FKG
2sxpITPHEQgiRg3r3W3p2UkeOtqzxE0gOD6aKjIRD0sXTYZmCJmrO7oiO7AZNvnH
qQsw/T6bFtahkXJ8Up8FM6+9QR1Xx3b1QQHnMjR7ebOBO50OjGIRKObsnUAO7aot
marOnew+x6vli/Auxa6CM7i02xB4y9I/5XeD1pEonVIIsmCckCZyWCxCoW97OWTu
5zu1+J42uTBjK4zoF+RWGmsepSra+oF3G/wWCLgLGtFDXCnZkyNlov4Afdfpo+F7
/R8qoaNlCoQcJOSgnaac3L4AM4tYqRvDjM2fK6G5S2853JWNBIYlhgFCMMgAXhKe
mePuly+qGICcfJ49nCDaxLTqE5PrbkOnNzMoFHDz14dizP4saaaWN9D299CTJKUJ
U4PCJ+rfL4pDndrfZf495zhuagByY+zjQm3BGWXJvuA/QVFEGOAWdPemvSg5damc
XQyJDNzf5yhRACfeeGW0p89wabgufvqi81PBYrpvjtGFpO9FxD8=
=id4U
-----END PGP SIGNATURE-----

--=-P8KKCBo0/7PV+avAz8+J--



--===============4956395313648519396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4956395313648519396==--
