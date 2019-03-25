From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 4/6] xen: don't free percpu areas during
 suspend
Date: Mon, 25 Mar 2019 19:14:46 +0100
Message-ID: <ec8e4e85bd9a6fccc5870d73dea66892122080cf.camel@suse.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-5-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7439566409937994500=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ytoJ=R4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h8U7o-0005kB-2O
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2019 18:15:08 +0000
In-Reply-To: <20190318131155.29450-5-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7439566409937994500==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-+EGluaatIm1h/JeLT0ai"


--=-+EGluaatIm1h/JeLT0ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-03-18 at 14:11 +0100, Juergen Gross wrote:
> Instead of freeing percpu areas during suspend and allocating them
> again when resuming keep them. Only free an area in case a cpu didn't
> come up again when resuming.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-+EGluaatIm1h/JeLT0ai
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyZGpYACgkQFkJ4iaW4
c+4KohAA5dEXzvrNeo2ruS/pypKAB8uElEk5JAZ9pbzKXdsYrd88RoD8kxqSBYyg
2EHmrkIVWiDbe/LwHGnyUbpzqbFpmTCJtc4I0yCiUvU85CaLRqozMxuCwpmT8SU6
DBSmAG4cQsO10Q3b0DEebtBRjBXQ1cGKqJAEwQf5BRKIz75D1GHQrB5cuEaft4DA
+T29G1K0V/0jhALGa/kcWf35M6mOvwmqwaGIL97ZscauP5zWCNBYfx5cnT9a5SaJ
kpR+5mL61PKO6UqxDeXcssdGkq+2gEAphGbbSlJFYSgywlWXQyqEqahgK/hOXZmW
njLlUZvAQ4Pu0puUQaPDl5TtHaJj1ekxl7eAgjWiXHhONohZMSJ9QLARhfCvyL99
Prl5GWnJygObbT5Q4UVfLZ/SFjJJPF93nykPYhetGuicCoaHdEU2h8+FC20BBKxZ
MKo9bWpJCNhPGuhEVuK2lvLVT8frhyWEBZRf1KKYDOIIQ04YRJDJgitoRNclLSjX
fcSxeED3Rz+W8Y3nJiRYuXekuM12poOlbrJvhfHmX6maaa/LJTm1S3kP5dv3jz8E
uiSrDUe594Y5RXN3Hmgpfq5ZI4htTglnvaTXWKz+XYxytV8IyaqT+XvluJ5P3o9Z
0av4/Czi8Dc6HSojAY6K7sBJrig9RfGth3BmI+CY/RuHI9K9T54=
=bH+J
-----END PGP SIGNATURE-----

--=-+EGluaatIm1h/JeLT0ai--



--===============7439566409937994500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7439566409937994500==--
