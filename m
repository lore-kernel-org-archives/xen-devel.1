Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41384606A338
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o0qU8dka
Received: from list by lists.xenproject.org with outflank-mailman.1487798.1690188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXP-0001Rq-3m; Fri, 13 Nov 2026 15:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487798.1690188; Fri, 13 Nov 2026 15:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtXN-0001M0-Ax; Fri, 13 Nov 2026 15:50:01 +0000
Received: by outflank-mailman (input) for mailman id 1487798;
 Fri, 13 Nov 2026 15:49:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtX8-0006u4-6J
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtX7-000WGx-Hn
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:45 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73193-e002-0a2a0a5209dd-0a2a4506dcbe-24
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:45 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73199-195a-0a2a45060019-d1558029d530-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:45 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so5709655e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:45 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:44 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584985; x=1795189785; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MjYvaprK7CG4YJcBEyVwTdpxbIjhantZ5n1hTme2Bvw=;
        b=o0qU8dka4LkgO5Xz6TpORzdo7qTRhVqyEhSZ4Fa5igpVj51hU8dAZSY2JxX6zJsLgN
         NiowG+6o8X1trqmATe6JritrCnac4YDhUVDtCAASbAjA7CAwAJY21QegvpTEQ80zmylW
         SJtbFdS/EiMNs3l2+RaUSkXncktYkSzUDxuTwgMP1r3EsBylNAWm3ft9vkBcwlbXOg5/
         qFdGmwzEiwkk3NBqwuIramrnJhicIbk/pMsnQdBj/ct9GOEUgakiwRoIEa2x+qzmvBK/
         7mWVXs/7gDxNpYJtPjRoR+lEew+wMhMolDk6ogZXhEMlRdR6/txGBcxNRfHgHX6FHMZA
         +B4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584985; x=1795189785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MjYvaprK7CG4YJcBEyVwTdpxbIjhantZ5n1hTme2Bvw=;
        b=SQQTH9YEmJq61qYSmJHzib4fEBoQ6i+D2WTtyFm7iSa+TAy1QxTv0I0WRdUDg+tidk
         RN+d4G7wL1590llKi8XJh2PSxU2/cGMFvda7AVvvQYC/ivkLfIX7uSrByWDcvOGuGtU4
         CqnFhaMPxOhAxLFBrJeVgpSg7nNG6UOSuI/nVAgpkvgdqneJOi+oo3vXtgWv3SJGcx8H
         qAROIG5UIeQKaOvDFc69SOxFbDUgywTksMkH8TzM4ZV+84S8EoHv6mo7CIQ8QmsqrCRV
         tIggliAhG0nCiVj3oAuGg851f0Dp4GruhC2dr8EYCw8Bvn+KCsy7nd5LOUhu6JfzdHJK
         fhlQ==
X-Gm-Message-State: APuU4Z//hnsyc8Skr+94DA811m+iLZd141hm5PBwqyVIf/GqDJuVTs7Y
	P8oNwG0p7H3KZ5JqK9+Upv7KwUIupuuVJDIxeMjUWB6Kc9VkMwirSxc6hh+Vkg==
X-Gm-Gg: AYBFou1Sze75S1WTNQKu1z/sNFii52gKb941DEpLaOMxlPYBP+zlrFYhoMfc6g2JxYd
	IoX4R/fPOQQwsou+UamuY0cOVslgrkxyz2BK4mut4hJj6aw+ZEPCt+rAIVnCscCI286OwmPp0GO
	OxGUp3WvjIannoPkyKEG/apt1jJn0OlIe4V/lIuZ3DZpOmkVXg3KzE3v7tkXQa2KGFqonT/V9Ul
	rsfiNHCaTb6mZ7M9g/1VxHPnRDZhvnMRnelzQxaDoSx8wHwreMqyIthzuCk3L0LyWO0tHbH7+jR
	btLWLbBgi8O0SRZp0nTe3kw1zeArhzhooi+CXRShEXzpctviOSskVHql0LYp2mUDF8oEDEIYW7M
	r2t9JPaU3vhRGarQQ+OoPpuiSSXJBN/V9F+KyQLertFUdZpdnRMZ+R6Lk8/7slsedH1TW5ca4DE
	rVe1m6Bd2Kk1LzLeWbdVct8PkSgU7MBdiM6sqrk8Yxc2VBSIV2/y98Xpo3t05Rhfxxc+6epAecc
	wWEBDKMbfz/m0KHKX/NyD34gkvwhNzRGCUpsBQCY+rkRJe0Vv4Fwa8cjvJGFl/SxZpHxANKNyaD
	1PLJVbzQ36K87Lx5Zw/3UOzVAJYtbTm8ElXDC+B3NOA4+XkcIw5M74GgcudhNLBwWGhgjYNHzkp
	CqcFy0sG1JO0F2A==
X-Received: by 2002:a05:600c:1d10:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4bb55a65ea5mr58628525e9.5.1794584984673;
        Fri, 13 Nov 2026 07:49:44 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 32/42] xen/riscv: remap interrupts to new IMSIC VS-file
Date: Fri, 13 Nov 2026 16:48:53 +0100
Message-ID: <cd42546d29e683f0aa0cab44f0ec5622f48075c0.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1794584985-FDE0E77B-3E7433AE/10/73395122804
X-purgate-type: spam
X-purgate-size: 9956
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement the first steps of migrating a vCPU to a different guest
interrupt file: take a new one on the vCPU's new pCPU with
imsic_vsfile_acquire(), which brings it to a clean state, maps it into
the guest's G-stage in place of the old one and records it in the
vCPU's IMSIC state. Then, if any interrupts at an APLIC are forwarded by
MSIs to the old interrupt file, reconfigure the APLIC to send them to
the new interrupt file.

Synchronize with the APLIC to ensure that no straggler MSIs will arrive
at the old interrupt file by running imsic_aplic_sync() on the pCPU
which owns that file, through the new imsic_call_on_cpu(): unlike the
new file, the old one belongs to another pCPU, which an IPI has to be
sent to.

The move maps the new file into the guest's G-stage, which takes the
p2m lock, and sends IPIs to the pCPU owning the old file, both of which
need IRQs enabled, while imsic_migrate_vcpu() is called with them
disabled. So do it in the new imsic_vsfile_move() and have
imsic_migrate_vcpu() enable IRQs around it, only when there is
something to move, which takes them to be disabled on entry, as an
ASSERT() checks.

Only a h/w file of another pCPU is moved: imsic_vsfile_needs_move()
keeps imsic_vsfile_move() from being reached for any other, as an
ASSERT() there checks.

Keep the BUG_ON("unimplemented") placeholder at the end of
imsic_vsfile_move() to guard against silent incorrect behaviour or
unexpected panics in guest VMs until the move is fully implemented.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Fold in "xen/riscv: prepare new IMSIC VS-file": with
   imsic_vsfile_acquire() already introduced by "xen/riscv: introduce
   IMSIC h/w interrupt file attaching to vcpu", taking and zeroing out
   the new file is a single call.
 - Move imsic_vsfile_acquire(), imsic_update_state(), the stubs of
   imsic_map_guest_file() and vgein_release() and the IOMMU TODO out of
   this patch, as they come with the attach now.
 - Move the file in the new imsic_vsfile_move(), which
   imsic_migrate_vcpu() runs with IRQs enabled, as imsic_migrate_vcpu()
   is now called with them disabled, by the vCPU itself on its way back
   to the guest.
 - Introduce imsic_call_on_cpu() here rather than in "xen/riscv:
   introduce IMSIC h/w interrupt file attaching to vcpu", as the old
   file is the first one to belong to another pCPU.
 - Don't panic() for a vCPU without a h/w file:
   imsic_vsfile_needs_move() keeps such a vCPU from being moved at all,
   so just ASSERT() it.
 - Update the commit message accordingly.
---
Changes in v3:
 - Update the commit message.
 - Move imsic_aplic_sync() and imsic_local_is_pending() to "xen/riscv:
   implement APLIC-IMSIC-hart sync barrier for vCPU migration" and only
   call the helper here.
 - compare old_vsfile_cpu against CPU_NONE instead of NR_CPUS.
 - Call vaplic_reconfigure_target() instead of aplic_reconfigure_target().
 - Update the comment at the start of the migration: at that point the new
   IMSIC VS-file is only being prepared, the interrupt producers are moved
   to it later.
 - Factor taking a h/w guest interrupt file (assign, zero out, map into
   G-stage and record in the per-vCPU IMSIC state) out of
   imsic_migrate_vcpu() into imsic_vsfile_acquire(), introduced here
   instead of in "xen/riscv: introduce IMSIC h/w interrupt file attaching
   to vcpu".
 - Crash the domain instead of BUG_ON()ing when no h/w guest interrupt
   file is free, and report which file could not be mapped.
 - Introduce the vgein_release() stub here, together with its first
   user: release the h/w guest interrupt file taken by
   imsic_vsfile_acquire() if mapping it into the guest fails. Drop the
   stray "\n" from its BUG_ON().
 - Clarify the comment ahead of imsic_vsfile_acquire() on why setting
   hstatus.VGEIN is left to the caller.
 - Implement imsic_update_state() here instead of leaving it a stub until
   "xen/riscv: introduce IMSIC h/w interrupt file attaching to vcpu": all
   it needs, vsfile_lock and CPU_NONE, is available already. The s/w
   IMSIC VS-file is recorded with vsfile_cpu == CPU_NONE rather than
   NR_CPUS.
 - Make imsic_update_state() static and drop its declaration from
   asm/imsic.h: imsic_vsfile_acquire() is its only user.
---
Changes in v2:
 - New patch.
---
---
 xen/arch/riscv/imsic.c | 103 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 99 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index 48214ab0d363..690a83fd6866 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -565,7 +565,9 @@ int cf_check vcpu_imsic_init(struct vcpu *v)
 
 /*
  * Arguments of the imsic_vsfile_local_*() helpers, which work on a guest
- * interrupt file of the pCPU they run on.
+ * interrupt file of the pCPU they run on. Those run on another pCPU go
+ * through imsic_call_on_cpu(), which passes a single pointer, hence the
+ * arguments are bundled.
  */
 struct imsic_vsfile_data {
     /* Guest interrupt file to work on, i.e. the hstatus.VGEIN selecting it. */
@@ -605,6 +607,33 @@ static void imsic_vsfile_deselect(const struct imsic_vsfile_ctx *ctx)
     csr_write(CSR_VSISELECT, ctx->vsiselect);
 }
 
+/*
+ * Execute func() on the pCPU which owns the IMSIC interrupt file func() is
+ * going to work with.
+ *
+ * An IMSIC VS-file is reachable only through hstatus.VGEIN of the hart the
+ * file belongs to, and a guest interrupt file index is meaningless on any
+ * other hart, so such work always has to be done by that very hart.
+ *
+ * The local case runs with IRQs disabled to provide func() with the same
+ * environment it is given when it is called from the function call IPI
+ * handler.
+ */
+static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
+                              struct imsic_vsfile_data *data)
+{
+    if ( cpu == smp_processor_id() )
+    {
+        unsigned long flags;
+
+        local_irq_save(flags);
+        func(data);
+        local_irq_restore(flags);
+    }
+    else
+        on_selected_cpus(cpumask_of(cpu), func, data, 1);
+}
+
 /*
  * Ensure that all the MSIs the APLIC has already generated for the hart this
  * runs on have really reached the hart's IMSIC.
@@ -616,7 +645,7 @@ static void imsic_vsfile_deselect(const struct imsic_vsfile_ctx *ctx)
  * any other hart, it has to be executed by the pCPU owning the interrupt file
  * the MSIs were being sent to.
  */
-static void __maybe_unused imsic_aplic_sync(void *unused)
+static void cf_check imsic_aplic_sync(void *unused)
 {
     imsic_local_eix_update(imsic_sync_id(&imsic_cfg), 1, true, false);
 
@@ -1077,7 +1106,8 @@ void imsic_vsfile_attach(struct vcpu *v)
  * A vCPU without a h/w file has none to move.
  *
  * No lock is needed: vsfile_cpu of a running vCPU is changed only by the vCPU
- * itself, when it acquires a file in imsic_vsfile_attach().
+ * itself, when it acquires a file in imsic_vsfile_attach() or
+ * imsic_migrate_vcpu().
  *
  * TODO: a s/w file, once supported, has to be moved too.
  */
@@ -1090,6 +1120,63 @@ static bool imsic_vsfile_needs_move(const struct vcpu *v)
     return cpu != CPU_NONE && cpu != smp_processor_id();
 }
 
+/*
+ * Move the h/w guest interrupt file of @v to the pCPU @v runs on, following
+ * "Migrating a virtual hart to a different guest interrupt file" in the AIA
+ * spec. Only called by imsic_migrate_vcpu(), see the requirements there.
+ */
+static void imsic_vsfile_move(struct vcpu *v)
+{
+    struct imsic_vsfile_data vsfile_data = {
+        .nr_eix = imsic_cfg.nr_eix,
+    };
+    struct vimsic_state *imsic_state = v->arch.vimsic_state;
+    unsigned long flags;
+    unsigned int old_vsfile_id;
+    unsigned int old_vsfile_cpu;
+
+    ASSERT(local_irq_is_enabled());
+    ASSERT(imsic_vsfile_needs_move(v));
+
+    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
+    old_vsfile_id = imsic_state->guest_file_id;
+    old_vsfile_cpu = imsic_state->vsfile_cpu;
+    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
+
+    /*
+     * At this point, all interrupt producers are still using the old IMSIC
+     * VS-file. Allocate and clear the new one before redirecting anything
+     * to it.
+     */
+
+    /* Zero-out, map and start to use the new IMSIC VS-file */
+    vsfile_data.hgei = imsic_vsfile_acquire(v);
+    if ( !vsfile_data.hgei )
+        return;
+
+    /*
+     * If any interrupts at an APLIC are forwarded by MSIs to the old interrupt
+     * file, reconfigure the APLIC to send them to the new interrupt file.
+     */
+    vaplic_reconfigure_target(v);
+
+    /*
+     * Synchronizing interactions between a hart and the APLIC.
+     *
+     * The MSIs to be flushed are the ones still on their way to the old
+     * interrupt file, so the barrier has to be done by the pCPU which owns
+     * that file.
+     */
+    imsic_call_on_cpu(old_vsfile_cpu, imsic_aplic_sync, NULL);
+
+    /*
+     * At this point, all interrupt producers have been moved
+     * to the new IMSIC VS-file.
+     */
+
+    BUG_ON("unimplemented");
+}
+
 /*
  * Make the h/w guest interrupt file of @v belong to the pCPU @v runs on.
  *
@@ -1101,9 +1188,17 @@ static bool imsic_vsfile_needs_move(const struct vcpu *v)
 void imsic_migrate_vcpu(struct vcpu *v)
 {
     ASSERT(v == current);
+    ASSERT(!local_irq_is_enabled());
 
     if ( !imsic_vsfile_needs_move(v) )
         return;
 
-    BUG_ON("unimplemented");
+    /*
+     * The move maps the new file into the guest's G-stage, which takes the
+     * p2m lock, and sends IPIs to the pCPU owning the old file: both need
+     * IRQs enabled.
+     */
+    local_irq_enable();
+    imsic_vsfile_move(v);
+    local_irq_disable();
 }
-- 
2.56.1


