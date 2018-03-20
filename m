From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xsm:schedop: introduce vcpuinfo permissions
 verification
Date: Tue, 20 Mar 2018 13:36:55 +0100
Message-ID: <1521549415.5400.113.camel@suse.com>
References: <1518691909-458-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7702665841989927942=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1518691909-458-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
Cc: Meng Xu <xumengpanda@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org


--===============7702665841989927942==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-bcM82h2VNYgKFGtzm/lE"


--=-bcM82h2VNYgKFGtzm/lE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-02-15 at 12:51 +0200, Andrii Anisov wrote:
> From: Andrii Anisov <andrii_anisov@epam.com>
>=20
> Introduce per-vcpu scheduler operations permission verification.
> As long as Xvcpuinfo are in fact scheduler configuration
> manipulations
> there is no need to introduce specific access vectors.
>=20
> Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-bcM82h2VNYgKFGtzm/lE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqxAGcACgkQFkJ4iaW4
c+5L7A//YsYniumG4Pggjg3HzmHPm26bJkUafu+KNX7/psXVQNzAoxxrIkA7DtPN
TVx6vyEMPALknVObBtFsxLgVd5d40hE/+I43aI8omTpqnYGZ92jS3t6tq4seoFSc
GQ6Kp5wxwTS7h86p0UBZwKCxReY7/Bd+zA9CbZ/KnB9Won99pxSyz9bAUjAEWsuA
2wN19IAJwANTr3Dx/EFI6NwOGuYPwgQymjFS/iGmyaC/pY3uxE1lNeETlK+GrSsv
gcgsaTlNjrGV7ndo1GtA9m4huMVA8xoFldoS8kZwc12ph+yjR3m8Orghfk6v5Iup
9lplt9JR+fIhvl1ZYdikTa6oiQ/bzUi4Mt3QG3pmAfLTfUFAUOjaqky2MaQaqky9
mvfT4+NaBqg1c8S0XYEftnK1lknRhOvX5fTjdNvQtLpssmhBGWW3mnlp9FA2kof4
FCs3sqnw3oShgMKaD5geNq5bVHRU3kxTlvTo5Q9i0hTqR5tbqH2Wk/vgarAKVJ1g
0f8FlnGtgcEotYJ+YICXa0IoAgdaFG/lCuY4nlJDc7tpKVI9dS+p1x151mezTNdF
BCV7ltM+NmNV1gLe04dB4lvqDNsFOIMT5GquU5VBRIeiJ+tjUYufTAJUB96i539U
b1POGtYLhoV1K9JXk1Qr/zCL2zthp9fDFk0v7AHa/Se6iIi8vsQ=
=13Tu
-----END PGP SIGNATURE-----

--=-bcM82h2VNYgKFGtzm/lE--



--===============7702665841989927942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7702665841989927942==--
