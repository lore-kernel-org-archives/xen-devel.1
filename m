Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6ABC79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 13:10:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413055.1643320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4I3p-0001P0-3s; Wed, 09 Sep 2026 13:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413055.1643320; Wed, 09 Sep 2026 13:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4I3p-0001Ot-1C; Wed, 09 Sep 2026 13:09:57 +0000
Received: by outflank-mailman (input) for mailman id 1413055;
 Wed, 09 Sep 2026 13:09:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x4I3o-0001Og-6D
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 13:09:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4I3k-006RyC-0G;
 Wed, 09 Sep 2026 13:09:52 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4I3k-004CwE-1m;
 Wed, 09 Sep 2026 13:09:52 +0000
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
	bh=oCWPexW5I9t37fhWl80Bh7/TVolgvm8ds9NR6cfQVGA=; b=xlKIV3rzict+yorOV66U0Fa2VZ
	wqb00/kjKIhm+BwzKbYaMa9Zg9K0M8VZcU4dj23PhFI+4BwhbKWDHSVAyNuuW0dE72SE5Z5xUvV8F
	k6s0pul9kZ4ISBL1O/fhCS0vLZDFh3rj/gYIZQbndUuE1TcZe0QuEChMwuaMem08VHTA=;
Date: Wed, 9 Sep 2026 15:09:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/mm: limit deferred TLB flushing to PV owned pages
Message-ID: <aqFalyxQtfoKJto5@macbook.local>
References: <20260909072451.67324-1-roger@xenproject.org>
 <1cadfc6c-efc1-4e23-b778-1df97fd0fa4d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1cadfc6c-efc1-4e23-b778-1df97fd0fa4d@suse.com>

On Wed, Sep 09, 2026 at 11:21:51AM +0200, Jan Beulich wrote:
> On 09.09.2026 09:24, Roger Pau Monne wrote:
> > The current logic on x86 will mark all domain owned pages as needed a TLB
> > flush before being re-used.  However such TLB flushing is only strictly
> > needed for PV domain owned pages, as those can keep a reference to the page
> > in the TLB after it has been freed.
> 
> What about HVM-owned ones which a PV domain has grant- or foreign-mapped?

I've looked at grant pages, and that's handled correctly, a TLB flush
is strictly done when the pages are unmapped, so there are no stale
references in the receiver TLB one the grant is released (see
gnttab_flush_tlb()).

However I cannot find any forced TLB flush for foreign mappings, I
assume this is fine because foreign mappings are not controlled by the
source domain, and hence there's no need to forcefully purge any TLB
references.  However there isn't much that can be done here: forcing a
flush on unmap in do_mmu_update() itself would be a high performance
penalty.

> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -1501,6 +1501,7 @@ bool scrub_free_pages(void)
> >  
> >  static bool mark_page_free(struct page_info *pg, mfn_t mfn)
> >  {
> > +    const struct domain *owner = page_get_owner(pg);
> >      bool pg_offlined = false;
> >  
> >      ASSERT(mfn_x(mfn) == mfn_x(page_to_mfn(pg)));
> > @@ -1539,7 +1540,7 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
> >      }
> >  
> >      /* If a page has no owner it will need no safety TLB flush. */
> > -    pg->u.free.need_tlbflush = (page_get_owner(pg) != NULL);
> > +    pg->u.free.need_tlbflush = owner && is_pv_domain(owner);

I guess I will need to adjust this to:

pg->u.free.need_tlbflush = owner && IS_ENABLED(CONFIG_PV);

As keeping track of whether a page has been ever mapped by a PV domain
seems overly complicated, and not worth it.

> >      if ( pg->u.free.need_tlbflush )
> >          page_set_tlbflush_timestamp(pg);
> 
> Imo whichever change it is going to be here, it definitely also requires
> the comment to be kept in sync.

Ops, yes, should adjust the comment.

Thanks, Roger.

