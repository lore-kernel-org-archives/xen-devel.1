Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A13EC88E41
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415154.1644688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jrW-0005lY-W2; Thu, 10 Sep 2026 18:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415154.1644688; Thu, 10 Sep 2026 18:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jrW-0005lL-Qf; Thu, 10 Sep 2026 18:51:06 +0000
Received: by outflank-mailman (input) for mailman id 1415154;
 Thu, 10 Sep 2026 18:51:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x4jrV-0005XH-0p
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 18:51:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4jrU-00GcVR-DT
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:51:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fc02-bab6-0a2a0a5309dd-0a2a4505895e-24
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:51:04 +0200
Received: from [209.85.160.175] (helo=mail-qt1-f175.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fc17-4cb1-0a2a45050019-d155a0afe0fa-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:51:04 +0200
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-5306d609317so1134411cf.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:51:03 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9120f45a780sm2547836d6.10.2026.09.10.11.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 11:51:01 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789066263; x=1789671063; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAaaOhrJ7Jcw63o+Xz8kKBY4jQKDr2HCsih3+9envV4=;
        b=iMdfafnxHmbTYoQLU5GtDkFqgWcS9zyZTR6ftc+GmmdOJzaZZG+SXqYLtWTaurTkrO
         eJEGeV6ENiZWYXHBlfoyEor5VIJcGMRtWRHNjfo1uPOntmfmGeUqxWUD7BrXgn/tWbun
         hYZF8cAysRcbJJCC5iVZH/oN7WFVLY9cZFQAmFgPcinc1h7aqLKbVlDjvgTylwLDEUHL
         /b4PoGO1Mbx8y5M0cf8H2dQkGk/d7ViGDoAnmPcpyWOQLejgcmvgLPFRFkdqggaUnXCW
         kHTtsqrmzyk+THRkWTUNDMHoZsIgP92KrA6o14bkZvBGs8PPJWHWg3cLJ7hOzXAMXSZO
         zITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066263; x=1789671063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAaaOhrJ7Jcw63o+Xz8kKBY4jQKDr2HCsih3+9envV4=;
        b=ZXqyKIkYdPfwEKLl2m8HDiUkv9sv/VAp3qkDC1b/5g1EUbsWE02PQXeHE5boM6/31i
         DLFBFaRnW6ZsygnQLsET4p5AA3cjoQn2sX8iO3JyCYM4GIcdIHcFSAy6pPVpR2XZsi6s
         p6sScywp+JNSfgvxufgPTLWmoxw/6kqJ5r4RiRwPdtJ51M1xZl29CrygMLp0BE621j5J
         HBzyQBfvSUbg4rUxY/2OGLguX6waYPT6wylZyHIC4SFqjPvyaVTffqX0MkfeGujKcrC/
         WSe5OIPOlKY3zPb9yKFVMB2oGHyGp/wVygP6ZQdHs2Ra9/6H/q24tKgtgMguUlKazZo4
         hI5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwaV3L/XH7uGrlBizYSPSeQHF0vZ0R2yUHlIZjuEQvm/eFBcqtboc8XSR8426e5u3kj8MEBq7Zql6M=@lists.xenproject.org
X-Gm-Message-State: AFuF++kjGdFcpOrK4jMIqZMCwvWLe+ltLtvVzYjVfhdbUQWj32AMUT/U
	h8f+sDaYDMamgYd93CWvlcKEZpKuZTJjye1DuGjOqIOox8UdvolHPRVPurxhiGp2WMk=
X-Gm-Gg: AYBFou11C1PEK0++Iz+yGR5aJiOkpt+em+ikRflk7ENIW9GblQHtcmdtvjrOoNzWlwd
	VfON1BiY0RVWE/n/19JyvMTPDfXVi9hadinKI/RqWEQmkztujBhi1pXxo7SKXOnEPVi+EUUSbFk
	9R8hpItcfaXYfbIiuj1dAAXrLRotGr68QfmXSzBEYFlcGt06APvodelp88C2GyEnpRfigmIqSeX
	+1Bw/58qw6iCv8Y6hzYVN+Dv4P+Hy8VLKTqXXGp4ZwqeItwi+TGDOdRMBrWNlJXt0kBYq8OSiPj
	NdDbBILdVlUFq+NnXZCF8HAI8dEvzdtSAa1W4rf/PBTxga0oUSXjoAilJy3vnm4WYqLw0NRpKHz
	jqYIk0WqrByS6Ef5UTJws36QDnOdBO60YzE1AQqalG1fHO7NoVCCkgW0bKjDlLYMTAGSrd7+qnm
	pZTMqwAi41t3q5UEdOGoAhNmFbNNC5/2IYB34Z/FVOmwuZ7+e1POtimxyrYd1NMesJdNpPGB6tg
	cMO9aBD5Xl9yUQG79aiC5cOHLV1OnDSgQ/mBz9T21QHWXM89tkHzCxH
X-Received: by 2002:a05:622a:1309:b0:530:42d4:4c98 with SMTP id d75a77b69052e-530c8756e8amr10238141cf.42.1789066262237;
        Thu, 10 Sep 2026 11:51:02 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:29 +0000
Subject: [PATCH RFC 06/13] x86/ftrace: Maintain Tasks RCU trampoline
 nesting in ftrace_caller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-6-d4469f4cc101@toxicpanda.com>
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
X-purgate-ID: tlsNG-c201ff/1789066264-72EB12A1-9D871752/0/0
X-purgate-type: clean
X-purgate-size: 7824

Bracket the call out to the ftrace_ops callback in ftrace_caller and
ftrace_regs_caller with an increment/decrement of
current->rcu_tramp_nesting.  The instructions sit inside the region that
create_trampoline() copies for per-ops dynamic trampolines, so those
inherit them; the %rip-relative per-CPU reference to current_task is
fixed up by text_poke_apply_relocation() like CALL_DEPTH_ACCOUNT's.
%rdx is dead at both points (about to be loaded with the ops pointer on
entry, restored by restore_mcount_regs on exit).

Two pieces of core text still run with the count at zero while holding
the address of a Tasks-RCU-protected trampoline they are about to
enter: the static stubs themselves, whose direct-call tails keep a BPF
trampoline address on the stack until the final RET, and, under
CONFIG_MITIGATION_RETHUNK, the return thunk that RET expands to.  Add an
ftrace_static_tramp_end marker after ftrace_stub_direct_tramp and linker
symbols around .text..__x86.return_thunk and .text..__x86.rethunk_safe,
and provide arch_rcu_tasks_ip_in_trampoline() covering
[ftrace_caller, ftrace_static_tramp_end) and both thunk ranges so the
irq-exit check treats a task interrupted there as still inside a
trampoline.

The hook is built only under CONFIG_RCU_TASKS_PREEMPT_QS, which x86 does
not select until a later patch.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/kernel/asm-offsets.c |  3 +++
 arch/x86/kernel/ftrace.c      | 37 +++++++++++++++++++++++++++++++++++++
 arch/x86/kernel/ftrace_64.S   | 43 +++++++++++++++++++++++++++++++++++++++++++
 arch/x86/kernel/vmlinux.lds.S |  4 ++++
 4 files changed, 87 insertions(+)

diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 081816888f7a..4f3b1caa5a30 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -46,6 +46,9 @@ static void __used common(void)
 #ifdef CONFIG_STACKPROTECTOR
 	OFFSET(TASK_stack_canary, task_struct, stack_canary);
 #endif
+#ifdef CONFIG_TASKS_RCU
+	OFFSET(TASK_rcu_tramp_nesting, task_struct, rcu_tramp_nesting);
+#endif
 
 	BLANK();
 	OFFSET(pbe_address, pbe, address);
diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
index 17d6edfcb7e0..8f63cd4b543c 100644
--- a/arch/x86/kernel/ftrace.c
+++ b/arch/x86/kernel/ftrace.c
@@ -275,6 +275,43 @@ static inline void tramp_free(void *tramp)
 	execmem_free(tramp);
 }
 
+#ifdef CONFIG_RCU_TASKS_PREEMPT_QS
+extern void ftrace_static_tramp_end(void);
+extern char __return_thunk_start[], __return_thunk_end[];
+extern char __rethunk_safe_start[], __rethunk_safe_end[];
+
+/*
+ * See rcu_tasks_ip_in_trampoline().  Some core kernel text behaves like a
+ * trampoline for Tasks RCU purposes because a task executing there with
+ * rcu_tramp_nesting == 0 may still be about to enter a Tasks-RCU-protected
+ * trampoline whose address it already holds:
+ *
+ *  - the static ftrace_caller / ftrace_regs_caller / ftrace_stub_direct_tramp
+ *    stubs, which carry a direct-call target on the stack until their final
+ *    RET, and
+ *  - the return thunks that RET expands to under CONFIG_MITIGATION_RETHUNK,
+ *    which run after leaving the stubs above and before landing in that
+ *    target.
+ */
+bool arch_rcu_tasks_ip_in_trampoline(unsigned long ip)
+{
+	if (ip >= (unsigned long)ftrace_caller &&
+	    ip <  (unsigned long)ftrace_static_tramp_end)
+		return true;
+#ifdef CONFIG_MITIGATION_RETPOLINE
+	if (ip >= (unsigned long)__return_thunk_start &&
+	    ip <  (unsigned long)__return_thunk_end)
+		return true;
+#endif
+#ifdef CONFIG_MITIGATION_SRSO
+	if (ip >= (unsigned long)__rethunk_safe_start &&
+	    ip <  (unsigned long)__rethunk_safe_end)
+		return true;
+#endif
+	return false;
+}
+#endif /* CONFIG_RCU_TASKS_PREEMPT_QS */
+
 /* Defined as markers to the end of the ftrace default trampolines */
 extern void ftrace_regs_caller_end(void);
 extern void ftrace_caller_end(void);
diff --git a/arch/x86/kernel/ftrace_64.S b/arch/x86/kernel/ftrace_64.S
index 62c1c93aa1c6..902472c41798 100644
--- a/arch/x86/kernel/ftrace_64.S
+++ b/arch/x86/kernel/ftrace_64.S
@@ -7,6 +7,7 @@
 #include <linux/cfi_types.h>
 #include <linux/linkage.h>
 #include <asm/asm-offsets.h>
+#include <asm/percpu.h>
 #include <asm/ptrace.h>
 #include <asm/ftrace.h>
 #include <asm/nospec-branch.h>
@@ -145,6 +146,27 @@ SYM_FUNC_END(ftrace_stub_graph)
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
+/*
+ * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().  These live
+ * inside the region copied into dynamic trampolines; the %rip-relative per-CPU
+ * reference is fixed up by text_poke_apply_relocation() in create_trampoline().
+ * The increment must precede the function_trace_op load: between that load and
+ * the call, the ops pointer in %rdx is protected only by Tasks RCU.
+ */
+.macro RCU_TASKS_TRAMP_ENTER reg:req
+#ifdef CONFIG_TASKS_RCU
+	movq PER_CPU_VAR(current_task), \reg
+	incl TASK_rcu_tramp_nesting(\reg)
+#endif
+.endm
+
+.macro RCU_TASKS_TRAMP_EXIT reg:req
+#ifdef CONFIG_TASKS_RCU
+	movq PER_CPU_VAR(current_task), \reg
+	decl TASK_rcu_tramp_nesting(\reg)
+#endif
+.endm
+
 SYM_FUNC_START(__fentry__)
 	ANNOTATE_NOENDBR
 	CALL_DEPTH_ACCOUNT
@@ -163,6 +185,8 @@ SYM_FUNC_START(ftrace_caller)
 	leaq MCOUNT_REG_SIZE+8(%rsp), %rcx
 	movq %rcx, RSP(%rsp)
 
+	RCU_TASKS_TRAMP_ENTER %rdx
+
 SYM_INNER_LABEL(ftrace_caller_op_ptr, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
 	/* Load the ftrace_ops into the 3rd parameter */
@@ -181,6 +205,8 @@ SYM_INNER_LABEL(ftrace_call, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
 	call ftrace_stub
 
+	RCU_TASKS_TRAMP_EXIT %rdx
+
 	/* Handlers can change the RIP */
 	movq RIP(%rsp), %rax
 	movq %rax, MCOUNT_REG_SIZE(%rsp)
@@ -209,6 +235,8 @@ SYM_FUNC_START(ftrace_regs_caller)
 
 	CALL_DEPTH_ACCOUNT
 
+	RCU_TASKS_TRAMP_ENTER %rdx
+
 SYM_INNER_LABEL(ftrace_regs_caller_op_ptr, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
 	/* Load the ftrace_ops into the 3rd parameter */
@@ -246,6 +274,8 @@ SYM_INNER_LABEL(ftrace_regs_call, SYM_L_GLOBAL)
 	ANNOTATE_NOENDBR
 	call ftrace_stub
 
+	RCU_TASKS_TRAMP_EXIT %rdx
+
 	/* Copy flags back to SS, to restore them */
 	movq EFLAGS(%rsp), %rax
 	movq %rax, MCOUNT_REG_SIZE(%rsp)
@@ -328,6 +358,19 @@ SYM_FUNC_START(ftrace_stub_direct_tramp)
 	RET
 SYM_FUNC_END(ftrace_stub_direct_tramp)
 
+/*
+ * [ftrace_caller, ftrace_static_tramp_end) is treated as trampoline text by
+ * rcu_tasks_ip_in_trampoline(): after RCU_TASKS_TRAMP_EXIT the stubs may
+ * still hold a direct-call target (a BPF trampoline) on the stack until the
+ * final RET, and that target's lifetime is guarded by Tasks RCU.  With
+ * return thunks the RET itself runs elsewhere; arch_rcu_tasks_ip_in_trampoline()
+ * covers the thunk text too.
+ */
+SYM_CODE_START_NOALIGN(ftrace_static_tramp_end)
+	UNWIND_HINT_UNDEFINED
+	ANNOTATE_NOENDBR
+SYM_CODE_END(ftrace_static_tramp_end)
+
 #else /* ! CONFIG_DYNAMIC_FTRACE */
 
 SYM_FUNC_START(__fentry__)
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 2438b89a4620..e546283dc267 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -151,7 +151,9 @@ SECTIONS
 		 * definition.
 		 */
 		. = srso_alias_untrain_ret | (1 << 2) | (1 << 8) | (1 << 14) | (1 << 20);
+		__rethunk_safe_start = .;
 		*(.text..__x86.rethunk_safe)
+		__rethunk_safe_end = .;
 #endif
 		ALIGN_ENTRY_TEXT_END
 
@@ -162,7 +164,9 @@ SECTIONS
 		SOFTIRQENTRY_TEXT
 #ifdef CONFIG_MITIGATION_RETPOLINE
 		*(.text..__x86.indirect_thunk)
+		__return_thunk_start = .;
 		*(.text..__x86.return_thunk)
+		__return_thunk_end = .;
 #endif
 		STATIC_CALL_TEXT
 		*(.gnu.warning)

-- 
2.55.0


