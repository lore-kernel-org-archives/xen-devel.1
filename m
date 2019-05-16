From: Olaf Hering <olaf@aepfle.de>
Subject: domains do not shutdown properly with current staging
Date: Thu, 16 May 2019 11:15:14 +0200
Message-ID: <20190516111514.79e72bfc.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7530347285053595090=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZPM6=TQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hRCTw-0006Uf-Qs
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 09:15:21 +0000
Received: from sender by smtp.strato.de (RZmta 44.20 AUTH)
 with ESMTPSA id U080cav4G9FGDuO
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Thu, 16 May 2019 11:15:16 +0200 (CEST)
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

--===============7530347285053595090==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/iswCVZqbS3LNdAZxP4m.zOx"; protocol="application/pgp-signature"

--Sig_/iswCVZqbS3LNdAZxP4m.zOx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

While preparing the recent b_info->device_model_version change all my testi=
ng
went fine. But now with "2019-05-15 16:19:57 +0100 git:2a556b63a2" all domUs
(PV/HVM with and without device model) do not finish shutdown:

Name                           ID   Mem VCPUs   State   Time(s)
Domain-0                        0  3072     4     r-----     253.0
pv_sle12sp2_c_qcow2             1   888     2     --ps--      82.9
pv_sle12sp2_c_raw               2   888     2     --ps--      86.8
fv_sle12sp2_c_raw               3   880     1     --ps--      20.8
fv_sle12sp2_c_qcow2             4   880     1     --ps--     150.9

Is anyone else seeing that?

Olaf

--Sig_/iswCVZqbS3LNdAZxP4m.zOx
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN0qIgAKCRBdQqD6ppg2
fnjzAJ9CC/gYgiymUADH2kanVUWKuR4KIwCeKkx2PALuURjEw53HFKZxT2OSBRc=
=Sbz4
-----END PGP SIGNATURE-----

--Sig_/iswCVZqbS3LNdAZxP4m.zOx--


--===============7530347285053595090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7530347285053595090==--
