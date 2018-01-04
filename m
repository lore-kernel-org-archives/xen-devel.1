From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v6.5 15/26] x86/feature: Definitions for
 Indirect Branch Controls
Date: Thu, 4 Jan 2018 01:16:39 +0000
Message-ID: <3ee20005-3d99-4969-5ba2-542f62ba45ce@citrix.com>
References: <1515024955-13390-1-git-send-email-andrew.cooper3@citrix.com>
 <1515024955-13390-16-git-send-email-andrew.cooper3@citrix.com>
 <07f1fd2f-281d-6561-d60b-bbb89ff5dd7c@cardoe.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4256768536870115911=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <07f1fd2f-281d-6561-d60b-bbb89ff5dd7c@cardoe.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4256768536870115911==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="xkSHUuglNive3tCsCm6RskB2wIcpi26O1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xkSHUuglNive3tCsCm6RskB2wIcpi26O1
Content-Type: multipart/mixed; boundary="0yK2px1vk3yEfNuVtmBRNeRtaq5enSl1D";
 protected-headers="v1"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Doug Goldstein <cardoe@cardoe.com>, Xen-devel <xen-devel@lists.xen.org>
Message-ID: <3ee20005-3d99-4969-5ba2-542f62ba45ce@citrix.com>
Subject: Re: [Xen-devel] [PATCH v6.5 15/26] x86/feature: Definitions for
 Indirect Branch Controls
References: <1515024955-13390-1-git-send-email-andrew.cooper3@citrix.com>
 <1515024955-13390-16-git-send-email-andrew.cooper3@citrix.com>
 <07f1fd2f-281d-6561-d60b-bbb89ff5dd7c@cardoe.com>
In-Reply-To: <07f1fd2f-281d-6561-d60b-bbb89ff5dd7c@cardoe.com>

--0yK2px1vk3yEfNuVtmBRNeRtaq5enSl1D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 04/01/2018 01:14, Doug Goldstein wrote:
> On 1/3/18 6:15 PM, Andrew Cooper wrote:
>> Contemporary processors are gaining Indirect Branch Controls via micro=
code
>> updates.  Intel are introducing one bit to indicate IBRS and IBPB supp=
ort, and
>> a second bit for STIBP.  AMD are introducing IPBP only, so enumerate i=
t with a
>> separate bit.
> s/IPBP/IBPB/ no? Still getting caught up here so I could certainly be w=
rong.

Correct.=C2=A0 I'll add this to the fixup list.

I've lost count of how many times I've mis-typed or mixed these two
initialisms up :(

~Andrew


--0yK2px1vk3yEfNuVtmBRNeRtaq5enSl1D--

--xkSHUuglNive3tCsCm6RskB2wIcpi26O1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)

iQIcBAEBAgAGBQJaTYCCAAoJEGXD+Qal15+ggoAQAJ+w6F9XhL05AgFDFZd4rZFm
OxFrOvOZSSDjUTwIu878B9cN4CAgPt86tq/m8xDRoYS8KKGFYTDj3TPWBrnaw+fz
aJuwA8Xq+bqFZnD1lTUAmzqfhk3w9rA7JqttbmKNFNmyKk2YJndtekSy8X2xoba+
BOTFfab9Xg6Cioc8TZaveRC19dL7anWcqvveZkhC0tbkqXC1oxGkpR0g8qatru5o
6oXHt1M1ekLnbcjr/8rlurS/NZBKYqx5pMIRlY3ix2OTuV4JOB27G30oYfhNCavc
l/ukKhowF81ZKd13KZ8D7v5VeAPQCnpSHQMRignpMdXG7Y//d04tVEV9AeQ5YIgm
JhtKcmFq0SWb/3dBt0dVtwAACpbJpXRw2RMDg1/vyeO16km6J/Ncpxb8tr7wiC0H
ZgkDy0DGPsgtWUX8i7sxKP7Uu3PJvEq/z7uTBlg3JCgnTM4Wj/m3BBuD8YX3+7sN
lQIO8Q9kvA4p3/F88/SmSyEKvE36v41Oy7kLwc273MeOxo2rePuydFv9bMMDYJee
69WZ/DBRVdOPRDcZ89vzjCXsryiMvAM0UI10Cdwu0X7D1JtwnqnDrqM7lwGNitmM
Yv/OJ2uKz/pWs2fdBkKqezDwYWi5VMx2EfTP1eh+EL3IUxyGyB1rZkA2wRIsz1Vg
vjO7wmwbDuLLO+5hSKQI
=zoz+
-----END PGP SIGNATURE-----

--xkSHUuglNive3tCsCm6RskB2wIcpi26O1--


--===============4256768536870115911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4256768536870115911==--
