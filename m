From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: Radical proposal: ship not-fully-tidied shim as
 4.10.1
Date: Tue, 9 Jan 2018 11:59:01 -0600
Message-ID: <e77fb40d-e971-4d80-99e8-2f0b9690bcb4@cardoe.com>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <08bdc18d-7d05-9e56-5a7a-513603698576@citrix.com>
 <5A548A32020000780019C91D@prv-mh.provo.novell.com>
 <20180109115054.tjztugqhayz2b735@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1700209054438785060=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2je3=ee=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1eYyAz-0003Ig-DF
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 17:59:05 +0000
Received: by mail-yb0-x22e.google.com with SMTP id f16so6320899ybn.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2018 09:59:04 -0800 (PST)
In-Reply-To: <20180109115054.tjztugqhayz2b735@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, committers@xenproject.org, security@xenproject.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1700209054438785060==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="JHuRf8jNSobvbOK9ipoJC7HG38bXZNkNE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JHuRf8jNSobvbOK9ipoJC7HG38bXZNkNE
Content-Type: multipart/mixed; boundary="eDuRH3kGvsCfXJwecHj63UcUvfR4VnZpO";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 committers@xenproject.org, security@xenproject.org,
 xen-devel@lists.xenproject.org
Message-ID: <e77fb40d-e971-4d80-99e8-2f0b9690bcb4@cardoe.com>
Subject: Re: [Xen-devel] Radical proposal: ship not-fully-tidied shim as
 4.10.1
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <08bdc18d-7d05-9e56-5a7a-513603698576@citrix.com>
 <5A548A32020000780019C91D@prv-mh.provo.novell.com>
 <20180109115054.tjztugqhayz2b735@citrix.com>
In-Reply-To: <20180109115054.tjztugqhayz2b735@citrix.com>

--eDuRH3kGvsCfXJwecHj63UcUvfR4VnZpO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/9/18 5:50 AM, Wei Liu wrote:
>=20
> We haven't tested booting the series I posted in HVM mode, but off the
> top of my head it should work in HVM mode as well -- the multiboot path=

> is left intact.
>=20

Can we actually do this before committing to this series? I've seen a
number of "this should work" in this thread and other threads but no
actual confirmation.

--=20
Doug Goldstein


--eDuRH3kGvsCfXJwecHj63UcUvfR4VnZpO--

--JHuRf8jNSobvbOK9ipoJC7HG38bXZNkNE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpVAuZfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl0RpBAAodV7Ma+NX3NG9WU0s3lavN0/Z7lu51g+xyb8iMiSbRrqWvPzE2dkSJVx
NSPB8FtiI+e8XI+98dQEyaBO5AYalHo3HeReo1cizo41fKP8aX7D95co0Gus/Vry
uqyPTnodQnmmzfgQpPemqewwNzptI0lWTSnN/ct7FsTXG6j/EU86l36BMfEPkJXj
e/uUcImCqE/smj8Ylz7mgr0lKnLUhxAYmpPn4Zr6zRwtz7Qa50nyIHNQeT/YS8OL
fQWoV7NCatyJIcIBqZy9estOhirpYRMqSqtujBJw0z27OQd7kzngM8NXUK3u/joF
JMpmTgl/gihKy/wDYhNUZfMpwcIUt6YzLi+vdwZu3HEuJScLLjfRu2+sgdxC2T4R
aS3fnGY6fZDLSLTqwYsQgGcqCFfmuX2DGvS57GV5RInUW4e3g9N/MIMHgqEWJshH
zgBeVR/sM9pn26abL+Gcbalsi2tUsVNH4h8KCyLyzqqhgQi40SuPgEWa59KMWjTT
itC5lTr/dJL5Yw9yYmnF8F+5uIIN6hkwWXHXCZHDtHq5sAXyubFoQ5zNhNnMlZ9O
+YoPYUSF3Mp1OsNktL6sJYLKB74E0iCz+4XhtGqAe7ZDt69It3ylS/9U0xLcIwwS
4RKOMo0eMdR+1+KJq/4cvUSs+ZuQBOoYiKo8rMqAaQtTldal8A0=
=MUMt
-----END PGP SIGNATURE-----

--JHuRf8jNSobvbOK9ipoJC7HG38bXZNkNE--


--===============1700209054438785060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1700209054438785060==--
