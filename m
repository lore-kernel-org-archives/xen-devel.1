Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DF5C982DA
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 14:50:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425496.1649426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7ZuW-0004kq-Eq; Fri, 18 Sep 2026 14:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425496.1649426; Fri, 18 Sep 2026 14:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7ZuW-0004kO-6q; Fri, 18 Sep 2026 14:49:56 +0000
Received: by outflank-mailman (input) for mailman id 1425496;
 Fri, 18 Sep 2026 14:49:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x7ZuU-0004gV-6t
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 14:49:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7ZuT-0054h4-K5
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 16:49:53 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aad4f85-8faa-0a2a0a5109dd-0a2a4506b4ba-32
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:49:53 +0200
Received: from [74.125.230.204] (helo=mail-qk2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aad4f90-195a-0a2a45060019-4a7de6ccdddf-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:49:53 +0200
Received: by mail-qk2-f12.google.com with SMTP id
 d75a77b69052e-530e28a62abso11097351cf.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 07:49:53 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-532a19a5ce3sm14843771cf.12.2026.09.18.07.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 07:49:51 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789742992; x=1790347792; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cjEABplA81VfGcXS6Z1Q3Y7Xt5Unb50ofxErtTl6HPY=;
        b=oVOsWb1uu7G1/KWzNdrb+K6tlGrWQQfJXrgP/yh5l7HBkpyVd5K/O0W7LG4A2zVmD5
         jPCDrwFeVmHVnoGrxyBzPwOZepOgalpNkxmfcOTskWTtjHmNLd5aORZbu0DcRbFa2g1h
         MN2MaQr17qXRQEegdLacnAhPf5RYBVKKbiLcGbstuAkcSFs9Iv2KXeeELZ2kJzukU9Ll
         25t5puE6paTM5fOVaqWkPs7mGQflFbsE4e2tc9OG8Myv14Kf64fzDqWGW6FbkjinefJd
         VJkZ46AkxKJ0A5HhaRrIpHpdhyFD2kEJ9CoteR0NBw63zCFGJrhiPguujwmsMxnDTgvA
         IcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742992; x=1790347792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjEABplA81VfGcXS6Z1Q3Y7Xt5Unb50ofxErtTl6HPY=;
        b=Hn9Xpqp+fOO6iIN0CbDhMUUiyVWdXgB0c7JX8/cv+kkV5WFF6qHxRoYKRUxY/xg6Hn
         oqq32/bineZCBkREKEgkR/RUxIP7FVo8u3imixrXuXyKvlFLpt+1M6aVcq+EnQDVbSoJ
         OK/PERJSrsppJIwVg/JemyqxfvcjiL8h35BZjOopJ9ot4NJWPL41+ZeoMypPpLgixbX8
         W9pYajxuyYGNDgdIMj0y0llMUqOm/EAvdm/PoFPAtLjaU58/GRzzpulb5Sdb4FKZ2aE+
         /ktOLPQaeomhrFOQEW2xuBxx2YGpbWfgqslwKJaQWdEldIuDFigLpoeOzCwfJM/+poCW
         bC/g==
X-Forwarded-Encrypted: i=1; AKwUvBwtNL74APxGkUbWKsVAIt+30mwlgY0FrxNgatz6BWWinCrGU8863RN4dsi7bKLLKf3AWBkqGvsgvVg=@lists.xenproject.org
X-Gm-Message-State: AFuF++lp+mMd47QFtRMqB/KnR1v53hHUZknEGzGPTu3vMawQpvibI1hP
	aWcqlj/O4TreKhzaFlLgX1al6oh4gJgaM5GtiNjjkx1rcM47esgiGbNZUPx73hjL6iE=
X-Gm-Gg: AYBFou1WpKgE7GqieRlmEibgKojboCbtgZypCKjHdEySKaS1KWnr0ZNGLblQtCdCb8B
	igVmgT3LXe/mOBAHxdJGI4trtczy58sJcJKt2YQUyiUxIhfON2mbELlZXg3oWbated68jWK8GJN
	t4Xiu9e3hXhwgsTI8/KCkInHv8sTSRUoGj4JM8FF1OCE5JPivkh0JqVJOp3005Xc2gT405BlRzN
	OJ9ECsxOjwtOyC8NRGLZMphkh7NoRGTGyAAbUNWWIPwMf77la+G9pW2jrsvznFul2EPKUSBchXE
	WRNu14gipFbVfoyRInXUaAT1KcdIjo23HMnizW8mWCjdTA4E32YXR6SwIhxZvHrgupLHSXAZehY
	aOM2Jtq6YPFJjaZwSYcqc2eWlrYym96VxuuSjmDmA9/zcqKjMKEo7irtpuo8qDrcBCfodYyZGcU
	Y3w2b6HmSAIwzBHDmekdcSsYhO12fCRm8scPnNBSmceJUjeU5ZgbURZTGsW9tyHsNs+0JaE2Z9W
	uN9JKjO9BxF1jogOfxNcUNdwAdBaNVoeqSzZgXw/YdY0a/qQFC/AcRvAg==
X-Received: by 2002:ac8:7f0d:0:b0:52f:9e5c:33ff with SMTP id d75a77b69052e-5329e3767d5mr46806381cf.13.1789742991795;
        Fri, 18 Sep 2026 07:49:51 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 18 Sep 2026 14:49:23 +0000
Subject: [PATCH RFC v4 04/13] ftrace: Mark modules hosting direct-call
 trampolines for Tasks RCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-b4-rcu-tasks-preempt-qs-v4-4-63f0e9d69661@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789742980; l=7065;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=WxuURWfyPfVrbwoJYzsme+dJrO0g2fOexfelnDzg3io=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOzJNf4EPWurTiDx3kIhXFyZwPBWmFPff1giOF5VzhAiMbXyfZ1cbtvqDh0lVG3P1j1LapzQR9r
 O/9+GtEnVpA0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-16d1c6/1789742993-F560A77B-3845039B/0/0
X-purgate-type: clean
X-purgate-size: 7067

An out-of-line direct trampoline registered with register_ftrace_direct()
is kept alive only by Tasks RCU while a task executes it or is preempted
in something it called; ftrace_shutdown()'s synchronize_rcu_tasks() is
what stops rmmod freeing it under such a task.  Where Tasks RCU is built
on reader-marked trampolines, such a trampoline must be a Tasks Trace
reader across its call-out like the ftrace and BPF trampolines are, so
document that in register_ftrace_direct().

That still leaves the few instructions before the reader is entered and
after it is left.  For BPF images those are in dynamically allocated
text that rcu_tasks_trampoline_text() already treats as unmarked
trampoline text, but the in-tree samples (and any similar user) place
their trampolines in module .text.  Add a sticky
module::ftrace_direct_tramp flag (under CONFIG_TASKS_RCU_TRAMPOLINE_READERS,
its only consumer), set by every register/modify path when the direct
address is module text, and have rcu_tasks_trampoline_text() treat a task
interrupted anywhere in such a module as a potential holdout.  Other
modules' text is unaffected.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/module.h |  7 +++++++
 kernel/rcu/tasks.h     | 18 +++++++++++++++---
 kernel/trace/ftrace.c  | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+), 3 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 96cc98568eea..82ca4f774725 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -521,6 +521,13 @@ struct module {
 	unsigned int num_ftrace_callsites;
 	unsigned long *ftrace_callsites;
 #endif
+#ifdef CONFIG_TASKS_RCU_TRAMPOLINE_READERS
+	/*
+	 * An ftrace direct-call trampoline lives in this module's text; see
+	 * rcu_tasks_trampoline_text().  Sticky once set.
+	 */
+	bool ftrace_direct_tramp;
+#endif
 #ifdef CONFIG_KPROBES
 	void *kprobes_text_start;
 	unsigned int kprobes_text_size;
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index eb1388dd8a61..42ea6e0e61cb 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1006,6 +1006,8 @@ bool __weak arch_rcu_tasks_trampoline_text(unsigned long ip)
  *    deliberately does not ask is_ftrace_trampoline() and friends, since
  *    text being torn down may already be unregistered there);
  *  - whatever the architecture adds via arch_rcu_tasks_trampoline_text();
+ *  - the text of a module that hosts an out-of-line ftrace direct-call
+ *    trampoline (see ftrace_direct_mark_module());
  *  - the bytes after a kprobe that a pending jump optimization is about to
  *    overwrite, the one synchronize_rcu_tasks() user with no trampoline.
  *
@@ -1014,12 +1016,22 @@ bool __weak arch_rcu_tasks_trampoline_text(unsigned long ip)
  */
 bool rcu_tasks_trampoline_text(unsigned long ip)
 {
+	bool ret = true;
+
 	if (core_kernel_text(ip))
 		return arch_rcu_tasks_trampoline_text(ip) ||
 		       kprobe_in_optimized_region(ip);
-	if (is_module_text_address(ip))
-		return kprobe_in_optimized_region(ip);
-	return true;
+
+#ifdef CONFIG_MODULES
+	scoped_guard(rcu) {
+		struct module *mod = __module_text_address(ip);
+
+		if (mod)
+			ret = READ_ONCE(mod->ftrace_direct_tramp) ||
+			      kprobe_in_optimized_region(ip);
+	}
+#endif
+	return ret;
 }
 NOKPROBE_SYMBOL(rcu_tasks_trampoline_text);
 
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 53d5db60bfa5..f69f71591358 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6076,6 +6076,29 @@ static void reset_direct(struct ftrace_ops *ops, unsigned long addr)
 	ops->trampoline = 0;
 }
 
+/*
+ * A direct trampoline may live in module text rather than in dynamically
+ * allocated text that rcu_tasks_trampoline_text() recognises on its own (see
+ * samples/ftrace/ftrace-direct*.c).  The trampoline itself must be a Tasks
+ * Trace reader across its call-out (see register_ftrace_direct()); marking the
+ * owning module here covers the instructions before it enters that reader and
+ * after it leaves it, where a task interrupted in the module's text must not be
+ * counted as Tasks-RCU quiescent, so that ftrace_shutdown()'s
+ * synchronize_rcu_tasks() still keeps the module text from being freed under
+ * it.
+ */
+static void ftrace_direct_mark_module(unsigned long addr)
+{
+#if defined(CONFIG_MODULES) && defined(CONFIG_TASKS_RCU_TRAMPOLINE_READERS)
+	struct module *mod;
+
+	guard(rcu)();
+	mod = __module_text_address(addr);
+	if (mod)
+		WRITE_ONCE(mod->ftrace_direct_tramp, true);
+#endif
+}
+
 /**
  * register_ftrace_direct - Call a custom trampoline directly
  * for multiple functions registered in @ops
@@ -6090,6 +6113,17 @@ static void reset_direct(struct ftrace_ops *ops, unsigned long addr)
  * and save the parameters of the function being traced, and restore them
  * (or inject new ones if needed), before returning.
  *
+ * Nothing but Tasks RCU keeps the trampoline at @addr alive while a task is
+ * executing it or is preempted in something it called.  On architectures that
+ * select HAVE_RCU_TRAMPOLINE_READERS, Tasks RCU only waits for such a task if
+ * it is a Tasks Trace RCU reader, so the trampoline must enter one
+ * (rcu_read_lock_trace() or an assembly equivalent) before calling out and
+ * leave it before returning, just as that option requires of the in-kernel
+ * ftrace and BPF trampolines.  The few instructions before and after are
+ * covered by the irq-exit check: automatically for trampolines outside kernel
+ * and module text (e.g. BPF images), and via ftrace_direct_mark_module() for
+ * trampolines in module text.
+ *
  * Returns:
  *  0 on success
  *  -EINVAL  - The @ops object was already registered with this call or
@@ -6169,6 +6203,7 @@ int register_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
 	ops->flags |= MULTI_FLAGS;
 	ops->trampoline = FTRACE_REGS_ADDR;
 	ops->direct_call = addr;
+	ftrace_direct_mark_module(addr);
 
 	err = register_ftrace_function_nolock(ops);
 	if (err)
@@ -6237,6 +6272,8 @@ __modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
 
 	lockdep_assert_held_once(&direct_mutex);
 
+	ftrace_direct_mark_module(addr);
+
 	/* Enable the tmp_ops to have the same functions as the direct ops */
 	ftrace_ops_init(&tmp_ops);
 	tmp_ops.func_hash = ops->func_hash;
@@ -6419,6 +6456,7 @@ int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
 		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
 			if (__ftrace_lookup_ip(direct_functions, entry->ip))
 				goto out_unlock;
+			ftrace_direct_mark_module(entry->direct);
 		}
 	}
 
@@ -6702,6 +6740,7 @@ int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, b
 			tmp = __ftrace_lookup_ip(direct_hash, entry->ip);
 			if (!tmp)
 				continue;
+			ftrace_direct_mark_module(entry->direct);
 			tmp->direct = entry->direct;
 		}
 	}

-- 
2.55.0


