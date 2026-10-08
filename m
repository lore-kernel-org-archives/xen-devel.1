Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54097CA600A
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 08:22:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443030.1660397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEjOD-0004Sb-HL; Thu, 08 Oct 2026 08:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443030.1660397; Thu, 08 Oct 2026 08:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEjOD-0004SU-DI; Thu, 08 Oct 2026 08:22:09 +0000
Received: by outflank-mailman (input) for mailman id 1443030;
 Thu, 08 Oct 2026 08:22:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xEjOC-0004SO-5i
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 08:22:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEjOB-0038NC-2P;
 Thu, 08 Oct 2026 08:22:07 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEjOB-008mUs-1K;
 Thu, 08 Oct 2026 08:22:07 +0000
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
	bh=m0WYskPCFlkJyiVXeKFrGkSQjXbrscz83PSiADfB2HU=; b=dJEaV1RxLJ4DRYQoC4GQY/imfY
	lgvIczt1fb9KeoETB/oESMGqm82RAAlAoRKLlFiRtY2S6tj7T2Q0Dx+vCE+2jBhbxkRFRsaTvHSTO
	TpcqrKC3HHswInbVlVqvSWaEzXu/7Lr8o8ia/Bzvh22xry73XxC58KLHrsVB7it2TjJE=;
Date: Thu, 8 Oct 2026 10:22:01 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 08/18] x86/domain_page: prepare the mapcache for
 per-vCPU accounting
Message-ID: <asdSqe9KC_J3OLpv@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-9-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261007104051.48841-9-gwd@xenproject.org>

On Wed, Oct 07, 2026 at 11:40:41AM +0100, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Currently, only PV domains have a mapcache, which is domain-wide one.
> In preparation for enabling per-vCPU mapcaches for HVM domains, split
> the accounting out into a struct mapcache, embedded in struct
> mapcache_domain.
> 
> Introduce has_mapcache(), for whether a vCPU has a mapcache, and
> vcpu_mapcache(), which returns the accounting for a vCPU's mapcache
> and, in *dcache, the domain-wide mapcache whose lock and TLB epoch the
> caller has to take into account.  For now has_mapcache() is
> is_pv_vcpu(), and vcpu_mapcache() always returns the domain's
> accounting.  map_domain_page() and unmap_domain_page() stop repeating
> the is_pv_vcpu() check mapcache_current_vcpu() has made.
> 
> Move map_domain_page()'s handling of the domain-wide lock and TLB epoch
> into three helpers: mapcache_lock() takes the lock and catches up with
> a wrap another vCPU caused, mapcache_new_epoch() starts a new epoch
> after a wrap, and mapcache_unlock() drops the lock.  A per-vCPU
> mapcache can then skip them without map_domain_page() being
> re-indented.
> 
> struct mapcache_domain keeps its size (40 bytes, x86_64 debug build),
> and so do the structures containing it.
> 
> No functional change.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>
> ---
> Changes in v3:
> - New in this version, split out of "x86/hvm: introduce per-vCPU
>   mapcache for vCPU-PT domains" for review.
> ---
>  xen/arch/x86/domain_page.c        | 155 ++++++++++++++++++++----------
>  xen/arch/x86/include/asm/domain.h |  19 ++--
>  2 files changed, 116 insertions(+), 58 deletions(-)
> 
> diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> index 9119f735f5..5d90f77bed 100644
> --- a/xen/arch/x86/domain_page.c
> +++ b/xen/arch/x86/domain_page.c
> @@ -18,17 +18,23 @@
>  #include <asm/hardirq.h>
>  #include <asm/setup.h>
>  
> +/*
> + * Whether v has a mapcache: PV vCPUs (whose domain-wide mapcache may still be
> + * disabled, see mapcache_domain_init()).  HVM vCPUs reach everything through
> + * the directmap, which covers all physical address space for them.

I've been wondering whether there could be a way to write this comment
so that it doesn't need rewording once we switch to per-vCPU
mapcaches, as to avoid adding a comment here that will very likely be
completely re-worded by a later change in the series.  However I
cannot find anything much better rather than stripping most of the
comment content.

> + */
> +static bool has_mapcache(const struct vcpu *v)
> +{
> +    return is_pv_vcpu(v);
> +}
> +
>  static inline struct vcpu *mapcache_current_vcpu(void)
>  {
>      struct vcpu *v = this_cpu(pgtable_vcpu);
>      struct vcpu *curr = current;
>  
> -    /*
> -     * During early boot pgtable_vcpu is not set, callers must handle NULL.
> -     * Non-PV domains don't have a mapcache, the directmap covers all physical
> -     * address space.
> -     */
> -    if ( !v || !is_pv_vcpu(v) )
> +    /* During early boot pgtable_vcpu is not set, callers must handle NULL. */
> +    if ( !v || !has_mapcache(v) )
>          return NULL;
>  
>      /*
> @@ -54,6 +60,55 @@ static inline struct vcpu *mapcache_current_vcpu(void)
>      return ACCESS_ONCE(this_cpu(pgtable_vcpu));
>  }
>  
> +/*
> + * The accounting for v's mapcache: the domain's, with *dcache set so the
> + * caller takes the domain-wide lock and TLB-epoch machinery into account.
> + */
> +static struct mapcache *vcpu_mapcache(struct vcpu *v,
> +                                      struct mapcache_domain **dcache)
> +{
> +    struct domain *d = v->domain;
> +
> +    *dcache = &d->arch.pv.mapcache;
> +    return &(*dcache)->cache;
> +}
> +
> +/*
> + * The domain-wide mapcache's lock and TLB-epoch machinery, taken around
> + * allocating a slot: the domain's vCPUs share the mapcache's slots, and each
> + * catches up with a wrap another one caused, flushing its TLB if it has not
> + * been flushed since.

Thinking forward about how this function will end up looking when we
have per-vCPU map caches, do you maybe want to place this comment
inside the function body itself?

I expect per-vCPU splitting will add a short-circuit at the top of the
function that will skip taking the lock or doing the flushing, and
hence the comment won't need shuffling around?

> + */
> +static void mapcache_lock(struct mapcache_domain *dcache,

Maybe mapcache_enter() would be a better suited name once there's no
longer a need to take a lock for the mapcache?  Just wondering, no
strong opinion really (the more that I don't even know how the code
will end up looking yet).

> +                          struct mapcache_vcpu *vcache)
> +{
> +    spin_lock(&dcache->lock);
> +
> +    /* Has some other CPU caused a wrap? We must flush if so. */
> +    if ( unlikely(dcache->epoch != vcache->shadow_epoch) )
> +    {
> +        vcache->shadow_epoch = dcache->epoch;
> +        if ( NEED_FLUSH(this_cpu(tlbflush_time), dcache->tlbflush_timestamp) )
> +        {
> +            perfc_incr(domain_page_tlb_flush);
> +            flush_tlb_local();
> +        }
> +    }
> +}
> +
> +/* A wrap has just flushed this CPU's TLB: start a new epoch. */
> +static void mapcache_new_epoch(struct mapcache_domain *dcache,
> +                               struct mapcache_vcpu *vcache)
> +{

Since this is now a function on its own, I would possibly assert that
dcache->lock is taken on entry.

Let me know what you think of the suggestions above, overall I think
the logic is fine.

Thanks, Roger.

