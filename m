From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen: sched: Credit2: during scheduling,
 update the idle mask before using it
Date: Wed, 21 Nov 2018 22:39:46 +0100
Message-ID: <e66c64c5448ab4eb73d422bdd28022660cfe559b.camel@suse.com>
References: <153926549830.22680.203200918007449375.stgit@wayrath>
 <dd747aed-8144-2de3-f6d3-62943bf60173@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6205881781057495977=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i3vo=oa=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gPaDi-0006pa-S1
 for xen-devel@lists.xenproject.org; Wed, 21 Nov 2018 21:39:38 +0000
In-Reply-To: <dd747aed-8144-2de3-f6d3-62943bf60173@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============6205881781057495977==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-5iiDmAnY4v8cCVQydEeT"


--=-5iiDmAnY4v8cCVQydEeT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-11-21 at 15:57 +0000, George Dunlap wrote:
> On 10/11/18 2:44 PM, Dario Faggioli wrote:
> >=20
> Reviewed-by: George Dunlap <george.dunlap@citrix.com>
>=20
> One comment: The title seems to have excessive tags.  You only need
> enough for people scrolling through to figure out the domain;
> "xen/credit2:", or even just "credit2:" is enough.  More than that
> makes
> the line too long and can obscure important information if the lines
> end
> up being clipped.
>=20
Makes sense.

> Do you mind if I change that on check-in?
>=20
Go ahead, no problem at all.

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-5iiDmAnY4v8cCVQydEeT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlv10KMACgkQFkJ4iaW4
c+4kKBAAtG51aC59mr2roRhmXOHvxVbHRK33xd/hQ5GIZTkJgQgY5SWDLUxpeINg
0z4lqpn3pRVxcz7F1pnN9zuQk5cxl+9K8xz1sJGPQaH+5olVDzR2+5gic8r+D9+C
8VHlb0vI4O34xBvIvX12ZmYc/bNCeKzaKYgcScu5iPKpF8qlFUo+sW1LY79t5fAH
wf+6w3JUX0CyUDzX0ZHXUK35sd0fBhnP6lOxYebDlYhs1/yo0QnhSf9qE07rTB/X
LRELJ9lnDUN/jECuEodc2XP6YtiAEEs6vlT+7Y2RsNuqd6tvlBAsAuOHrB2NGh1d
/N2UqM3SnovS4ErYcXHfloX06MXIclLcQbw0PDKxv6s/T8H6EDoNLJNXUONQaYBw
3IMspTmE16oAzgSh6MtCx351bd+jp/vP3OPoQAT8YGVJpleMOCra/XQwhSKtN4mb
i4zDekUaapex1qEav9L+mDuWE++8l8UsuE9kM4phhnSilAlOwckA5dobTNxvueak
aZe34fMi/IBC605HE6YOHcSUy9l46sJYbx2s72ED+yd4OdBeGRJEktKQ4FaqlKbg
Cx62rnYOLsoCOE3iKjtr0J6crxD/ALNTuFC0LqRTPc3IEdIgdoWkfty12DXxQJbm
seuk3g0kENrD/FcBkBjknBx6h3BKkSqVtvfNYzT+3DiybPLFXs4=
=khXC
-----END PGP SIGNATURE-----

--=-5iiDmAnY4v8cCVQydEeT--



--===============6205881781057495977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6205881781057495977==--
