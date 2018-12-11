From: Olaf Hering <olaf@aepfle.de>
Subject: Re: qemu assert in staging during HVM live migration
Date: Tue, 11 Dec 2018 16:07:35 +0100
Message-ID: <20181211160735.4e583d6e.olaf@aepfle.de>
References: <20181122100344.GA13748@aepfle.de>
 <20181123155449.GB6902@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3055835105542796116=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t2nM=OU=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gWjdT-0007l5-CL
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 15:07:48 +0000
In-Reply-To: <20181123155449.GB6902@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============3055835105542796116==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/7LawByRU8NwtiJuhDw3kZX6"; protocol="application/pgp-signature"

--Sig_/7LawByRU8NwtiJuhDw3kZX6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 23 Nov 2018 15:54:49 +0000
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> On Thu, Nov 22, 2018 at 11:03:45AM +0100, Olaf Hering wrote:
> > qemu-system-i386: block/block-backend.c:903: blk_get_attached_dev_id: A=
ssertion `!blk->legacy_dev' failed.
> xen-disk (qdisk) is currently using legacy stuff in QEMU, and this
> legacy stuff is going to disappear. Paul have a patch series to
> modernise it:

This assert triggers also without migration.

Do we want to get this fixed for qemu-3.1.0 and perhaps qemu-3.0.1, or shal=
l we declare both broken until the mentioned series is eventually applied?

Olaf

--Sig_/7LawByRU8NwtiJuhDw3kZX6
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXA/StwAKCRBdQqD6ppg2
fptnAJ0WOHtlFYRafjPBk4zXY1tM5AfibwCbBTjhCGaqY6sly9wNqSQSaZIsZ+Q=
=sdpR
-----END PGP SIGNATURE-----

--Sig_/7LawByRU8NwtiJuhDw3kZX6--


--===============3055835105542796116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3055835105542796116==--
