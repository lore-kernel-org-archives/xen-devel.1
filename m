Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDF5C55172
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 07:20:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381937.1625378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr9R8-0007ZN-7c; Tue, 04 Aug 2026 07:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381937.1625378; Tue, 04 Aug 2026 07:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wr9R7-0007Wz-Vh; Tue, 04 Aug 2026 07:19:41 +0000
Received: by outflank-mailman (input) for mailman id 1381937;
 Tue, 04 Aug 2026 07:16:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <d@ilvokhin.com>) id 1wr9Nl-0006z6-2A
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 07:16:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wr9Nk-00AVMl-1r
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 09:16:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <d@ilvokhin.com>)
 id 6a7191b9-bab6-0a2a0a5309dd-0a2a45039b3a-2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 09:16:12 +0200
Received: from [178.62.254.231] (helo=mail.ilvokhin.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <d@ilvokhin.com>)
 id 6a7191ba-fae8-0a2a45030019-b23efee7ec10-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 09:16:11 +0200
Received: from localhost.localdomain (shell.ilvokhin.com [138.68.190.75])
 (Authenticated sender: d@ilvokhin.com)
 by mail.ilvokhin.com (Postfix) with ESMTPSA id 8F84BE16D9;
 Tue, 04 Aug 2026 07:16:09 +0000 (UTC)
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
	s=mail; t=1785827769;
	bh=fHFQBsOvzK2/mUZmCSCVwo8JOcS+aODOMFtgBaMfo18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=0OMfUdlqT7tXp+xgFH8Lqhq8QKQ7xel10QLPov1Fj6BEEyus3KjXzGsZvJvOoCmFc
	 HoubPtrG0hOfQ94rwZ6ss/UcnbQNjRe7uPtfYREtEbeVVgOyI7BCepcQi8X/rHThP1
	 7w23gEsazcnNYc12vfymcaG7+J/NylkdvJYVuzVs=
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
Subject: [PATCH 3/5] locking/qspinlock: Add contended_release tracepoint
Date: Tue,  4 Aug 2026 07:15:43 +0000
Message-ID: <0d998e22a0c595f670cfc6725bb683323aced5cb.1785778551.git.d@ilvokhin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785778551.git.d@ilvokhin.com>
References: <cover.1785778551.git.d@ilvokhin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1785827771-76EF74E9-2C1F7D91/0/0
X-purgate-type: clean
X-purgate-size: 7845

Unlike mutex and rw_semaphore, qspinlock has no owner field, so "perf
lock contention --lock-owner" cannot attribute a contended spinlock to
its holder. The waiter-side contention_begin event records that a
spinlock is contended, but not by whom. Firing contended_release in the
holder's context at unlock is the only way to capture the holder of a
contended spinlock.

Combine the contention check, trace call and release in an out-of-line
queued_spin_release_traced() so the compiler need not preserve the lock
pointer in a callee-saved register across the call.

The check in queued_spin_unlock() is paid on every unlock, even while
the tracepoint is disabled: a static-branch NOP on x86_64, and a few
more instructions to manage a stack frame elsewhere. Gate it behind
CONFIG_QUEUED_SPINLOCKS_TRACE_CONTENDED_RELEASE (default n) so nobody
pays for a tracepoint they do not use. Sleeping locks fire
contended_release regardless.

On x86 this generic path is used only with PARAVIRT_SPINLOCKS=n (e.g.
defconfig). PARAVIRT_SPINLOCKS=y kernels keep the paravirt static_call
unlock and are wired up separately.

All below are with the QUEUED_SPINLOCKS_TRACE_CONTENDED_RELEASE option
enabled.

_raw_spin_unlock(), x86_64 defconfig, GCC 11, tracepoint compiled in but
disabled. The unlock is the single 'movb'. The only instruction added to
the executed path is the 2-byte static-branch NOP. The CALL to the
traced helper and the JMP back are emitted out of line and are reached
only once the static branch is patched on:

          endbr64                            ; 4 bytes
          xchg   %ax,%ax                     ; 2 static-branch NOP
                                             ;   (added)
          movb   $0x0,(%rdi)                 ; 3 unlock (single store)
       A: decl   %gs:__preempt_count         ; 7
          je     B                           ; 2
          jmp    __x86_return_thunk          ; 5
          call   queued_spin_release_traced  ; 5 out of line, reached
                                             ;   only when the
                                             ;   tracepoint is on
          jmp    A                           ; 2 (added)
       B: call   __SCT__preempt_schedule     ; 5
          jmp    __x86_return_thunk          ; 5

Baseline is the same stream without the NOP and the out-of-line
CALL/JMP: 31 bytes vs 40 (+9 bytes).

Binary size impact on x86_64, defconfig: +680 bytes (+0.00%), since all
standard configs out-of-line unlock. Architectures with inlined unlock
(s390 (always), csky and loongarch (both when !PREEMPTION)) will see a
bigger increase in binary size.

On the same path (x86_64, PARAVIRT_SPINLOCKS=n) with the tracepoint
disabled, a _raw_spin_unlock()-heavy nginx workload [1] shows no
measurable difference between baseline and patched kernels in
throughput, latency, cycles, instructions, IPC, or L1 instruction-cache
misses (kernel and total): all deltas stay within run-to-run noise.

Unlike x86, on arm64 the frame setup code (STP, MOV and LDP) lands on
the executed path in addition to static-branch NOP. Binary size impact
on arm64, defconfig: +932 bytes (+0.00%).

The _raw_spin_unlock()-heavy nginx workload reflects the larger hot
path: L1 instruction-cache misses rise ~1.4% (kernel and total) and
instruction count ~0.4%, consistent with the per-unlock frame.
cpu_cycles, throughput and latency show no measurable change and are
within run-to-run noise.

Architectures with fully custom qspinlock implementations (e.g.
PowerPC) are not covered by this change.

[1]: https://lore.kernel.org/all/aiphFXe_TPNPxZ_n@shell.ilvokhin.com/

Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>
---
 include/asm-generic/qspinlock.h | 21 +++++++++++++++++++++
 kernel/Kconfig.locks            | 20 ++++++++++++++++++++
 kernel/locking/qspinlock.c      | 22 ++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/include/asm-generic/qspinlock.h b/include/asm-generic/qspinlock.h
index ae45289e8ec7..2ca94e41823b 100644
--- a/include/asm-generic/qspinlock.h
+++ b/include/asm-generic/qspinlock.h
@@ -41,6 +41,7 @@
 
 #include <asm-generic/qspinlock_types.h>
 #include <linux/atomic.h>
+#include <linux/tracepoint-defs.h>
 
 #ifndef queued_spin_is_locked
 /**
@@ -130,12 +131,32 @@ static __always_inline void queued_spin_release(struct qspinlock *lock)
 #endif
 
 #ifndef queued_spin_unlock
+
+DECLARE_TRACEPOINT(contended_release);
+
+extern void queued_spin_release_traced(struct qspinlock *lock);
+
 /**
  * queued_spin_unlock - unlock a queued spinlock
  * @lock : Pointer to queued spinlock structure
+ *
+ * Generic tracing wrapper around the arch-overridable
+ * queued_spin_release().
  */
 static __always_inline void queued_spin_unlock(struct qspinlock *lock)
 {
+	/*
+	 * Trace and release are combined in queued_spin_release_traced() so
+	 * the compiler does not need to preserve the lock pointer across the
+	 * function call, avoiding callee-saved register save/restore on the
+	 * hot path. queued_spin_release() is therefore called both here and in
+	 * queued_spin_release_traced(). Keep the two in sync.
+	 */
+	if (IS_ENABLED(CONFIG_QUEUED_SPINLOCKS_TRACE_CONTENDED_RELEASE) &&
+	    tracepoint_enabled(contended_release)) {
+		queued_spin_release_traced(lock);
+		return;
+	}
 	queued_spin_release(lock);
 }
 #endif
diff --git a/kernel/Kconfig.locks b/kernel/Kconfig.locks
index 4198f0273ecd..1c6423aafcd4 100644
--- a/kernel/Kconfig.locks
+++ b/kernel/Kconfig.locks
@@ -243,6 +243,26 @@ config QUEUED_SPINLOCKS
 	def_bool y if ARCH_USE_QUEUED_SPINLOCKS
 	depends on SMP
 
+config QUEUED_SPINLOCKS_TRACE_CONTENDED_RELEASE
+	bool "Trace contended_release on queued spinlocks"
+	depends on QUEUED_SPINLOCKS && TRACEPOINTS
+	help
+	  Fire the lock:contended_release tracepoint when a contended queued
+	  spinlock is released, so it is possible to attribute a contended
+	  spinlock to its holder.
+
+	  Architectures that can patch the unlock site do this at no cost and
+	  do not need this option.
+
+	  Everywhere else the check is compiled into queued_spin_unlock() and
+	  a small cost is paid on every unlock even when the tracepoint is
+	  disabled: a static-branch NOP and possibly a few more instructions
+	  to manage a stack frame.
+
+	  Sleeping locks fire lock:contended_release regardless of this option.
+
+	  If unsure, say N.
+
 config BPF_ARCH_SPINLOCK
 	bool
 
diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
index af8d122bb649..33fe6d437c8f 100644
--- a/kernel/locking/qspinlock.c
+++ b/kernel/locking/qspinlock.c
@@ -104,6 +104,28 @@ static __always_inline u32  __pv_wait_head_or_lock(struct qspinlock *lock,
 #define queued_spin_lock_slowpath	native_queued_spin_lock_slowpath
 #endif
 
+#if !defined(queued_spin_unlock) && \
+	IS_ENABLED(CONFIG_QUEUED_SPINLOCKS_TRACE_CONTENDED_RELEASE)
+/*
+ * Out-of-line trace-and-release path for queued_spin_unlock(), used when
+ * the contended_release tracepoint is enabled.
+ *
+ * queued_spin_release() is duplicated here on purpose: doing the release
+ * in this function (rather than tracing here and releasing in the caller)
+ * lets queued_spin_unlock() return right after the call, so the
+ * tracepoint-disabled hot path never has to keep lock live across a call
+ * in a callee-saved register. Keep this release in sync with the one in
+ * queued_spin_unlock().
+ */
+void __lockfunc queued_spin_release_traced(struct qspinlock *lock)
+{
+	if (queued_spin_is_contended(lock))
+		trace_call__contended_release(lock);
+	queued_spin_release(lock);
+}
+EXPORT_SYMBOL(queued_spin_release_traced);
+#endif
+
 #endif /* _GEN_PV_LOCK_SLOWPATH */
 
 /**
-- 
2.53.0-Meta


