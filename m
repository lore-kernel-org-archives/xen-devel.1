Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F97C88E58
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:10:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416855.1645783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51ww-0005Wa-Ez; Fri, 11 Sep 2026 14:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416855.1645783; Fri, 11 Sep 2026 14:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51ww-0005WT-B2; Fri, 11 Sep 2026 14:09:54 +0000
Received: by outflank-mailman (input) for mailman id 1416855;
 Fri, 11 Sep 2026 14:09:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x51wv-0005WB-9m
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:09:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51wu-009TbZ-HP
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:09:52 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40bad-bab6-0a2a0a5309dd-0a2a4502afbc-20
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:09:52 +0200
Received: from [74.125.230.140] (helo=mail-qv2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40baf-6ca4-0a2a45020019-4a7de68c8e02-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:09:52 +0200
Received: by mail-qv2-f12.google.com with SMTP id
 6a1803df08f44-90cdfbd148cso9161746d6.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 07:09:52 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9120f478bf1sm21734556d6.25.2026.09.11.07.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 07:09:48 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789135791; x=1789740591; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxBJRgyuHY3W/iJApny4mLX1c4wnn/TYh39J8mu564M=;
        b=I9KwG09aoUS+hu71dRDVO81iZgY5dD1qArXVwta18hRKE+F5BdR3WqOc0bNMtJp4lo
         4KTV5NQ4G4+jV2iIcw9/pwqr8YBtblTpwtOtzN+ZWhF+uVOp9k/wkR4TM3NnSNJuDk73
         wtOCJPUrYDjBwI9dYrniNoR1X48Zv+SzHHzVP/9MhS9UDROrGKvzojQi9SuiSCoB5wAt
         rXqIjpIt93z9dLRiMVJhzL6mOxfjEQrJj2jv4ffNAPH2dC0bdx0LYro3KXGFRfLDAdpJ
         QKwItdDXf2HoTieSQ05SyzZPnRKkFH7lyO0yvJhzk7G9v1QgRZnRDmcyJJxGpfjXWVBx
         /2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135791; x=1789740591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxBJRgyuHY3W/iJApny4mLX1c4wnn/TYh39J8mu564M=;
        b=XSpVtNQJaM5x3ebQcgdHw85pVIcpQX+ggrfnQxj52RdRwimGIQhuwXE25fdHuhd+Y/
         rkEnUg1ZOSIysnbymHf+lu7at628Fv406nk9qt4RnXqye1CWo99NQAoLRjPgcWLDBJDV
         MU4ewTFvkTJd7tRj7luv7t7A1mJRjzQUH8cN7soy8HkkfGHJOIZR33JZYekF57FP1wwH
         INLwqLZUwOlgoeGtxH/JDreDNOJcSbFZf1kHCDwMi+UvXx4bdeBy5NWXF22MZv7ONLoe
         GYT4VYvdRZskUNLX8EdNN/6QywToTr9MLsHlx5XRhJxFu+FTTEgsj1qfF6lRLbuaScd2
         IU/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzykGfl8SbzWkNVda9oCSAeaYyo0S+e1eBM5fqfCYq6wdil97e6HThqF9eaTXcd3DCZ2k8/U6S0UJs=@lists.xenproject.org
X-Gm-Message-State: AFuF++mFfFfnfXM6XWPrB9MQYgLSWXcRMR6/wi82HpErOKC7g5e9lULC
	RCMxbQzFmmWLOz/dK0UjHQ+0AW4Vj6dL9IUJdlXOjPhKkPHoOj591jP6+0Pz8JXtXms=
X-Gm-Gg: AYBFou16v9FqXSe2Tqc3WvLwrvh92P0G+MFO6Hzz0MdBepD0bPwlNU+6mRmkG4mqF14
	kU2vkB6j0EQLHlqUhrbO4KgQDqx2Dqn0a6bJrNqDiwz4PQeqmb/XNLIOXwGzTxX+f7H3mMr6ChJ
	ycenTqvDSdN4sGABs5Zx9vFm6FDyQ7GAOO8EAwPOIdlE0Ffi7bDvtDf+owa4ox4c8ADH3moLKUd
	n/b6DiEhwQKnPDdXJObVVMixzSkADOJAWvQfwMXfhX+58Lp5zxPoYAJnqF9tsouDPvekgdhZl3t
	FHbvmr6UqiqKcXqqob3PEmHbBw5FPW9xS04dVd6ZMn18xRxL4F0T0ztJzzCdm4af3CXPMH+20vT
	oX6JrAAAXFLkBFJ5dBxpNd4r0Q+NtqagQPs0fXxDW/0s7jnZT7ah9lomEk14XUw3awGJsBxkAdy
	WVMd9HnUA93fEtwQRno4CDytADlQ/n1H/IdRp1ji02JNqujCLympEtn74vkK8oaN5emRPx4JWwz
	5yMoibvCDcBlePsT24ncc40jG0P3dbbamLqzRPVmmpsH88J7dduWINi
X-Received: by 2002:a05:6214:5297:b0:912:bed:c40 with SMTP id 6a1803df08f44-91212116f69mr58502326d6.34.1789135790416;
        Fri, 11 Sep 2026 07:09:50 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:40 +0000
Subject: [PATCH RFC v2 02/15] entry: Pass pt_regs to
 irqentry_exit_cond_resched()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-2-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135736; l=4149;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=lYdFz9QIpBbv18s7vNFL415owdJ/HvkbTUnKX5a6LVk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNLFUziLYUgokPYUCSvxyZJ4wGM33t0Exk3VASr1V813+Mcb6CwBQQCYTgKz4pDcXnm0a03w7j0
 ZSuWxmEEtwQ4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-720697/1789135792-31DC92AC-F39C4332/0/0
X-purgate-type: clean
X-purgate-size: 4151

The irq-exit preemption path is about to need the interrupted context's
registers to decide whether the preemption may be reported to Tasks RCU
as a quiescent state.  irqentry_exit_to_kernel_mode_preempt() already
has them; hand them down through irqentry_exit_cond_resched(), its
PREEMPT_DYNAMIC static-call and static-key variants, and
raw_irqentry_exit_cond_resched().  The only caller outside the generic
entry code is Xen PV's upcall handler, which has regs as well.

No functional change.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/xen/enlighten_pv.c      |  2 +-
 include/linux/irq-entry-common.h | 12 ++++++------
 kernel/entry/common.c            |  6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 2c64b388f616..3d85035f5624 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -739,7 +739,7 @@ __visible noinstr void xen_pv_evtchn_do_upcall(struct pt_regs *regs)
 
 	inhcall = get_and_clear_inhcall();
 	if (inhcall && !WARN_ON_ONCE(state.exit_rcu)) {
-		irqentry_exit_cond_resched();
+		irqentry_exit_cond_resched(regs);
 		instrumentation_end();
 		restore_inhcall(inhcall);
 	} else {
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 8da571622000..fc04725ae46b 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -348,21 +348,21 @@ typedef struct irqentry_state {
  *
  * Conditional reschedule with additional sanity checks.
  */
-void raw_irqentry_exit_cond_resched(void);
+void raw_irqentry_exit_cond_resched(struct pt_regs *regs);
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 #if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
 #define irqentry_exit_cond_resched_dynamic_enabled	raw_irqentry_exit_cond_resched
 #define irqentry_exit_cond_resched_dynamic_disabled	NULL
 DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
-#define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)()
+#define irqentry_exit_cond_resched(regs)	static_call(irqentry_exit_cond_resched)(regs)
 #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void);
-#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
+void dynamic_irqentry_exit_cond_resched(struct pt_regs *regs);
+#define irqentry_exit_cond_resched(regs)	dynamic_irqentry_exit_cond_resched(regs)
 #endif
 #else /* CONFIG_PREEMPT_DYNAMIC */
-#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
+#define irqentry_exit_cond_resched(regs)	raw_irqentry_exit_cond_resched(regs)
 #endif /* CONFIG_PREEMPT_DYNAMIC */
 
 /**
@@ -467,7 +467,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
 		return;
 
 	if (IS_ENABLED(CONFIG_PREEMPTION))
-		irqentry_exit_cond_resched();
+		irqentry_exit_cond_resched(regs);
 }
 
 /**
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e3d381fd3d25..e4acd50bd81a 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -134,7 +134,7 @@ static inline bool arch_irqentry_exit_need_resched(void);
 static inline bool arch_irqentry_exit_need_resched(void) { return true; }
 #endif
 
-void raw_irqentry_exit_cond_resched(void)
+void raw_irqentry_exit_cond_resched(struct pt_regs *regs)
 {
 	if (!preempt_count()) {
 		/* Sanity check RCU and thread stack */
@@ -150,11 +150,11 @@ void raw_irqentry_exit_cond_resched(void)
 DEFINE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
 #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void)
+void dynamic_irqentry_exit_cond_resched(struct pt_regs *regs)
 {
 	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
 		return;
-	raw_irqentry_exit_cond_resched();
+	raw_irqentry_exit_cond_resched(regs);
 }
 #endif
 #endif

-- 
2.55.0


