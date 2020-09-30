Return-Path: <SRS0=Shbi=DH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9842C4727E
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 10:41:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EACD2074A
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 10:41:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="M/Uy37wQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EACD2074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.546.1831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZY9-0000qV-8q; Wed, 30 Sep 2020 10:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546.1831; Wed, 30 Sep 2020 10:41:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZY9-0000qM-54; Wed, 30 Sep 2020 10:41:29 +0000
Received: by outflank-mailman (input) for mailman id 546;
 Wed, 30 Sep 2020 10:41:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNZY8-0000jt-FU
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:28 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c5586bf-01ba-452c-b2e3-75f944a0f0e7;
 Wed, 30 Sep 2020 10:41:23 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNZY8-0000jt-FU
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:28 +0000
X-Inumbo-ID: 8c5586bf-01ba-452c-b2e3-75f944a0f0e7
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8c5586bf-01ba-452c-b2e3-75f944a0f0e7;
	Wed, 30 Sep 2020 10:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601462484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DOoYCUCIJY+vFlpg+nSL1rviBn+NUIR7lMLQ2Z29s3s=;
  b=M/Uy37wQB2A21MY9vcKe9fSOurTWAFS+aeFIqKbONXKyY9FWrgXaLCNJ
   3cFey2DebBJx0+3Tp/3l6kVbWGq0mLtXapbviA94zyXwuDCFR3rJwxK8Z
   hs8rp/kY6hK7GLSbHdrfOWxQOFFHAyfHvBmHffE3eqatGaP57OvOvdq6J
   Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: c4EK/t+K8VPBhs5eUFrHDaDOZVzjSOAoUR4J7qTDDFy+kSOSnuiAJGUSe/x02v4spUtIZ24Uz0
 icgbJ8TDK9Geaoh+MvJFBKcH1fhavhTOBQc+HelrFUbjQ8jIDwuhnpTwp/5hjbSNzDzul7d/+v
 CqZT8WLV1DaELWnLIu47OBjmWll8o9ndmBPFZmW+GZOr87YlPNlj2ktN8gFoGxOXwg5gMx86Bl
 U0D+UCD5+hdR+hqeV3DwLJZ96vdV2YIN+cJnGuY8QG8rBBkxBevIr0Iej5+OuMYx3heHpcJuP/
 5eA=
X-SBRS: None
X-MesageID: 27927008
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="27927008"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: [PATCH v2 04/11] x86/vmsi: use the newly introduced EOI callbacks
Date: Wed, 30 Sep 2020 12:41:01 +0200
Message-ID: <20200930104108.35969-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930104108.35969-1-roger.pau@citrix.com>
References: <20200930104108.35969-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Remove the unconditional call to hvm_dpci_msi_eoi in vlapic_handle_EOI
and instead use the newly introduced EOI callback mechanism in order
to register a callback for MSI vectors injected from passed through
devices.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vlapic.c    |  2 --
 xen/arch/x86/hvm/vmsi.c      | 36 ++++++++++++++++++++++--------------
 xen/drivers/passthrough/io.c |  2 +-
 xen/include/asm-x86/hvm/io.h |  2 +-
 4 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 38c62a02e6..8a18b33428 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -496,8 +496,6 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
     if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
         vioapic_update_EOI(vector);
 
-    hvm_dpci_msi_eoi(vector);
-
     spin_lock_irqsave(&vlapic->callback_lock, flags);
     callback = vlapic->callbacks[index].callback;
     vlapic->callbacks[index].callback = NULL;
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 7ca19353ab..e192c4c6da 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -44,11 +44,9 @@
 #include <asm/event.h>
 #include <asm/io_apic.h>
 
-static void vmsi_inj_irq(
-    struct vlapic *target,
-    uint8_t vector,
-    uint8_t trig_mode,
-    uint8_t delivery_mode)
+static void vmsi_inj_irq(struct vlapic *target, uint8_t vector,
+                         uint8_t trig_mode, uint8_t delivery_mode,
+                         vlapic_eoi_callback_t *callback, void *data)
 {
     HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "vmsi_inj_irq: vec %02x trig %d dm %d\n",
                 vector, trig_mode, delivery_mode);
@@ -57,17 +55,17 @@ static void vmsi_inj_irq(
     {
     case dest_Fixed:
     case dest_LowestPrio:
-        vlapic_set_irq(target, vector, trig_mode);
+        vlapic_set_irq_callback(target, vector, trig_mode, callback, data);
         break;
     default:
         BUG();
     }
 }
 
-int vmsi_deliver(
-    struct domain *d, int vector,
-    uint8_t dest, uint8_t dest_mode,
-    uint8_t delivery_mode, uint8_t trig_mode)
+static int vmsi_deliver_callback(struct domain *d, int vector, uint8_t dest,
+                                 uint8_t dest_mode, uint8_t delivery_mode,
+                                 uint8_t trig_mode,
+                                 vlapic_eoi_callback_t *callback, void *data)
 {
     struct vlapic *target;
     struct vcpu *v;
@@ -78,7 +76,8 @@ int vmsi_deliver(
         target = vlapic_lowest_prio(d, NULL, 0, dest, dest_mode);
         if ( target != NULL )
         {
-            vmsi_inj_irq(target, vector, trig_mode, delivery_mode);
+            vmsi_inj_irq(target, vector, trig_mode, delivery_mode, callback,
+                         data);
             break;
         }
         HVM_DBG_LOG(DBG_LEVEL_VLAPIC, "null MSI round robin: vector=%02x\n",
@@ -89,8 +88,8 @@ int vmsi_deliver(
         for_each_vcpu ( d, v )
             if ( vlapic_match_dest(vcpu_vlapic(v), NULL,
                                    0, dest, dest_mode) )
-                vmsi_inj_irq(vcpu_vlapic(v), vector,
-                             trig_mode, delivery_mode);
+                vmsi_inj_irq(vcpu_vlapic(v), vector, trig_mode, delivery_mode,
+                             callback, data);
         break;
 
     default:
@@ -103,6 +102,14 @@ int vmsi_deliver(
     return 0;
 }
 
+
+int vmsi_deliver(struct domain *d, int vector, uint8_t dest, uint8_t dest_mode,
+                 uint8_t delivery_mode, uint8_t trig_mode)
+{
+    return vmsi_deliver_callback(d, vector, dest, dest_mode, delivery_mode,
+                                 trig_mode, NULL, NULL);
+}
+
 void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
 {
     uint32_t flags = pirq_dpci->gmsi.gflags;
@@ -119,7 +126,8 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
 
     ASSERT(pirq_dpci->flags & HVM_IRQ_DPCI_GUEST_MSI);
 
-    vmsi_deliver(d, vector, dest, dest_mode, delivery_mode, trig_mode);
+    vmsi_deliver_callback(d, vector, dest, dest_mode, delivery_mode, trig_mode,
+                          hvm_dpci_msi_eoi, NULL);
 }
 
 /* Return value, -1 : multi-dests, non-negative value: dest_vcpu_id */
diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
index 536e91ad76..bff0f6628a 100644
--- a/xen/drivers/passthrough/io.c
+++ b/xen/drivers/passthrough/io.c
@@ -874,7 +874,7 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
     return 0;
 }
 
-void hvm_dpci_msi_eoi(unsigned int vector)
+void hvm_dpci_msi_eoi(unsigned int vector, void *data)
 {
     struct domain *d = current->domain;
 
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index b05f619435..759ee486af 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -158,7 +158,7 @@ struct hvm_hw_stdvga {
 void stdvga_init(struct domain *d);
 void stdvga_deinit(struct domain *d);
 
-extern void hvm_dpci_msi_eoi(unsigned int vector);
+void hvm_dpci_msi_eoi(unsigned int vector, void *data);
 
 /* Decode a PCI port IO access into a bus/slot/func/reg. */
 unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
-- 
2.28.0


