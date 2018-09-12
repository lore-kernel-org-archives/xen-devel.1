From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 5/6] xen/bitmap: Drop all bitmap_scn{,
 list}printf() infrastructure
Date: Wed, 12 Sep 2018 10:09:02 +0200
Message-ID: <fbce18ce52a72ef34cc1dae68f5f00e11dc5597b.camel@suse.com>
References: <1536235696-31359-1-git-send-email-andrew.cooper3@citrix.com>
 <1536235696-31359-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3144445783033182077=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1536235696-31359-6-git-send-email-andrew.cooper3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============3144445783033182077==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ichoqyTP1Gad5aAtNvrM"


--=-ichoqyTP1Gad5aAtNvrM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-09-06 at 13:08 +0100, Andrew Cooper wrote:
> All callers have been convered to using %*pb[l].  In the unlikely
> case that
> future code wants to retain this functionaly, it can be replicated in
> a more
> convenient fashon with snprintf().
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-ichoqyTP1Gad5aAtNvrM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluYyZ4ACgkQFkJ4iaW4
c+4lERAAiMfzEvHN7vxKNWhbhsfVyjVE2BUYJJlMSxcdmOHsvdxcLDs5i542HMmo
7N3n24O5uVzy7/BoRshGGVfhS3r8CYd5B3M4MSGwhOKJejCP/9mUEXt1zzT7U7Rx
O827KNOUXu6+oh6Xx7ySeVqpMGDN8Hudp7XlymjNbSXejqxaX0lyhvfAwRNIVcNM
qsRxwy5ovZPd07/VgHGfF1SRmI14UFod0tviI/jbNFB0luACB6/UKrD8smwzntGa
eGx+PpuhzEVNhJOUjnKucZid5HoZKfuA+J26WfOEFtavAESiIMX5WTMpH4umKg9U
ByYR1i5NezCPdtbQmLgk192PtVuP7g0JQWJBcAgLTLp1A8bf22H5FhxMJQTO1Y9W
ZFzkql/S+MeL16vx+malFkrfEiiJxRn/P7rjS1VRrdUQg44k5JiKRcK46I8lhFHN
BmvzTz9THsyKVQbB5tPIQgyqQFENfC7vQhXhrDX6qkkGqn2VZWdV0pvV6ptFMQS8
KCATzqzCzQ4SOvuSMZpi5pRONSFwGu+ahEYxWPUoiCG1W3ltRvMduIYZZWnc3UP/
yY4QiNSYYS74Il7l+6kvgQIDabmuMr8gZlOno4LWLT/Mfghu/0ogmIFYz9MsDqTO
Mb3SSk+U78v4UiNkIXOJ9tCsf+0fFiEYQEgyQPFxBVAKi13k8vU=
=YuUt
-----END PGP SIGNATURE-----

--=-ichoqyTP1Gad5aAtNvrM--



--===============3144445783033182077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3144445783033182077==--
