Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D5CC88E75
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 13:13:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421693.1647382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6SyY-0003do-Pk; Tue, 15 Sep 2026 13:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421693.1647382; Tue, 15 Sep 2026 13:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6SyY-0003dh-My; Tue, 15 Sep 2026 13:13:30 +0000
Received: by outflank-mailman (input) for mailman id 1421693;
 Tue, 15 Sep 2026 13:13:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frederic@kernel.org>) id 1x6SyX-0003db-Fa
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 13:13:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6SyW-001Tjd-EH
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 15:13:28 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frederic@kernel.org>)
 id 6aa9446b-e002-0a2a0a5209dd-0a2a4504cafa-42
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:13:28 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frederic@kernel.org>)
 id 6aa94476-b57f-0a2a45040019-aceafc1fd10a-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 15:13:28 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 17A9D43572;
 Tue, 15 Sep 2026 13:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BE11F0089A;
 Tue, 15 Sep 2026 13:13:25 +0000 (UTC)
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
	s=k20260515; t=1789478006;
	bh=4tD8a6exBiuiMZ+UoC5PJsvb3MP2QyoYGVvzltIQRI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Knl5Rk7L79lys25DYi750mDQwSC6ffBx2Yd/MV/TjslA4t980FAtpJisR/xidrHPa
	 6T6sVPQ0O8X3eLpZ4aarQrxyNuteXmYp3jFjVCIelAbEeqFmpJ0aG+1p7qWMugMF2G
	 WnMT63DNSgDMnE4a4bsyEHD0XV1F9aDohAhutgwte6vXVNl4dHGI/2KBmBhezBvpJx
	 3GnTUXWxqs+EZxgeUrMfbLe6QI7ea2Bw2jnSpd87qTMVX6qIeb9u4IYVif7vUzusPZ
	 1kTqjhRNVP4VMysH92GYpVpSFfauL7AkXQtXSNc7pu9ap+gUdQdJdoxv0udHzAQgmY
	 SX9YeTJ0eXJvg==
Date: Tue, 15 Sep 2026 15:13:23 +0200
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
Subject: Re: [PATCH RFC v2 03/15] rcu-tasks: Hold trampoline nesting across
 irq-exit preemption in trampoline text
Message-ID: <aqlEcz5g5VNjHWzP@localhost.localdomain>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
 <20260911-b4-rcu-tasks-preempt-qs-v2-3-eaaa61ed2da4@toxicpanda.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-b4-rcu-tasks-preempt-qs-v2-3-eaaa61ed2da4@toxicpanda.com>
X-purgate-ID: tlsNG-ebf023/1789478008-508D9B50-ECAD250F/0/0
X-purgate-type: clean
X-purgate-size: 868

Le Fri, Sep 11, 2026 at 02:08:41PM +0000, Josef Bacik a écrit :
> A trampoline's own rcu_tramp_nesting increment and decrement live inside
> the trampoline, so there is a window of a few instructions on entry and
> exit where the count is zero while the CPU is executing trampoline text
> (or text on the way into one, such as a static ftrace stub holding a
> direct-call target).  In that window the task has not called out, so it
> can only be preempted from an interrupt, and the interrupted instruction
> pointer identifies where it is.

I haven't read the whole patchset yet but what happens if the count is zero
on trampoline exit but the trampoline isn't finished yet and RCU tasks does a
fully quiescent scan of all tasks during that short window? Isn't that ending
with a too short grace period?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

