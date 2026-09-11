Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDF6C88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:10:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416889.1645891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51xW-0002N4-UN; Fri, 11 Sep 2026 14:10:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416889.1645891; Fri, 11 Sep 2026 14:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51xW-0002Mf-Ni; Fri, 11 Sep 2026 14:10:30 +0000
Received: by outflank-mailman (input) for mailman id 1416889;
 Fri, 11 Sep 2026 14:10:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x51xU-0001tQ-MJ
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:10:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51xU-00E9hv-1A
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:10:28 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40bd1-bab6-0a2a0a5309dd-0a2a4507eb58-18
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:10:27 +0200
Received: from [74.125.230.204] (helo=mail-qk2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40bd2-b4ea-0a2a45070019-4a7de6ccb1e8-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:10:27 +0200
Received: by mail-qk2-f12.google.com with SMTP id
 af79cd13be357-939109fafd7so84824085a.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 07:10:27 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939f19f94a1sm128350685a.42.2026.09.11.07.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 07:10:25 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789135826; x=1789740626; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDcwMwF0CqD/SLUwt7lLP/Zeny+NN6n073A4kvHv5Ng=;
        b=ldlwM9LknSW5s91+utQnw8haPcBkzUQwVCYpexSYpdysuyUoBhA5aNj/d//rNxFlrc
         Mtxs5kn4ka5ZAOoF6mSfrpumoQJs8wprgCu3vksS+XIucwlD9u8VdbG5ATXkiabgQm2n
         dC7aTB9IqleGO+iTBOWUZ1c4Tr12gVUM+P/2B7tGbEDIaBVZ4XNZjZrkNplTe4HcGBUE
         iWoIv9ERsUaDgEe/1bMWaBVQJv1AyObF5CFRqFou9C+EsuR4ozkS4rnXxnYkuEEwnyQM
         sGypcIDLHXHfRRLwheLQ/9oH2GZadTEUq+Vv9Xk4TPs0VFHGGCTxsz7pU4IjFLRaas8P
         zUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135826; x=1789740626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDcwMwF0CqD/SLUwt7lLP/Zeny+NN6n073A4kvHv5Ng=;
        b=OebYF1IHmeZZuCLDwsPfNL15/6PrdFPapIu89AXoY4VrP/p7pKkVfSxjTsKOvfjnqU
         xKDdqTXaEhypvCYEd2WeT1JFoRAAabuH0oJHk/yFvHIChRDKps57pOH0D2g1oCck2s/j
         9Yva2+h0RyVjijy0YtSZIXxULfyFcJf/h9IlpFAlCNDnr5tQtrxE7OtJxSZzIRjMljoq
         wBU9SsO+SWhw5KHFpMDFRoxcFChLdpFAOy112CR6XhTMzDA8AFG6s0PXzVc5biaGVw5g
         UYmKHH9Td1qjsRP8b7J3LGgbX7FUNqb5+Ihs/nrQpoUe1E01O82l4FTMXkhO6GRvP/tm
         coaA==
X-Forwarded-Encrypted: i=1; AKwUvBw69S/KWZfMYspSpUtP00XBzlmfqnleN0S5aH2/olS+ALvwM9RY6/tg8nXHQMriUWeGtUkK2nfx9fM=@lists.xenproject.org
X-Gm-Message-State: AFuF++mZihsd1UzXcYq6i3MPZ+4Fp3JB96FW4q0YDtlxBOafXOc0aNFx
	y4IAG4E6iq4s8D2mh1tYEOCMjm4/nATzS1lhFNfB7kmkYjH+HL9X3qb7aHv1VNE1yaI=
X-Gm-Gg: AYBFou0S/JTnbCJX8vjaqp7Z1bBlzbru4UZq3p35bWy2hWXjOXWiAkCjrFqLAIXIfTe
	htmjczC0gp/S4UgUtvzZhTZHib1rluelbFErDyLa7O+M308NuyMzZKdpj1GMbWTB70l5jHfqeJ0
	GfWvHNKCrR99p8cYCC3PecoAwLeOqMMbcr7MrnTO0esT4pXujYakjr7/+97mOEPD3m78R/xFx+X
	R7KcYV8iQ2CTyAmlssdyP3DIn5JLcLF5EJ2iwI9Wk1uFmc+ff7WYn72if43mx1rD0W4eBmTQd6a
	LTrLPprv0iNP5c9lCVb72RKLd3DRqyt+yzmT09rMUS359zP9cXWpAJVJKkL3kewtFnfDK8SjhM9
	lfdnXRubRkxgnSTD305zx+o6wUiDVGpxX4f6VCrJHTDaecZ0CTjjCI/iY/c5/ETAjTz69TyW+bv
	EKsxuRIId+p0shjBskJaEtoU9ehFCnsb7j4paXm58Dpt0OMsfjp5JO/EzOPMEHs7BUJP53uvEAH
	nlecEN8aYGPA3JImSXwq8gwwwMdLh/ALrqyPZ1Jlm709mh0LywPVlgz
X-Received: by 2002:a05:620a:2a01:b0:92e:6c15:24cd with SMTP id af79cd13be357-939ea096ac1mr525489385a.15.1789135826040;
        Fri, 11 Sep 2026 07:10:26 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:52 +0000
Subject: [PATCH RFC v2 14/15] rcu-tasks: Retire switched-out tasks with no
 trampoline nesting at scan time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-14-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135737; l=3915;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=CHfEJf4XyY3zn8RyomjOM2Uc3mVFT7MUycrwjg2RabY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCsPahyd7Oix02uJZsqv3hNKRWBYJbR9ZWsmEzIdYJha+M3Xp7J5xDeZFd/3etSxBmrSG0gewnR
 pnh9QNzgnXwY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ef75cf/1789135827-37CD7AE4-0D596C34/0/0
X-purgate-type: clean
X-purgate-size: 3917

The previous patch lets a task report its own quiescent state when it is
preempted with rcu_tramp_nesting == 0, but a task that was preempted
before the grace period started and simply has not run since is still
listed as a holdout until it next passes through __schedule().  As Paul
pointed out, the grace-period kthread can settle that case itself.

For a task that is switched out, task_call_func() pins it and
!task_curr() tells us it left the CPU through __schedule(), whose
locking orders its last rcu_tramp_nesting and rcu_tasks_irq_ip updates
before ours; a task preempted from irq exit inside trampoline text has
the count held non-zero across the switch by irqentry_preempt().  So a
pinned, not-running task with a zero count is neither in nor called
from a trampoline, and with rcu_tasks_irq_ip_holds() also clear (the
kprobe jump window, which can open after the task was switched out) it
is quiescent now, whether or not it ever runs again.  Check that in
rcu_tasks_pertask() so such tasks never become holdouts, and in
check_holdout_task() so they are retired on the next scan.

This is the only remote reader of the count, and it only reads it for a
pinned, switched-out task, so the trampoline-side increment and
decrement stay plain on every preemption model, PREEMPT_RT included.

Only under CONFIG_RCU_TASKS_PREEMPT_QS; other architectures are
unchanged.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/rcu/tasks.h | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index bab08a666dc0..ba432bd922e2 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1014,10 +1014,39 @@ static bool rcu_tasks_is_holdout(struct task_struct *t)
 	return true;
 }
 
+#ifdef CONFIG_RCU_TASKS_PREEMPT_QS
+/* task_call_func() callback: is @t switched out with no trampoline in play? */
+static int rcu_tasks_switched_out_clean(struct task_struct *t, void *arg)
+{
+	/*
+	 * With @t pinned, !task_curr() means it last left the CPU through
+	 * __schedule(), so its rcu_tramp_nesting and rcu_tasks_irq_ip are
+	 * stable and ordered before the rq lock we hold.  A task preempted
+	 * from irq exit inside trampoline text has the count held non-zero
+	 * across the switch by irqentry_preempt(), so zero here means neither
+	 * in nor called from a trampoline; rcu_tasks_irq_ip_holds() covers the
+	 * one case that can become true after the task was switched out (a
+	 * kprobe jump-optimization window).  Both clear: already quiescent,
+	 * whether or not it ever runs again.
+	 */
+	return !task_curr(t) && !READ_ONCE(t->rcu_tramp_nesting) &&
+	       !rcu_tasks_irq_ip_holds(t);
+}
+
+/* Is @t, right now, switched out somewhere that is a quiescent state? */
+static bool rcu_tasks_preempted_qs(struct task_struct *t)
+{
+	return task_call_func(t, rcu_tasks_switched_out_clean, NULL);
+}
+#else
+static bool rcu_tasks_preempted_qs(struct task_struct *t) { return false; }
+#endif
+
 /* Per-task initial processing. */
 static void rcu_tasks_pertask(struct task_struct *t, struct list_head *hop)
 {
-	if (t != current && rcu_tasks_is_holdout(t)) {
+	if (t != current && rcu_tasks_is_holdout(t) &&
+	    !rcu_tasks_preempted_qs(t)) {
 		get_task_struct(t);
 		t->rcu_tasks_nvcsw = READ_ONCE(t->nvcsw);
 		WRITE_ONCE(t->rcu_tasks_holdout, true);
@@ -1181,6 +1210,7 @@ static void check_holdout_task(struct task_struct *t,
 	if (!READ_ONCE(t->rcu_tasks_holdout) ||
 	    t->rcu_tasks_nvcsw != READ_ONCE(t->nvcsw) ||
 	    !rcu_tasks_is_holdout(t) ||
+	    rcu_tasks_preempted_qs(t) ||
 	    (IS_ENABLED(CONFIG_NO_HZ_FULL) &&
 	     !is_idle_task(t) && READ_ONCE(t->rcu_tasks_idle_cpu) >= 0)) {
 		WRITE_ONCE(t->rcu_tasks_holdout, false);

-- 
2.55.0


