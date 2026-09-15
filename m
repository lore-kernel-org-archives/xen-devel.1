Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403FBC88E75
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 13:18:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421709.1647436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T2u-0005QW-P8; Tue, 15 Sep 2026 13:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421709.1647436; Tue, 15 Sep 2026 13:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T2u-0005QI-Kt; Tue, 15 Sep 2026 13:18:00 +0000
Received: by outflank-mailman (input) for mailman id 1421709;
 Tue, 15 Sep 2026 13:17:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x6T2t-0005NY-8s
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 13:17:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6T2s-00DQRf-Lp
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 15:17:58 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa94581-e002-0a2a0a5209dd-0a2a45099780-36
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:17:58 +0200
Received: from [74.125.230.140] (helo=mail-qv2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa94585-be1a-0a2a45090019-4a7de68ca160-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:17:58 +0200
Received: by mail-qv2-f12.google.com with SMTP id
 6a1803df08f44-90cdfc9b6eeso34079826d6.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 06:17:58 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9120f45a780sm120563676d6.10.2026.09.15.06.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 06:17:55 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789478277; x=1790083077; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2aqKzOffwJC2uJ3O0Ky+yGqpaXXawvJtULMY2mEOoI=;
        b=LXtDBQP/6dEP0Lzvw94Zy3SApKxl1v9IYOvwpA7VnJ1VS3CoNbZTr6HNJCvkfkuUJJ
         3Z0e7gV4mouR3AwZBTDMVY41b2qK2iu2SkiLxWKegxCzSHhPB04BaEm/kMqlB04DwEpG
         Hci7xMJ/MCjAfi77PpldnH906nfVov5UQbqt9tyQws/MqG7TXCSKQ8Hjft/gHV+TMAzb
         Q3Y1b7XeIuNHqOMzVsFRQ2G2TkbQYdhlbQLO1vKYx3HZ3eyByr9vY8MYvS2wvo3JrDPL
         4jFSSD0efqxLz8uSfScs/Wn8GdIKakZ1fBSEcXXaGYwgGavw3RApehCW7ipd6EIZDrQF
         i6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478277; x=1790083077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2aqKzOffwJC2uJ3O0Ky+yGqpaXXawvJtULMY2mEOoI=;
        b=0yvdNvpw7AufpRQ/N9JLEH9PGRtQrikytyo5AeciLToyHA1bqu/eWc60sAsProC9yk
         fYtJtpI5db0WAKGydA1Kqq7JxJLEaMdVGBCmbHt3QF5OFAyRa2te7oIzLh2pPbqjlHKl
         8tws7hdch15TIDpUnYhhT7lVmUB9JAw2LHPWMLHWBjJ9vRyjKJGbyn2I84abxFfZlH45
         fs+2qGyBC2zB1H/k2foJUoM38yga5ORqXnAP/DAHx/vWF2ddx6nG/9wu8ME50iGP9qB5
         FBuzV5++UE1xT7Vjmot/DoIhJdDvMffdK6QITKpt5Ckb7pyBSpoH7lQIc0UaYJSD4FCE
         jUIA==
X-Forwarded-Encrypted: i=1; AKwUvBxKDND3YEPTWDWDlK4aPB5uLjex1meR97oDtym1NXGqmG1Bu3rVyeSlzhOlm6VMj19zI+H6DdOcILk=@lists.xenproject.org
X-Gm-Message-State: AFuF++kC/6vq8vYRJbJ1O+WmM//LWVOaSlvZ+KVmMmnCkcBMgKo6C8TJ
	+zifRq/LlS4Nacw7IrWRxN2+P9PeipuaBDeapXfpPIu++dte348mMc07mQuoGtz6TZ4=
X-Gm-Gg: AYBFou1tqz8Z2TQCIlgVcsqS1MHz4tmeetVDACerFLY4qDCH7BrLB4B5jJ74n51JSoA
	k5IGamoqdyYdGZ4CPwKbQdnLHUJV5I9+pQqCiWCN/J+MoLAQ9ioDxdqA4qTkKwn7vC+Izj7iJRL
	+v4FqjnRCp+lmv3Ryad8RHDlWiXX5Wp2+vk8stVXgUSEiO1De2UxYfmxklkpukMTPztwno953PR
	qWBv32KrM01QFUYGLlQutyaIDmEn/jQ0Vjdt2ZcGTaC7fGCO0dwbzDhzGIcNxb7v961lkQxaYWw
	+sjoXJp8ARuvyeiUUATIQkwoMLAy5/RWf7up/hfnWOlRG5R3ZPERBetWZ2x4a7O+Tbiv0xCj3ku
	MM+Z+OvDja8n73bhsgDH0T039WTvyHK1Ocz2w+bSJ8LXDKg9MvyS8dbZwjpAP4DeVb4+ZhjEucm
	vhaHOnFBueCcCqit6BnYkZdH6lsdCRGM9A4tUZLQv93en3l9qunvjY99xZczVvQot1yY6qupZcQ
	rW7drtxbklBIAH/+q46FUfR9aHSsrMVHXTIGMife9ewxu14dbt2VGzhHIqA7w3pxG4=
X-Received: by 2002:a05:6214:4285:b0:90e:873f:112b with SMTP id 6a1803df08f44-9122e51912amr113387396d6.16.1789478276555;
        Tue, 15 Sep 2026 06:17:56 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 15 Sep 2026 13:17:32 +0000
Subject: [PATCH RFC v3 05/13] ftrace: Mark modules hosting direct-call
 trampolines for Tasks RCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rcu-tasks-preempt-qs-v3-5-0ad30c4c5ee7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789478262; l=7194;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Fqdt5J86rRS/oaPi1G1Rp34bXnNDaywOKyZCOJUFY5s=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFK/UccVcmZvo9+nJV8bUtDnpQLusVqacik5jCxxwwehteVs8AbBeSvZttSzdRt3+dA+Fv7F8p7
 qiOCn2ZKvEwc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-bad1c0/1789478278-3ACDF034-7F26B264/0/0
X-purgate-type: clean
X-purgate-size: 7196

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
module::ftrace_direct_tramp flag, set by every register/modify path when
the direct address is module text, and have rcu_tasks_trampoline_text()
treat a task interrupted anywhere in such a module as a potential
holdout.  Other modules' text is unaffected.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/module.h |  7 +++++++
 kernel/rcu/tasks.h     | 21 ++++++++++++++++++---
 kernel/trace/ftrace.c  | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 96cc98568eea..28488687cb01 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -521,6 +521,13 @@ struct module {
 	unsigned int num_ftrace_callsites;
 	unsigned long *ftrace_callsites;
 #endif
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
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
index 866768462850..ec54a27e47fa 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1007,6 +1007,8 @@ bool __weak arch_rcu_tasks_trampoline_text(unsigned long ip)
  *  - the .text..rcu_tramp section, C glue called directly from such
  *    trampolines before it has entered the reader;
  *  - whatever the architecture adds via arch_rcu_tasks_trampoline_text();
+ *  - the text of a module that hosts an out-of-line ftrace direct-call
+ *    trampoline (see ftrace_direct_mark_module());
  *  - the bytes after a kprobe that a pending jump optimization is about to
  *    overwrite, the one synchronize_rcu_tasks() user with no trampoline.
  *
@@ -1015,6 +1017,8 @@ bool __weak arch_rcu_tasks_trampoline_text(unsigned long ip)
  */
 bool rcu_tasks_trampoline_text(unsigned long ip)
 {
+	bool ret = true;
+
 	if (core_kernel_text(ip)) {
 		if (ip >= (unsigned long)__rcu_tramp_text_start &&
 		    ip <  (unsigned long)__rcu_tramp_text_end)
@@ -1022,9 +1026,20 @@ bool rcu_tasks_trampoline_text(unsigned long ip)
 		return arch_rcu_tasks_trampoline_text(ip) ||
 		       kprobe_in_optimized_region(ip);
 	}
-	if (is_module_text_address(ip))
-		return kprobe_in_optimized_region(ip);
-	return true;
+
+#ifdef CONFIG_MODULES
+	scoped_guard(rcu) {
+		struct module *mod = __module_text_address(ip);
+
+		if (mod) {
+			ret = kprobe_in_optimized_region(ip);
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+			ret = ret || READ_ONCE(mod->ftrace_direct_tramp);
+#endif
+		}
+	}
+#endif
+	return ret;
 }
 NOKPROBE_SYMBOL(rcu_tasks_trampoline_text);
 
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 53d5db60bfa5..efc4a518658a 100644
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
+#ifdef CONFIG_MODULES
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
+ * (rcu_read_lock_trace() or its assembly equivalent, see
+ * samples/ftrace/ftrace-direct.h) before calling out and leave it before
+ * returning, as the ftrace and BPF trampolines do.  The few instructions
+ * before and after are covered by the irq-exit check: automatically for
+ * trampolines outside kernel and module text (e.g. BPF images), and via
+ * ftrace_direct_mark_module() for trampolines in module text.
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


