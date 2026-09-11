Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CF0C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:10:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416856.1645792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51wy-0005jf-Md; Fri, 11 Sep 2026 14:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416856.1645792; Fri, 11 Sep 2026 14:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51wy-0005jY-J0; Fri, 11 Sep 2026 14:09:56 +0000
Received: by outflank-mailman (input) for mailman id 1416856;
 Fri, 11 Sep 2026 14:09:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x51wx-0005he-Bp
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:09:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51ww-00E9V9-Oz
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:09:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40b97-2eae-0a2a0a5409dd-0a2a450bac0c-30
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:09:54 +0200
Received: from [209.85.160.178] (helo=mail-qt1-f178.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40bb1-b7e8-0a2a450b0019-d155a0b2c932-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:09:54 +0200
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-5218927884fso15772411cf.3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 07:09:54 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-530ca50cd05sm20570811cf.29.2026.09.11.07.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 07:09:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135793; x=1789740593; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vr/1/6kD89CuecwWXrcFDfjNkcZoJvv75czWOOFkQAs=;
        b=kVyTMRfXf7wDivyTuDFHix8y410Go95Qeg51c+AX3MnfvkkY67XHNgz6JLU11gfjgN
         wQyLDpEjKI1HAugLWm4hy61wyzWo6+Gix4YyB3I/rAb+6IdV3vArQMrUoZSWwdQdMkj0
         bHsXPCj7+gtu7h3jku1mYZAy7K9y312ayhpwGTf3fiIZU+33NNPeACN1RIoQQ3T4fXk8
         HeaoAJfSytexb0q29w1OOvAIx6XlkpQYw/TMkhi8JUbloH/mvf51lKXIDDHMyr8Wwn/z
         gtF8U2NTFpKThApkE+ou8dNxMER4TcifpnALQN8Xkwb/KGA0aKrmnF4x/716vePMfzpF
         lA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135793; x=1789740593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vr/1/6kD89CuecwWXrcFDfjNkcZoJvv75czWOOFkQAs=;
        b=aPMDRb8l99PXZ2lejYyyjz+WfA0LqkdCX4BtTXmKf/UvulSH2NwTHJIx68qtOf0TVP
         KAQmY6S7V8VHkUt5Nv2aLqG8By99mpPMsEdTphB8eI2aOguSbj+sFWVY2YHxUittea2O
         ebPPM4s+4h0Cpwv/+uD7LOLaCa+bH5j6ApY62JXV3IxI9BFmXgeBEMk4WHYbjJU3Fjdp
         OP3WJChKXlrDKKRYqoigFZhIjb7eRTEkbVpiTqmmDHbP7m+x9hvnd03PS9ws2Jt/6iHY
         WRkLyHQ9JJ/Ew7V/OyOUzwTOryH+frV272GINI+WLqZKndbWnHKeBuLYGcsmCmO8Ro64
         jXhg==
X-Forwarded-Encrypted: i=1; AKwUvByS7FOFs8iYgb83Hu1dSf0udJ2piFkLPf4cULguS7+GhoC2/VaNUvmVp7bCcfBCLBdLsSLKFAH9u/o=@lists.xenproject.org
X-Gm-Message-State: AFuF++kWmTkN4yeHuWBMZuHPy7qV0ujP1lS2Z61N34rb9aVtn6Xo+/rJ
	fejW6jpD2eia/A2oBU2gRDgfvIl9k2BgtGW43e4Ea+btAm2ZfUYG2ZcFU1W/8kUrPrI=
X-Gm-Gg: AYBFou0L4xVRysNwCwNIV1VB6TUqp4WRry6x+CdZknZmHb48my5v4yDD7lJPMilojWa
	IJKimIIiIWpf29NjxI6TA74FPwhg7CLnbwdWxzc1a70v71a50Z6pTre+kNHY18CVr80fXV5XxVh
	FnHnPdr+HscODCSgeN60vqjevwop/cMgqiviuznGDzkxRM6zLFsCi1ChOzk660K0UoirX9h2crt
	qL8M0kgO3fBsWEZgJS6Jus49F4Go9yF3iUAsWsq2KOqKNXTXrB9WZE0tO6HpTuBdKLY0r5DEXiH
	o83o5UlKlmUE+/cfVcYpk7n7fZsq+EqLrlFe3qW1U8j++CtKgxo31eOC5e9i9NEBZ7CcXDgUI/g
	tpKmViiS6PCK0QFX+Xowo7RdsP9pAUPKz+rG8WGaqhQ0oqR0XYPe8KX/3CaHhVmd2caicDN1pg6
	i+MZGAvABAUn1JHuK80n2nY4kp/lkVA1RH8O921r+gghFjuskUk+2lhhODrvT/wOuSVa8sF7k8F
	Qn9d2HkIj+/ZxgyWCfzjrCAWS1FQOjxny5Al43P7WeimH8ji2nYF6Qc
X-Received: by 2002:a05:622a:393:b0:530:a441:c52d with SMTP id d75a77b69052e-530c876307fmr64046411cf.46.1789135792869;
        Fri, 11 Sep 2026 07:09:52 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:41 +0000
Subject: [PATCH RFC v2 03/15] rcu-tasks: Hold trampoline nesting across
 irq-exit preemption in trampoline text
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-3-eaaa61ed2da4@toxicpanda.com>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
In-Reply-To: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135736; l=9197;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=CNudSyp9EGSFLIPrtB5sqvKMksuv/pGd9p7EfdyuASs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDP3NG/b7q989dUqjalqec1jdmkHZIx2wGCVq3J1Gir+zOd7a4FhOwI8Us9/xLubjdPD5eVSQFN
 Ltn5AyJDBWwY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-42698a/1789135794-182F49EA-ECC8F3A6/0/0
X-purgate-type: clean
X-purgate-size: 9199

A trampoline's own rcu_tramp_nesting increment and decrement live inside
the trampoline, so there is a window of a few instructions on entry and
exit where the count is zero while the CPU is executing trampoline text
(or text on the way into one, such as a static ftrace stub holding a
direct-call target).  In that window the task has not called out, so it
can only be preempted from an interrupt, and the interrupted instruction
pointer identifies where it is.

Add rcu_tasks_ip_in_trampoline(), which treats any IP outside core
kernel and module text as potentially Tasks-RCU-protected (ftrace
trampolines, BPF images and programs, kprobe slots are all dynamically
allocated text; is_ftrace_trampoline() and friends are deliberately not
used because text being torn down may already be unregistered from them
while a task still stands on it), plus a __weak
arch_rcu_tasks_ip_in_trampoline() for core text an architecture needs
to flag.  On irq-exit preemption, if the IP matches, hold the count
elevated across preempt_schedule_irq().

Introduce ARCH_HAS_RCU_TASKS_PREEMPT_QS / RCU_TASKS_PREEMPT_QS to gate
this; no architecture selects it yet, so the check compiles away and
there is no functional change.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/rcupdate.h | 17 +++++++++++++++++
 kernel/entry/common.c    | 23 ++++++++++++++++++++++-
 kernel/rcu/Kconfig       | 10 ++++++++++
 kernel/rcu/tasks.h       | 38 ++++++++++++++++++++++++++++++++++++++
 kernel/rcu/update.c      |  2 ++
 5 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index b5c666c82479..0a408e36ea15 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -173,6 +173,9 @@ static inline void rcu_nocb_flush_deferred_wakeup(void) { }
 
 #endif /* #else #ifdef CONFIG_RCU_NOCB_CPU */
 
+/* Arch hook for rcu_tasks_ip_in_trampoline(); see kernel/rcu/tasks.h. */
+bool arch_rcu_tasks_ip_in_trampoline(unsigned long ip);
+
 /*
  * Note a quasi-voluntary context switch for RCU-tasks's benefit.
  * This is a macro rather than an inline function to avoid #include hell.
@@ -189,6 +192,16 @@ static inline void rcu_nocb_flush_deferred_wakeup(void) { }
  * or was called from, such text and an involuntary context switch must not be
  * treated as a Tasks RCU quiescent state.
  *
+ * The increment and decrement themselves live inside the trampoline, so there
+ * is a window of a few instructions at entry (before the increment) and exit
+ * (after the decrement) where the count is zero but the CPU is executing
+ * trampoline text, or text on the way into one (a static ftrace stub or a
+ * return thunk holding the trampoline's address).  In that window the task
+ * cannot be preempted synchronously, only from an interrupt, so the irq-exit
+ * preemption path covers it by checking regs->ip with
+ * rcu_tasks_ip_in_trampoline() and holding the count elevated across
+ * preempt_schedule_irq() when it matches.
+ *
  * Only current writes the count and only current (or an interrupt on the same
  * CPU) reads it, so plain accesses suffice.
  */
@@ -211,6 +224,8 @@ static __always_inline void rcu_tasks_trampoline_assert_none(void)
 		WARN_ON_ONCE(current->rcu_tramp_nesting);
 }
 
+bool rcu_tasks_ip_in_trampoline(unsigned long ip);
+
 # define rcu_tasks_classic_qs(t, preempt)				\
 	do {								\
 		if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))	\
@@ -226,6 +241,7 @@ void rcu_tasks_torture_stats_print(char *tt, char *tf);
 static inline void rcu_tasks_trampoline_enter(void) { }
 static inline void rcu_tasks_trampoline_exit(void) { }
 static inline void rcu_tasks_trampoline_assert_none(void) { }
+static inline bool rcu_tasks_ip_in_trampoline(unsigned long ip) { return false; }
 # endif
 
 #define rcu_tasks_qs(t, preempt) rcu_tasks_classic_qs((t), (preempt))
@@ -245,6 +261,7 @@ void exit_tasks_rcu_finish(void);
 static inline void rcu_tasks_trampoline_enter(void) { }
 static inline void rcu_tasks_trampoline_exit(void) { }
 static inline void rcu_tasks_trampoline_assert_none(void) { }
+static inline bool rcu_tasks_ip_in_trampoline(unsigned long ip) { return false; }
 #define call_rcu_tasks call_rcu
 #define synchronize_rcu_tasks synchronize_rcu
 static inline void exit_tasks_rcu_start(void) { }
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e4acd50bd81a..cd3feaca6420 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -134,6 +134,27 @@ static inline bool arch_irqentry_exit_need_resched(void);
 static inline bool arch_irqentry_exit_need_resched(void) { return true; }
 #endif
 
+/*
+ * Preempt the interrupted kernel context.  If the interrupt landed in text
+ * that may be a Tasks-RCU-protected trampoline (see
+ * rcu_tasks_trampoline_enter()), hold current->rcu_tramp_nesting elevated
+ * across the context switch so that it is not mistaken for a Tasks RCU
+ * quiescent state.  This closes the few-instruction windows at trampoline
+ * entry/exit where the trampoline's own increment has not yet run or its
+ * decrement already has.
+ */
+static void irqentry_preempt(struct pt_regs *regs)
+{
+	bool in_tramp = IS_ENABLED(CONFIG_RCU_TASKS_PREEMPT_QS) &&
+			rcu_tasks_ip_in_trampoline(instruction_pointer(regs));
+
+	if (in_tramp)
+		rcu_tasks_trampoline_enter();
+	preempt_schedule_irq();
+	if (in_tramp)
+		rcu_tasks_trampoline_exit();
+}
+
 void raw_irqentry_exit_cond_resched(struct pt_regs *regs)
 {
 	if (!preempt_count()) {
@@ -142,7 +163,7 @@ void raw_irqentry_exit_cond_resched(struct pt_regs *regs)
 		if (IS_ENABLED(CONFIG_DEBUG_ENTRY))
 			WARN_ON_ONCE(!on_thread_stack());
 		if (need_resched() && arch_irqentry_exit_need_resched())
-			preempt_schedule_irq();
+			irqentry_preempt(regs);
 	}
 }
 #ifdef CONFIG_PREEMPT_DYNAMIC
diff --git a/kernel/rcu/Kconfig b/kernel/rcu/Kconfig
index 332df7a7a634..999f8228a13d 100644
--- a/kernel/rcu/Kconfig
+++ b/kernel/rcu/Kconfig
@@ -107,6 +107,16 @@ config TASKS_RCU
 	default NEED_TASKS_RCU && PREEMPTION
 	select IRQ_WORK
 
+# Selected by architectures whose ftrace, BPF and kprobe trampolines maintain
+# current->rcu_tramp_nesting and which use the generic irqentry code, so that
+# a preemption outside any trampoline can be treated as a Tasks RCU
+# quiescent state.  See rcu_tasks_trampoline_enter().
+config ARCH_HAS_RCU_TASKS_PREEMPT_QS
+	bool
+
+config RCU_TASKS_PREEMPT_QS
+	def_bool TASKS_RCU && ARCH_HAS_RCU_TASKS_PREEMPT_QS && GENERIC_IRQ_ENTRY
+
 config FORCE_TASKS_RUDE_RCU
 	bool "Force selection of Tasks Rude RCU"
 	depends on RCU_EXPERT
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 1662ba18bf34..a801ec4a951b 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1089,6 +1089,44 @@ static void rcu_tasks_postscan(struct list_head *hop)
 		timer_delete_sync(&tasks_rcu_exit_stall_timer);
 }
 
+/*
+ * Architectures selecting ARCH_HAS_RCU_TASKS_PREEMPT_QS override this to flag
+ * core kernel text that must be treated like a trampoline, e.g. static ftrace
+ * entry stubs and return thunks that run with a trampoline address in hand.
+ */
+bool __weak arch_rcu_tasks_ip_in_trampoline(unsigned long ip)
+{
+	return false;
+}
+
+/**
+ * rcu_tasks_ip_in_trampoline - Could a task interrupted at @ip be a Tasks RCU reader?
+ * @ip: interrupted instruction pointer
+ *
+ * Called from the irq-exit preemption path with interrupts disabled, to decide
+ * whether the imminent preemption may be reported as a Tasks RCU quiescent
+ * state when current->rcu_tramp_nesting is zero.  Returns true, meaning "do
+ * not report", when @ip is:
+ *
+ *  - outside static kernel and module text, i.e. possibly in an ftrace
+ *    trampoline, BPF trampoline image or program, kprobe insn/optinsn slot or
+ *    other dynamically allocated text whose lifetime Tasks RCU guards.  This
+ *    deliberately does not consult is_ftrace_trampoline() and friends: text
+ *    being torn down may already be unregistered there while a task still
+ *    stands on it;
+ *  - in core text the architecture flags via arch_rcu_tasks_ip_in_trampoline().
+ *
+ * A false positive only defers the quiescent state to the task's next
+ * context switch.
+ */
+bool rcu_tasks_ip_in_trampoline(unsigned long ip)
+{
+	if (core_kernel_text(ip))
+		return arch_rcu_tasks_ip_in_trampoline(ip);
+	return !is_module_text_address(ip);
+}
+NOKPROBE_SYMBOL(rcu_tasks_ip_in_trampoline);
+
 /* See if tasks are still holding out, complain if so. */
 static void check_holdout_task(struct task_struct *t,
 			       bool needreport, bool *firstreport)
diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
index b62735a67884..23be7e97c3b5 100644
--- a/kernel/rcu/update.c
+++ b/kernel/rcu/update.c
@@ -41,6 +41,8 @@
 #include <linux/rcupdate_wait.h>
 #include <linux/sched/isolation.h>
 #include <linux/kprobes.h>
+#include <linux/kallsyms.h>
+#include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/irq_work.h>
 #include <linux/rcupdate_trace.h>

-- 
2.55.0


