From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] libxl: prepare environment for
 domcreate_stream_done
Date: Fri, 8 Mar 2019 10:22:18 +0100
Message-ID: <20190308102218.1276adb8.olaf@aepfle.de>
References: <20190307105649.8919-1-olaf@aepfle.de>
 <20190307110247.xrex66v2z4kvpqdp@zion.uk.xensource.com>
 <20190307125338.253995f8.olaf@aepfle.de>
 <20190307121820.x5smx4njc4pn6srh@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6705209832969708894=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bKkW=RL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1h2Bi2-0006Jr-Ca
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 09:22:30 +0000
In-Reply-To: <20190307121820.x5smx4njc4pn6srh@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============6705209832969708894==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/M5V_Qa/72hG4.2rWj=X1mnq"; protocol="application/pgp-signature"

--Sig_/M5V_Qa/72hG4.2rWj=X1mnq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 7 Mar 2019 12:18:20 +0000
schrieb Wei Liu <wei.liu2@citrix.com>:

> That code has been changed quite a bit with migration v2 and COLO. I
> wouldn't be surprised if some code becomes stale.

Are you ok with just moving that assignment up to avoid the crash?
This should be backported to at least 4.10, older branches need that too.
A thoroughly review can still be done later.

Olaf

--Sig_/M5V_Qa/72hG4.2rWj=X1mnq
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXII0SgAKCRBdQqD6ppg2
fhsWAKCjUnNCa9Kr6M20XD6pR2cVshEzcQCg2MIv9OTuSJP4b5SAVMa8jChyLh4=
=8iLC
-----END PGP SIGNATURE-----

--Sig_/M5V_Qa/72hG4.2rWj=X1mnq--


--===============6705209832969708894==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6705209832969708894==--
