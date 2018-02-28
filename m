From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2 4/5] tools: xenpm: continue to support
 {set, get}-vcpu-migration-delay
Date: Wed, 28 Feb 2018 16:17:42 +0100
Message-ID: <1519831062.9145.10.camel@suse.com>
References: <151940399656.10991.13321858263862527366.stgit@Palanthas.fritz.box>
 <151940411577.10991.534361130254778056.stgit@Palanthas.fritz.box>
 <1bcdf046-581e-d055-c954-80ddcb45451f@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8376593615012325701=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fmfk=fw=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1er3Uc-0008JV-UK
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 15:18:06 +0000
In-Reply-To: <1bcdf046-581e-d055-c954-80ddcb45451f@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8376593615012325701==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-T8qaXPE1YebGgOYOdYTY"


--=-T8qaXPE1YebGgOYOdYTY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-02-28 at 15:02 +0000, George Dunlap wrote:
> On 02/23/2018 04:41 PM, Dario Faggioli wrote:
> > From this commit on, `xenpm {set,get}-vcpu-migration-delay'
> >=20
> > commands work again. But that is only for the sake of
> > backward compatibility, and their use is deprecated, in
> > favour of 'xl sched-credit -s [-c <poolid>] -m <delay>'.
> >=20
> > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> > Acked-by: Wei Liu <wei.liu2@citrix.com>
>=20
> If we cared about strict behavioral compatibility, we would modify
> the
> xenpm function to set the migration delay for all cpupools; but I
> think
> we can worry about that if anyone complains. :-)
>=20
Yes, I thought about that. But, considering what would be required to
implement such behavior, as compared to how many people (as far as we
can tell, of course) use this feature, and use xenpm to change it, I
also thought we are indeed fine "waiting and seeing".

> > @@ -1087,13 +1097,17 @@ void set_vcpu_migration_delay_func(int
> > argc, char *argv[])
> > =20
> >  void get_vcpu_migration_delay_func(int argc, char *argv[])
> >  {
> > -    uint32_t value;
> > +    struct xen_sysctl_credit_schedule sparam;
> > +
> > +    printf("WARNING: using xenpm for this purpose is deprecated."
> > +           " Check out `xl sched-credit -s'\n");
>=20
> Should these warnings be to stderr rather than stdout, so that if
> anything is manually parsing stout it will continue to work?
>=20
Again, I considered this, for that same reason. The reason why I
decided for stdout is for maximizing the chances that anyone actually
using this will see the warning (even if, e.g., they're redirecting
stderr).

But I am fine with both, actually, just let me know what's considered
best.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-T8qaXPE1YebGgOYOdYTY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqWyBYACgkQFkJ4iaW4
c+4JdhAArYVRS1aRsfiDSxN5IPNIU7gjAxQq4ONCbm9WE2Mu0cps6bR2t9uTHNI0
nss3eTD5DCuF4JAbwYhSG4kZCvq7ni+l2gsGbP2J//bfRdkh07J4UNY2pWxwUNOC
mXmAA1uD8tt92fxpRAX462P5j7W/ekb5FIsJ26tKTY2JsWIjDGuRTtrg7F2wxuj8
cGSXtIg3twbn4QZfWFDwV9sPrLjxoHkE72RljAA5+ubIB3Uk5UTo5Svdttv5UNfE
fBlb6TIteOBBQPEDM3P77uwL6O4K6j8XFQgFQ6oclMsl3RyKkfUwlXSKofa4j3EG
7OEHf5Vbb9Jh0lF/nq1bx0Gpmpdn37wIA/oV4SlJjl+XfYay9/McVVJy9ItjYUoQ
j/7iU3R+edly4Jpf3Dz3MKa8VC6TFE0OAd7mza0YJAUrRAFvzFESmvN+R8w7tZkl
LPZ+SGr5ue6soj67Vz83IfVOBUvtUlL/QWbKDCVZSaPp00aouSz9hUavyPUvf18l
XtJ4mc/kx5k8qMzjNOyyo1cnpuBAsBXxFSrYdtlA9XPFp/U8Ikl1jnNjaJ5+7yP6
R0Xt+ayEqS26gYsidoFdsdKo9eGodWjp3dS7/m5bUisOsrW0BSVR9bX2jNpEolOM
RLcWGWDQd9QXmRw1rUIkWu/svQce+SFizUy5L34nlFXFyCls3l0=
=4Ini
-----END PGP SIGNATURE-----

--=-T8qaXPE1YebGgOYOdYTY--



--===============8376593615012325701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8376593615012325701==--
