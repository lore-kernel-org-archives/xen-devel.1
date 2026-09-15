Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA90C88E53
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 13:18:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421706.1647408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T2n-0004ez-OZ; Tue, 15 Sep 2026 13:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421706.1647408; Tue, 15 Sep 2026 13:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T2n-0004eq-Lt; Tue, 15 Sep 2026 13:17:53 +0000
Received: by outflank-mailman (input) for mailman id 1421706;
 Tue, 15 Sep 2026 13:17:52 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x6T2m-0004RF-KS
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 13:17:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6T2m-00DQNP-1E
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 15:17:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa94570-e002-0a2a0a5209dd-0a2a450babec-48
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:17:51 +0200
Received: from [74.125.230.205] (helo=mail-qk2-f13.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa9457e-b7e8-0a2a450b0019-4a7de6cdd447-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:17:51 +0200
Received: by mail-qk2-f13.google.com with SMTP id
 af79cd13be357-93a2218d7c2so67884885a.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 06:17:51 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939f19f94a1sm1137880185a.42.2026.09.15.06.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 06:17:49 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789478270; x=1790083070; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVf/c/k7gzeyhXD1Q6M+2DLwLNI40n7fXEqvG2ZQN0k=;
        b=BDHNr5XS265fiyZv+nKnkdGvsCZz+AfecQhqLZ16Lbmq5KXvrTXGPDXjcpVb7K6HuX
         cuBWF4dZhFFusCnoB5VW9GuZ8tztdqGQ3V2FGK5SNKIrT5sWMf3358krpTKSB03uwP6c
         unP0FpBHUVAaTBVjYZaxdqnUFSEJMBKWcytpcXw2UKPhHY3oQ+50hLy5rZp6WFNv8gOR
         aJkEXy9N/wQj94ymlRYTJYo6IqJPQ2XcWp3T7BxrVgZT/HsZ1nbgGGB0fEd+2yKIAn3l
         qefageNO6GA9+qt+pehuW10h3JptI1mDaQQdIGSBDUx6jpxH7pWF71cOTLZkWAQHHrAz
         fSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478270; x=1790083070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVf/c/k7gzeyhXD1Q6M+2DLwLNI40n7fXEqvG2ZQN0k=;
        b=kN5yMI0+fccljiYTyYOb+IqRCpqE1S5tTseaIpHaPUhjFV8jOcbN4RbWc0hC75O8EZ
         1/hOXL7Wf9lvcmfVnLJXQGYMUaue9qiL+n6rfrXdo//gysym4hnYQiuV0+lJvIE5XFTF
         LjDfGTdcpuLIsN/xl4sjG42Jsj1OudKS+P5qYYPUjVOLO008bT1Z0AnSrTajYeoEivTF
         iyV7Nj6wy1smYOCUhaMvklV52ajrx9mXfnY0kKTDSROJvUb8co7jGHIId+2wtGUZskhI
         MJ6KNWrMIH5C6mwwaoiVW9oEok3L1+UtKdXHchQbzYFMnc5yaq9nbdh3SoIVP3+2wldg
         /57g==
X-Forwarded-Encrypted: i=1; AKwUvBwoI2WFvEQtvHwLBZGK5GyhxGBn4JPV7MuseUteg8Be6XtYaMr7Zg00DP94KJzMKxPafALzlU2X1Nc=@lists.xenproject.org
X-Gm-Message-State: AFuF++ndQrZ3sdtlncP2arRnCETmFwrGKl93eFsWlYJQ7gZmTaB/dfdT
	uvViOcwHjPlAwGa0JL+ZEkw194a/z8V4gqwe1ORlTCpe096cYcl4GybEZS0IwL3s2hw=
X-Gm-Gg: AYBFou0Vyz1GL0Z5QwKWbgwF/0rT4E9vB252vhwG1iFRl7RipISlMdXtjMm+Bt7X8oC
	yUrkJLoS/HBfy3Aactj6Ms3gtl7XY7KN0iJ8hj3r56WulBP0emZWTX3x9cAKk2mjvH7XVcx5pqV
	4jR7XONNn/MB4zBzKV4yTQp6jXJWrN8l7fUeeZ4zVRgyJhq+Gf8sS61J0YJdTToiR2xKIG6kC8I
	kCid+AaRiUvjLOBWg+6uOMRalTIPEvCiKAT9W136oeVhkr6uhe0Fk6zyHEOCDl3cSYl3LASuUx0
	julFLt927WzMnPPa2/BvdLLlRx8Un5Hs/g0WzusmEoXAN+I83HTbRBEyLsLR5UZsgTh5xNw0nVl
	3qC+7I8/ImQcsNV4uY3rOdZKWoZXOKT8e8PXO9KZoFw9GBdQnpH/8u/roXyFzScGqwONGfpEs25
	gIFqIbs8VDc2+eotmJug4zacSquL+hpqJxHL6YSEmHdLsuUlXEs+ifyWKbbq5ha5jYab8mT+Bym
	hPi6jkO0L/ws+ydwzQHrGPlfdjSqZIa5WKcXiwL6I3jwxXl8eoa7r6X
X-Received: by 2002:a05:620a:2b8f:b0:936:d00a:4947 with SMTP id af79cd13be357-93a345745demr474274385a.2.1789478269641;
        Tue, 15 Sep 2026 06:17:49 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 15 Sep 2026 13:17:29 +0000
Subject: [PATCH RFC v3 02/13] rcu-tasks-trace: Inline rcu_read_lock_trace()
 and annotate inside the reader
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rcu-tasks-preempt-qs-v3-2-0ad30c4c5ee7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789478262; l=5472;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=WoSDn4ZEoocgxJI9vrvXQ3qPnrz/LPBQsbDWUONxsf4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOqgtWORMkFCOHo3WLOy6WMvyvf/Bd/PX1OTaW4H8LYu/zuiatDpxAZC81QUixDJwPnYFE7C1UL
 57TTusaQZdwg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-42698a/1789478271-1A4DB9EA-5F436B44/0/0
X-purgate-type: clean
X-purgate-size: 5474

rcu_read_lock_trace() calls rcu_try_lock_acquire() before it has
entered the SRCU-fast reader, and rcu_read_unlock_trace() calls
srcu_lock_release() after it has left it.  rcu_read_lock() and
rcu_read_unlock() do it the other way around, annotating strictly
inside the critical section, and rcu_read_lock_tasks_trace() already
follows that order on the lock side.  Make the trace variants match.

Also make them, and the __srcu_read_lock_fast() and
__srcu_read_unlock_fast() they are built on, __always_inline like
rcu_read_lock() rather than leaving it to the compiler, which does
outline all four in KASAN/KCOV builds.

Besides consistency, this means the first thing a caller of
rcu_read_lock_trace() does is enter the reader and the last thing
rcu_read_unlock_trace() does is leave it, with no out-of-line call on
the outside.  A later patch relies on that for callers whose own text is
protected by the reader they are about to take.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/rcupdate_trace.h | 22 ++++++++++------------
 include/linux/srcutiny.h       |  4 ++--
 include/linux/srcutree.h       |  5 +++--
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/include/linux/rcupdate_trace.h b/include/linux/rcupdate_trace.h
index 273c59a03251..4035054309d7 100644
--- a/include/linux/rcupdate_trace.h
+++ b/include/linux/rcupdate_trace.h
@@ -93,22 +93,20 @@ static inline void rcu_read_unlock_tasks_trace(struct srcu_ctr __percpu *scp)
  *
  * For more details, please see the documentation for rcu_read_lock().
  */
-static inline void rcu_read_lock_trace(void)
+static __always_inline void rcu_read_lock_trace(void)
 {
 	int n;
 	struct task_struct *t = current;
 
-	rcu_try_lock_acquire(&rcu_tasks_trace_srcu_struct.dep_map);
 	n = READ_ONCE(t->trc_reader_nesting);
 	WRITE_ONCE(t->trc_reader_nesting, n + 1);
-	if (n) {
-		// In case we interrupted a Tasks Trace RCU reader.
-		return;
-	}
-	barrier();  // nesting before scp to protect against interrupt handler.
-	t->trc_reader_scp = __srcu_read_lock_fast(&rcu_tasks_trace_srcu_struct);
-	if (!IS_ENABLED(CONFIG_TASKS_TRACE_RCU_NO_MB))
-		smp_mb(); // Placeholder for more selective ordering
+	if (!n) {
+		barrier();  // nesting before scp to protect against interrupt handler.
+		t->trc_reader_scp = __srcu_read_lock_fast(&rcu_tasks_trace_srcu_struct);
+		if (!IS_ENABLED(CONFIG_TASKS_TRACE_RCU_NO_MB))
+			smp_mb(); // Placeholder for more selective ordering
+	} // Else we interrupted a Tasks Trace RCU reader.
+	rcu_try_lock_acquire(&rcu_tasks_trace_srcu_struct.dep_map);
 }
 
 /**
@@ -120,12 +118,13 @@ static inline void rcu_read_lock_trace(void)
  *
  * For more details, please see the documentation for rcu_read_unlock().
  */
-static inline void rcu_read_unlock_trace(void)
+static __always_inline void rcu_read_unlock_trace(void)
 {
 	int n;
 	struct srcu_ctr __percpu *scp;
 	struct task_struct *t = current;
 
+	srcu_lock_release(&rcu_tasks_trace_srcu_struct.dep_map);
 	n = READ_ONCE(t->trc_reader_nesting) - 1;
 	if (n) {
 		WRITE_ONCE(t->trc_reader_nesting, n);
@@ -137,7 +136,6 @@ static inline void rcu_read_unlock_trace(void)
 			smp_mb(); // Placeholder for more selective ordering
 		__srcu_read_unlock_fast(&rcu_tasks_trace_srcu_struct, scp);
 	}
-	srcu_lock_release(&rcu_tasks_trace_srcu_struct.dep_map);
 }
 
 /**
diff --git a/include/linux/srcutiny.h b/include/linux/srcutiny.h
index fbcf13bc12d1..a43bae11c81c 100644
--- a/include/linux/srcutiny.h
+++ b/include/linux/srcutiny.h
@@ -101,13 +101,13 @@ static inline struct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu_struct *ss
 	return (struct srcu_ctr __percpu *)(intptr_t)idx;
 }
 
-static inline struct srcu_ctr __percpu *__srcu_read_lock_fast(struct srcu_struct *ssp)
+static __always_inline struct srcu_ctr __percpu *__srcu_read_lock_fast(struct srcu_struct *ssp)
 	__acquires_shared(ssp)
 {
 	return __srcu_ctr_to_ptr(ssp, __srcu_read_lock(ssp));
 }
 
-static inline void __srcu_read_unlock_fast(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
+static __always_inline void __srcu_read_unlock_fast(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
 	__releases_shared(ssp)
 {
 	__srcu_read_unlock(ssp, __srcu_ptr_to_ctr(ssp, scp));
diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
index 75e54e4f963f..fdb42ab50301 100644
--- a/include/linux/srcutree.h
+++ b/include/linux/srcutree.h
@@ -286,7 +286,8 @@ static inline struct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu_struct *ss
  * on architectures that support NMIs but do not supply NMI-safe
  * implementations of this_cpu_inc().
  */
-static inline struct srcu_ctr __percpu notrace *__srcu_read_lock_fast(struct srcu_struct *ssp)
+static __always_inline struct srcu_ctr __percpu notrace *
+__srcu_read_lock_fast(struct srcu_struct *ssp)
 	__acquires_shared(ssp)
 {
 	struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
@@ -309,7 +310,7 @@ static inline struct srcu_ctr __percpu notrace *__srcu_read_lock_fast(struct src
  * Please see the __srcu_read_lock_fast() function's header comment for
  * information on implicit RCU readers and NMI safety.
  */
-static inline void notrace
+static __always_inline void notrace
 __srcu_read_unlock_fast(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
 	__releases_shared(ssp)
 {

-- 
2.55.0


