From: Olaf Hering <olaf@aepfle.de>
Subject: Re: migration regression in xen-4.11 and qemu-2.11 and
 qcow2
Date: Tue, 8 May 2018 13:31:43 +0200
Message-ID: <20180508133143.77e209f2.olaf@aepfle.de>
References: <20180507151940.GA31926@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1897634968725594642=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180507151940.GA31926@aepfle.de>
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

--===============1897634968725594642==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/_Sj4PCLc8OxRmZEACcEZkAY"; protocol="application/pgp-signature"

--Sig_/_Sj4PCLc8OxRmZEACcEZkAY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 7 May 2018 17:19:46 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> What I gathered during debugging so far is that somehow qemu on the recei=
ving side locks a region twice:

After further debugging with many wild printfs:
On the receiving side blockdev_init sets BDRV_O_INACTIVE because RUN_STATE_=
INMIGRATE is true.
BDRV_O_INACTIVE causes bdrv_is_writable to return false.
As a result bdrv_format_default_perms does not set BLK_PERM_WRITE in perms.

On the sending side offset 0xc9 is unlocked on the other fd, which allows F=
_WRLCK to succeed:
2018-05-08T11:20:54.491168Z qemu-system-i386: qemu_lock_fcntl: 28 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:20:54.492162Z qemu-system-i386: qemu_lock_fd_test: 28 c9 1 F_=
WRLCK>F_UNLCK 0 Success
2018-05-08T11:20:54.494752Z qemu-system-i386: qemu_lock_fcntl: 28 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:05.189455Z qemu-system-i386: qemu_lock_fcntl: 28 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:05.190460Z qemu-system-i386: qemu_lock_fd_test: 28 c9 1 F_=
WRLCK>F_UNLCK 0 Success
2018-05-08T11:21:05.192726Z qemu-system-i386: qemu_lock_fcntl: 28 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:05.194298Z qemu-system-i386: qemu_lock_fcntl: 28 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:05.195079Z qemu-system-i386: qemu_lock_fd_test: 28 c9 1 F_=
WRLCK>F_UNLCK 0 Success
2018-05-08T11:21:05.197123Z qemu-system-i386: qemu_lock_fcntl: 28 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:05.199378Z qemu-system-i386: qemu_lock_fcntl: 28 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:05.201108Z qemu-system-i386: qemu_lock_fcntl: 28 c9 1 F_UN=
LCK>F_UNLCK 0 Success
2018-05-08T11:21:05.344335Z qemu-system-i386: qemu_lock_fcntl: 27 c9 1 F_UN=
LCK>F_UNLCK 0 Success
2018-05-08T11:21:05.345969Z qemu-system-i386: qemu_lock_fcntl: 27 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:05.346836Z qemu-system-i386: qemu_lock_fd_test: 27 c9 1 F_=
WRLCK>F_UNLCK 0 Success
2018-05-08T11:21:05.348937Z qemu-system-i386: qemu_lock_fcntl: 27 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:05.359691Z qemu-system-i386: qemu_lock_fcntl: 27 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:05.360632Z qemu-system-i386: qemu_lock_fd_test: 27 c9 1 F_=
WRLCK>F_UNLCK 0 Success
2018-05-08T11:21:05.363221Z qemu-system-i386: qemu_lock_fcntl: 27 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:05.364781Z qemu-system-i386: qemu_lock_fcntl: 27 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:05.365607Z qemu-system-i386: qemu_lock_fd_test: 27 c9 1 F_=
WRLCK>F_UNLCK 0 Success
2018-05-08T11:21:05.367794Z qemu-system-i386: qemu_lock_fcntl: 27 c9 1 F_RD=
LCK>F_RDLCK 0 Success

It seems on the receiving side some code forgets to unclock offset 0xc9, wh=
ich causes F_WRLCK to fail:
2018-05-08T11:21:52.108809Z qemu-system-i386: qemu_lock_fcntl: 27 c9 1 F_UN=
LCK>F_UNLCK 0 Success
2018-05-08T11:21:52.112193Z qemu-system-i386: qemu_lock_fcntl: 27 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:52.113028Z qemu-system-i386: qemu_lock_fd_test: 27 c9 1 F_=
WRLCK>F_UNLCK 0 Success
2018-05-08T11:21:52.115401Z qemu-system-i386: qemu_lock_fcntl: 27 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:52.122037Z qemu-system-i386: qemu_lock_fcntl: 27 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:52.122886Z qemu-system-i386: qemu_lock_fd_test: 27 c9 1 F_=
WRLCK>F_UNLCK 0 Success
2018-05-08T11:21:52.125189Z qemu-system-i386: qemu_lock_fcntl: 27 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:52.126969Z qemu-system-i386: qemu_lock_fcntl: 27 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:52.127801Z qemu-system-i386: qemu_lock_fd_test: 27 c9 1 F_=
WRLCK>F_UNLCK 0 Success
2018-05-08T11:21:52.130109Z qemu-system-i386: qemu_lock_fcntl: 27 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:52.859199Z qemu-system-i386: qemu_lock_fcntl: 39 c9 1 F_UN=
LCK>F_UNLCK 0 Success
2018-05-08T11:21:52.862010Z qemu-system-i386: qemu_lock_fcntl: 39 c9 1 F_RD=
LCK>F_RDLCK 0 Success
2018-05-08T11:21:52.862673Z qemu-system-i386: qemu_lock_fd_test: 39 c9 1 F_=
WRLCK>F_RDLCK 0 Success
2018-05-08T11:21:53.112935Z qemu-system-i386: qemu_lock_fd_test: 39 c9 1 F_=
WRLCK>F_RDLCK 0 Success
2018-05-08T11:21:53.363246Z qemu-system-i386: qemu_lock_fd_test: 39 c9 1 F_=
WRLCK>F_RDLCK 0 Success
2018-05-08T11:21:53.615668Z qemu-system-i386: qemu_lock_fcntl: 39 c9 1 F_UN=
LCK>F_UNLCK 0 Success
2018-05-08T11:21:53.616426Z qemu-system-i386: qemu_lock_fcntl: 39 c9 1 F_UN=
LCK>F_UNLCK 0 Success
2018-05-08T11:21:53.616816Z qemu-system-i386: qemu_lock_fcntl: 39 c9 1 F_UN=
LCK>F_UNLCK 0 Success


It is unclear why that was never noticed in xen-4.10, qemu-2.9 did not have=
 that bug.
Also, if a KVM or Xen guest is migrated should make zero difference for the=
 qcow2 driver...


Olaf

--Sig_/_Sj4PCLc8OxRmZEACcEZkAY
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWvGKnwAKCRBdQqD6ppg2
fuhDAJ45iT5aqW2ySWDdSvYDzxMCCmg2QACgtZkgms38Ngl0P406Y5Yd8dBgths=
=OJpN
-----END PGP SIGNATURE-----

--Sig_/_Sj4PCLc8OxRmZEACcEZkAY--


--===============1897634968725594642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1897634968725594642==--
