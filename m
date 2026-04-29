Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ABECCFA18
	for <xen-devel@archiver.kernel.org>; Wed, 29 Apr 2026 05:44:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1296942.1573082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHxiT-0008J8-Rw; Wed, 29 Apr 2026 05:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296942.1573082; Wed, 29 Apr 2026 05:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHxiT-0008Iz-P6; Wed, 29 Apr 2026 05:44:09 +0000
Received: by outflank-mailman (input) for mailman id 1296942;
 Wed, 29 Apr 2026 05:44:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bertrand.marquis@arm.com>) id 1wHxiS-0008En-GJ
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 05:44:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHxiR-0078Bd-S1
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 07:44:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69f19a9f-5cb7-0a2a0a5109dd-0a2a4507ede2-12
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 07:44:07 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69f19aa6-229c-0a2a45070019-d98c6eacb28e-1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 07:44:07 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C745D328D;
 Tue, 28 Apr 2026 22:44:00 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.90.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB45A3F62B;
 Tue, 28 Apr 2026 22:44:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777441446; bh=IvYNqDbera/Ke8I0F2UPOw6J8/rPOohK8qd0lYFvQZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=inm5aBwxI6owTAxlvk6jPjRmOK55M16BCQgB5DNdQ/iBYs8C7yhJXqo06rL/wuu0w
	 43oOdT64yp7kACF+j41i1kQHlbRVvv4EqgZQTvdy37cPjUdw+/LfgDdi9feTyf7McC
	 hYscRSAFQ+daJBvOFLXT3j5e/qQiKt/G4s4UbyaM=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 2/6] xen/arm: ffa: Track hypervisor notifications in a bitmap
Date: Wed, 29 Apr 2026 07:43:23 +0200
Message-ID: <b83650603daa853d7069748a2575ebe6ece040c2.1776955622.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776955622.git.bertrand.marquis@arm.com>
References: <cover.1776955622.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1777441447-AD364C48-2A5E094F/0/0
X-purgate-type: clean
X-purgate-size: 6808

Hypervisor notifications are currently tracked with a dedicated
buff_full_pending boolean. The old RX-buffer-full path also exposed a
pending indication indirectly via vm_pending, so
FFA_NOTIFICATION_INFO_GET could clear that summary before the guest
retrieved the Hypervisor notification bitmap with
FFA_NOTIFICATION_GET.

Replace the single boolean with a Hypervisor notification bitmap
protected by notif_lock. INFO_GET reports pending when hyp_pending is
non-zero, GET returns and clears the HYP bitmap under the lock, and
RX-buffer-full now keeps notif_lock held across the local NPI
decision. notif_irq_raised is only set when an NPI is actually
injected, and is cleared once the local pending state is consumed.

Initialize and clear the bitmap during domain lifecycle handling, and
use ctx->ffa_id for bitmap create and destroy so the notification
state stays tied to the cached FF-A endpoint ID.

If the local injection attempt fails because no vCPU is online,
hyp_pending remains set and notif_irq_raised remains clear. This
keeps the RX-buffer-full notification pending until the guest
retrieves it, without publishing a successful local IRQ state too
early.

Functional impact: RX-buffer-full remains pending in hyp_pending
until FFA_NOTIFICATION_GET, and failed local NPI injection no longer
leaves Xen thinking the interrupt was already raised.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
- clarify that v1 exposed RX-buffer-full indirectly via vm_pending
- document that v2 keeps the HYP pending indication until
  FFA_NOTIFICATION_GET
- keep RX-buffer-full pending state stable across failed local NPI
  injection attempts
---
 xen/arch/arm/tee/ffa_notif.c   | 56 ++++++++++++++++++++++++++--------
 xen/arch/arm/tee/ffa_private.h | 15 +++++++--
 2 files changed, 56 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 07bc5cb3a430..a631481e3815 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -19,7 +19,7 @@
 static bool __ro_after_init fw_notif_enabled;
 static unsigned int __ro_after_init notif_sri_irq;
 
-static void inject_notif_pending(struct domain *d)
+static bool inject_notif_pending(struct domain *d)
 {
     struct vcpu *v;
 
@@ -33,13 +33,15 @@ static void inject_notif_pending(struct domain *d)
         if ( is_vcpu_online(v) )
         {
             vgic_inject_irq(d, v, GUEST_FFA_NOTIF_PEND_INTR_ID, true);
-            return;
+            return true;
         }
     }
 
     if ( printk_ratelimit() )
         printk(XENLOG_G_DEBUG "%pd: ffa: can't inject NPI, all vCPUs offline\n",
                d);
+
+    return false;
 }
 
 int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
@@ -94,8 +96,15 @@ void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
 
     notif_pending = test_and_clear_bool(ctx->notif.secure_pending);
     if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+    {
         notif_pending |= test_and_clear_bool(ctx->notif.vm_pending);
 
+        spin_lock(&ctx->notif.notif_lock);
+        if ( ctx->notif.hyp_pending )
+            notif_pending = true;
+        spin_unlock(&ctx->notif.notif_lock);
+    }
+
     if ( notif_pending )
     {
         /* A pending global notification for the guest */
@@ -174,12 +183,19 @@ void ffa_handle_notification_get(struct cpu_user_regs *regs)
             w6 = resp.a6;
     }
 
-    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) &&
-          flags & FFA_NOTIF_FLAG_BITMAP_HYP &&
-          test_and_clear_bool(ctx->notif.buff_full_pending) )
+    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
     {
-        ACCESS_ONCE(ctx->notif.vm_pending) = false;
-        w7 = FFA_NOTIF_RX_BUFFER_FULL;
+        spin_lock(&ctx->notif.notif_lock);
+
+        if ( (flags & FFA_NOTIF_FLAG_BITMAP_HYP) && ctx->notif.hyp_pending )
+        {
+            w7 = ctx->notif.hyp_pending;
+            ctx->notif.hyp_pending = 0;
+            if ( !ctx->notif.vm_pending )
+                ctx->notif.notif_irq_raised = false;
+        }
+
+        spin_unlock(&ctx->notif.notif_lock);
     }
 
     ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
@@ -211,9 +227,12 @@ void ffa_raise_rx_buffer_full(struct domain *d)
     if ( !ctx )
         return;
 
-    ACCESS_ONCE(ctx->notif.buff_full_pending) = true;
-    if ( !test_and_set_bool(ctx->notif.vm_pending) )
-        inject_notif_pending(d);
+    spin_lock(&ctx->notif.notif_lock);
+    ctx->notif.hyp_pending |= FFA_NOTIF_RX_BUFFER_FULL;
+    if ( !ctx->notif.notif_irq_raised &&
+         inject_notif_pending(d) )
+        ctx->notif.notif_irq_raised = true;
+    spin_unlock(&ctx->notif.notif_lock);
 }
 #endif
 
@@ -426,12 +445,16 @@ void ffa_notif_init(void)
 
 int ffa_notif_domain_init(struct domain *d)
 {
+    struct ffa_ctx *ctx = d->arch.tee;
     int32_t res;
 
+    spin_lock_init(&ctx->notif.notif_lock);
+    ctx->notif.notif_irq_raised = false;
+    ctx->notif.hyp_pending = 0;
+
     if ( fw_notif_enabled )
     {
-
-        res = ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_vcpus);
+        res = ffa_notification_bitmap_create(ctx->ffa_id, d->max_vcpus);
         if ( res )
             return -ENOMEM;
     }
@@ -441,10 +464,17 @@ int ffa_notif_domain_init(struct domain *d)
 
 void ffa_notif_domain_destroy(struct domain *d)
 {
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    spin_lock(&ctx->notif.notif_lock);
+    ctx->notif.notif_irq_raised = false;
+    ctx->notif.hyp_pending = 0;
+    spin_unlock(&ctx->notif.notif_lock);
+
     /*
      * Call bitmap_destroy even if bitmap create failed as the SPMC will
      * return a DENIED error that we will ignore.
      */
     if ( fw_notif_enabled )
-        ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
+        ffa_notification_bitmap_destroy(ctx->ffa_id);
 }
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index c291f32b56ff..9ddda3f88986 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -340,9 +340,20 @@ struct ffa_ctx_notif {
     bool vm_pending;
 
     /*
-     * True if domain has buffer full notification pending
+     * Lock protecting the hypervisor-managed notification state.
      */
-    bool buff_full_pending;
+    spinlock_t notif_lock;
+
+    /*
+     * Tracks whether a local notification pending interrupt was raised.
+     * Protected by notif_lock.
+     */
+    bool notif_irq_raised;
+
+    /*
+     * Bitmap of pending hypervisor notifications (for HYP bitmap queries).
+     */
+    uint32_t hyp_pending;
 };
 
 struct ffa_ctx {
-- 
2.53.0


