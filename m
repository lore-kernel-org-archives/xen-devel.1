From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] tools/gdbsx: fix 'g' packet response for
 64bit guests
Date: Tue, 31 Jul 2018 18:04:56 +0200
Message-ID: <20180731160456.GQ1371@mail-itl>
References: <20180731023042.19031-1-marmarek@invisiblethingslab.com>
 <5B60176302000078001D941A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0368593853699474857=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=01/i=kp=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fkX8w-0002tT-O2
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 16:05:03 +0000
In-Reply-To: <5B60176302000078001D941A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============0368593853699474857==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8w4vJErrroHezzIq"
Content-Disposition: inline


--8w4vJErrroHezzIq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2018 at 02:01:39AM -0600, Jan Beulich wrote:
> >>> On 31.07.18 at 04:30, <marmarek@invisiblethingslab.com> wrote:
>=20
> Marek,
>=20
> looks like all of the patches you've sent early this morning local time
> here came through twice on xen-devel: Would you please avoid
> having xen-devel on both the To and the Cc lists (just with different
> domains)?

Sorry about that, now fixed my setup.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--8w4vJErrroHezzIq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAltgiKcACgkQ24/THMrX
1ywFiAf/SodY/tjZ1rhW4gydduVI3M8TGUSUrt7YpkOjJv8/Esl2At4EFWAQZVU1
qIbCKvtwuP4KzLKvMScCARuF1YmCn9/zGZAYOCYT/5WygUlMficPAGZdBXo0v9pD
N8CboM9FOvQEdQ5BUt6UAc8YyJ0AuKZJsxGq/gb8v5ko8mDiEIuQXimhOCWGxHTI
os3gMiHhEoRraKmNGwjNDvaJsC33kN2L2fP7y6Kz1FW903bcJCrAHb3dUqY7ZyBs
fmdCdYcmomeG496pc95UFu+LDc7Sd+9p9aaskP2c9zWgHqmk8X7anXRbf7+nsiTg
8skvKAowiNUHDo61KztUd5SmFFzmfA==
=S0OA
-----END PGP SIGNATURE-----

--8w4vJErrroHezzIq--


--===============0368593853699474857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0368593853699474857==--
