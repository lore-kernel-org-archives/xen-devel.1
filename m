Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F913C982DA
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 14:50:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425499.1649456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Zub-0005gJ-Gd; Fri, 18 Sep 2026 14:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425499.1649456; Fri, 18 Sep 2026 14:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Zub-0005g8-CS; Fri, 18 Sep 2026 14:50:01 +0000
Received: by outflank-mailman (input) for mailman id 1425499;
 Fri, 18 Sep 2026 14:49:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x7ZuZ-0005U8-Kw
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 14:49:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7ZuZ-0054h4-1p
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 16:49:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aad4f97-8faa-0a2a0a5109dd-0a2a4507eda8-0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:49:59 +0200
Received: from [209.85.160.171] (helo=mail-qt1-f171.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aad4f95-b4ea-0a2a45070019-d155a0aba40a-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:49:58 +0200
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-52ff0eea420so6539841cf.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 07:49:58 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-532ac48df0fsm2560241cf.6.2026.09.18.07.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 07:49:56 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789742997; x=1790347797; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tx2UYwtxbz9ZqVNvSp5mlXDS3jyz+Ej3sfBe8tuEQZo=;
        b=E2IjlHcSBercr7jNqDVvN2nxUYcKbDPPAxG954ib+qwqRPH4B2zHgxgl3Mf5wLPlJF
         NpB9PJTUt/CLqL+PafCC6572u3RtwiGzrZGJYwP15sR35Y/fcGPgZANWrf9XWN93Sf51
         a5mt5LWiXYXQSP5HFcwvF4yIGw5n2l6Nt9xOGyFCk1aqHDvi/TBHXJwRKBWvQHOxetuM
         QIr1W2qL4j4ndipkysE0HkFfxxVkFzzcSG9cxOl0i6wXf2p1bFr9ls71fX076STrb/A1
         7KrRgghjFfBAt0KuZrqqtK4a9RxnGtWVcu6cdpEX/Hxj+qjxHcSDLMHs7q9QR6+Ymulm
         mG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742997; x=1790347797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tx2UYwtxbz9ZqVNvSp5mlXDS3jyz+Ej3sfBe8tuEQZo=;
        b=laKZIP2poUZGfHVY5ctY7ZF53zLCo7wV8Z+LiuJGj9FhdVyYgBUaHC0w8Pn13h4026
         YxfD6WnPcV9GJODJ2L56NJpEADVE2hJrBgF51RFYxuW0ds5h6EB8FrKNZH4h1LeNVnlZ
         RO90gynm3w29kVrE63a5gJ2kgCMKd8SpqGiDsgFu6nJezEkVzvTXK5Wk8u4CyvwPm4RA
         Md5vWtopRPIvSQdq7GHW/WRw5OpYdGIyXgUypzcgKrkNuyreSvSZGgt4CGRGfwe6GWHx
         Oh8TR6m/tRFJr1pMkAVYyo3ut0uoBoJtb92kJWkhjPat6ksHuw9//o5+rQGh+Dgvx8H1
         ANKA==
X-Forwarded-Encrypted: i=1; AKwUvBxT+1JA0ELvlBm1nF8GrTbPGP79cyNoK+w5vgukIdK0xFAT/Q1WBGZTyl0YwAli2uePxN4UvGmpycE=@lists.xenproject.org
X-Gm-Message-State: AFuF++lPxhu5MNLBz3IBI4rOZUZ2o71PJJaCUyiRNXYo+Xjaj6Jl/mno
	e+raof6OnTut7SIom8jVuKkx4b7AH4RjcRMWic9fuXBwafXHeQckKCyKLUrlR3BWYRc=
X-Gm-Gg: AYBFou3jx5kaxcbz563ef8oXnms7Nx4tYqGhhVy4DscApVyUVX06Hw+R+sg1L8idlKJ
	FUMluPzzv1IxkQUmhSA0eUYpE5F7RPmREurvE5xS85JxosVDW+tvp0a2kbm+7Y9BX+QC+4K87YX
	qX5Em2zOcjHzlcrPnL4LcEOr3kQHyWbYJ5GAtRwkrnLIbA0LUuOx/IGnMApEonXHaY7eNjdwnfO
	GYtl6jTZw4MFxzEinx3ELSKTZMubW15rEr7waVOybr4lFrI1t5dL48Sf8evZ6T3dDPLDjs6XNou
	AYRYxzYs+CmjjcSXPIxB/SZboIEyNaBCGRkZOK49iN5De0CcE3v+E5o7aRfblreL7hpJnzfHboR
	Q1HaYzGAVjxidiHIVyrJmB47GhTHPgeMlW4Q4iOVq7cWMG60r2qOucvyaqYnPt9WdRf7hjNHEZ0
	aEpXGRDDFxISZQVkBfpqA+ye8NU8kyzZrHaOq/f8/1y+NZgrs0iO4V5CNatfYFAZn+UvbSLLWFL
	ocywhJ15DhobhQvSDxUsrSD8/Yku3lXFUactiVjdLVq2qOCJOZ06rY6
X-Received: by 2002:ac8:5f4f:0:b0:531:e51:12f9 with SMTP id d75a77b69052e-5328cfc0a9fmr106591791cf.24.1789742997160;
        Fri, 18 Sep 2026 07:49:57 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 18 Sep 2026 14:49:26 +0000
Subject: [PATCH RFC v4 07/13] bpf, x86: Take a Tasks Trace reader in the
 trampoline around its call-outs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-b4-rcu-tasks-preempt-qs-v4-7-63f0e9d69661@toxicpanda.com>
References: <20260918-b4-rcu-tasks-preempt-qs-v4-0-63f0e9d69661@toxicpanda.com>
In-Reply-To: <20260918-b4-rcu-tasks-preempt-qs-v4-0-63f0e9d69661@toxicpanda.com>
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
 Xu Kuohai <xukuohai@huaweicloud.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
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
 xen-devel@lists.xenproject.org, Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789742980; l=8086;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=JGl/QtTBddM7nyy/qfbMR7PzifAXs0WCS5aHiUuitqA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIEBfe7NVaGlqFqLQwZKbFw8BpHmlfuvIjJBnOTYn9qtDCjTJL+2uxQrDvhCu7CSaCn6ZdAis0V
 Bpsr/bJffvAk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ef75cf/1789742999-35EC6AE4-2408CD1E/0/0
X-purgate-type: clean
X-purgate-size: 8088

On HAVE_RCU_TRAMPOLINE_READERS kernels Tasks RCU keeps a BPF trampoline
image allocated only while a task using it is a Tasks Trace RCU reader
or is executing text that rcu_tasks_trampoline_text() recognises.  The
image itself is such text, but the C glue and the programs it calls are
not, and only sleepable programs take rcu_read_lock_trace() today.

Have the x86-64 JIT open-code rcu_read_lock_trace() and
rcu_read_unlock_trace() in the trampoline, as ftrace_64.S does for
ftrace_caller: one reader from just after the frame is set up to just
before the original function is called, covering __bpf_tramp_enter()
and the fentry and fmod_ret programs, and a second one from just after
the original function returns to just before the final register
restore, covering the fexit programs and __bpf_tramp_exit().  The
original function itself runs outside both, since it may run for a long
time and the image is pinned by im->pcref across it.  Trampolines that
do not call the original function get a single reader around all their
programs.  The second reader is entered before ip_after_call, so the
ip_after_call -> ip_epilogue jump that bpf_tramp_image_put() patches in
is inside it, and the fmod_ret early-exit branch lands after that point
still holding the first reader, so exactly one is held on every path.

The sequence uses r10 and r11, which are scratch at each emission point,
and references current_task and rcu_tasks_trace_srcu_struct by absolute
sign-extended address, the form the JIT already relies on for
this_cpu_off.  Sleepable programs' own rcu_read_lock_trace() simply
nests.  Nothing is emitted on other configurations.

Suggested-by: Alexei Starovoitov <ast@kernel.org>
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/net/bpf_jit_comp.c | 113 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 2853e87797a7..c991f7ceacdf 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -14,6 +14,7 @@
 #include <linux/memory.h>
 #include <linux/sort.h>
 #include <linux/execmem.h>
+#include <linux/rcupdate_trace.h>
 #include <asm/extable.h>
 #include <asm/ftrace.h>
 #include <asm/set_memory.h>
@@ -722,6 +723,97 @@ static void emit_indirect_jump(u8 **pprog, int bpf_reg, u8 *ip)
 	*pprog = prog;
 }
 
+/*
+ * Open-coded rcu_read_lock_trace() / rcu_read_unlock_trace() for the
+ * trampoline, see CONFIG_HAVE_RCU_TRAMPOLINE_READERS and the equivalent
+ * macros in arch/x86/kernel/ftrace_64.S.  The image is not relocated, so
+ * current_task and rcu_tasks_trace_srcu_struct are referenced by absolute
+ * (sign-extended 32-bit) address, the form the JIT already relies on for
+ * this_cpu_off.  Uses r10 and r11, which are scratch at every emission
+ * point, and clobbers flags.
+ *
+ * lock:                                  unlock:
+ *   mov  r11, gs:[current_task]            mov  r11, gs:[current_task]
+ *   mov  r10d, [r11+nesting]               mov  r10d, [r11+nesting]
+ *   inc  dword ptr [r11+nesting]           sub  r10d, 1
+ *   test r10d, r10d                        jnz  2f
+ *   jnz  1f                                mov  r10, [r11+scp]
+ *   mov  r10, [&srcu.srcu_ctrp]            mov  dword ptr [r11+nesting], 0
+ *   inc  qword ptr gs:[r10+locks]          (smp_mb)
+ *   mov  [r11+scp], r10                    inc  qword ptr gs:[r10+unlocks]
+ *   (smp_mb)                               jmp  3f
+ * 1:                                     2: mov [r11+nesting], r10d
+ *                                        3:
+ */
+static void emit_trace_rcu_reader(u8 **pprog, bool lock)
+{
+#ifdef CONFIG_TASKS_RCU_TRAMPOLINE_READERS
+	const u32 nesting = offsetof(struct task_struct, trc_reader_nesting);
+	const u32 scp = offsetof(struct task_struct, trc_reader_scp);
+	const bool mb = !IS_ENABLED(CONFIG_TASKS_TRACE_RCU_NO_MB);
+	u8 *prog = *pprog;
+
+	BUILD_BUG_ON(IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE));
+	BUILD_BUG_ON(offsetof(struct srcu_ctr, srcu_locks) != 0);
+	BUILD_BUG_ON(offsetof(struct srcu_ctr, srcu_unlocks) != 8);
+
+	/* mov r11, gs:[abs32 current_task] */
+	EMIT2(0x65, 0x4C);
+	EMIT3(0x8B, 0x1C, 0x25);
+	EMIT((u32)(unsigned long)&current_task, 4);
+	/* mov r10d, dword ptr [r11 + nesting] */
+	EMIT3(0x45, 0x8B, 0x93);
+	EMIT(nesting, 4);
+
+	if (lock) {
+		/* inc dword ptr [r11 + nesting] */
+		EMIT3(0x41, 0xFF, 0x83);
+		EMIT(nesting, 4);
+		/* test r10d, r10d */
+		EMIT3(0x45, 0x85, 0xD2);
+		/* jnz 1f */
+		EMIT2(X86_JNE, 8 + 4 + 7 + (mb ? 6 : 0));
+		/* mov r10, qword ptr [abs32 &rcu_tasks_trace_srcu_struct.srcu_ctrp] */
+		EMIT4(0x4C, 0x8B, 0x14, 0x25);
+		EMIT((u32)(unsigned long)&rcu_tasks_trace_srcu_struct.srcu_ctrp, 4);
+		/* inc qword ptr gs:[r10] */
+		EMIT4(0x65, 0x49, 0xFF, 0x02);
+		/* mov qword ptr [r11 + scp], r10 */
+		EMIT3(0x4D, 0x89, 0x93);
+		EMIT(scp, 4);
+		/* smp_mb(): lock add dword ptr [rsp - 4], 0 */
+		if (mb)
+			EMIT2_off32(0xF0, 0x83, 0x00FC2444);
+		/* 1: */
+	} else {
+		/* sub r10d, 1 */
+		EMIT4(0x41, 0x83, 0xEA, 0x01);
+		/* jnz 2f */
+		EMIT2(X86_JNE, 7 + 11 + (mb ? 6 : 0) + 5 + 2);
+		/* mov r10, qword ptr [r11 + scp] */
+		EMIT3(0x4D, 0x8B, 0x93);
+		EMIT(scp, 4);
+		/* mov dword ptr [r11 + nesting], 0 */
+		EMIT3(0x41, 0xC7, 0x83);
+		EMIT(nesting, 4);
+		EMIT(0, 4);
+		if (mb)
+			EMIT2_off32(0xF0, 0x83, 0x00FC2444);
+		/* inc qword ptr gs:[r10 + 8] */
+		EMIT4(0x65, 0x49, 0xFF, 0x42);
+		EMIT1(0x08);
+		/* jmp 3f */
+		EMIT2(0xEB, 7);
+		/* 2: mov dword ptr [r11 + nesting], r10d */
+		EMIT3(0x45, 0x89, 0x93);
+		EMIT(nesting, 4);
+		/* 3: */
+	}
+
+	*pprog = prog;
+#endif
+}
+
 static void emit_return(u8 **pprog, u8 *ip)
 {
 	u8 *prog = *pprog;
@@ -3610,6 +3702,16 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	/* mov QWORD PTR [rbp - rbx_off], rbx */
 	emit_stx(&prog, BPF_DW, BPF_REG_FP, BPF_REG_6, -rbx_off);
 
+	/*
+	 * Tasks RCU keeps this image alive only while we are a Tasks Trace
+	 * reader; the instructions before this point (and after the final
+	 * unlock) are covered by the irq-exit IP check.  One reader spans
+	 * __bpf_tramp_enter() and the fentry/fmod_ret progs, a second one
+	 * the fexit progs and __bpf_tramp_exit(); the original function runs
+	 * outside both, with the image pinned by im->pcref instead.
+	 */
+	emit_trace_rcu_reader(&prog, true);
+
 	func_meta = nr_regs;
 	/* Store number of argument registers of the traced function */
 	emit_store_stack_imm64(&prog, BPF_REG_0, -func_meta_off, func_meta);
@@ -3660,6 +3762,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	}
 
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
+		emit_trace_rcu_reader(&prog, false);
 		restore_regs(m, &prog, regs_off);
 		save_args(m, &prog, arg_stack_off, true, flags, 0);
 
@@ -3682,6 +3785,13 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		}
 		/* remember return value in a stack for bpf prog to access */
 		emit_stx(&prog, BPF_DW, BPF_REG_FP, BPF_REG_0, -8);
+		/*
+		 * Second reader.  Taken before ip_after_call so that the
+		 * ip_after_call -> ip_epilogue jump patched in at teardown is
+		 * inside it too; the fmod_ret early exit jumps past this still
+		 * holding the first reader, so either way exactly one is held.
+		 */
+		emit_trace_rcu_reader(&prog, true);
 		im->ip_after_call = image + (prog - (u8 *)rw_image);
 		emit_nops(&prog, X86_PATCH_SIZE);
 	}
@@ -3737,6 +3847,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		LOAD_TRAMP_TAIL_CALL_CNT_PTR(stack_size);
 	}
 
+	/* Remaining instructions are covered by the irq-exit IP check. */
+	emit_trace_rcu_reader(&prog, false);
+
 	/* restore return value of orig_call or fentry prog back into RAX */
 	if (save_ret)
 		emit_ldx(&prog, BPF_DW, BPF_REG_0, BPF_REG_FP, -8);

-- 
2.55.0


