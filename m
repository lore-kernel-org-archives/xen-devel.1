Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08300C88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 07:25:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415726.1644939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4vd9-0007nJ-OY; Fri, 11 Sep 2026 07:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415726.1644939; Fri, 11 Sep 2026 07:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4vd9-0007mp-GQ; Fri, 11 Sep 2026 07:25:03 +0000
Received: by outflank-mailman (input) for mailman id 1415726;
 Fri, 11 Sep 2026 07:25:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1x4vd8-0007k7-Cf
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 07:25:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4vd7-002qxh-6u
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 09:25:01 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6aa3acc5-8faa-0a2a0a5109dd-0a2a4506d894-44
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:25:00 +0200
Received: from [98.137.65.32] (helo=sonic315-8.consmr.mail.gq1.yahoo.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brchuckz@aol.com>)
 id 6aa3accb-195a-0a2a45060019-62894120959f-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 09:25:00 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Fri, 11 Sep 2026 07:24:58 +0000
Received: by hermes--production-bf1-54b5569bdc-fv65m (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID c4451c0cd4386c4b1051306e68eb9ea1; 
 Fri, 11 Sep 2026 07:24:57 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1789111498; bh=tHr6jGwNHhq3fJ+vp7D5cn0Pfg062lk1xcykfV907MM=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=WkXczADhdQuA0QQMH2IyPryOJk04+MaSsYlWKDiqaovTU+vh8uLPZqswm22rPTk0n8o/VFAN+xdxTik/gIw+97158tCBbaqcmSFJM28RiG7NlGiKGjnySopf3+4OSD7HSzM/yZbZwraU72s4UzYN4M0V9n2BbAlFbybjXPnG86YYIKMs51RJbc4n5kMCjZY0139sqkxY7SwCeBPtVN7kd+uN8J4pAvTgyXA3AZkAqj/a94kLRQQPYmdpMbz/e9XVH90ON5Xs/Uix2M3IKoEb3tVkDfhl2Wqi0O1oeHj8HJ759hC9EXr/MauKoO1JO3tutkiWtj72bvboom4w4xzLow==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1789111498; bh=ecV1pO1qpj7gBS6SdkI1hsH3mU8y/kZB15TF0tG+0hw=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=MkchnzuS7PIompOxaek6t1GmklJ/Bp/EGq6muEM8qLuwyGx5x/n4r/wf1cxGrYCrwRafzna9m/c6rsicgMT4bGbvMehL05b31+XlXFH4oyJdmlb2xsotnRQBzxsTbua802acp7m0gebSkXX0nmugdVQ5CLyebAvTSsJisTtxnvK7TmVFUNta87wYMngnoSgq7jDMF8gsoiyEVooHH21KA69uvni6yNaGrg4t0WZmv4qIbTrlEOQsHt+yAZmPSwVtV9ocjZtzgE+hXM3rO1uMVs/jw9fn4tK1cYneqF6OfZa9U7J4ENzoKHrzReJ6HjpOKlpnEMfTS14CpWx05bzP6Q==
X-YMail-OSG: 2tXZmyQVM1na4AOFNcDU_PfbPhYC.okRS62Q4pYlKkNAqEPAFlFchS0AhL54oV0
 knGmOTrz.b9wr_UL8dwuOxaoR_.7DCKFq0nghdsTAMd30gRa20lVhA1UHD8HDCP.q.leOC4QxQAZ
 WVnGKXEOs0oRc8c6.vfvg0AdTaCBoyEHhwvP_2n80U3uaoN.lMp8oeVoBeneDc6ayx8Fb33woHZ_
 vn4D292omfynmftMPGFQYw0uH7QD4keBDiCCB_wcPAe_qR60a6L8SOY1kPT57w08xjyl3TyTRPrp
 3mL6jAD3hN6bRV4gvHsAtzY4fJOyqELpBXJeYXZ5NVymGXLcfgzUUfblMu7pJp_eUE06QZL_YyRe
 2Lvg4Aoyld5gpRaFy12Kvl.himk350txeQDs2od8rqCeqG2qaGZzLa.XZC6wrV5QvVPalwiqzADP
 ZjBfrlgCCZAKl94P1ATbe0wzORYvKix9L.0p.OF4nAmePCOtF3K8NM_ynUocLdaRF2lnblHxSmvs
 ON91ZzFqcpAn7qt378ViTnjh6vsVyNJo9XEOY3a.aTcki_lD7wnI7wAbJfAjCRynsIJ6c6ccY0Rs
 resy6CpOMhJg.8AjoIZDkbDAPTmesqNtiDltGVIuoKAQ_ui6p68_l4Q1PYZFTsTRQVVI4tf4OmIB
 _cF71j5ZvdqlLdd9UARw1MLRLvKvHlmh5TQvX_g9RkdCFbpj4imiT4u6LCJyRSDSObxIoryz.mOL
 lrt_Si7MA.xmOZZs.kDswzABZ2LyFNT_qx1fplB9e3NMXMEDqRUK7oOM0BkdEDdS5brPM.hMgmOS
 iHKa.hzkg92vANPhQH.OMSvH7oolkI.1ec8nw95hfx7.SIPXO2mQMrLtcLW87.VyARyOCmUZNveB
 s0AVz_l2EOGM8uHtqTZ130JzQezx9PqxoD9OTBlL7vt2YzHL_81HIRnDD4vc9_ABNcnewYDL4Cb_
 z5ueRn0dNHSVNt1h_iogBfPDuN6Qk0ABPNxoEoRNW7eW0t8h18SUYeflSG46geCCT_UUvHyEEzx9
 ejjsqE9AY3_H9Q0pbR3kMBDL6cmD2Xf9Xx6s9TfIsSdXI_chGHcZRXpdUuc9Yvs7gmIZ5APLmk_O
 yMbzv6NBdWI9CyIKx2LTQsivu57VIscJFfyyq7B.yhauU1GH1VpgCEaYw7nuigryZNLznQnm8JKn
 VzpeD_Zur0xqUccbRszmkqKz0SjNXiLa3X6.86QrkJ2z9tLVLgazemVVhpnf5Swa1Xm8Z.abV85l
 FoUb6fZuHpro6mLWvWiBCYTmbLnMxaDqum0qUlt0B1O1y4O__vzRVRdhaymRxzddlkSsgl83LDOQ
 JxYjg3_5elbxY3Sx3b3FPDVcIZaKlRCOW2u6efb0miolbIbUoBvTKvXl4zyhLqGqWCiGJvntSDfJ
 FrjEQRJZ3Q_L30zns0y0ZcD2oHHZOrGJvU4k8lOPISVKbhNty8I7sq5qq_NwY0es4s_mxbbdEuwo
 3f_uV1LnVvkB5Xd7D9b9aJloRrgKRT4TYG1Im1Pdnx8IVS69CQmcI9AkHpQgtD8yqbhaMbWMBIeE
 CUQ7QYAuSOPndG_LbiZDeQC79WrMAwLDIkyPW2JCbiGug.mZr4QbfIq9vkHKktGPHx5u9Q8Z2u5C
 QWHxWyF8LuZAtIMrsBWESX5koYKmNVa7NtxULrk2BHt3QhIXTfG_50RmUwdR637.Vl5pVTiZgpw6
 pFwxZMp2jbt3cd5B1YxA_2uW2Hndw1KmvwDIphiEYk.ptrnKbDA0mYC5l6HW_T4ANNJWnVS1d1sB
 _m2KDb2X6.jnKNCmFiJCWVgdgjHIRKc9_RiTwHp2uOycqL9o5RihBLmFBb_XA.Kp.FjQT6nxBdB_
 BLu0gby2TtnKKAsQdo1d3KRygoN.zFp2c4qQAgt76JAvV33.O808gvHMjzUu_i4RFXEQgCIL3dj_
 z2S7wsXrQ4YRo9ga2PZNst57HVRFbwrsO2VhvZuwf3e0oogD0rd_Y.thgnDxdzT658Lqo1GyfbJk
 BuYuo1pYqKSSHJ6I0p4N2Zlo2mg2jKBp8SKCfoFNLa9aVhTmjq.qGKQL7TkKsdLTe08hWlgs7pdR
 RLzeV251Q1QvRZz0YQ1JGnaIba7G107RCQmX3rJgJXfvXZ1_O5VM9U6fA4pE0DdFlTPVpJDKiiZ5
 dq7GGuaJ29Shv7S5eVFYHljzn_L.UKEmenXZWmnHBgtm4zK.a5Q1bGhGXli1TdFdmbVDIBBc8x6o
 TaleasQoV59w9JoyaldUKU0oKWaIqxFyR
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: 56673a5d-426d-43a5-a7d0-21fdf54ffe44
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Tomita Moeko <tomitamoeko@gmail.com>
Subject: [PATCH v6 1/7] xen/igd: get PCH info from host sysfs
Date: Fri, 11 Sep 2026 03:24:47 -0400
Message-ID: <20260911072453.46256-2-brchuckz@aol.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911072453.46256-1-brchuckz@aol.com>
References: <20260911072453.46256-1-brchuckz@aol.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1789111500-F687577B-4D8D2615/0/0
X-purgate-type: clean
X-purgate-size: 5969

The igd_combo_id_infos[] data is out of date with many
devices missing from igd_combo_id_infos[]. For newer
devices not in igd_combo_id_infos[], get the infos from
the host sysfs. If logging is configured, print log
messages displaying the PCH info used for the guest.

Introduce helper function xen_pt_get_host_pch_info() to
facilitate getting the necessary information from sysfs.
Treat failure to get the host PCH device id as an unrecoverable
error that causes guest creation to fail. If access to the host
PCH device revision id fails, print a warning message and use
a default value of 0x1 in that case.

Also, use errp in xen_igd_passthrough_isa_bridge_create()
to set errors from xen_pt_get_host_pch_info() and cleanup
on error path with xen_host_pci_device_put(&s->real_device)
and object_unparent(OBJECT(&d->rom)) for errors when creating
creating the IGD PCH bridge.

Add cleanup with object_unparent(OBJECT(&d->rom)) for errors
when setting up VGA BIOS for GFX passthrough.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
---
Changes in v6:
  - No changes

Changes in v5:
  - Shorten warn_report message to resolve checkpatch line length warning

Changes in v4:
  - re-wrote xen_pt_get_host_pch_info() using functions from
    xen-host-pci-device.h
  - add more error handling to clean up better after if errors occur
  - don't consider failure to get the PCH device revision id a fatal
    error but instead print a warning message and use a default value
    of 0x1

 hw/xen/xen_pt.c          | 10 +++++++++-
 hw/xen/xen_pt_graphics.c | 39 +++++++++++++++++++++++++++++++++++++--
 include/hw/xen/xen_igd.h |  3 ++-
 3 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 0fe9c0a..c8f08b5 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -862,12 +862,20 @@ static void xen_pt_realize(PCIDevice *d, Error **errp)
         if (*errp) {
             error_append_hint(errp, "Setup VGA BIOS of passthrough"
                               " GFX failed");
+            object_unparent(OBJECT(&d->rom));
             xen_host_pci_device_put(&s->real_device);
             return;
         }
 
         /* Register ISA bridge for passthrough GFX. */
-        xen_igd_passthrough_isa_bridge_create(s, &s->real_device);
+        xen_igd_passthrough_isa_bridge_create(s, &s->real_device, errp);
+        if (*errp) {
+            error_append_hint(errp, "Failed to create PCH bridge"
+                              " for passthrough GFX");
+            object_unparent(OBJECT(&d->rom));
+            xen_host_pci_device_put(&s->real_device);
+            return;
+        }
     }
 
     /* Handle real device's MMIO/PIO BARs */
diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index 7df9344..cf424bc 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -2,6 +2,7 @@
  * graphics passthrough
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/xen/xen_pt.h"
 #include "hw/xen/xen_igd.h"
@@ -376,8 +377,33 @@ static void pt_graphics_register_types(void)
 }
 type_init(pt_graphics_register_types)
 
+static void xen_pt_get_host_pch_info(uint16_t *pch_dev_id, uint8_t *pch_rev_id,
+                                     Error **errp)
+{
+    g_autofree XenHostPCIDevice *pch_dev = g_new(XenHostPCIDevice, 1);
+
+    xen_host_pci_device_get(pch_dev, 0, 0, 0x1f, 0, errp);
+    if (*errp) {
+        goto error;
+    }
+
+    *pch_dev_id = pch_dev->device_id;
+
+    if (xen_host_pci_get_byte(pch_dev, PCI_REVISION_ID, pch_rev_id)) {
+        *pch_rev_id = 0x1;
+        warn_report("IGD: failed to get host PCH revision, setting it to 0x1");
+    }
+
+    xen_host_pci_device_put(pch_dev);
+    return;
+
+error:
+    error_append_hint(errp, "failed to get host PCH device for Intel IGD");
+}
+
 void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
-                                           XenHostPCIDevice *dev)
+                                           XenHostPCIDevice *dev,
+                                           Error **errp)
 {
     PCIBus *bus = pci_get_bus(&s->dev);
     struct PCIDevice *bridge_dev;
@@ -394,7 +420,16 @@ void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
         }
     }
 
+    /* Newer devices get PCH infos from host sysfs */
+    if ((pch_dev_id == 0xffff) || !pch_rev_id) {
+        xen_pt_get_host_pch_info(&pch_dev_id, &pch_rev_id, errp);
+    }
+
+    XEN_PT_LOG(&s->dev, "PCH device id: 0x%x\n", pch_dev_id);
+    XEN_PT_LOG(&s->dev, "PCH revision: 0x%x\n", pch_rev_id);
+
     if (pch_dev_id == 0xffff) {
+        error_setg(errp, "failed to get PCH device id");
         return;
     }
 
@@ -406,7 +441,7 @@ void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
      * Note that vendor id is always PCI_VENDOR_ID_INTEL.
      */
     if (!bridge_dev) {
-        fprintf(stderr, "set igd-passthrough-isa-bridge failed!\n");
+        error_setg(errp, "set igd-passthrough-isa-bridge failed!");
         return;
     }
     pci_config_set_device_id(bridge_dev->config, pch_dev_id);
diff --git a/include/hw/xen/xen_igd.h b/include/hw/xen/xen_igd.h
index 7ffca06..da51f09 100644
--- a/include/hw/xen/xen_igd.h
+++ b/include/hw/xen/xen_igd.h
@@ -22,7 +22,8 @@ uint32_t igd_read_opregion(XenPCIPassthroughState *s);
 void xen_igd_reserve_slot(PCIBus *pci_bus);
 void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
 void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
-                                           XenHostPCIDevice *dev);
+                                           XenHostPCIDevice *dev,
+                                           Error **errp);
 
 static inline bool is_igd_vga_passthrough(XenHostPCIDevice *dev)
 {
-- 
2.52.0


