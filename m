From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 2/3] xen: Fix credit1 Kconfig entry
Date: Mon, 05 Feb 2018 15:43:51 +0100
Message-ID: <1517841831.8082.2.camel@suse.com>
References: <20180205113642.3174-1-george.dunlap@citrix.com>
 <20180205113642.3174-2-george.dunlap@citrix.com>
 <5A786B9802000078001A53C7@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0479827831674011918=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jhda=e7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1eii0U-0007Px-TB
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 14:44:30 +0000
In-Reply-To: <5A786B9802000078001A53C7@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============0479827831674011918==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-iPjLG8nmGZFvnX1rNsfz"


--=-iPjLG8nmGZFvnX1rNsfz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-02-05 at 06:35 -0700, Jan Beulich wrote:
> > > > On 05.02.18 at 12:36, <george.dunlap@citrix.com> wrote:
> >=20
> > ...so that it shows up in the menu and can be disabled.
> >=20
> > Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-iPjLG8nmGZFvnX1rNsfz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlp4bacACgkQFkJ4iaW4
c+6n2RAAnYykfI8ow7XXOQnFtdND55T6WIonUsySR6wDdNZJo3Zdyq02cJbLtkbC
0Ku/fl6T2/DlfAepgWiMYHW+o0FuutgRfP6IXC4PcBaTBDNIipicZzBmcTiZPaVJ
8cjuIvU9IF4dzcNilaYK4w9jdsoTWqSmf6ff8JdP5u3O1pvdjeaEyiRmQkXHVBF9
EJRU80Vn/sKDl3NaUBJrURRbiehloCbDTZWKbuxS9+Mlge2FkCCIq9t9Dg3JK9xF
YXIAUHXh96DlZp5m8qba000I8IK3uUyJy2YORdUhhg8pD/Eod7cKytYCvkENj1H0
YK+MPDTDPHrpQ8i4KopNLhZYZr/JECKwqP+MNqUens7ZGzfQN/RvwdhYCnUSLQcL
49EDRJkjIgLftiIENH9mAu+k+xdv6JyoNxX2pJ+lTkZFD71HS8oZ8clPDFRMlPLR
AMZ6Um0WpTx+GGie5QAp36e/SpQq4u4oVwj3Yy5+YUlc7K4jySi8iwPRzx29X9P7
iLThzwfqv75Q/Wg+jhPdzhcw/eSI1+8+FyjaF6DX1y6SgsvAh6YuO3bfUIwptikX
r905pc3X0winV4z1DcCM+KTSqutSD8JGK1uad9ygdW1Qu3jMKLg11qrbxDsbbzhS
aPnzbmA3CrKwf4o8MihwC21sZibKiqi7ZnatRl0zzxV1ELboO68=
=7V60
-----END PGP SIGNATURE-----

--=-iPjLG8nmGZFvnX1rNsfz--



--===============0479827831674011918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0479827831674011918==--
