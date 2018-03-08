From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] common/sched: Fix ARM build following c/s
	340edc3902
Date: Thu, 08 Mar 2018 10:37:39 +0100
Message-ID: <1520501859.7628.0.camel@suse.com>
References: <1520451675-22608-1-git-send-email-andrew.cooper3@citrix.com>
 <alpine.DEB.2.10.1803071159580.7316@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9186913595045623726=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1803071159580.7316@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org


--===============9186913595045623726==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-EQ0ma3/L0Ct8pxfuNyTJ"


--=-EQ0ma3/L0Ct8pxfuNyTJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-03-07 at 12:04 -0800, Stefano Stabellini wrote:
> On Wed, 7 Mar 2018, Andrew Cooper wrote:
> > The OSSTest smoke tests reports:
> >=20
> >   sched_credit2.c: In function 'csched2_alloc_domdata':
> >   sched_credit2.c:3015:9: error: implicit declaration of function
> 'ERR_PTR' [-Werror=3Dimplicit-function-declaration]
> >            return ERR_PTR(-ENOMEM);
> >            ^
> >   sched_credit2.c:3015:9: error: nested extern declaration of
> 'ERR_PTR' [-Werror=3Dnested-externs]
> >=20
> > As the ERR infrastructure is part of the main scheduler interface
> now, include it from xen/sched-if.h
> >=20
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-EQ0ma3/L0Ct8pxfuNyTJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqhBGMACgkQFkJ4iaW4
c+6R3w/+PbMBPXIKsy25lZVtqKrTfgqRLkbm3QFWFQxq0xBHL21GmwqfCyg2ETiJ
OocJkpEpMMeLtsw2HUJNWZYI9NAKgR5Uj4e9zzZyFhpxBAyVcZym2QONdSlg646Y
1ZEOt0wO3E0NQTrnLRRiiJs8fpglWBUTiA52wtC1i8Jfh3JwBa+9XxZ5C5KETVjJ
raQA7mFYLjlib77z24ETBqLZcYBI3JEarGbz7cNEGG9Knt1NPRZW68mcGLvDvxQD
FelqdAAa7/h0z6MctftgjUOHjtLGTyZEr9m0Oc0ZikWKRW3CmyqEfNc2ui9Iydyq
pEY7dWyPhnsd2QxxNf40JkrEcFecuJ9zRvL7zq43oaHwTNkMV0q0fGetymzZF4LJ
r6oFof5NC2MTBUYFNU1I6MgsU0Z4fX7T7LMyn6w9YPr5I2hQD+InE2z4SNBulp0s
OeDUXjWJ7+h2Kchkw0+ISyEtiba2OE4jcyw20R6QU5Y/yY+zCeSLJfv3YhekgvE2
N8IfTd2MeoJalLVLuHuy9gGKRz6m50IC3JS3HvuckKqAUDnkIXwCBMRsR41WpSUd
1mz1HlE8YCJrcaR70GNi+vBL2OE6m4YOiGaIL7dzQsCBkq9cGpa5p2q6ZNQjJTkM
nyHLvxZrkrdug1mEJLNz39V9nh/IxzpQ92gBLv20GKDhtPCa2FM=
=yaXC
-----END PGP SIGNATURE-----

--=-EQ0ma3/L0Ct8pxfuNyTJ--



--===============9186913595045623726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9186913595045623726==--
