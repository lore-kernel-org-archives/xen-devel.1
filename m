Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574F9C88E7B
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 13:18:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421708.1647422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T2r-00050C-Ef; Tue, 15 Sep 2026 13:17:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421708.1647422; Tue, 15 Sep 2026 13:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T2r-0004yu-Ay; Tue, 15 Sep 2026 13:17:57 +0000
Received: by outflank-mailman (input) for mailman id 1421708;
 Tue, 15 Sep 2026 13:17:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x6T2q-0004tp-1c
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 13:17:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6T2p-00EG9J-Dv
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 15:17:55 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa9457b-bab6-0a2a0a5309dd-0a2a4503e980-14
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:17:55 +0200
Received: from [74.125.230.204] (helo=mail-qk2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa94582-fae8-0a2a45030019-4a7de6ccce25-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:17:55 +0200
Received: by mail-qk2-f12.google.com with SMTP id
 d75a77b69052e-52fb76906adso46626251cf.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 06:17:55 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-530ca4ba156sm126369461cf.19.2026.09.15.06.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 06:17:52 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789478274; x=1790083074; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zOBWKoOt8czuTeNdTxDxvLfMht4h54WO3jEdwibwnr4=;
        b=NqEVb7HrEnHrZA5W2qxk+nVH6z+qq08zjTm0pTrJJzvNRuBXta3K9r7d0mHCxGt+TV
         2TV7DFHol2TC2OJt/KpByH24qiIEx3VyMpr6TZx0Si8mfDa2x5lU/pEp/UDs/vlzg/1d
         ObALVskR2C8G29X5BT8NQmzxpKu5zHt/v9GZTOI0U4ydA9upCBL9uyA1aWXv7HAwlgdA
         QSFZRF1fFT4SAmXKrXmdQtFcsEQ3kUWAr3oBeLT9OMrqZEpsjiYR8nUJ4Z0R2rcKh8TR
         kQGDw4jCp8crnP9YwLrOYuU9gStKk+ETPCfDNrfbZUTynhIlRBphoneCL8IT2CgX3MKC
         OzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478274; x=1790083074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOBWKoOt8czuTeNdTxDxvLfMht4h54WO3jEdwibwnr4=;
        b=EamyQS2PpCQXPpPQ/kj0eHsG8GTAa4AXpqU0+fr2W+yRG9XOE5cRjwppPlEbqKpRgx
         phx+KhjoutFHhL/z4bHS2WsUm6l6zDcRCA6TtA1icBMp02rP/g+YLHoH+ayFCQXp4buP
         rA4PSwg54nbiiZ8UoOCmu0gIbtxFEok8zy0GPHkl3bLbe7xxH1IDM1IzrEtm1Zg0mGUY
         1aE/PEHbOeMo37ZMvNP0OWPi/ex8ETl6nas89i0sX1BMvHL4jmXJ2ORT6B1cQIQk8+M9
         Aj+kAIU1mWDMwn8yIrxR1C7B02JVKcOi8t7l9mjGrCm27V3b0E8FJNWYq6QSc3cr7e0K
         FqNw==
X-Forwarded-Encrypted: i=1; AKwUvBzAIqCXTH4APV9mDA0vamYLLwfsdVAFh4XjrbCVY4nhug0rSP1W9mtex7WCTpxTutHoMzm/Pn/FtWc=@lists.xenproject.org
X-Gm-Message-State: AFuF++nPNT29Kp5WvjisUOvxQK0QfyJbMCM0fI6GKUyMJWafXnSmMoG4
	F1oNW31qb/5700hXTK8nzvsykLhfiPy7wLFKgliNU+D6FHGkUVG0DleBxTbmQjrjIiM=
X-Gm-Gg: AYBFou2Iczvmt9SQ4rsh/jknC9G1r0UB0gCiWFpCWvYQHecnrDerD1Y0e/HNAp7xtLD
	TfoeuKMIizMwbaXns+BjSKuH8HSB9O2mX+2jOS4XG/s9G6C4RRoxsXQYFvuhNRaibcTjOpBOFdP
	+O2iKzO3aLjIhmrepZgH6W0+WK3lF5cxTjGWGfJw75iaAwc4puVekDBT6+hOVaoSodh0Ytj/BPC
	1z2KSKfJMmIfAF8IN7ama0U0b7pJsAvdf62XPD2qY8zKwQ4Q3y6c+nRVdU9R7WhPUhcNPlco/jw
	DdKkRYBM/KsvvWlRGNb9P5nMRku8M0ChD0mTNIwwUY8SVvh+ifZZW5kNLidXDwy553x7a+ZMDwq
	Je+cTXXj/VJB8s+hyXcO6S+nRMvJbD+YRRyHUDxEZW/Oxc+jxtasnK5MG2cQglHG6njhbyyBFf8
	lPKAIj1AWTWRuo3vz04/sjBZE/cfv45BLpuZljnJSBhnXiQEyhK4l9nfwjPe64SISiILNZ18NZ6
	IIPzrkzBkjsrNoKUfmEN74oMQ4IsNUs7bAKiDceWNb96Rzw8K4/tDd0
X-Received: by 2002:a05:622a:1646:b0:530:9bb:54ae with SMTP id d75a77b69052e-5310cf32770mr102643101cf.15.1789478273513;
        Tue, 15 Sep 2026 06:17:53 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 15 Sep 2026 13:17:31 +0000
Subject: [PATCH RFC v3 04/13] kprobes: Expose the optprobe jump window to
 Tasks RCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rcu-tasks-preempt-qs-v3-4-0ad30c4c5ee7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789478262; l=7478;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=2gqgm31o9vakOy6+NG5dFQrZfNnO16Cyr1QKmdk48dg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFs4wUTmA5uBGNzmizfs5h8i2jZ+BJEC+ZKMMB4U6RQcjTiVVDPqXAZ9evZNBFK/JcfouDSMfSj
 BhbWSxMKT7As=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-33051d/1789478275-6C8DD4E9-C8161ED8/0/0
X-purgate-type: clean
X-purgate-size: 7480

kprobe_optimizer() is the one synchronize_rcu_tasks() user that is not
about trampoline text: it waits for tasks that were interrupted on an
instruction boundary inside the bytes it is about to overwrite with the
optimized jump, so that none of them resumes into the middle of the new
instruction.  Those bytes are ordinary kernel or module text with no
Tasks Trace reader around them, so on CONFIG_TASKS_RCU_TRAMPOLINE_READERS
kernels the irq-exit quiescent-state check has to be told about them.

Add kprobe_in_optimized_region(), a lockless and conservative form of
get_optimized_kprobe() that reports whether any registered kprobe lies
within MAX_OPTIMIZED_LENGTH before the given address regardless of its
optimization state, and have rcu_tasks_trampoline_text() consult it for
core and module text so that a task interrupted there becomes a holdout
rather than a quiescent event. The hash walk only runs while
kprobe_optimizer() is actually inside its synchronize_rcu_tasks(),
tracked by a flag it sets around the call; otherwise the check is a
single load. That check cannot see a task that was already preempted in
the region before the flag went up (possibly before the kprobe even
existed), and the new grace period does not otherwise wait for a
preempted task to run again, so before synchronize_rcu_tasks() the
optimizer calls rcu_tasks_wait_irq_preempted() to wait until no parked
task's recorded irq-exit preemption IP is inside such a region; its
leading synchronize_rcu() also publishes the flag to every (interrupts-
disabled) check in flight. The kprobe hash is RCU-protected and every
free path waits for a grace period after unhashing, so the lockless walk
from the irq-exit path is safe.

On other configurations the flag is set and cleared but nothing reads
it and rcu_tasks_wait_irq_preempted() is a stub; the classic
implementation already waits for such tasks.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/kprobes.h |  8 +++++++-
 kernel/kprobes.c        | 50 +++++++++++++++++++++++++++++++++++++++++++++++++
 kernel/rcu/tasks.h      | 11 ++++++++---
 3 files changed, 65 insertions(+), 4 deletions(-)

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
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 6337da5cab9e..e460fba83e4a 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -511,6 +511,48 @@ static struct kprobe *get_optimized_kprobe(kprobe_opcode_t *addr)
 	return NULL;
 }
 
+/*
+ * True while kprobe_optimizer() is waiting for its Tasks RCU grace period.
+ * Only in that window can an interruption inside an optprobe's jump region
+ * matter to it, so kprobe_in_optimized_region() does no work otherwise.
+ */
+static bool kprobe_optimizer_waiting;
+
+/**
+ * kprobe_in_optimized_region - Could @addr be inside bytes a jump-optimized
+ *	kprobe replaces?
+ * @addr: kernel text address, typically an interrupted instruction pointer
+ *
+ * kprobe_optimizer() relies on synchronize_rcu_tasks() to wait for tasks that
+ * were interrupted on an instruction boundary inside the region about to be
+ * overwritten by the optimized jump.  Where Tasks RCU is built on
+ * reader-marked trampolines that region has no reader, so the irq-exit
+ * quiescent-state check asks this instead (see rcu_tasks_trampoline_text()).
+ * This is the lockless, conservative form of get_optimized_kprobe(): it does
+ * not care whether the kprobe found is, or ever will be, optimized.  May be
+ * called from any context with preemption disabled; the kprobe hash is
+ * RCU-protected and every free path waits for a grace period after unhashing.
+ *
+ * The hash walk only runs while the optimizer is actually waiting.  A task
+ * that was preempted in such a region before the flag went up is invisible
+ * to that check, so the optimizer first waits those out by their recorded
+ * preemption IP (rcu_tasks_wait_irq_preempted(), whose leading
+ * synchronize_rcu() also publishes the flag to every check in flight).
+ */
+bool kprobe_in_optimized_region(unsigned long addr)
+{
+	int i;
+
+	if (!READ_ONCE(kprobe_optimizer_waiting))
+		return false;
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
@@ -644,8 +686,16 @@ static void kprobe_optimizer(void)
 		 * to 2nd-Nth byte of jump instruction. This wait is for avoiding it.
 		 * Note that on non-preemptive kernel, this is transparently converted
 		 * to synchronoze_sched() to wait for all interrupts to have completed.
+		 * kprobe_optimizer_waiting lets a reader-marked-trampoline Tasks RCU
+		 * recognise tasks interrupted in such a region while we wait, and
+		 * rcu_tasks_wait_irq_preempted() (a no-op elsewhere) first waits
+		 * out any that were preempted there before we said so; see
+		 * kprobe_in_optimized_region().
 		 */
+		WRITE_ONCE(kprobe_optimizer_waiting, true);
+		rcu_tasks_wait_irq_preempted(kprobe_in_optimized_region);
 		synchronize_rcu_tasks();
+		WRITE_ONCE(kprobe_optimizer_waiting, false);
 
 		/* Step 3: Optimize kprobes after quiesence period */
 		do_optimize_kprobes();
diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index 3a7c092361a6..866768462850 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1006,7 +1006,9 @@ bool __weak arch_rcu_tasks_trampoline_text(unsigned long ip)
  *    text being torn down may already be unregistered there);
  *  - the .text..rcu_tramp section, C glue called directly from such
  *    trampolines before it has entered the reader;
- *  - whatever the architecture adds via arch_rcu_tasks_trampoline_text().
+ *  - whatever the architecture adds via arch_rcu_tasks_trampoline_text();
+ *  - the bytes after a kprobe that a pending jump optimization is about to
+ *    overwrite, the one synchronize_rcu_tasks() user with no trampoline.
  *
  * A false positive only makes the task a holdout until its next quiescent
  * event.  Called with interrupts disabled from the irq-exit path.
@@ -1017,9 +1019,12 @@ bool rcu_tasks_trampoline_text(unsigned long ip)
 		if (ip >= (unsigned long)__rcu_tramp_text_start &&
 		    ip <  (unsigned long)__rcu_tramp_text_end)
 			return true;
-		return arch_rcu_tasks_trampoline_text(ip);
+		return arch_rcu_tasks_trampoline_text(ip) ||
+		       kprobe_in_optimized_region(ip);
 	}
-	return !is_module_text_address(ip);
+	if (is_module_text_address(ip))
+		return kprobe_in_optimized_region(ip);
+	return true;
 }
 NOKPROBE_SYMBOL(rcu_tasks_trampoline_text);
 

-- 
2.55.0


