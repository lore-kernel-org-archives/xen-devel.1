From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen: schedule: initialize 'now' when really
 needed
Date: Fri, 31 May 2019 12:14:42 +0200
Message-ID: <b2ff3c391a5e37b7d9e0ffa663462dc32af705e0.camel@suse.com>
References: <1559284268-8280-1-git-send-email-chenbaodong@mxnavi.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7808152688647419057=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=agGR=T7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hWeZ9-0008CO-7y
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:15:15 +0000
In-Reply-To: <1559284268-8280-1-git-send-email-chenbaodong@mxnavi.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Baodong Chen <chenbaodong@mxnavi.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7808152688647419057==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-k1GE1nqvJcmhJuFcFK6p"


--=-k1GE1nqvJcmhJuFcFK6p
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-05-31 at 14:31 +0800, Baodong Chen wrote:
> when 'periodic_period' is zero, there is no need to initialize 'now'.
>=20
> Signed-off-by: Baodong Chen <chenbaodong@mxnavi.com>
> ---
>  xen/common/schedule.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-k1GE1nqvJcmhJuFcFK6p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzw/pIACgkQFkJ4iaW4
c+59yA/9Gh+Q9XBZQxWpNrk+9GgNkfIEgvPOba1HvOMkrfirfMesgxp/9by4ng0Q
0cBYTwSSvRxsPZxsgSCepzj8Le7jt/IkfojflSfKI2jtN1QkvjUdmZcD+KTA6lvE
B29yAKVHclURJXFxPNH4mXjmshWFQEC3Mdk5+Pe8jel0O2wXPE1EKhMwCP0Phnzy
cazZ/lOCtzIb0vdWtEmtNQ5vEO84c6FeUms2UvYvMk5s8/Bk+GR8jyYApMN6P5ND
sGMSopU3Y/2xZ2r/1sJfBjvG0wtmNCfgeEFOoS8uOW0VAh/TYj0rJT+R0J7G79DC
U5Mk23m8Eo67lMZToMpw//W+DBUNLqesf8fU2wtbVXJ/qGUL862yVDC3Llq+DOGR
HgdymiJN5iKE3oh+E28Gx5HUjJ+gu4Hmh/eQzKw7FsfNWEMP91bXH21EduXVQNn2
qhZsd0vMQexUxzoGSs/9cUSDW6fHKu4/W6Gve7U8O2lcgY9AAiVBLMQD1TEuRdve
IDWoVHu9ypY1V5IW5QZl+wQ3UAnW0+ZB4NEsMJKyHtCOMOJgjKCTrOzDQTNh/u6E
AKC+QuUqkknkgCPYFfyzL26lgm/690EEv65xK1lRZyxzpx/CTE/m803Fy/BCUIJi
zqi8aubon0wdCv7Awba2uHaZ7BHLgqX3nEevXdObCUdnkGq5DRo=
=l8N7
-----END PGP SIGNATURE-----

--=-k1GE1nqvJcmhJuFcFK6p--



--===============7808152688647419057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7808152688647419057==--
