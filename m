Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8F1C5518F
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 07:20:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381935.1625374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr9R7-0007UM-VY; Tue, 04 Aug 2026 07:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381935.1625374; Tue, 04 Aug 2026 07:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr9R7-0007TL-OR; Tue, 04 Aug 2026 07:19:41 +0000
Received: by outflank-mailman (input) for mailman id 1381935;
 Tue, 04 Aug 2026 07:16:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <d@ilvokhin.com>) id 1wr9Nk-0006z4-Bz
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 07:16:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wr9Nj-007h56-P3
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 09:16:11 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <d@ilvokhin.com>)
 id 6a7191b0-2eae-0a2a0a5409dd-0a2a450781e2-34
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 09:16:11 +0200
Received: from [178.62.254.231] (helo=mail.ilvokhin.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <d@ilvokhin.com>)
 id 6a7191bb-b4ea-0a2a45070019-b23efee7e7da-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 09:16:11 +0200
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
 (Authenticated sender: d@ilvokhin.com)
 by mail.ilvokhin.com (Postfix) with ESMTPSA id 77194E16E0;
 Tue, 04 Aug 2026 07:16:10 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mail header.d=ilvokhin.com header.i="@ilvokhin.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ilvokhin.com;
	s=mail; t=1785827770;
	bh=MJXFdixHataYYt87xEtn0QdfMJOi3nH/EXHHrFBbQBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YCa2mhDCHjFFX0O6d3S1tYEYBR/Jb4ai4lQlH0qCvYfntcHb1/+MEaIyrBX3QT0u1
	 jViT9cjtE41ag6sP28YwsfmBHSjMYS3PwUlLcqd8dqfNVR1ReEl98E/Q9nIoYF3BTz
	 G+fzkT2LOVauhNUbkR9kOT4y87KoehBEuITFVAbI=
From: Dmitry Ilvokhin <d@ilvokhin.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-arch@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	kernel-team@meta.com,
	Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [PATCH 5/5] x86/paravirt: Trace contended_release on unlock
Date: Tue,  4 Aug 2026 07:15:45 +0000
Message-ID: <17fa67f9fa4cf93f1150725e89f5f916e41a9b6f.1785778551.git.d@ilvokhin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785778551.git.d@ilvokhin.com>
References: <cover.1785778551.git.d@ilvokhin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1785827771-A60C5AE4-2400FED8/0/0
X-purgate-type: clean
X-purgate-size: 4667

On PARAVIRT_SPINLOCKS=y kernels queued_spin_unlock() is dispatched
through a static_call(). Those PARAVIRT_SPINLOCKS=y kernels are quite
popular. Gating contended_release behind a static branch would leave a
NOP on the unlock hot path even, when the tracepoint is disabled.

Since the static_call() is already present, swap its target to a traced
unlock, when the tracepoint is enabled instead. When contended_release
tracepoint is disabled the target is the plain unlock (an inline store
on native x86_64), so the unlock path is unchanged and the tracepoint is
truly zero-cost.

Provide two traced variants, native_queued_spin_unlock_traced() and
pv_queued_spin_unlock_traced(), so each tail-calls its own base unlock
directly rather than recursing through the now-traced static_call().

Teach pv_is_native_spin_unlock() that the traced native variant still
counts as native.

Only PARAVIRT_SPINLOCKS=y is affected. PARAVIRT_SPINLOCKS=n keeps the
generic static-branch path.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
---
 arch/x86/include/asm/paravirt-spinlock.h |  2 +
 arch/x86/kernel/paravirt-spinlocks.c     | 53 +++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/paravirt-spinlock.h b/arch/x86/include/asm/paravirt-spinlock.h
index ff735830de4a..302bc2ba3a75 100644
--- a/arch/x86/include/asm/paravirt-spinlock.h
+++ b/arch/x86/include/asm/paravirt-spinlock.h
@@ -99,6 +99,8 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
 
 void __init native_pv_lock_init(void);
 __visible void __native_queued_spin_unlock(struct qspinlock *lock);
+__visible void native_queued_spin_unlock_traced(struct qspinlock *lock);
+__visible void pv_queued_spin_unlock_traced(struct qspinlock *lock);
 bool pv_is_native_spin_unlock(void);
 __visible bool __native_vcpu_is_preempted(long cpu);
 bool pv_is_native_vcpu_is_preempted(void);
diff --git a/arch/x86/kernel/paravirt-spinlocks.c b/arch/x86/kernel/paravirt-spinlocks.c
index ddc19dc28ba1..ca12b3655307 100644
--- a/arch/x86/kernel/paravirt-spinlocks.c
+++ b/arch/x86/kernel/paravirt-spinlocks.c
@@ -7,6 +7,7 @@
 #include <linux/spinlock.h>
 #include <linux/export.h>
 #include <linux/jump_label.h>
+#include <trace/events/lock.h>
 
 DEFINE_STATIC_KEY_FALSE(virt_spin_lock_key);
 
@@ -30,10 +31,58 @@ EXPORT_STATIC_CALL_TRAMP(queued_spin_lock_slowpath);
 DEFINE_STATIC_CALL(queued_spin_unlock, __raw_callee_save___native_queued_spin_unlock);
 EXPORT_STATIC_CALL_TRAMP(queued_spin_unlock);
 
+/*
+ * Traced unlock variants, swapped in via static_call while the
+ * contended_release tracepoint is enabled. Two of them, so each tail calls its
+ * own base directly.
+ */
+__visible void native_queued_spin_unlock_traced(struct qspinlock *lock)
+{
+	if (queued_spin_is_contended(lock))
+		trace_call__contended_release(lock);
+	native_queued_spin_unlock(lock);
+}
+PV_CALLEE_SAVE_REGS_THUNK(native_queued_spin_unlock_traced);
+
+__visible void pv_queued_spin_unlock_traced(struct qspinlock *lock)
+{
+	if (queued_spin_is_contended(lock))
+		trace_call__contended_release(lock);
+	__raw_callee_save___pv_queued_spin_unlock(lock);
+}
+PV_CALLEE_SAVE_REGS_THUNK(pv_queued_spin_unlock_traced);
+
 bool pv_is_native_spin_unlock(void)
 {
-	return static_call_query(queued_spin_unlock) ==
-		__raw_callee_save___native_queued_spin_unlock;
+	void *unlock = static_call_query(queued_spin_unlock);
+
+	return unlock == __raw_callee_save___native_queued_spin_unlock ||
+	       unlock == __raw_callee_save_native_queued_spin_unlock_traced;
+}
+
+int arch_contended_release_trace_reg(void)
+{
+	void *cur = static_call_query(queued_spin_unlock);
+
+	if (cur == __raw_callee_save___native_queued_spin_unlock)
+		static_call_update(queued_spin_unlock,
+				   __raw_callee_save_native_queued_spin_unlock_traced);
+	else if (cur == __raw_callee_save___pv_queued_spin_unlock)
+		static_call_update(queued_spin_unlock,
+				   __raw_callee_save_pv_queued_spin_unlock_traced);
+	return 0;
+}
+
+void arch_contended_release_trace_unreg(void)
+{
+	void *cur = static_call_query(queued_spin_unlock);
+
+	if (cur == __raw_callee_save_native_queued_spin_unlock_traced)
+		static_call_update(queued_spin_unlock,
+				   __raw_callee_save___native_queued_spin_unlock);
+	else if (cur == __raw_callee_save_pv_queued_spin_unlock_traced)
+		static_call_update(queued_spin_unlock,
+				   __raw_callee_save___pv_queued_spin_unlock);
 }
 
 __visible bool __native_vcpu_is_preempted(long cpu)
-- 
2.53.0-Meta


