Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CC9C9832A
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 13:54:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436461.1655111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBYHU-0005Ra-CT; Tue, 29 Sep 2026 13:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436461.1655111; Tue, 29 Sep 2026 13:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBYHU-0005RT-9L; Tue, 29 Sep 2026 13:54:04 +0000
Received: by outflank-mailman (input) for mailman id 1436461;
 Tue, 29 Sep 2026 13:54:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xBYHT-0005RN-Tg
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 13:54:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xBYHS-0053hV-2q;
 Tue, 29 Sep 2026 13:54:03 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xBYHS-004z0h-2Q;
 Tue, 29 Sep 2026 13:54:03 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=cVtVnq/vjAXcjQI/elMmsbYfxHZe9OkN4MPrc1pNXhQ=; b=WzyQTO9PExvTxg/rsGsDpA3rq+
	0Yw90sD8+b7qw22qm6C4VnER7p7pizQ7aFQkYbXOOyP9uKV5hXTAGyix/cGiXnm/pYTXpcmAKvP32
	/rnuGNfq/fD3Pgf3ovNhO5SYnajvStXIQ+EI50bWZborjn4Sosq1TYxe8D/oHvUXjTRE=;
Date: Tue, 29 Sep 2026 15:53:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/3] xen/rcu: simplify RCU implementation
Message-ID: <arvC9aSoleeD5vQz@macbook.local>
References: <20260925163025.65217-1-roger@xenproject.org>
 <20260925163025.65217-3-roger@xenproject.org>
 <DLQTVEZZBRXP.2TGY8Y2Z1PQOV@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DLQTVEZZBRXP.2TGY8Y2Z1PQOV@amd.com>

On Mon, Sep 28, 2026 at 11:05:10AM +0200, Alejandro Vallejo wrote:
> On Fri Sep 25, 2026 at 6:30 PM CEST, Roger Pau Monne wrote:
> >  bool rcu_needs_cpu(unsigned int cpu)
> >  {
> > -    struct rcu_data *rdp = &per_cpu(rcu_data, cpu);
> > -
> > -    return (rdp->curlist && !rdp->idle_timer_active) || rcu_pending(cpu);
> > +    return !!per_cpu(rcu_data, cpu).nr;
> 
> Local reads are fine to be relaxed with IRQs off because they can't
> change. But remote reads and reads with IRQs on are subject to data
> races.
> 
> This read should be atomic. And the writes should be atomic too because
> the field is read from remote CPUs.

Sorry, this is a leftover from a further change I wanted to do.
rcu_needs_cpu() is never called against remote CPUs (as is
rcu_pending()), so I wanted to get rid of the cpu parameter and
instead use this_cpu(rcu_data).nr.  Then decided it was too much
churn (and extra logic to fetch the current cpu repeatedly) and forgot
to add the ACCESS_ONCE().

I will add the ACCESS_ONCE() and keep the function interface as-is.

Thanks, Roger.

