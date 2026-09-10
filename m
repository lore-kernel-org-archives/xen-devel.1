Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81C2C79FBF
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415150.1644650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jrO-0004kf-PT; Thu, 10 Sep 2026 18:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415150.1644650; Thu, 10 Sep 2026 18:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jrO-0004kY-Mp; Thu, 10 Sep 2026 18:50:58 +0000
Received: by outflank-mailman (input) for mailman id 1415150;
 Thu, 10 Sep 2026 18:50:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x4jrN-0004eI-2o
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 18:50:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4jrM-00GcVR-Fk
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:50:56 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fbc3-bab6-0a2a0a5309dd-0a2a4501c7de-46
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:50:56 +0200
Received: from [209.85.219.52] (helo=mail-qv1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fc0f-5984-0a2a45010019-d155db34cc92-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:50:56 +0200
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-90cc39e06bdso569076d6.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:50:55 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939e8bf9d51sm34965885a.14.2026.09.10.11.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 11:50:53 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789066255; x=1789671055; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxBJRgyuHY3W/iJApny4mLX1c4wnn/TYh39J8mu564M=;
        b=qZ4kkEzaVD5EgqYkuvzJR0rh3kr43L38Y9KsooAwlzNbXwSgGYpoVimRX4tD3AHCR3
         r7DOLAIbdTC22OQi9+UBQnDMkp9upzu82IMCvOA4eZH2YtP7okowTR5d7Qvv8bBYCOhR
         iQzoe4cPytufFkpkvBxaaD8cA36sVB0JkiBS0oZdNLK9oTLK0VRCJuj7pwgr8XcwHXFg
         n5wMgJkZ777AOLa3LNlLBUK33hDSVVE8n6KyH/HSi1IRNgtHlBP93zKGTuqcp6dCqM3E
         l4tHJXuMzTPhKcF+DaqlzupEnwVNndvNjpRu1o8gN4tMrtMkqb/oP8YZXdnuctFN9/5m
         +ILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066255; x=1789671055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxBJRgyuHY3W/iJApny4mLX1c4wnn/TYh39J8mu564M=;
        b=sTNbfU93Mxp54VoEGtB/BKrsUkSoaNMEFMQMmOOV1gtPZb1dJoK12XCK4vKZpWY/Xe
         Hb9SZKMuJC9PgkOo3M1gOhCkoq6LF+J2/K1LsaTot3/H5FJosBa4WIHAkMzcNTkIRHXY
         TBudaRcPY2f7O7OwAnSMV7HZYiYAxsPkecL22iqZZfR90AaUL0jWL36juO0PFG+MLCVM
         zfi9faO+zNJs16aA+AcpNjYRGOKPb7exy3P8ukorQm4Zp7TZHRMcVWRc1OsKTG5/rU7M
         So8ynfWzy8AXv3iHC0/UZyux4XGubATnlTP8Dcb4yamaHEw0kUUeowuiQC1rLBTSKJy5
         ZUrw==
X-Forwarded-Encrypted: i=1; AKwUvBzxbHUAJsmEHZfjZTyekggmfIaAuGxwBGdjiZJkoFLZ+Z8zVFnjGpsZ1930pha/2o4FseIAprQ7Tf8=@lists.xenproject.org
X-Gm-Message-State: AFuF++l9hA2tKsgG/bIv7x2xiemmRZJ/ZMpm9Reg5ZWg102sTYBWQgqK
	iZBvqERejyzoU+sxZYXeJp1W1nwiCVNjzbH4cpfJKRH4b+Bwy35s1Px9AreUkWViVVE=
X-Gm-Gg: AYBFou1B8ABJWvYDLakBiwvvATzGxYlInAvOxnL41zTb03hGMx4bm/RR+XMJDJ5TxCV
	8A/aET1HGsnjp8B/wDQ6M7//cIIfXwwmIrD+4XEBL2qa3wJSbXR4lH2F0+cq8HymALgTDMS1DJw
	yH9xbnp5LB3gJ1C3IlyI13t7OpFipmiaaeJsozLf0hALeo8cqGfF6F04Zk7CCm+2/G+XDw93xUU
	w/2QVu0f5wZ+K9kevSHxKaUGTFtvlEnHNGp6CMo/gLvBQkNEwWeF8zK+GUgM7yY/JZ8SuEP2GkI
	KhXO0twbeoAsx88nklqPqEhS9vwI4fU3emtHPcQhNKkyokZe72sk4IFvciY3cVFQzhMHLsihJUS
	g7HzfdKA2hbgcNrpMLiWEzoTOHrUe2z4j8k01gPa/qkQgr6UOQOEIdz3oUW6+lknPXcBb1jfj4S
	7G8vjj4qzENDycQJBmDfW96mHlqLQlB6AdKOMekt8SHVqexwLuE1afeoS3zoCL5512xLe1Hb0ed
	ad5bF+SWTojZFy4jQqLKL/LUDeluyWn2GZlDciJMR7gdL45AXdEA5C6
X-Received: by 2002:a05:620a:280d:b0:939:78ab:3c5f with SMTP id af79cd13be357-939ea0137a8mr26249085a.9.1789066254480;
        Thu, 10 Sep 2026 11:50:54 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:25 +0000
Subject: [PATCH RFC 02/13] entry: Pass pt_regs to
 irqentry_exit_cond_resched()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-2-d4469f4cc101@toxicpanda.com>
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
X-purgate-ID: tlsNG-d62444/1789066256-C5146757-93FF6A3D/0/0
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


