From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: sidecar (hvm shim) creation script
Date: Wed, 10 Jan 2018 17:08:47 -0600
Message-ID: <d113d4ce-3ee9-95b2-8f4e-77d0beef5674@cardoe.com>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <20180109194351.mmbmjzwhptlkr5as@citrix.com>
 <20180110083224.cmgr7flxewhx5enf@MacBook-Pro-de-Roger.local>
 <20180110122734.rgut34iw6ltqeipy@citrix.com>
 <23126.4117.777031.227394@mariner.uk.xensource.com>
 <20180110131049.rv6emm32efbczhl2@citrix.com>
 <23126.11606.582758.38945@mariner.uk.xensource.com>
 <23126.13224.18254.699605@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1027942215014826460=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=3dgs=ef=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1eZPUM-000213-7p
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 23:08:54 +0000
Received: by mail-yb0-x22d.google.com with SMTP id k189so291347ybc.12
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2018 15:08:52 -0800 (PST)
In-Reply-To: <23126.13224.18254.699605@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org, committers@xenproject.org, security@xenproject.org, Jan Beulich <JBeulich@suse.com>, Dario Faggioli <raistlin@linux.it>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1027942215014826460==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="iHhT6Ozi4zpIph9dAKnG2QGwoXvuojagE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iHhT6Ozi4zpIph9dAKnG2QGwoXvuojagE
Content-Type: multipart/mixed; boundary="MRK4lbuXxx9IP4Srl2DRFJ0HSf6V6CAK9";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, committers@xenproject.org,
 security@xenproject.org, Jan Beulich <JBeulich@suse.com>,
 Dario Faggioli <raistlin@linux.it>
Message-ID: <d113d4ce-3ee9-95b2-8f4e-77d0beef5674@cardoe.com>
Subject: Re: [Xen-devel] sidecar (hvm shim) creation script
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <20180109194351.mmbmjzwhptlkr5as@citrix.com>
 <20180110083224.cmgr7flxewhx5enf@MacBook-Pro-de-Roger.local>
 <20180110122734.rgut34iw6ltqeipy@citrix.com>
 <23126.4117.777031.227394@mariner.uk.xensource.com>
 <20180110131049.rv6emm32efbczhl2@citrix.com>
 <23126.11606.582758.38945@mariner.uk.xensource.com>
 <23126.13224.18254.699605@mariner.uk.xensource.com>
In-Reply-To: <23126.13224.18254.699605@mariner.uk.xensource.com>

--MRK4lbuXxx9IP4Srl2DRFJ0HSf6V6CAK9
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/10/18 9:39 AM, Ian Jackson wrote:
> Ian Jackson writes ("Re: sidecar (hvm shim) creation script"):
>> Here is the converter script where I just got my guest to boot with
>> the Vixen shim, as built and provided by Wei.
>=20
> And here is one which handles the guest console correctly.  Vixen
> sends the L2 guest console to the emulated serial, along with the
> shim's own output.
>=20
>=20

So, not that I don't like executing another language interpreter from
another language interpreter (insert yodawg meme here), but how would
you feel about a Python version? The system I'm currently dealing with
needs to import this code as a Python module so I figured I'd slap a
main() and some argparse on it and it should be good.

--=20
Doug Goldstein


--MRK4lbuXxx9IP4Srl2DRFJ0HSf6V6CAK9--

--iHhT6Ozi4zpIph9dAKnG2QGwoXvuojagE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQKTBAEBCgB9FiEE9hYXBLEKE2oJfXLwyIzUxt8kNl0FAlpWnP9fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEY2
MTYxNzA0QjEwQTEzNkEwOTdENzJGMEM4OENENEM2REYyNDM2NUQACgkQyIzUxt8k
Nl0W7Q//WSlF7rT+LiJHjz8zauQzOH2RkXQTlQHF9Rmf+R5OGSMxLZNK6Mh7ecrt
XKWhNJe0v59M6UdnEesBZWu4+s58vcgFed8ZwT9MXBWcNFHMVqL4bIgc87Ju4DVo
vzQyzFzqanGr1oBhewXWUEnZD/fbe78njfCvLLPzhoPnFbnW/ugIRVEzVQKCE4Ff
L6C+jT+46mIapqWhyzKDx7ispQGVu3v69uIe7OY0+uGcA45AmIK8tXyuPxI3+CM3
4Ozo3U1NqAtA15RkXp3fW16cabjZFD2U6PrYRwLf3tnEdamK27aQ8X8C8MBzDKZy
jm263MAYZno5xXGutP+QWGWBIXFNTRN2YucTSr8rccNtrx84OjZfbvqW/OYvCg7N
e0GKTha21TNgwI3fBrd/nM+Vhht19mpR/H/uHCYFnkngTjBFLUB8AczEeHwAIfYK
wtQthxFo05nflqWPE8Z1q1oRh4twuWTXq6apJ3RRGOuxpG7/tmtzGS9BJ3SLQAOZ
Eu0g+7iivUnCv5RhSsN+i7OKHxF4Ajko0ltD5wzEnlKD1ZBVutdc0G7ja5rs877i
gd/VAcj+T63M6WFWoAOzYfT2C95+toRTItJ90hj1YZGlU9ADZCuaV8iQ31Gc5HUq
EJp+gP4hQtwQWRFbM6ZdVYZHYWjVi24rVRAkwNMQ6aCaLd9SPiI=
=yMM/
-----END PGP SIGNATURE-----

--iHhT6Ozi4zpIph9dAKnG2QGwoXvuojagE--


--===============1027942215014826460==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1027942215014826460==--
