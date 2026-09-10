Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49722C88E40
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415165.1644713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jre-0006fa-04; Thu, 10 Sep 2026 18:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415165.1644713; Thu, 10 Sep 2026 18:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jrd-0006eZ-Os; Thu, 10 Sep 2026 18:51:13 +0000
Received: by outflank-mailman (input) for mailman id 1415165;
 Thu, 10 Sep 2026 18:51:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x4jrc-0006Qa-RT
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 18:51:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4jrc-001YAS-7x
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:51:12 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fc16-2eae-0a2a0a5409dd-0a2a4504d6e0-18
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:51:12 +0200
Received: from [209.85.160.170] (helo=mail-qt1-f170.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fc1f-b57f-0a2a45040019-d155a0aad1c4-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:51:12 +0200
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-53091987029so1493231cf.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:51:11 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9120f47a239sm2556366d6.26.2026.09.10.11.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 11:51:06 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789066271; x=1789671071; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VM45t8rF8CqlHWPsaSwdk7BD4ox5LDNpAeDrj6m5qM=;
        b=LFkPgazcrw8BpnABGKjUhCWQdoyba0TX6luIrM7Qm2WQnLD+cmgGm4oyPaBHLo0Rz8
         +gSfqx4/X/hO1JevE9rUYXf6wqBZyUSEg57kdqhiPB1Mc5lJl9glmGEUAVtvbWLo9OJi
         HX6rDOsv60e5yamxLDrTK13hYLVIh74DAW3rpmO6x7Fdt7Zte/a3+PO/YC7pg1Gg32mZ
         5XPzdsGFwAyiYR2EAp0q++ogLg2Wb2YR8G3AhM9iNZ6+mazhE01UTXdHXjXy8DFeepFO
         X3XldodNBS2xmxTCoPaDLEiI/OE2yKL0Ab0nlvMxNDYYy8AepnHEq+F/0snFuDOZ7oJ6
         tahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066271; x=1789671071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VM45t8rF8CqlHWPsaSwdk7BD4ox5LDNpAeDrj6m5qM=;
        b=GctmtDuxfshuBde7qmWn7P5qaQ14r66IXlZUeq2cXfxMWWpEszgA0d574IzWLeqohi
         LwgLLfbcOpFWcYhODBdI7sgs4JqlYy3crIst6R4QYs60O9Bcezen8jUT9cT4CFq156nH
         KWR4fSw0Sv7a7vMnBOSebGnNusFVa7rFTq/CW2qxiboBaDS5Vv6M0V3Mwr4cPdZ5/lH3
         fv3okBJ7nnFbUdJN2hNvIDcajNo4q9MLupV60l5daojqw5mUoRgr0vFwneQ7PVe95PNU
         v2oaEAm8W945wBg+XuLJxwen9wevH4dlbIDXOCYifUZY67K4fS9r36g27SpG9bJPaScw
         2CKg==
X-Forwarded-Encrypted: i=1; AKwUvBywYzarpWE7zVfpyzEiPFHJAF0DFPSRo0Z2All2QI6aOVUoy96H4oX2OMbsYHBZlJ+O3XctKfpGOXM=@lists.xenproject.org
X-Gm-Message-State: AFuF++mKi0tYTULD+/6sqkbO8GtXAdr5gAi1YqcrRNEX0lfS1lYhPK/m
	WeDAJvNr+2pKpyU6TIr1UXLJdAuH4hCKWn/9FrsQ697CjP1VJvraUBKQMMMpL1rVM5A=
X-Gm-Gg: AYBFou2NmfOqz6SucL/tYH2WjTbl4l0Imcizx63p3q+rm5LNFvINnZxCsI98FNQt62h
	OAwJdF0idXcI13aE8cCQCV1mQDynU63R8DIovemuqtwTE167Vv3OuHzLQ8ErvW+DeoZLAS3Heeb
	htDK9WJff7c61y4goajGwujgNKcl3PU0asIf3fycLXyUMaxbeEsNx72VIfycJAFlpcOKCXlkn7E
	+Zw3RkHQeUO1ekD335Cp6HIrvXhZ74X43OwFkcw1mczFsALyH83DSrmsM3/VdwmC0l20TNa15KA
	EQVBkWrERHVGlJXM8ZIoGeNuzPixBYC/CMCsAMx8sRm2FVjM2EE1bBoh4jIG2rVpIIbFlXuiwqs
	SKB0HMMxti5caijhtfy0tki1VCNc11HreXlRsJ5NQhSFlN3PjatHRiqNApC1enu1hcb+O26/be8
	xV/l6QyMn10178tUr7xj16Km2mZSKlIEKyftQQGyYN/cBVIomT3SpG/CsMflz1RVAoC2d6a8Xxy
	Z9bhmLzk6V69crU6TYYpfRx19eqzIyTCQIIK/nHjIqO0hQy+xXth6CK
X-Received: by 2002:a05:622a:2294:b0:530:b2e4:d597 with SMTP id d75a77b69052e-530c87487damr11129971cf.50.1789066266848;
        Thu, 10 Sep 2026 11:51:06 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:31 +0000
Subject: [PATCH RFC 08/13] bpf, x86: Maintain Tasks RCU trampoline nesting
 in the BPF trampoline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-8-d4469f4cc101@toxicpanda.com>
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
X-purgate-ID: tlsNG-ebf023/1789066272-C24CBB50-345CEFD1/0/0
X-purgate-type: clean
X-purgate-size: 4466

Emit an increment of current->rcu_tramp_nesting once the trampoline's
frame is set up and a decrement before the final register restore, so
that a task preempted while running fentry/fexit/fmod_ret/LSM programs
or the __bpf_tramp_enter()/__bpf_tramp_exit() glue is not treated as
Tasks-RCU quiescent.  Drop the count around the call to the original
function: that may run arbitrarily long without sleeping and must not pin
a Tasks RCU grace period, and the trampoline frame above it is held by
im->pcref rather than by Tasks RCU (see bpf_tramp_image_put()).  The
fmod_ret early-exit branch and the ip_after_call -> ip_epilogue poke both
skip the decrement/increment pair around the original call, so the count
stays balanced on every path.

The sequence is "mov r11, gs:[current_task]; inc/dec dword [r11 + off]";
r11 is scratch at every emission point and (u32)&current_task is a valid
sign-extended %gs-absolute with the current per-CPU layout, the same form
the JIT already uses for this_cpu_off.  The image is dynamically
allocated text, so the instructions outside the bracketed region are
covered by the irq-exit IP check.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/net/bpf_jit_comp.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 2853e87797a7..a375c1b7bd50 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -722,6 +722,31 @@ static void emit_indirect_jump(u8 **pprog, int bpf_reg, u8 *ip)
 	*pprog = prog;
 }
 
+/*
+ * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().
+ *
+ *   mov r11, QWORD PTR gs:[current_task]
+ *   inc/dec DWORD PTR [r11 + offsetof(struct task_struct, rcu_tramp_nesting)]
+ *
+ * r11 (AUX_REG) is scratch in the trampoline at every point this is emitted.
+ */
+static void emit_rcu_tasks_tramp_nesting(u8 **pprog, bool enter)
+{
+#ifdef CONFIG_TASKS_RCU
+	u8 *prog = *pprog;
+
+	/* mov r11, gs:[abs32] */
+	EMIT2(0x65, 0x4C);
+	EMIT3(0x8B, 0x1C, 0x25);
+	EMIT((u32)(unsigned long)&current_task, 4);
+	/* inc/dec dword ptr [r11 + disp32] */
+	EMIT3(0x41, 0xFF, enter ? 0x83 : 0x8B);
+	EMIT(offsetof(struct task_struct, rcu_tramp_nesting), 4);
+
+	*pprog = prog;
+#endif
+}
+
 static void emit_return(u8 **pprog, u8 *ip)
 {
 	u8 *prog = *pprog;
@@ -3610,6 +3635,13 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	/* mov QWORD PTR [rbp - rbx_off], rbx */
 	emit_stx(&prog, BPF_DW, BPF_REG_FP, BPF_REG_6, -rbx_off);
 
+	/*
+	 * From here until the matching decrement before the final return, a
+	 * preemption of this task is not a Tasks RCU quiescent state.  The
+	 * instructions above this point are covered by the irq-exit IP check.
+	 */
+	emit_rcu_tasks_tramp_nesting(&prog, true);
+
 	func_meta = nr_regs;
 	/* Store number of argument registers of the traced function */
 	emit_store_stack_imm64(&prog, BPF_REG_0, -func_meta_off, func_meta);
@@ -3670,6 +3702,13 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 			LOAD_TRAMP_TAIL_CALL_CNT_PTR(stack_size);
 		}
 
+		/*
+		 * The original function may run for a long time without
+		 * sleeping; do not let it pin a Tasks RCU grace period.  The
+		 * trampoline frame above it is held by im->pcref
+		 * (__bpf_tramp_enter()), not by Tasks RCU, across the call.
+		 */
+		emit_rcu_tasks_tramp_nesting(&prog, false);
 		if (flags & BPF_TRAMP_F_ORIG_STACK) {
 			emit_ldx(&prog, BPF_DW, BPF_REG_6, BPF_REG_FP, 8);
 			EMIT2(0xff, 0xd3); /* call *rbx */
@@ -3680,6 +3719,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 				goto cleanup;
 			}
 		}
+		emit_rcu_tasks_tramp_nesting(&prog, true);
 		/* remember return value in a stack for bpf prog to access */
 		emit_stx(&prog, BPF_DW, BPF_REG_FP, BPF_REG_0, -8);
 		im->ip_after_call = image + (prog - (u8 *)rw_image);
@@ -3741,6 +3781,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	if (save_ret)
 		emit_ldx(&prog, BPF_DW, BPF_REG_0, BPF_REG_FP, -8);
 
+	/* Remaining instructions are covered by the irq-exit IP check. */
+	emit_rcu_tasks_tramp_nesting(&prog, false);
+
 	emit_ldx(&prog, BPF_DW, BPF_REG_6, BPF_REG_FP, -rbx_off);
 
 	EMIT1(0xC9); /* leave */

-- 
2.55.0


