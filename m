From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v13] tolerate jitter in cpu_khz calculation
 to avoid TSC emulation
Date: Wed, 13 Mar 2019 17:02:02 +0100
Message-ID: <20190313170202.20f8bc75.olaf@aepfle.de>
References: <20190313082855.14106-1-olaf@aepfle.de>
 <5C88CAEF020000780021DFA6@prv1-mh.provo.novell.com>
 <20190313145144.64b0f9fd.olaf@aepfle.de>
 <5C891584020000780021E2C0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6755165898999293148=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3/bD=RQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h46KW-0001Oj-HZ
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2019 16:02:09 +0000
In-Reply-To: <5C891584020000780021E2C0@prv1-mh.provo.novell.com>
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

--===============6755165898999293148==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/hw8gEPmjB1DP4G8=ExPoRN_"; protocol="application/pgp-signature"

--Sig_/hw8gEPmjB1DP4G8=ExPoRN_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 13 Mar 2019 08:36:52 -0600
schrieb "Jan Beulich" <JBeulich@suse.com>:

> Why is there this big step between 199 and 200? And why does an
> initial value of 200 get handled the same as an initial value of 0, but
> then 400 doesn't get handled this same way again? And (seeing the
> last row I've added now) how is the result staying in range?

Well, capping the PPM-to-khz value may not work anyway as outlined in the
other email about missing 'drift'. We may just leave that PPM value as is,
or reduce it upfront by a certain amount. Since right now the real drift
is not considered, the plain 500PPM may work or not in the worst case.

I will think about if and how drift should be part of the picture.

Olaf

--Sig_/hw8gEPmjB1DP4G8=ExPoRN_
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXIkpegAKCRBdQqD6ppg2
fo39AKCGnfAV1kC1IdxFtGDXUuHM6jaY2gCgkarQ9//99SS3gMrsCHUe9dW0+8g=
=fGR/
-----END PGP SIGNATURE-----

--Sig_/hw8gEPmjB1DP4G8=ExPoRN_--


--===============6755165898999293148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6755165898999293148==--
