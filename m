From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Thu, 14 Mar 2019 12:58:36 +0100
Message-ID: <20190314125836.00218661.olaf@aepfle.de>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7826505389184433518=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6KDy=RR=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h4P0d-0003T7-Q2
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 11:58:52 +0000
In-Reply-To: <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============7826505389184433518==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/pD3G1R1mFcAb5.ZiE8B_6_z"; protocol="application/pgp-signature"

--Sig_/pD3G1R1mFcAb5.ZiE8B_6_z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 13 Mar 2019 03:18:39 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> The discontinuity is still there, and so far you've failed to explain
> why a discontinuity is what you want here.

In v12 you asked for some data about the ranges. With new data the ranges a=
re:

2.20GHz 29khz
2.30GHz 105khz
2.40GHz 3524khz
2.50GHz 114khz

There are 5 systems in total in the 2.3/2.4/2.5 classes that have a much hi=
gher frequency, making the total range 15382/6052/19179.
I have to check what these runaway values mean.

The total range within the ntp.drift file is -71.138..345.942 for >2000 hos=
ts.

I will see if any experiments can be done on the hosts which are on the edg=
e of a frequency change. Would be nice to know if ntpd can cope with tsc_mo=
de=3Dnative for example when a domU is migrated from one to the other.

Olaf

--Sig_/pD3G1R1mFcAb5.ZiE8B_6_z
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIpB7AAKCRBdQqD6ppg2
ftmXAKDO6tzYPw54hi7QHNEUD/J0M92AGQCglZ/AqVTh/OQ3wnJxJNxTBDzVMrs=
=h6lU
-----END PGP SIGNATURE-----

--Sig_/pD3G1R1mFcAb5.ZiE8B_6_z--


--===============7826505389184433518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7826505389184433518==--
