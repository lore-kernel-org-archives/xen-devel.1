From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 2/6] xen/credit2: Move repl_timer into
 struct csched2_dom
Date: Thu, 01 Mar 2018 11:12:54 +0100
Message-ID: <1519899174.9145.13.camel@suse.com>
References: <1519827268-18199-1-git-send-email-andrew.cooper3@citrix.com>
 <1519827268-18199-3-git-send-email-andrew.cooper3@citrix.com>
 <af629112-296d-7130-c96f-eb0a315d4523@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6836801822876576585=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <af629112-296d-7130-c96f-eb0a315d4523@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6836801822876576585==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-n4MCUGXrsLyIeunjPesy"


--=-n4MCUGXrsLyIeunjPesy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-02-28 at 15:26 +0000, George Dunlap wrote:
> On 02/28/2018 02:14 PM, Andrew Cooper wrote:
> > For exactly the same reason as 418ae6021d.  Having a separate
> > allocation is
> > unnecessary and wasteful.
> >=20
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Reviewed-by: George Dunlap <george.dunlap@citrix.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-n4MCUGXrsLyIeunjPesy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqX0iYACgkQFkJ4iaW4
c+6oSBAAr8xxq/wyh1eIZ/Y80Ppp5In4pFbAMJffrLjy+JmXoCa7uaCjBAtRyB3R
0v1txCFm3KwRNg++Xh7XH82EoHMMkfPRSiTZRZxu6lMn/i3tIEqI6ROIJWR3beL7
3ognBZ8LjfuU8XH4TX9yElxMeLPhXR8/b2u4x8T/i9ffHe8Jn42dQdbecjORK/1w
OlnWoi1B50ykrcd1Y6oVbvxE2NEwcNsQ3nMfYr+rB0T0cR8Z3eZMwQDGYG5dcq9h
8sF9PQinXbpOnCVukvp6RwmeQuDi78pXV0SxncztTp9smAGeZ5s+cikU9iTAG0yy
JBsTeWP8CHlmXsGiDQ2KHVh+QK/sU+5KBnipbI9VeI18Yql4iduZQxv5P8vGcczx
nWupCOvaUkcymX689+Y1JWx20O/v3xhA19PPS6CByK72vejOggsiwEvIFXFHd87j
qeKbdmEhRxTkpp3lsHQ7TK/z66Gcmy+A2uBf2YsUSZUpRm1cxMhz/ELNuU6uJhqi
pvcty2t5GsmEWYiWnfYDKN1/0AGb+vLXvoojLysI98GOnCsVkfgmSZyimu5OrEXF
/KQ+upXLehzUDNfn/r7wNrQQOP725GZlYr6+5UAdhl99U6WcFVxeTt4eA7FXOj4Q
ps2iiWebHdTEfy7J/5xZDgVPTzKLkvtvqR/8ueRkpNGTJSBqhc4=
=sR6V
-----END PGP SIGNATURE-----

--=-n4MCUGXrsLyIeunjPesy--



--===============6836801822876576585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6836801822876576585==--
