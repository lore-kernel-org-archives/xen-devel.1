Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001F2CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:51:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446979.1663124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGa61-0001tF-Mn; Tue, 13 Oct 2026 10:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446979.1663124; Tue, 13 Oct 2026 10:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGa61-0001t8-KA; Tue, 13 Oct 2026 10:51:01 +0000
Received: by outflank-mailman (input) for mailman id 1446979;
 Tue, 13 Oct 2026 10:51:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xGa60-0001sx-J7
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:51:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGa60-00000003Law-0k1n;
 Tue, 13 Oct 2026 10:50:59 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xGa5z-0000000CAjj-0kGY;
 Tue, 13 Oct 2026 10:50:59 +0000
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
	bh=UGnq7yp0iNtd2xrhawvYlyGmXISxEngyzGb7qooGX0g=; b=x0G3+4xcpPnDqiBeAD5aWwbrh4
	xAWhdKAVVrRuOsIq94kr7BUNyNoQqO8JXaBnfdeN1OMko3jt0AtDOJlz+JPuKD08/BD8GJOZbFw+Y
	460xQVATWzgkxPQ+2kN0BZwbxKK4n9+PPKxGdYStqX96Rw85cRBHMO8RQl9XSOPQBJec=;
Date: Tue, 13 Oct 2026 12:50:57 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 08/18] x86/domain_page: prepare the mapcache for
 per-vCPU accounting
Message-ID: <as4NET2EOxhqB_P9@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-9-gwd@xenproject.org>
 <asdSqe9KC_J3OLpv@Mac.lan>
 <CAFLBxZZvxdEKw7kxC3u+gL1-JfY=CZ1Zcha3YX06fecL3snzkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLBxZZvxdEKw7kxC3u+gL1-JfY=CZ1Zcha3YX06fecL3snzkw@mail.gmail.com>

On Mon, Oct 12, 2026 at 03:19:20PM +0100, George Dunlap wrote:
> On Thu, Oct 8, 2026 at 9:22 AM Roger Pau Monné <roger@xenproject.org> wrote:
> >
> > On Wed, Oct 07, 2026 at 11:40:41AM +0100, George Dunlap wrote:
> > > From: Roger Pau Monné <roger.pau@citrix.com>
> > >
> > > Currently, only PV domains have a mapcache, which is domain-wide one.
> > > In preparation for enabling per-vCPU mapcaches for HVM domains, split
> > > the accounting out into a struct mapcache, embedded in struct
> > > mapcache_domain.
> > >
> > > Introduce has_mapcache(), for whether a vCPU has a mapcache, and
> > > vcpu_mapcache(), which returns the accounting for a vCPU's mapcache
> > > and, in *dcache, the domain-wide mapcache whose lock and TLB epoch the
> > > caller has to take into account.  For now has_mapcache() is
> > > is_pv_vcpu(), and vcpu_mapcache() always returns the domain's
> > > accounting.  map_domain_page() and unmap_domain_page() stop repeating
> > > the is_pv_vcpu() check mapcache_current_vcpu() has made.
> > >
> > > Move map_domain_page()'s handling of the domain-wide lock and TLB epoch
> > > into three helpers: mapcache_lock() takes the lock and catches up with
> > > a wrap another vCPU caused, mapcache_new_epoch() starts a new epoch
> > > after a wrap, and mapcache_unlock() drops the lock.  A per-vCPU
> > > mapcache can then skip them without map_domain_page() being
> > > re-indented.
> > >
> > > struct mapcache_domain keeps its size (40 bytes, x86_64 debug build),
> > > and so do the structures containing it.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
> > > Signed-off-by: George Dunlap <gwd@xenproject.org>
> > > ---
> > > Changes in v3:
> > > - New in this version, split out of "x86/hvm: introduce per-vCPU
> > >   mapcache for vCPU-PT domains" for review.
> > > ---
> > >  xen/arch/x86/domain_page.c        | 155 ++++++++++++++++++++----------
> > >  xen/arch/x86/include/asm/domain.h |  19 ++--
> > >  2 files changed, 116 insertions(+), 58 deletions(-)
> > >
> > > diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> > > index 9119f735f5..5d90f77bed 100644
> > > --- a/xen/arch/x86/domain_page.c
> > > +++ b/xen/arch/x86/domain_page.c
> > > @@ -18,17 +18,23 @@
> > >  #include <asm/hardirq.h>
> > >  #include <asm/setup.h>
> > >
> > > +/*
> > > + * Whether v has a mapcache: PV vCPUs (whose domain-wide mapcache may still be
> > > + * disabled, see mapcache_domain_init()).  HVM vCPUs reach everything through
> > > + * the directmap, which covers all physical address space for them.
> >
> > I've been wondering whether there could be a way to write this comment
> > so that it doesn't need rewording once we switch to per-vCPU
> > mapcaches, as to avoid adding a comment here that will very likely be
> > completely re-worded by a later change in the series.  However I
> > cannot find anything much better rather than stripping most of the
> > comment content.
> 
> I think describing it the way it is, then changing it, makes the
> series or the state thereof more clear.  But I'm not precious about
> it; we could make it something like this:
> 
> /*
>  * Whether v may use a mapcache rather than the directmap (a PV domain's
>  * mapcache may still be disabled, see mapcache_domain_init()).
>  */
> 
> That said, as a meta-comment: We have a limited amount of time on my
> contract, and also a limited amount of time before we want to check
> this in to the tree.  Is spending our time changing non-functional
> intermittent git tree state really what you want to spend that time
> on?

It's sometimes hard to know whether a comment is in an intermediate form,
or in the final one, hence it's difficult to trim review to not be
picky about intermittent state once the final form might be
acceptable.  That's why I've suggested to try to add comments in its
final form (or in a form that just need expansion by later changes).

I would maybe use:

/* Whether the vCPU supports mapcache usage, might not be in use. */

Personally: referencing functions by name in code comments is also
something that I usually try to avoid doing if possible.  As the code
evolves it's not unlikely for functions to change names, and we have
(historically) not been very good at keeping the referencing comments
up to date.

Thanks, Roger.

