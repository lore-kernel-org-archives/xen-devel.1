Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7B8C79FA1
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 07:25:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415728.1644957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4vdE-0008EN-DV; Fri, 11 Sep 2026 07:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415728.1644957; Fri, 11 Sep 2026 07:25:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4vdE-0008Db-4Z; Fri, 11 Sep 2026 07:25:08 +0000
Received: by outflank-mailman (input) for mailman id 1415728;
 Fri, 11 Sep 2026 07:25:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1x4vdC-0008A2-I1
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 07:25:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4vdB-001KQ2-Us
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:25:05 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6aa3acc3-e002-0a2a0a5209dd-0a2a450c9d18-38
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:25:05 +0200
Received: from [98.137.68.30] (helo=sonic308-54.consmr.mail.gq1.yahoo.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brchuckz@aol.com>)
 id 6aa3acd0-f479-0a2a450c0019-6289441e989a-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:25:05 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Fri, 11 Sep 2026 07:25:03 +0000
Received: by hermes--production-bf1-54b5569bdc-fv65m (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID c4451c0cd4386c4b1051306e68eb9ea1; 
 Fri, 11 Sep 2026 07:25:00 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1789111503; bh=MHAucsl21fQ+zt5t6z3XzNa922VKJLeEWygr1vd5y3g=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=mGNCsPKwIS4L5pgq3coWc3/nLFwsC/xxop57/FoTRZfzPBrBoEAK/skx8IYRvMB3ADb0LqoGIokB/652g6arjddcpn/3Lf/sR+8Emf6GDXMgL5xykFDOaa5/debwQ2pVbWykkZMLdLGS1p2yN3okFVbvUEBizmHPbvqGFpuXc1lrJjKSLny+TLkum6IfRh42h2wBTU1dRIWb8E/1qylepU60IRSIHONVqT+TNDQO+b34xWwT/4aEcpmW/Xkv0tU2fscucv1gi/cqumTBPWJG7SRL2xgWtLAEuHzBEtrlKTzC7kgqJCIzKiQWo6HSeDr8VwIbW6euhR7ZI19GzfpF3g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1789111503; bh=ItvF/EjmknDMnmunyCgEQQBZ+jJQ/FZnOumzkxmVWC9=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Hu6b/MxlJN4U+/5tIL9BOK/8vNwphnBGRuCuN4rrcdXJ9hzorxsOvCzxWSCekRidPlNdZsVmXfEWj5+V9pMmOU0H12n/olXwk/cGajmYCIInyO2e88n9Ace17sjLTeCWKTi8EnA6kAWW8TUi1B3r7ulS3Xj9A4juum0iakwJJkwnA9fAWCHNlo/PII1S3k08k2xwRGCTGRBa8cQjtR6lwaW0qc6eqTqTX9ejDiRS4ESTJql6d/UsvpnOfBL2au2H//dVBb/2OA7ej96+kQ8DzFraYe1PTzEzz5lryh8kwSjgcZLuVriSpZVZCQwxpEO08+39/fKtqu6Oo8hS2n41rQ==
X-YMail-OSG: ZCQQLDYVM1njOau7aIEpTe_HowWStq2DyrIyaS0l0BC09H0sLmUny_TJjHZ7CDt
 ZjGnavHsEzmRwnhPS9UNk8Yc5uxPJ29D7MUHDuVb0i9QabFWZt9HnjNt9QWuZNCUodHNI7VVrC8y
 .YlQ6TtSefckiRRjK_gSSJsg.NtWOx.HyM4TOKhLGPQF6RgysX.xCBZuJydPptob91W5fF5On0Mv
 U9lMdWJFu3pUcmc6P.HvWNUc2bOmqxb0FCr9ZAgZQEdURtfL8VACOxpYfKIL5qlTA0OKy0pc5801
 omNY2zalBrbSTknqWCp6OdTz1pYgdIZaDN2U7QzxvuOIYWOlbaow3HJ3lLKUku9Mhh_Yev9KkiZw
 a5VR819lhu51ZvjXQ8a55cx0ErGtDjts44FZZ7yv1up_fHILyUpLVkoN9voNnO6hiP1KGw6MPTzp
 ox0T74AXrKanc1wKwFz.dJDcKJ.voQRcrmvbW3DY7XV41RXou3ECP8oDNgxtCNmWOKGxkMD5haRH
 tW9Icrqy2jauK0hip2gdNpBIlmmqtGkZrWAECh9pdVaaVXQHjOkebZis_hnG4PkALRi7OQ7_hfjQ
 EMk5lzUDU_dg7.aV5XhlMFzfuxLAgp8sQFRwOmiKlt3xb2bZTrMMLHVUpM2oNBGlxbmhWNCKxYm7
 zVD41cdMLK9nuR04HCOG4.NPWgKTwCRhutjkCMAMQov.2qzc1XeqgY1ebsFfjr3XXhKZcY88jscZ
 4B22Iq1TuDt8OCl5k3jyAD.QaaFztdjmalZzgrfkmFpW1v7SiQSb0nuTQhY7b7CHkYZkJB3qvJt3
 Awf78PW1MUCzJzBNDIM3G87DT5W2KxN3cKJWhGSamlYwf0vZ3Y4fEoPmlvioaEyUrWi0dZbSm2aq
 IMLNlF83Ywb7mkeIFRcmAiZK0yPIfCqq.FZXo1KtBIy0Cv6Vbb7xqvP.NpwkmgGpec7FgOqFj90s
 icNQdP03DrkoD9angoQnH0uTpTfAg_giK2LHutQL6FFY3VNKropRc0j3FzzQEJQ7WroPSrkXCYwx
 6G1N_u4O67Va17OC0H6N4UgXJlk63zGyjusGMbriWam_5Z5RC2ZnAY7funm2z7vgM1wfcjEAsYUb
 r802cSN5iFIM0zWUxQmedyLC2vO8wFjJDzWoBnkS28sr.ttmrKRQtN72JjYF5DP67k3RS3k04CRS
 TcxhdWEo2OFe18YK1aAIPil7vYX7z1Wzy29gaFe54.VUYJjkUu7lo1ExAPqRoEcItTO_PQvB8Xjr
 1UGzBNoOQlN6eu894NV48woYt2SBkE5pRRXlOM.Z0qjBfiKW3p2BwGuf1Cy6KPLwtQisDzngsbBY
 JAs1Al52z5CRnqTlsoNqwHz_bHP4Pow2Z_iTrgjip2u5kBAybLHnkH68nZQcpSjoM2o84qSUCJ.L
 gJE40kxp.nGbcuGNzeTCVZez7nVoK1799kP13mCKfAFDItzXXioCUfeo_Vl5FWqH_mYfqI5UtNl7
 vT1LxGihJIDq6ProoEOq9hjUazOhaasHKoJMATkd8m6oA6IxyGMptZvUspKR.gwtRkGjGpX5ELvk
 OJk3RQ5HIEkHLKJjkep_HLVIR7CljDTK0xda97unIA1MmpeoyPBu8oKzkW6YiHzITRe2bRX101GX
 aI7q7WoZN9NKjxEcZVHD5jbVadZZM9Tuqd96IyZ3Xd8bIWFOxhOMapNHPWWC.epr4ILCvIsAWbfE
 .PEbLfpwrlO8J5iNDssyhC6onELitmksLGNVE3dpinN72Y9q2NcyTwxW6vpXMtkg71byAChXFztw
 j6o4zDrj2CP3mVxNLd5t11cjWxUPiEAq7.FQYMEbaWj5eihXiegM29Xzzix2wwznDWne2ACyPnu9
 mDxMFLZ7aVeo7zxAkYP4vTqXJlFS63KLkL2YDPXyWEZJXYRW7dpwjPZkvo3ImcqEfZKlvPZuK7xZ
 vvmXINe1WxKHN_6zdfNhaTr6FTX_LTg24onq1Tm67qnqHjGu5BSJs3pk8gnez9IT1a0e9hO6O_7b
 apdHvc4rNqvoOAfQRRQg3BCHn8H2W5EBkXMFHkpns3FCh1W1sTMt0kXQzrLZm99_iE.IEYJYeDUs
 ZQtHo7OLDArerpIMe6AAdn9lhlthElh1uNWGqRkjTeaN9ISZgin_qhkwDmp_rEKarSWYq3au7nuR
 VVapF_pmV7X3tNq3hMkEoqqBf3oEsrRuRd4S0OGjHjblnLvRH3w4TT0hPljBAuU8L4YsdAycAkXk
 UDXglIaqjIDXcuImKwAYtq9igvJQBfpXDZtqb
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: 2c3085ab-b377-45e0-bffe-0943d287da5e
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Tomita Moeko <tomitamoeko@gmail.com>
Subject: [PATCH v6 3/7] xen/igd: fixup device id before registering rom
Date: Fri, 11 Sep 2026 03:24:49 -0400
Message-ID: <20260911072453.46256-4-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911072453.46256-1-brchuckz@aol.com>
References: <20260911072453.46256-1-brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1789111505-004CFA5B-5273D7C5/0/0
X-purgate-type: clean
X-purgate-size: 3342

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
Changes in v6:
  - No changes to this patch

Changes in v5:
  - No changes to this patch

Changes in v4:
  - Add a Fixes tag

 hw/xen/xen_pt_graphics.c |  3 +++
 hw/xen/xen_pt_load_rom.c | 18 ++++++++++++------
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index cf424bc..c5ab23e 100644
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


