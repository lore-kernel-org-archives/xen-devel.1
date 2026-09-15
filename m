Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D79C88E7F
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 13:18:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421723.1647499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T3A-0007bC-Lz; Tue, 15 Sep 2026 13:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421723.1647499; Tue, 15 Sep 2026 13:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T3A-0007aK-F2; Tue, 15 Sep 2026 13:18:16 +0000
Received: by outflank-mailman (input) for mailman id 1421723;
 Tue, 15 Sep 2026 13:18:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x6T38-00074x-Ah
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 13:18:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6T37-00EGI1-MW
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 15:18:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa94590-bab6-0a2a0a5309dd-0a2a450489ce-18
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:18:13 +0200
Received: from [74.125.227.12] (helo=mail-vs2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa94593-b57f-0a2a45040019-4a7de30cbd05-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:18:12 +0200
Received: by mail-vs2-f12.google.com with SMTP id
 71dfb90a1353d-5c67e512ee9so1127535e0c.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 06:18:12 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9120f4963fcsm120754396d6.33.2026.09.15.06.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 06:18:05 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789478291; x=1790083091; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nk/uI/WquaXkRgHHd/dzhScVzrCkrWpp6IlwsBXJcUg=;
        b=pXVsR5dYFAoWs1wwFqDGtidGpav0t5q/yeKDCAV9WIN+qdkniY3aaxSuXkio5z6Qro
         W/km9W3Ov9cMbAOgjNBrwBsYPIFCXRwaZyqNCAuEEEx5HnCAYAgXP+qt/g2meOi69+vp
         j482wcmBRmHONA/PuWfHX1vsbQHg8K6BR3Zbds4X6KPC2FLsrzH5NCHGSBLvpojW2XhO
         OV1lYwDH6o0xuZ2blu65SGNgef/plro+Lhixz2a9ouNL0lk2oOdzfaNXoIAi1dGcMKVl
         73SzzAaWZob6nGBVGtqAFm6Dv28sIgNJtL24hZ6bfYt7T9fMTpsia/svbhO/ay5QPfgl
         AOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478291; x=1790083091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nk/uI/WquaXkRgHHd/dzhScVzrCkrWpp6IlwsBXJcUg=;
        b=AR33XRIMOjYLwELvIyB1QwjfBr+NiweIyf0GV4sI4u6JalE6XdFpB33yRltQ9wWC8k
         ZbTfQWU/DwW/ixdeDIiTp/WzLlFsqdBE9xh1MoIW/uY2mYWUCFxN/DnDfxgXsy+kGt8v
         V1YN/eNBHL7/HwJUDdZ166e5vwmv/8vutfGktG4SHqZWJOl3ip7fz+Qrn6QuST9GUfh2
         KvurGIKw1J1EwnHiFDKOy59nRC6hhTxuPzBQtzYH4br09DMkwG/CkeC0KDGVKAHSGY9X
         ycecqt8RZxA3D4w/qrQ4ToI4SMMuwmTm91uXk6L12jLXVu668bAqWCSc1yhEW4nuPrMM
         0qGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOI8WngVSn9DzbHqkS74yf5ZvWrUdvldpuoti5yNX+z/PquKKfH1A7ZNFBEIEiiDbwJWbKickuYn4=@lists.xenproject.org
X-Gm-Message-State: AFuF++msoTIUyumgJw+wuVoRAPUIIpm+y5rxZuZSklAyYo/1xDnKtFXj
	9TCGY5RUaBcYHzIbv0xBBfANYFs6r0elwPafjhoEKrPrP2ZoJU8kaaepKHfyzlCZ9Dg=
X-Gm-Gg: AYBFou3H848TgoaaT8xWJCV5xHQCRqW89nehqolA759s/M25Pm/w8fSLSujpFcfKvqL
	iiffxkn79N/0MLpok/xEVV+yxF+kInsZKkshNS76rNnSGlUoYoVwXqFvYBMupf/I10iDDu8vSMQ
	+gAOJwA5K3iIyGBUguwmp2MWsKaZfMPYo+XkreWJON/IOBcXEBtj6Fq85vpoCcEmHP/FJ/AFVBC
	F729Qz6YJ7lgSJf2AnsKiWKCWHKpO+x4BhDwrQvJ0mo3MJcohuwV3iaMtncfJxVT7JJNVVzRkFB
	3zBk82trhEfhX3w3HNv8gq3wj6D1/zPSRsExqaDx/bjXF3hnute4CDFzlwxBg35aH/pP8benubw
	bqFXm2jhSEku0XEl/deq++Z35J3jlQNIwRcpZ+jttAnJOWBjOPhIhA14DPicfcVmM3YDu7OmgGV
	UMNCTHHvFF96JaYgEM/YO4E03lDaj9AtuTkUKQrghYvgYM6tBwAzP3EGTsKLerDM1LT02uVFllF
	0NX0MSIkJpUIg90NP7V3fSJ8f+/k2+r7boozTVfucQbcjp5+Wp7Gukw
X-Received: by 2002:a05:6122:547:b0:5c8:2ad8:1484 with SMTP id 71dfb90a1353d-5c981ad6d23mr8006048e0c.1.1789478286304;
        Tue, 15 Sep 2026 06:18:06 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 15 Sep 2026 13:17:37 +0000
Subject: [PATCH RFC v3 10/13] samples: ftrace: Make the direct-call
 trampolines Tasks Trace readers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rcu-tasks-preempt-qs-v3-10-0ad30c4c5ee7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789478262; l=13193;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=I7rYeQZ4spsxQVfaE2Sayb+dFXGxTZqIS2lZCUAJvtU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPOtf94yWU2d+WH5tRovPgYME0ctrPN2IFl8MP+VQNtbbXuFRpRyfsP4CCmH0G4Kr6G14TpI5yJ
 WZ3+go910yQc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ebf023/1789478292-506DAB50-3D18CE3C/0/0
X-purgate-type: clean
X-purgate-size: 13195

The sample direct trampolines are exactly the kind of out-of-line
register_ftrace_direct() user whose lifetime depends on Tasks RCU
waiting for a task inside them: nothing else stops rmmod while a task is
preempted in my_direct_func().  On HAVE_RCU_TRAMPOLINE_READERS
architectures that wait only covers Tasks Trace RCU readers, so give the
samples a small shared header with rcu_read_lock_trace() and
rcu_read_unlock_trace() open-coded as instruction strings for x86-64 and
arm64 -- the same sequences as ftrace_64.S and entry-ftrace.S, using
caller-saved non-argument scratch registers -- and bracket every
call-out with them.  The instructions outside the bracket are module
text, covered by ftrace_direct_mark_module().  Other architectures get
empty definitions.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 samples/ftrace/ftrace-direct-modify.c       |   9 ++
 samples/ftrace/ftrace-direct-multi-modify.c |   9 ++
 samples/ftrace/ftrace-direct-multi.c        |   5 ++
 samples/ftrace/ftrace-direct-too.c          |   5 ++
 samples/ftrace/ftrace-direct.c              |   5 ++
 samples/ftrace/ftrace-direct.h              | 126 ++++++++++++++++++++++++++++
 6 files changed, 159 insertions(+)

diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrace-direct-modify.c
index 164d9dd6fd92..937c8d8c2a1b 100644
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
+	TRACE_RCU_READ_LOCK
 "	call my_direct_func1\n"
+	TRACE_RCU_READ_UNLOCK
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp1, .-my_tramp1\n"
@@ -85,7 +88,9 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	TRACE_RCU_READ_LOCK
 "	call my_direct_func2\n"
+	TRACE_RCU_READ_UNLOCK
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp2, .-my_tramp2\n"
@@ -141,11 +146,13 @@ asm (
 "	.globl		my_tramp1\n"
 "   my_tramp1:"
 "	hint	34\n" // bti	c
+	TRACE_RCU_READ_LOCK
 "	sub	sp, sp, #16\n"
 "	stp	x9, x30, [sp]\n"
 "	bl	my_direct_func1\n"
 "	ldp	x30, x9, [sp]\n"
 "	add	sp, sp, #16\n"
+	TRACE_RCU_READ_UNLOCK
 "	ret	x9\n"
 "	.size		my_tramp1, .-my_tramp1\n"
 
@@ -153,11 +160,13 @@ asm (
 "	.globl		my_tramp2\n"
 "   my_tramp2:"
 "	hint	34\n" // bti	c
+	TRACE_RCU_READ_LOCK
 "	sub	sp, sp, #16\n"
 "	stp	x9, x30, [sp]\n"
 "	bl	my_direct_func2\n"
 "	ldp	x30, x9, [sp]\n"
 "	add	sp, sp, #16\n"
+	TRACE_RCU_READ_UNLOCK
 "	ret	x9\n"
 "	.size		my_tramp2, .-my_tramp2\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct-multi-modify.c b/samples/ftrace/ftrace-direct-multi-modify.c
index b03766c6217b..e12e5c8b83f0 100644
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
+	TRACE_RCU_READ_LOCK
 "	pushq %rdi\n"
 "	movq 8(%rbp), %rdi\n"
 "	call my_direct_func1\n"
 "	popq %rdi\n"
+	TRACE_RCU_READ_UNLOCK
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp1, .-my_tramp1\n"
@@ -92,10 +95,12 @@ asm (
 "	pushq %rbp\n"
 "	movq %rsp, %rbp\n"
 	CALL_DEPTH_ACCOUNT
+	TRACE_RCU_READ_LOCK
 "	pushq %rdi\n"
 "	movq 8(%rbp), %rdi\n"
 "	call my_direct_func2\n"
 "	popq %rdi\n"
+	TRACE_RCU_READ_UNLOCK
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp2, .-my_tramp2\n"
@@ -154,6 +159,7 @@ asm (
 "	.globl		my_tramp1\n"
 "   my_tramp1:"
 "	hint	34\n" // bti	c
+	TRACE_RCU_READ_LOCK
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -162,6 +168,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	TRACE_RCU_READ_UNLOCK
 "	ret	x9\n"
 "	.size		my_tramp1, .-my_tramp1\n"
 
@@ -169,6 +176,7 @@ asm (
 "	.globl		my_tramp2\n"
 "   my_tramp2:"
 "	hint	34\n" // bti	c
+	TRACE_RCU_READ_LOCK
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -177,6 +185,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	TRACE_RCU_READ_UNLOCK
 "	ret	x9\n"
 "	.size		my_tramp2, .-my_tramp2\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct-multi.c b/samples/ftrace/ftrace-direct-multi.c
index 3fe6ddaf0b69..a970464ed378 100644
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
+	TRACE_RCU_READ_LOCK
 "	pushq %rdi\n"
 "	movq 8(%rbp), %rdi\n"
 "	call my_direct_func\n"
 "	popq %rdi\n"
+	TRACE_RCU_READ_UNLOCK
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp, .-my_tramp\n"
@@ -101,6 +104,7 @@ asm (
 "	.globl		my_tramp\n"
 "   my_tramp:"
 "	hint	34\n" // bti	c
+	TRACE_RCU_READ_LOCK
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -109,6 +113,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	TRACE_RCU_READ_UNLOCK
 "	ret	x9\n"
 "	.size		my_tramp, .-my_tramp\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct-too.c b/samples/ftrace/ftrace-direct-too.c
index bf2411aa6fd7..abc098c2ab7a 100644
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
+	TRACE_RCU_READ_LOCK
 "	pushq %rdi\n"
 "	pushq %rsi\n"
 "	pushq %rdx\n"
@@ -70,6 +72,7 @@ asm (
 "	popq %rdx\n"
 "	popq %rsi\n"
 "	popq %rdi\n"
+	TRACE_RCU_READ_UNLOCK
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp, .-my_tramp\n"
@@ -110,6 +113,7 @@ asm (
 "	.globl		my_tramp\n"
 "   my_tramp:"
 "	hint	34\n" // bti	c
+	TRACE_RCU_READ_LOCK
 "	sub	sp, sp, #48\n"
 "	stp	x9, x30, [sp]\n"
 "	stp	x0, x1, [sp, #16]\n"
@@ -119,6 +123,7 @@ asm (
 "	ldp	x0, x1, [sp, #16]\n"
 "	ldp	x2, x3, [sp, #32]\n"
 "	add	sp, sp, #48\n"
+	TRACE_RCU_READ_UNLOCK
 "	ret	x9\n"
 "	.size		my_tramp, .-my_tramp\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direct.c
index 5368c8c39cbb..99b65ad2fccc 100644
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
+	TRACE_RCU_READ_LOCK
 "	pushq %rdi\n"
 "	call my_direct_func\n"
 "	popq %rdi\n"
+	TRACE_RCU_READ_UNLOCK
 "	leave\n"
 	ASM_RET
 "	.size		my_tramp, .-my_tramp\n"
@@ -97,6 +100,7 @@ asm (
 "	.globl		my_tramp\n"
 "   my_tramp:"
 "	hint	34\n" // bti	c
+	TRACE_RCU_READ_LOCK
 "	sub	sp, sp, #32\n"
 "	stp	x9, x30, [sp]\n"
 "	str	x0, [sp, #16]\n"
@@ -104,6 +108,7 @@ asm (
 "	ldp	x30, x9, [sp]\n"
 "	ldr	x0, [sp, #16]\n"
 "	add	sp, sp, #32\n"
+	TRACE_RCU_READ_UNLOCK
 "	ret	x9\n"
 "	.size		my_tramp, .-my_tramp\n"
 "	.popsection\n"
diff --git a/samples/ftrace/ftrace-direct.h b/samples/ftrace/ftrace-direct.h
new file mode 100644
index 000000000000..726f67048ff5
--- /dev/null
+++ b/samples/ftrace/ftrace-direct.h
@@ -0,0 +1,126 @@
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
+ * that select HAVE_RCU_TRAMPOLINE_READERS, Tasks RCU only waits for such a
+ * task while it is a Tasks Trace RCU reader, so the trampoline must enter one
+ * before calling out and leave it afterwards, exactly like the ftrace and BPF
+ * trampolines do.  See register_ftrace_direct().  The instructions before the
+ * lock and after the unlock are covered by ftrace_direct_mark_module().
+ *
+ * These are rcu_read_lock_trace() / rcu_read_unlock_trace() open-coded as
+ * instruction strings for use inside the samples' asm() trampolines, after
+ * the versions in arch/x86/kernel/ftrace_64.S and
+ * arch/arm64/kernel/entry-ftrace.S.  The scratch registers are caller-saved
+ * and not argument registers, so they are dead on entry to and exit from an
+ * fentry trampoline; the flags are clobbered.
+ *
+ * The generated asm-offsets.h is only pulled in on the architectures that need
+ * it here: it is not generally safe to include from C (e.g. PPC32's TASK_SIZE
+ * and arm64's TRAMP_VALIAS clash with the C definitions).
+ */
+#if defined(CONFIG_TASKS_RCU_TRAMPOLINE_READERS) && defined(CONFIG_X86_64)
+
+#include <asm/asm-offsets.h>
+
+#ifndef CONFIG_TASKS_TRACE_RCU_NO_MB
+#define TRACE_RCU_MB	"	lock addl $0, -4(%rsp)\n"
+#else
+#define TRACE_RCU_MB
+#endif
+
+#define TRACE_RCU_READ_LOCK							\
+	"	movq %gs:current_task(%rip), %r11\n"					\
+	"	movl " __stringify(TASK_trc_reader_nesting) "(%r11), %r10d\n"		\
+	"	incl " __stringify(TASK_trc_reader_nesting) "(%r11)\n"		\
+	"	testl %r10d, %r10d\n"							\
+	"	jnz 771f\n"								\
+	"	movq rcu_tasks_trace_srcu_struct+" __stringify(SRCU_srcu_ctrp) "(%rip), %r10\n" \
+	"	incq %gs:" __stringify(SRCU_CTR_srcu_locks) "(%r10)\n"			\
+	"	movq %r10, " __stringify(TASK_trc_reader_scp) "(%r11)\n"		\
+	TRACE_RCU_MB								\
+	"771:\n"
+
+#define TRACE_RCU_READ_UNLOCK							\
+	"	movq %gs:current_task(%rip), %r11\n"					\
+	"	movl " __stringify(TASK_trc_reader_nesting) "(%r11), %r10d\n"		\
+	"	subl $1, %r10d\n"							\
+	"	jnz 772f\n"								\
+	"	movq " __stringify(TASK_trc_reader_scp) "(%r11), %r10\n"		\
+	"	movl $0, " __stringify(TASK_trc_reader_nesting) "(%r11)\n"		\
+	TRACE_RCU_MB								\
+	"	incq %gs:" __stringify(SRCU_CTR_srcu_unlocks) "(%r10)\n"		\
+	"	jmp 773f\n"								\
+	"772:	movl %r10d, " __stringify(TASK_trc_reader_nesting) "(%r11)\n"	\
+	"773:\n"
+
+#elif defined(CONFIG_TASKS_RCU_TRAMPOLINE_READERS) && defined(CONFIG_ARM64)
+
+#include <asm/alternative-macros.h>
+#include <asm/cpucaps.h>
+/* arm64's asm-offsets.h redefines TRAMP_VALIAS from <asm/fixmap.h>. */
+#pragma push_macro("TRAMP_VALIAS")
+#undef TRAMP_VALIAS
+#include <asm/asm-offsets.h>
+#pragma pop_macro("TRAMP_VALIAS")
+
+#ifndef CONFIG_TASKS_TRACE_RCU_NO_MB
+#define TRACE_RCU_MB	"	dmb	ish\n"
+#else
+#define TRACE_RCU_MB
+#endif
+
+#define TRACE_RCU_SRCU_CTRP	"rcu_tasks_trace_srcu_struct+" __stringify(SRCU_SRCU_CTRP)
+
+/* x14 = this CPU's offset; then atomically increment the long at x14 + \areg */
+#define TRACE_RCU_PERCPU_INC(areg)						\
+	ALTERNATIVE("	mrs	x14, tpidr_el1\n", "	mrs	x14, tpidr_el2\n",		\
+		    ARM64_HAS_VIRT_HOST_EXTN)					\
+	"	add	x14, x14, " areg "\n"						\
+	"778:	ldxr	x15, [x14]\n"							\
+	"	add	x15, x15, #1\n"							\
+	"	stxr	w16, x15, [x14]\n"						\
+	"	cbnz	w16, 778b\n"
+
+#define TRACE_RCU_READ_LOCK							\
+	"	mrs	x12, sp_el0\n"							\
+	"	ldr	w13, [x12, #" __stringify(TSK_TRC_READER_NESTING) "]\n"	\
+	"	add	w14, w13, #1\n"							\
+	"	str	w14, [x12, #" __stringify(TSK_TRC_READER_NESTING) "]\n"	\
+	"	cbnz	w13, 771f\n"							\
+	"	adrp	x13, " TRACE_RCU_SRCU_CTRP "\n"					\
+	"	ldr	x13, [x13, #:lo12:" TRACE_RCU_SRCU_CTRP "]\n"			\
+	"	str	x13, [x12, #" __stringify(TSK_TRC_READER_SCP) "]\n"		\
+	"	add	x13, x13, #" __stringify(SRCU_CTR_SRCU_LOCKS) "\n"		\
+	TRACE_RCU_PERCPU_INC("x13")						\
+	TRACE_RCU_MB								\
+	"771:\n"
+
+#define TRACE_RCU_READ_UNLOCK							\
+	"	mrs	x12, sp_el0\n"							\
+	"	ldr	w13, [x12, #" __stringify(TSK_TRC_READER_NESTING) "]\n"	\
+	"	subs	w13, w13, #1\n"							\
+	"	b.ne	772f\n"								\
+	"	ldr	x13, [x12, #" __stringify(TSK_TRC_READER_SCP) "]\n"		\
+	"	str	wzr, [x12, #" __stringify(TSK_TRC_READER_NESTING) "]\n"	\
+	TRACE_RCU_MB								\
+	"	add	x13, x13, #" __stringify(SRCU_CTR_SRCU_UNLOCKS) "\n"		\
+	TRACE_RCU_PERCPU_INC("x13")						\
+	"	b	773f\n"								\
+	"772:	str	w13, [x12, #" __stringify(TSK_TRC_READER_NESTING) "]\n"	\
+	"773:\n"
+
+#else
+
+#define TRACE_RCU_READ_LOCK
+#define TRACE_RCU_READ_UNLOCK
+
+#endif
+
+#endif /* _SAMPLES_FTRACE_DIRECT_H */

-- 
2.55.0


