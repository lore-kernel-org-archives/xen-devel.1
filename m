From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: sidecar (hvm shim) creation script
Date: Wed, 10 Jan 2018 10:51:16 -0600
Message-ID: <2a9a85fc-c1ba-59cb-d082-3a420ff28d1d@cardoe.com>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <20180109194351.mmbmjzwhptlkr5as@citrix.com>
 <20180110083224.cmgr7flxewhx5enf@MacBook-Pro-de-Roger.local>
 <20180110122734.rgut34iw6ltqeipy@citrix.com>
 <23126.4117.777031.227394@mariner.uk.xensource.com>
 <20180110131049.rv6emm32efbczhl2@citrix.com>
 <23126.11606.582758.38945@mariner.uk.xensource.com>
 <23126.13224.18254.699605@mariner.uk.xensource.com>
 <23126.13380.315656.733601@mariner.uk.xensource.com>
 <23126.15979.598837.115758@mariner.uk.xensource.com>
 <a7453eb3-9e52-791a-bb87-50ce9c383f24@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5830510661796338635=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=3dgs=ef=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1eZJb1-0001eL-VY
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 16:51:24 +0000
Received: by mail-yb0-x236.google.com with SMTP id b132so4490860yba.5
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2018 08:51:22 -0800 (PST)
In-Reply-To: <a7453eb3-9e52-791a-bb87-50ce9c383f24@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, committers@xenproject.org, security@xenproject.org, Jan Beulich <JBeulich@suse.com>, Dario Faggioli <raistlin@linux.it>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5830510661796338635==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="PiRTSi6ppSxjhFd1PefNMV9Y8PNOeXKZ3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PiRTSi6ppSxjhFd1PefNMV9Y8PNOeXKZ3
Content-Type: multipart/mixed; boundary="PcHyFizYSLu3KchGVG1GEtXquXMPbPpTp";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, committers@xenproject.org,
 security@xenproject.org, Jan Beulich <JBeulich@suse.com>,
 Dario Faggioli <raistlin@linux.it>
Message-ID: <2a9a85fc-c1ba-59cb-d082-3a420ff28d1d@cardoe.com>
Subject: Re: [Xen-devel] sidecar (hvm shim) creation script
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <20180109194351.mmbmjzwhptlkr5as@citrix.com>
 <20180110083224.cmgr7flxewhx5enf@MacBook-Pro-de-Roger.local>
 <20180110122734.rgut34iw6ltqeipy@citrix.com>
 <23126.4117.777031.227394@mariner.uk.xensource.com>
 <20180110131049.rv6emm32efbczhl2@citrix.com>
 <23126.11606.582758.38945@mariner.uk.xensource.com>
 <23126.13224.18254.699605@mariner.uk.xensource.com>
 <23126.13380.315656.733601@mariner.uk.xensource.com>
 <23126.15979.598837.115758@mariner.uk.xensource.com>
 <a7453eb3-9e52-791a-bb87-50ce9c383f24@citrix.com>
In-Reply-To: <a7453eb3-9e52-791a-bb87-50ce9c383f24@citrix.com>

--PcHyFizYSLu3KchGVG1GEtXquXMPbPpTp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/10/18 10:36 AM, George Dunlap wrote:
> On 01/10/2018 04:25 PM, Ian Jackson wrote:
>> Draft README.
>>
>> My git branch is bere
>>    xenbits.xen.org:/home/iwj/ext/xen.git#wip.sidecar
>>
>> (This contains the converter script too.  The git history is not very
>> useful and the files are in the wrong place, but I needed somewhere to=

>> do my work.)
>>
>> Ian.
>>
>>
>>                 PV-in-HVM shim with "sidecar" ISO
>>                 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Summary
>> -------
>>
>> This README describes a mitigation strategy for Meltdown.
>>
>> The basic principle is to run PV guests (which can read all of host
>> memory due to the hardware bugs) as HVM guests (which cannot, at least=

>> not due to Meltdown).  The PV environment is still provided to the
>> guest by an embedded copy of Xen, the "shim".
>>
>>
>> Properties of this approach
>> ---------------------------
>=20
> What about "Who should use this approach"?
>=20
> You might consider this approach if:
>=20
> - You want to deploy a fix immediately
> - You can't, or would like to avoid, updating to Xen 4.8 or newer
> - You can:
>  - Run a script to modify each domain config
>  - Afford an extra 80MiB per guest
>  - Tolerate having an extra QEMU around
> - You don't need migration, memory ballooning, vcpu hotplug, or guest
> console

Didn't Ian get guest console working in v2 of his script? Didn't Anthony
get memory ballooning working in v3 of Vixen?

--=20
Doug Goldstein


--PcHyFizYSLu3KchGVG1GEtXquXMPbPpTp--

--PiRTSi6ppSxjhFd1PefNMV9Y8PNOeXKZ3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpWRIRfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl1bJg//TTp5xyaJWiB5md394439FF3m13H9rJmYoE63zif6tyPEZ/NRM28kmqtm
BE9SQgaNWJ2g4T3fJPvc7FJ2805btykRA6kDwvrtVe24y0E+Snf9px3bH2iNcEWx
xPviUD/Iiy/aAe7ItuXnK+6ykjuRZRuhow5A3wjRSBSqbApv3vD6n50t9H54r/4w
6bxV/DZTTTA09c96BLXi2+2Uw0uLimUnpivbGoukH4Hk6+4z+7WpaGRVPTLIMM08
LJUgi+96rAP9Rog41RmoUyuFjh9mIIH71eQSRgF3gynseShV/P9E3uqkmIF6QvNG
kSO/GmeUYGX8I3VLaKeBxVj5HI4gTVoc/3KDZshb6F2P77DGScV1B5BOYmR1tjMD
SVx3Tcw49+8jJtvGpsYTKUDGXG4oQeDHoVEnru8exDHNmw1GlLBV2jyAXoHvWQNa
Gd1X4SnkiSHdN/wwsnVf6z1eTErS34okq/oFTpZu8wKpe7tCVOsFcwyj2uiEM+TC
91aESlaIhHpQc0/FOtEw0mzISl32r8yPwYF+eJe29JS5oOhQ7wss81AFuFFpxBcN
dKGTV8ezRGo6+NU4FBZ0LiumuetjuYxfvbiz8HeNXGprOxFEL20wSonPhPjOyNNz
gmycEt9q5MC56lxItNSb/T8xnYvW9WTJxgixskWtmJH+3LyFvgk=
=Gcpx
-----END PGP SIGNATURE-----

--PiRTSi6ppSxjhFd1PefNMV9Y8PNOeXKZ3--


--===============5830510661796338635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5830510661796338635==--
