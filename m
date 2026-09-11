Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2516C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:10:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416879.1645864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51xQ-00016P-NP; Fri, 11 Sep 2026 14:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416879.1645864; Fri, 11 Sep 2026 14:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51xQ-00015f-J0; Fri, 11 Sep 2026 14:10:24 +0000
Received: by outflank-mailman (input) for mailman id 1416879;
 Fri, 11 Sep 2026 14:10:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x51xO-0000wU-SD
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:10:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51xO-00E9jx-9A
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:10:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40bc8-2eae-0a2a0a5409dd-0a2a4508aad8-24
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:10:22 +0200
Received: from [209.85.160.173] (helo=mail-qt1-f173.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40bcd-f659-0a2a45080019-d155a0add494-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:10:22 +0200
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-530d93a18ecso6610011cf.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 07:10:21 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-530e0aaddbdsm2707391cf.2.2026.09.11.07.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 07:10:17 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789135820; x=1789740620; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=32pR0m9lJbbl6oefWflQ2FM2YWt9ii7Ub9HEHMaojiA=;
        b=apA+io3LP4tTkE0/8idyRY/CsZPEM+gLWLMt90L/dcCJoY6mQvcXHcB1ICQ/9nSZy6
         //bHjKBqnmJesfpChZyz1IWKPokPH0yAJ0xlKxeACz8V9Vu15Mu0UufXqFBblFCAywtQ
         iBND8BNzcajrX+hyIOEWAGDQ1rFKnaOwxOcrP8jJhlbU47lD8jjJRbOvI3g75ilCX9ub
         ssf2Cbm4m1lFQVcadpLLy5CR2ZhIIVIaX6vmucbKYoewtCW+xMS2xm/xqxYvplyLxhy6
         1Rhf3HJ/3eaEEDzUWIQT1AsmbsZiU2zwZeAW63Sd50+Ahgt30a03y4XLIugjHjH5q1PF
         PKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135820; x=1789740620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32pR0m9lJbbl6oefWflQ2FM2YWt9ii7Ub9HEHMaojiA=;
        b=cBiByLKaUw7hWPSjtdXU+TJIrq3p7a9gfI8OB4eTIb/ZfrBmy+Ndj4zXU4Z2SPHnOg
         pbqjm5GWh5/paUAhaloTNxmmHbUFgJgXvL6yRBWhUe3U8lquwMsxBKWVPZAh6CV8PEud
         kVnkmrn4g/gQVagsZ6DMSN0Q5U7NZvbT2FdPEASlIerhPaKOXU2wyWaVMWCZNTKzXOMx
         ZpsiYOmoA7iYjuSQqb8Xbv9nd/sr03mNruhTuOyyQyuWheKwwSDTt9c68PR6ftxisgpg
         mwieakoS6lA7ikrRiuiqsfvtTKfyh3JgB6TlY9OAcdfkEpqlW5zxH6hN8smb4EBBXm7H
         KLjA==
X-Forwarded-Encrypted: i=1; AKwUvBynjaFeEqNZ8GWOfA04S0himKxpAiKDFvy8KoPZHxbyVYWpQlu7kquxNOpJqz8lcTP/i/fVeIk0mUA=@lists.xenproject.org
X-Gm-Message-State: AFuF++nieLA8Jo5HPuIpEc8HPYCfK/3nhHqDPqttKcQQ5R++2yTeVnD0
	Ymah6iyWDOo8e7bBnIfIzp3QFgVLzKQMrHrD5xjSO6yBF1VkWaBsTtZp1nh2g3AJ+Lo=
X-Gm-Gg: AYBFou3UZE1dbhw4Z/ME4B/0d3WfwdMM+RYhWPDmjVVoqGKnEDDuvyLVIEhTq033L6j
	R5Bdy+9waxdYcMz6pMQM8ZFLS6qxZdD3Z4eVbZeVogMbb/QR03AFMo04A61q2w2pWBHj5++VvvM
	ONCHajPgofqqZ6enh+nTqMg+73WhnGVzt0NpT8fBp8fFko8iQaFVxNYrZJo6P5s7eSBWwMaskTg
	yNM3MkkkMk6qZOkhfB06qmmJHRwo/dcEsn1Nxo6yshB+GSuDoyWeGYk4JU432tMxbypYHNv82SL
	02dn9DqoRZcRXnoZYZnMY9ORrDSGwW8NWdFXoXxxW9L1KZsDjw+WwPS91n/15j7+1p7h2F+zseG
	K0F+/8TVkEcWXFFXX4k6qfGqROHreEpD9M3Lb6nYMJ8RD7tiSiYwpb7pXY4oLnTrVwE2V4xq9Mp
	I7/UzuCEv42R4bCNIWpqJFY+0RwKVrQ0S+wCyOXzc3Hit3fihIuml3vSyCA1gYFAOOpnmedIaGt
	4KFDWbynX+Jdr1UU8rR7rc9yJv9OLCAIKWvAaitxosFj5C1aV6lHi0AIGjm226dLJQ=
X-Received: by 2002:a05:622a:4114:b0:530:da2a:757 with SMTP id d75a77b69052e-530da2a1198mr24113211cf.33.1789135818762;
        Fri, 11 Sep 2026 07:10:18 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:49 +0000
Subject: [PATCH RFC v2 11/15] samples: ftrace: Maintain Tasks RCU
 trampoline nesting in direct-call trampolines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-11-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135737; l=10811;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=hPcqGdFxo+b+ijS7jNB+8GMowmEDvopzKnpNmpphVrY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKhN0qkThHUh5I4+Grit8p3XEg0LAgV/aMtyHMka/HOmaDw0JgyPUhuISBQoEJ4d9x0FD6DquBp
 sygcZlr+QrA8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c1860d/1789135822-D654487B-7C342C75/0/0
X-purgate-type: clean
X-purgate-size: 10813

Follow the register_ftrace_direct() contract in the sample modules: on
x86-64 and arm64, have each hand-written trampoline increment
current->rcu_tramp_nesting before calling its C handler and decrement it
before returning, via a small shared samples/ftrace/ftrace-direct.h.
%r11 and x12/w13 are used as scratch; both are caller-saved, non-argument
registers and therefore dead on entry to and exit from an fentry
trampoline.

The header pulls in the generated asm-offsets.h only on those two
architectures, since it is not generally safe to include from C (PPC32's
TASK_SIZE and arm64's TRAMP_VALIAS clash with the C definitions; the
latter is worked around locally with push_macro/pop_macro).  Other
architectures get empty macros and are unchanged.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 samples/ftrace/ftrace-direct-modify.c       |  9 ++++
 samples/ftrace/ftrace-direct-multi-modify.c |  9 ++++
 samples/ftrace/ftrace-direct-multi.c        |  5 +++
 samples/ftrace/ftrace-direct-too.c          |  5 +++
 samples/ftrace/ftrace-direct.c              |  5 +++
 samples/ftrace/ftrace-direct.h              | 64 +++++++++++++++++++++++++++++
 6 files changed, 97 insertions(+)

diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrace-direct-modify.c
index 164d9dd6fd92..eb8230fa4242 100644
--- a/samples/ftrace/ftrace-direct-modify.c
+++ b/samples/ftrace/ftrace-direct-modify.c
@@ -2,6 +2,7 @@
 #include <linux/module.h>
 #include <linux/kthread.h>
 #include <linux/ftrace.h>
+#include "ftrace-direct.h"
 #if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
@@ -73,7 +74,9 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	RCU_TASKS_TRAMP_ENTER
 "	call my_direct_func1\n"
+	RCU_TASKS_TRAMP_EXIT
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp1, .-my_tramp1\n"
@@ -85,7 +88,9 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	RCU_TASKS_TRAMP_ENTER
 "	call my_direct_func2\n"
+	RCU_TASKS_TRAMP_EXIT
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp2, .-my_tramp2\n"
@@ -141,11 +146,13 @@ asm (
 "	.globl		my_tramp1\n"
 "   my_tramp1:"
 "	hint	34\n" // bti	c
+	RCU_TASKS_TRAMP_ENTER
 "	sub	sp, sp, #16\n"
 "	stp	x9, x30, [sp]\n"
 "	bl	my_direct_func1\n"
 "	ldp	x30, x9, [sp]\n"
 "	add	sp, sp, #16\n"
+	RCU_TASKS_TRAMP_EXIT
 "	ret	x9\n"
 "	.size		my_tramp1, .-my_tramp1\n"
 
@@ -153,11 +160,13 @@ asm (
 "	.globl		my_tramp2\n"
 "   my_tramp2:"
 "	hint	34\n" // bti	c
+	RCU_TASKS_TRAMP_ENTER
 "	sub	sp, sp, #16\n"
 "	stp	x9, x30, [sp]\n"
 "	bl	my_direct_func2\n"
 "	ldp	x30, x9, [sp]\n"
 "	add	sp, sp, #16\n"
+	RCU_TASKS_TRAMP_EXIT
 "	ret	x9\n"
 "	.size		my_tramp2, .-my_tramp2\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct-multi-modify.c b/samples/ftrace/ftrace-direct-multi-modify.c
index b03766c6217b..c8f1062e5d1a 100644
--- a/samples/ftrace/ftrace-direct-multi-modify.c
+++ b/samples/ftrace/ftrace-direct-multi-modify.c
@@ -2,6 +2,7 @@
 #include <linux/module.h>
 #include <linux/kthread.h>
 #include <linux/ftrace.h>
+#include "ftrace-direct.h"
 #if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
@@ -77,10 +78,12 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	RCU_TASKS_TRAMP_ENTER
 "	pushq %rdi\n"
 "	movq 8(%rbp), %rdi\n"
 "	call my_direct_func1\n"
 "	popq %rdi\n"
+	RCU_TASKS_TRAMP_EXIT
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp1, .-my_tramp1\n"
@@ -92,10 +95,12 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	RCU_TASKS_TRAMP_ENTER
 "	pushq %rdi\n"
 "	movq 8(%rbp), %rdi\n"
 "	call my_direct_func2\n"
 "	popq %rdi\n"
+	RCU_TASKS_TRAMP_EXIT
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp2, .-my_tramp2\n"
@@ -154,6 +159,7 @@ asm (
 "	.globl		my_tramp1\n"
 "   my_tramp1:"
 "	hint	34\n" // bti	c
+	RCU_TASKS_TRAMP_ENTER
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -162,6 +168,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	RCU_TASKS_TRAMP_EXIT
 "	ret	x9\n"
 "	.size		my_tramp1, .-my_tramp1\n"
 
@@ -169,6 +176,7 @@ asm (
 "	.globl		my_tramp2\n"
 "   my_tramp2:"
 "	hint	34\n" // bti	c
+	RCU_TASKS_TRAMP_ENTER
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -177,6 +185,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	RCU_TASKS_TRAMP_EXIT
 "	ret	x9\n"
 "	.size		my_tramp2, .-my_tramp2\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct-multi.c b/samples/ftrace/ftrace-direct-multi.c
index 3fe6ddaf0b69..bc6a88dd4ffc 100644
--- a/samples/ftrace/ftrace-direct-multi.c
+++ b/samples/ftrace/ftrace-direct-multi.c
@@ -3,6 +3,7 @@
 
 #include <linux/mm.h> /* for handle_mm_fault() */
 #include <linux/ftrace.h>
+#include "ftrace-direct.h"
 #include <linux/sched/stat.h>
 #if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
@@ -56,10 +57,12 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	RCU_TASKS_TRAMP_ENTER
 "	pushq %rdi\n"
 "	movq 8(%rbp), %rdi\n"
 "	call my_direct_func\n"
 "	popq %rdi\n"
+	RCU_TASKS_TRAMP_EXIT
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp, .-my_tramp\n"
@@ -101,6 +104,7 @@ asm (
 "	.globl		my_tramp\n"
 "   my_tramp:"
 "	hint	34\n" // bti	c
+	RCU_TASKS_TRAMP_ENTER
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -109,6 +113,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	RCU_TASKS_TRAMP_EXIT
 "	ret	x9\n"
 "	.size		my_tramp, .-my_tramp\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct-too.c b/samples/ftrace/ftrace-direct-too.c
index bf2411aa6fd7..247e418644a2 100644
--- a/samples/ftrace/ftrace-direct-too.c
+++ b/samples/ftrace/ftrace-direct-too.c
@@ -3,6 +3,7 @@
 
 #include <linux/mm.h> /* for handle_mm_fault() */
 #include <linux/ftrace.h>
+#include "ftrace-direct.h"
 #if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
@@ -61,6 +62,7 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	RCU_TASKS_TRAMP_ENTER
 "	pushq %rdi\n"
 "	pushq %rsi\n"
 "	pushq %rdx\n"
@@ -70,6 +72,7 @@ asm (
 "	popq %rdx\n"
 "	popq %rsi\n"
 "	popq %rdi\n"
+	RCU_TASKS_TRAMP_EXIT
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp, .-my_tramp\n"
@@ -110,6 +113,7 @@ asm (
 "	.globl		my_tramp\n"
 "   my_tramp:"
 "	hint	34\n" // bti	c
+	RCU_TASKS_TRAMP_ENTER
 "	sub	sp, sp, #48\n"
 "	stp	x9, x30, [sp]\n"
 "	stp	x0, x1, [sp, #16]\n"
@@ -119,6 +123,7 @@ asm (
 "	ldp	x0, x1, [sp, #16]\n"
 "	ldp	x2, x3, [sp, #32]\n"
 "	add	sp, sp, #48\n"
+	RCU_TASKS_TRAMP_EXIT
 "	ret	x9\n"
 "	.size		my_tramp, .-my_tramp\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direct.c
index 5368c8c39cbb..9e1964baf28b 100644
--- a/samples/ftrace/ftrace-direct.c
+++ b/samples/ftrace/ftrace-direct.c
@@ -3,6 +3,7 @@
 
 #include <linux/sched.h> /* for wake_up_process() */
 #include <linux/ftrace.h>
+#include "ftrace-direct.h"
 #if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
@@ -54,9 +55,11 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	RCU_TASKS_TRAMP_ENTER
 "	pushq %rdi\n"
 "	call my_direct_func\n"
 "	popq %rdi\n"
+	RCU_TASKS_TRAMP_EXIT
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp, .-my_tramp\n"
@@ -97,6 +100,7 @@ asm (
 "	.globl		my_tramp\n"
 "   my_tramp:"
 "	hint	34\n" // bti	c
+	RCU_TASKS_TRAMP_ENTER
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -104,6 +108,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	RCU_TASKS_TRAMP_EXIT
 "	ret	x9\n"
 "	.size		my_tramp, .-my_tramp\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct.h b/samples/ftrace/ftrace-direct.h
new file mode 100644
index 000000000000..d0313f33f47f
--- /dev/null
+++ b/samples/ftrace/ftrace-direct.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _SAMPLES_FTRACE_DIRECT_H
+#define _SAMPLES_FTRACE_DIRECT_H
+
+#include <linux/stringify.h>
+
+/*
+ * A direct-call trampoline is entered with no lock, refcount or RCU marker
+ * held; only Tasks RCU keeps it (and, for a module, its text) alive while a
+ * task is inside it or preempted in something it called.  On architectures
+ * that select ARCH_HAS_RCU_TASKS_PREEMPT_QS a preemption is a Tasks RCU
+ * quiescent state unless current->rcu_tramp_nesting is non-zero, so the
+ * trampoline must raise it before calling out and drop it afterwards, exactly
+ * like the ftrace and BPF trampolines do.  See rcu_tasks_trampoline_enter()
+ * and register_ftrace_direct().  The instructions before the increment and
+ * after the decrement are covered by ftrace_direct_mark_module().
+ *
+ * These expand to instruction strings for use inside the samples' asm()
+ * trampolines.  The scratch register is caller-saved and not an argument
+ * register, so it is dead on entry to and exit from an fentry trampoline.
+ *
+ * The generated asm-offsets.h is only pulled in on the architectures that need
+ * it here: it is not generally safe to include from C (e.g. PPC32's TASK_SIZE
+ * and arm64's TRAMP_VALIAS clash with the C definitions), which is why the
+ * samples themselves guard their own include of it.
+ */
+#if defined(CONFIG_TASKS_RCU) && defined(CONFIG_X86_64)
+
+#include <asm/asm-offsets.h>
+
+#define RCU_TASKS_TRAMP_ENTER						\
+	"	movq %gs:current_task(%rip), %r11\n"				\
+	"	incl " __stringify(TASK_rcu_tramp_nesting) "(%r11)\n"
+#define RCU_TASKS_TRAMP_EXIT						\
+	"	movq %gs:current_task(%rip), %r11\n"				\
+	"	decl " __stringify(TASK_rcu_tramp_nesting) "(%r11)\n"
+
+#elif defined(CONFIG_TASKS_RCU) && defined(CONFIG_ARM64)
+
+/* arm64's asm-offsets.h redefines TRAMP_VALIAS from <asm/fixmap.h>. */
+#pragma push_macro("TRAMP_VALIAS")
+#undef TRAMP_VALIAS
+#include <asm/asm-offsets.h>
+#pragma pop_macro("TRAMP_VALIAS")
+
+#define RCU_TASKS_TRAMP_ENTER						\
+	"	mrs	x12, sp_el0\n"						\
+	"	ldr	w13, [x12, #" __stringify(TSK_RCU_TRAMP_NESTING) "]\n"	\
+	"	add	w13, w13, #1\n"						\
+	"	str	w13, [x12, #" __stringify(TSK_RCU_TRAMP_NESTING) "]\n"
+#define RCU_TASKS_TRAMP_EXIT						\
+	"	mrs	x12, sp_el0\n"						\
+	"	ldr	w13, [x12, #" __stringify(TSK_RCU_TRAMP_NESTING) "]\n"	\
+	"	sub	w13, w13, #1\n"						\
+	"	str	w13, [x12, #" __stringify(TSK_RCU_TRAMP_NESTING) "]\n"
+
+#else
+
+#define RCU_TASKS_TRAMP_ENTER
+#define RCU_TASKS_TRAMP_EXIT
+
+#endif
+
+#endif /* _SAMPLES_FTRACE_DIRECT_H */

-- 
2.55.0


