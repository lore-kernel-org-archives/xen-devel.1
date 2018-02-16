From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] intel_iommu: allow updating FEADDR and
 FEUADDR with one 64bit write
Date: Fri, 16 Feb 2018 22:23:01 +0100
Message-ID: <20180216212301.GL4302__30920.0902157047$1518816162$gmane$org@mail-itl>
References: <20180124141848.3969-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0974554275779317661=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=sszu=fk=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1emnTW-0007Wd-Ly
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 21:23:22 +0000
In-Reply-To: <20180124141848.3969-1-marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============0974554275779317661==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tBhgiDt8dP1efIIJ"
Content-Disposition: inline


--tBhgiDt8dP1efIIJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2018 at 03:18:48PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> Allow updating those two adjacent 32bit fields with one 64bit write.
> This fixes qemu crash when booting Xen inside.
>=20
> See discussion on Xen side of the thing here:
> http://xen.markmail.org/message/6mrmemrnmhxvaxba

Bump.

> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> ---
>  hw/i386/intel_iommu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 2e841cde27..d214dce277 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -2129,8 +2129,12 @@ static void vtd_mem_write(void *opaque, hwaddr add=
r,
> =20
>      /* Fault Event Address Register, 32-bit */
>      case DMAR_FEADDR_REG:
> -        assert(size =3D=3D 4);
> -        vtd_set_long(s, addr, val);
> +        assert(size =3D=3D 4 || size =3D=3D 8);
> +        if (size =3D=3D 4) {
> +            vtd_set_long(s, addr, val);
> +        } else {
> +            vtd_set_quad(s, addr, val);
> +        }
>          break;
> =20
>      /* Fault Event Upper Address Register, 32-bit */

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--tBhgiDt8dP1efIIJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlqHS60ACgkQ24/THMrX
1ywT5wf9FG0sbvRyUsOVYMYyzCMiU8yxaHXoDWhb25+Tyl8u0KZ36v3EB1zcxU0d
mv46ApyqDd2QjdyA1jul1N9aatssZhPDfsxCkc6ipPgO1dVuSyDgeCme8BX9sr8Z
dOz+VwuKJ/YdB2TJ3Q5jE4pn717iTmvfgccXerOsau98j1aizs8EWfgf3xzezWK0
73iWKxrOWsmPxKhJns3s88nbEOHdffz1JxHr64SMUK+KbtW8jxzf5CeL5KlqDuWQ
prBU47LmK92gaQeZsw28qnFuv8mTEpnKAxsU3T/JMzn9JF8un6BVRaI7GDYj9xAD
jNS3dTFTUYUkXH0haO92zQ6KkdOkTQ==
=LJpZ
-----END PGP SIGNATURE-----

--tBhgiDt8dP1efIIJ--


--===============0974554275779317661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0974554275779317661==--
