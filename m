Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B267C88E53
	for <xen-devel@archiver.kernel.org>; Sun, 13 Sep 2026 03:08:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1419463.1646608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5aZC-0008R0-73; Sun, 13 Sep 2026 03:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1419463.1646608; Sun, 13 Sep 2026 03:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5aZC-0008Qs-25; Sun, 13 Sep 2026 03:07:42 +0000
Received: by outflank-mailman (input) for mailman id 1419463;
 Sun, 13 Sep 2026 03:07:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KGsc=HF=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 1x5aZB-0008Ql-8W
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2026 03:07:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5aZA-005zYl-2y
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2026 05:07:40 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=KGsc=HF=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 6aa6136a-2eae-0a2a0a5409dd-0a2a4507be8e-8
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 05:07:40 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=KGsc=HF=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 6aa6137a-b4ea-0a2a45070019-aceafc1fcc94-3
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 05:07:39 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7AB1141691;
 Sun, 13 Sep 2026 03:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524621F000FF;
 Sun, 13 Sep 2026 03:07:37 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 15EE5CE0ABC; Sat, 12 Sep 2026 20:07:37 -0700 (PDT)
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
	s=k20260515; t=1789268857;
	bh=KdhlkMkoM3bS0HNmhu6FPeXNMD9uLWI8hS4d5wSjOX4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=CuSv2pXmX2je4sRvmHKKZCalCD4vMRFoFyu9Z7kjqib0HJZ0R96u12SmyJngVxR2d
	 CSNggnMjRbuvaNfpOxA6kKMng4amlgHfCnKyRffj3AMRXMMXauRj9OaXw5P8g9hq4g
	 0Z6jqwCBeRqIaINZKgWOtW/1/1bcaqhLqkyXwoXoLd2+dn2NIgd0vZi2yb8bASDNLv
	 piKOj5Fgnde2tv2VXvS/Qdfwbv8zZb8k7djWMTU3jTaLAmygk5QLxZBQxBQre6yGdu
	 +uOGZV0+QeWDGdOrI+TtWo4puMNcmdgECkEQg0EnCDjhQv4usxIOb1Vf5UzttNUsW+
	 4U1q7S5+5p0zA==
Date: Sat, 12 Sep 2026 20:07:37 -0700
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
	Andrii Nakryiko <andrii@kernel.org>, X86 ML <x86@kernel.org>,
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
	LKML <linux-kernel@vger.kernel.org>, rcu@vger.kernel.org,
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>,
	bpf <bpf@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
Message-ID: <509e8eff-2a9c-4927-956c-73708ee4fe5a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
 <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
 <DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com>
 <14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
 <DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com>
 <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
 <DLDLDGTSBHA0.32TYNBSKKPFXH@gmail.com>
 <8fbfb3fc-cf5d-4dfb-b144-bc021faa13ff@paulmck-laptop>
 <CAADnVQLQs-+-cu2R3QrHppcxOQt9m7Hi+grr4fOnw8m73kQn0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQLQs-+-cu2R3QrHppcxOQt9m7Hi+grr4fOnw8m73kQn0Q@mail.gmail.com>
X-purgate-ID: tlsNG-ef75cf/1789268860-37CD7AE4-D81A7B25/0/0
X-purgate-type: clean
X-purgate-size: 1998

On Sat, Sep 12, 2026 at 04:59:02PM -0700, Alexei Starovoitov wrote:
> On Sat, Sep 12, 2026 at 3:28 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Sat, Sep 12, 2026 at 12:40:55PM -0700, Alexei Starovoitov wrote:
> > > On Sat Sep 12, 2026 at 11:03 AM PDT, Paul E. McKenney wrote:
> > > >
> > > > In the old kernels, yes, we have current->trc_reader_nesting++.
> > > > In the newer kernels, Tasks Trace RCU is instead implemented in terms
> > > > of SRCU-fast, which instead increments per-CPU counters.  Which among
> > > > other thins is a bit faster and does not need to hook into the scheduler.
> > >
> > > old kernels? I'm confused.
> > > rcu_read_lock_trace() in bpf-next is doing t->trc_reader_nesting++
> > > and then calls __srcu_read_lock_fast().
> > >
> > > Are you talking about some RCU branch that you target for next merge window?
> >
> > No, I was thinking of rcu_read_lock_tasks_trace(), forgetting that
> > rcu_read_lock_trace() is still used.  (For good reason, just be clear.)
> > Your comments are quite correct for rcu_read_lock_trace().
> >
> > Hmmm...  Josep's using t->trc_reader_nesting would break for
> > partially overlapping RCU Tasks and rcu_read_lock_trace() readers.
> >
> > But yes, your #5 makes sense:  Deprecate RCU Tasks, upgrade RCU Tasks
> > Trace to check for preemption from within trampolines, and move RCU
> > Tasks users over to the rcu_read_lock_trace() variant of RCU Tasks Trace.
> > (Or am I still missing your point?)
> 
> Pretty much. This way bpf trampoline stays as-is. No extra overhead there.
> rcu tasks users (faultable tracepoints and what else ? )
> switch to rcu_read_lock_trace().
> The only difference for faultable tracepoints is
> extra t->trc_reader_nesting++.

Let's see what the other tracing guys think.

> I have studied the rest of the patches in the series,
> so this proposal can be completely off the mark.

This last is highly ambiguous.  Help?  ;-)

							Thanx, Paul

