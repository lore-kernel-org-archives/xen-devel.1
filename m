From: Olaf Hering <olaf@aepfle.de>
Subject: memory leak in block/xen_disk in qemu-3.x
Date: Tue, 11 Dec 2018 16:30:47 +0100
Message-ID: <20181211153047.GB18447@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5066653322325258320=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t2nM=OU=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gWjzr-0002W2-7H
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 15:30:55 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
List-Id: xen-devel@lists.xenproject.org


--===============5066653322325258320==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

What are the live time rules of ioreq->buf?

In my testing the memory usage of qemu is constantly growing from about
250MB to several GB after a few days.

Some debugging shows that ioreq_runio_qemu_aio() overwrites ioreq->buf,
which contributes to the leak. In addition, ioreq_reset() also just
globbers iorew->buf. While this was observed with a backport of xen_disk
changes to qemu-2.9, the code in xen_disk.c did not change in this
regard. I changed the code to call qemu_vfree(ioreq->buf) in the few
places that globber the pointer, that fixes the leak for me.

Right now neither qemu-3.0 nor 3.1 for me, so I can not test
qemu.git#master if it eventually behaves different than
qemu.git#stable-2.9+backport.

Olaf

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXA/YJQAKCRBdQqD6ppg2
flJmAKCgJg3Pwe/+iJOGnJ+k7JBe/ZRmTACeIqEF7lhpQ2PtBti0q4o6q0XRVMA=
=ds9E
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--


--===============5066653322325258320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5066653322325258320==--
