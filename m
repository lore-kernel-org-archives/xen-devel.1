From: Olaf Hering <olaf@aepfle.de>
Subject: bogus libxl error handling in domcreate_bootloader_done
Date: Thu, 28 Feb 2019 14:17:18 +0100
Message-ID: <20190228141718.7740e706.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5308063272415603519=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JJzu=RD=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gzLZ4-0003Ym-Bv
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 13:17:31 +0000
Received: from sender by smtp.strato.de (RZmta 44.13 AUTH)
 with ESMTPSA id C046b5v1SDHRFtx
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Thu, 28 Feb 2019 14:17:27 +0100 (CET)
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

--===============5308063272415603519==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/GRf+IhQlEtubmn/hBssdt01"; protocol="application/pgp-signature"

--Sig_/GRf+IhQlEtubmn/hBssdt01
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

In domcreate_bootloader_done, libxl__build_pre is called.
If that function fails, the label 'out:' is called, which goes straight int=
o=20
domcreate_stream_done. This function uses srs->dcs to set libxl__domain_cre=
ate_state.
In my case ->dcs is NULL. The result is a crash in STATE_AO_GC().

How can this be fixed properly?

Olaf

--Sig_/GRf+IhQlEtubmn/hBssdt01
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXHffXwAKCRBdQqD6ppg2
fiJeAJ95tWQILaNqMYgWegL92ApkdCShqQCgj3JjDv1/82YGLegnuuArEj3Zezk=
=1vzG
-----END PGP SIGNATURE-----

--Sig_/GRf+IhQlEtubmn/hBssdt01--


--===============5308063272415603519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5308063272415603519==--
