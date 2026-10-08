Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81D5CA6007
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 08:28:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443041.1660413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEjUE-0005l9-9q; Thu, 08 Oct 2026 08:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443041.1660413; Thu, 08 Oct 2026 08:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEjUE-0005l2-7I; Thu, 08 Oct 2026 08:28:22 +0000
Received: by outflank-mailman (input) for mailman id 1443041;
 Thu, 08 Oct 2026 08:28:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xEjUC-0005kw-JP
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 08:28:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEjUB-0038TD-3B;
 Thu, 08 Oct 2026 08:28:19 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1xEjUB-008osB-28;
 Thu, 08 Oct 2026 08:28:19 +0000
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
	bh=1gzvQ8LcEHJFYChCtYeQP4UMM+HW0KR67yYs09uWdNU=; b=YOO343ujn4DDgtL3YrTfLUxUfz
	eNiL2LSZL/J3TlgTv9ucWIK993bsSMhtrP1Q0SF020d3BS8/p7+PzNsIaNPZGWp4xWp3SP6ca9LdC
	GU5bQ7GK0cacSzh3zYa0TfZs/PilQ4WpLBMK+LXiwTxC057xRd8xhumPT7jagAxJ/LBw=;
Date: Thu, 8 Oct 2026 10:28:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 09/18] x86/domain_page: move struct mapcache_vcpu to
 struct arch_vcpu
Message-ID: <asdUIR6tDvbgHjUd@Mac.lan>
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-10-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261007104051.48841-10-gwd@xenproject.org>

On Wed, Oct 07, 2026 at 11:40:42AM +0100, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> struct mapcache_vcpu, the per-vCPU part of the mapcache (the maphash
> and the vCPU's shadow of the domain's TLB epoch), lives in struct
> pv_vcpu, as only PV vCPUs have a mapcache.  In preparation for
> implementing mapcaches for HVM domains, move it to struct arch_vcpu:
> v->arch.pv.mapcache becomes v->arch.mapcache.
> 
> struct pv_vcpu shrinks from 512 to 376 bytes, and struct vcpu grows
> from 2880 to 3008 bytes (x86_64, debug build), within its page: from
> here on HVM vCPUs carry the 136-byte struct mapcache_vcpu too, ahead of
> its use by those of vCPU-PT domains.
> 
> No functional change.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Reviewed-by: Roger Pau Monné <roger@xenproject.org>

> ---
> Changes in v3:
> - New in this version, split out of "x86/hvm: introduce per-vCPU
>   mapcache for vCPU-PT domains" for review.
> ---
>  xen/arch/x86/domain_page.c        | 6 +++---
>  xen/arch/x86/include/asm/domain.h | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> index 5d90f77bed..f91ec8a75a 100644
> --- a/xen/arch/x86/domain_page.c
> +++ b/xen/arch/x86/domain_page.c
> @@ -134,7 +134,7 @@ void *map_domain_page(mfn_t mfn)
>          return mfn_to_virt(mfn_x(mfn));
>  
>      cache = vcpu_mapcache(v, &dcache);
> -    vcache = &v->arch.pv.mapcache;
> +    vcache = &v->arch.mapcache;
>      if ( !cache->inuse )
>          return mfn_to_virt(mfn_x(mfn));
>  
> @@ -231,7 +231,7 @@ void unmap_domain_page(const void *ptr)
>  
>      idx = PFN_DOWN(va - MAPCACHE_VIRT_START);
>      mfn = l1e_get_pfn(MAPCACHE_L1ENT(idx));
> -    hashent = &v->arch.pv.mapcache.hash[MAPHASH_HASHFN(mfn)];
> +    hashent = &v->arch.mapcache.hash[MAPHASH_HASHFN(mfn)];
>  
>      local_irq_save(flags);
>  
> @@ -334,7 +334,7 @@ int mapcache_vcpu_init(struct vcpu *v)
>      BUILD_BUG_ON(MAPHASHENT_NOTINUSE < MAPCACHE_ENTRIES);
>      for ( i = 0; i < MAPHASH_ENTRIES; i++ )
>      {
> -        struct vcpu_maphash_entry *hashent = &v->arch.pv.mapcache.hash[i];
> +        struct vcpu_maphash_entry *hashent = &v->arch.mapcache.hash[i];
>  
>          hashent->mfn = ~0UL; /* never valid to map */
>          hashent->idx = MAPHASHENT_NOTINUSE;
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index 6f5873879e..cfa24c4e75 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -552,9 +552,6 @@ struct arch_domain
>  
>  struct pv_vcpu
>  {
> -    /* map_domain_page() mapping cache. */
> -    struct mapcache_vcpu mapcache;
> -
>      unsigned int vgc_flags;
>  
>      struct trap_info *trap_ctxt;
> @@ -650,6 +647,9 @@ struct arch_vcpu
>  #define async_exception_state(t) async_exception_state[(t)-1]
>      uint8_t async_exception_mask;
>  
> +    /* map_domain_page() mapping cache. */
> +    struct mapcache_vcpu mapcache;

FWIW, I would maybe place this at the top of the structure, like it
was placed in pv_vcpu?

In any case the placement of the fields of arch_vcpu is a mess
already, so it doesn't make much of a difference.

Thanks, Roger.

