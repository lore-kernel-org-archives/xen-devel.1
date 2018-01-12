From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] x86/bitops: Introduce variable/constant
 pairs for __{set, clear, change}_bit()
Date: Fri, 12 Jan 2018 11:58:58 +0100
Message-ID: <1515754738.30117.126.camel@suse.com>
References: <1515688450-27444-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5290123361500773920=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515688450-27444-1-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============5290123361500773920==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-2bfctn7lfUaf4gYP4LBV"


--=-2bfctn7lfUaf4gYP4LBV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-01-11 at 16:34 +0000, Andrew Cooper wrote:
> Just as with test_bit, the non-atomic set/clear/change helpers can be
> better
> optimised by the compiler in the case that the nr parameter is
> constant, and
> it often is.
>=20
> This results in a general replacement of `mov $imm, %reg; bt* %reg,
> mem` with
> the more simple `op $imm, mem`, reducing register pressure.
>=20
> The net diffstat is:
>   add/remove: 0/1 grow/shrink: 5/17 up/down: 90/-301 (-211)
>=20
> As a piece of minor cleanup, drop unnecessary brackets in the
> test_bit()
> macro, and fix the indentation.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
FWIW,

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-2bfctn7lfUaf4gYP4LBV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlpYlPIACgkQFkJ4iaW4
c+6NNhAA6J+/aCQ0G5SnO3qGWrEZvK2dBtOQGgbTGUXWuTrIV5wRViVlgFuu50Xm
VSVKfN0KsnfkIE87FOZKzJSoihZR/PjPx0MvVlSLe7xsklEEeiO8LkwOR/c+atlV
aIbyup7gc5i5tFk2qk+SyXNKr2PqZI4H0U+orWXhNb0+FmtPpxxL3ynOyZefhGuA
YA7sQ4SKHlHnd/cMRGfhVLCamhNKMhlNX1B6tN8DpBsw3LTa4rIzIZiRI8Vxh0KP
8yBK7UELy08kE4XeZS226K1Z/GNgoRWu96Laj/t5XNA4B7pW+XXbm0sx3TCe4f5M
PNq8ZyUkIMK7bMFKFXI84Z1iheo2hsI37TC6nFyaXvUWWmgMRnoPnoFWSI4TODNc
3APvOjzs56OaxjJ10md/R58DobVu+Tzsmq7zebOqCKUoujMMs/tdEH6OSu/7b/7u
EerRBLAb5eeEMwasnHxUKAJTHfYQnca7q6NIOOlPzYqDsqIXkfG5jsRDAg4kQ+dH
83EowtSK0fO6JvQfjIteNdSVAq2IU0kpzLxlIByRzBv+1gnUo1rXVq4DNBnqCxK2
HcaQVDwbWK6fPMgIUePbxITyGu9PYN65h4qGZS9Qxj5tRmFua2LT4vQaaS92EA5b
xTelPaHd3kuUyruzNhq7q2yTyDe8KVc/qUIeLjXCLkmPdiipx+8=
=kYzd
-----END PGP SIGNATURE-----

--=-2bfctn7lfUaf4gYP4LBV--



--===============5290123361500773920==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5290123361500773920==--
