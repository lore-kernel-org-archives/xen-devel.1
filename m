From: Olaf Hering <olaf@aepfle.de>
Subject: status of non-live migration of HVM with libvirt
Date: Fri, 4 Jan 2019 16:57:55 +0100
Message-ID: <20190104165755.73674a27.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7715162471871256987=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=14Bd=PM=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gfRrJ-0003kl-VJ
 for xen-devel@lists.xenproject.org; Fri, 04 Jan 2019 15:58:06 +0000
Received: from sender by smtp.strato.de (RZmta 44.9 AUTH)
 with ESMTPSA id 20a457v04Fw21ro
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Fri, 4 Jan 2019 16:58:02 +0100 (CET)
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

--===============7715162471871256987==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/0jvGkc0q0etjuaKW1QxwRh."; protocol="application/pgp-signature"

--Sig_/0jvGkc0q0etjuaKW1QxwRh.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

With 'xl migrate' the migration is always live, while 'virsh migrate' will =
do an offline migration unless '--live' is used. Such non-live migration wi=
ll break with HVM because the sending side does not seem to unlock the qcow=
2 image.

I wonder if its worth keeping (and fixing) the concept of an "offline migra=
tion", or if libvirt should be changed to either require '--live' or silent=
ly always do live migrations.

Olaf

--Sig_/0jvGkc0q0etjuaKW1QxwRh.
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXC+CgwAKCRBdQqD6ppg2
fgJ3AJ9xZrDLcUnstlxXsfLHqVqNGYgeYQCbBxJWfVUa9Um2feE/zrVoN7t/oZ4=
=kiNd
-----END PGP SIGNATURE-----

--Sig_/0jvGkc0q0etjuaKW1QxwRh.--


--===============7715162471871256987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7715162471871256987==--
