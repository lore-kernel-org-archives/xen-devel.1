From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 02/12] xen: use a structure to define
 parsing parameters
Date: Wed, 26 Sep 2018 17:17:02 +0200
Message-ID: <bd3bf4c0cc950237b0af86bb3f0ad82d2601fe70.camel@suse.com>
References: <20180918060309.7186-1-jgross@suse.com>
 <20180918060309.7186-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1691416430761666194=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8mt=mi=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g5BZM-0005wj-Ds
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 15:17:40 +0000
In-Reply-To: <20180918060309.7186-3-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============1691416430761666194==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-40xVD4Dp2ITTbC7OlS+f"


--=-40xVD4Dp2ITTbC7OlS+f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-09-18 at 08:02 +0200, Juergen Gross wrote:
> Instead of passing the start and end pointers of the parameter
> definition array to the parsing function use a struct containing that
> information. This will allow to add other parameters to control the
> parsing later.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-40xVD4Dp2ITTbC7OlS+f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlurou4ACgkQFkJ4iaW4
c+4o3Q//S6LAebcKpKG17bwnKdq1h/XY8tQ52YhSa3Re+gb9euke0fa3g/yNkgVw
Eyycyo0bE8DlzVEG24x6NLVRPYXhFxFg33146x/0ySE2bfBvAIXRaXJHSx/Brpj9
Zfspe0bgFjSm0tA0ZzKRoDl2w2a3weyVpP5wTYLfKA5uwl6anmZmu8FWm+Obd/GO
uUtKt0OyHed8NKzKbTWUosjmBNVFrjY3pZ4s++MgQow5Dm+ddsAd89FS18zqMyhn
Vh5NQrq3Ywtf6amWhNSj6RO4+Hs4ScA5uVJlBpGKvuaBS2LdFL9Uv404P9DMF13w
FepeVqaG4RV0XYwW0E4u3DOBG5J73COh6iLQbt9VvDK/6mpP0kceeDZtCyogXsRm
Ao4DKyW4vUxJLIphY3Fs1ZGRIPfaalDTzC6LOfkJtUjB+cuWHFdOff9rYLp4cWdu
7i1/zUkZW7cNO95mN9DSXVA2LF3kxRDfyAMBeaL+D/OFrUI7qx9LxPIiMgRotNuk
lVqtmhbkfpbXWEb4ui5dVNzKrVYP8RGeFXypJ0ogUdHFUaUP8l0PrniafPjrg9dH
ego8Kon5W54/11ljj6XV52XUnNmGAIGzFDWYdCwEe2gsROvBLavfTt1EBmPQQ0w0
nEt0Zanl5tfFpjSFaUGPaDkyMyMpUvSAmrWKhQi2dF5BE909IjU=
=6YLj
-----END PGP SIGNATURE-----

--=-40xVD4Dp2ITTbC7OlS+f--



--===============1691416430761666194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1691416430761666194==--
