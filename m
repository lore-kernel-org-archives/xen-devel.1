From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Xen 4.11 Development Update
Date: Fri, 09 Mar 2018 18:50:55 +0100
Message-ID: <1520617855.21431.42.camel@suse.com>
References: <20180228082337.15821-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4180306592719617855=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ogvm=f7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1euMB2-0001pD-Mp
 for xen-devel@lists.xenproject.org; Fri, 09 Mar 2018 17:51:32 +0000
In-Reply-To: <20180228082337.15821-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============4180306592719617855==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ysubHD9TvxgE4eGDfptB"


--=-ysubHD9TvxgE4eGDfptB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Juergen,

On Wed, 2018-02-28 at 09:23 +0100, Juergen Gross wrote:
> =3D Timeline =3D
>=20
> We now adopt a fixed cut-off date scheme. We will release twice a
> year. The upcoming 4.11 timeline are as followed:
>=20
> * Last posting date: March 16th, 2018
> * Hard code freeze: March 30th, 2018
> * RC1: TBD
> * Release: June 1st, 2018
>=20
> =3D=3D=3D x86 =3D=3D=3D=20
>=20
> *  Mitigations for Meltdown/CVE-2017-5754
>   -  Jan Beulich
>=20
Now that this is done, are we committing to having your speedup series
in 4.11 as well? I think we should.

Maybe it could even be a blocker, considering how big the performance
impact is (and the fact that the series is already there ;-P).

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-ysubHD9TvxgE4eGDfptB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqiyX8ACgkQFkJ4iaW4
c+5MwhAA6pkQknC9f+Kz5bJOOj2bsvU2k1975hx76t//W7tO8FqjoIzDY/3b/5wV
L83GXRE1qDobu9PoL3Mv/vP6NGQ7sabUcQTxs5IaAOnv4E3bP6VehzskAVa7Rrld
Hg9pQxfo0toZu2deS+N2h8msNJn9230b6YjSWKt0vut3RMvOZA6fLYhYZtiXiTM5
6384utb63Qt6GShc+CrBg0yWgKkEqBupVfnYltMZxrCUzfVJ5eXko0nO4l6xMQ0E
RnpCk+8kw+IK3JZSgfRd3UICl1sgaA8taGGPG7Ume/lw1iugISbQEQUhQF/mfgRs
DcvhP/KhluWysny/dwUbjXcUqrFhCV2WzVZD8RIAj11zWa28MRJiY4rNTduVfnfR
eINilylPA/r4W76uKhOgYQQBBhnR0YjDZf5au0oVLYx8mqSFUBx5v/WoipRAlpkY
lQFi2WRPTZYNjI4DPWlUUUr69CrXpiF7eqC60TDawyqwzQ5vvVk02Hjtm65po0aP
iCPd+Mx6lWIdBdp8YdCwiGzgeHPA9TCB0LQregJr1XHsubZtvHFB1m/d+KuM4whd
1zhBlrERwlk8wFW9jzpyobhP8yG0PYJaq1FQrogBLX3YoTVCU4dLFonkEUWWiMrG
+ul0Bx58dPrRzdEoyX+UUPZpp+4jH/bswD8iRjjl1RVTfL3d6Fo=
=S4JS
-----END PGP SIGNATURE-----

--=-ysubHD9TvxgE4eGDfptB--



--===============4180306592719617855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4180306592719617855==--
