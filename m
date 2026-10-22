Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FDC606A319
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 14:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=gM7cwc7l
Received: from list by lists.xenproject.org with outflank-mailman.1458323.1670673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJuCA-0003GN-6P; Thu, 22 Oct 2026 14:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458323.1670673; Thu, 22 Oct 2026 14:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJuCA-0003GG-3K; Thu, 22 Oct 2026 14:55:06 +0000
Received: by outflank-mailman (input) for mailman id 1458323;
 Thu, 22 Oct 2026 14:55:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xJuC8-0003GA-B1
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 14:55:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xJuC8-00000007PLu-1EEB;
 Thu, 22 Oct 2026 14:55:04 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xJuC7-00000009kdA-3tIk;
 Thu, 22 Oct 2026 14:55:04 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=sWaWDlZ1Q97j4RqGrs5N9Ud1PBkvXaHeJEj8Fmpm/pU=; b=gM7cwc7lS0xZX8q+98RMUoWn+E
	Rkix+svXHORzmqXevbXw1su9YzqshRzrbf5M0ugPvKGIrxoRq9+5nrLqpqBpvrh/y4riEBFEqG9Ge
	b1s5X0RfBD8IhZ+YCpEWv7HE7SFXfhzakiTx+Qv+TRcjCluavLem5COSzGdEfdu/PLqs=;
Date: Thu, 22 Oct 2026 16:54:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: George Dunlap <gwd@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v4 01/30] x86/PoD: map one page at a time in
 p2m_pod_zero_check()
Message-ID: <atojwlkIKCM5IFrT@Mac.lan>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
 <20261019-asi-hvm-v4-1-b68b66652266@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019-asi-hvm-v4-1-b68b66652266@xenproject.org>
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 08:42:32PM +0100, George Dunlap wrote:
> p2m_pod_zero_check() maps every page of its batch that passes its
> checks, up to POD_SWEEP_STRIDE (16) of them, and keeps them mapped
> across the p2m lookups and updates which follow, each of which maps
> page-table pages of its own.  Its callers hold mappings too: the p2m
> lookup which found the entry to populate still has its page-table page
> mapped, and a PV mmu_update() the L1 page it is writing.
> 
> map_domain_page() cannot always provide that many at once.  It uses the
> mapcache on behalf of PV vCPUs only: in debug builds for every page, in
> release builds for pages beyond the reach of the directmap in PV guests'
> page-tables (5TiB, 3.5TiB with CONFIG_BIGMEM).

This is IMO too verbose.  It doesn't add any value to the
justification here what's the memory limit at which the mapcache starts
to be used.  I also don't think it's relevant to list what causes
mapcache to be used in general.  It just distracts from the
justification of the change, by making the patch description unwieldy
long.

> The mapcache has
> MAPCACHE_VCPU_ENTRIES (16) slots per vCPU of the domain, shared by its
> vCPUs, and a mapping which finds no slot free or reclaimable hits the
> BUG_ON() in map_domain_page(): the host crashes.
> 
> The sweep runs in the context of whichever vCPU populates a PoD entry
> while the domain's PoD cache is empty.  The guest's own vCPUs, being
> HVM, map through the directmap; a PV vCPU gets there when its domain
> maps or copies the guest's memory: a device model in dom0 or in a stub
> domain, a backend doing grant copies.  A PV domain with a single vCPU,
> as a device-model stub domain or a dom0 booted with dom0_max_vcpus=1
> is, has 16 slots, and a sweep over 16 candidate pages needs more.
> 
> The sweep has mapped its whole batch at once since 9ad9a1609fbe ("PoD
> memory 5/9: emergency scan"), when x86-64 reached all memory through the
> directmap.  The per-vCPU budget came with the mapcache's return to
> x86-64 in 4b28bf6ae90b ("x86: re-introduce map_domain_page() et al").
> 
> Map one page at a time instead, as p2m_pod_zero_check_superpage()
> already does: map a page for the quick check and unmap it again, and
> map it anew for the full check after the p2m update and the TLB flush.
> The checks and their order are unchanged.  Each page is mapped twice,
> which costs little next to scanning it, and the error paths no longer
> have mappings to undo.
> 
> Fixes: 4b28bf6ae90b ("x86: re-introduce map_domain_page() et al")
> Assisted-by: Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Acked-by: Roger Pau Monné <roger@xenproject.org>

I've got one suggestion below, but doesn't change the logic.

> ---
> Changes in v4:
> - Track the pages to check in a bitmask walked with for_each_set_bit(),
>   not an array of bools (Andrew).
> - Drop the new comment above the first loop; edit the old one's "and map
>   the pages" instead (Andrew).
> 
> NB this issue was raised in review and verified only by code
> inspection; it hasn't been demonstrated.
> ---
>  xen/arch/x86/mm/p2m-pod.c | 72 +++++++++++++++++----------------------
>  1 file changed, 31 insertions(+), 41 deletions(-)
> 
> diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
> index 4602c32cff..ed298fa7d2 100644
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -901,9 +901,10 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>  {
>      mfn_t mfns[POD_SWEEP_STRIDE];
>      p2m_type_t types[POD_SWEEP_STRIDE];
> -    unsigned long *map[POD_SWEEP_STRIDE];
> +    unsigned int check = 0;
> +    const unsigned long *map;
>      struct domain *d = p2m->domain;
> -    unsigned int i, j, max_ref = 1;
> +    unsigned int j, max_ref = 1;
>  
>      BUG_ON(count > POD_SWEEP_STRIDE);
>  
> @@ -911,8 +912,11 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>      if ( paging_mode_shadow(d) )
>          max_ref++;
>  
> -    /* First, get the gfn list, translate to mfns, and map the pages. */
> -    for ( i = 0; i < count; i++ )
> +    /*
> +     * First, get the gfn list, translate to mfns, and check for being a
> +     * plausible candidate.
> +     */
> +    for ( unsigned int i = 0; i < count; i++ )
>      {
>          p2m_access_t a;
>  
> @@ -921,9 +925,8 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>  
>          /*
>           * If this is ram, and not a pagetable or a special page, and
> -         * probably not mapped elsewhere, map it; otherwise, skip.
> +         * probably not mapped elsewhere, check it; otherwise, skip.
>           */
> -        map[i] = NULL;
>          if ( p2m_is_ram(types[i]) )
>          {
>              const struct page_info *pg = mfn_to_page(mfns[i]);
> @@ -932,7 +935,7 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const gfn_t *gfns, unsigned int count
>                   (pg->count_info & PGC_allocated) &&
>                   !(pg->count_info & PGC_shadowed_pt) &&
>                   ((pg->count_info & PGC_count_mask) <= max_ref) )
> -                map[i] = map_domain_page(mfns[i]);
> +                check |= 1U << i;

Not that I have a strong opinion, but I think it's clearer if you use
__{set,clear}_bit().

Thanks, Roger.

