Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293DCC88E72
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 19:26:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424426.1648900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Hjs-0005fF-V1; Thu, 17 Sep 2026 19:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424426.1648900; Thu, 17 Sep 2026 19:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7Hjs-0005f8-SE; Thu, 17 Sep 2026 19:25:44 +0000
Received: by outflank-mailman (input) for mailman id 1424426;
 Thu, 17 Sep 2026 19:25:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDs5=HJ=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 1x7Hjs-0005f2-EL
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 19:25:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7Hjr-003Jdu-Eb
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 21:25:43 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <SRS0=iDs5=HJ=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 6aac3ea6-e002-0a2a0a5209dd-0a2a4509ddc4-20
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 21:25:43 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <SRS0=iDs5=HJ=paulmck-ThinkPad-P17-Gen-1.home=paulmck@kernel.org>)
 id 6aac3eb6-be1a-0a2a45090019-ac6904feeaf4-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 21:25:43 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5726F601EF;
 Thu, 17 Sep 2026 19:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E491F000FF;
 Thu, 17 Sep 2026 19:25:41 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id BA399CE1771; Thu, 17 Sep 2026 12:25:40 -0700 (PDT)
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
	s=k20260515; t=1789673141;
	bh=6ZHuttUZCZV4Q8v2OQevWMSgjgpr+6xpv1ywa/+PiNQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=ZmJyLGnYRfFoBTzswnP6QdP7lKNX+3Ys095RUqDUlO0tsNO6mp4CvE8vzXJshuXn3
	 xPFaDeRb2lcvGNDMeQAUSCw/Rg+CJ9n0q4PX8I1RTGAt+Xo3pxykRcqTvcWblVj5h9
	 6+hFH6z4eRU+l6RfZ+MRN0rjwcm87Nc8Izl8PAbUP7xB845hooRtpCO93tjcAS3JAs
	 DTb/96iIH3u0adZnc6wfmhiAMA/a8K1oYVoa34Q2L55mtv4tc1KbrzuTbxZidisC0S
	 7GQbNlj3RmNxpKB49XH1ngw38N9/b1jZSSzgmucNSbV+mc3gCV8a5GAyELDmojUOW0
	 ZtTl62/MsQchQ==
Date: Thu, 17 Sep 2026 12:25:40 -0700
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
Message-ID: <33b8e33a-3fad-4b33-9ae7-3948f0e6d3aa@paulmck-laptop>
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
 <aqw1UNGO3cQxvCco@pavilion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqw1UNGO3cQxvCco@pavilion.home>
X-purgate-ID: tlsNG-bad1c0/1789673143-FC411034-85E50569/0/0
X-purgate-type: clean
X-purgate-size: 997

On Thu, Sep 17, 2026 at 08:45:36PM +0200, Frederic Weisbecker wrote:
> Le Thu, Sep 17, 2026 at 08:40:10AM -0700, Paul E. McKenney a écrit :
> > > > Trampolines that transfer control to tracing code could supply the needed
> > > > cleanup call.  But last I checked, there were trampolines that transferred
> > > > directly back to the original code, with no opportunity for cleaning up.
> > > > 
> > > > Or am I still missing a trick here?
> > > 
> > > You're right. So we'll indeed need to reuse the deferred qs points here.
> > 
> > Except this is getting a bit involved.
> > 
> > Don't get me wrong, if Josef is happy to take this on, far be it from me
> > to stand in his way.  But if not, we should be willing to treat this
> > optimization as a follow-on effort, whether by Josef or someone else.
> 
> Sure, I guess I can try the follow-on, especially if it leads to removing
> all this RCU tasks black magic.

That sounds most excellent, thank you!

							Thanx, Paul

