From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] libxl: fix migration of PV and PVH domUs
 with and without qemu
Date: Fri, 12 Apr 2019 10:01:37 +0200
Message-ID: <20190412100137.22a6a3ec.olaf@aepfle.de>
References: <20190410103338.5456-1-olaf@aepfle.de>
 <20190411155602.GL1435@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0974651229378493655=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UqIg=SO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hEr89-0005oD-W9
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 08:01:50 +0000
In-Reply-To: <20190411155602.GL1435@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

--===============0974651229378493655==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/=a=EhyE3mgKG.QHG=su1j2n"; protocol="application/pgp-signature"

--Sig_/=a=EhyE3mgKG.QHG=su1j2n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 11 Apr 2019 16:56:02 +0100
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> I haven't managed to reproduce this, but this bug will go away with
> QEMU 4.0. The backend in QEMU 4.0 will not lock the disk image anymore.

I also have a hard time to reproduce it myself, but QA gave me a hard time.

Are you saying it is not required to fix it anymore in libxl now that QEMU =
may eventually fix it?

Is it ok for libxl to internally lie about the device_model requirement (no=
ne vs. qemu)?

Is it ok to leave this unfixed in released branches?

Olaf

--Sig_/=a=EhyE3mgKG.QHG=su1j2n
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXLBF4QAKCRBdQqD6ppg2
fl7mAJ9BWgwoO2dlerPQRPsLnyYC8emjhQCdEgVlvd66aTjjt9cV7q+Z+VzVP/w=
=YdLj
-----END PGP SIGNATURE-----

--Sig_/=a=EhyE3mgKG.QHG=su1j2n--


--===============0974651229378493655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0974651229378493655==--
