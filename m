From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xsm:schedop: introduce vcpuinfo permissions
 verification
Date: Tue, 20 Mar 2018 13:37:51 +0100
Message-ID: <1521549471.5400.114.camel@suse.com>
References: <1518691909-458-1-git-send-email-andrii.anisov@gmail.com>
 <f1317f4b-c5ca-d4e6-bf75-d436d81e981a@epam.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4458979860182921582=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f1317f4b-c5ca-d4e6-bf75-d436d81e981a@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii_anisov@epam.com>, xen-devel@lists.xen.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, Meng Xu <xumengpanda@gmail.com>
List-Id: xen-devel@lists.xenproject.org


--===============4458979860182921582==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-mRrZfKt4fN+LYKz7Qo6J"


--=-mRrZfKt4fN+LYKz7Qo6J
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-03-20 at 14:19 +0200, Andrii Anisov wrote:
> Dear All,
>=20
> Any comments for the patch?
>=20
> It addressed the issue mentioned here:=20
> https://lists.xenproject.org/archives/html/xen-devel/2017-07/msg00452
> .html
>=20
Oops, sorry, I had missed it.

Now I've replied. I think it still needs a xsm / flask Ack.

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-mRrZfKt4fN+LYKz7Qo6J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqxAJ8ACgkQFkJ4iaW4
c+6LhhAA1LcgSfRyDfNGSUOOz11j/rg8MWLtkQq8wu2gQoi21kTxRPLMEp2D79qL
EsbaYvGnyRGlTlG41AQmzQ5tFAZ9rkNq6YblQsR4tTvyY5BTjhbkUmRSBbOIT+DR
6maQ0SKvrEPGN2JFilmojOy/Om8BjYGW0D8dpiunLRea4uAmuuU+SXMfPVBxPC+D
lZUGRF3VTcY+GEuSsliI5iPnnMy8jXwv91eG9LFGfLTiKgBtHAJ+C2PVR7bdSXIG
sUknbFxyXSsveeTPKgJjDbCrEnRdrR2zspl81+6ChW6d13p7DLZkPaUl2sC5Yda0
P7Z0KZmwtD+gUXZnXcbiUPawC4rmYbFcxl4E05lfBKRJPjpelNM+GlHauhquSQZS
xbXkuyZEiMxpgAXSzmu75x4/OwvOlAPUH+h+4o2+hWkT4W/rzhtEaQkKbE0FzUr/
RS4PwoLNGP2cWiiKzB7lS9YWz8Ojbgx7lrIiYRyBdCrZ1XLqQL3x03Nmn3n1M/g1
FsKs8Hl/jisQ5XhGXPwRRUCY8bf1dqDQPQb0LrmJkBCN73K8URnLfBbPV/6RmCGV
TON64NSFZNgM3YT/GlVyu+oyBiFWMtwX2A75mdbaldb4ZPZUdYfqZfm0m4L8BOry
foH47MDIvN/AoebJnoKIVHmah5DsXXBNYSMYUVcVIEieQnpUFwE=
=V3pd
-----END PGP SIGNATURE-----

--=-mRrZfKt4fN+LYKz7Qo6J--



--===============4458979860182921582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4458979860182921582==--
