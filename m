From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 2/2] automation: build on openSUSE Leap.
Date: Fri, 16 Nov 2018 19:51:34 +0100
Message-ID: <4839c3ce19f62382faea9ed861955bc5def542ae.camel@suse.com>
References: <154239232312.10244.2674246603103909622.stgit@wayrath>
 <154239307020.10244.149878067287347106.stgit@wayrath>
 <20181116184217.lzfwehdx3t42z23q@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4826424653465090971=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nxwo=n3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gNjDU-00034H-65
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 18:51:44 +0000
In-Reply-To: <20181116184217.lzfwehdx3t42z23q@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org


--===============4826424653465090971==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-1B6rpRimEWHu6WJbMXJc"


--=-1B6rpRimEWHu6WJbMXJc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-11-16 at 18:42 +0000, Wei Liu wrote:
> On Fri, Nov 16, 2018 at 07:31:10PM +0100, Dario Faggioli wrote:
> > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
>=20
> Acked-by: Wei Liu <wei.liu2@citrix.com>
>=20
> I would like to rearrange your code a bit to move it above the
> arm builds.
>=20
Sure, that indeed makes sense.

Lemme know if you'd do it when committing, or you want me to.

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-1B6rpRimEWHu6WJbMXJc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlvvEbYACgkQFkJ4iaW4
c+4DcA//U1lib7/RzyRkHQ3X7IkkcIxfFl5b3uiOIcWJ7ISpt/GwqDUD8vK+0m8w
KfRPhgrwv5TwzIMWwGxDvuT+QFl211gkR5XhBUJJCDY5q0De6AbJdxRK9mrkcKty
dX1SViIcOLsQzu9G5uVj9TsLLvcH5N/qP4XPgLpwpyrpJGB4jVTs/s7lFDEKuT9c
HfcdJchygq81Xi02YeidLQU9jXAU9nUJvQs0Q6qYmHF7OqgbWM98HgEZ9uL3+zkB
x4tn0Q7zXl9hN5eqZqW4hiIFfmlNVPDNwp74PXTzybsT90UdAarIEzf3DxLhqX/0
5UfMgm6JKd/WQb4E33TTBmJAUWXSPrBy/DZEw8/zChfSf/cOcm+4FPAoNAIpwaes
wQXyYy56+K2CpiVFfG1NYYqSWXanqJMY9omZKdok3MGbnjc4R2nJI+fjYa315gd5
/m7C7qxdtUma/RLxQLs+mx/+kV69YYXscp3Bwblmhay96cvQGj1vFmiYxkN/5QqG
Bn6Wp3TjIHbo8l2LYalCB2UZmWSmiIIM85HlLGuIMRvjNo5IRJZO0MzG9qU1AUnO
i9weV/qLenbKk8M2/sQ/aCuSYLpzMf3CZcOaFIUp6u9BJPQN1ZMiKnD4Ep5MhkzV
2a/4ozJOHk+iv7XsMaT9NJGYSuaWtx3oplaLNHDFMbGrwRyGAQg=
=O9xv
-----END PGP SIGNATURE-----

--=-1B6rpRimEWHu6WJbMXJc--



--===============4826424653465090971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4826424653465090971==--
