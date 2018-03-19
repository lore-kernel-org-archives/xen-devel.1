From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2] xen: fix null sched build with debug=n
Date: Mon, 19 Mar 2018 23:39:24 +0100
Message-ID: <1521499164.5400.93.camel@suse.com>
References: <20180319184115.20957-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5576506777934970092=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180319184115.20957-1-cardoe@cardoe.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xen.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5576506777934970092==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-uOaAacC555cS9/Xm3UWH"


--=-uOaAacC555cS9/Xm3UWH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-03-19 at 13:41 -0500, Doug Goldstein wrote:
> The null_dom() static inline is just used when debug=3Dy so it results
> in
> a error with the default CFLAGS and debug=3Dn. This function is used in
> only one place and it a one line helper so remove it until we
> actually
> need it.
>=20
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Thanks,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-uOaAacC555cS9/Xm3UWH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqwPBwACgkQFkJ4iaW4
c+5NOhAAxja5E6EPj20EgQm3pYbS2ArCBokpbbAFIGgGszBfLfaZc94tWQhuUkgc
zGmbK91XNAgmAAe7fdti3OwSVEsWCcvdr/r00x9rxqsFeOUTH0W6fvOvaQFCKTit
toJI4q1Tn3fcpgH3EDaaH506E38xFu16u8rfP7eXgSCi+rbJL21Wnn36SQL3BrAu
e7QHoJcOWEgs/Pc8t7myT9QKAKlQJ9P4CTna3BQJ14WmNwUT9zSklHYO3Io9wFzY
dc6U/JRzICF9WibpO8dK3LPjAz95W+yfBo4ZL7As9bMSpuQd+OP06eC7dyNW+wE2
kYTuo5kXPzaWKSFHAi959OxtNmM+mSMiu7DpJLwig/oELTVK/ut3r1pmLiqhCLYh
yuSzCu3L3FibXlm94RYRpb47+1AYLhZefI5gbbaeTA2VPXeKnfDVHy7uTbXfUpDi
1GEk6nr73hBsFapKwllXBmnBw++Llxal4CeVpEceR8D1+YksOhdZ5dJ/o34/Lmd2
EpkEAh6r8x+N+Vjf1dAYZGMEJIPAbwPmtcRYxhO3WAUZpetEHOUO004epJEap2KM
xoLRsnDg8K8Xygj8tcJykuBgch7OTKJHr0mjboTboEq+YCkMpApGpX/rQXWpvZVJ
2PzEt6EjEn6Zq1W9nL5COdeYRGtRlnf9d3dA6W9lPPvIdiHbNsE=
=80/b
-----END PGP SIGNATURE-----

--=-uOaAacC555cS9/Xm3UWH--



--===============5576506777934970092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5576506777934970092==--
