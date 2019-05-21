From: Olaf Hering <olaf@aepfle.de>
Subject: Re: Unhandle NONE type device model broke QDISK backend
Date: Tue, 21 May 2019 17:33:29 +0200
Message-ID: <20190521153329.GA11623@aepfle.de>
References: <20190521143702.GH1846@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6234672158450109682=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dk3M=TV=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hT6ll-00060e-Os
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 15:33:38 +0000
In-Reply-To: <20190521143702.GH1846@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============6234672158450109682==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 21, Wei Liu wrote:

> bxl: debug: libxl_device.c:380:libxl__device_disk_set_backend: Disk vdev=xvda spec.backend=qdisk
> libxl: debug: libxl_linux.c:235:libxl__get_hotplug_script_info: Domain 1:backend_kind 3, no need to execute scripts

The backtrace looks like that:
(gdb) bt
#0  libxl_device_disk_dm_needed (e=0x5555557950b0, domid=0) at libxl_disk.c:1151
#1  0x00007ffff791c9a9 in libxl__need_xenpv_qemu (gc=gc@entry=0x555555795570, d_config=d_config@entry=0x7fffffffdb90) at libxl_dm.c:3196
#2  0x00007ffff7911bdb in libxl__domain_set_device_model (gc=gc@entry=0x555555795570, d_config=d_config@entry=0x7fffffffdb90) at libxl_create.c:50
#3  0x00007ffff7914a36 in initiate_domain_create (egc=egc@entry=0x7fffffffd970, dcs=dcs@entry=0x555555797960) at libxl_create.c:967
#4  0x00007ffff791505f in do_domain_create (ctx=ctx@entry=0x555555790860, d_config=d_config@entry=0x7fffffffdb90, domid=domid@entry=0x7fffffffdac8, restore_fd=restore_fd@entry=-1,
    send_back_fd=send_back_fd@entry=-1, params=params@entry=0x0, ao_how=0x0, aop_console_how=0x0) at libxl_create.c:1766
#5  0x00007ffff7915c8e in libxl_domain_create_new (ctx=0x555555790860, d_config=0x7fffffffdb90, domid=0x7fffffffdac8, ao_how=0x0, aop_console_how=0x0) at libxl_create.c:1980
#6  0x0000555555579a98 in create_domain (dom_info=0x7fffffffe0f0) at xl_vmcontrol.c:932
#7  0x000055555557abfa in main_create (argc=3, argv=0x7fffffffe3c8) at xl_vmcontrol.c:1242
#8  0x0000555555561116 in main (argc=3, argv=0x7fffffffe3c8) at xl.c:413

(gdb) p *elem
$2 = {backend_domid = 0, backend_domname = 0x0, pdev_path = 0x55555579b120 "/nfs_vmimages/sle12sp2/vdisk.pv_sle12sp2_c_qcow2.disk0.qcow2", vdev = 0x555555794670 "xvda",
  backend = LIBXL_DISK_BACKEND_UNKNOWN, format = LIBXL_DISK_FORMAT_QCOW2, script = 0x0, removable = 0, readwrite = 1, is_cdrom = 0, direct_io_safe = false, discard_enable = {val = 0},
  colo_enable = {val = 0}, colo_restore_enable = {val = -1}, colo_host = 0x0, colo_port = 0, colo_export = 0x0, active_disk = 0x0, hidden_disk = 0x0}

backend is not initialized at this point.
With 'backend=qdisk' it will be initialized, so there is some ordering bug.

Olaf

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXOQaRgAKCRBdQqD6ppg2
fuT+AJ4mee2QeqUJanH3sX/mEC07iVihJgCg4j9+JjNg9YOVnlLzV0FPNvXK8cI=
=kIdN
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--


--===============6234672158450109682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6234672158450109682==--
