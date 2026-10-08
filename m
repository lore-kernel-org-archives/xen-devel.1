Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8E2CA6012
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 19:01:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443704.1660866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEtMD-0000PC-VY; Thu, 08 Oct 2026 19:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443704.1660866; Thu, 08 Oct 2026 19:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEtMD-0000P4-Rq; Thu, 08 Oct 2026 19:00:45 +0000
Received: by outflank-mailman (input) for mailman id 1443704;
 Thu, 08 Oct 2026 19:00:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xEtMD-0000Oy-1f
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 19:00:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEtMA-003KwY-2F;
 Thu, 08 Oct 2026 19:00:42 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEtMA-00Dn4u-0u;
 Thu, 08 Oct 2026 19:00:42 +0000
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
	bh=i5yaBIHn+0f5ortW46y9lHDI6574Zwvhg7IDwdSQtjk=; b=fTat1jUA0Hd2gvxu+T8oqQXK0n
	/zOFSgb7eu6k1hLY2t1g/0Je4ChC29Q0zVNIlQA3424/cHGEaks1pHGeeaeB88W9cmAxKVXXmJIWT
	GxRuxPBLHvJTad/II9t6xnweJVD/Ahjku62clHzvMwUGfjvxvq2lVNIW/vtoupP41qv4=;
Date: Thu, 8 Oct 2026 21:00:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 15/18] x86/mm: flush owned pages before reuse with the
 sparse directmap view
Message-ID: <asfoWIoeqPRX9SC-@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-16-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007104051.48841-16-gwd@xenproject.org>

On Wed, Oct 07, 2026 at 11:40:48AM +0100, George Dunlap wrote:
> Since d7bf1b8ea275 ("x86/mm: limit deferred TLB flushing to PV domain
> support") a page freed by its owner is flushed from TLBs before it is
> handed out again only in builds with PV support, on the premise that PV
> domains, with their (limited) control over the host MMU and over when
> flushes happen, are the only ones to leave stale entries behind.
> 
> Xen's transient mappings of domain pages are another source.  The
> mapcache zaps a slot when it is unmapped but defers the flush: the
> slot's translation can stay in the TLB of the CPU which used it until
> that CPU next flushes, by which time the page may have been freed and
> handed to another domain.  Before "x86/hvm: introduce per-vCPU
> mapcache for vCPU-PT domains", only PV vCPUs use the mapcache, so the
> PV condition covers it.  Now that the vCPUs of an HVM domain with
> per-vCPU page-tables have one as well.
> 
> While the full directmap is loaded in every context, stale transient
> mappings only map what's already mapped in the full directmap.  On the
> sparse view of the directmap, a stale translation of a page handed to
> another domain would keep it reachable from a context which has
> nothing to do with it.

But if it's handed to another domain, then it also hasn't gone through
a free cycle, which is what pg->u.free.need_tlbflush covers?

> So flush owned pages before reuse wherever a sparse view is
> configured, as before d7bf1b8ea275.  In builds without PV support,
> mark_page_free() now also asks a new hook,
> arch_freed_pages_need_tlbflush(), declared with the xenheap hooks the
> sparse view already uses.  x86 answers with sparse_dmap_configured();
> without CONFIG_SPARSE_DIRECTMAP, and on other architectures, the
> answer is no.  Builds with PV support flush as before, and HVM-only
> builds keep d7bf1b8ea275's saving unless a sparse view is configured,
> which nothing does until a later patch.

I think this is not fully correct, in fact I think we need to flush
the map cache on every return to guest, otherwise you risk leaking
contents between processes running on the same vCPU (and by extension
the same physical CPU).

We either need a flush flush before returning to guest, or we need to
invalidate every page that unmapped from the mapcache.

Thanks, Roger.

