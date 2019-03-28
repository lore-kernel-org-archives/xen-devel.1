From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2 0/6] xen: simplify suspend/resume handling
Date: Thu, 28 Mar 2019 15:53:27 +0100
Message-ID: <6b45be13fc9ae9ee43b07e16148854c114e5545e.camel@suse.com>
References: <20190328120658.11083-1-jgross@suse.com>
 <CAOcqxo2Jq7GVGPs=tg17_4pHy_W6+SrvGdP5y0AHARUNe7X+fQ@mail.gmail.com>
 <705a456a-15f9-9b24-e0b1-dc373f7d3e99@arm.com>
 <CAOcqxo1KcE_ZE2OJfyPPEvFJk_hZ+DEsKffNzKHbeN4MoH8a8w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7955409435557518277=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q513=R7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h9WPs-0000Ur-RV
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 14:54:04 +0000
In-Reply-To: <CAOcqxo1KcE_ZE2OJfyPPEvFJk_hZ+DEsKffNzKHbeN4MoH8a8w@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <vlad.babchuk@gmail.com>, Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7955409435557518277==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YSqFTLhGBmlF1KCLZqJJ"


--=-YSqFTLhGBmlF1KCLZqJJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-03-28 at 15:56 +0200, Volodymyr Babchuk wrote:
> On Thu, 28 Mar 2019 at 15:33, Julien Grall <julien.grall@arm.com>
> wrote:
> >=20
> Are the logs below actually a mistaken paste?
> No, this is what I'm seeing in my serial console.
>=20
Err, sorry, I'm a bit confused now...

So, if you use the ARM suspend/resume patches + Juergen series +
Juergen fixup patch in this subthread, do you still have issues or is
everything allright?

If you still have issues, which splat are you seeing?

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-YSqFTLhGBmlF1KCLZqJJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyc3+cACgkQFkJ4iaW4
c+6Mww/+IfOUElbGUguf5Wz7fVRYX04ZhTE43IKoPs1PyBKeW0p7u4plmamOaknI
jpOpu8YiTOsGfzHudGR1CG9dZnLxI+A7nbgeEZwYAN0xSzIlKUrANS6BSeLU1Zi7
ZZ8ONjqhupb5QuSTQp5rzKbmYaiMyis8h98vv4CpqWt28dC6S/KpVpTtdY+KHJ+Y
yz3Cw6Tci+jcFxchilOfdusdrN4cJOGAdWe8c/kLTwC2MvfMrWokf7T4h3Ab+qKp
nROV+QHAO6r+7GxOuYylWMmbLE32vxdLYgRg6VFiKCHLP7icWbad73bAemJFxqxq
55oQRRPxicVg8omr7M9tWsQIjk7r3hRRGkRo88rr2iBiUPjmAqUiX7fReD5yyl22
c7KNARXlMb7tw1IpQbDFpQ7fJSxvWI8P2H2irMexrZkIpiV//fJdknY4OaJs1qc8
tnwezZy+F/pRXHoN39oODu4LyvDBBQ+ckKaQVQbBG+8SuOrXMmmTa8LzSYhimOAw
3HHTGGC5E+FpfvO1hHCnXfG6LHwePegz0PSJe8esA+cRYhn9N85HdQNOuCqy0huS
aJGGsJ7SWzgNuPHxZEbAUhrvOn4yoeZIjft5ivskl0l7CtfEGTWyR+sblidr/ggl
1vYaF3wNfP5Dzfr0B9bjSCgYXEoyZi8rI07jRUd5sw7V2I/Balc=
=MAHQ
-----END PGP SIGNATURE-----

--=-YSqFTLhGBmlF1KCLZqJJ--



--===============7955409435557518277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7955409435557518277==--
