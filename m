From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v11] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Thu, 13 Dec 2018 14:25:59 +0100
Message-ID: <20181213142559.78a19242.olaf@aepfle.de>
References: <20181212152056.20480-1-olaf@aepfle.de>
 <5C1139BD0200007800205934@prv1-mh.provo.novell.com>
 <20181213091845.54212b83.olaf@aepfle.de>
 <5C121C330200007800205BC8@prv1-mh.provo.novell.com>
 <20181213100442.3510b91b.olaf@aepfle.de>
 <5C1237680200007800205C8C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8908011377290823766=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AwXq=OW=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gXR0E-0005Fo-DI
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 13:26:11 +0000
In-Reply-To: <5C1237680200007800205C8C@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============8908011377290823766==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/CEtqqQt=kBNVZ7ikfKyAUxN"; protocol="application/pgp-signature"

--Sig_/CEtqqQt=kBNVZ7ikfKyAUxN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 13 Dec 2018 03:41:44 -0700
schrieb "Jan Beulich" <JBeulich@suse.com>:

> And further argumentation that everyone is using NTP anyway
> doesn't make it any better, when it's no-where written down that
> Xen is unusable with NTP running in all guests (I'm exaggerating
> here just to get the point over). Don't forget that e.g. with
> XenoLinux'es independent-wallclock setting defaulting to false, we've
> been suggesting that people _don't_ need to use NTP inside their
> (admittedly PV) guests. IOW - your change may not break people
> not using NTP. Hence I don't think the mode you introduce can be
> a default-on one, which in turn means a per-domain or at least
> global enable control is needed (as over previous iterations we
> seem to have been agreeing).

Regarding the possible unexpected drift if NTP is not used, and the domU
uses TSC as clocksource anyway: If one host is on one edge of the assumed
cpu_khz value and the other host is on the opposite edge, and the range
will be 200 as it is in my patch, the daily drift on a 2.3GHz host would
be 7.4seconds per day. This number is based on the fact that 200kz happen
within a time span of 86us, which I think is correct.

The question is, how much drift can be tolerated even without my patch.
Looking through 5 different hosts I use, the range is between -11 and +22,
and it happens to be +56 on my Laptop. So even that host with a calculated
drift of +22 would be off by 2 seconds per day if ntpd would not run.


Olaf

--Sig_/CEtqqQt=kBNVZ7ikfKyAUxN
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXBJd6AAKCRBdQqD6ppg2
fqSYAJ9rkHmAUVlKF5YURzD1lPOA9/F8mQCfegTNB29bxY2TSplWLrjEoBvW+IQ=
=p2ns
-----END PGP SIGNATURE-----

--Sig_/CEtqqQt=kBNVZ7ikfKyAUxN--


--===============8908011377290823766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8908011377290823766==--
