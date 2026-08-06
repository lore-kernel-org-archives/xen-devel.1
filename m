Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7013C55ABF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 01:05:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384038.1627125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrmY0-0004RH-Le; Thu, 06 Aug 2026 01:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384038.1627125; Thu, 06 Aug 2026 01:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrmY0-0004QQ-G3; Thu, 06 Aug 2026 01:05:24 +0000
Received: by outflank-mailman (input) for mailman id 1384038;
 Thu, 06 Aug 2026 01:05:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1wrmXz-0004NK-15
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 01:05:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrmXy-00Dmiq-E7
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 03:05:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a73ddca-e002-0a2a0a5209dd-0a2a4508a0e8-6
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 03:05:18 +0200
Received: from [66.163.186.146] (helo=sonic302-20.consmr.mail.ne1.yahoo.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brchuckz@aol.com>)
 id 6a73ddcd-f659-0a2a45080019-42a3ba928d83-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 03:05:18 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ne1.yahoo.com with HTTP; Thu, 6 Aug 2026 01:05:16 +0000
Received: by hermes--production-bf1-54b5569bdc-xjdx5 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 734f0c8329adecc00a98ec91cc943adb; 
 Thu, 06 Aug 2026 01:05:14 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=a2048 header.d=aol.com header.i="@aol.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1785978316; bh=obmks52YmrFX3M/nOgH2+nRuVRmljJ9a96OvnoWzDN0=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=kh8tfiI5X2mLkXTltEf1/TcNAbw9dHgs2OXe6/Cx4f4Q2W6aW63BXJmSVUGkINreNcBD6FfkTh+LU/PZ/9ev/PPDIhFXlLEd5DF9qRH0ZT133j+EbvArqqLxdVG+CIYuBgZk87zNSAMfhBXeGs7TSvU4iQ0b4yTmxYhJCWMf35Xml1JursLU3YArBNZcnq06L792aANSeBpwycj45QA+42ABhE6pKl2XJwrrvkIHk/+NChuo4QrpzNRevFVwGoi2dY/qKiLP/Fg0A01edPoGhgAltg5IklPjIt6jt0yDOfQIw6DvU+RedQcECB3yfm/w+fbWJHmTkposNbKtQ7sIbw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1785978316; bh=ck6kJNsZA5u6QunEVrirntyEJVzU70IKy2/Lw3IfRxB=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=seq5ZWIU5B6NV56rwGUzNRaiukH2pxkuBSHwIm5hFen4SIbMRS3ENPc4ZC5HG2zFkyDfYw+7H8SgJRr8ppyKspt5c+Xix+nMCLvw28oKcc+qUOMrrHWN09oRUtkmmAJnd/XsJ3R1cMJfqpVOSod/yacHuvYk/tzdQjxo6eU3r8djSoeeqOafayIiIcOgA8ANaGsxDIXI7j/YROY1dwuE/R040usL+uXjv6LQw5SXXEj1WHC0RVMJsA+ywcVHL5/YauFFy0VhTSVoYoM0OWCoRj4+bTfpDPzi1OzLla8XfeEAJuA6vARajc7CRv8mjST5gyrGsM6n7OYcR9pwZ77J5A==
X-YMail-OSG: xe.__RgVM1l_hd0jAUIpXgp5HdcGo.Fg7qzC5hEqyLrEB6dmqcjtO7EnO83gYOE
 GdoUZIRcPl4682QnmcoLQDxFV1YiOxV7z10s9oiJciW3.BpnQ.xl6Lgs.cKFe9DEntPnhVV1Gflh
 R_vv_v5VsgTOgQTjb02wbhR7BaicgKG4m_5NYp0e7azVnegtsv2qznQfIXSZ49zCpPeVnSGepg7O
 fmpu1czhJ_Biamcu7HWQvW1Mtd.8RJGlHchC605NeDSR9t5VDe3vg1HrWv6DLy.3QmnAd39n07A8
 .lKFqgozDDtOnri_pthmomKAXEiyEMQ8YkuspAETr67CtZR3EPi4SFc1msSD_8jcVPmqbtmDfIph
 7b9_3yAdy6DCPrEfW4w9UN4MmRDCN7KcczKHG00eYBhCiBxrMlqEJ9sK0kt1tnO3XlKQeGtgSIIN
 wxAeuf49eyyqYUk.OHveIgmW_6luLMJOVxafp6gmx4XMS0Vlguc1Xwm.Z.xs._NrbIEU2q2mKpCs
 y6seMDNYU.ktsDUDJfy.ceAatpCRknL5pwf_0R_p.btzXt43FIgg5e6RMFfWfKgwKRgUPlgIby3y
 tgI0QlPDRbyRsnRDa.kY.iPAvTPehxuTQaaBGkIL6hiLSI72.0tcgw6x4Jr.LWK18RS.GBg5OnMQ
 6JkXFbN3o.3YnKpKn2dioejzpgeRynZjC2o7y7Dl92drO.vdx6CHRQcEbVd8drtKjm16la502FUT
 xpAHW5IV9UCFOnyHi.MgIPUWKe1umqDPnbR3G31N1_nkIfSOqq7vKk5ke0EOOl4boXYe4gEPtLK.
 qcKeaSTJ4c_09WnQ9MC7R4DvUNJnqiXVMnJhncNhtZmdqvimtpw1kylQWUI4F7Lh1WlDHZdVVN6h
 pIO4ToiY3hi6msThigvzwkitiS5EfbihvX.ZRiVtw_OiLHQMtiAn6mpAsAjdHpPnNhClY8yOfUzu
 DzJZpcZvl0_N9QI0lTTfHoScNd08JMLERtnCJRwnR0UhIPQkVYRlRaL1iEBQjuDnjx4ehaCKgmky
 q.Vkq1.5lZAzuA0ERmMyV_YpQHn2h5qnNW.B4Jx4RaKF6g2JTqaMmgn.tW4nus77.m.PNufImZ.T
 UoYvMrVqEJfEWHgS_B6Vh8d0OJAPWHz24XFfojnZzjNai1NMg22qc7TWVkA8uliZFJ2_Lz6vNSb2
 o1eMIYhugUrWwtaTUp78PY_BMTNclTpUHZLbIuF.XTz6Y6jrtZRjJaGcykPoBaHBWUzrIer0hxng
 9Ob7D237hExdRe9MHXd6bofsbaTlAiX4LzcRY6lGqp7JTAJDgQhpSeAtBE11UbMV7F2dLYKjdCB8
 kWEca00akBqg1IRbrp5MrzWZnrBKo7uqOH5vq6bjI_3RpnAycNPN11y02fmTv1Lzy6UuOMzeyuzR
 VzhkyxTLEMcNW3YqSZ3ZUTO5g6soWx0qu8CyL08K3.NvQTtDp8SBA9xRNJsunYksk6BEj0et1cRo
 dAzA739pPjyaG_oe9GgxB51kGjsfsgKNSkbM7eVQUMVmaIXToUsod553kFtJeIF2cLI1ZxtIrbpx
 rFtcrTKYuIbgmUfzxhstYUPtwFc.WIwNpFeBxzmsrikanf6LgzEakFK0sOn0u74SKYVyo4hvx1No
 eJZZ02NuN6jTEhvLoeTGPcLXcIVuueouRMUmOtUTRl9DFWvxpXahWS_hFhG1DRv4Ocycdp76Ywoe
 yVrQFO4OgRA_hewDljdN2taq7UP0CdkUirC7viQW9zPqdselF2hmN5zVP4boYIQz4tNufX_6FiBW
 vAP3XMiAnLXmXKBfU76WWUnbXrweMe4p_1TbsRcLodTHM8mrTor08pcS1.CyeclPwZZNe4Yx28Yg
 nyYk.DXoWZVX.FK9180XjYglAsD9HADqsiFeEVeQRqwuRTvYusctUptH_QxFWqMWG4l3FylIGUxq
 Ix4YdzqAbQOYT3i6YzrJygMfnKTskv7P4c.or6wbvNx8sXcVGQ5JHXweXIofznjQV_cdPh4Xo5hb
 YoYPZOOYmlxpFqCHO8QLyTGnCLSb5vgSjfQSHv6JW4cfmxMckt0B9Q8my7dPlHWYlbClCrUtZEBx
 PPY5Qk.SqfKiJCeGurO3y9X_Kln0_kUTQjRdaW14c2zavvGsmIA3bFBeDSNAJvaDRV1DRBUEqgDh
 h4afNOjFn7Oc5rmYt9ev15A3dYURu_esAZ9nUCCyBYkrEQ7at0wsBmIx0Zpelci_jnqmVAwxWS._
 dFPtE9kCgzMSlHNYsqg9FDG2Odjjyg8YUroeIQb8-
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: 446e3e3e-5ba5-48e7-8e09-de07860e2ac3
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Tomita Moeko <tomitamoeko@gmail.com>
Subject: [PATCH v5 3/6] xen/igd: fixup device id before registering rom
Date: Wed,  5 Aug 2026 21:04:53 -0400
Message-ID: <20260806010506.492490-4-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260806010506.492490-1-brchuckz@aol.com>
References: <20260806010506.492490-1-brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1785978318-CCF4F87B-4E20A411/0/0
X-purgate-type: clean
X-purgate-size: 3294

With the current implementation, Seabios does not see the fixup of
the device id done here and consequently Seabios does not load the
VGA bios and the guest screen does not light up until the guest OS
graphics driver is loaded. So there is no VGA output from the passed
through Intel IGD from either Seabios or the guest bootloader with
the current implementation in cases when the device id needs fixing.

Fix this by waiting until after doing fixup of the device id before
registering the option ROM. With this patch, Seabios sees the fixup
done here and loads the VGA bios, and both Seabios and the guest
bootloader light up the guest screen in cases when fixup of the
device id is needed.

Also, remove unused header hw/core/loader.h.

Fixes: 881213f1b9c5 ("xen, gfx passthrough: retrieve VGA BIOS to work")
Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Changes in v4:
  - Add a Fixes tag

Changes in v5:
  - No changes to this patch

 hw/xen/xen_pt_graphics.c |  3 +++
 hw/xen/xen_pt_load_rom.c | 18 ++++++++++++------
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index b37f9b7..0ae95cc 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -223,6 +223,9 @@ void xen_pt_setup_vga(XenPCIPassthroughState *s, XenHostPCIDevice *dev,
         }
     }
 
+    pci_register_bar(&s->dev, PCI_ROM_SLOT, 0, &s->dev.rom);
+    s->dev.has_rom = true;
+
     /* Currently we fixed this address as a primary for legacy BIOS. */
     physical_memory_write(0xc0000, bios, bios_size);
 }
diff --git a/hw/xen/xen_pt_load_rom.c b/hw/xen/xen_pt_load_rom.c
index 319efca..407b630 100644
--- a/hw/xen/xen_pt_load_rom.c
+++ b/hw/xen/xen_pt_load_rom.c
@@ -4,14 +4,22 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "hw/core/loader.h"
 #include "hw/pci/pci.h"
 #include "xen_pt.h"
 
 /*
- * Scan the assigned devices for the devices that have an option ROM, and then
- * load the corresponding ROM data to RAM. If an error occurs while loading an
- * option ROM, we just ignore that option ROM and continue with the next one.
+ * Normally xen_pt_register_regions will handle loading the option ROM,
+ * but in some cases, such as for the Intel IGD, the option ROM might
+ * need to be modified.
+ *
+ * For such cases, use this function to get a pointer to the option ROM
+ * from sysfs. Caller has the responsibility to edit the option ROM as
+ * needed, call pci_register_bar to register the modified option ROM,
+ * and set has_rom to true for the PCI device.
+ *
+ * This function must be called before xen_pt_register_regions is called
+ * because if xen_pt_register_regions is called first, it will register
+ * the option ROM and any attempt to register it again will fail.
  */
 void *pci_assign_dev_load_option_rom(PCIDevice *dev,
                                      int *size, unsigned int domain,
@@ -76,8 +84,6 @@ void *pci_assign_dev_load_option_rom(PCIDevice *dev,
         goto close_rom;
     }
 
-    pci_register_bar(dev, PCI_ROM_SLOT, 0, &dev->rom);
-    dev->has_rom = true;
     *size = st.st_size;
 close_rom:
     /* Write "0" to disable ROM */
-- 
2.52.0


