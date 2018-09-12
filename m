From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2] Change a time printout representation
 for keyhandlers
Date: Wed, 12 Sep 2018 18:47:06 +0200
Message-ID: <217a0c2f234420e52b0bfbb2699154a3da36f27d.camel@suse.com>
References: <1536767914-22616-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8985005955416332026=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kpmf=l2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g08Ik-0000rG-7j
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 16:47:38 +0000
In-Reply-To: <1536767914-22616-1-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8985005955416332026==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-46LqehRnDfj4fHFiDSjw"


--=-46LqehRnDfj4fHFiDSjw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-09-12 at 18:58 +0300, Andrii Anisov wrote:
> From: Andrii Anisov <andrii_anisov@epam.com>
>=20
> For different keyhandlers, replace a hex with delimiter
> representation
> of time to PRI_stime which is decimal ns currently.
>=20
> Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
> ---
>=20
> Changes in v2:
>     - Time representation change propagated to all keyhandlers as
> agreed here [1]
>     - Title and message are changed
>=20
> [1] -=20
> https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg00999.htm=
l
>
Right. But am I missing something, or you forgot dump_domains() in
xen/common/keyhandler.c ?

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-46LqehRnDfj4fHFiDSjw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluZQwsACgkQFkJ4iaW4
c+7EeRAAxD2sRgx0pu97KuMlX2+QktOqaBlXVMDYi6QKLztzjPBGliyU5B8on6md
m8q0m4w6SeH/Pf2fEzAavwzMfWobMuQnbASNjJknaNIB8FSWueMEZMQZgkO+n868
XqDI2dtD63WeKGtI32o7MVfukC1E3iWP6sLWl/fpMxqtOaVeDQSb1oR1oI/hzA/r
iyCks5yEn4EdUFchYeI1DJZ3G/sJdi2ezwk1tg/ocwXd6GtZJNluB0CxCeEb5vch
elOpGbsh322RTFATCCXpDH0aZLpncB0bscD4DmYffwskpXYivzMowo7jZ61BC+bl
GlUl/jzeXyXKQykhqn0beRZHjXdI29OfcsuNgB4vC+HE8wQ4WydQ6IYw98dC12Ji
7WPJZEc7XHdR/Zqb5wd8h6en/GHHjq0+GdJbmCuNuK7oZ/f0kMSpFuY3UWhM77WB
vJyy1tIewy/ykxabPBtdyHjo8kGOxrtMFr0fYiyaSk6jd+5S2fvKKmcg3j8kAfm9
A+6GPWdNWF6MeM5wzwNLjRRxb5vdbfv+ks5CMIdgmKICzbyWGgg+JU6rl+8YhwiY
bhFLEhb1xRQRT1pp12EsrPFDUzSWFJjxPluoXJ4sg82apcwtZEkY13DPrDVpSWWQ
Gi5V0EBlhfWTLFxOyaYDhYxt2PNm6LCVQHZFE/MsbYLaXX1E1RQ=
=6jCS
-----END PGP SIGNATURE-----

--=-46LqehRnDfj4fHFiDSjw--



--===============8985005955416332026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8985005955416332026==--
