Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A428C88E45
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 14:10:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416881.1645869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51xR-0001A9-1D; Fri, 11 Sep 2026 14:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416881.1645869; Fri, 11 Sep 2026 14:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51xQ-00019m-T5; Fri, 11 Sep 2026 14:10:24 +0000
Received: by outflank-mailman (input) for mailman id 1416881;
 Fri, 11 Sep 2026 14:10:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x51xP-000126-UB
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:10:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51xP-003z4F-Ao
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 16:10:23 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40bbd-8faa-0a2a0a5109dd-0a2a4503e874-34
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:10:23 +0200
Received: from [74.125.230.140] (helo=mail-qv2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa40bce-fae8-0a2a45030019-4a7de68ca2dc-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 16:10:23 +0200
Received: by mail-qv2-f12.google.com with SMTP id
 6a1803df08f44-90cdfc9b6ebso8656256d6.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 07:10:22 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939e80dc002sm248697485a.39.2026.09.11.07.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2026 07:10:20 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789135821; x=1789740621; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twz7P/UgrzFqFrDTfXn+06wBF94/L3aT/pnjRwe1Smk=;
        b=hoKiHyXPpEdkAmxkaFLqesjtR7ZQTrvQdjPkcZNR2MKL+ZkiSoGBpTPqZbdNTNwKJe
         D1mk9tr4j21JeS2/g60tA5fTHO+SWy0WC6ATq+R2dYE/VTp92lHRsvbhb7wzLLrEkyiP
         UvCGMGPi0RkLupFO1BvJNnlLCJNV4j92QLFmujcFVywhap9RezF4G7eUtIpWMfM1ZNn/
         LvVThs6oA6R9+3f1XIkqZdToX+DTLyRGWOG9lnrmiRq5pK1Mw9LCo+AeZSNeKsOnqWhm
         DSLExGaCdjDOj+I9H37tFOg0ssDBV8+eBZsus/0l9CqIYYZ1zD+R8WaokLogLBLML2/S
         SNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135821; x=1789740621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twz7P/UgrzFqFrDTfXn+06wBF94/L3aT/pnjRwe1Smk=;
        b=itZ6LFyZ9k/OpGr3Y9vuO1FtANIKLB08wWXFfd+ujqRsLzLeLhFFNoOwWKWzDcQ/0B
         WsDhpk1AVrIsuKxDVnZCLBKgZRGXEaqCS+pDxUWnPu8IGi6kNURRN7iko0+D2OhlV+Z0
         0x+MFPdhBrm3WEUvSfyyJ+Bb9D+EfglggMaa6l87gx57F/2y0CycEd9PrCB1CO8WTBr8
         7eCIFSGxvNxtFGwU7eYkWn4wEridfvVCuu1Uc1V3S0ypGcU6PamUjKqeuzehglWeDsXW
         sZmpwOy16J9b3EJiBiT9lQAiEn6ATtW3DF8MUV4sHZV/jLDor/iEtdoUxyx48NoxsJlP
         GGdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmJ3b2VFfQbjAPqM/r1pP2ky1CM6FesUNQya5rNMQreWnquiaWBb9UOuwtombDxNVlpF2FdNSqVDw=@lists.xenproject.org
X-Gm-Message-State: AFuF++k2EarBBY1xLrViVI6a6VskujzpljK72HLhKMeHdZNKyfJCVF6d
	aqBrKQDTrH7UZZk+N52mUkhttcWKOp8uCCCjnJ3M6t11PURuJU1TiE2DlairAcBiGDQ=
X-Gm-Gg: AYBFou2yeglpB9bXMKdYpMqHqeRfZrzIOjQdSr9XKp0o1+/bVGWMlW9OtVCQGGmobTj
	42N3b785dA5FabbnrncXJnW3rP6Ziyvvvg+a5v5rjeyGzgBjYGEH6CvS+BHnlBIUEJNXx67R6OT
	wB1upluLiPPZFA6lvn5NvpYS5Q2CocMa/c7VpB6xhMGtW0RUgu5wpL+Cbf38L9I1Nchhz5Tffx6
	iodXjU4onac+rppWXx/Z1sIKB1YdeIhqVpL7eUjloBVbsh59p/nqBvCUB36KhoJtKJZa9WrOpie
	iBn84UbPjwlgBpUjvC9bAtYDGslK9nayhMZkKfggAqLvJZlvB+wo7qb0oF9XN+7AYERp1+J30wS
	Hit7hfrIR1sY/7XaXkqaDo7JMvaoi5nD4xvZ2jgxdYRRMfKhdz8QhsBKspiFwfnxkicl65ZC1lB
	COV2QU1rD4gTQCFE6FmSNJepz6ecSRSFeUKHhykQamIsjY0v+yVM9i/oWQInr3qOgZDJdwcEma8
	bmKXtK52DNyb+dkXZPV51yWSx1wT64VI/mn1Ta4EJmN7N+wTAqGtfNg
X-Received: by 2002:a05:620a:690e:b0:939:639b:2e1f with SMTP id af79cd13be357-939ea04922amr525733885a.7.1789135821311;
        Fri, 11 Sep 2026 07:10:21 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:50 +0000
Subject: [PATCH RFC v2 12/15] rcutorture: Bracket Tasks RCU readers with
 trampoline nesting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-12-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135737; l=1492;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=c9hUQ9kAAl2b2IbncqDZq1k2ejJxuc1g83EyvfAIkis=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDpeCdAsuDTbsWwi8oqAy5KN1IjS7Ye/ysM/qLEJAJ0SGsvHuCkttXUFQ2AlX09A0IwbwXmGUQ4
 qHaGMzc7/Vgg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-33051d/1789135823-74C884E9-3CC7C0AF/0/0
X-purgate-type: clean
X-purgate-size: 1494

rcutorture's tasks flavor models a Tasks RCU reader as "any stretch of
kernel code", and rcu_read_delay() deliberately preempts inside it to
check that a preemption does not end the read-side critical section.
Once preemption outside a trampoline becomes a quiescent state that
model no longer matches what Tasks RCU protects, and the readers would
report false too-short grace periods.

Have tasks_torture_read_lock()/unlock() raise and drop
current->rcu_tramp_nesting so the reader models a trampoline, which is
the thing Tasks RCU actually guards; the deliberate preemption inside it
then continues to be, correctly, not a quiescent state.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/rcu/rcutorture.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 794937e13e7c..df6dd708cea7 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1144,11 +1144,17 @@ static struct rcu_torture_ops trivial_preempt_ops = {
 
 static int tasks_torture_read_lock(void)
 {
+	/*
+	 * Model a trampoline: with CONFIG_RCU_TASKS_PREEMPT_QS a preemption is
+	 * otherwise a quiescent state and rcu_read_delay() preempts on purpose.
+	 */
+	rcu_tasks_trampoline_enter();
 	return 0;
 }
 
 static void tasks_torture_read_unlock(int idx)
 {
+	rcu_tasks_trampoline_exit();
 }
 
 static void rcu_tasks_torture_deferred_free(struct rcu_torture *p)

-- 
2.55.0


