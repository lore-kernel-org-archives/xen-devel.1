Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0518DC88E53
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 13:18:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421720.1647472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T36-0006fq-97; Tue, 15 Sep 2026 13:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421720.1647472; Tue, 15 Sep 2026 13:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6T36-0006fc-4x; Tue, 15 Sep 2026 13:18:12 +0000
Received: by outflank-mailman (input) for mailman id 1421720;
 Tue, 15 Sep 2026 13:18:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x6T34-0006aV-NC
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 13:18:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6T34-00EGI1-3v
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 15:18:10 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa9458a-bab6-0a2a0a5309dd-0a2a450bc220-40
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:18:10 +0200
Received: from [74.125.230.205] (helo=mail-qk2-f13.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa94590-b7e8-0a2a450b0019-4a7de6cdea8e-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:18:09 +0200
Received: by mail-qk2-f13.google.com with SMTP id
 af79cd13be357-93910ca5aa7so364803685a.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 06:18:09 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93a26921baesm489982785a.24.2026.09.15.06.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 06:18:07 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789478288; x=1790083088; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkP56mJgKixcgLXoBxrfzz0NyJo14L+hjKFrNfKE/2k=;
        b=KsRnxpdM0ubtvKqOAXQ7edwqj91lFxrXbW5a+peC4GCrrs1OGpZmAT02aHMhQwpj2A
         OUl1liAYrNpjr2svthAGkLJJ0v4Or2xTtkrHntMp71Tf/y7HJM8b2wbDhKNyXVMBpsQ7
         /2h2UilfXT5C8Q/RDcBlXCbSYkpwe8OQZ/N5zSIj4a0sgNEIICuSpb1tgCgqnI0l0fAY
         GG0RqzhSQrFprEnrTO3bKy/oAWkZ1TxIOSQ9Q3a+YteTsLxKjeXvseQ1/sYbC6m8TviJ
         spsRj0n/72HuRd/t4lCikc1Ih4D3efe8RCDelK6RxIeM/Jofq6uGkq1AKpoiGS+4Me4R
         8DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478288; x=1790083088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MkP56mJgKixcgLXoBxrfzz0NyJo14L+hjKFrNfKE/2k=;
        b=2xJMNB9VjNxWAxn+hHVVxprkSTSIerT9e5UFG4wZbTXLBpW8Vvwba/nL1sdW8LEpAk
         XskRfS8SM21VSR1zBfDidHCSGmvR1Y83RZRv7qySpsfVdXvl6MtEOeFUO/JTqnoxIbst
         /beNLw8ivkXUTPbE7l4B6Dhp/LLDxkWJpV+e1/a+eaEdHhYXCTG/5gWBc/+57x8DRlYm
         +kmM3FfHtZoIIqrayAnXTVBkOXiS7ZBCoBOs8EVKX6xh+WHrPsYAv8++qNi4eSRu1CNX
         C1iUVY+//+lQ720S1TzFxo12I/lwy4FrfrYEfa12J6KauINvPCMJDr3uXgSh8NuMqDkh
         Bl2w==
X-Forwarded-Encrypted: i=1; AKwUvBz4pR3Eh2yU6DzL7W0xlkk9JouzidaNRBiVMB0ZJpMSGVw86bY9OK0mFfK1Ebwgcyu1X3Cg6tGnreo=@lists.xenproject.org
X-Gm-Message-State: AFuF++mKQ28ibEteFqq9bBG8TCCRNqDDWViO+JiT8zQNQuWJbhZuIQ5Q
	QbMyKUoWGcy6qkCNp7rTRjGL7BaPeisaZbALNnNfVtKi66c2zDNLNbGtW7RX/FdF4vG93Vcdx7V
	Dj6ZJj7yZMw==
X-Gm-Gg: AYBFou2+vmOm3SFLh1kzwU5QoyX6TWL+KBVxUWhG4avFwGvqrmjWbMfIzmXMN9dvMVj
	HWGD0QMUwOelwbKBwsjb9FadJoiOgGO2n7kBuDkzHuGf657p6ri3hDyYwF3jFE4hSMGKgcmKcLQ
	fWx4+XuDrEq8ldsOwqeUMQ0DZ7sOKIOR+eHqQz6yev37k33DS/KUZJ8MOXpVjlnEwsgXBu0t/Dw
	3hsJx/e14zFy+C6wXW2C+P+b1eUM9vl0ejr2z0nIW81S0+nny/fVerHCfCnYhcqPC7dGU4nDQOT
	6NnXnr26NPxmhBl+bcPZFNDowmlmoD7lIfmNs8O+sRtDSQA5HDDoEdAJAaQmGBqEMLunUWggyBC
	GJH4p9SKJmlTEVQ7byt9fR7ExsZ1SE3BBmh1PgHkTDcSjDwS9a3YkB1JCncLl/uZ3ocJb21wwxv
	NCyNJ3qNlEjyZ0BNSL2V42RF9GZL5tcyrlc1dr5xN87IddamR13Fm68LFp68uEYPEgaqysz50nh
	cTVJ1rhsVlUAAxMv2h+3LIg6ZlP/mPPId5LjR80a8AD4yuJBac8rKV0
X-Received: by 2002:a05:620a:1b87:b0:92e:76a1:96cd with SMTP id af79cd13be357-93a297e8f8cmr1159268485a.13.1789478288213;
        Tue, 15 Sep 2026 06:18:08 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 15 Sep 2026 13:17:38 +0000
Subject: [PATCH RFC v3 11/13] rcutorture: Make Tasks RCU readers Tasks
 Trace readers where required
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rcu-tasks-preempt-qs-v3-11-0ad30c4c5ee7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789478262; l=1716;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=O8YdW4YSHUYyF3GwEQN16WzJM7UkZZFfh8RzVwv7xJM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIccOQgqxisnPo/25JJmyx4Bx5hp1tfVVTZrdfU6SlgArQbvK/ARnj8AAoaQqqIY//mIhN1g1fK
 eVSGZVlcF5wA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-42698a/1789478290-1A8D99EA-A78D3724/0/0
X-purgate-type: clean
X-purgate-size: 1718

rcutorture's "tasks" flavor has empty readlock/readunlock hooks because
a classic Tasks RCU reader is simply code that does not block.  Under
CONFIG_TASKS_RCU_TRAMPOLINE_READERS a preemption outside trampoline text
is also a quiescent state, and the thing real readers (trampolines) do
to stay protected across their call-outs is take rcu_read_lock_trace(),
so have the torture readers do the same there.  Otherwise a preempted
torture reader would rightly be treated as quiescent and the test would
report false-positive too-short grace periods.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/rcu/rcutorture.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 794937e13e7c..ab870ef09af0 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1142,13 +1142,23 @@ static struct rcu_torture_ops trivial_preempt_ops = {
  * Definitions for RCU-tasks torture testing.
  */
 
+/*
+ * A classic Tasks RCU reader is any stretch of kernel code that does not
+ * voluntarily block.  With CONFIG_TASKS_RCU_TRAMPOLINE_READERS a preemption
+ * outside trampoline text also ends it, and what a trampoline does to stay
+ * protected across its call-out is take a Tasks Trace reader, so model that.
+ */
 static int tasks_torture_read_lock(void)
 {
+	if (IS_ENABLED(CONFIG_TASKS_RCU_TRAMPOLINE_READERS))
+		rcu_read_lock_trace();
 	return 0;
 }
 
 static void tasks_torture_read_unlock(int idx)
 {
+	if (IS_ENABLED(CONFIG_TASKS_RCU_TRAMPOLINE_READERS))
+		rcu_read_unlock_trace();
 }
 
 static void rcu_tasks_torture_deferred_free(struct rcu_torture *p)

-- 
2.55.0


