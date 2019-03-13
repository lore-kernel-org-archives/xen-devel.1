From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Wed, 13 Mar 2019 14:51:44 +0100
Message-ID: <20190313145144.64b0f9fd.olaf@aepfle.de>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6013026605966256458=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3/bD=RQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h44IT-0004Fk-GG
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 13:51:53 +0000
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

--===============6013026605966256458==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/e0LvceoGG+CqWMtjHjFQCSS"; protocol="application/pgp-signature"

--Sig_/e0LvceoGG+CqWMtjHjFQCSS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 13 Mar 2019 03:18:39 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> > +    if ( tmp >=3D VTSC_MEASUREMENT_INACCURACY_RANGE_KHZ )
> > +        tmp -=3D VTSC_MEASUREMENT_INACCURACY_RANGE_KHZ; =20
> The discontinuity is still there, and so far you've failed to explain
> why a discontinuity is what you want here.

This exists to make sure the non-emulated case stays within the PPM range.

But there is one more aspect to it that was not mentioned or covered:

The cpu_khz value used by Xen and its equivalent in dom0 or domU is just
a base frequency. ntpd will calculate the drift based on the external
source. That drift I think is what the PPM value is really all about.

If some frequency was measured and ntpd calculated some drift that is
close but not beyond the limit, then it can adjust the system clock as
needed. Once that domU is migrated to another, equally inaccurate host
Xen may decide that its cpu_khz value and the value expected by the domU
is still within the assumed PPM limit. As a result the time within the
domU may advance now in a slightly different speed, which is outside
that PPM limit. Now ntpd would stop synchronizing the system clock.
The correct action would be to emulate. But, Xen has no info at all what
the drift of its own clock actually is. All it has is that cpu_khz thing.

So ideally next to that cpu_khz value should be the drift value of a
given host to allow calculation of the real frequency. That frequency
will still vary to some degree according to various docs, but it would
be more accurate than the current cpu_khz value. If Xen had such feature
it would be in a better position to compare the frequency of two hosts.

In my case for example, if both of my hosts report an identical cpu_khz,
the ntp.drift file is 22 for one host and 4 for the other. So the real
frequency does actually differ.

Olaf

--Sig_/e0LvceoGG+CqWMtjHjFQCSS
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIkK8AAKCRBdQqD6ppg2
flY5AJ4s1K+m0NrcTBa4RXa6R+VWkhQvtwCgt0QCM27jZKv+Xg6wE9ufx7x8Bog=
=jIgR
-----END PGP SIGNATURE-----

--Sig_/e0LvceoGG+CqWMtjHjFQCSS--


--===============6013026605966256458==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6013026605966256458==--
