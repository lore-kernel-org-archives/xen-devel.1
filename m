Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271C7CA600C
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 13:56:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443370.1660704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEobS-0004j4-T7; Thu, 08 Oct 2026 13:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443370.1660704; Thu, 08 Oct 2026 13:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEobS-0004ix-QK; Thu, 08 Oct 2026 13:56:10 +0000
Received: by outflank-mailman (input) for mailman id 1443370;
 Thu, 08 Oct 2026 13:56:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xEobR-0004ip-6T
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 13:56:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEobQ-003EhH-1P;
 Thu, 08 Oct 2026 13:56:08 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEobQ-00B00V-0M;
 Thu, 08 Oct 2026 13:56:08 +0000
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
	bh=inAT+xDwEexTXt1oitaM0VvNUjHvpyAGagRYSMkfzK8=; b=PeGa+Bw0lZYzrsbp6pjmE2dKC4
	qolivNY6uhgz4aI4X0Mqt/59qS9czBTxEOyS1K9C2gfUqy81ckA5f4AY/pYKD8Quhldpyf79/Segc
	hyK2tNRzUa90Ku/S/4emfqp6pV9fO6EoqYGfBYK0+vo6ziBDe0KctVIM4BxwtZ5GHzfA=;
Date: Thu, 8 Oct 2026 15:56:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 11/18] x86/hvm: introduce per-vCPU mapcache for
 vCPU-PT domains
Message-ID: <aseg8F5OA4AmLg3n@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-12-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261007104051.48841-12-gwd@xenproject.org>

On Wed, Oct 07, 2026 at 11:40:44AM +0100, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Add a struct mapcache to struct mapcache_vcpu for the per-vCPU
> accounting. Since MAPCACHE_VCPU_ENTRIES is 16, its inuse and garbage
> bitmaps are a word each: declare them inline in struct mapcache_vcpu,
> rather than mapping them in the per-domain area as the domain-wide
> bitmaps are.
> 
> A per-vCPU mapcache is only ever used by its own vCPU, and so by one
> pCPU at a time. We can therefore skip both the lock and the TLB-epoch
> tracking the domain-wide mapcache needs; a wrap still flushes the
> local TLB.
> 
> struct mapcache_vcpu grows from 136 to 176 bytes, and struct vcpu from
> 3008 to 3072 bytes (x86_64, debug build), within its page.
> 
> Unlike a domain-wide mapcache, a per-vCPU one cannot, by design,
> borrow slots from other vCPUs: MAPCACHE_VCPU_ENTRIES (16) is the most
> single-page mappings such a vCPU can hold at once, interrupt handlers'
> included, and one more hits the BUG_ON() in map_domain_page(). The PoD
> zero-page sweep held up to 16 on top of its callers' until "x86/PoD: map
> one page at a time in p2m_pod_zero_check()".

Is it really the best approach to keep the same limit?  As you note,
with the mapcache being per-vcpu the limit of 16 active mappings is
going to be strictly enforce, which it wasn't before.

The per-vcpu mapcache area is a whole L1 page-directory (it cannot be
smaller), so that's 512 entries per-vcpu, of which we limit ourselves
to 16.

Can we consider using bigger per-vcpu mapcaches, maybe 512 is overkill
for the bitmap sizes, but using greater than 16 will likely avoid
frequent TLB flushes to re-use the entries.  Maybe 64 entries, so the
bitmap is still a single unsigned long on 64bit arches.  Note that
declare bitmap will already use at least an unsigned long for the
bitmap itself.

> 
> mapcache_current_vcpu()'s lazy-context-switch handling
> (sync_local_execstate() plus a pgtable_vcpu re-read) now applies to
> any vCPU with a mapcache: when the idle vCPU runs lazily on an HVM
> vCPU's monitor table, the full switch happens before the idle context
> uses a mapcache.
> 
> In release builds map_domain_page() still tries the directmap first,
> for any vCPU; debug builds exercise the new mapcache.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>
> ---
> Changes in v3:
> - HVM only, and per-vCPU from the start: the HVM enablement of "x86:
>   Initialize the mapcache for PV, HVM, and idle domains" (from the
>   directmap removal series) is folded in, without the idle domain and
>   without a domain-wide HVM mapcache.
> - Retitle (was: "x86/mm: introduce a per-vCPU mapcache when using ASI").
> - Say which second unmaps the not-present check in unmap_domain_page()
>   catches: those of an entry the first unmap zapped.
> - State the budget of single-page mappings a vCPU can hold at once.
> - The mapcache accounting refactor, the move of struct mapcache_vcpu
>   to struct arch_vcpu and the not-present check in unmap_domain_page()
>   are split out, for review, into the three patches before this one.
> ---
>  xen/arch/x86/domain_page.c        | 70 ++++++++++++++++++++++---------
>  xen/arch/x86/include/asm/domain.h |  6 +++
>  2 files changed, 57 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> index 708df90a00..0500bb9dba 100644
> --- a/xen/arch/x86/domain_page.c
> +++ b/xen/arch/x86/domain_page.c
> @@ -20,12 +20,13 @@
>  
>  /*
>   * Whether v has a mapcache: PV vCPUs (whose domain-wide mapcache may still be
> - * disabled, see mapcache_domain_init()).  HVM vCPUs reach everything through
> - * the directmap, which covers all physical address space for them.
> + * disabled, see mapcache_domain_init()) and the vCPUs of an HVM domain using
> + * per-vCPU page-tables.  Other HVM vCPUs reach everything through the
> + * directmap, which covers all physical address space for them.
>   */
>  static bool has_mapcache(const struct vcpu *v)
>  {
> -    return is_pv_vcpu(v);
> +    return is_pv_vcpu(v) || v->domain->arch.vcpu_pt;
>  }
>  
>  static inline struct vcpu *mapcache_current_vcpu(void)
> @@ -38,10 +39,10 @@ static inline struct vcpu *mapcache_current_vcpu(void)
>          return NULL;
>  
>      /*
> -     * If we are in a lazy context-switch state from a PV vCPU do a full switch
> -     * to the idle vCPU now, otherwise an incoming FLUSH_VCPU_STATE IPI would
> -     * change the page tables under our feet an invalidate any in-use mapcache
> -     * entries.
> +     * If we are in a lazy context-switch state from a vCPU with a mapcache do
> +     * a full switch to the idle vCPU now, otherwise an incoming
> +     * FLUSH_VCPU_STATE IPI would change the page tables under our feet an
> +     * invalidate any in-use mapcache entries.
>       */
>      if ( unlikely(this_cpu(curr_vcpu) != curr) )
>      {
> @@ -61,14 +62,21 @@ static inline struct vcpu *mapcache_current_vcpu(void)
>  }
>  
>  /*
> - * The accounting for v's mapcache: the domain's, with *dcache set so the
> - * caller takes the domain-wide lock and TLB-epoch machinery into account.
> + * The accounting for v's mapcache: its own for a vCPU-PT domain, the domain's
> + * otherwise, in which case *dcache is set so the caller takes the domain-wide
> + * lock and TLB-epoch machinery into account.
>   */
>  static struct mapcache *vcpu_mapcache(struct vcpu *v,
>                                        struct mapcache_domain **dcache)
>  {
>      struct domain *d = v->domain;
>  
> +    if ( d->arch.vcpu_pt )
> +    {
> +        *dcache = NULL;
> +        return &v->arch.mapcache.cache;
> +    }
> +
>      *dcache = &d->arch.pv.mapcache;
>      return &(*dcache)->cache;
>  }
> @@ -77,11 +85,15 @@ static struct mapcache *vcpu_mapcache(struct vcpu *v,
>   * The domain-wide mapcache's lock and TLB-epoch machinery, taken around
>   * allocating a slot: the domain's vCPUs share the mapcache's slots, and each
>   * catches up with a wrap another one caused, flushing its TLB if it has not
> - * been flushed since.
> + * been flushed since.  A per-vCPU mapcache (no dcache) needs neither: only its
> + * own vCPU, and so one pCPU at a time, uses it.
>   */
>  static void mapcache_lock(struct mapcache_domain *dcache,
>                            struct mapcache_vcpu *vcache)
>  {
> +    if ( !dcache )
> +        return;
> +
>      spin_lock(&dcache->lock);
>  
>      /* Has some other CPU caused a wrap? We must flush if so. */
> @@ -100,13 +112,17 @@ static void mapcache_lock(struct mapcache_domain *dcache,
>  static void mapcache_new_epoch(struct mapcache_domain *dcache,
>                                 struct mapcache_vcpu *vcache)
>  {
> +    if ( !dcache )
> +        return;
> +
>      vcache->shadow_epoch = ++dcache->epoch;
>      dcache->tlbflush_timestamp = tlbflush_current_time();
>  }
>  
>  static void mapcache_unlock(struct mapcache_domain *dcache)
>  {
> -    spin_unlock(&dcache->lock);
> +    if ( dcache )
> +        spin_unlock(&dcache->lock);
>  }
>  
>  #define mapcache_l2_entry(e) ((e) >> PAGETABLE_ORDER)
> @@ -191,7 +207,12 @@ void *map_domain_page(mfn_t mfn)
>          }
>          BUG_ON(idx >= cache->entries);
>  
> -        /* /Second/, flush TLBs. */
> +        /*
> +         * /Second/, flush TLBs.  A per-vCPU mapcache needs a local flush
> +         * only: its entries are never _PAGE_GLOBAL, and this vCPU's
> +         * page-tables can only have been loaded on another pCPU via
> +         * switch_cr3_cr4(), which flushes non-global mappings.
> +         */

Shouldn't the above comment be inside of mapcache_new_epoch()?  It's a
bit disconnected from the code here, as apparently there's no
different handling here between per-domain and per-vcpu mapcaches.

>          perfc_incr(domain_page_tlb_flush);
>          flush_tlb_local();
>          mapcache_new_epoch(dcache, vcache);
> @@ -313,11 +334,19 @@ int mapcache_vcpu_init(struct vcpu *v)
>          return 0;
>  
>      cache = vcpu_mapcache(v, &dcache);
> -    if ( !cache->inuse )
> +    if ( !dcache )
> +    {
> +        /* Per-vCPU bitmaps are a word each: they live in the vCPU itself. */
> +        cache->inuse = v->arch.mapcache.inuse;
> +        cache->garbage = v->arch.mapcache.garbage;

Well, the size of the bitmap is set to 16 bits, but due to the usage of
DECLARE_BITMAP() the underlying type is unsigned long, so it's
effectively using 64 bits (a quad).

Thanks, Roger.

