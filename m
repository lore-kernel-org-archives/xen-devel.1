From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 4/5] formats: allign trace record format to
 the current code
Date: Wed, 12 Sep 2018 09:49:56 +0200
Message-ID: <62040836286ac75602fcf3882b971712a561a5df.camel@suse.com>
References: <1536597679-8303-1-git-send-email-andrii.anisov@gmail.com>
 <1536597679-8303-5-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4162523664654048496=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kpmf=l2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1fzzv0-0006Ry-Jc
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 07:50:34 +0000
In-Reply-To: <1536597679-8303-5-git-send-email-andrii.anisov@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============4162523664654048496==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-J/tq+bsTAsR6Ban1vOA7"


--=-J/tq+bsTAsR6Ban1vOA7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-09-10 at 19:41 +0300, Andrii Anisov wrote:
> From: Andrii Anisov <andrii_anisov@epam.com>
>=20
> Allign rtds:repl_budget trace record format to the current code.
>=20
Right.

This is (most likely) my fault. Sorry :-P

> Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-J/tq+bsTAsR6Ban1vOA7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluYxSQACgkQFkJ4iaW4
c+6G+hAAyjV5XhiDvqKm5toE7Juhgd8BKxJBDZLzvhiJtKQqor/MPKmgVppgLPI8
LQOBjY0vbJ/dfnet4Hfz/27fvyonOQJaEWLN0xM5dUd7axrgAotrTPRZCNICsqKv
qNRbVHAMDVu4mDs/k5vMAlIaMINGrdTWoFo1m4iefXMjD8yd/LmTQdetUdFqJjED
y3ilLywYBm1co3LOjIoipsniW++NtQcHZdx7rQmjE/Afgiv9UBG1KXSwFAWliT1i
/PsU01qMbAXQH0YIKN/WG2h2WcuIvMYeY0lKTd9Xnp9fbu+eQRb3wVEZNHeAJdwu
pCWKRItGFGdFiu6ANTbAFTAflhlhLyGwnALeDDA6Zg6EBbgd6wATkuUMJIEi/NSl
ga2klgRj+2XQWmpmeneaJOV/pCwfaafa/P/adPVR94ucaZFMVC4df9zYx8DfwBHj
YG1BhLeULUaZYNxmCSbl238MlyyvNtrr/7WeQdZeiyBXv2E8H3QWhO8QH4WWAmvq
naLXwLD8pdwfnJfZ+sV/0rAtgGPMLuunXnvLk7QCNag8V57JYNnOZgHoer4wR9li
NXeujD/WVX6JeCRR+cHOxcCHdQy6XluXr71evGxRMLkPqRhJEcbikVLhTjAMZgDi
fBJ848QYLFFDx9Cz9Kpkf9OPe1OFrh/z8VWH3+kbnAuMBW+3Tf4=
=6MBj
-----END PGP SIGNATURE-----

--=-J/tq+bsTAsR6Ban1vOA7--



--===============4162523664654048496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4162523664654048496==--
