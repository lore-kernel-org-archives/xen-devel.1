Return-Path: <SRS0=1DY5=BW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975F1C433E1
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2020 12:47:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A5CF2065C
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2020 12:47:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="hRlttDK0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A5CF2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5qAM-0006ZE-2a; Wed, 12 Aug 2020 12:47:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOR4=BW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k5qAK-0006Z7-9v
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 12:47:36 +0000
X-Inumbo-ID: fbf30c5e-94f0-4b1f-b9ca-681d9e76d3b7
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbf30c5e-94f0-4b1f-b9ca-681d9e76d3b7;
 Wed, 12 Aug 2020 12:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597236454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RMMcsLD/KcDYLodGRvqFlaK4w7aFPFtvoU9qkwikcpg=;
 b=hRlttDK0tiwtYhtzMtfQba/bPGC+XkSSBC5Otq9NSTdw7+2C6qKuyup1
 kb8nmquw79mv22UYl9+BGaybbu56R1dFjUVVTWmTHg7Va/E4rZaztMSQl
 zhAQ86sLW9kmwTGELJg/uemsdQ7RNTh5SJtbhuQxBd5dBxQgBvUsCFhjW g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: nALQ6yUfQTeZmqXydU1HL/98BFWsiX10YKKWzWViXnXlwJ/7HTXnSa2y9zasrCXgDb+UrBsP3D
 IhraPQ9sLiVZ6e1s2L2lk7vKXCc/Hf6HlW7Pg3Q/ZojtviP07FdCw/sJj7qD7xI+cUF/k1Sr5E
 uMRIu1lFq4GImUgNMZSOSlMsxjEUpnAdkItYAAlo6Mo51eFlRntGEmbIyXICQzZsamHU7viKP5
 kop3oOva/x71UosbAyPfu/muJwkbd3/Uwg8JUUxJj2ipy0VzWTOpMTFU8sd++ueyEFg+n4KBHj
 MXM=
X-SBRS: 2.7
X-MesageID: 24673469
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,304,1592884800"; d="scan'208";a="24673469"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/5] x86/vlapic: introduce an EOI callback mechanism
Date: Wed, 12 Aug 2020 14:47:06 +0200
Message-ID: <20200812124709.4165-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812124709.4165-1-roger.pau@citrix.com>
References: <20200812124709.4165-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add a new vlapic_set_irq_callback helper in order to inject a vector
and set a callback to be executed when the guest performs the end of
interrupt acknowledgment.

Such functionality will be used to migrate the current ad hoc handling
done in vlapic_handle_EOI for the vectors that require some logic to
be executed when the end of interrupt is performed.

No current users are migrated to use this new functionality yet, so
not functional change expected as a result.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vlapic.c        | 54 ++++++++++++++++++++++++++++++--
 xen/include/asm-x86/hvm/vlapic.h | 10 ++++++
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 7b5c633033..7369be468b 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -144,7 +144,8 @@ bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec)
     return vlapic_test_vector(vec, &vlapic->regs->data[APIC_IRR]);
 }
 
-void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
+void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
+                             vlapic_eoi_callback_t *callback, void *data)
 {
     struct vcpu *target = vlapic_vcpu(vlapic);
 
@@ -159,8 +160,26 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
     else
         vlapic_clear_vector(vec, &vlapic->regs->data[APIC_TMR]);
 
+    if ( callback )
+    {
+        unsigned long flags;
+
+        spin_lock_irqsave(&vlapic->callback_lock, flags);
+        vlapic->callbacks[vec].callback = callback;
+        vlapic->callbacks[vec].data = data;
+        spin_unlock_irqrestore(&vlapic->callback_lock, flags);
+    }
+    else
+        /*
+         * Removing the callback can be done with a single atomic operation
+         * without requiring the lock, as the callback data doesn't need to be
+         * cleared.
+         */
+        write_atomic(&vlapic->callbacks[vec].callback, NULL);
+
     if ( hvm_funcs.update_eoi_exit_bitmap )
-        alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec, trig);
+        alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec,
+                          trig || callback);
 
     if ( hvm_funcs.deliver_posted_intr )
         alternative_vcall(hvm_funcs.deliver_posted_intr, target, vec);
@@ -168,6 +187,11 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
         vcpu_kick(target);
 }
 
+void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
+{
+    vlapic_set_irq_callback(vlapic, vec, trig, NULL, NULL);
+}
+
 static int vlapic_find_highest_isr(const struct vlapic *vlapic)
 {
     return vlapic_find_highest_vector(&vlapic->regs->data[APIC_ISR]);
@@ -461,6 +485,9 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
 {
     struct vcpu *v = vlapic_vcpu(vlapic);
     struct domain *d = v->domain;
+    vlapic_eoi_callback_t *callback;
+    void *data;
+    unsigned long flags;
 
     /* All synic SINTx vectors are edge triggered */
 
@@ -470,6 +497,14 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
         viridian_synic_ack_sint(v, vector);
 
     hvm_dpci_msi_eoi(d, vector);
+
+    spin_lock_irqsave(&vlapic->callback_lock, flags);
+    callback = vlapic->callbacks[vector].callback;
+    data = vlapic->callbacks[vector].data;
+    spin_unlock_irqrestore(&vlapic->callback_lock, flags);
+
+    if ( callback )
+        callback(v, vector, data);
 }
 
 static bool_t is_multicast_dest(struct vlapic *vlapic, unsigned int short_hand,
@@ -1636,9 +1671,23 @@ int vlapic_init(struct vcpu *v)
     }
     clear_page(vlapic->regs);
 
+    if ( !vlapic->callbacks )
+    {
+        vlapic->callbacks = xmalloc_array(typeof(*(vlapic->callbacks)),
+                                          X86_NR_VECTORS);
+        if ( !vlapic->callbacks )
+        {
+            dprintk(XENLOG_ERR, "alloc vlapic callbacks error: %d/%d\n",
+                    v->domain->domain_id, v->vcpu_id);
+            return -ENOMEM;
+        }
+    }
+    memset(vlapic->callbacks, 0, sizeof(*(vlapic->callbacks)) * X86_NR_VECTORS);
+
     vlapic_reset(vlapic);
 
     spin_lock_init(&vlapic->esr_lock);
+    spin_lock_init(&vlapic->callback_lock);
 
     tasklet_init(&vlapic->init_sipi.tasklet, vlapic_init_sipi_action, v);
 
@@ -1660,6 +1709,7 @@ void vlapic_destroy(struct vcpu *v)
     destroy_periodic_time(&vlapic->pt);
     unmap_domain_page_global(vlapic->regs);
     free_domheap_page(vlapic->regs_page);
+    XFREE(vlapic->callbacks);
 }
 
 /*
diff --git a/xen/include/asm-x86/hvm/vlapic.h b/xen/include/asm-x86/hvm/vlapic.h
index 8f908928c3..6782508a68 100644
--- a/xen/include/asm-x86/hvm/vlapic.h
+++ b/xen/include/asm-x86/hvm/vlapic.h
@@ -73,6 +73,9 @@
 #define vlapic_clear_vector(vec, bitmap)                                \
     clear_bit(VEC_POS(vec), (uint32_t *)((bitmap) + REG_POS(vec)))
 
+typedef void vlapic_eoi_callback_t(struct vcpu *v, unsigned int vector,
+                                   void *data);
+
 struct vlapic {
     struct hvm_hw_lapic      hw;
     struct hvm_hw_lapic_regs *regs;
@@ -89,6 +92,11 @@ struct vlapic {
         uint32_t             icr, dest;
         struct tasklet       tasklet;
     } init_sipi;
+    struct {
+        vlapic_eoi_callback_t *callback;
+        void                 *data;
+    } *callbacks;
+    spinlock_t               callback_lock;
 };
 
 /* vlapic's frequence is 100 MHz */
@@ -111,6 +119,8 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val);
 bool_t is_vlapic_lvtpc_enabled(struct vlapic *vlapic);
 
 bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec);
+void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
+                             vlapic_eoi_callback_t *callback, void *data);
 void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig);
 
 int vlapic_has_pending_irq(struct vcpu *v);
-- 
2.28.0


