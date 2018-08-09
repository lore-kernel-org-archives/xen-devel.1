From: Olaf Hering <olaf@aepfle.de>
Subject: qemu-3.0 fails with staging
Date: Thu, 9 Aug 2018 11:02:42 +0200
Message-ID: <20180809110242.553ea267.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0616694261564724359=="
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

--===============0616694261564724359==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/dhlZJY02Q+H/+sIxSG+cDQR"; protocol="application/pgp-signature"

--Sig_/dhlZJY02Q+H/+sIxSG+cDQR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This domU.cfg fails for me with staging+qemu-3.0, but qemu-2.12 happens to =
work:

name=3D'fv'
serial=3D'pty'
vcpus=3D'4'
memory=3D'8888'
disk=3D[ 'vdev=3Dxvda, format=3Draw, access=3Drw, target=3D/nfs_vmimages/di=
sk0.raw' ]
vif=3D[ 'bridge=3Dbr0,mac=3D3e:27:63:30:c0:46,type=3Dvif' ]
builder=3D"hvm"
device_model_version=3D"qemu-xen"
device_model_override=3D'/usr/lib64/qemu-3.0/bin/qemu-system-i386'

libxl: error: libxl_dm.c:2429:device_model_spawn_outcome: Domain 3:domain 3=
 device model: spawn failed (rc=3D-3)
libxl: error: libxl_create.c:1566:domcreate_devmodel_started: Domain 3:devi=
ce model did not start: -3
libxl: error: libxl_dm.c:2543:kill_device_model: Device Model already exited
libxl: error: libxl_domain.c:1034:libxl__destroy_domid: Domain 3:Non-exista=
nt domain
libxl: error: libxl_domain.c:993:domain_destroy_callback: Domain 3:Unable t=
o destroy guest
libxl: error: libxl_domain.c:920:domain_destroy_cb: Domain 3:Destruction of=
 domain failed


tail: '/var/log/xen/qemu-dm-fv.log' has been replaced;  following new file
qemu-system-i386: -serial pty: char device redirected to /dev/pts/5 (label =
serial0)
xenforeignmemory: error: ioctl failed: Invalid argument
qemu-system-i386: failed to map ioreq server resources: error 22 handle=3D0=
x561c17027040
qemu-system-i386: xen hardware virtual machine initialisation failed


Does it actually work for anyone? I think there is an OSS-TEST for qemu.git=
#master.
I have to debug something else, so can not actually look further at this po=
int.


Olaf

--Sig_/dhlZJY02Q+H/+sIxSG+cDQR
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW2wDMgAKCRBdQqD6ppg2
ftLsAJ9Q7Ch+nN/z986zCSzMhr2pVbZNjACgzjeMuR1XR/GOHpkfTWlaDk4LSDs=
=MAUz
-----END PGP SIGNATURE-----

--Sig_/dhlZJY02Q+H/+sIxSG+cDQR--


--===============0616694261564724359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0616694261564724359==--
