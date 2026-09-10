Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3017FC79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415156.1644696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jrZ-00063q-5M; Thu, 10 Sep 2026 18:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415156.1644696; Thu, 10 Sep 2026 18:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jrZ-00063h-19; Thu, 10 Sep 2026 18:51:09 +0000
Received: by outflank-mailman (input) for mailman id 1415156;
 Thu, 10 Sep 2026 18:51:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x4jrX-0005uX-PR
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 18:51:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4jrX-00BfN4-5j
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:51:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fc15-e002-0a2a0a5209dd-0a2a450cd430-16
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:51:07 +0200
Received: from [209.85.160.176] (helo=mail-qt1-f176.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fc19-f479-0a2a450c0019-d155a0b0d829-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:51:06 +0200
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-52de50e77ffso1049931cf.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:51:06 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-530ca47efa2sm216291cf.11.2026.09.10.11.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 11:51:04 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789066265; x=1789671065; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbVlQmHCpb9zv+5BDFsE+SK081jwlXFhk4tZhnaWY5k=;
        b=eAC6lVWZHl5D9Win+zVmKYJI7dkTccT2i5OXUlFLhS38FccSerR8CLEoFoRa70FFgK
         mYMBcZ+SDERtkY//x3PazflZ/mfTOb88zK/r0gcJHUz3wlsn/evx//FGyWswxw2oqmB0
         BhCbKohO91paAvYYlM8TudUGEnIAvZpVNDEWZlJjSbNtAzCDTc1RVY+ZA35AwHBW41ui
         AKmFe99X38O2ripXIasAkr3P1oCOc9I3c7bStL414zxoAkeoaBA+y59hp3vTonbimYWW
         QsLmwVeBFO1v0VWAj6hyfyM+bKqHq1CuN0FHlvOgfLKfPooxlCEmZPTATU6UUapvpaXU
         cimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066265; x=1789671065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hbVlQmHCpb9zv+5BDFsE+SK081jwlXFhk4tZhnaWY5k=;
        b=tNhbhUPItUitCjq5bu5hWOimXEK/C8cRYGQ01P+1qe1e0NH4nJhu1/LAmrDZPnOKUW
         VS+RDH0NeVvaTJxasQTYFThMpxa6uqS0GkLSFQYFxvSXZbPgCT+/ETu+0cDy/3QM8Mwo
         xeG10wAepCZ6h1Bk0XTIPMvJ30OrqSch2stmZUK4j1Qi8Koeuf1a1mK9Jp3V8bsO/CX5
         Ty4TTgPaWsaakcPy5I4K4/ZZum2fgTbSichjyBXzeax5t9EJEBg1Jc1VQQ8RgA2w0X22
         lozcKOk386oah1XPEF7btFsfauKF1oEQ4Zpa04EoPCs/71vYiVgrdJDtmR9wz0Nf1veF
         Hoqw==
X-Forwarded-Encrypted: i=1; AKwUvBxXLSuW3MTNrVttqTWa2YU082zPuuZ3PzmnRjM1afqR5/LilWKnbclclWXbEtE2MkgH85pBUxpc7ZY=@lists.xenproject.org
X-Gm-Message-State: AFuF++nTAVxGDkwBbkyqfCwVlSq3P9RDa4t/rC4ZtsmLEyRbKAxy3x+s
	qguCZv2IrGbslDHPqvEdbLDt9tjA918qvhGHat1b/nLJPJ/CtZTy2uawSESzr1DBJVc=
X-Gm-Gg: AYBFou0KN+5Sw1pi2mM1YvdDEXGN24hbhuJCPpP1zH7opUWiMt7EEzj0MOHlB5NwEZ3
	PJIwpvUhFaxM3QPtWTbTWjhqXJBBjt78bk5M8GBXZyF56FLJnehVbIyIYwwmPIPHZcP3tdkMGbc
	qiiXXjY2n45ao5NlFUAjcJEp+LZdtrqc7ePij9dnAtYskeTWI24YgTqb51l1UmOyumBmKZ96aHV
	1l7hVyNLw4T2pRx1VK4rxJrUYnwOEgQUrTtJWLvS/zx34yzf7DqoUYKdtjK4kq4v7HtV0kbnhOC
	vj5l7O/AIGO4iurZ4iyZsKvgnsmOZK+ykJc/IiPcfq1S35X9CuZkk3mKWoMPX+9QDQ1OE/GFn1x
	cImen90+wBoqdW9O69PUUH7Qs4b/e3KtTsD8fo5OTQXdzS88VnCYb1xa8mZv0NJbiGBn/TG+lfp
	UtV7Y+CVfPj1D8PcbjFaxONwPY8IBoGpv1Fbc/eS5moJZcffp/Ix/dQc9ohorgeyFVFApbGdgjz
	0O0UfZ3Qn6rRHN3kKRqA+xLZ8oQFjiK4nn1pMqa/aaSVV/JQCQEtQbq
X-Received: by 2002:a05:622a:1309:b0:530:42e4:effc with SMTP id d75a77b69052e-530c87566f0mr10949261cf.41.1789066264886;
        Thu, 10 Sep 2026 11:51:04 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:30 +0000
Subject: [PATCH RFC 07/13] x86/kprobes: Maintain Tasks RCU trampoline
 nesting in the optprobe template
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-7-d4469f4cc101@toxicpanda.com>
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
X-purgate-ID: tlsNG-d25034/1789066267-022C0A5B-FD6BC4CB/0/0
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


