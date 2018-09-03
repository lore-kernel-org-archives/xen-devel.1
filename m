From: Olaf Hering <olaf@aepfle.de>
Subject: tools/fuzz fails due build, osstest did not notice
Date: Mon, 3 Sep 2018 11:53:23 +0200
Message-ID: <20180903115323.616cc7f8.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7827336817637714274=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=eiaa=lr=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fwlY9-00074t-DE
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 09:53:38 +0000
Received: from sender by smtp.strato.de (RZmta 43.21 AUTH)
 with ESMTPSA id Q02f6au839rYQDh
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Mon, 3 Sep 2018 11:53:34 +0200 (CEST)
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

--===============7827336817637714274==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/UwM_/gV/Y9Tg_mTBPWSdo8_"; protocol="application/pgp-signature"

--Sig_/UwM_/gV/Y9Tg_mTBPWSdo8_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Since about two months staging fails to build because tools/fuzz can not co=
pe with CFLAGS=3D"-O2 -Wall  -fstack-protector-strong -funwind-tables -fasy=
nchronous-unwind-tables -fstack-clash-protection". While I can easily hide =
the bug by undefining _FORTIFY_SOURCE, I always wonder why osstest does not=
 catch such bugs?

Looking at some random build-amd64/6.ts-xen-build.log output, it seems no C=
FLAGS at all is set. I'm sure SUSE is not the only one that sets CFLAGS dur=
ing their package build, and further I think SUSE is not the only one who e=
nforces -D_FORTIFY_SOURCE=3D globally. So on that ground, shouldn't whateve=
r osstest does match what the consumers of xen use? Running osstest with th=
row-away-binaries compiled with -D_FORTIFY_SOURCE will likely not hurt or i=
nvalidate the overall coverage.

Olaf

--Sig_/UwM_/gV/Y9Tg_mTBPWSdo8_
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW40EkwAKCRBdQqD6ppg2
foWwAKCyPd8ftKbAG24m8dW+IeW3IRfgnACfTIj4Gct7dFOWOZ4TbUhL2xBUUGk=
=yyz5
-----END PGP SIGNATURE-----

--Sig_/UwM_/gV/Y9Tg_mTBPWSdo8_--


--===============7827336817637714274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7827336817637714274==--
