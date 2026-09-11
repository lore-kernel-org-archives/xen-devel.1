Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9D7C88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 18:46:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417762.1646391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x56Gb-0002M2-CR; Fri, 11 Sep 2026 18:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417762.1646391; Fri, 11 Sep 2026 18:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x56Gb-0002Lv-9m; Fri, 11 Sep 2026 18:46:29 +0000
Received: by outflank-mailman (input) for mailman id 1417762;
 Fri, 11 Sep 2026 18:46:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MCJj=HD=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 1x56Ga-0002Ln-56
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 18:46:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x56GY-006Y5d-U3
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 20:46:26 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=MCJj=HD=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 6aa44c7e-8faa-0a2a0a5109dd-0a2a4503d480-8
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 20:46:26 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=MCJj=HD=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 6aa44c81-fae8-0a2a45030019-aceafc1f9768-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 20:46:26 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 79CD3410C6;
 Fri, 11 Sep 2026 18:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E991F000FF;
 Fri, 11 Sep 2026 18:46:24 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 17178CE1902; Fri, 11 Sep 2026 11:46:24 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789152384;
	bh=BEH5L0y3LixWWPpE999YsoF8vwfZIA/JtkIUSaMP+LE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=M9R+fJHeZmy6WEfJ+D6CNLH+c3kjB5rut7ErP2+h8nVsKa7j3etNfbwtdp8rS80MS
	 fPhFABuFdrUdvOlZdTQAQCr61orU4wm/RjC2OU7poW1VrwvZyfgZGrC+qE1sarkPq0
	 QuxzQZPObBkWqJyMQach0VVskbIlHcGS9oQDOKxfOvJgnVD5bycCjFRDIgaYdLH17Q
	 UJmHrZwzXcEdIcRWoMRdQtTKfYNAHGRWaw/E2J3Bjse6JBE5JIuSHCfhhwe6AtNnRq
	 Z179pIn76KHvhsX6T+IKzErceu3YloUEBWmwjn5CgynJh7djSuiFdwsOpDYYGmPtoi
	 fH4mBz7X+Zqjw==
Date: Fri, 11 Sep 2026 11:46:24 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
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
Subject: Re: [PATCH RFC v2 15/15] rcu-tasks: Kick running holdouts through
 the scheduler
Message-ID: <78c438b0-9c9a-4307-a6f7-19e69adc20c0@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
 <20260911-b4-rcu-tasks-preempt-qs-v2-15-eaaa61ed2da4@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-b4-rcu-tasks-preempt-qs-v2-15-eaaa61ed2da4@toxicpanda.com>
X-purgate-ID: tlsNG-33051d/1789152386-6C8DD4E9-89564143/0/0
X-purgate-type: clean
X-purgate-size: 3285

On Fri, Sep 11, 2026 at 02:08:53PM +0000, Josef Bacik wrote:
> A holdout that is running on a CPU with nothing else runnable is only
> preempted if the tick acts on rcu_request_urgent_qs_task()'s flag, and
> there may be no tick.  Now that a preemption outside a trampoline is a
> quiescent state, have check_holdout_task() call resched_cpu() on a
> running holdout as well, so the scheduler IPIs it and it goes through
> __schedule() and reports (or, if it is inside a trampoline, does not
> report) its own state with purely local ordering.  Nothing reads a
> running task's rcu_tramp_nesting remotely.
> 
> Only under CONFIG_RCU_TASKS_PREEMPT_QS; other architectures are
> unchanged.
> 
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Much better!  But please see below.

							Thanx, Paul

> ---
>  kernel/rcu/tasks.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
> index ba432bd922e2..02d2592ab7a3 100644
> --- a/kernel/rcu/tasks.h
> +++ b/kernel/rcu/tasks.h
> @@ -1038,8 +1038,18 @@ static bool rcu_tasks_preempted_qs(struct task_struct *t)
>  {
>  	return task_call_func(t, rcu_tasks_switched_out_clean, NULL);
>  }
> +
> +/* Make a running holdout pass through __schedule() soon, tick or no tick. */
> +static void rcu_tasks_kick_running(struct task_struct *t)
> +{
> +	int cpu = task_cpu(t);
> +
> +	if (task_curr(t) && cpu_online(cpu))
> +		resched_cpu(cpu);
> +}
>  #else
>  static bool rcu_tasks_preempted_qs(struct task_struct *t) { return false; }
> +static void rcu_tasks_kick_running(struct task_struct *t) { }
>  #endif
>  
>  /* Per-task initial processing. */
> @@ -1219,6 +1229,7 @@ static void check_holdout_task(struct task_struct *t,
>  		return;
>  	}
>  	rcu_request_urgent_qs_task(t);
> +	rcu_tasks_kick_running(t);

Something I learned the hard way, though Google paid most of the tuition
for this lesson:  There can be a *lot* of tasks on large systems, as
in hundreds of thousands of them.  If these tasks are consuming CPU in
very short bursts, we could easily repeatedly invoke resched_cpu() on
the same CPU, and all invocations other than the last one are redundant.

I instead suggest doing something similar to force_qs_rnp(), where a
cpumask is accumulated and at the end resched_cpu() is invoked for each
CPU with a bit set in that mask.

Of course, if a CPU appears twice while traversing the tasks list, then
each of those tasks did a context switch, which would have reported a
Tasks RCU quiescent state.  Unless those tasks happened to have non-zero
->rcu_tramp_nesting at that time.

Which suggests that each task have a pair of counters.  Or that
rcu_tasks_trampoline_exit() should check for zero ->rcu_tramp_nesting,
and report a quiescent state at that point.

Either way, if a CPU appears only once in the tasks_list traversal,
hitting it with resched_cpu() makes sense.  Though we might also
need to suppress calls to resched_cpu() for grace periods that are
(say) less than one second old.

Thoughts?

							Thanx, Paul

>  	if (!needreport)
>  		return;
>  	if (*firstreport) {
> 
> -- 
> 2.55.0
> 
> 

