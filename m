From: Olaf Hering <olaf@aepfle.de>
Subject: migration regression in xen-4.11 and qemu-2.11 and qcow2
Date: Mon, 7 May 2018 17:19:47 +0200
Message-ID: <20180507151940.GA31926@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2530843129493773213=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============2530843129493773213==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I assume OSS test does not test realworld live migration,
therefore the following regression remained unnoticed:

name="hvm"
builder="hvm"
memory=555
vcpus=4
serial="pty"
boot="c"
disk=[ 'qcow2:/nfs/vdisk.qcow2,hda,w', ]
device_model_version="qemu-xen"

xl create -cf hvm.cfg
sleep N
xl migrate hvm $host

On $host the domU becomes unusable, qemu reports:
xen be: qdisk-768: xen be: qdisk-768: error: Failed to get "write" lock

With qemu-2.10 the sender noticed the error somehow, and migration was aborted:
qemu-system-i386: Failed to get "write" lock

With qemu-2.11 the sender thinks everything is alright and the domU is moved.

What I gathered during debugging so far is that somehow qemu on the receiving side locks a region twice:

2018-05-07T09:49:45.810930Z qemu-system-i386: qemu_lock_fcntl: 39 c9 1 F_UNLCK>F_UNLCK 0 Success
2018-05-07T09:49:45.813717Z qemu-system-i386: qemu_lock_fcntl: 39 c9 1 F_RDLCK>F_RDLCK 0 Success
2018-05-07T09:49:45.814591Z qemu-system-i386: qemu_lock_fd_test: 39 c9 1 F_WRLCK>F_RDLCK 0 Success
raw_check_lock_bytes: fcntl on 39 returned -11/0

I do not know how raw_apply_lock_bytes() is supposed to be used. In its current form it does not work.
Anyone else seeing this?

Olaf

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWvBuiQAKCRBdQqD6ppg2
fuKxAJwPzOZGm7vqwPmlFE8dMy4BXwfbeQCg4ur5nLmPOONqwki8G/vd4nUyx2Y=
=Cv/q
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--


--===============2530843129493773213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2530843129493773213==--
