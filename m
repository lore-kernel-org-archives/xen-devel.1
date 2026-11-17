Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4582A606A323
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 11:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=V2Xm8z2x
Received: from list by lists.xenproject.org with outflank-mailman.1492245.1692961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHnD-0006tG-Fy; Tue, 17 Nov 2026 11:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492245.1692961; Tue, 17 Nov 2026 11:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTHnD-0006t7-DI; Tue, 17 Nov 2026 11:56:07 +0000
Received: by outflank-mailman (input) for mailman id 1492245;
 Tue, 17 Nov 2026 11:56:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTHnB-0006gY-IH
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 11:56:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTHnA-001StX-Ty
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 12:56:04 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afc40c5-e002-0a2a0a5209dd-0a2a4505dfcc-42
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:56:04 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afc40d4-4cb1-0a2a45050019-d1558034c5cb-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 12:56:04 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4bb5b8ef642so29943545e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 03:56:04 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a43d41ec2dsm3659291f8f.14.2026.11.17.03.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 03:56:03 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794916564; x=1795521364; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9zYUmOaqU447730wGgnlVelCxNkZ/i92B91ibq7b3Cg=;
        b=V2Xm8z2xhQgPeRb4QaUW+p8Nq+6BK0o2vT91teIaIOSEX/jfQQxTPWUp7V7T7ZGAQx
         EUg6QDQmmolvchOnszRCu7KCd/EfwPZ8DMTEVrQVLxses6gpaLrqvmAH5WuUXK9/gmln
         qYs05SGgEh0N8ctXYh9+iOjI+nrHg7q9B+CL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916564; x=1795521364;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9zYUmOaqU447730wGgnlVelCxNkZ/i92B91ibq7b3Cg=;
        b=AVCSMN4p7iveX2MZQBovdNd42GK1/0BDlAIS+XBfRQAu99MGANg33aHSWMV8aNzc9r
         vsz8THzK15IHByWjbunDdPbZ8VF2/IiLl7n4/lG0mKHgXH7/i34d3sTb58b2PaOUyZGw
         DekUIvkQcn5Unrko11YhJBk+Hg8uxDRXeT/2sb3tbAmaOFs3w40vauDPWpdSvTK3u8CQ
         /ngHofjpQe330lZjRj7jXYNj5ju9wYvPx/Dw8JKR2UrjulDaY6l2t6OkSP26J7v5K7QH
         04iPFyhcVVmGXbA9i1/5f4Rts9AJ5yNRD+uWbLHnJd+2CB3SODgUu5K8FcCWaPvJF2af
         vzeg==
X-Gm-Message-State: APuU4Z9Jj7X86yQdqrxeXjM2pxv9JW4dffO4bOWgVQ+JNa7iP4FRVsRL
	58NGFSsWLQnIpEsaFeecaULLNCIZE0+KPrmaEVUvOHC4TAFR2aOdUq/KUIw0qM72ckqGM9Z/Rtn
	B5srtrwY=
X-Gm-Gg: AYBFou0Cmwb+b6GhmDgcbI/gudhLJR7gf4AtXuSx91ETaaaDP74v/f3yIG/ROxe1L4N
	sggXUUY0t4bzEAXZJU4gwBDHLEvdq/gr4kSigZe+65+QWBO3UtgTBwt9zUVwN8je/mSpO92aeLg
	cTSfqHwUIRPMtP0A1+22nVuXyR6kmJb2prwjdLiDwMI1LOlZSpjkQqOddnODooVge/rsXalTJmI
	5wcVg270a7+dsww/0n21Z6OJT2MjvJKlOqTcTNbufl8XXgtghl3O9LcVwfboxChi6EgI2L+cgfn
	32WbbRaOO7xt/SeWdz3XhCYAZuOIvR5swxftX5ZuFMSEZIh282K8hltGLIb5VMK1RBVggHU01uh
	l2hXlXEdz62K3h3gIgsXyW7RTFFBQrDHyHKanfsBLwle0XxacUO2XWWAZSA+BmTXVMJP8cxUKoj
	83yS+/BlQMwz/Luu6ncSLfuKq4isGTQAlDx+ITgNe66yzk99ssIossYuQCiXnRk00mDz08qKFN4
	kI30xc1230oqMgX55JyCAxo6GfTYJeJ4hL+CqGBmfq13Wbiyq6MuyFUkFpQKjhluCWjaeQNvmci
	LxJlOZWRUu7+ge4ybMR4UtaKZdEuRzgOAOLZd/reJwSf9CM8yx4PvvsFDLdksSG2f01LztgaYt8
	qx44=
X-Received: by 2002:a05:600c:4f12:b0:4bb:65ed:b55c with SMTP id 5b1f17b1804b1-4bb65edbbcemr211610935e9.33.1794916563808;
        Tue, 17 Nov 2026 03:56:03 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>
Subject: [PATCH 1/3] xen/treewide: Convert all #ifndef NDEBUG to CONFIG_DEBUG
Date: Tue, 17 Nov 2026 11:55:47 +0000
Message-Id: <20261117115549.3872611-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117115549.3872611-1-andrew.cooper3@citrix.com>
References: <20261117115549.3872611-1-andrew.cooper3@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1794916564-732B32A1-9EA77F49/10/78276251493
X-purgate-type: spam
X-purgate-size: 31766
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We have two ways of spelling debug build in Xen, one with positive form and
one with an inverted form.

Switch to consistently using CONFIG_DEBUG in order to remove NDEBUG.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 xen/arch/arm/gic-vgic.c                |  2 +-
 xen/arch/arm/include/asm/grant_table.h |  2 +-
 xen/arch/arm/irq.c                     |  2 +-
 xen/arch/arm/mmu/domain_page.c         |  2 +-
 xen/arch/arm/traps.c                   |  8 ++++----
 xen/arch/x86/acpi/cpufreq/amd-cppc.c   |  2 +-
 xen/arch/x86/hvm/emulate.c             |  6 +++---
 xen/arch/x86/hvm/irq.c                 |  2 +-
 xen/arch/x86/hvm/svm/emulate.c         |  2 +-
 xen/arch/x86/hvm/vmx/intr.c            |  2 +-
 xen/arch/x86/include/asm/asm_defns.h   |  4 ++--
 xen/arch/x86/include/asm/hvm/hvm.h     |  2 +-
 xen/arch/x86/include/asm/hvm/support.h |  2 +-
 xen/arch/x86/include/asm/hypercall.h   |  4 ++--
 xen/arch/x86/include/asm/mem_sharing.h |  2 +-
 xen/arch/x86/include/asm/mm.h          |  2 +-
 xen/arch/x86/include/asm/p2m.h         |  2 +-
 xen/arch/x86/mm.c                      | 12 ++++++------
 xen/arch/x86/mm/p2m-pod.c              |  2 +-
 xen/arch/x86/mm/shadow/common.c        |  4 ++--
 xen/arch/x86/mm/shadow/hvm.c           |  2 +-
 xen/arch/x86/mm/shadow/multi.c         |  2 +-
 xen/arch/x86/pv/dom0_build.c           |  6 +++---
 xen/arch/x86/pv/emulate.c              |  2 +-
 xen/arch/x86/pv/mm.h                   |  2 +-
 xen/arch/x86/setup.c                   |  2 +-
 xen/arch/x86/x86_64/compat/entry.S     |  2 +-
 xen/arch/x86/x86_64/entry.S            |  2 +-
 xen/arch/x86/x86_emulate/decode.c      |  2 +-
 xen/arch/x86/x86_emulate/private.h     |  4 ++--
 xen/arch/x86/x86_emulate/util-xen.c    |  2 +-
 xen/arch/x86/x86_emulate/x86_emulate.c |  6 +++---
 xen/arch/x86/x86_emulate/x86_emulate.h |  2 +-
 xen/arch/x86/xstate.c                  |  2 +-
 xen/common/event_channel.c             |  4 ++--
 xen/common/grant_table.c               |  8 ++++----
 xen/common/multicall.c                 |  2 +-
 xen/common/page_alloc.c                |  4 ++--
 xen/common/preempt.c                   |  2 +-
 xen/include/xen/bug.h                  |  2 +-
 xen/include/xen/pci.h                  |  2 +-
 xen/include/xen/preempt.h              |  2 +-
 xen/include/xen/rwlock.h               |  4 ++--
 xen/include/xen/sched.h                |  2 +-
 xen/include/xen/typesafe.h             |  2 +-
 45 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index fae80e6cd293..e6af287a6309 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -206,7 +206,7 @@ static void gic_update_one_lr(struct vcpu *v, int i)
     }
     else
     {
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
         gic_hw_ops->clear_lr(i);
 #endif
         clear_bit(i, &this_cpu(lr_mask));
diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index 7661a953413e..66145eb91a63 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -18,7 +18,7 @@ static inline void gnttab_clear_flags(struct domain *d,
 
 static inline void gnttab_mark_dirty(struct domain *d, mfn_t mfn)
 {
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     printk_once(XENLOG_G_WARNING "gnttab_mark_dirty not implemented yet\n");
 #endif
 }
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 8d3517e76162..202fd0edb316 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -290,7 +290,7 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq, int is_fiq)
     spin_lock(&desc->lock);
     desc->handler->ack(desc);
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     if ( !desc->action )
     {
         printk("Unknown %s %#3.3x\n",
diff --git a/xen/arch/arm/mmu/domain_page.c b/xen/arch/arm/mmu/domain_page.c
index 3a43601623f0..d61146231f41 100644
--- a/xen/arch/arm/mmu/domain_page.c
+++ b/xen/arch/arm/mmu/domain_page.c
@@ -120,7 +120,7 @@ void *map_domain_page(mfn_t mfn)
     /* If the map fills up, the callers have misbehaved. */
     BUG_ON(i == DOMHEAP_ENTRIES);
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     /* Searching the hash could get slow if the map starts filling up.
      * Cross that bridge when we come to it */
     {
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 47a5c6bdd488..2d86d349eaa6 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1364,7 +1364,7 @@ long dep_physdev_op_compat(XEN_GUEST_HANDLE_PARAM(physdev_op_t) uop)
     return do_deprecated_hypercall();
 }
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 static void do_debug_trap(struct cpu_user_regs *regs, unsigned int code)
 {
     uint32_t reg;
@@ -1431,7 +1431,7 @@ static void do_trap_hypercall(struct cpu_user_regs *regs, register_t *nr,
                       HYPERCALL_ARG2(regs), HYPERCALL_ARG3(regs),
                       HYPERCALL_ARG4(regs), HYPERCALL_ARG5(regs));
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     if ( !curr->hcall_preempted && HYPERCALL_RESULT_REG(regs) != -ENOSYS )
     {
         /* Deliberately corrupt parameter regs used by this hypercall. */
@@ -2108,7 +2108,7 @@ void asmlinkage do_trap_guest_sync(struct cpu_user_regs *regs)
 
         GUEST_BUG_ON(!regs_mode_is_32bit(regs));
         perfc_incr(trap_hvc32);
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
         if ( (hsr.iss & 0xff00) == 0xff00 )
             return do_debug_trap(regs, hsr.iss & 0x00ff);
 #endif
@@ -2123,7 +2123,7 @@ void asmlinkage do_trap_guest_sync(struct cpu_user_regs *regs)
     case HSR_EC_HVC64:
         GUEST_BUG_ON(regs_mode_is_32bit(regs));
         perfc_incr(trap_hvc64);
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
         if ( (hsr.iss & 0xff00) == 0xff00 )
             return do_debug_trap(regs, hsr.iss & 0x00ff);
 #endif
diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index ae9b8beaab90..c23829845727 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -30,7 +30,7 @@
         printk(XENLOG_DEBUG "AMD-CPPC: CPU%u " fmt, cpu, ## args);  \
 })
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 static bool __ro_after_init opt_active_mode;
 #else
 static bool __initdata opt_active_mode;
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index cd2831d34b44..416810620530 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -788,7 +788,7 @@ static void *hvmemul_map_linear_addr(
                               nr_frames)) == NULL )
         goto unhandleable;
 
-#ifndef NDEBUG /* Poision unused mfn[]s with INVALID_MFN. */
+#ifdef CONFIG_DEBUG /* Poision unused mfn[]s with INVALID_MFN. */
     while ( mfn < hvmemul_ctxt->mfn + ARRAY_SIZE(hvmemul_ctxt->mfn) )
     {
         ASSERT(mfn_x(*mfn) == 0);
@@ -805,7 +805,7 @@ static void *hvmemul_map_linear_addr(
     while ( mfn-- > hvmemul_ctxt->mfn )
     {
         put_page(mfn_to_page(*mfn));
-#ifndef NDEBUG /* Clean slot for a subsequent map()'s error checking. */
+#ifdef CONFIG_DEBUG /* Clean slot for a subsequent map()'s error checking. */
         *mfn = _mfn(0);
 #endif
     }
@@ -837,7 +837,7 @@ static void hvmemul_unmap_linear_addr(
         *mfn++ = _mfn(0); /* Clean slot for map()'s error checking. */
     }
 
-#ifndef NDEBUG /* Check (and clean) all unused mfns. */
+#ifdef CONFIG_DEBUG /* Check (and clean) all unused mfns. */
     while ( mfn < hvmemul_ctxt->mfn + ARRAY_SIZE(hvmemul_ctxt->mfn) )
     {
         ASSERT(mfn_eq(*mfn, INVALID_MFN));
diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 9a36ed19201c..19a8a79f2958 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -489,7 +489,7 @@ void hvm_set_callback_via(struct domain *d, uint64_t via)
         if ( is_vcpu_online(v) )
             hvm_assert_evtchn_irq(v);
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     printk(XENLOG_G_INFO "Dom%u callback via changed to ", d->domain_id);
     switch ( via_type )
     {
diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index e392b2a7586b..1f786a44cc79 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -23,7 +23,7 @@ static unsigned long svm_nextrip_insn_length(struct vcpu *v)
     if ( !cpu_has_svm_nrips )
         return 0;
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     switch ( vmcb->exitcode )
     {
     case VMEXIT_CR0_READ ... VMEXIT_DR15_WRITE:
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 6c220c4c2e49..c69caa41aecd 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -330,7 +330,7 @@ void asmlinkage vmx_intr_assist(void)
         */
         if ( pt_vector != -1 )
         {
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
             /*
              * We assert that intack.vector is the highest priority vector for
              * only an interrupt from vlapic can reach this point and the
diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index 000d74dc4f5d..fba2a1279e6f 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -41,7 +41,7 @@ register unsigned long current_stack_pointer asm("rsp");
 
 #endif
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 #define ASSERT_INTERRUPT_STATUS(x, msg)         \
         pushf;                                  \
         testb $X86_EFLAGS_IF>>8,1(%rsp);        \
@@ -156,7 +156,7 @@ register unsigned long current_stack_pointer asm("rsp");
         GET_STACK_END(reg);                       \
         movq STACK_CPUINFO_FIELD(current_vcpu)(%r##reg), %r##reg
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 #define ASSERT_NOT_IN_ATOMIC                                             \
     sti; /* sometimes called with interrupts disabled: safe to enable */ \
     call ASSERT_NOT_IN_ATOMIC
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 9bf2064925fa..c6eb02c00924 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -633,7 +633,7 @@ static inline void hvm_sanitize_regs_fields(struct cpu_user_regs *regs,
         regs->rsp = (uint32_t)regs->rsp;
     }
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     regs->error_code = 0xbeef;
     regs->entry_vector = 0xbeef;
     regs->saved_upcall_mask = 0xbf;
diff --git a/xen/arch/x86/include/asm/hvm/support.h b/xen/arch/x86/include/asm/hvm/support.h
index 9e9fa6295567..4b2e407602b1 100644
--- a/xen/arch/x86/include/asm/hvm/support.h
+++ b/xen/arch/x86/include/asm/hvm/support.h
@@ -15,7 +15,7 @@
 #include <asm/processor.h>
 #include <asm/p2m.h>
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 #define DBG_LEVEL_0                 (1 << 0)
 #define DBG_LEVEL_1                 (1 << 1)
 #define DBG_LEVEL_2                 (1 << 2)
diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index d042a61d1702..ade69d377809 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -45,7 +45,7 @@ compat_common_vcpu_op(
 static inline void clobber_regs64(struct cpu_user_regs *regs,
                                   unsigned int nargs)
 {
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     /* Deliberately corrupt used parameter regs. */
     switch ( nargs )
     {
@@ -61,7 +61,7 @@ static inline void clobber_regs64(struct cpu_user_regs *regs,
 static inline void clobber_regs32(struct cpu_user_regs *regs,
                                   unsigned int nargs)
 {
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     /* Deliberately corrupt used parameter regs. */
     switch ( nargs )
     {
diff --git a/xen/arch/x86/include/asm/mem_sharing.h b/xen/arch/x86/include/asm/mem_sharing.h
index 3c67acfa092f..d26f9afa09f7 100644
--- a/xen/arch/x86/include/asm/mem_sharing.h
+++ b/xen/arch/x86/include/asm/mem_sharing.h
@@ -19,7 +19,7 @@ struct xen_mem_sharing_op;
 #define mem_sharing_enabled(d) ((d)->arch.hvm.mem_sharing.enabled)
 
 /* Auditing of memory sharing code? */
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 #define MEM_SHARING_AUDIT 1
 #else
 #define MEM_SHARING_AUDIT 0
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 1cdd30f7e23f..1944a9c5fd77 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -568,7 +568,7 @@ int audit_adjust_pgtables(struct domain *d, int dir, int noisy);
 extern int pagefault_by_memadd(unsigned long addr, struct cpu_user_regs *regs);
 extern int handle_memadd_fault(unsigned long addr, struct cpu_user_regs *regs);
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 
 #define AUDIT_SHADOW_ALREADY_LOCKED ( 1u << 0 )
 #define AUDIT_ERRORS_OK             ( 1u << 1 )
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 3a5a5fd43c2a..5566ee9627ad 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -20,7 +20,7 @@
 #include <asm/page.h>    /* for pagetable_t */
 
 /* Debugging and auditing of the P2M code? */
-#if !defined(NDEBUG) && defined(CONFIG_HVM)
+#if defined(CONFIG_DEBUG) && defined(CONFIG_HVM)
 #define P2M_AUDIT     1
 #else
 #define P2M_AUDIT     0
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 2a01bc235e25..9922a3d7d267 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -249,7 +249,7 @@ void __init init_frametable(void)
     memset(end_pg, -1, (unsigned long)top_pg - (unsigned long)end_pg);
 }
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 static unsigned int __read_mostly root_pgt_pv_xen_slots
     = ROOT_PAGETABLE_PV_XEN_SLOTS;
 static l4_pgentry_t __read_mostly split_l4e;
@@ -340,7 +340,7 @@ void __init arch_init_memory(void)
 
     brk_free_unused();
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     if ( highmem_start )
     {
         unsigned long split_va = (unsigned long)__va(highmem_start);
@@ -839,7 +839,7 @@ bool is_memory_hole(mfn_t start, mfn_t end)
 
 #if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 struct mmio_emul_range_ctxt {
     const struct domain *d;
     unsigned long mfn;
@@ -971,7 +971,7 @@ get_page_from_l1e(
         }
         else if ( l1f & _PAGE_RW )
         {
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
             const unsigned long *ro_map;
             unsigned int seg, bdf;
 
@@ -1736,7 +1736,7 @@ void init_xen_l4_slots(l4_pgentry_t *l4t, mfn_t l4mfn,
             l4t[l4_table_offset(PERDOMAIN_VIRT_START)];
 
     /* Slot 261-: text/data/bss, RW M2P, vmap, frametable, directmap. */
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     if ( short_directmap &&
          unlikely(root_pgt_pv_xen_slots < ROOT_PAGETABLE_PV_XEN_SLOTS) )
     {
@@ -2045,7 +2045,7 @@ static int demote_l4_table(struct page_info *page)
 }
 #endif /* CONFIG_PV */
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 /*
  * We must never call _put_page_type() while holding a page_lock() for
  * that page; doing so may cause a deadlock under the right
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index ae1210e27909..73fbebfae2e6 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -51,7 +51,7 @@ p2m_pod_cache_add(struct p2m_domain *p2m,
     struct domain *d = p2m->domain;
     mfn_t mfn = page_to_mfn(page);
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     /* Check to make sure this is a contiguous region */
     if ( mfn_x(mfn) & ((1UL << order) - 1) )
     {
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index e30c6c49e19e..413433196e27 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -496,7 +496,7 @@ void shadow_blow_tables_per_domain(struct domain *d)
     }
 }
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 /* Blow all shadows of all shadowed domains: this can be used to cause the
  * guest's pagetables to be re-shadowed if we suspect that the shadows
  * have somehow got out of sync */
@@ -517,7 +517,7 @@ static int __init cf_check shadow_blow_tables_keyhandler_init(void)
     return 0;
 }
 __initcall(shadow_blow_tables_keyhandler_init);
-#endif /* !NDEBUG */
+#endif /* CONFIG_DEBUG */
 
 /* Accessors for the singly-linked list that's used for hash chains */
 static inline struct page_info *
diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index e6fb97c4b6ef..0e1a7d80636c 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -456,7 +456,7 @@ static void *sh_emulate_map_dest(struct vcpu *v, unsigned long vaddr,
     struct domain *d = v->domain;
     void *map;
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     /* We don't emulate user-mode writes to page tables. */
     if ( hvm_get_cpl(v) == 3 )
     {
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 7f72b4b7b24b..c5f0b0948156 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -3202,7 +3202,7 @@ static pagetable_t cf_check sh_update_cr3(struct vcpu *v, bool noflush)
     //// vcpu->arch.guest_table is already set
     ////
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     /* Double-check that the HVM code has sent us a sane guest_table */
     if ( is_hvm_domain(d) )
     {
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index 24f2fa0b7f63..43768aacd641 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -899,7 +899,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
             else
                 mfn -= PFN_UP(initrd_len);
         }
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 #define REVERSE_START ((v_end - v_start) >> PAGE_SHIFT)
         if ( pfn > REVERSE_START && (vinitrd_start || pfn < initrd_pfn) )
             mfn = alloc_epfn - (pfn - REVERSE_START);
@@ -929,7 +929,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
         }
     }
     BUG_ON(pfn != domain_tot_pages(d));
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     alloc_epfn += PFN_UP(initrd_len) + si->nr_p2m_frames;
 #endif
     while ( pfn < nr_pages )
@@ -943,7 +943,7 @@ static int __init dom0_construct(const struct boot_domain *bd)
         while ( pfn < domain_tot_pages(d) )
         {
             mfn = mfn_x(page_to_mfn(page));
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 #define pfn (nr_pages - 1 - (pfn - (alloc_epfn - alloc_spfn)))
 #endif
             dom0_update_physmap(compat, pfn, mfn, vphysmap_start);
diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
index 48052f9ac3e7..038ccb8985c3 100644
--- a/xen/arch/x86/pv/emulate.c
+++ b/xen/arch/x86/pv/emulate.c
@@ -48,7 +48,7 @@ int pv_emul_read_descriptor(unsigned int sel, const struct vcpu *v,
         *limit = (desc.a & 0xffff) | (desc.b & 0x000f0000);
         if ( desc.b & _SEGMENT_G )
             *limit = ((*limit + 1) << 12) - 1;
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
         if ( sel > 3 )
         {
             unsigned int a, l;
diff --git a/xen/arch/x86/pv/mm.h b/xen/arch/x86/pv/mm.h
index 4016dd1087ba..8ee776509c8b 100644
--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -56,7 +56,7 @@ static inline intpte_t paging_cmpxchg_guest_entry(
  * PTE updates can be done with ordinary writes except:
  *  1. Debug builds get extra checking by using CMPXCHG[8B].
  */
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 #define PTE_UPDATE_WITH_CMPXCHG
 #else
 #undef PTE_UPDATE_WITH_CMPXCHG
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index df7cfcc5632f..486d2dae1607 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -99,7 +99,7 @@ boolean_param("noapic", skip_ioapic_setup);
 int8_t __read_mostly xen_cpuidle = -1;
 boolean_param("cpuidle", xen_cpuidle);
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 unsigned long __initdata highmem_start;
 size_param("highmem-start", highmem_start);
 #endif
diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index ca20ea12f9f2..6ef518f6eeeb 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -182,7 +182,7 @@ FUNC(cr4_pv32_restore)
         mov   %rax, (%rcx)
         RET
 0:
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
         /* Check that _all_ of the bits intended to be set actually are. */
         mov   %cr4, %rax
         and   cr4_pv32_mask(%rip), %rax
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index ba175bde7cc6..6a137256c24d 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -14,7 +14,7 @@
 
 /* %rsp: struct cpu_user_regs */
 .macro ASSERT_CONTEXT_IS_XEN
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
         testb $3, UREGS_cs(%rsp)
         UNLIKELY_START(nz, ASSERT_XEN_\@)
         ASSERT_FAILED("INTERRUPTED XEN CONTEXT")
diff --git a/xen/arch/x86/x86_emulate/decode.c b/xen/arch/x86/x86_emulate/decode.c
index 2bd24942722d..5eeaf30047f8 100644
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -39,7 +39,7 @@ x86_decode_insn(
     if ( unlikely(rc != X86EMUL_OKAY) )
         return ERR_PTR(-rc);
 
-#if defined(__XEN__) && !defined(NDEBUG)
+#if defined(__XEN__) && defined(CONFIG_DEBUG)
     /*
      * While we avoid memory allocation (by use of per-CPU data) above,
      * nevertheless make sure callers properly release the state structure
diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index b2997b20cdef..ff0f3eba0e72 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -336,7 +336,7 @@ struct x86_emulate_state {
 
     struct stub_exn *stub_exn;
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     /*
      * Track caller of x86_decode_insn() to spot missing as well as
      * premature calls to x86_emulate_free_state().
@@ -347,7 +347,7 @@ struct x86_emulate_state {
 
 static inline void check_state(const struct x86_emulate_state *s)
 {
-#if defined(__XEN__) && !defined(NDEBUG)
+#if defined(__XEN__) && defined(CONFIG_DEBUG)
     ASSERT(s->caller);
 #endif
 }
diff --git a/xen/arch/x86/x86_emulate/util-xen.c b/xen/arch/x86/x86_emulate/util-xen.c
index 5e90818010c4..7bdb647e6a24 100644
--- a/xen/arch/x86/x86_emulate/util-xen.c
+++ b/xen/arch/x86/x86_emulate/util-xen.c
@@ -13,7 +13,7 @@
 #include <asm/debugreg.h>
 #include <asm/xstate.h>
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 void x86_emulate_free_state(struct x86_emulate_state *s)
 {
     check_state(s);
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 4ad3e556a07c..0a5df8e1121a 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1344,11 +1344,11 @@ x86_emulate(
 
     if ( ops->validate )
     {
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
         state.caller = __builtin_return_address(0);
 #endif
         rc = ops->validate(&state, ctxt);
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
         state.caller = NULL;
 #endif
         if ( rc == X86EMUL_DONE )
@@ -8702,7 +8702,7 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(X86_ET_OTHER       != 7);
 }
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 /*
  * In debug builds, wrap x86_emulate() with some assertions about its expected
  * behaviour.
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 4539b14c1534..8e0ff799f583 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -614,7 +614,7 @@ x86_emulate(
     struct x86_emulate_ctxt *ctxt,
     const struct x86_emulate_ops *ops);
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 /*
  * In debug builds, wrap x86_emulate() with some assertions about its expected
  * behaviour.
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 8336414c5209..9b7a9eec7df0 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -448,7 +448,7 @@ void xrstor(struct vcpu *v, uint64_t mask)
         }
         if ( likely(faults == prev_faults) )
             break;
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
         gprintk(XENLOG_WARNING, "fault#%u: mxcsr=%08x\n",
                 faults, ptr->fpu_sse.mxcsr);
         gprintk(XENLOG_WARNING, "xs=%016lx xc=%016lx\n",
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 97104bea15fc..6be4cea6810b 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -99,14 +99,14 @@ static always_inline void evtchn_write_lock(struct evtchn *evtchn)
 {
     write_lock(&evtchn->lock);
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     evtchn->old_state = evtchn->state;
 #endif
 }
 
 static inline unsigned int old_state(const struct evtchn *evtchn)
 {
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     return evtchn->old_state;
 #else
     return ECS_RESERVED; /* Just to allow things to build. */
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index a76ae35368a5..d819c78281fc 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -386,7 +386,7 @@ struct active_grant_entry {
                                 grant.                                */
     grant_ref_t   trans_gref;
     mfn_t         mfn;    /* Machine frame being granted.             */
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     gfn_t         gfn;    /* Guest's idea of the frame being granted. */
 #endif
     spinlock_t    lock;      /* lock to protect access of this entry.
@@ -400,7 +400,7 @@ struct active_grant_entry {
 
 static inline void act_set_gfn(struct active_grant_entry *act, gfn_t gfn)
 {
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     act->gfn = gfn;
 #endif
 }
@@ -4084,12 +4084,12 @@ void grant_table_warn_active_grants(struct domain *d)
         nr_active++;
         if ( nr_active <= WARN_GRANT_MAX )
             printk(XENLOG_G_DEBUG "d%d has active grant %x ("
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
                    "GFN %lx, "
 #endif
                    "MFN: %#"PRI_mfn")\n",
                    d->domain_id, ref,
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
                    gfn_x(act->gfn),
 #endif
                    mfn_x(act->mfn));
diff --git a/xen/common/multicall.c b/xen/common/multicall.c
index ce394c5efcfe..66b974ad2436 100644
--- a/xen/common/multicall.c
+++ b/xen/common/multicall.c
@@ -73,7 +73,7 @@ ret_t do_multicall(
          */
         ASSERT_NOT_IN_ATOMIC();
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
         {
             /*
              * Deliberately corrupt the contents of the multicall structure.
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 5243dba29ffa..c12ffeede43a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -436,7 +436,7 @@ mfn_t __init alloc_boot_pages(unsigned long nr_pfns, unsigned long pfn_align)
         if ( pg >= r->e || pg < r->s )
             continue;
 
-#if defined(CONFIG_X86) && !defined(NDEBUG)
+#if defined(CONFIG_X86) && defined(CONFIG_DEBUG)
         /*
          * Filtering pfn_align == 1 since the only allocations using a bigger
          * alignment are the ones used for setting up the frame table chunks.
@@ -2611,7 +2611,7 @@ int assign_pages(
         goto out;
     }
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     {
         unsigned int extra_pages = 0;
 
diff --git a/xen/common/preempt.c b/xen/common/preempt.c
index 0d2dd51ac241..f3c9dfab5b4a 100644
--- a/xen/common/preempt.c
+++ b/xen/common/preempt.c
@@ -30,7 +30,7 @@ bool in_atomic(void)
     return preempt_count() || in_irq() || !local_irq_is_enabled();
 }
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 void ASSERT_NOT_IN_ATOMIC(void)
 {
     ASSERT(!preempt_count());
diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
index 044c059d6936..526ab66128d4 100644
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -137,7 +137,7 @@ static void always_inline run_in_exception_handler(bug_fn_t *fn)
     unlikely(ret_warn_on_);             \
 })
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 #define ASSERT(p) \
     do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
 #define ASSERT_UNREACHABLE() assert_failed("unreachable")
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index b7a35371a71a..f7482112dfef 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -204,7 +204,7 @@ static always_inline bool pcidevs_trylock(void)
     return lock_evaluate_nospec(pcidevs_trylock_unsafe());
 }
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 /*
  * Check to ensure there will be no changes to the entries in d->pdev_list (but
  * not the contents of each entry).
diff --git a/xen/include/xen/preempt.h b/xen/include/xen/preempt.h
index aa059b497b29..821dc4a938c9 100644
--- a/xen/include/xen/preempt.h
+++ b/xen/include/xen/preempt.h
@@ -28,7 +28,7 @@ DECLARE_PER_CPU(unsigned int, __preempt_count);
 
 bool in_atomic(void);
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 void ASSERT_NOT_IN_ATOMIC(void);
 #else
 #define ASSERT_NOT_IN_ATOMIC() ((void)0)
diff --git a/xen/include/xen/rwlock.h b/xen/include/xen/rwlock.h
index 4e7802821859..5a0198b398cd 100644
--- a/xen/include/xen/rwlock.h
+++ b/xen/include/xen/rwlock.h
@@ -325,12 +325,12 @@ typedef struct percpu_rwlock percpu_rwlock_t;
 struct percpu_rwlock {
     rwlock_t            rwlock;
     bool                writer_activating;
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     percpu_rwlock_t     **percpu_owner;
 #endif
 };
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 #define PERCPU_RW_LOCK_UNLOCKED(owner) { RW_LOCK_UNLOCKED, 0, owner }
 static inline void _percpu_rwlock_owner_check(percpu_rwlock_t **per_cpudata,
                                          percpu_rwlock_t *percpu_rwlock)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index ce1fa636db36..644cbf70d0fc 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -102,7 +102,7 @@ struct evtchn
 #define ECS_VIRQ         5 /* Channel is bound to a virtual IRQ line.        */
 #define ECS_IPI          6 /* Channel is bound to a virtual IPI line.        */
     unsigned char state;   /* ECS_* */
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
     unsigned char old_state; /* State when taking lock in write mode. */
 #endif
     unsigned char xen_consumer:XEN_CONSUMER_BITS; /* Consumer in Xen if != 0 */
diff --git a/xen/include/xen/typesafe.h b/xen/include/xen/typesafe.h
index 7ecd3b4a8d50..22be2c26df6e 100644
--- a/xen/include/xen/typesafe.h
+++ b/xen/include/xen/typesafe.h
@@ -17,7 +17,7 @@
  * Non-debug builds degrade to a simple typedef and noops for the functions.
  */
 
-#ifndef NDEBUG
+#ifdef CONFIG_DEBUG
 
 #define TYPE_SAFE(_type, _name)                                         \
     typedef struct { _type _name; } _name##_t;                          \
-- 
2.39.5


