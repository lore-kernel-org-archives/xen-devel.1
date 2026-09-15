Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910B4C88E53
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 13:18:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421722.1647487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T38-00076Q-Cb; Tue, 15 Sep 2026 13:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421722.1647487; Tue, 15 Sep 2026 13:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T38-000741-24; Tue, 15 Sep 2026 13:18:14 +0000
Received: by outflank-mailman (input) for mailman id 1421722;
 Tue, 15 Sep 2026 13:18:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x6T36-0006lz-Qp
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 13:18:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6T36-00DQUc-7Q
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 15:18:12 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa94591-e002-0a2a0a5209dd-0a2a4508dc0e-2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:18:12 +0200
Received: from [74.125.230.204] (helo=mail-qk2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa94593-f659-0a2a45080019-4a7de6ccf07f-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:18:12 +0200
Received: by mail-qk2-f12.google.com with SMTP id
 d75a77b69052e-52fb76ef19aso34891141cf.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 06:18:11 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-53104165737sm56777241cf.27.2026.09.15.06.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 06:18:09 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789478290; x=1790083090; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AdtdE/dNeJhNnC7k2tL4hzZr80UNkNMTy9M8Z5zSRM=;
        b=Ia5Eo53s0W2zmBu2Fg/1TT8MVq/bTXJk6UWoeAq8sWlBVnzxHGLju0NuMlvhegiTjp
         yfKodsDfVttFcUb7ivkshmnrZwBDZO8k3jRCyAm8OQVf7g9OffP1VX3P0ChMT6vubAKj
         hg0uIdYm4cooW8uEYyoQhSjWzRGNpldFiTGw+SmCTMPYKaQshOCRlS+IMUq991NypGTw
         ppLEhGpODK2vAqy83GpCESG6wKNCj8uH9/ndkAXGyZvWR/X11v24rgBKYd5nAq/Yb++h
         CK0ZVU8f7xCl3wv0Nwg9PO8UX1yz+IilPywxjkZ6+om8IHjpNePro3ew4q+ax/axOi27
         XTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478290; x=1790083090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AdtdE/dNeJhNnC7k2tL4hzZr80UNkNMTy9M8Z5zSRM=;
        b=GIKbeLvOtNiOjXyLyd929Xe79OmUZBy+Sf5PbttluYl231YS+UHNU1ukWOESoYjrlb
         dmzUYl5YRWKTsQXe7hdSrZ1rpJQ4HU1Qi9TXhv6HbNt/KfLNtjmeB1BTJ3UVh525ilFD
         kcKuAz4u1sXrA4oD1feVlW16FrGSwUCCdy2IFDR2Sh2B9xlUOyMsKS0slguby2ZLgvV/
         HfQ8J8AP61xQ16ckFxqFqCl/rm96Lc0u9CZewgj8gwFi5ASsaLjS1xDHISXscEbE7ufT
         KtpOLE56dHxovloBBduGPp51lkUA9u9q4ADjvnWD9qhvgUivOHAa4ccFaLur1EySTenT
         zU5w==
X-Forwarded-Encrypted: i=1; AKwUvBzpePRy76cO4oD8KbquCddLy4RiyqO9oSIPtlvivcOHoIPz6IqVOTCtEsHImhYHh/5dvvjSOqqRbX4=@lists.xenproject.org
X-Gm-Message-State: AFuF++kqC5xOjrk29tcWrBrx8k00wsiUnPybMrIl4m3K7R1stQsUpo9L
	7ZwbLpLa/PY9NuQIOBQI7lCyhZMML3//kwaqOwnYjopaOTyT0tiEst1TWsFghZYCSaw=
X-Gm-Gg: AYBFou1rFkfWcJYDr/kbgDR+bzcWxsu/9r1iHo5GpdvqEzfp7rsA97Lm9CUIwWV3Z60
	dL5TAoinwLYZRxAq8Z4nbGqYYvc9bPVNB8qaRM+QrrmtsQJQhJMfbxGmh1fZMO+buKxOYJtaowf
	VEbQI3oocKZAv4bsUrM5nQfy6hWzQeGpZvAKTzcGYiM+rQzucRnfTTKELUrJ9zqDxtewCmfQt/a
	MzBF+b/L/8PJIz59A73jpEhwwYRRbHL+6MilgwB0Pn98fHe6QHxTuAC3oc01p+3RGlA2hImcvNZ
	a9/oDLW/W5UP+8Lhtwc/IE+BhcoIEqytHMcQul7IYO6b/cvGF/eR/SgUNhf7uDRV/zG6GhEB2yA
	6m2UQPrORUqshlP+dmsAzmGfFfhBE8dfzrAXcVqts2ekbj09iOuFZ8cy8IQqzn0jNFu5TW963k0
	j5ZvZNDMWz8/dW2Wg2RwTzgDzvZFECGPc4xajx1SZtS48N21588SMAGZOSBeUO0Gw7j3xR0NSE/
	nTmdk5Ife8nq5qPSGc7gpA0G1gAq+at6WLsBRlPvCOrM2mE8qkV1C2K
X-Received: by 2002:ac8:5705:0:b0:530:e6b9:f5d9 with SMTP id d75a77b69052e-5310cf60dcamr104610221cf.20.1789478290432;
        Tue, 15 Sep 2026 06:18:10 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 15 Sep 2026 13:17:39 +0000
Subject: [PATCH RFC v3 12/13] rcu-tasks-trace: Assert no reader is held on
 return to userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rcu-tasks-preempt-qs-v3-12-0ad30c4c5ee7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789478262; l=2589;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=a8x0095kiaPfODWOL6BE+0O7E5TXMNLRrf+m1qUM63A=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNQ+h4Rgq+uBTWY42BKURCuzv1XjZ1QDbD5nWJycO3HnjSRSDGwSoVc9aADl5pV0kBRcRtS0O1v
 XzhUhrtoXcQU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c1860d/1789478292-D715E87B-EDF34101/0/0
X-purgate-type: clean
X-purgate-size: 2591

With trampolines and their glue now taking rcu_read_lock_trace() from
assembly and from several C paths, an unbalanced reader would silently
turn every later Tasks Trace grace period on that task into a stall.
No task can legitimately reach userspace with current->trc_reader_nesting
non-zero, so under CONFIG_PROVE_RCU check it in the generic entry
code's return-to-user validation, next to the existing kmap and lockdep
assertions.  Compiles away otherwise.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/irq-entry-common.h | 2 ++
 include/linux/rcupdate_trace.h   | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index b811b469b0a7..58086cc1140c 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -5,6 +5,7 @@
 #include <linux/context_tracking.h>
 #include <linux/hrtimer_rearm.h>
 #include <linux/kmsan.h>
+#include <linux/rcupdate_trace.h>
 #include <linux/rseq_entry.h>
 #include <linux/static_call_types.h>
 #include <linux/syscalls.h>
@@ -214,6 +215,7 @@ static __always_inline void __exit_to_user_mode_validate(void)
 {
 	/* Ensure that kernel state is sane for a return to userspace */
 	kmap_assert_nomap();
+	rcu_tasks_trace_assert_idle();
 	lockdep_assert_irqs_disabled();
 	lockdep_sys_exit();
 }
diff --git a/include/linux/rcupdate_trace.h b/include/linux/rcupdate_trace.h
index 4035054309d7..f5a51de4a4ef 100644
--- a/include/linux/rcupdate_trace.h
+++ b/include/linux/rcupdate_trace.h
@@ -209,6 +209,12 @@ unsigned long rcu_tasks_trace_batches_completed(void);
 // Placeholders to enable stepwise transition.
 void __init rcu_tasks_trace_suppress_unused(void);
 
+/* A task must never reach userspace inside an rcu_read_lock_trace() reader. */
+static inline void rcu_tasks_trace_assert_idle(void)
+{
+	WARN_ON_ONCE(IS_ENABLED(CONFIG_PROVE_RCU) && READ_ONCE(current->trc_reader_nesting));
+}
+
 #else
 static inline unsigned long rcu_tasks_trace_batches_completed(void) { return 0; }
 /*
@@ -218,6 +224,7 @@ static inline unsigned long rcu_tasks_trace_batches_completed(void) { return 0;
 static inline void call_rcu_tasks_trace(struct rcu_head *rhp, rcu_callback_t func) { BUG(); }
 static inline void rcu_read_lock_trace(void) { BUG(); }
 static inline void rcu_read_unlock_trace(void) { BUG(); }
+static inline void rcu_tasks_trace_assert_idle(void) { }
 #endif /* #ifdef CONFIG_TASKS_TRACE_RCU */
 
 DEFINE_LOCK_GUARD_0(rcu_tasks_trace,

-- 
2.55.0


