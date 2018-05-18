From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] libxl: always call qemus
 xen-save-devices-state in suspend/resume
Date: Fri, 18 May 2018 21:09:10 +0200
Message-ID: <20180518210910.02c83631.olaf@aepfle.de>
References: <20180517155108.4624-1-olaf@aepfle.de>
 <20180518170142.5q2773ivsfjt2b4y@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7071209978669386239=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180518170142.5q2773ivsfjt2b4y@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

--===============7071209978669386239==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/tXmc0M5+b.tEAWhBIDdX7Bc"; protocol="application/pgp-signature"

--Sig_/tXmc0M5+b.tEAWhBIDdX7Bc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 18 May 2018 18:01:42 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> You don't need to test if the guest is HVM anymore. You only need to
> know if QEMU upstream is running.

libxl__domain_suspend_device_model handles qemu-xen and qemu-xen-trad.
That function can not be called unconditionally I think.
Perhaps I should adjust the commit message.


Olaf

--Sig_/tXmc0M5+b.tEAWhBIDdX7Bc
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWv8k1gAKCRBdQqD6ppg2
fhiHAJ0eaocQylVRBjpekLBzTT4yt9n6PgCgxKqslk0gBQgvrtlUKZOeP7y0MvM=
=+0kY
-----END PGP SIGNATURE-----

--Sig_/tXmc0M5+b.tEAWhBIDdX7Bc--


--===============7071209978669386239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7071209978669386239==--
