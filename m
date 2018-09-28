From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Backports to stable trees
Date: Fri, 28 Sep 2018 10:28:01 +0200
Message-ID: <06cf41aabd14cf596c14857cc7ef124b6724d59b.camel@suse.com>
References: <dce9c10a-f258-3511-729a-4b436deb14fc@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0229850690395826017=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <dce9c10a-f258-3511-729a-4b436deb14fc@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel List <xen-devel@lists.xen.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============0229850690395826017==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-aRUY3Ttsfjr+0y/XCTf0"


--=-aRUY3Ttsfjr+0y/XCTf0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-09-27 at 15:36 +0100, Andrew Cooper wrote:
> Hello,
>=20
> Please can the following patches be considered for stable.
>=20
Can we also include:

6e395f477fb85 - xen: sched/Credit2: fix bug when moving CPUs between=20
		two Credit2 cpupools

for 4.10 and 4.11 ?

=46rom a quick check, it' not as easy as cherry-picking/applying the
patch (there's 1 hunk that fails), but it shouldn't be too bad.

And I can provide the backport, if you want me to.

Thanks,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-aRUY3Ttsfjr+0y/XCTf0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlut5hIACgkQFkJ4iaW4
c+51zg//btQk6kU3zq69dRcaZs8IZsagjxkJzofNVTyZWH/P7WVVz8yY63YMHR+L
yXwPu+iUmjkEHkVBSSe6W3sn47z+CeSu9gRKgb2+3EA5ynCWM+SKkzDAo/zGGWro
lxUnSx4uYMJo9qUmJ5EAsPJ1haF3RMb2ZC8D4fnaQ0J63OBUbYRa75s1nUS0siLo
52VmkwFR6DR1LYTn7AfPZVtoRyVkQHqcpWKxReLEo7DXbB8F+y3wTlRg2UMONDaj
2zlj4PIjaoR3qUOoW+suN4uxdDBYmMYyH/ZTproyzwONTWiCq561JUfMjYGVG+7y
sv8gvV9tAw6ydncrw51G9AkB/p8+iMQ329kJ8+DnR3RrAESBaARHJF/D7yMO/hFs
OEpSaT7L8LUBTy/iPWr0ZXblFV4iYPQEO0horkJdTkXHuMAbnIA37yaKJQvwsjQY
Pokr2fV1PXw9WLT+pXEA/P+7FwcPYuccqyYbW25X/qMG3eyU4ZPeSUjN/Wz19lsS
wisScfaZKer0hybeu2buL5hOJ4ZrHAJHBDzukLANjjOgLhHpm0KeFX9xOaR+lDkY
0hE+zRfWt8ErTU5l9T8OM5hte7vgBcTAyr6tsfLpRIfzgQZv39Y3Aiq/Z5NgTETO
xQ/d1mnPtE7h/fb576b8aYJePD+XFOQrTE9h+ILeyZszr7GT4F8=
=tVfz
-----END PGP SIGNATURE-----

--=-aRUY3Ttsfjr+0y/XCTf0--



--===============0229850690395826017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0229850690395826017==--
