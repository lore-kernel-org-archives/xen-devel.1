Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B19C88E53
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2026 22:28:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1419325.1646581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5WCx-0005fQ-Dw; Sat, 12 Sep 2026 22:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1419325.1646581; Sat, 12 Sep 2026 22:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5WCx-0005fJ-AN; Sat, 12 Sep 2026 22:28:27 +0000
Received: by outflank-mailman (input) for mailman id 1419325;
 Sat, 12 Sep 2026 22:28:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D5ov=HE=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 1x5WCw-0005fD-Fr
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 22:28:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5WCv-004fWg-A3
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2026 00:28:25 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=D5ov=HE=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 6aa5d209-e002-0a2a0a5209dd-0a2a45019d6c-0
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 00:28:25 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=D5ov=HE=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 6aa5d206-5984-0a2a45010019-aceafc1f8a64-3
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 00:28:24 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CEDB44B58;
 Sat, 12 Sep 2026 22:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7CDB1F000FF;
 Sat, 12 Sep 2026 22:28:16 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 9A778CE17BD; Sat, 12 Sep 2026 15:28:16 -0700 (PDT)
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
	s=k20260515; t=1789252096;
	bh=FUSC3/6wZp614V0HmSolX31ACddFJPOtZM6hstYDymE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=CAY8iaMRIgUEVj2m8qO5yp0DxUv+P5XvE2wHuZpVgEs1aEJozyptLJbfPwIDKU9cG
	 nZ8lr7em4IssfJNCHthk1CBckof4zi6MPqWd2jJVXxGnpw499vSiEhg0xj7sJOYZgY
	 8C/0OqEOoxtby2igBkVtTcnZDnI6giwDd39+A3lwn/gzgznfonBDHsvuJ+lNWa/070
	 UYnUHAEQ18maKO95GoFBGluciXa8xqJjOpILbWWdTFyb/lqEmdWzQ78VurvGX1Z7Sv
	 KjOJN8mcAIANRvNl//XI9HifNzupXh1acBkdTfKFwO0hryPFkxTNHR9mulXJ+sQ3Rw
	 OD+q87PDNaJpg==
Date: Sat, 12 Sep 2026 15:28:16 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Josef Bacik <josef@toxicpanda.com>,
	Frederic Weisbecker <frederic@kernel.org>,
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
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
Message-ID: <8fbfb3fc-cf5d-4dfb-b144-bc021faa13ff@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
 <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
 <DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com>
 <14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
 <DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com>
 <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
 <DLDLDGTSBHA0.32TYNBSKKPFXH@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLDLDGTSBHA0.32TYNBSKKPFXH@gmail.com>
X-purgate-ID: tlsNG-d62444/1789252105-BDE78757-BBB6BF1A/0/0
X-purgate-type: clean
X-purgate-size: 2150

On Sat, Sep 12, 2026 at 12:40:55PM -0700, Alexei Starovoitov wrote:
> On Sat Sep 12, 2026 at 11:03 AM PDT, Paul E. McKenney wrote:
> >
> > In the old kernels, yes, we have current->trc_reader_nesting++.
> > In the newer kernels, Tasks Trace RCU is instead implemented in terms
> > of SRCU-fast, which instead increments per-CPU counters.  Which among
> > other thins is a bit faster and does not need to hook into the scheduler.
> 
> old kernels? I'm confused.
> rcu_read_lock_trace() in bpf-next is doing t->trc_reader_nesting++
> and then calls __srcu_read_lock_fast().
> 
> Are you talking about some RCU branch that you target for next merge window?

No, I was thinking of rcu_read_lock_tasks_trace(), forgetting that
rcu_read_lock_trace() is still used.  (For good reason, just be clear.)
Your comments are quite correct for rcu_read_lock_trace().

Hmmm...  Josep's using t->trc_reader_nesting would break for
partially overlapping RCU Tasks and rcu_read_lock_trace() readers.

But yes, your #5 makes sense:  Deprecate RCU Tasks, upgrade RCU Tasks
Trace to check for preemption from within trampolines, and move RCU
Tasks users over to the rcu_read_lock_trace() variant of RCU Tasks Trace.
(Or am I still missing your point?)

Josef, thoughts?

							Thanx, Paul

> > So we have several ways forward:
> >
> > 1.	Revert the implementation of RCU Tasks Trace in terms of
> > 	SRCU-fast, and use the existing current->trc_reader_nesting++,
> > 	as you suggest.
> >
> > 2.	Deprecate RCU Tasks Trace entirely in favor of RCU Tasks
> > 	augmented by rcu_tasks_trampoline_enter() and friends, as
> > 	I was suggesting.
> >
> > 3.	Implement rcu_tasks_trampoline_enter() in terms of SRCU-fast,
> > 	keeping the speedup, and put a synchronize_srcu() in the
> > 	RCU Tasks grace-period mechanism.  This again deprecates
> > 	RCU Tasks Trace entirely in favor of the augmented RCU Tasks.
> >
> > 4.	It is always good to explicitly state the apparent status quo,
> > 	which involves redundant trampoline entry/exit overhead.
> >
> > 5.	As always, your additional ideas here!
> >
> > 							Thanx, Paul
> 

