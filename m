Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91AAEC88E53
	for <xen-devel@archiver.kernel.org>; Sat, 12 Sep 2026 18:03:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1419118.1646554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5S4h-0002wV-9a; Sat, 12 Sep 2026 18:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1419118.1646554; Sat, 12 Sep 2026 18:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5S4h-0002wO-6e; Sat, 12 Sep 2026 18:03:39 +0000
Received: by outflank-mailman (input) for mailman id 1419118;
 Sat, 12 Sep 2026 18:03:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D5ov=HE=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 1x5S4f-0002wG-Qv
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 18:03:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5S4f-005Ein-6k
 for xen-devel@lists.xenproject.org; Sat, 12 Sep 2026 20:03:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=D5ov=HE=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 6aa5937a-8faa-0a2a0a5109dd-0a2a45068234-48
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 20:03:37 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=D5ov=HE=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 6aa593f7-195a-0a2a45060019-ac6904fee466-3
 for <xen-devel@lists.xenproject.org>; Sat, 12 Sep 2026 20:03:36 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E919360235;
 Sat, 12 Sep 2026 18:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932741F000FF;
 Sat, 12 Sep 2026 18:03:34 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 56CBCCE0D0D; Sat, 12 Sep 2026 11:03:34 -0700 (PDT)
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
	s=k20260515; t=1789236214;
	bh=Md9WelEldZZ4Ti1nbWtYRKkv5dq5cYQ/RxA8am4GwnA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=kSa5DrkkkUmOilrNwX8mCGTqIsVDmG5EHpntNkCXDmLMOllg43ob3k/ThGbGJ9EOG
	 GARY19upGTuRE1Z4eHkz1Wvr/pU5U8dSsgtRFzDs3B1890zirBY0fVY9lekehb1eC4
	 lEtYA5YNUS7yDDcmIeYb05T5XJIyLG1HuqMX1ALJjTQaweV716mJCM7q5ZUOwyNDNx
	 OG9WQMhVUIccN/ZzFvHBcatxhIaI/BrWinZy8c+glAV356FR3lOev4fQD+T+i/dDMj
	 +EO98mhLF5amoi6CfZZNA4U9OdWRITDloRaUVRbTUpAwzpkn+XnrUjiLLJjsaRKGbz
	 +pl8bxVsU6yvw==
Date: Sat, 12 Sep 2026 11:03:34 -0700
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
Message-ID: <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
 <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
 <DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com>
 <14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
 <DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com>
X-purgate-ID: tlsNG-16d1c6/1789236217-F4A0477B-E31C0A24/0/0
X-purgate-type: clean
X-purgate-size: 4943

On Sat, Sep 12, 2026 at 10:18:48AM -0700, Alexei Starovoitov wrote:
> On Fri Sep 11, 2026 at 10:10 PM PDT, Paul E. McKenney wrote:
> > On Fri, Sep 11, 2026 at 08:27:56PM -0700, Alexei Starovoitov wrote:
> >> On Fri Sep 11, 2026 at 7:08 AM PDT, Josef Bacik wrote:
> >> > Emit an increment of current->rcu_tramp_nesting once the trampoline's
> >> > frame is set up and a decrement before the final register restore, so
> >> > that a task preempted while running fentry/fexit/fmod_ret/LSM programs
> >> > or the __bpf_tramp_enter()/__bpf_tramp_exit() glue is not treated as
> >> > Tasks-RCU quiescent.  Drop the count around the call to the original
> >> > function: that may run arbitrarily long without sleeping and must not pin
> >> > a Tasks RCU grace period, and the trampoline frame above it is held by
> >> > im->pcref rather than by Tasks RCU (see bpf_tramp_image_put()).  The
> >> > fmod_ret early-exit branch and the ip_after_call -> ip_epilogue poke both
> >> > skip the decrement/increment pair around the original call, so the count
> >> > stays balanced on every path.
> >> >
> >> > The sequence is "mov r11, gs:[current_task]; inc/dec dword [r11 + off]";
> >> > r11 is scratch at every emission point and (u32)&current_task is a valid
> >> > sign-extended %gs-absolute with the current per-CPU layout, the same form
> >> > the JIT already uses for this_cpu_off.  The image is dynamically
> >> > allocated text, so the instructions outside the bracketed region are
> >> > covered by the irq-exit IP check.
> >> >
> >> > Assisted-by: LLM
> >> > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> >> > ---
> >> >  arch/x86/net/bpf_jit_comp.c | 43 +++++++++++++++++++++++++++++++++++++++++++
> >> >  1 file changed, 43 insertions(+)
> >> >
> >> > diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> >> > index 2853e87797a7..a375c1b7bd50 100644
> >> > --- a/arch/x86/net/bpf_jit_comp.c
> >> > +++ b/arch/x86/net/bpf_jit_comp.c
> >> > @@ -722,6 +722,31 @@ static void emit_indirect_jump(u8 **pprog, int bpf_reg, u8 *ip)
> >> >  	*pprog = prog;
> >> >  }
> >> >  
> >> > +/*
> >> > + * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().
> >> > + *
> >> > + *   mov r11, QWORD PTR gs:[current_task]
> >> > + *   inc/dec DWORD PTR [r11 + offsetof(struct task_struct, rcu_tramp_nesting)]
> >> > + *
> >> > + * r11 (AUX_REG) is scratch in the trampoline at every point this is emitted.
> >> > + */
> >> > +static void emit_rcu_tasks_tramp_nesting(u8 **pprog, bool enter)
> >> > +{
> >> > +#ifdef CONFIG_TASKS_RCU
> >> > +	u8 *prog = *pprog;
> >> > +
> >> > +	/* mov r11, gs:[abs32] */
> >> > +	EMIT2(0x65, 0x4C);
> >> > +	EMIT3(0x8B, 0x1C, 0x25);
> >> > +	EMIT((u32)(unsigned long)&current_task, 4);
> >> > +	/* inc/dec dword ptr [r11 + disp32] */
> >> > +	EMIT3(0x41, 0xFF, enter ? 0x83 : 0x8B);
> >> > +	EMIT(offsetof(struct task_struct, rcu_tramp_nesting), 4);
> >> > +
> >> > +	*pprog = prog;
> >> > +#endif
> >> 
> >> It's not a lot of overhead, but I feel it will be the death by thousand cuts.
> >> rcu_read_lock_trace() in bpf_prog_enter_sleepable is doing the same thing...
> >> increamenting a variable inside current.
> >> Can they be combined? Like treat current->trc_reader_nesting > 0 as
> >>  current->rcu_tramp_nesting > 0 ?
> >> Or replace one with the other?
> >> Two current->foo++ operations look redundant.
> >> 
> >> bpf trampoline is already quite heavy. I'd like to find ways to reduce
> >> its overhead instead of adding more.
> >
> > Replace rcu_read_lock_trace() with Josef's rcu_tasks_trampoline_enter)?
> 
> If necessary...
> what I don't understand why we need another rcu_tasks_trampoline_enter-like counter.
> Can existing rcu_read_lock_trace() current be used ?
> It's already doing current->trc_reader_nesting++
> so use that as a signal ?

In the old kernels, yes, we have current->trc_reader_nesting++.
In the newer kernels, Tasks Trace RCU is instead implemented in terms
of SRCU-fast, which instead increments per-CPU counters.  Which among
other thins is a bit faster and does not need to hook into the scheduler.

So we have several ways forward:

1.	Revert the implementation of RCU Tasks Trace in terms of
	SRCU-fast, and use the existing current->trc_reader_nesting++,
	as you suggest.

2.	Deprecate RCU Tasks Trace entirely in favor of RCU Tasks
	augmented by rcu_tasks_trampoline_enter() and friends, as
	I was suggesting.

3.	Implement rcu_tasks_trampoline_enter() in terms of SRCU-fast,
	keeping the speedup, and put a synchronize_srcu() in the
	RCU Tasks grace-period mechanism.  This again deprecates
	RCU Tasks Trace entirely in favor of the augmented RCU Tasks.

4.	It is always good to explicitly state the apparent status quo,
	which involves redundant trampoline entry/exit overhead.

5.	As always, your additional ideas here!

							Thanx, Paul

