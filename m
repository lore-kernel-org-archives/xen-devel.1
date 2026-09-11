Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F48C88E5B
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:10:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416862.1645828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51xD-0007wE-T7; Fri, 11 Sep 2026 14:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416862.1645828; Fri, 11 Sep 2026 14:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51xD-0007vr-Pc; Fri, 11 Sep 2026 14:10:11 +0000
Received: by outflank-mailman (input) for mailman id 1416862;
 Fri, 11 Sep 2026 14:10:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x51xC-0007sd-ML
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:10:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51xC-008fhq-3A
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:10:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40bb1-8faa-0a2a0a5109dd-0a2a450a8708-22
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:10:10 +0200
Received: from [209.85.222.174] (helo=mail-qk1-f174.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40bbc-f2d2-0a2a450a0019-d155deaed40e-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:10:05 +0200
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-939e028b3aeso125593085a.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 07:10:05 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939f1dd527asm125166385a.16.2026.09.11.07.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 07:10:01 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789135804; x=1789740604; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbVlQmHCpb9zv+5BDFsE+SK081jwlXFhk4tZhnaWY5k=;
        b=A64sqYAj5eJCh8MNrqfTSmnzXZ94RPaLaNqmw/GHjBKWr6M/coofjHOfJjqxABIqjk
         LH54PxejLJe4o1Cn6BrquGdp66c6veVD44MHuAEfQh2a0wRTs0vUNGIukYcPhbUYnW/t
         7eZx9aP5323p+HM4omnZ6UNPN4/n0N94FU3LPQEnzOG2YSJMblyz3m43jmEcV6SBNzmQ
         0kKDXVI2nLhKz6YqUgf0WUgT2jR93ZHlPJm+FCHq22Tu/4vRRShCYCJu4p9TwtlvVGYk
         voXBipe6gaiHXG0ru8XGk4WUfYYemPyUHRyE2XEkTBB+aVpTCuVO+BjjzsUbZ3dTNTOn
         vmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135804; x=1789740604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hbVlQmHCpb9zv+5BDFsE+SK081jwlXFhk4tZhnaWY5k=;
        b=T4bsTcYOWeQ0/VUX0tO70L/ldtM8Cp8+PFJ7P56v2F2XMtA6vSpu3F4el03oJ8a3xN
         ItTA7qwrGmtnVFKfSVy8qhoSQ2Hyt2ljwn6VtcqVOCXktVXg3jp9AM0AKGBfvVrSbLwH
         Sy8tpSIVtSHZ4ygiU/aGZdcoTVZxTmaGlL7VXVtnNl0CII3rGzO6xvrdo+pCw9P8f5V4
         btFrobxbq0St7i6MxOkldHM0hFJWX/uuRDXBxPQNZAv5I6ehva2x13BWkVW7cxb3vuqG
         8nFqJfAT7dLccdq7D1XCrr0mMpy5xGV98ki1xPoDa9csVg8Z53H4AXjIReryO7mEuW1v
         3AAw==
X-Forwarded-Encrypted: i=1; AKwUvByXdPIucLDZmol8dkVfoMPA7ulx8AnOeE+79SNsnS2s7tV9Lel4OB4evodPGC7LuIikQIk8cJINwzQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++lNPAI2Aur7Ee7d85kZdMr/ozWe2XWpn+jfj24ZoDa0aWv+m+bg
	B/0tr6NvH5HJOWSgM9ySe0OPHZsCivqedcZf53Z47x4rJTUFlzQKozqnw4vl/LPHL70=
X-Gm-Gg: AYBFou0KXEMh4KB4THapfWuuuBNow072wZWUktbdOt465KI+5k+P7uc0sG751xeog6T
	fOIax7BLy08WQshwiBX0LXQmPykeW7g8UsJKlEtbsENsMyazjarrL846GI4zH+BvKE+LKti0SHG
	igSG06Bw7FtNvgfZTekTXyLc1RotB+npKH4yGP4Nkj7TkjlbD4fd7ZT0QULc4VdRYs+O9Ui/jrq
	3AUG1x/FLxGtrrNelrCt1NlkLx1Bp/7qxugDdCuPCqg5MGnZJ3/7GY2DR+wbj3nPdRTqBogNCRo
	R28Q205hguOkM/zPQVYFONyMbXDQJZpPxxoQqCIewsFx2lMAzRFvrTq4dcyoQfEpYAyFYQ6L5TJ
	xXIVtp21MnyQaiuc2d1sszAn1/XSfKQz8Op2jNkUnhyt3HHq1RTpDPTJunvpK+kZ69wJcyIzX+T
	27Bo367HEnVG2cnWCCqNS7mF+YdDK2pA+lfNfmk3Pc53kFsC8zFr+8RyILzanQiiQd4WmqiF1M4
	jNsV1MsDGIMmmayjIb9I6yG8UqUbcfwuMrMmptoRNgW8Waq72hzcs0R
X-Received: by 2002:a05:620a:198d:b0:939:3a81:326 with SMTP id af79cd13be357-939ea18c166mr526461185a.37.1789135803738;
        Fri, 11 Sep 2026 07:10:03 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:45 +0000
Subject: [PATCH RFC v2 07/15] x86/kprobes: Maintain Tasks RCU trampoline
 nesting in the optprobe template
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-7-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135736; l=2636;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=8cFDFeD2IXPN8Vlj1EymtW9Bi32PSZwsbXS468MRSTs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QE88Fo4D8KnMZviii3UcxtNsSOWitctfeeqTUeKrfDl5ze3tUkJnL+Us2LrW6ea29znHZAO8PVa
 SQS9QIpNv5Ao=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-4011c0/1789135805-591C5CFC-1D276900/0/0
X-purgate-type: clean
X-purgate-size: 2638

The jump-optimized kprobe template calls optimized_callback() with
preemption still enabled for its first few instructions, so bracket the
call with an increment/decrement of current->rcu_tramp_nesting.  The
template lives in .rodata and is memcpy()d into each optinsn slot without
relocation processing, so the per-CPU reference to current_task must be
an absolute %gs: address (R_X86_64_32S, relocated for KASLR like any
other) rather than %rip-relative.  %rax has already been saved by
SAVE_REGS_STRING and is dead after the call.

The slot itself is dynamically allocated text, so the instructions before
the increment and after the decrement are covered by the irq-exit IP
check.  64-bit only; 32-bit x86 does not take part.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/kernel/kprobes/opt.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 3f8fea52619f..f722520bb989 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -31,6 +31,7 @@
 #include <asm/set_memory.h>
 #include <asm/sections.h>
 #include <asm/nospec-branch.h>
+#include <asm/asm-offsets.h>
 
 #include "common.h"
 
@@ -101,6 +102,23 @@ static void synthesize_set_arg1(kprobe_opcode_t *addr, unsigned long val)
 	*(unsigned long *)addr = val;
 }
 
+/*
+ * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().  The
+ * template is memcpy()d into the slot without relocation processing, so the
+ * per-CPU reference must be absolute, not %rip-relative.
+ */
+#if defined(CONFIG_TASKS_RCU) && defined(CONFIG_X86_64)
+#define OPTPROBE_RCU_TASKS_ENTER					\
+			"	movq %gs:current_task, %rax\n"		\
+			"	incl " __stringify(TASK_rcu_tramp_nesting) "(%rax)\n"
+#define OPTPROBE_RCU_TASKS_EXIT					\
+			"	movq %gs:current_task, %rax\n"		\
+			"	decl " __stringify(TASK_rcu_tramp_nesting) "(%rax)\n"
+#else
+#define OPTPROBE_RCU_TASKS_ENTER
+#define OPTPROBE_RCU_TASKS_EXIT
+#endif
+
 asm (
 			".pushsection .rodata\n"
 			".global optprobe_template_entry\n"
@@ -114,6 +132,7 @@ asm (
 			"optprobe_template_clac:\n"
 			ASM_NOP3
 			SAVE_REGS_STRING
+			OPTPROBE_RCU_TASKS_ENTER
 			"	movq %rsp, %rsi\n"
 			".global optprobe_template_val\n"
 			"optprobe_template_val:\n"
@@ -122,6 +141,7 @@ asm (
 			".global optprobe_template_call\n"
 			"optprobe_template_call:\n"
 			ASM_NOP5
+			OPTPROBE_RCU_TASKS_EXIT
 			/* Copy 'regs->flags' into 'regs->ss'. */
 			"	movq 18*8(%rsp), %rdx\n"
 			"	movq %rdx, 20*8(%rsp)\n"

-- 
2.55.0


