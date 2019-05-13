From: Olaf Hering <olaf@aepfle.de>
Subject: how to disable build of pv-shim?
Date: Mon, 13 May 2019 16:53:21 +0200
Message-ID: <20190513165321.464fdeaf.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7063945855679213062=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RcTn=TN=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQCKT-0004lh-Qu
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:53:26 +0000
Received: from sender by smtp.strato.de (RZmta 44.20 AUTH)
 with ESMTPSA id U080cav4DErM1zZ
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Mon, 13 May 2019 16:53:22 +0200 (CEST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============7063945855679213062==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/gb3gwfFXVCmFwb5OU5uUADn"; protocol="application/pgp-signature"

--Sig_/gb3gwfFXVCmFwb5OU5uUADn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

What is the recommended way to disable CONFIG_PV_SHIM, which is set in
tools/firmware/Makefile? From my understanding there is no way to influence
its value from outside, which means the build always enters xen-dir/.


Olaf

--Sig_/gb3gwfFXVCmFwb5OU5uUADn
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNmE4QAKCRBdQqD6ppg2
fq+PAJ9I82ieoKoc4vZkTNqQlXOPB3LsCgCgrz+OozqKVcgF9YQFAvzsfYh/MT4=
=DvL+
-----END PGP SIGNATURE-----

--Sig_/gb3gwfFXVCmFwb5OU5uUADn--


--===============7063945855679213062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7063945855679213062==--
