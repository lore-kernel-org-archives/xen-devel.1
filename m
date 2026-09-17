Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9369CC982D6
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 15:40:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424235.1648839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7EDe-0000Rq-Tq; Thu, 17 Sep 2026 15:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424235.1648839; Thu, 17 Sep 2026 15:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7EDe-0000Rj-QZ; Thu, 17 Sep 2026 15:40:14 +0000
Received: by outflank-mailman (input) for mailman id 1424235;
 Thu, 17 Sep 2026 15:40:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDs5=HJ=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 1x7EDd-0000Rd-Qc
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 15:40:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7EDd-008e78-0J
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 17:40:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=iDs5=HJ=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 6aac09d2-8faa-0a2a0a5109dd-0a2a4503e446-32
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 17:40:12 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=iDs5=HJ=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 6aac09db-fae8-0a2a45030019-ac6904fe93be-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 17:40:12 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 3666E60204;
 Thu, 17 Sep 2026 15:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81BB1F000FF;
 Thu, 17 Sep 2026 15:40:10 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 98EA8CE1716; Thu, 17 Sep 2026 08:40:10 -0700 (PDT)
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
	s=k20260515; t=1789659610;
	bh=OnYr6zMfa+cOfnhiHI6/0JGoc6S5Gsj1WeIOONeYOVs=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=hcvQWlllk84UctC7FJV5+Iain7lAuduBRO6z+yL3t53gBs3K5x933ujpp6K9IYYo7
	 eCUvlyIqRf/1fHAeUjXgmhAl8T5UIu8zVkdDz7M+8odIRYwbhn2mMScpw6NJ6vKuvo
	 S+HQwwO+z7y/+TIgLsPfDLmkVZcLsd7gORLkKcupTeH6WyCLgszAqZrcH25OiH6w5p
	 hh8beW5jD1BC0KZ5dRJA/WDQ21iYAyRHR0fDNE1CI3UfmJmcxqHhe85nw44QJyfg7E
	 p9qBPzqxanQ07NR44YW6yh/VAu/KEDUuMkUys+s8jvEqk3idTYzwPbBE0vGR+TPz/Q
	 fZmzmQykfpn4g==
Date: Thu, 17 Sep 2026 08:40:10 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>,
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
Message-ID: <8fea176a-0ca0-4a70-8cf9-8240a22359e4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <aqlgxKGk_AEKls_1@localhost.localdomain>
 <edc7cca2-a5c5-455c-8969-ea05dbdb08f7@paulmck-laptop>
 <aqqONH8flTIpOUqT@localhost.localdomain>
 <91687748-0781-4133-baed-43cf82f35ff5@paulmck-laptop>
 <aqqpRoTfywUuTgoC@localhost.localdomain>
 <aqqsAUVV8a1yrQzX@localhost.localdomain>
 <6afb0afe-e7b8-46b4-9fea-2c7cf4791044@paulmck-laptop>
 <aqq0cwvRDsorGwgc@localhost.localdomain>
 <8b73e1b3-0580-4ba9-b2e0-6363e429808d@paulmck-laptop>
 <aqvZwfUVsiEI7q7y@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqvZwfUVsiEI7q7y@localhost.localdomain>
X-purgate-ID: tlsNG-33051d/1789659612-77AF14E9-B56B6AED/0/0
X-purgate-type: clean
X-purgate-size: 2919

On Thu, Sep 17, 2026 at 02:14:57PM +0200, Frederic Weisbecker wrote:
> Le Wed, Sep 16, 2026 at 08:41:36AM -0700, Paul E. McKenney a écrit :
> > On Wed, Sep 16, 2026 at 05:23:31PM +0200, Frederic Weisbecker wrote:
> > > Le Wed, Sep 16, 2026 at 07:55:02AM -0700, Paul E. McKenney a écrit :
> > > > Perhaps in rcu_core() in kernels booted with use_softirq?  I am thinking
> > > > specifically of the checks for deferred quiescent states.  I don't (yet)
> > > > see a need to modify rcu_check_quiescent_state().
> > > > 
> > > > Maybe other places as well.  ;-)
> > > 
> > > Hmm this tracking would have to happen on preempt_schedule() just like we
> > > do for PREEMPT_RCU. Or am I missing something? And then we would need a
> > > list scan of those tasks.
> > 
> > I am thinking of the case where a trampoline is interrupted before entering
> > (or after leaving) its RCU Tasks Trace read-side critical section.  Then
> > there is a softirq handler on the back of that interrupt handler, and
> > RCU_SOFTIRQ is invoked, calling rcu_core().  Specifically:
> > 
> > 	/* Report any deferred quiescent states if preemption enabled. */
> > 	if (IS_ENABLED(CONFIG_PREEMPT_COUNT) && (!(preempt_count() & PREEMPT_MASK))) {
> > 		rcu_preempt_deferred_qs(current);
> > 	} else if (rcu_preempt_need_deferred_qs(current)) {
> > 		guard(irqsave)();
> > 		set_need_resched_current();
> > 	}
> > 
> > Preemption is enabled, but we should not report a quiescent state because
> > we have interrupted a trampoline.  Correct?
> 
> Right!
>  
> > > Or we can build the blocked task list handling, that we already have for PREEMPT_RCU,
> > > when CONFIG_RCU_TASKS && !CONFIG_PREEMPT_RCU. We would just only add tasks when
> > > preempted in .text.rcu_no_qs since rcu_read_lock() would still disable
> > > preemption on normal explicit readers. So I wouldn't expect more overhead due to
> > > that blocked list tracking built since it would rarely track tasks.
> > 
> > Yes, we could avoid the list of tasks by treating the preemption within
> > the trampoline the same as preemption within an RCU read-side critical
> > section, but there might not be an rcu_read_unlock() to clean up.
> > Which could be a problem.
> 
> Ah yes, good point.
> 
> > 
> > Trampolines that transfer control to tracing code could supply the needed
> > cleanup call.  But last I checked, there were trampolines that transferred
> > directly back to the original code, with no opportunity for cleaning up.
> > 
> > Or am I still missing a trick here?
> 
> You're right. So we'll indeed need to reuse the deferred qs points here.

Except this is getting a bit involved.

Don't get me wrong, if Josef is happy to take this on, far be it from me
to stand in his way.  But if not, we should be willing to treat this
optimization as a follow-on effort, whether by Josef or someone else.

							Thanx, Paul

