Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210CCC88E40
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415149.1644642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jrM-0004Wm-Fn; Thu, 10 Sep 2026 18:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415149.1644642; Thu, 10 Sep 2026 18:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jrM-0004Wf-CZ; Thu, 10 Sep 2026 18:50:56 +0000
Received: by outflank-mailman (input) for mailman id 1415149;
 Thu, 10 Sep 2026 18:50:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x4jrK-0004WP-PT
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 18:50:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4jrK-00GcVR-6S
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:50:54 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fbec-bab6-0a2a0a5309dd-0a2a4506e7e0-40
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:50:54 +0200
Received: from [74.125.230.140] (helo=mail-qv2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fc0d-195a-0a2a45060019-4a7de68ca226-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:50:54 +0200
Received: by mail-qv2-f12.google.com with SMTP id
 6a1803df08f44-90cdfc9b6ebso282126d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:50:53 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-530ca45b61dsm239421cf.6.2026.09.10.11.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 11:50:51 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789066252; x=1789671052; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AwJvzjOst2er6K+UDT8eDw5lj3PdpLVthroXGjj7dNM=;
        b=PBu+rAgA+SRJuxl4EK9t6NvRu4M4sZV5P5sauLJDEzhZKuXE5i1/xq+yC4LiZhkK2N
         U1sx8IkgrfsGMrCxYlhRxIIjCoUctbOtcxkLY+Hthys74dYcel0SUWGqFWjyReiyXfeE
         K7BLpafsbM9RDlpBTeixuMveUj0PLES6OtVTunqqyG7gBup66j2GfBsh/ao46DjT728w
         jwWI0BnL0ysw4ct6Ih7iybU+5u0/GM/ZZdhCy5wKNc9v2Pj+pw4/fZHp5KxZlfB7yLjQ
         KAqvxNXb9gKu271LM0GzKPjcN+/0YPGujrnB5OLrYU1PPx7Z0y0P3yFHtQnB0QapEjRk
         NgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066252; x=1789671052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AwJvzjOst2er6K+UDT8eDw5lj3PdpLVthroXGjj7dNM=;
        b=jo3YMgzuzYyFlfLJmDMtlDyHofTfJbdQXMH8DGq83Wo6H5lsnGSYfWdEZtfUg3zARD
         pH6mTRM0QVMNIo6UHJbk1mr1kZ8cEMVsa3OGHTrlGnlwdfBaDYVyVbzXWNdm6Hcyi7UU
         /2lPTFJtOwLw91PE0R+NJuPObNiITDTE4rVXIecbNpgz0Xu+sDoQJ/l4KgTYaZmoNDBg
         6MR+ESqbPZDKSExOxfgLOSlZATnY9z+X/hejqWm4xqosG3eUyEY0ZW7Qq8I8Yrc2Lnmz
         UbJJSSrAdrH4L+cJq+be1SA1omGt5MR7MEJBLk3bCV8HIHaeRkOAERLRKVqcWry7iZA/
         ou9A==
X-Forwarded-Encrypted: i=1; AKwUvBx517ID/pJYa1ijc55h2DD0d/bLX3yC/ZHYhrSzzXHYWsOotL7P/mW0F/ZxrHxv5HLEszg4fS0vAok=@lists.xenproject.org
X-Gm-Message-State: AFuF++mPXVlD8l6amng25G9F1X0yVmlW+oUzDxsMcV2tPZOn4LU+ag5Z
	aSPhMhqJLT+gIGIPUvwhMhpGGeEBZ1Mb6FNHqS7As1lBO20w+LygQWMpFFPIXLXY/TE=
X-Gm-Gg: AYBFou2nZe8U5RL3j+p9D2BFEsHjppdHu9AMRNm3r62VnqSmKUOGn1OrqsrW5MZJlK8
	QcAtvP/gC2xERLBsPwQC1XGaxV2B3LORrRnMywCCsviXNp3+30bMd9M2xdfO6iRa09rWwebdRZ5
	qihfYtJPgAiMyFlDpQE25DCiYGYVi0QYcRiXlbkCKK3gMEamNwSuangtnNJpAa+5nH37o0Ufb2Z
	vmIfam/+2qFxdY3g8WseOFRY7bmAY6XDCVaSIIggnd7kEn82emE3s5LQHGzBXRtl1JqlYQWz1il
	FNjO/PXZ4pNQHd/tjKaqgG3H3CsKOCleNSCRYAjnV0VHh5AKRDPp1p92mNBhps6xG3EojST7B6C
	qETLBFPyrjQkHuF1Y2JBFHtQqQ79WF5wUOoxW5HI4Q89iVcrzbRTNOtQpezqSXPdLSh8ifFh0Bp
	DWCgctRzRZ621Y0bhOHvaepuarbMtn/ScsZyT5gHM+v5q8JiGH2WeJlVo1pTfuQLops0Rgry0dj
	GIUoeRgIaldknH1+FWRBsYOWMTh+MdRxUOqmUKKqULux8CaOqOrKgYCSg==
X-Received: by 2002:a05:622a:1b8b:b0:530:5ed1:561a with SMTP id d75a77b69052e-530c876e50amr12423551cf.43.1789066252311;
        Thu, 10 Sep 2026 11:50:52 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:24 +0000
Subject: [PATCH RFC 01/13] rcu-tasks: Add per-task trampoline nesting count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-1-d4469f4cc101@toxicpanda.com>
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
X-purgate-ID: tlsNG-16d1c6/1789066254-F580D77B-06DA44E2/0/0
X-purgate-type: clean
X-purgate-size: 6292

Tasks RCU exists so that ftrace, BPF and kprobes can free trampoline
text once no task can still be executing in it.  Today the only way a
task tells Tasks RCU "I am not in a trampoline" is a voluntary context
switch, so a preempted task is always assumed to be inside one.

Add task_struct::rcu_tramp_nesting so that trampolines can say so
directly: a trampoline increments it before calling out and decrements
it before returning, and while it is non-zero the task must not be
treated as Tasks-RCU quiescent.  Provide rcu_tasks_trampoline_enter()
and rcu_tasks_trampoline_exit() for C users, report the count in the
Tasks RCU stall output, and, under CONFIG_PROVE_RCU, assert that it is
zero on every return to userspace since no task can legitimately reach
userspace with a trampoline on its stack.

Only current ever writes the count and every nested user (interrupts
running their own trampolines) is balanced, so plain accesses suffice.

Nothing increments the count and nothing consults it for quiescent-state
decisions yet; both come in later patches.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/irq-entry-common.h |  2 ++
 include/linux/rcupdate.h         | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/sched.h            |  1 +
 kernel/fork.c                    |  1 +
 kernel/rcu/tasks.h               |  3 ++-
 5 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 0bb6c03481fa..8da571622000 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -5,6 +5,7 @@
 #include <linux/context_tracking.h>
 #include <linux/hrtimer_rearm.h>
 #include <linux/kmsan.h>
+#include <linux/rcupdate.h>
 #include <linux/rseq_entry.h>
 #include <linux/static_call_types.h>
 #include <linux/syscalls.h>
@@ -214,6 +215,7 @@ static __always_inline void __exit_to_user_mode_validate(void)
 {
 	/* Ensure that kernel state is sane for a return to userspace */
 	kmap_assert_nomap();
+	rcu_tasks_trampoline_assert_none();
 	lockdep_assert_irqs_disabled();
 	lockdep_sys_exit();
 }
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 44c07a66edff..b5c666c82479 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -180,6 +180,37 @@ static inline void rcu_nocb_flush_deferred_wakeup(void) { }
 #ifdef CONFIG_TASKS_RCU_GENERIC
 
 # ifdef CONFIG_TASKS_RCU
+
+/*
+ * Trampoline nesting: dynamically allocated text (ftrace trampolines, BPF
+ * trampoline images, kprobe optinsn slots) that relies on Tasks RCU for its
+ * lifetime brackets itself with an increment/decrement of
+ * current->rcu_tramp_nesting.  While the count is non-zero the task is inside,
+ * or was called from, such text and an involuntary context switch must not be
+ * treated as a Tasks RCU quiescent state.
+ *
+ * Only current writes the count and only current (or an interrupt on the same
+ * CPU) reads it, so plain accesses suffice.
+ */
+static __always_inline void rcu_tasks_trampoline_enter(void)
+{
+	current->rcu_tramp_nesting++;
+	barrier();
+}
+
+static __always_inline void rcu_tasks_trampoline_exit(void)
+{
+	barrier();
+	current->rcu_tramp_nesting--;
+}
+
+/* A task must never reach userspace with a trampoline on its stack. */
+static __always_inline void rcu_tasks_trampoline_assert_none(void)
+{
+	if (IS_ENABLED(CONFIG_PROVE_RCU))
+		WARN_ON_ONCE(current->rcu_tramp_nesting);
+}
+
 # define rcu_tasks_classic_qs(t, preempt)				\
 	do {								\
 		if (!(preempt) && READ_ONCE((t)->rcu_tasks_holdout))	\
@@ -192,6 +223,9 @@ void rcu_tasks_torture_stats_print(char *tt, char *tf);
 # define rcu_tasks_classic_qs(t, preempt) do { } while (0)
 # define call_rcu_tasks call_rcu
 # define synchronize_rcu_tasks synchronize_rcu
+static inline void rcu_tasks_trampoline_enter(void) { }
+static inline void rcu_tasks_trampoline_exit(void) { }
+static inline void rcu_tasks_trampoline_assert_none(void) { }
 # endif
 
 #define rcu_tasks_qs(t, preempt) rcu_tasks_classic_qs((t), (preempt))
@@ -208,6 +242,9 @@ void exit_tasks_rcu_finish(void);
 #define rcu_tasks_classic_qs(t, preempt) do { } while (0)
 #define rcu_tasks_qs(t, preempt) do { } while (0)
 #define rcu_note_voluntary_context_switch(t) do { } while (0)
+static inline void rcu_tasks_trampoline_enter(void) { }
+static inline void rcu_tasks_trampoline_exit(void) { }
+static inline void rcu_tasks_trampoline_assert_none(void) { }
 #define call_rcu_tasks call_rcu
 #define synchronize_rcu_tasks synchronize_rcu
 static inline void exit_tasks_rcu_start(void) { }
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 8b3d47a325cc..d2e7b1b3c9d2 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -956,6 +956,7 @@ struct task_struct {
 	unsigned long			rcu_tasks_nvcsw;
 	u8				rcu_tasks_holdout;
 	u8				rcu_tasks_idx;
+	int				rcu_tramp_nesting;
 	int				rcu_tasks_idle_cpu;
 	struct list_head		rcu_tasks_holdout_list;
 	int				rcu_tasks_exit_cpu;
diff --git a/kernel/fork.c b/kernel/fork.c
index 416758c8a3d4..cfe3a8e53fbd 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1869,6 +1869,7 @@ static inline void rcu_copy_process(struct task_struct *p)
 #endif /* #ifdef CONFIG_PREEMPT_RCU */
 #ifdef CONFIG_TASKS_RCU
 	p->rcu_tasks_holdout = false;
+	p->rcu_tramp_nesting = 0;
 	INIT_LIST_HEAD(&p->rcu_tasks_holdout_list);
 	p->rcu_tasks_idle_cpu = -1;
 	INIT_LIST_HEAD(&p->rcu_tasks_exit_list);
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 627295396cd9..1662ba18bf34 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1113,10 +1113,11 @@ static void check_holdout_task(struct task_struct *t,
 		*firstreport = false;
 	}
 	cpu = task_cpu(t);
-	pr_alert("%p: %c%c nvcsw: %lu/%lu holdout: %d idle_cpu: %d/%d\n",
+	pr_alert("%p: %c%c nvcsw: %lu/%lu holdout: %d tramp_nesting: %d idle_cpu: %d/%d\n",
 		 t, ".I"[is_idle_task(t)],
 		 "N."[cpu < 0 || !tick_nohz_full_cpu(cpu)],
 		 t->rcu_tasks_nvcsw, t->nvcsw, t->rcu_tasks_holdout,
+		 data_race(t->rcu_tramp_nesting),
 		 data_race(t->rcu_tasks_idle_cpu), cpu);
 	sched_show_task(t);
 }

-- 
2.55.0


