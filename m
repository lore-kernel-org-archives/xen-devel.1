Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52C6C624D6
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:43:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407371.1640471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28fL-0000WE-7U; Thu, 03 Sep 2026 14:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407371.1640471; Thu, 03 Sep 2026 14:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28fL-0000W2-33; Thu, 03 Sep 2026 14:43:47 +0000
Received: by outflank-mailman (input) for mailman id 1407371;
 Thu, 03 Sep 2026 14:43:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bertrand.marquis@arm.com>) id 1x28fK-0000JR-5X
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:43:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28fJ-0045Cl-Ii
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:43:45 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 6a998799-bab6-0a2a0a5309dd-0a2a4508ed7e-24
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:43:45 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 6a9987a0-f659-0a2a45080019-d98c6eacc8ea-1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:43:45 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 927F41596;
 Thu,  3 Sep 2026 07:43:40 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.7.135])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EE593F673;
 Thu,  3 Sep 2026 07:43:42 -0700 (PDT)
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
	t=1788446624; bh=sExkGKD2p+tZsm+iivyfrVTc3F00OPetQljT4c3dyFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lMcGCeFd7vQgkbkyPQr0YNxNKPZbjqbpViXvFqfydaBwJoaJWf0H10lan6sAXx9DI
	 UGl9ZJ15dAUBqKhLTxhn+0M2YUyxS9OClykoytWExH+FDaT5u3noPrl35uhZLbJp9/
	 LYXCWvh4snqp5Nm+dAitouAG/l0a1p2CNCsHLtHg=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jenswi@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v3 1/6] xen/arm: ffa: Fix NPI injection when vcpu0 is offline
Date: Thu,  3 Sep 2026 16:43:26 +0200
Message-ID: <5c332672f58b0f2280d28a1682d53e91f576df17.1788268510.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788268510.git.bertrand.marquis@arm.com>
References: <cover.1788268510.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1788446625-CD34D87B-10FC8884/0/0
X-purgate-type: clean
X-purgate-size: 3431

RX-buffer-full notifications currently inject the notification pending
interrupt through vcpu0 only. Secure notification delivery already walks
the domain's online vCPUs, but the RX-buffer-full path does not. When
vcpu0 is offline, the notification remains pending and the guest never
receives it.

Extract the common notification injection path and reuse it from
ffa_raise_rx_buffer_full(). The shared helper delivers the global
notification to the first online vCPU and keeps the existing ratelimited
debug message when none are online.

Functional impact: RX-buffer-full notifications are delivered even when
vcpu0 is offline.

Fixes: 3935c705688e ("xen/arm: ffa: Add buffer full notification support")

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
---
Changes since v2:
- none
Changes since v1:
- add R-b from Jens
---
 xen/arch/arm/tee/ffa_notif.c | 45 ++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 186e72641237..07bc5cb3a430 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -19,6 +19,29 @@
 static bool __ro_after_init fw_notif_enabled;
 static unsigned int __ro_after_init notif_sri_irq;
 
+static void inject_notif_pending(struct domain *d)
+{
+    struct vcpu *v;
+
+    /*
+     * Since we're only delivering global notification, always
+     * deliver to the first online vCPU. It doesn't matter
+     * which we chose, as long as it's available.
+     */
+    for_each_vcpu(d, v)
+    {
+        if ( is_vcpu_online(v) )
+        {
+            vgic_inject_irq(d, v, GUEST_FFA_NOTIF_PEND_INTR_ID, true);
+            return;
+        }
+    }
+
+    if ( printk_ratelimit() )
+        printk(XENLOG_G_DEBUG "%pd: ffa: can't inject NPI, all vCPUs offline\n",
+               d);
+}
+
 int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
 {
     struct domain *d = current->domain;
@@ -190,7 +213,7 @@ void ffa_raise_rx_buffer_full(struct domain *d)
 
     ACCESS_ONCE(ctx->notif.buff_full_pending) = true;
     if ( !test_and_set_bool(ctx->notif.vm_pending) )
-        vgic_inject_irq(d, d->vcpu[0], GUEST_FFA_NOTIF_PEND_INTR_ID, true);
+        inject_notif_pending(d);
 }
 #endif
 
@@ -238,7 +261,6 @@ static void notif_vm_pend_intr(uint16_t vm_id)
 {
     struct ffa_ctx *ctx;
     struct domain *d;
-    struct vcpu *v;
 
     /*
      * vm_id == 0 means a notifications pending for Xen itself, but
@@ -277,24 +299,7 @@ static void notif_vm_pend_intr(uint16_t vm_id)
      * it.
      */
     ACCESS_ONCE(ctx->notif.secure_pending) = true;
-
-    /*
-     * Since we're only delivering global notification, always
-     * deliver to the first online vCPU. It doesn't matter
-     * which we chose, as long as it's available.
-     */
-    for_each_vcpu(d, v)
-    {
-        if ( is_vcpu_online(v) )
-        {
-            vgic_inject_irq(d, v, GUEST_FFA_NOTIF_PEND_INTR_ID,
-                            true);
-            break;
-        }
-    }
-    if ( !v && printk_ratelimit() )
-        printk(XENLOG_G_DEBUG "%pd: ffa: can't inject NPI, all vCPUs offline\n",
-               d);
+    inject_notif_pending(d);
 
 out_unlock:
     rcu_unlock_domain(d);
-- 
2.53.0


