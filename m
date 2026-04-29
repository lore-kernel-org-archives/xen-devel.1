Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E797FF8864
	for <xen-devel@archiver.kernel.org>; Wed, 29 Apr 2026 05:44:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1296939.1573072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHxiR-00084z-LT; Wed, 29 Apr 2026 05:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296939.1573072; Wed, 29 Apr 2026 05:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHxiR-00084s-Ia; Wed, 29 Apr 2026 05:44:07 +0000
Received: by outflank-mailman (input) for mailman id 1296939;
 Wed, 29 Apr 2026 05:44:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bertrand.marquis@arm.com>) id 1wHxiQ-00084I-MM
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 05:44:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHxiQ-003p6b-21
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2026 07:44:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69f19aa3-e002-0a2a0a5209dd-0a2a450ae8ea-2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 07:44:06 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <bertrand.marquis@arm.com>)
 id 69f19aa5-56b3-0a2a450a0019-d98c6eac86d2-1
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2026 07:44:05 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 209DA2BCE;
 Tue, 28 Apr 2026 22:43:59 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.90.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EAE33F62B;
 Tue, 28 Apr 2026 22:44:03 -0700 (PDT)
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
	t=1777441444; bh=D0cWhXb5cOQnh67SWhy+Xw1f5uxdZNslX4hyB6LTlbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mP5yOT8W5xF9s2AHoIo0HBtQluRfUBB5R3yG9h/hpcntrzT1TI4lVdaFvPbZ22Ua2
	 mIvQ9MiuE5m5zwRgaUmg3JSK4ROlrF2xVxlIYmLWlag0x2D6lASoV+qnRQZWc/5ccr
	 bsi8k3W4LWPaLtKHmF2ZECs1o56euNT4DIGSZ11A=
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 1/6] xen/arm: ffa: Fix NPI injection when vcpu0 is offline
Date: Wed, 29 Apr 2026 07:43:22 +0200
Message-ID: <2a36253fca9c23681fea0d5493faeb3044de558d.1776955622.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776955622.git.bertrand.marquis@arm.com>
References: <cover.1776955622.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1777441446-4415A8B7-5EAC21DC/0/0
X-purgate-type: clean
X-purgate-size: 3404

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


