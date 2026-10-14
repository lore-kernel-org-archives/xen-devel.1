Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C516ACC6B27
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 08:09:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448528.1664556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGu2U-0006Kh-FM; Wed, 14 Oct 2026 08:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448528.1664556; Wed, 14 Oct 2026 08:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGu2U-0006KZ-AV; Wed, 14 Oct 2026 08:08:42 +0000
Received: by outflank-mailman (input) for mailman id 1448528;
 Wed, 14 Oct 2026 08:08:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xGu2T-0006KR-HS
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 08:08:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGu2T-00000004xGB-1i4O;
 Wed, 14 Oct 2026 08:08:41 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGu2S-0000000G6eA-1nBC;
 Wed, 14 Oct 2026 08:08:41 +0000
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
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=3djcjpkpAu5d/9PzQpp1g4S+4TmcMMHCf6SBTYc29VE=; b=q0URrB2paTDxa5A1nZZ+50qyxo
	tmYH4bUKTnjaAFblVmWaIpZrINfRHU/q6MYumG9r8o5NS15+nD3RRtWdhmMRZ1jPTL8c68RVOUWvt
	nmCqXk9UXkeSKfGgGeiu0vQQ0ZUZcPjyUqO271JEGYQnqBS1R3l7SIiIEVfHzlp4BOtI=;
Date: Wed, 14 Oct 2026 10:08:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 12/18] x86/mm: let Xen's page-table walker operate on
 a given root
Message-ID: <as84hK0aO2PFub9w@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-13-gwd@xenproject.org>
 <asevstCHf5nfdw_L@Mac.lan>
 <CAFLBxZYSYKdkyC997x0s+EWgHOdL=CYWi_tvanod9ryGeE9PMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLBxZYSYKdkyC997x0s+EWgHOdL=CYWi_tvanod9ryGeE9PMA@mail.gmail.com>

On Tue, Oct 13, 2026 at 09:37:53PM +0100, George Dunlap wrote:
> On Thu, Oct 8, 2026 at 3:59 PM Roger Pau Monné <roger@xenproject.org> wrote:
> >
> > On Wed, Oct 07, 2026 at 11:40:45AM +0100, George Dunlap wrote:
> > > map_pages_to_xen() and modify_xen_mappings() maintain Xen's own mappings,
> > > walking from idle_pg_table, whose Xen slots every other root page-table
> > > copies.  A later patch introduces a second directmap hierarchy: page
> > > tables for the directmap virtual address range that some guest contexts
> > > use in place of idle_pg_table's.  It needs the same maintenance at the
> > > same virtual addresses.
> >
> > I assume that "second directmap hierarchy" refers to the sparse
> > directmap approach?
> 
> Yes.  Should I change it to "a second, sparse directmap hierarchy"?  I
> think raising that we're going to be maintaining parallel hierarchies
> is important.

I think that would be clearer.

> 
> > > Give virt_to_xen_l{3,2,1}e() the L4 to walk from, and move the bodies of
> > > map_pages_to_xen() and modify_xen_mappings() into map_pages_in() and
> > > modify_mappings_in(), which take the root as well.  The public functions
> > > pass idle_pg_table.  The EFI runtime-services page-tables mirror
> > > idle_pg_table's L4 entries only, so a newly allocated L3 is propagated
> > > to them only when the root is idle_pg_table.
> > >
> > > TLB flushing is unaffected: it is by virtual address, and the same
> > > addresses are mapped in either hierarchy.
> >
> > The virtual address space is just part of it, so far
> > map_pages_to_xen() has been doing global TLB flushes, because all CPUs
> > used the same page-tables for the Xen slots that map_pages_to_xen()
> > modifies.  With the change to pass different L4, there's also the
> > assumption that the Xen slots on those L4 will be different, and hence
> > not all CPUs might need flushing?
> >
> > Maybe I'm thinking ahead too much - but if this is going to be used to
> > manage the sparse directmap we might want to avoid IPIs to CPUs that
> > are running with the full directmap when the sparse one is changed,
> > as those are useless.
> 
> Yes; changes to both "views" (e.g., map_pages_to_xen()) still need to
> flush on all CPUs; but changes only to the sparse "view" (e.g.,
> removing pages on free_xenheap_pages()) could send an IPI only to CPUs
> with the sparse view running on it.  We could keep a cpumask with
> which CPUs currently have sparse directmaps loaded, and only IPI
> those.
> 
> That said, maintaining the cpumask isn't free; it would cause some
> cacheline bouncing as vCPUs are scheduled in and out; and since the
> idle vCPU has the full directmap, even a system with all "normal"
> domains using the sparse map would still need to update it constantly.
> Not sure how often free_xenheap_pages() happens, but if it's not very
> frequent, it might not be worth the cache consistency overhead (and
> the extra complication).  I'd leave this as a potential future
> improvement.

Worth adding a TODO comment somewhere about the fact that
map_pages_to_xen() is likely doing too many flushes when used to
manage the sparse directmap.  Without going into the more complex
approach of tracking which CPUs are running with the sparse directmap,
we could do batch flushes in add_to_sparse_view() for example, as the
flush could be pulled out of the map_pages_in() loop.

Regards, Roger.

