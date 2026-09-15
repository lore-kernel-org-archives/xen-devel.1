Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C9DC88E7F
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 13:18:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421705.1647399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T2m-0004RN-IE; Tue, 15 Sep 2026 13:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421705.1647399; Tue, 15 Sep 2026 13:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T2m-0004RG-FL; Tue, 15 Sep 2026 13:17:52 +0000
Received: by outflank-mailman (input) for mailman id 1421705;
 Tue, 15 Sep 2026 13:17:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x6T2l-0004QS-G5
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 13:17:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6T2k-00EG5U-T6
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 15:17:50 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa94574-8faa-0a2a0a5109dd-0a2a45049d76-36
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:17:50 +0200
Received: from [74.125.224.140] (helo=mail-yx2-f12.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa9457d-b57f-0a2a45040019-4a7de08cbd16-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:17:50 +0200
Received: by mail-yx2-f12.google.com with SMTP id
 956f58d0204a3-66fabb1a601so278080d50.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 06:17:49 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9120f2032d4sm120309036d6.5.2026.09.15.06.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 06:17:46 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789478269; x=1790083069; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6aaaKNzMayGmjMwZUrTAjDsf1dO37tc7Q4XOVkfUDkI=;
        b=LI9pqqvYIoXl5Mr0o+z6D5mG+Q/pFzYWKGri+lONcUnSvWOmn6qKarwUffuXLS+Xuh
         ++/F5v1Y3GNQZDD5wefveGzjidioFc1rvbAFmBTnkE6x8DFhgP0OTOisgGAx+lQ+QHIX
         BXkllG3ooFi0yeD2NB/44MozbLubplBsFPuCyauMaHOY2gIEEBp882+WdWPIqrPYTYeo
         +FCdIl1YlQZNup5yIRgISJ5AMAKlSwflTvDN2YYxCXUWiDiYWH9h799tEd0kBUKtkQFE
         mcfhn+9oQNLLlsmpUDK88FII4rjoCKvZKAF9BUDJ96PAtSvX4QyOM8gt1rxp9txzHJxf
         BSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478269; x=1790083069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6aaaKNzMayGmjMwZUrTAjDsf1dO37tc7Q4XOVkfUDkI=;
        b=zHguepcCqh0YQaLWp1hX8qEUBsJ//XjGvprqPOezVpeI6xtmKWjK98HuLzOuUrtfXZ
         6HHko3ObiYoEPD4/PyD3WRHxNNaMGp5XlX/aAk3NwlQIbdIiUhu9gBjxOQbheGzcLbl9
         YfhH3AHnSBuUr/uJoxCSQMqP7H4jLgiBJu2DSggmPvcak0+TS7wzlODWMhurAZJe1L5a
         xXLvBqYh48CHpTGNy3JfNO282xG8IBOBU/Xh4wTeEOSAfKwgEAsqjVKHFA74GpTPysg2
         NxR4iEGkMwcIMrdsOippf7TYxvgLUN2A6YZUJ6D5babYC7hG+OHgWa93ffqyVhmlx9FT
         nXOg==
X-Forwarded-Encrypted: i=1; AKwUvBx7ta9hS6feF3rqXJwbqdCPeBCLbt53UASyQrv9FTcbH6etIb6xcKpuh2MZo5q0x42+x9XdG8xQc+E=@lists.xenproject.org
X-Gm-Message-State: AFuF++kPxHmlgdAFuG7mNO2uPoyoJ3W0qY6e5/HOO25kNkUW9pLjaAtZ
	AdCjCOC9Zs2zYmujtUgEyMMnwz6pkF5ZuoR8xFWU57ffu0uZ46A3cHE7O6TGdDF51yI=
X-Gm-Gg: AYBFou18IYIGTf+6ZOEoKPfqViPwaOY+Emf6H2Z0pP3n95/QGdsMGc9uK9AvpMCnWFT
	OR1Jm4b6Lb7a4eLv0BSD+qC0hunvjLXkpLkraRUjnQ0vA9mH2Cs+0GrhfMK5eKiUqBPGHJ8KZ0L
	I/kxlENTtViAy9WDCzutCqtmtR/hvSdCwW6EPX987Y2sN8xZ2kcq6b1zyGN3MFNDRdrAh32HkmV
	KfXNbG/qBmx4sQ1e9962z2ROmnV9M7WpGIOLYlUHK17Jy2Ay753eBaZ2ZUVOgVgPpqtXJJnyqSt
	nglBsimGAKOrzZgc5dj3eyK/7ksP+wK6NuNdcJNONALYZmDY3iv9rM6Il+fZ13B1XJIxx+W8Hfu
	NtdYpysxZFMlhngT3i16tFGQ53SHDUxkcl6TpN3gaVeJqaCMBaPewRxX4mqi70p55d2CLahJc6V
	e1EfscCmSzZGGUEiaP+Ns5NmgZ9uPNLosEgPob936LdmZg4G5rXe1VMeAvrcyknqTTib398ozW6
	7cjJFiVkg3nd/rSHQpPjK+uWoxkRZl8KXsWiym72l6gl/Icr3iYAVVy
X-Received: by 2002:a53:ac8d:0:b0:66f:c1bc:c08e with SMTP id 956f58d0204a3-6715cbfa390mr343734d50.86.1789478267673;
        Tue, 15 Sep 2026 06:17:47 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 15 Sep 2026 13:17:28 +0000
Subject: [PATCH RFC v3 01/13] entry: Pass pt_regs to
 irqentry_exit_cond_resched()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rcu-tasks-preempt-qs-v3-1-0ad30c4c5ee7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789478262; l=4149;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=4dQuHlI7KqFK9OlS3RCAgATHNrdOmuvuGUsCmQTn02w=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEWkL7am6CPwY8WEkFAeUlQhZwIsKFKiG0LL4CTUEuVNlpBbsncWTVxiTecESmw1XMIxu5wivHh
 xkMDa7QjuUgk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ebf023/1789478270-50CDFB50-912E103E/0/0
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
index 0bb6c03481fa..b811b469b0a7 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -346,21 +346,21 @@ typedef struct irqentry_state {
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
@@ -465,7 +465,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
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


