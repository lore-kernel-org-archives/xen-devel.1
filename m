Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364A8C79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 16:28:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413478.1643688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4L9y-0000ZS-A8; Wed, 09 Sep 2026 16:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413478.1643688; Wed, 09 Sep 2026 16:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4L9y-0000ZL-7N; Wed, 09 Sep 2026 16:28:30 +0000
Received: by outflank-mailman (input) for mailman id 1413478;
 Wed, 09 Sep 2026 16:28:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x4L9w-0000ZF-Ow
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 16:28:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4L9s-006WCu-12;
 Wed, 09 Sep 2026 16:28:24 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4L9s-005Q2Q-2R;
 Wed, 09 Sep 2026 16:28:24 +0000
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
	bh=fEXi57et85c1vW2jLuHqAtjGNNllgpoKc5osiOaje6c=; b=XcjvezNao0LahQUYywiH3VjeDb
	gc2QaXTTZpJfG1Y1dFjVNr4Xq11WBn64UQPhBmUQlbispvmeLa3dfVL8hk56va71tV8xpTipNwoX3
	4ZhfE+WhfPczxElPPGFUq7G0xhOAkHQeswv4W+/NBk6lv3b3ll42iOCeQmhVsBiqx+mw=;
Date: Wed, 9 Sep 2026 18:28:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/mm: limit deferred TLB flushing to PV domain
 support
Message-ID: <aqGJJTbVNID0Rq6w@macbook.local>
References: <20260909140500.73483-1-roger@xenproject.org>
 <92c9bf4b-5171-4a26-a62e-f2a7b1cb89ef@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <92c9bf4b-5171-4a26-a62e-f2a7b1cb89ef@suse.com>

On Wed, Sep 09, 2026 at 04:46:01PM +0200, Jan Beulich wrote:
> On 09.09.2026 16:05, Roger Pau Monne wrote:
> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -1538,8 +1538,11 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
> >          BUG();
> >      }
> >  
> > -    /* If a page has no owner it will need no safety TLB flush. */
> > -    pg->u.free.need_tlbflush = (page_get_owner(pg) != NULL);
> > +    /*
> > +     * If a page has no owner and there's no PV domain support it will need no
> > +     * safety TLB flush, there can be no stale TLB entries.
> > +     */
> > +    pg->u.free.need_tlbflush = IS_ENABLED(CONFIG_PV) && page_get_owner(pg);
> >      if ( pg->u.free.need_tlbflush )
> >          page_set_tlbflush_timestamp(pg);
> 
> I'm okay with the code change now, but the comment is still concerning me.
> All by itself there is no reason why stale TLB entries couldn't also exist
> for HVM guests. It's just that (a) only the host TLBs are flushed by
> filtered_flush_tlb_mask() and (b) flushes of guest TLBs occur when pages
> are removed from their P2Ms (aiui; hopefully true also for Arm). IOW what
> the comment says looks to be correct, just that it leaves too much to be
> figured out by the reader. At the very least I'd suggest "..., there can
> be no stale (host) TLB entries." Thoughts?

Hm, I find adding "(host)" to also be slightly confusing, as I would
usually associate host TLB with Xen context TLB state.  Which is also
made more confusing by how PV guests share the page-tables with Xen.

"If a page has no owner and there's no PV domain support it will need
no safety TLB flush.  PV domains are the only domain types that can
keep stale entries on the TLB, as they have (limited) control over the
host MMU and when flushes are performed"

Is this any better?  I'm still not fully convinced, as HVM guests do
have full control over the MMU, it's just that in that case p2m
changes unconditionally lead to flushes.

Thanks, Roger.

