Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D97BC982D2
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 16:56:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424329.1648872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7FOo-0002BC-Eo; Thu, 17 Sep 2026 16:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424329.1648872; Thu, 17 Sep 2026 16:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7FOo-0002B5-CD; Thu, 17 Sep 2026 16:55:50 +0000
Received: by outflank-mailman (input) for mailman id 1424329;
 Thu, 17 Sep 2026 16:55:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDs5=HJ=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 1x7FOm-0002Ay-Nq
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 16:55:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7FOl-0025RJ-NO
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 18:55:47 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=iDs5=HJ=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 6aac1b87-e002-0a2a0a5209dd-0a2a4501a44a-28
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 18:55:47 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=iDs5=HJ=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 6aac1b92-5984-0a2a45010019-ac6904fed37e-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 18:55:47 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 95F76601EF;
 Thu, 17 Sep 2026 16:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EB21F00893;
 Thu, 17 Sep 2026 16:55:45 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 0461BCE1716; Thu, 17 Sep 2026 09:55:45 -0700 (PDT)
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
	s=k20260515; t=1789664145;
	bh=kimfGEK+WeQrCTnIb5ePzNtWXHK0EcqiD+euMxaQ0do=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=T9OE8qLzP1qfh6XFbx+1FEoAjXMXA5nopSdvlfyoaHtqeRG7yuIX6hvGsZ2fZDZHC
	 LlZHivU+VHSNOyLlTJD9LcDm74HSY0oBYS6V98tfaqWPsGPg0x3pT212aZxB1cTj2h
	 H5i+iwmISzuUJTFqG0ROiZDclaI7Dsm5HDgAJBJ1MUlStbHa5H1eEUO5Q0pdnLLmRn
	 bfDIUKXG/xV9fr8ZZBBKeo2cOSk+IR2Blsw1i4L2ofdwxlH5VeRL80zT4LC59Fh7Zv
	 2QJ/t3AdkTEG0yssMOFKDF+buK2RR78k+s/SfH4SFxaON89u5sImLoK7VX3+tMuq4b
	 4hANaNhRy05TA==
Date: Thu, 17 Sep 2026 09:55:44 -0700
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
Subject: Re: [PATCH RFC v3 03/13] rcu-tasks: Add a Tasks RCU implementation
 for reader-marked trampolines
Message-ID: <5734196a-22ab-428e-9565-d7ba787d3eb1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <aqqONH8flTIpOUqT@localhost.localdomain>
 <91687748-0781-4133-baed-43cf82f35ff5@paulmck-laptop>
 <aqqpRoTfywUuTgoC@localhost.localdomain>
 <aqqsAUVV8a1yrQzX@localhost.localdomain>
 <6afb0afe-e7b8-46b4-9fea-2c7cf4791044@paulmck-laptop>
 <aqq0cwvRDsorGwgc@localhost.localdomain>
 <8b73e1b3-0580-4ba9-b2e0-6363e429808d@paulmck-laptop>
 <aqvZwfUVsiEI7q7y@localhost.localdomain>
 <8fea176a-0ca0-4a70-8cf9-8240a22359e4@paulmck-laptop>
 <c51591e0e96c837bcd762c207e5e1869.josef@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c51591e0e96c837bcd762c207e5e1869.josef@toxicpanda.com>
X-purgate-ID: tlsNG-d62444/1789664147-BE27A757-D9F8FAD3/0/0
X-purgate-type: clean
X-purgate-size: 1401

On Thu, Sep 17, 2026 at 04:35:19PM +0000, Josef Bacik wrote:
> On Thu, 17 Sep 2026 08:40:10 -0700, Paul E. McKenney wrote:
> > On Thu, Sep 17, 2026 at 02:14:57PM +0200, Frederic Weisbecker wrote:
> > > You're right. So we'll indeed need to reuse the deferred qs points here.
> >
> > Except this is getting a bit involved.
> >
> > Don't get me wrong, if Josef is happy to take this on, far be it from me
> > to stand in his way.  But if not, we should be willing to treat this
> > optimization as a follow-on effort, whether by Josef or someone else.
> 
> Follow-on works for me. For what it's worth 03/13 is already fairly
> close to what Frederic describes, just outside the core flavor: no
> task-list scan (the GP waits per CPU for a pass through __schedule() or
> an EQS), the irq-exit preemption path checks the interrupted IP and
> queues the task as a holdout before the switch, and the holdout is keyed
> on where the task was interrupted so nothing is needed from the
> trampoline tail. Moving that IP check into the tick / rcu_exp_handler() /
> deferred-QS paths and reusing the blocked-tasks list is something I'm
> happy to look at once this has settled.
> 
> v4 will pick up Alexei's ask (reader emitted by the BPF JIT around the
> fentry and fexit regions rather than in the glue) and the idle-CPU hole
> Sashiko found.

Even better!  ;-)

							Thanx, Paul

