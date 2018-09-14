From: Olaf Hering <olaf@aepfle.de>
Subject: stale hypervisor info in HVM after migration
Date: Fri, 14 Sep 2018 10:29:07 +0200
Message-ID: <20180914102907.1337e33b.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6712307743307869991=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rwbv=l4=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1g0jTY-0006Uq-0c
 for xen-devel@lists.xenproject.org; Fri, 14 Sep 2018 08:29:16 +0000
Received: from sender by smtp.strato.de (RZmta 44.1 AUTH)
 with ESMTPSA id j00953u8E8TC2xt
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Fri, 14 Sep 2018 10:29:12 +0200 (CEST)
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

--===============6712307743307869991==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/fHM4NwEOJbdj2IbQOXvkZgQ"; protocol="application/pgp-signature"

--Sig_/fHM4NwEOJbdj2IbQOXvkZgQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

During boot of a HVM domU, the running hypervisor ist recorded in DMI and d=
mesg:

crash> dmesg | grep -m1 Xen
[    0.000000] DMI: Xen HVM domU, BIOS 4.7.2_02-36.1.1284 08/28/2017

But after migration to another host, that info is not updated.
Is there a chance to update that info in the kernels "resume" path?
It would probably be ok to just do a printk in case DMI is a static string.


Olaf

--Sig_/fHM4NwEOJbdj2IbQOXvkZgQ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW5txUwAKCRBdQqD6ppg2
fjf9AKCr+M/d5tQdp7i4ybghXxPXAWBZxgCgx7rrNUrtDo2j0gmdBUfMJiLzsjQ=
=1Y8v
-----END PGP SIGNATURE-----

--Sig_/fHM4NwEOJbdj2IbQOXvkZgQ--


--===============6712307743307869991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6712307743307869991==--
