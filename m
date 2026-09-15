Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897FEC88E7B
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 13:18:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421716.1647455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T31-00063Y-Ff; Tue, 15 Sep 2026 13:18:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421716.1647455; Tue, 15 Sep 2026 13:18:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T31-00063N-Ax; Tue, 15 Sep 2026 13:18:07 +0000
Received: by outflank-mailman (input) for mailman id 1421716;
 Tue, 15 Sep 2026 13:18:05 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x6T2z-0005lx-AI
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 13:18:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6T2y-00DQRf-ND
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 15:18:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa94586-e002-0a2a0a5209dd-0a2a4502d90c-8
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:18:04 +0200
Received: from [74.125.230.204] (helo=mail-qk2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa9458b-6ca4-0a2a45020019-4a7de6cccb07-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:18:04 +0200
Received: by mail-qk2-f12.google.com with SMTP id
 d75a77b69052e-52fb7692a57so36023731cf.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 06:18:04 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-530ca4899dasm125209321cf.12.2026.09.15.06.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 06:18:02 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789478283; x=1790083083; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lDajmUPmaz8BTxhPEk6XaACKGtk0v9RwI05AN+Obys=;
        b=HS3o7GwDZfuWn761isCadth/I8EGnjkKsjcmVm/g+TKD0AKN39MXDUiVedZ9j/pNgu
         JskMwQavgNjV2RO6WM2YdUlLcWNf0KoCQ87cJRaZJ+/lycQXU+xZ5J/QxCJV8aBQSqHo
         nlVqXREOrVdPqc8QC/9I8tMUdua1O6sxNMKkRNlxx2hzl9h2K/fcipAeuPllkLDxJOx7
         0pv6wcqPillhRf+LR7juPlPYX4ROoA4G4F2BFOGvWPeJrA4DzetXmiZ3Wdy0XuzVMJc6
         AlREzMNNfhHUJwt0rRZmAHUhsYtFGdAtG6IGKkLbPZjCqpntOPuOvzjTmdhWvug1lJzc
         29eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478283; x=1790083083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lDajmUPmaz8BTxhPEk6XaACKGtk0v9RwI05AN+Obys=;
        b=QphUjjOPK5E4VAqiQh+AfvQIPf0/opsdNa7/IbXQTGRM67w+BOuBjff1Se4u1JYgQx
         +IAdsww2DFuNJB5GhDvEDNdAH3eXeCNijP3wPfHJElEO1s0NR2plduIZAVX3ERu0atRq
         5i7aSK/1/zadqyNNtEIG0/woxZgmm09QCycq7N4pgyPCtg8/V0srDI/mD657yqG2ZRBg
         oQtjnO7PA0lsEPuC8ogdivHlVDdcg48KoAngHJTtvZPFykg2oGGP5mj+urgy9ZxE8Z8X
         gUcHQLcQ8ETGV5+V84szB4W9uLAvSBIlx20L1ohAPvP7wGSx1rvDZBDcJAjwmhISSxwb
         9lNw==
X-Forwarded-Encrypted: i=1; AKwUvBzkxz2VkaPdZB2PRJA8eDzKownQiMi4+EXeYaE/rtgY5TF12tFzPIdLlubupSaF6F3FN7ePNSruXb8=@lists.xenproject.org
X-Gm-Message-State: AFuF++lEgN6sGMzRlx/jGNfp+XjkKJq8TNA9hY38q2LQqDkwXF2PribM
	VhHseJQUu/vwlpM6MQFWihFBqJsAYQGHC/paFtTm2yJYbUrzAsnZsDN69TbF+tgeqK0=
X-Gm-Gg: AYBFou3Anq/cIpaJZya7VfsSyGWeIU37KzI0ATgp+jkEHWBULjPOPFBremuIuwvvUOz
	AuB3nMRMgospJJVhs0FwBabwQUubF9CXdWTSl1rKVWCUad1TyAvD+Y64h3ZRqVIJds3EgbsU4MD
	8MdVXWwVqpanhUxqTIhW06chRZPBWcL3O4v9nRJfsw9GIexFZygSlYFpRlPEAyA0OlHKVf+uePI
	LCiRObP1PO+gUSoG2vC+PEhr9cGwrsWcaEhY3tgI0kFyCLm0kiafKyrmsLOnpqqbuEdMomn8dHb
	D/lJzbewE52qZ4GNTxWPRrcASe8wl82cPbpbOBkA3L1yARFYlyj2p64vCddEgZmsso6ksbJDRNF
	g9w3ygnUueWIi1s/yozoOqpt5NYESOVcYH1CyNLUR5e4oD7OCwk5G0BEoruiDXMs6wELmEgLXAS
	66uGxvFleufIvL82iKx20VolKzUN1JAEThQ/NT40OZ6okL+XGPCxGONb9PmwYGyNkl57YhALEQ7
	PZXSqvm427JFkyeXQ3a9va7x6f6aU2ydA7zVuAx9nR+FMCqbWQK73mt
X-Received: by 2002:ac8:5882:0:b0:531:4d7:bbe1 with SMTP id d75a77b69052e-5310d0620aamr106343871cf.50.1789478282597;
        Tue, 15 Sep 2026 06:18:02 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 15 Sep 2026 13:17:35 +0000
Subject: [PATCH RFC v3 08/13] x86/kprobes: Take a Tasks Trace reader in the
 optprobe template
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rcu-tasks-preempt-qs-v3-8-0ad30c4c5ee7@toxicpanda.com>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com>
In-Reply-To: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789478262; l=3977;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=cyOEpv7E+99KbsYBQF12i4qmiz/SB2W5CJ1v6BiG3CI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPs7HUne0IzQlm9wRQkt109QqoRgFF/pfpz8lJ+9BcfBer6XnRW2+MjSGUTLZ6JFUaWA9Uyg01K
 Y4lSDYJOfogI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-720697/1789478284-F12A12AC-CECFB057/0/0
X-purgate-type: clean
X-purgate-size: 3979

The jump-optimized kprobe template calls optimized_callback() from a
dynamically allocated slot with preemption enabled, and only Tasks RCU
keeps that slot alive under a task preempted in the callback.  For
HAVE_RCU_TRAMPOLINE_READERS that means the template must be a Tasks
Trace reader across the call, so open-code rcu_read_lock_trace() and
rcu_read_unlock_trace() around it as ftrace_64.S does.  The template
lives in .rodata and is memcpy()d into each slot without relocation
processing, so the references to current_task and
rcu_tasks_trace_srcu_struct are absolute (R_X86_64_32S, relocated for
KASLR like any other) rather than %rip-relative.  %rax and %rcx have
already been saved by SAVE_REGS_STRING and are dead after the call.

The slot itself is dynamically allocated text, so the instructions
before the lock and after the unlock are covered by the irq-exit check.
64-bit only; 32-bit x86 does not take part.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/kernel/kprobes/opt.c | 44 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 3f8fea52619f..68a5de6cdabe 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -31,6 +31,7 @@
 #include <asm/set_memory.h>
 #include <asm/sections.h>
 #include <asm/nospec-branch.h>
+#include <asm/asm-offsets.h>
 
 #include "common.h"
 
@@ -101,6 +102,47 @@ static void synthesize_set_arg1(kprobe_opcode_t *addr, unsigned long val)
 	*(unsigned long *)addr = val;
 }
 
+/*
+ * Open-coded rcu_read_lock_trace() / rcu_read_unlock_trace() around the call
+ * to optimized_callback(), see CONFIG_HAVE_RCU_TRAMPOLINE_READERS and the
+ * equivalent macros in ftrace_64.S.  The template is memcpy()d into the slot
+ * without relocation processing, so memory references must be absolute
+ * rather than %rip-relative.  %rax and %rcx are free at both points.
+ */
+#ifdef CONFIG_TASKS_RCU_TRAMPOLINE_READERS
+#ifndef CONFIG_TASKS_TRACE_RCU_NO_MB
+#define OPTPROBE_TRACE_RCU_MB	"	lock addl $0, -4(%rsp)\n"
+#else
+#define OPTPROBE_TRACE_RCU_MB
+#endif
+#define OPTPROBE_TRACE_RCU_READ_LOCK						\
+		"	movq %gs:current_task, %rcx\n"				\
+		"	movl " __stringify(TASK_trc_reader_nesting) "(%rcx), %eax\n"	\
+		"	incl " __stringify(TASK_trc_reader_nesting) "(%rcx)\n"	\
+		"	testl %eax, %eax\n"						\
+		"	jnz 1f\n"							\
+		"	movq rcu_tasks_trace_srcu_struct+" __stringify(SRCU_srcu_ctrp) ", %rax\n" \
+		"	incq %gs:" __stringify(SRCU_CTR_srcu_locks) "(%rax)\n"		\
+		"	movq %rax, " __stringify(TASK_trc_reader_scp) "(%rcx)\n"	\
+		OPTPROBE_TRACE_RCU_MB						\
+		"1:\n"
+#define OPTPROBE_TRACE_RCU_READ_UNLOCK						\
+		"	movq %gs:current_task, %rcx\n"				\
+		"	movl " __stringify(TASK_trc_reader_nesting) "(%rcx), %eax\n"	\
+		"	subl $1, %eax\n"						\
+		"	jnz 2f\n"							\
+		"	movq " __stringify(TASK_trc_reader_scp) "(%rcx), %rax\n"	\
+		"	movl $0, " __stringify(TASK_trc_reader_nesting) "(%rcx)\n"	\
+		OPTPROBE_TRACE_RCU_MB						\
+		"	incq %gs:" __stringify(SRCU_CTR_srcu_unlocks) "(%rax)\n"	\
+		"	jmp 3f\n"							\
+		"2:	movl %eax, " __stringify(TASK_trc_reader_nesting) "(%rcx)\n"	\
+		"3:\n"
+#else
+#define OPTPROBE_TRACE_RCU_READ_LOCK
+#define OPTPROBE_TRACE_RCU_READ_UNLOCK
+#endif
+
 asm (
 			".pushsection .rodata\n"
 			".global optprobe_template_entry\n"
@@ -114,6 +156,7 @@ asm (
 			"optprobe_template_clac:\n"
 			ASM_NOP3
 			SAVE_REGS_STRING
+			OPTPROBE_TRACE_RCU_READ_LOCK
 			"	movq %rsp, %rsi\n"
 			".global optprobe_template_val\n"
 			"optprobe_template_val:\n"
@@ -122,6 +165,7 @@ asm (
 			".global optprobe_template_call\n"
 			"optprobe_template_call:\n"
 			ASM_NOP5
+			OPTPROBE_TRACE_RCU_READ_UNLOCK
 			/* Copy 'regs->flags' into 'regs->ss'. */
 			"	movq 18*8(%rsp), %rdx\n"
 			"	movq %rdx, 20*8(%rsp)\n"

-- 
2.55.0


