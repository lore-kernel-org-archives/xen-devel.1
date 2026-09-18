Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45831C982DF
	for <xen-devel@archiver.kernel.org>; Fri, 18 Sep 2026 14:50:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1425514.1649500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Zum-00089q-KA; Fri, 18 Sep 2026 14:50:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1425514.1649500; Fri, 18 Sep 2026 14:50:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Zum-00089d-E4; Fri, 18 Sep 2026 14:50:12 +0000
Received: by outflank-mailman (input) for mailman id 1425514;
 Fri, 18 Sep 2026 14:50:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x7Zul-0007jO-12
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 14:50:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7Zuk-00H86X-Dy
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2026 16:50:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aad4f95-bab6-0a2a0a5309dd-0a2a450c97a2-30
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:50:10 +0200
Received: from [74.125.230.140] (helo=mail-qv2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aad4fa1-f479-0a2a450c0019-4a7de68c96db-3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 16:50:10 +0200
Received: by mail-qv2-f12.google.com with SMTP id
 6a1803df08f44-910704e63a9so3889226d6.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Sep 2026 07:50:10 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9125802d79bsm13900886d6.24.2026.09.18.07.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 07:50:06 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789743009; x=1790347809; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+PbvTl7j6crAVqwwSi1N6wOs6bBuNm88XPaAXlYwG4=;
        b=sXcL3pFGVgeuE0lXG7/9XBlY3HQ6gJKvg/8Cc9C2cksY/3BQejrWKQVq71UmsJcDu4
         CP0Pdmso4SjOcKtX3/gJYP2BN3uRYxe9+0Hw6MtTA1bKV9hjeQJ30vmGcAEmpWhYDNyl
         U+fN0GnGjLw0XH/x6L3oKEpkAlVI2nv8Oz3LIi1CeuaE4e9Ie1AZ7Hy8s5e2tW1t8lnS
         kG7i0kNUuW8nNvUVvYlgdsxw9NtKVhLZiZWIbDry8yTXfz18FcNnZOEixj2UqysuaU5w
         9J5ffXJWSFKjE7cyqhmaCQ8ZLkscQ97E72/7DPxA1m4rSNQYtIkrY9Tdt6bWjuBF4wFL
         0BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743009; x=1790347809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+PbvTl7j6crAVqwwSi1N6wOs6bBuNm88XPaAXlYwG4=;
        b=yElr8aszEA56Prl1trERMJauTUY04i3pDQnZNbOdaXcYYxTX+FVpt+6k2NfwxQxQyF
         X8nEXcZMpKks/+OM0Y0mhLBE5joIXfU3j5LXTJ/HG2nxtzUZDoC9qP5nJxNUhb+Gs3Vo
         lIdGIaOZdmF8Az3OVtcnGIEItLqZM+lcTaxad7rmDYuuZm6ce0sem43feMGR+sZijHnh
         9Wn/L5JTFxP8skwGHM0C5u6kK36rmj/5Wcou/BUoaC48LTlXsX8nBxopKFVFXih5zW8k
         87JDPvF70ElJfffMlNHbiDKV5sqwqXV+fdyoGukIfPXOpJZCU0Izo+Q4zcCGMfFIgQxJ
         dC5A==
X-Forwarded-Encrypted: i=1; AKwUvBwiZtVVEZkU6vRCIkQlehdbJEiC9owMB/5VXZ4okBKze6BONqVeixNBZDuYYrTI2r7oQDgN2PDKoag=@lists.xenproject.org
X-Gm-Message-State: AFuF++kJFpR6BmRhYwRKuHe7bS5Xzuo1JSkFLjA+9dGJOXTRMp4s/bSx
	NnWHo65jSMqqSSDQAXqadHAYwcp3o2h2XfUhXdfqHS4DUC/P/8XqSNtEbE5KLAfANtY=
X-Gm-Gg: AYBFou2yN94QrQph2i8CxR89mH7czovlVxrdHQITrsrQ0Pml2zpnpNOP6gQfzq2Cwi9
	ud5ATIYO7DASxMJ/hUZT/gDRnEWk/FXdUCJTYa+LtCYcmjJBdo3WGZi92oLFiZAoAhKmHq42Lvh
	Ea93pkbG7WrMLBk7dupZqlBsveK5m/PiB122K8SMKmzZDUPfJ+m8gZrouFiiXLNVVll77ISAXXH
	2aD/55rh+T/L8CP2lJgyGKrcGjX7HvL+AVcisA27IXElOykfhJYxXcbyitrjIzH4NXRl6D2JAGi
	xW/XnBbtg8xhyluoN+spT9Dam0hXggZIEfpuQ2Ri1IAyiWSeuRkKruFmZh/IdVoRIlfKMP/y9Uh
	zoAVvqpiQsy8BNPSoPFU8uOVeyfJRt1cuCDJw9Wm+MjY8s64PDUqgN+T5CjXOPvTZs+Hqatjsfx
	qV0r9lcJSMUBAUp3ftVIbo82QWY9Nfj95Mg/J1wZkj6MsIaIgaHz+jUnA+ac9l0j8ncIlSvOn49
	yEfhD2gUSUR93hbjiS1ajQT7YjmKyTCodIz+ekGxCZY3N222ucaXh7hfA==
X-Received: by 2002:a05:6214:ca6:b0:912:3d05:eb11 with SMTP id 6a1803df08f44-91254e4feadmr40041586d6.5.1789743008667;
        Fri, 18 Sep 2026 07:50:08 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 18 Sep 2026 14:49:31 +0000
Subject: [PATCH RFC v4 12/13] rcu-tasks-trace: Assert no reader is held on
 return to userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-b4-rcu-tasks-preempt-qs-v4-12-63f0e9d69661@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789742980; l=2581;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=FRa7j81kn+FZifN+tU/RXt2NlHMQaOXWqjJvWoyULIE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAsi6H715Q7GMOS9YXNtKesBwx2lesjeCIIWVvPLg8W7bMTSPfSKqF2zG8KnHJqpv18BR10X5Rc
 7g2eq40cmPAk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d25034/1789743010-00ECAA5B-BB1B51ED/0/0
X-purgate-type: clean
X-purgate-size: 2583

With trampolines now taking rcu_read_lock_trace() open-coded from
assembly and JIT-emitted code, an unbalanced reader would silently
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
index e19b41ee6b18..d42568a488a7 100644
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
index 273c59a03251..6034c6b19479 100644
--- a/include/linux/rcupdate_trace.h
+++ b/include/linux/rcupdate_trace.h
@@ -211,6 +211,12 @@ unsigned long rcu_tasks_trace_batches_completed(void);
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
@@ -220,6 +226,7 @@ static inline unsigned long rcu_tasks_trace_batches_completed(void) { return 0;
 static inline void call_rcu_tasks_trace(struct rcu_head *rhp, rcu_callback_t func) { BUG(); }
 static inline void rcu_read_lock_trace(void) { BUG(); }
 static inline void rcu_read_unlock_trace(void) { BUG(); }
+static inline void rcu_tasks_trace_assert_idle(void) { }
 #endif /* #ifdef CONFIG_TASKS_TRACE_RCU */
 
 DEFINE_LOCK_GUARD_0(rcu_tasks_trace,

-- 
2.55.0


