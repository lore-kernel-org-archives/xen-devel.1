From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2] xl: free bitmaps on exit
Date: Wed, 28 Nov 2018 09:29:37 +0100
Message-ID: <20181128092937.31ec88f9.olaf@aepfle.de>
References: <20181127100608.4197-1-olaf@aepfle.de>
 <20181127165538.7xglqre6psla42kq@zion.uk.xensource.com>
 <20181127180933.5fe93cec.olaf@aepfle.de>
 <20181127171906.2okpiqidqp3alvsr@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4525935981042837298=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ou13=oh=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gRvE7-00031n-ET
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 08:29:44 +0000
In-Reply-To: <20181127171906.2okpiqidqp3alvsr@zion.uk.xensource.com>
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

--===============4525935981042837298==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/ma0xWIC28TQA8yWd/n8=v1D"; protocol="application/pgp-signature"

--Sig_/ma0xWIC28TQA8yWd/n8=v1D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 27 Nov 2018 17:19:06 +0000
schrieb Wei Liu <wei.liu2@citrix.com>:

> The other option -- to call atexit right after -- looks plausible to me.

After looking through main(), moving the atexit() seems safe to me.

Olaf

--Sig_/ma0xWIC28TQA8yWd/n8=v1D
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW/5R8QAKCRBdQqD6ppg2
ft3BAJwIpc5QWRg8D3wt+J7tiAecVPfE1ACghWxq1CvfYzMNLd2ncAOkAoVkC1c=
=0Qpz
-----END PGP SIGNATURE-----

--Sig_/ma0xWIC28TQA8yWd/n8=v1D--


--===============4525935981042837298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4525935981042837298==--
