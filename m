From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/arm: improve dom0less documentation
Date: Wed, 1 May 2019 16:30:06 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1905011628310.23881@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-239192802-1556753337=:23881"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4/tq=TB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hLyfz-0000IJ-AY
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 23:30:11 +0000
Content-ID: <alpine.DEB.2.10.1905011629040.23881@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: julien.grall@arm.com
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-239192802-1556753337=:23881
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1905011629041.23881@sstabellini-ThinkPad-X260>

Improve Dom0-less documentation: include a complete configuration
example.

Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>

diff --git a/docs/features/dom0less.pandoc b/docs/features/dom0less.pandoc
index 4e342b7..e076e37 100644
--- a/docs/features/dom0less.pandoc
+++ b/docs/features/dom0less.pandoc
@@ -23,6 +23,70 @@ booted and the Xen tools to become available, domains created by Xen
 this way are started right away in parallel. Hence, their boot time is
 typically much shorter.
 
+
+Configuration
+-------------
+
+### Loading binaries into memory ###
+
+U-Boot needs to load not just Xen, the device tree binary, the dom0 kernel and
+ramdisk. It also needs to load the kernel and ramdisk of any additional domains
+to boot. For example if this is the bootcmd for Xen and Dom0:
+
+    tftpb 0x1280000 xen.dtb
+    tftpb 0x0x80000 xen-Image
+    tftpb 0x1400000 xen.ub
+    tftpb 0x9000000 xen-rootfs.cpio.gz.u-boot
+
+    bootm 0x1400000 0x9000000 0x1280000
+
+If we want to add one DomU with Image-DomU as the DomU kernel
+and ramdisk-DomU as DomU ramdisk:
+
+    tftpb 0x1280000 xen.dtb
+    tftpb 0x80000 xen-Image
+    tftpb 0x1400000 xen.ub
+    tftpb 0x9000000 xen-rootfs.cpio.gz.u-boot
+
+    tftpb 0x2000000 Image-DomU
+    tftpb 0x3000000 ramdisk-DomU
+
+    bootm 0x1400000 0x9000000 0x1280000
+
+
+### Device Tree configuration ###
+
+In addition to loading the necessary binaries, we also need to advertise
+the presence of the additional VM and its configuration. It is done via
+device tree adding a node under /chosen as follows:
+
+    domU1 {
+        compatible = "xen,domain";
+        memory = <0x20000>;
+        cpus = 1;
+        vpl011;
+
+        module@2000000 {
+            compatible = "multiboot,kernel", "multiboot,module";
+            reg = <0x2000000 0xffffff>;
+            bootargs = "console=ttyAMA0";
+        };
+
+        module@30000000 {
+            compatible = "multiboot,ramdisk", "multiboot,module";
+            reg = <0x3000000 0xffffff>;
+        };
+    };
+
+Where memory is the memory of the VM in KBs, cpus is the number of
+cpus. module@2000000 and module@3000000 advertise where the kernel and
+ramdisk are in memory.
+
+See docs/misc/arm/device-tree/booting.txt for more information.
+
+Limitations
+-----------
+
 Domains started by Xen at boot time currently have the following
 limitations:
 
--8323329-239192802-1556753337=:23881
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-239192802-1556753337=:23881--
