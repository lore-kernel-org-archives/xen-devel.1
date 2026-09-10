Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72C7C79FBF
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415152.1644669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jrS-0005DS-7Q; Thu, 10 Sep 2026 18:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415152.1644669; Thu, 10 Sep 2026 18:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jrS-0005DJ-4I; Thu, 10 Sep 2026 18:51:02 +0000
Received: by outflank-mailman (input) for mailman id 1415152;
 Thu, 10 Sep 2026 18:51:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x4jrQ-0004zA-U2
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 18:51:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4jrQ-00BoS1-Am
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:51:00 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fbd5-e002-0a2a0a5209dd-0a2a4504b836-42
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:51:00 +0200
Received: from [209.85.222.174] (helo=mail-qk1-f174.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fc13-b57f-0a2a45040019-d155deaeec8c-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:51:00 +0200
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-92e85499ffbso1147785a.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:50:59 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939e807eba7sm47389685a.29.2026.09.10.11.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 11:50:57 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789066259; x=1789671059; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLCJ034DJzI4gEh3LNSHB0+4siN8J5WsqqEdRoq/eTA=;
        b=WxQ3hfhb6GZ0qAc8VKLjFNT/T/sLaymAqWoXJTyrD6ltoe3GbJmEnK2pM0FoIvS+gU
         ZRW/viscNX7K0Rbz2z7+P6YxJ7H1I4DhJzQcplGU78OG4K6eMSU+xMXqMvgYSSlh+0ss
         Oh6oYK7FLke6Uz7Md5gBfUxusrFrIa6i0foszxiwUTOHZClKVSRUbUvC1+d11u+i+y1i
         Hvjx+C2ZSPqan/NeTlspOSlTcpnkyoZumyjfM5PGJmaw5qi0gkj1vQOR00lOA6OuTvBQ
         dhK6BN9Qc3Wlchdc++1LlY1T5X49G3xbQiBdYdLphDwpbz1ASFamQd8Rw/G4TXFCD7bi
         zBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066259; x=1789671059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLCJ034DJzI4gEh3LNSHB0+4siN8J5WsqqEdRoq/eTA=;
        b=jfodkSJdE8UvQUn8BRqsotdbRVR8C6Rn/zJFmovxcNe9CvgttcYdQVJFU6/S5C9yHc
         5CFBFKRY4MbeaqomTBWpxr2AnHZvlXC8yJ+ik9vi09nx1sQcbXRDZCuvqqgpUmCEr9/R
         k5ahjXcj2MUN1KEuGxLJleulg6hV2ziFDhQL1jmnZOGD0CoQcAO771bLhRPknbEUG7LL
         AtnF6JrxLKLYbhk6rvxQiYyk3NOf+cVnkOgeq6En6TfizhdpRdmor7FDyonQND6aFqoe
         IOR4zb0t0c82u8MoUJWkYOz6hLxTTKO93GL6JM9uYSQw96chGhIaH36CJLYf9Z3QfR8C
         bwyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwAS451I2hV6DnFtesynT6nXWqhd4vcb9EB6NqbUuwt8REfcQVWiK2QliPqBwkS/QJ73EJZ8Usf1M=@lists.xenproject.org
X-Gm-Message-State: AFuF++k4w6w0ZNablti72nTbe6gctKtGanumT5Usx3x45/QW6OTw6Ezx
	gMCnAUMTWM9sGN8IZkJN3mwIdVOOfcrSmEIP0JevkK6RUaPTv1Lqtfzt33UEL8SG5SI=
X-Gm-Gg: AYBFou1nL2Jcdtykfa1RP/q3/NnkDrpC0ZwP9wUQT85bweHZFOTcEU31DBlTzwXWuHW
	hYQ76aR4kUavujGfFt7NuYZElWwMJIT3NY+bVNsmYTon3F6NBuDfn/rHX8vMWdvUf5JjxxLUElB
	tTQ874Yx9CdEvrtNVk7du9pKw9ckhefV7mj4ByZuyEBykvatwdh2Etqw96uDfchfrDEAyAEwxSp
	bXsRnu2vKoPOnmcAg2j91LyWE/yOH+/PfAdxFHL0cdyYycyDxRFAwzMu+vb6Z9KDZWds6lTZMJy
	0BjcVOQF6Dssf5jsv6MaZaIv/hq2NH6n+nsGXTTFgM4j0olnOivAQbOTDvyICPsOrYCI0k6eIJo
	OulpkmsI756lrSfftqCHlTL4V/JOaD6B6AN6dQIL8ta1IR3brR4yElcz7NtGHeA47uoICanz+22
	BgprT5rhvIVxXIUCLCTT8GEIOC/GE9gp1PaKhwrZUDTNOb1S6hIzDerd3K8YxpI1skTc+8XuvH4
	uDJuMf3xxjn26rHz7Gz1UXioF5A+9ctbBx66YJVk+PTVvh8wYz1o5Q/iB0gUbm0U3Q=
X-Received: by 2002:a05:620a:6191:b0:939:a6e4:2267 with SMTP id af79cd13be357-939ea2bff00mr14491685a.50.1789066258414;
        Thu, 10 Sep 2026 11:50:58 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:27 +0000
Subject: [PATCH RFC 04/13] kprobes: Let Tasks RCU recognise tasks preempted
 in an optprobe jump window
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-4-d4469f4cc101@toxicpanda.com>
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
X-purgate-ID: tlsNG-ebf023/1789066260-C20D5B50-279DC295/0/0
X-purgate-type: clean
X-purgate-size: 5160

kprobe_optimizer() is the one synchronize_rcu_tasks() user that is not
about trampoline text: it waits for tasks that were preempted on an
instruction boundary inside the bytes it is about to overwrite with the
optimized jump, so that none of them resumes into the middle of the new
instruction.  Such a task sits in ordinary kernel or module text with
rcu_tramp_nesting == 0, and can only have got there via an irq-exit
preemption.

Add kprobe_in_optimized_region(), a lockless and conservative form of
get_optimized_kprobe() that reports whether any registered kprobe lies
within MAX_OPTIMIZED_LENGTH before the given address regardless of its
optimization state, and have rcu_tasks_ip_in_trampoline() consult it so
that a task interrupted there keeps holding off the Tasks RCU grace
period once preemption becomes a quiescent state.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/kprobes.h  |  8 +++++++-
 include/linux/rcupdate.h |  4 +++-
 kernel/kprobes.c         | 24 ++++++++++++++++++++++++
 kernel/rcu/tasks.h       |  6 ++++++
 4 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
index e6de7ae55bda..74cc48c04417 100644
--- a/include/linux/kprobes.h
+++ b/include/linux/kprobes.h
@@ -530,11 +530,17 @@ static inline bool is_kprobe_insn_slot(unsigned long addr)
 }
 #endif /* !CONFIG_KPROBES */
 
-#ifndef CONFIG_OPTPROBES
+#ifdef CONFIG_OPTPROBES
+bool kprobe_in_optimized_region(unsigned long addr);
+#else /* !CONFIG_OPTPROBES */
 static inline bool is_kprobe_optinsn_slot(unsigned long addr)
 {
 	return false;
 }
+static inline bool kprobe_in_optimized_region(unsigned long addr)
+{
+	return false;
+}
 #endif /* !CONFIG_OPTPROBES */
 
 #ifdef CONFIG_KRETPROBES
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 0a408e36ea15..e9afbbb1b061 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -200,7 +200,9 @@ bool arch_rcu_tasks_ip_in_trampoline(unsigned long ip);
  * cannot be preempted synchronously, only from an interrupt, so the irq-exit
  * preemption path covers it by checking regs->ip with
  * rcu_tasks_ip_in_trampoline() and holding the count elevated across
- * preempt_schedule_irq() when it matches.
+ * preempt_schedule_irq() when it matches.  The same check covers the one
+ * non-trampoline user, kprobe jump optimization, which waits for tasks
+ * preempted inside the instruction bytes it is about to overwrite.
  *
  * Only current writes the count and only current (or an interrupt on the same
  * CPU) reads it, so plain accesses suffice.
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 6337da5cab9e..76f146edb0e5 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -511,6 +511,30 @@ static struct kprobe *get_optimized_kprobe(kprobe_opcode_t *addr)
 	return NULL;
 }
 
+/**
+ * kprobe_in_optimized_region - Could @addr be inside bytes a jump-optimized
+ *	kprobe replaces?
+ * @addr: kernel text address, typically an interrupted instruction pointer
+ *
+ * kprobe_optimizer() relies on synchronize_rcu_tasks() to wait for tasks that
+ * were preempted on an instruction boundary inside the region about to be
+ * overwritten by the optimized jump; such a task must not report a Tasks RCU
+ * quiescent state when it is preempted (see rcu_tasks_ip_in_trampoline()).
+ * This is the lockless, conservative form of get_optimized_kprobe(): it does
+ * not care whether the kprobe found is, or ever will be, optimized.  May be
+ * called from any context with preemption disabled.
+ */
+bool kprobe_in_optimized_region(unsigned long addr)
+{
+	int i;
+
+	for (i = 1; i < MAX_OPTIMIZED_LENGTH / sizeof(kprobe_opcode_t); i++)
+		if (get_kprobe((kprobe_opcode_t *)addr - i))
+			return true;
+	return false;
+}
+NOKPROBE_SYMBOL(kprobe_in_optimized_region);
+
 /* Optimization staging list, protected by 'kprobe_mutex' */
 static LIST_HEAD(optimizing_list);
 static LIST_HEAD(unoptimizing_list);
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index a801ec4a951b..a55dc2a20fb7 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1114,6 +1114,9 @@ bool __weak arch_rcu_tasks_ip_in_trampoline(unsigned long ip)
  *    deliberately does not consult is_ftrace_trampoline() and friends: text
  *    being torn down may already be unregistered there while a task still
  *    stands on it;
+ *  - inside the bytes following a registered kprobe that jump optimization
+ *    may overwrite, which kprobe_optimizer() protects with
+ *    synchronize_rcu_tasks();
  *  - in core text the architecture flags via arch_rcu_tasks_ip_in_trampoline().
  *
  * A false positive only defers the quiescent state to the task's next
@@ -1121,6 +1124,9 @@ bool __weak arch_rcu_tasks_ip_in_trampoline(unsigned long ip)
  */
 bool rcu_tasks_ip_in_trampoline(unsigned long ip)
 {
+	if (kprobe_in_optimized_region(ip))
+		return true;
+
 	if (core_kernel_text(ip))
 		return arch_rcu_tasks_ip_in_trampoline(ip);
 	return !is_module_text_address(ip);

-- 
2.55.0


