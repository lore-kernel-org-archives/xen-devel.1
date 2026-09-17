Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245BFC982D0
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 20:20:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424458.1648909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Iam-0005h8-TP; Thu, 17 Sep 2026 20:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424458.1648909; Thu, 17 Sep 2026 20:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Iam-0005gp-MS; Thu, 17 Sep 2026 20:20:24 +0000
Received: by outflank-mailman (input) for mailman id 1424458;
 Thu, 17 Sep 2026 20:20:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frederic@kernel.org>) id 1x7Ial-0005gj-Ga
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 20:20:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7Iak-0075Xx-QH
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 22:20:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frederic@kernel.org>)
 id 6aac4b6c-bab6-0a2a0a5309dd-0a2a4502c3f8-42
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 22:20:22 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frederic@kernel.org>)
 id 6aac4b85-6ca4-0a2a45020019-ac6904fe8efa-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 22:20:22 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E5B52601FF;
 Thu, 17 Sep 2026 20:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B03F1F000FF;
 Thu, 17 Sep 2026 20:20:20 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789676420;
	bh=RXB70s8tC0N4djKhk6YxK6M2sEK0IClm9i5YiNUGtD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FgWzVoH4Tdgc3xbhEiQn7a6FJ/07+ERma5xsfx6CkqdFWA+dhVut+XxWCw+O3cdHo
	 353RpR9YS4TSztc8wrKkHDyD3hOLYGP+SFrzV6RR38x+cCsWQrL4Tkx0apZ1LOlbjD
	 Pw+ePTdyDbLqc4xmPt8BS1hyD5vEys0JA49NovRKLhSpDUz7u0bVIDfae91KAFjAWu
	 Lc2oIXJ0sLEUOn/7zsKrlGx2h278H2Ocj/FRGNmzwEbvq6nCQj5a4GNBMRZ3Brx1y7
	 Mq5DVlrP4IJn0NFAcN7hGMfB3aMSFA7idC83SWUP1zSgwwVqHLkW2tXu3aIDr+xk1O
	 XIViCSjFySfOA==
Date: Thu, 17 Sep 2026 22:20:17 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Andy Lutomirski <luto@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Juergen Gross <jgross@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC v3 03/13] rcu-tasks: Add a Tasks RCU implementation
 for reader-marked trampolines
Message-ID: <aqxLgT41UyA-bV5J@pavilion.home>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com>
 <20260915-b4-rcu-tasks-preempt-qs-v3-3-0ad30c4c5ee7@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-b4-rcu-tasks-preempt-qs-v3-3-0ad30c4c5ee7@toxicpanda.com>
X-purgate-ID: tlsNG-720697/1789676422-F08A42AC-7BEBAFFF/0/0
X-purgate-type: clean
X-purgate-size: 2597

Le Tue, Sep 15, 2026 at 01:17:30PM +0000, Josef Bacik a écrit :
> +static void rcu_tasks_tramp_hold(struct task_struct *t)
> +{
> +	unsigned long flags;
> +
> +	if (t->rcu_tasks_holdout)
> +		return;
> +	raw_spin_lock_irqsave(&rcu_tasks_tramp_lock, flags);
> +	list_add_tail(&t->rcu_tasks_holdout_list, &rcu_tasks_tramp_holdouts);
> +	WRITE_ONCE(t->rcu_tasks_holdout, true);
> +	raw_spin_unlock_irqrestore(&rcu_tasks_tramp_lock, flags);
> +}
> +
> +static void rcu_tasks_tramp_release(struct task_struct *t)
> +{
> +	unsigned long flags;
> +
> +	if (likely(!t->rcu_tasks_holdout))
> +		return;
> +	raw_spin_lock_irqsave(&rcu_tasks_tramp_lock, flags);
> +	list_del_init(&t->rcu_tasks_holdout_list);
> +	WRITE_ONCE(t->rcu_tasks_holdout, false);
> +	raw_spin_unlock_irqrestore(&rcu_tasks_tramp_lock, flags);
> +}
> +
> +/**
> + * rcu_tasks_irq_resched_enter - Tasks RCU hook for the irq-exit reschedule check
> + * @ip: instruction pointer of the interrupted (task-level) context
> + *
> + * Called with interrupts disabled when an interrupt returning to kernel
> + * mode is about to preempt_schedule_irq(), the one context switch that can
> + * catch a task inside unmarked trampoline text.  Record where the task is
> + * parked for as long as it is (rcu_tasks_wait_irq_preempted() looks at
> + * that), and if it is inside such text make it a holdout before
> + * __schedule() reports the quiescent event; if it is not, this is as good
> + * as a voluntary switch for ending an earlier hold.
> + */
> +void rcu_tasks_irq_resched_enter(unsigned long ip)
> +{
> +	struct task_struct *t = current;
> +	struct rcu_tasks_percpu *rtpcp = this_cpu_ptr(rcu_tasks.rtpcpu);
> +
> +	lockdep_assert_irqs_disabled();
> +	WRITE_ONCE(t->rcu_tasks_irq_ip, ip);
> +	t->rcu_tasks_exit_cpu = smp_processor_id();
> +	raw_spin_lock_rcu_node(rtpcp);
> +	list_add(&t->rcu_tasks_exit_list, &rtpcp->rtp_exit_list);
> +	raw_spin_unlock_rcu_node(rtpcp);

I don't think we can do that. This is too much unconditional overhead
on the hot preemption path. rcu_tasks_trampoline_text() should be
a condition here.

And do we really need to maintain both lists? I understand that they
have different purposes.

->rcu_tasks_exit_list is to track preempted tasks on trampoline
->rcu_tasks_holdout_list is to track preempted tasks on trampoline until
                         they ever voluntary schedule()

Can the latter replace the former? I see it's used on kprobes and others
but I haven't checked the details yet.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

