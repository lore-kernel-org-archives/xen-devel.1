Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A8EC982DF
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 14:50:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425498.1649446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7ZuZ-0005Nx-1Y; Fri, 18 Sep 2026 14:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425498.1649446; Fri, 18 Sep 2026 14:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7ZuY-0005Nq-U9; Fri, 18 Sep 2026 14:49:58 +0000
Received: by outflank-mailman (input) for mailman id 1425498;
 Fri, 18 Sep 2026 14:49:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x7ZuX-00057Q-Lt
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 14:49:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7ZuX-0054h4-2d
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 16:49:57 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aad4f8b-8faa-0a2a0a5109dd-0a2a450bb8d4-18
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:49:57 +0200
Received: from [74.125.230.209] (helo=mail-qk2-f17.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aad4f94-b7e8-0a2a450b0019-4a7de6d1806a-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:49:56 +0200
Received: by mail-qk2-f17.google.com with SMTP id
 af79cd13be357-93910ca5aa7so73891185a.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 07:49:56 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9125808d8fcsm14099356d6.45.2026.09.18.07.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 07:49:54 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789742995; x=1790347795; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lDajmUPmaz8BTxhPEk6XaACKGtk0v9RwI05AN+Obys=;
        b=iu8PZYYhVy56tQ09y3Ij134WzEnOsZy5ohnNPTqGAxeyMYvujJZ8bzzrvtDXnXhrl1
         UrsS1mUjG8Wm+h1pfbNMYNDMtXwIoOHvotlrONC/YBSZnrsR7mWom4iOhPiJ8OVSqsjY
         v3wqM1yhnrnTj9cZ+y2YHwIUWMB5kbFjoSjpTV4n1+Hr/m+hgIgSe4eb017UPDu+x3CG
         o4ITiCkckYZR0hTmS9wjToy+s53S18N3yk5h/TbBS527Ng39Vv6Q7Yv0IWKn5/PEaQCE
         fUz9aiuiUQqPMlJgIpi5xA3lTdoHKfjOmJiEyEkotBZYrpmwbxDwXdOoCQROv/+qN1Ws
         CGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742995; x=1790347795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lDajmUPmaz8BTxhPEk6XaACKGtk0v9RwI05AN+Obys=;
        b=Ly+HXYxEFUtlRZ43Mxj0qQvsZn2O71B538bUGKUUp22si1Zyve6WJJhj7ci59Lm+Gl
         Plbr4xNwB0pWqSWN/X7kgvIVlqjvjYUQ6px3Vb6uQRUnZu+s4LYUr9Law0+jUTYjyMg8
         hPxegL3npF6r2CdWoW3AJKnO5JkrbfqVTo6FqynWn5W1+Bapl6JCR8uWQZ8JdJu+zVuJ
         wpasdoSStXVnx+3FtwrxC5WNlTRWtQK2tHxQzgW5+bdGeNV3uGHrJlbP9ApDAxwjnWec
         ORIR25Zvxxbm6cVIjkZRHYjewFkAxUfD7zBF69VmNwzcY6aHi2oWAYMW8/ZEUCsN9FsX
         68JA==
X-Forwarded-Encrypted: i=1; AKwUvBwm/wx7AGPZa3nnpTRg0abt4CUZ3P1lViWNGw8x67Ul8II39v5eHvm+a+EcJN55IGItsQ3nTDPJvsQ=@lists.xenproject.org
X-Gm-Message-State: AFuF++ksecH852WEL8ntEiQk6mOrw7VlwvgIvxcgXrL5Jx+q+295NrAd
	pWvFA9vPUcIEjcHEXUV9lWqIUOfXZNefesSDM7szPgBdtAtIPQBcJK0EIUGo1WdRxCM=
X-Gm-Gg: AYBFou03a+eZ5ofL4Y1CAsVd7IeKs/MKhSujSQyoGTtZe8+w4R5XrlcbNLLkskYdkCB
	ePwuU/EYRT9mkg7N8Jltmj6WHvWSc4m/pmFHxTmew3tkDtActpzTSRTygoDfNqTxSgY/OOSoD/P
	3O8f1ZRhpKBPHYVXFWIABAzhToxd6fELtj1uOoAjsT9wE4HVzYtUhO62ybPefuKxEV7s+s/VmqM
	qH9aI4X6eZr6J0HrX8ISaRn1q2SHYFR91lMW4QP1F+VWa6Lj5KbO3ONaN2jLyFLwBR6895uDzc/
	7q5a9zSQFCruB9TWRiSW/22YEwjHbJoI4Jc5D7PiEV5CRflVPD9f+jCbSCLd/PdqsZINi9G+f4X
	UytoYZWAM9mLlhXZRtfv8JYQfNBWNfOGyB7tcp2Z8DXwSffFMGB6q5xxQvsSeXsL4zhA0sgIdbM
	AlisOofnMiVU33+VuvH0V/3cvy5+R0nw+0XrlBeRXFEMNgLnSfUMB1D/LxusWtSVJiVpp5WeyGK
	iRFf6yi0j7yrz9nwot1wkNspWq5MyZv6RsVbfkIXhOqml+xrcUHLtjb
X-Received: by 2002:a05:620a:2591:b0:939:3626:558b with SMTP id af79cd13be357-93bdc6e9664mr386099885a.5.1789742995331;
        Fri, 18 Sep 2026 07:49:55 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 18 Sep 2026 14:49:25 +0000
Subject: [PATCH RFC v4 06/13] x86/kprobes: Take a Tasks Trace reader in the
 optprobe template
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-b4-rcu-tasks-preempt-qs-v4-6-63f0e9d69661@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789742980; l=3977;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=cyOEpv7E+99KbsYBQF12i4qmiz/SB2W5CJ1v6BiG3CI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEjEDkoMCTK8/SkEBNPAmAQa/DHNGXCcOq6l1exqCfOV/HOva5SRV+bPucef9uXdDcfTxk/sgpw
 4F0zavhp0AA0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-42698a/1789742997-A92CC9EA-AB086A2A/0/0
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


