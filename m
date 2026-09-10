Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5611EC79FBF
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 18:51:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1415172.1644741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jrj-0007i6-BA; Thu, 10 Sep 2026 18:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415172.1644741; Thu, 10 Sep 2026 18:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4jrj-0007gV-4m; Thu, 10 Sep 2026 18:51:19 +0000
Received: by outflank-mailman (input) for mailman id 1415172;
 Thu, 10 Sep 2026 18:51:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1x4jrh-0007L9-Dn
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 18:51:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4jrg-009F3X-QO
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 20:51:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fc22-8faa-0a2a0a5109dd-0a2a4509ce40-8
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:51:16 +0200
Received: from [209.85.222.178] (helo=mail-qk1-f178.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aa2fc23-be1a-0a2a45090019-d155deb2e929-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 20:51:16 +0200
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-92edb12cdf2so541995785a.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 11:51:16 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com.
 [34.228.114.98]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-939e7f184f5sm49053285a.15.2026.09.10.11.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 11:51:14 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1789066275; x=1789671075; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twz7P/UgrzFqFrDTfXn+06wBF94/L3aT/pnjRwe1Smk=;
        b=a/W+E3oqSR9eqkKr341DAJy1tNKaFaQBR82chod6S1YlxphovVFLNAMXtqIvf8WOvK
         FSQk35n2Wzlxm/D9zLeEY5lh9DgKjyMKron8scWdp6Y9A0j5cmSKLM/kCLFxlDSxPM9D
         QsFSU4p3CqRtKttdxiELkDbyLUy1EOr/GUkP+1yVNbEsi/NjijRlusDHWgE8RkpC0OiH
         WaaSQqnngGs0jCAZfdPqHyobeQCRewa0U9ExLrcvbDDRFQa66LC2r610vdTP+AsYuCtf
         xQbTcKtHoGFlMFYQ/EYB4L4v5MDkmDj24cDaxLtQupeMabo+yPoCTlwZEOyOMVfSf4Pb
         5PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066275; x=1789671075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twz7P/UgrzFqFrDTfXn+06wBF94/L3aT/pnjRwe1Smk=;
        b=WXGKxb3Q6YNYI8yaewDqDgA4cfBiGDsxVNunbLywB8OL2h59szXIn02aO4GCwDPfq5
         wqEZ4uNCg2jzBoJx6q3ZmliL4d8iy34KeBNMg/wRoTrKnFyxvqzVpEGVkvrwH5438hdq
         8HJQN35hy/o+omZiqVGBL3qdZ4U8uIDG6eaL4j2b4gdcc2LiH8jwaavpJkHXNy2h1eDu
         vJcJoVKb5qT2igyvmcMHwdr9g2LHGNcz3tDlGCk85okgP2qQ+BlZ4XjA8CvYN7RC087e
         PkMKNr7M0BhjBlge0p1k9Od6NXv4tKWiSJyE78CzrGursprcNlv5OylekrfQzzr3icyy
         2xlg==
X-Forwarded-Encrypted: i=1; AKwUvBwt8s9YCby8blA7OeByO02KfwWKmF74UYLsZKaTfWTuKj79J8HYl5kVh/j5Ei3z1QxmOh/4svuOiZk=@lists.xenproject.org
X-Gm-Message-State: AFuF++nIhZdcqnTU2jDCVgDUx6JqbvY/NfyPlEeMc69ehZxjWx0x1NAd
	AsCsq/KSc1DwHVubYl9YEvlAHYYU9i0JRv9HLVLsJj3alw5VthsD5pqnJdWrzIvZQG8=
X-Gm-Gg: AYBFou0RWmVthrE8BKK2CB8KD6TfguQimw5kS0qUPLtegP4MWhS9oNTd8LumDYDkC5z
	mOojv4ZWReRZAisyYBUcsTnU2DtBiEGiXctRbwz9cRzKfFIrDiyrvD6MJgL0duMGFkEUpDujlRB
	hxey7RYcXSpAQ6Uv+uNlc1EpzGAVXd/grT0qM0zpdV2jWj3Ocgj4IHCNFV3wWllshbzDkYHm6pq
	OayUsGZSfogqz8I2ZYCnDpj44IFqMjhEw3BQUcMCYFTo/s3Dc3IyZ9NER8YYUhvotLVNLjbYtTQ
	gMNrNQ/qqLZKvu+eDBO38wc0mzyk04z0AdlvlIGv6h9Wo2RE0ZIFxFhBS2ATwyKi7ZVmr7q1XDG
	BvAt/z2qy2jACf0CPgrBKziYSYs8G8qfN7ehSQp8EVZrt2f/d4sQjBmUKxuvwsA0fRvoNKrsTxK
	HWP3fwNu3EZQ+/TVN0HlZdEc/Ct+cq4bqdRHMjzeVw2zdcoeYYYhq+2101pApcMcjtHGco1zrKE
	Hm27BqPM/lKR5zCUglIbdnPzGbmqBxMxzHmI23K0x/RMtf/FZY70sg/
X-Received: by 2002:a05:620a:269d:b0:939:6de9:208b with SMTP id af79cd13be357-939ea2b3827mr16779985a.48.1789066274997;
        Thu, 10 Sep 2026 11:51:14 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:35 +0000
Subject: [PATCH RFC 12/13] rcutorture: Bracket Tasks RCU readers with
 trampoline nesting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-12-d4469f4cc101@toxicpanda.com>
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
X-purgate-ID: tlsNG-bad1c0/1789066276-FC817034-32A0BD17/0/0
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


