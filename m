From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: seabios regression in staging
Date: Thu, 29 Mar 2018 12:56:08 -0500
Message-ID: <059c1674-9b79-d5c5-012d-94de3439c546@cardoe.com>
References: <20180329114243.GN30726@aepfle.de>
 <20180329142901.wuso5qz647kkmqhp@citrix.com>
 <20180329145341.GO30726@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8285402804739311006=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180329145341.GO30726@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8285402804739311006==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="IrZBlPmE1oKdruEJYfD0rnQbDuwxQSFYs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IrZBlPmE1oKdruEJYfD0rnQbDuwxQSFYs
Content-Type: multipart/mixed; boundary="NZ81hAV14hQw64NkYioGoMNAviN0okxSU";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xen.org
Message-ID: <059c1674-9b79-d5c5-012d-94de3439c546@cardoe.com>
Subject: Re: [Xen-devel] seabios regression in staging
References: <20180329114243.GN30726@aepfle.de>
 <20180329142901.wuso5qz647kkmqhp@citrix.com>
 <20180329145341.GO30726@aepfle.de>
In-Reply-To: <20180329145341.GO30726@aepfle.de>

--NZ81hAV14hQw64NkYioGoMNAviN0okxSU
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/29/18 9:53 AM, Olaf Hering wrote:
> On Thu, Mar 29, Wei Liu wrote:
>=20
>> Do you use a non-default seabios configuration? Osstest seems to be
>> happy with the update.
>=20
> Not sure how I would create a non-default seabios or toolchain build.
>=20
> osstest does not use SLE11, so it can not possibly spot such compile
> errors. It would certainly be cool if there would be a test with very
> old and very new toolchain.
>=20
> Olaf

If you'd be willing to create a SLE11 Docker container, we can add that
to the tree and start doing builds against it.

--=20
Doug Goldstein


--NZ81hAV14hQw64NkYioGoMNAviN0okxSU--

--IrZBlPmE1oKdruEJYfD0rnQbDuwxQSFYs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlq9KLlfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl3PPA/+JKzzerPFGrRte/THstwFV7jq1ZILfHvl6dGLCdjNJ+5/zv64AMRSVx6w
E+yydi5jAyUT+paB5sjeuk4X3w1QYxuRRehEYNJz/uoC0yAwAea3PBKdzyxHa6Uq
Gxf4sljGk23i82G1diuTOgFkwDl1BTjNxjHinsGvz9YzxjUrA+OiK5drNmNC/ldr
+CNBLoXi9HHbmT5t13NZWT8tw3XsHXNbiT8VZ6SC+Gt/c6hRRpVZthAMBjB0YsYL
KmuUCEJ6Gk1d0oS13WL2wmUPCiQgDR3Ik+LCQbiem1nhaktF0GO1Hp95qAK+DKHi
DqkCSs6AMbFzVTJLgX8Y8wdE6oPm7eWTmbOaP46Bp7L+bHHgRnU/NLFmWdmoGTUq
O/rUy1pqOK+AGmmTt8xBv4+mHUDhYdA7ZPr9zYDTjUaUlaz0hfr1Vb/cUMVhDvsD
SezQCqfE+qYUX9jIxGxZiwM0cQGyCSAh6Eoqo3v4cEwnIZj7vULxA0CO+eVCfsLl
GmTvi05UXzA1nOmgnYwVL1VFU5abAJ2PixO1PFoFXN34DLUJs6hwcrUzFQWn8lyr
a+FLMJUYJOApsW+cZOycfvzWhQMRFKN9eNevsnDwQk0dQOU/mvb6D3OIicaUX2rS
At2Oy9Mp+1GV2nUuQhPYWbMrnMbqhDq7XhPJE5PW46ek75KZlWo=
=kBYg
-----END PGP SIGNATURE-----

--IrZBlPmE1oKdruEJYfD0rnQbDuwxQSFYs--


--===============8285402804739311006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8285402804739311006==--
