Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7E8C88E59
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:10:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416872.1645855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51xM-0000YZ-5A; Fri, 11 Sep 2026 14:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416872.1645855; Fri, 11 Sep 2026 14:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51xM-0000YQ-1F; Fri, 11 Sep 2026 14:10:20 +0000
Received: by outflank-mailman (input) for mailman id 1416872;
 Fri, 11 Sep 2026 14:10:18 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x51xK-0000RU-IK
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:10:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51xJ-00E9ea-VR
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:10:17 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40bc8-2eae-0a2a0a5409dd-0a2a4508aad8-6
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:10:17 +0200
Received: from [74.125.230.204] (helo=mail-qk2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40bc8-f659-0a2a45080019-4a7de6ccdbbc-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:10:17 +0200
Received: by mail-qk2-f12.google.com with SMTP id
 af79cd13be357-93910cadeb7so101377585a.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 07:10:17 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939e80bc225sm248184485a.36.2026.09.11.07.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 07:10:14 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789135816; x=1789740616; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9b8kkjvSg0tb+ScPvKP3GAz1Pld5wxO+feqfkbC4jq4=;
        b=Rj9mt4LQ2JA6Xo4EOfH7Dmn5m/KK4gpg+wsjE+eMhrbWc3EpkvLwbEvQNE/n/oxmG7
         TYK/EbytyhK7UWgiL4ohzwpHh8/Nvd073WGK5915Ke1w6hJVVk4+Fb8V9F7UHJZW0KIO
         Ob+zuUs2aBAj0RsV84BMa4WJM5h2aKXZ+3aa+omYxHGQDOvZ/dt/EUcgghMTht6G0QS4
         RqydB7uKeJNoyJTW7zslPDyWAEk2nD2BpidYcrX5i5xMU6qvsPGLX5Ms9VoHO2cdbnkp
         30dsNY4cDKuavBkgSqn8LEIfzIE+gcvlqEkUIv27X7AL1Bj+kTO6MO0jAwTjTTrgxNEW
         7SIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135816; x=1789740616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9b8kkjvSg0tb+ScPvKP3GAz1Pld5wxO+feqfkbC4jq4=;
        b=jCqd3Gbx7FqWEpmAMkqZ7WdcK7EpZO+kOL3dB9DmRIJ82iOG2tlN0lYUMNsvhjH+q0
         gkds3gJZDcZE4y3/Tckt8psy6eWsKkSf/Wfd0ZNInDNE6W3adTOgia4FAmMULOZHyeYM
         ImjqTxzzI1oJHKzN36Vejf/FVgASnCfaVTgXPlcpgP7xHZnlU7P2Qg95/kZIC4BR9oX9
         AO2f2AVS6i3B6KeggnT/A9w7K0JKRwLTor0oKWUaTE2k/cKpZlZBhexvIFtIckmKvlvk
         dp7L8I4aif1RY3QDf65Cb9D+bszkVlQXJ/rKbhmYX/BTFyjj0kTCZ5JU9AioDE2/2baj
         +KMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgws0/fITlbaXXEdO5d3UUOaDh76hyOhz9y8cimnImLUZrBsOyfa+BiCspVsidq/iUf1bHJn1Hcfw=@lists.xenproject.org
X-Gm-Message-State: AFuF++no2XfN07ToszKML4OBzwkb5/VHodgHSAkcZJ8vBpIgHwczO/SV
	8IehoemYWud12bQqu9nJPCoQx4tpXqtgvp8Sc/W+6vVwMsg0nFca8x83TPerH62afjU=
X-Gm-Gg: AYBFou0GHVt59hQYYdE2iaKbsEn9m8fJ2a9YFXBvMfJe0ixbs/ZavMMAk6d3ufp6tD2
	B3Bnzat8JmLn/5Iu1nhrszlfkNX73Mmp8NcrIGT1fHneF00W5ANXlgiHxYBAoL6T/SlRGupLKGu
	tH9fH0jXReMzzvNKWos/wlH2iRf1e2nD5SCyhd4zopIJkugsGcypZH96cFxTD81Pk6pF4M2OEIz
	PqV7TlsaaktWtEEY8Rj16jmjHzvvHo1rHlGIPf9ub4eJeiZ5ZnIZbuxMztyR5/YFP9JUtdR0Zbg
	L4eRvgxM/RY+TBH2/rikpMTDlzkl80CsMbdaZ1a6m6Q6KMa0fbpnU7XdRVpJC3h53DgEYGB+Pgw
	7gKwcVXWBKboH6e+DpjdaHYYhAo1WtuZtoFRNlE5TZhh+XV+bziJnEP/hPjWpUGoRaQy8CCndBa
	z45Bs1kTqhNx/lBTYCi82ZiD4MiCJxqSwcA5Kp6tZgIwUVPdjMPJTGYPHkGV+Mdjzrn1aD6+PNp
	W3kVi5M+WOktG2vR6j50KDFpkAPFyKVk6tye+rVY9gvhzTl8pqAhhoO
X-Received: by 2002:a05:620a:4103:b0:939:7f14:ebc6 with SMTP id af79cd13be357-939ea036d6cmr589566285a.3.1789135815998;
        Fri, 11 Sep 2026 07:10:15 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:48 +0000
Subject: [PATCH RFC v2 10/15] bpf, arm64: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-10-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135736; l=4364;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=MVjrbMDjnAqQ8aHx7Jc4sWMH68fI2crdoTABU++vCCI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLeRHDw//rEtUsP8CEBuDuvfZIDhzXHIZMrHDgrgPTpnzRVCinhLEvplAgnBDiwNcYGB3QeJu+7
 QOU1v97vhHA4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c1860d/1789135817-CC57487B-8EF62256/0/0
X-purgate-type: clean
X-purgate-size: 4366

Same scheme as x86: emit "mrs x10, sp_el0; ldr/add|sub/str w11" to bump
current->rcu_tramp_nesting after the callee-saved registers are stored
and to drop it before they are restored, and release it around the call
to the original function, which im->pcref protects and which must not
pin a Tasks RCU grace period.  x10/x11 are scratch at every emission
point; the fmod_ret cbnz target lies after the decrement/increment pair
around the original call, and the ip_after_call nop follows the
re-increment, so the count is balanced on every path.  BUILD_BUG_ON
guards the LDR/STR immediate range for the task_struct offset.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/arm64/net/bpf_jit_comp.c | 46 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index c18e005a41db..5c9a7bde5cc9 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -2591,6 +2591,34 @@ static void emit_arena_arg_conv(struct jit_ctx *ctx, u8 dst, u8 src, bool nullab
 	emit(A64_SUB(0, dst, src, base_lo), ctx);
 }
 
+/*
+ * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().
+ *
+ *   mrs  x10, sp_el0
+ *   ldr  w11, [x10, #offsetof(struct task_struct, rcu_tramp_nesting)]
+ *   add/sub w11, w11, #1
+ *   str  w11, [x10, #...]
+ *
+ * x10/x11 are scratch in the trampoline at every point this is emitted.
+ */
+static void emit_rcu_tasks_tramp_nesting(struct jit_ctx *ctx, bool enter)
+{
+#ifdef CONFIG_TASKS_RCU
+	const int off = offsetof(struct task_struct, rcu_tramp_nesting);
+	const u8 tsk = A64_R(10), cnt = A64_R(11);
+
+	BUILD_BUG_ON(off & 3 || off >= SZ_16K);	/* LDR/STR (imm12, scaled) */
+
+	emit(A64_MRS_SP_EL0(tsk), ctx);
+	emit(A64_LDR32I(cnt, tsk, off), ctx);
+	if (enter)
+		emit(A64_ADD_I(0, cnt, cnt, 1), ctx);
+	else
+		emit(A64_SUB_I(0, cnt, cnt, 1), ctx);
+	emit(A64_STR32I(cnt, tsk, off), ctx);
+#endif
+}
+
 static void save_args(struct jit_ctx *ctx, int bargs_off, int oargs_off,
 		      const struct btf_func_model *m, const struct arg_aux *a,
 		      bool for_call_origin, bool is_struct_ops, u64 arena_base)
@@ -2854,6 +2882,13 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	emit(A64_STR64I(A64_R(19), A64_SP, regs_off), ctx);
 	emit(A64_STR64I(A64_R(20), A64_SP, regs_off + 8), ctx);
 
+	/*
+	 * From here until the matching decrement in the epilogue, a preemption
+	 * of this task is not a Tasks RCU quiescent state.  The instructions
+	 * above this point are covered by the irq-exit IP check.
+	 */
+	emit_rcu_tasks_tramp_nesting(ctx, true);
+
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		/* for the first pass, assume the worst case */
 		if (!ctx->image)
@@ -2898,12 +2933,20 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		/* the original func takes kernel addresses, never converted ones */
 		save_args(ctx, bargs_off, oargs_off, m, a, true, is_struct_ops, 0);
+		/*
+		 * The original function may run for a long time without
+		 * sleeping; do not let it pin a Tasks RCU grace period.  The
+		 * trampoline frame above it is held by im->pcref
+		 * (__bpf_tramp_enter()), not by Tasks RCU, across the call.
+		 */
+		emit_rcu_tasks_tramp_nesting(ctx, false);
 		/* call original func */
 		emit(A64_LDR64I(A64_R(10), A64_SP, retaddr_off), ctx);
 		emit(A64_ADR(A64_LR, AARCH64_INSN_SIZE * 2), ctx);
 		emit(A64_RET(A64_R(10)), ctx);
 		/* store return value */
 		emit(A64_STR64I(A64_R(0), A64_SP, retval_off), ctx);
+		emit_rcu_tasks_tramp_nesting(ctx, true);
 		/* reserve a nop for bpf_tramp_image_put */
 		im->ip_after_call = ctx->ro_image + ctx->idx;
 		emit(A64_NOP, ctx);
@@ -2945,6 +2988,9 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	if (flags & BPF_TRAMP_F_RESTORE_REGS)
 		restore_args(ctx, bargs_off, a->regs_for_args);
 
+	/* Remaining instructions are covered by the irq-exit IP check. */
+	emit_rcu_tasks_tramp_nesting(ctx, false);
+
 	/* restore callee saved register x19 and x20 */
 	emit(A64_LDR64I(A64_R(19), A64_SP, regs_off), ctx);
 	emit(A64_LDR64I(A64_R(20), A64_SP, regs_off + 8), ctx);

-- 
2.55.0


