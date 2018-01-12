From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Xen_Project_Release_Features page update?
Date: Fri, 12 Jan 2018 21:35:02 +0100
Message-ID: <20180112203502.GC2935@mail-itl>
References: <821b7ccf-95e0-2583-ecaa-2f1a16b8c16e@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2514970157789065402=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=u59i=eh=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ea63l-0001Ci-Ew
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2018 20:36:17 +0000
In-Reply-To: <821b7ccf-95e0-2583-ecaa-2f1a16b8c16e@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: Lars Kurth <lars.kurth@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============2514970157789065402==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oj4kGyHlBMXGt3Le"
Content-Disposition: inline


--oj4kGyHlBMXGt3Le
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2018 at 06:20:05PM +0000, Julien Grall wrote:
> Hi Lars,
>=20
> As I understand from Xen 4.10 [1] , we are going to use SUPPORT.MD or the
> list of features existing.
>=20
> I guess we should retire the features matrix [2]? But this also means that
> we have not anymore an easy way to know until when a release is
> supported/security supported. Do you have any plan for this?

Is there any human-friendly form of SUPPORT.MD?
Xen_Project_Release_Features is really convenient place to check about
support for various features. Especially when trying to answer "what Xen
version I need for feature X", or "is my Xen new enough for X"
questions.
Maybe Xen_Project_Release_Features could be automatically generated from
SUPPORT.MD? Even subset of informations from SUPPORT.MD would be
useful...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--oj4kGyHlBMXGt3Le
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlpZG/YACgkQ24/THMrX
1yyAGAgAhqTE9z1kVhhvJb/zO3qcXdTMvUXYX2h9ia+z4UbdOemATeKgocUceQYP
rFsY+K+a1veRbcaCCjRoiH/zM7Mffe4Sdor5VppzT9pukn7PDJUXBhq++LxDVgh0
9faOeUipKJBQ2+VkN27dcm6EKU3GRrWr0Ui6XkiKOM8ZPRPgV1eNcA8DGg4C7pfM
S5QR0Tw0uzvVunkOFapNvk3g19lvIURrRRCodN9XVKvP4xdVGsBDD/6fsI7IRGMC
8a4LILuccexWub5hdido1T5afegI9Fn6oOolajUx+8RedILjX6TIXoUDFozy/w+n
qbrv8QDbKxxMhCSbEK20GngQTCrVCg==
=1xyf
-----END PGP SIGNATURE-----

--oj4kGyHlBMXGt3Le--


--===============2514970157789065402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2514970157789065402==--
