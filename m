Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EF0C982D2
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 18:46:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1424401.1648890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7H7F-0008Sq-39; Thu, 17 Sep 2026 18:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1424401.1648890; Thu, 17 Sep 2026 18:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7H7F-0008Sj-0Y; Thu, 17 Sep 2026 18:45:49 +0000
Received: by outflank-mailman (input) for mailman id 1424401;
 Thu, 17 Sep 2026 18:45:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frederic@kernel.org>) id 1x7H7D-0008Sc-4z
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 18:45:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7H7C-00A17P-C5
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 20:45:46 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frederic@kernel.org>)
 id 6aac3535-8faa-0a2a0a5109dd-0a2a4504ad16-46
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 20:45:46 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frederic@kernel.org>)
 id 6aac3556-b57f-0a2a45040019-aceafc1fdd32-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 20:45:46 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2340643DF2;
 Thu, 17 Sep 2026 18:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C4C1F00893;
 Thu, 17 Sep 2026 18:45:39 +0000 (UTC)
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
	s=k20260515; t=1789670740;
	bh=VUqmoZ9tkjprNUAzv5MpNYkWxkSqU7Rla2JQs5OrKPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h33H9GduZ2Nbb//sSFkLLwqVDqBIdeknn/eumej5e7rnzoQFxi4MlgOnM2Gt6j7GB
	 iE3tvUHRv+ixjLq+DWgWPyT7DoF/CYAC3R4euNtsJ2N4LHOUWTuAenMrDCqNT8k0zG
	 U59UbDrs8tfw88NjPBWxAmzoXD7fWC5AStfO6GkpqIyMxP60IaZf1VURFo7L1a2N31
	 CZ97fG48sVdVZAt67BzNGDjQ2uyRlnAdjFzsJJASWRSNkAFHDnymfoO1wKmIi3sYQ/
	 uiC5mOc8yyM/Z/8oOa/Nnm/1UaEfhLKvQNS2zEGERuhrZ7oxaz7OX2ScghU6oH5ZC+
	 c1PYnG1LmvA9g==
Date: Thu, 17 Sep 2026 20:45:36 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
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
Message-ID: <aqw1UNGO3cQxvCco@pavilion.home>
References: <edc7cca2-a5c5-455c-8969-ea05dbdb08f7@paulmck-laptop>
 <aqqONH8flTIpOUqT@localhost.localdomain>
 <91687748-0781-4133-baed-43cf82f35ff5@paulmck-laptop>
 <aqqpRoTfywUuTgoC@localhost.localdomain>
 <aqqsAUVV8a1yrQzX@localhost.localdomain>
 <6afb0afe-e7b8-46b4-9fea-2c7cf4791044@paulmck-laptop>
 <aqq0cwvRDsorGwgc@localhost.localdomain>
 <8b73e1b3-0580-4ba9-b2e0-6363e429808d@paulmck-laptop>
 <aqvZwfUVsiEI7q7y@localhost.localdomain>
 <8fea176a-0ca0-4a70-8cf9-8240a22359e4@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fea176a-0ca0-4a70-8cf9-8240a22359e4@paulmck-laptop>
X-purgate-ID: tlsNG-ebf023/1789670746-C26CAB50-055BF863/0/0
X-purgate-type: clean
X-purgate-size: 879

Le Thu, Sep 17, 2026 at 08:40:10AM -0700, Paul E. McKenney a écrit :
> > > Trampolines that transfer control to tracing code could supply the needed
> > > cleanup call.  But last I checked, there were trampolines that transferred
> > > directly back to the original code, with no opportunity for cleaning up.
> > > 
> > > Or am I still missing a trick here?
> > 
> > You're right. So we'll indeed need to reuse the deferred qs points here.
> 
> Except this is getting a bit involved.
> 
> Don't get me wrong, if Josef is happy to take this on, far be it from me
> to stand in his way.  But if not, we should be willing to treat this
> optimization as a follow-on effort, whether by Josef or someone else.

Sure, I guess I can try the follow-on, especially if it leads to removing
all this RCU tasks black magic.

Thanks.

-- 
Frederic Weisbecker
SUSE Labs

