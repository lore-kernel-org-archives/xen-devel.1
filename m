From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v3] Change timestamps representation for
 keyhandlers
Date: Thu, 13 Sep 2018 15:22:11 +0200
Message-ID: <9b24c480bd1c2437798ff1619f5ef695dc938aa0.camel@suse.com>
References: <1536771807-1118-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6083149373211198047=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tvlc=l3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g0Ra5-0005g9-11
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 13:22:49 +0000
In-Reply-To: <1536771807-1118-1-git-send-email-andrii.anisov@gmail.com>
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


--===============6083149373211198047==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-e+X3D6S2mT76SjKn5qQP"


--=-e+X3D6S2mT76SjKn5qQP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-09-12 at 20:03 +0300, Andrii Anisov wrote:
> From: Andrii Anisov <andrii_anisov@epam.com>
>=20
> For different keyhandlers, replace a hex with delimiter
> representation
> of time to PRI_stime which is decimal ns currently.
>=20
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

--=-e+X3D6S2mT76SjKn5qQP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluaZIMACgkQFkJ4iaW4
c+7VgQ/8DWohotd+4qYddPNHqUGYKcxVq+Qi+DHo5GL1AW2Qjxbqb54PVbreGOiw
potnq+Zcdy15rLmlQ570rEpBbdOXJTSddG3/QKnr8Wdrnw6a5wZ2cvvtL676+Sus
G7QHnw+fThFsJm+mzjwSeoYowAHBm5DkCNSMSmbKiels38AdFRS2zFdeIOdK9gQt
aWXtIgR/O3GT1MycOhMPpen99eEcwg1Wt/qXlDcuUZCj33B7lvyWpKukhsZGFvU5
rW51ezLEHPNXXLAjC75+YbjvSn9BQliAEJrLHvMMoNdSnZpVDmOe1V70QpmM4h0o
0cGR5LtK2AgEfwJsK5ZDwTDM6zyEHJ/x4moW3m5Mfe6Lq3+0JUcxxVU6bDFfL1VG
7PtboBNJ0XzsBwtz/l2dGFlOAbbr1Y/0Etu87oAbwDu70tXS2eswz8udclcB3O+w
l5NWW2QHKCUUb+tc3GoC/GqjQo7SwpdW8R8WtGNjXp+XoVjOsGiTdi+1MYrHsCK/
9VnHguHW5a6Xi7wQsPag3/tMwXOYLFn3rSrLA4wTcuMqlhJ1mrMjUWXLO47600CP
R763kpaZqANy59C40gjS6tKVDTUTME8wIiEcJbc0nl8uNUNy5PmT2tz9TdqEcmyr
Rm/zrThkQIflq03juec5pq9b/i0G3U+4c9r1uWW0G8Y/hxfoOZM=
=cD4O
-----END PGP SIGNATURE-----

--=-e+X3D6S2mT76SjKn5qQP--



--===============6083149373211198047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6083149373211198047==--
