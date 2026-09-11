Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1194AC88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:14:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416975.1645899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x520h-00055q-9a; Fri, 11 Sep 2026 14:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416975.1645899; Fri, 11 Sep 2026 14:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x520h-00055j-70; Fri, 11 Sep 2026 14:13:47 +0000
Received: by outflank-mailman (input) for mailman id 1416975;
 Fri, 11 Sep 2026 14:13:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x520f-00055d-B6
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:13:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x520e-00Bjlq-5E
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:13:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40c94-bab6-0a2a0a5309dd-0a2a4503bd0c-6
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:13:44 +0200
Received: from [74.125.230.204] (helo=mail-qk2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40be2-fae8-0a2a45030019-4a7de6ccc63e-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:10:43 +0200
Received: by mail-qk2-f12.google.com with SMTP id
 d75a77b69052e-52fb76798a2so3010961cf.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 07:10:43 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-530ca460a32sm20960711cf.9.2026.09.11.07.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 07:10:27 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789135842; x=1789740642; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrCxqh0lkRJGK/msNx4sQvIno2OGGDXwsMjyZ+inPRg=;
        b=OsJImIP36Vypq1b/g1wbfpsjf6PKhTW1X2TEUcb+1pw17b/cng3a8yPlxxnK2wfQGm
         PvPSwVkTEF4ar2W9+vDojLPDweXYRUAvU8dYPFEPXvyvdYxWVZKPhoHKhPWEPqzMJhln
         cZ6qMA+2G2S1E0QIuQgc1CMVre1/7bSc9wOZlfUuGgJHHAdRdBzUlmTvSaqnypo0NK1h
         PYAJlqfCOn3C0hWsa7KiSo4qGVfQE7o9K6XWgl8kHJjD4b/R/PLmy3EmJ8cH+KDuXWMt
         iBQJROQKtnSEBUbkLZU+eQMFUxVWFhsJ6gzJZe8sAB5tIFZ8WafOc/HzWMLxICBKqHML
         rteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135842; x=1789740642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrCxqh0lkRJGK/msNx4sQvIno2OGGDXwsMjyZ+inPRg=;
        b=a6f5MmGZ95hnC5PNqN4CpEvP/leS7VcfGWde7epqwS2VazK+YhbQ3N3rPYS1hIf3j7
         HG4wRDHWfzX1a6l20yIxSRjhOWmuZR7QLTiQROKsw/ONYjM8dY+7y75kaf+5NsqrVFIC
         mwr2V8zVAKGMRmjxn/ydy4Ix2b6BDXp5RvCfds/MSxZn9nP8HWHEHL4vAqwnCgHcnFHj
         N8sY/lhB+Eo9sPZIIomeBvG6rcaMuMcbDLilmyqEpQowLrsk1r2i0Dcv9uTZQt/dstKL
         WFqo7TVHI4jUakKPMLD9ud+VsPoBoYFw3wtBs3/J9qACrG/5CUKclrJmwZqnbg8FVnby
         7fXw==
X-Forwarded-Encrypted: i=1; AKwUvBwtygxQkIMe9ZXkMAeNmMHdK/X76wt+pVIZr6VtqJlPyx9bQ/3evyHe6J2J6UMUGZSu7pVcDrQ8TME=@lists.xenproject.org
X-Gm-Message-State: AFuF++lN66LCuBwzLHVKW/niJAtjv6mqZPIOGPV08XvVr5nKoNnngSrN
	veuDI5ozFGCsukN05eY4RBdRh96TCnZRyU+JbeRPoFgN8aF57FGfdw3doOsKDRKPzUc=
X-Gm-Gg: AYBFou1dRS1VAGtwLqjOE4Sk9hsfem7Pm6ADjSj0TsQzcqgMqD5+m+5s2r9KrhAMrSr
	fr6+nZPPlambx4fn9ts3p1AdAGbZBToLgiuwkqEPZXT03ChriADKA0JXOLRR3q0ga7QRgIClThN
	Kv/nEOlcF4ckfFoWvCCVxQacdi0QZzHv0P0aT6NSLsKHfM6++52u30KNwVf3394AMenYsdOM/Eo
	HVbpjjbj/Ew1X5czaZb64h67LsIyZp9iBFhc1bU5abIS5biQ/lnWNJa89MR9Q+feErWAjaqyCAU
	BmRW1iIiHyhdv7OJfkTTiP0g5wa/JcvB/KTD5eSpK5coFo/8tCoZ3abjnNwzEeUpExrFG3WQwlF
	iMQmg4Mf2G3RCfWUImBML3T5VX40Ve/i1pZXd9IBMGP1ra0UAvyORQE0Dig3TD/Kt2EIWFjZFSO
	JPLUmd+nKW0JbVTgOe1zhPQha1L8g9jUJsKRtNFy81h6ID1BCsyQ4rdTVXdrzPpOtWvvnW5Aqwn
	VLHf1lGldbqZiAkSkzckvSpJWclxHeE1/gAH79fE+++mm0t6DqBdONb
X-Received: by 2002:a05:622a:53c5:b0:51c:b98c:f772 with SMTP id d75a77b69052e-530c86f6195mr51379741cf.15.1789135827987;
        Fri, 11 Sep 2026 07:10:27 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:53 +0000
Subject: [PATCH RFC v2 15/15] rcu-tasks: Kick running holdouts through the
 scheduler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-15-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135737; l=1790;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=K9+ZKIgsGRgsc959M4tS0rMKOB/eZlOXTQ8Ho0gK2m4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFxu9w6oKo935Kq6bYpzSj4sd/pud6qAfpTImYrmpDnci7BPIoYh09XWotebu7q/uE6z/VGg6k/
 nk0bYtqCcqAg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-33051d/1789135843-7488A4E9-B8660194/13/0
X-purgate-type: clean
X-purgate-size: 1792

A holdout that is running on a CPU with nothing else runnable is only
preempted if the tick acts on rcu_request_urgent_qs_task()'s flag, and
there may be no tick.  Now that a preemption outside a trampoline is a
quiescent state, have check_holdout_task() call resched_cpu() on a
running holdout as well, so the scheduler IPIs it and it goes through
__schedule() and reports (or, if it is inside a trampoline, does not
report) its own state with purely local ordering.  Nothing reads a
running task's rcu_tramp_nesting remotely.

Only under CONFIG_RCU_TASKS_PREEMPT_QS; other architectures are
unchanged.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/rcu/tasks.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index ba432bd922e2..02d2592ab7a3 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -1038,8 +1038,18 @@ static bool rcu_tasks_preempted_qs(struct task_struct *t)
 {
 	return task_call_func(t, rcu_tasks_switched_out_clean, NULL);
 }
+
+/* Make a running holdout pass through __schedule() soon, tick or no tick. */
+static void rcu_tasks_kick_running(struct task_struct *t)
+{
+	int cpu = task_cpu(t);
+
+	if (task_curr(t) && cpu_online(cpu))
+		resched_cpu(cpu);
+}
 #else
 static bool rcu_tasks_preempted_qs(struct task_struct *t) { return false; }
+static void rcu_tasks_kick_running(struct task_struct *t) { }
 #endif
 
 /* Per-task initial processing. */
@@ -1219,6 +1229,7 @@ static void check_holdout_task(struct task_struct *t,
 		return;
 	}
 	rcu_request_urgent_qs_task(t);
+	rcu_tasks_kick_running(t);
 	if (!needreport)
 		return;
 	if (*firstreport) {

-- 
2.55.0


