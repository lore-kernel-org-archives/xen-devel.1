Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2097C79FBF
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415163.1644704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jrc-0006Pj-II; Thu, 10 Sep 2026 18:51:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415163.1644704; Thu, 10 Sep 2026 18:51:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jrc-0006PV-F9; Thu, 10 Sep 2026 18:51:12 +0000
Received: by outflank-mailman (input) for mailman id 1415163;
 Thu, 10 Sep 2026 18:51:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x4jrb-0006N7-NO
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 18:51:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4jrb-00Gcad-3w
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:51:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fc17-bab6-0a2a0a5309dd-0a2a4502e940-10
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:51:11 +0200
Received: from [209.85.222.172] (helo=mail-qk1-f172.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fc1e-6ca4-0a2a45020019-d155deaca438-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:51:10 +0200
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-92ed19f4d60so13505785a.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:51:10 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939e7f1da12sm50063385a.9.2026.09.10.11.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 11:51:08 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789066269; x=1789671069; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0Z6kl89L/mcJKSDFUzFWtYRNb/tGGuag8yv3GYWCr4=;
        b=Kw2a+A60926yogG1g0r4S8egw4amFvo40bjc7giALBVUBsmb7WmCNZjPflHSUYpHHR
         ARvgH3T/actVPbBkWQhNsRf7ENpYgVuuJ/dZztDZ/fTNeb9VELLQc8NluXiFVQgoFvOt
         Py6yUYYdm5cQEX0LjvfWsIi5A/FjGSSoa3/ft3jkuZX0bmzoLbfkhcOXAqgntgHX3zGP
         bDre1BTWI0is9DXY0g7SI0qQk9hQZdqCO0WXocCEs1gViQkVFX6oVOY66/HdmDxQrtA4
         MnMlvOzv4PKkrDjtLdA6jGFinWRiWad3h4u0o++w6akBg/boanqEgMXa/q8eZdHkycwy
         YKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066269; x=1789671069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0Z6kl89L/mcJKSDFUzFWtYRNb/tGGuag8yv3GYWCr4=;
        b=lJwBdA+2jcR/Yq41IekeHbJ9z3aXH3BT8kJzl0ov/xPTyArY9uKl+q8bTJulvFWm+w
         j8ky7Ge59Xznpsu+XDRfiM6CyIhIQ4rm/aivCun8ghAcPsmVdGzzfSFPClx9pgCzMaiY
         5yzo9cUalr75mC74a8/pohP31qfXXc1FG6FT3bPZsiKbI6GlzeqKDPXTitwW0iMFFsPj
         /QxicE9BlJKnbMDoqSHClwcsfxIygFeRwCstjVgjX1X4nIP6BiKLnpL9oqpemZfy5Q9/
         Ha/I7pQndPYVR6ydm04Rb6jwxSIyB5nmQexkyci1iQxDvdhDlSsGiztxaLk7WDCplrSw
         wSrw==
X-Forwarded-Encrypted: i=1; AKwUvBzqa4TaVMW2V7ybBGevtT16IJWY/0fcy3THDSetJYwF1JhDC5lafBRKG0aUsg8JZ17GvE938lgWoho=@lists.xenproject.org
X-Gm-Message-State: AFuF++mat/9V6y54+McACBm43VdQsckpAPtsYqeR0a/qVawL+gPY+0Xn
	dPYzn5eJX+Vjyb4EgJlnoCuiCdLsCUO8wo22ISa6eq/QrUspAVGFYYCoypWoCJLwbdM=
X-Gm-Gg: AYBFou24Sj95eA8I/JHAEBhJXmoLaxCsmqrHZMy1aQwq5rRnFarBLTZBjpeYvrbOKUN
	2wUXcBgrJ+eOT+5p4sJCRV4B3450+HBzaeG3lfUUqU2TuvyVTmT8dsUukASajT/2iTEMpuHaX/2
	dSogTHEjmPBdrhq/nwWY5hEAy7jqWRZxA8FzmVXiOPlg8kNm+sSzwbcenkKdc8MtUQoIpp/hlmv
	kyi5EVIZcFNfpuzmJtM6WpKgE1LOaTUne+5eHlsJx4WwsJzQgkNtSSQNutqOEJfjabMnGgGTmYO
	JB6gFEO9ofEt2K4/+jETAqepFTUOa2rA9X2TSlrqmxmpMGdoxyzOOB0foApvkbamptaAXHkYBO0
	rxbjxzQYYx3XNBghcdB/FVyOF6XQZLI9BG9vF2biZkLOL0dTfPIhPzeFGossAmQfuEL8eOkkb3y
	yy4bKHwKEYVW98Lxv4TCx8hAVTIU5KEsOxuD904MHHK71mmlixRe+0ZkME+G34cLTABsmye1r/u
	rRB+lIzi7mQ8WHj27hz9lx2B/m3lAI26f20qQq1gEm9v9oqHgGtJGSm1lJFrkaPEAU=
X-Received: by 2002:a05:620a:1a0a:b0:939:ca72:bef8 with SMTP id af79cd13be357-939d7fe4f58mr706492885a.41.1789066269332;
        Thu, 10 Sep 2026 11:51:09 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:32 +0000
Subject: [PATCH RFC 09/13] arm64: ftrace: Maintain Tasks RCU trampoline
 nesting in ftrace_caller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-9-d4469f4cc101@toxicpanda.com>
References: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
In-Reply-To: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
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
X-purgate-ID: tlsNG-720697/1789066271-323D42AC-D8908D05/0/0
X-purgate-type: clean
X-purgate-size: 5219

Bracket the call out to the ftrace_ops callback in ftrace_caller with an
increment/decrement of current->rcu_tramp_nesting, using x12/w13 which
are scratch there.  The read-modify-write is not atomic, but only current
modifies the count and every interrupting user is balanced, so nothing is
lost.

ftrace_caller itself, including the early CALL_OPS direct path and the
late direct tail that carry a BPF trampoline address in x17 with the
count at zero, is static kernel text: add an ftrace_static_tramp_end
marker after ftrace_stub_direct_tramp and provide
arch_rcu_tasks_ip_in_trampoline() covering
[ftrace_caller, ftrace_static_tramp_end) so the irq-exit check treats a
task interrupted anywhere in it as inside a trampoline.

The hook is built only under CONFIG_RCU_TASKS_PREEMPT_QS, which arm64
does not select until a later patch.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/arm64/kernel/asm-offsets.c  |  3 +++
 arch/arm64/kernel/entry-ftrace.S | 35 +++++++++++++++++++++++++++++++++++
 arch/arm64/kernel/ftrace.c       | 16 ++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 9c853ed3ceab..f6655a284f18 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -39,6 +39,9 @@ int main(void)
   DEFINE(TSK_STACK,		offsetof(struct task_struct, stack));
 #ifdef CONFIG_STACKPROTECTOR
   DEFINE(TSK_STACK_CANARY,	offsetof(struct task_struct, stack_canary));
+#endif
+#ifdef CONFIG_TASKS_RCU
+  DEFINE(TSK_RCU_TRAMP_NESTING,	offsetof(struct task_struct, rcu_tramp_nesting));
 #endif
   BLANK();
   DEFINE(THREAD_CPU_CONTEXT,	offsetof(struct task_struct, thread.cpu_context));
diff --git a/arch/arm64/kernel/entry-ftrace.S b/arch/arm64/kernel/entry-ftrace.S
index 025140caafe7..46a102e7199a 100644
--- a/arch/arm64/kernel/entry-ftrace.S
+++ b/arch/arm64/kernel/entry-ftrace.S
@@ -14,6 +14,33 @@
 #include <asm/insn.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
+/*
+ * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().  The whole
+ * of ftrace_caller is treated as trampoline text by the irq-exit IP check (see
+ * arch_rcu_tasks_ip_in_trampoline()), so these only need to bracket the call
+ * out to ops->func; everything before the increment and after the decrement,
+ * including the direct-call tails that carry a BPF trampoline address in x17,
+ * is covered by that.  The count is only modified by current and every nested
+ * user (interrupts) is balanced, so a plain ldr/add/str is sufficient.
+ */
+	.macro rcu_tasks_tramp_enter, tsk:req, tmp:req
+#ifdef CONFIG_TASKS_RCU
+	mrs	\tsk, sp_el0
+	ldr	\tmp, [\tsk, #TSK_RCU_TRAMP_NESTING]
+	add	\tmp, \tmp, #1
+	str	\tmp, [\tsk, #TSK_RCU_TRAMP_NESTING]
+#endif
+	.endm
+
+	.macro rcu_tasks_tramp_exit, tsk:req, tmp:req
+#ifdef CONFIG_TASKS_RCU
+	mrs	\tsk, sp_el0
+	ldr	\tmp, [\tsk, #TSK_RCU_TRAMP_NESTING]
+	sub	\tmp, \tmp, #1
+	str	\tmp, [\tsk, #TSK_RCU_TRAMP_NESTING]
+#endif
+	.endm
+
 /*
  * Due to -fpatchable-function-entry=2, the compiler has placed two NOPs before
  * the regular function prologue. For an enabled callsite, ftrace_init_nop() and
@@ -94,6 +121,8 @@ SYM_CODE_START(ftrace_caller)
 	stp	x29, x30, [sp, #FREGS_SIZE]
 	add	x29, sp, #FREGS_SIZE
 
+	rcu_tasks_tramp_enter x12, w13
+
 	/* Prepare arguments for the tracer func */
 	sub	x0, x30, #AARCH64_INSN_SIZE		// ip (callsite's BL insn)
 	mov	x1, x9					// parent_ip (callsite's LR)
@@ -111,6 +140,8 @@ SYM_INNER_LABEL(ftrace_call, SYM_L_GLOBAL)
 	bl      ftrace_stub				// func(ip, parent_ip, op, regs)
 #endif
 
+	rcu_tasks_tramp_exit x12, w13
+
 /*
  * At the callsite x0-x8 and x19-x30 were live. Any C code will have preserved
  * x19-x29 per the AAPCS, and we created frame records upon entry, so we need
@@ -178,6 +209,10 @@ SYM_CODE_START(ftrace_stub_direct_tramp)
 SYM_CODE_END(ftrace_stub_direct_tramp)
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
 
+/* End of [ftrace_caller, ...) for arch_rcu_tasks_ip_in_trampoline(). */
+SYM_CODE_START(ftrace_static_tramp_end)
+SYM_CODE_END(ftrace_static_tramp_end)
+
 #else /* CONFIG_DYNAMIC_FTRACE_WITH_ARGS */
 
 /*
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index e1a3c0b3a051..1b7ac2afed0d 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -17,6 +17,22 @@
 #include <asm/insn.h>
 #include <asm/text-patching.h>
 
+#ifdef CONFIG_RCU_TASKS_PREEMPT_QS
+extern void ftrace_static_tramp_end(void);
+
+/*
+ * See rcu_tasks_ip_in_trampoline().  ftrace_caller and ftrace_stub_direct_tramp
+ * are core kernel text but must be treated as trampolines: a task preempted in
+ * them may be carrying an ops pointer (x11) or a direct-call BPF trampoline
+ * address (x17) whose lifetime is guarded only by Tasks RCU.
+ */
+bool arch_rcu_tasks_ip_in_trampoline(unsigned long ip)
+{
+	return ip >= (unsigned long)ftrace_caller &&
+	       ip <  (unsigned long)ftrace_static_tramp_end;
+}
+#endif
+
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
 struct fregs_offset {
 	const char *name;

-- 
2.55.0


