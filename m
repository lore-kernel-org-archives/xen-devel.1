Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C257FCC6B39
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 16:32:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450911.1666252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHONN-0004Qz-33; Thu, 15 Oct 2026 16:32:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450911.1666252; Thu, 15 Oct 2026 16:32:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHONM-0004Qs-WF; Thu, 15 Oct 2026 16:32:17 +0000
Received: by outflank-mailman (input) for mailman id 1450911;
 Thu, 15 Oct 2026 16:32:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xHONM-0004Qm-HN
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 16:32:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xHONM-00000006mrm-2SBx;
 Thu, 15 Oct 2026 16:32:16 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xHONL-0000000CBzL-2Iip;
 Thu, 15 Oct 2026 16:32:16 +0000
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
	bh=LnOJC5G478qUscKDL+0IzDiX8X/tbifTtGd4OisH0G4=; b=YqC6qRQF9FSMNZjVMjMyNa1sBR
	hUdKCwE2FyWbJGZ6A1g6fNjewp/GELaoyoK/RcZrEYlQ8GdyPW+b/9dzjIPFfQ3nbBZJwLDgXjhwj
	YjAochUlj8POGvY5kqtP/fpPzG4CbmUu3np6dwz0tVd4okA/kcUM4HwPmv42EGrGjMLg=;
Date: Thu, 15 Oct 2026 18:32:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 11/15] x86/PVH: try to map initrd directly into Dom0
Message-ID: <atEADbxD4mL_bXy6@Mac.lan>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <78cd46cc-84ed-46df-96c9-26ce97ed0da0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78cd46cc-84ed-46df-96c9-26ce97ed0da0@suse.com>

On Mon, Oct 12, 2026 at 10:25:11AM +0200, Jan Beulich wrote:
> Our present handling of initrd is problematic in particular when the
> initrd is huge, and when at the same time "dom0_mem=" isn't in use to
> significantly shrink Dom0's memory (from the default). In that case,
> insufficient memory may exist for pvh_populate_p2m() to succeed (because
> initrd memory can be freed only after copying).
> 
> Make an attempt to map the blob (including headroom) into Dom0 instead,

I would use "dom0 p2m" instead of plain p2m, it's clearer IMO.

> thus also saving the copying operation. With __start_xen() having arranged
> for a larger than necessary blob, that mapping can typically be done with
> superpage mappings.
> 
> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Is there a need to prune (scrub) the headroom space?

We already populate the p2m with memory allocated with MEMF_no_scrub,
so there's no reason to scrub the headroom unless we also remove the
MEMF_no_scrub for p2m population.

> 
> Why does find_memory() go upwards, while find_kernel_memory() goes
> downwards? And why do we use the lowest part of the region found by
> find_memory() rather than the highest part?

find_memory() should probably start downwards from 4G.

> 
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -450,7 +450,9 @@ static void __init pvh_init_p2m(struct d
>  static int __init pvh_populate_p2m(
>      struct domain *d,
>      const struct e820entry *e820,
> -    unsigned int nr_e820)
> +    unsigned int nr_e820,
> +    unsigned long initrd_start,
> +    unsigned long initrd_end)

We already have a rangeset in find_memory() that contains the RAM
regions, I think it would be better if we propagated that rangeset
here as it would make the logic easier overall.  We would need to
initialize it earlier (as find_memory() is used after pvh_init_p2m()),
but would avoid the extra logic.

>  {
>      struct vcpu *v = d->vcpu[0];
>      unsigned int i;
> @@ -468,7 +470,12 @@ static int __init pvh_populate_p2m(
>          addr = PFN_DOWN(e820[i].addr);
>          size = PFN_DOWN(e820[i].size);
>  
> -        rc = pvh_populate_memory_range(d, addr, size);
> +        if ( addr + size <= initrd_start || addr >= initrd_end )
> +            rc = pvh_populate_memory_range(d, addr, size);
> +        else
> +            rc = pvh_populate_memory_range(d, addr, initrd_start - addr)
> +                 ?: pvh_populate_memory_range(d, initrd_end,
> +                                              addr + size - initrd_end);
>          if ( rc )
>              return rc;
>  
> @@ -518,6 +525,43 @@ static int __init pvh_populate_p2m(
>  #undef MB1_PAGES
>  }
>  
> +static int __init pvh_map_initrd(
> +    struct domain *d, const struct boot_module *initrd,
> +    paddr_t initrd_start, unsigned int order)
> +{
> +    for ( paddr_t ga = initrd_start, ma = initrd->start;
> +          ga < initrd_start + initrd->size;
> +          ga += PAGE_SIZE << order, ma += PAGE_SIZE << order )
> +    {
> +        int rc = p2m_add_page(d, gaddr_to_gfn(ga), maddr_to_mfn(ma),
> +                              order, p2m_ram_rw);
> +
> +        if ( rc )
> +        {
> +            printk("Failed to map initrd: [%#lx,%#lx): %d\n",
> +                   PFN_DOWN(ga), PFN_DOWN(ga) + (1UL << order), rc);

I would print the domain prefix.

> +            /*
> +             * Best effort rollback: The range will be replaced anyway by the
> +             * subsequent pvh_populate_p2m().
> +             */
> +            while ( ga > initrd_start )
> +            {
> +                ga -= PAGE_SIZE << order;
> +                ma -= PAGE_SIZE << order;
> +                p2m_remove_page(d, gaddr_to_gfn(ga), maddr_to_mfn(ma), order);
> +                order_stats[order]--;
> +            }
> +
> +            return rc;
> +        }
> +
> +        order_stats[order]++;
> +    }
> +
> +    return 0;
> +}
> +
>  struct mem_info {
>      size_t size;
>      paddr_t addr;
> @@ -538,7 +582,10 @@ static int cf_check __init _find_memory(
>  }
>  
>  static paddr_t __init find_memory(
> -    const struct domain *d, const struct elf_binary *elf, size_t size)
> +    const struct domain *d,
> +    const struct elf_binary *elf,
> +    const struct hvm_modlist_entry *initrd,
> +    size_t size)
>  {
>      struct rangeset *ram = rangeset_new(NULL, NULL, 0);
>      struct mem_info info = {
> @@ -577,6 +624,13 @@ static paddr_t __init find_memory(
>                                         PAGE_SIZE) - 1) != 0 )
>          return INVALID_PADDR;
>  
> +    /* Remove the mapped initrd range (if any), rounded to page boundaries. */
> +    if ( initrd->paddr &&
> +         rangeset_remove_range(ram, initrd->paddr,
> +                               ROUNDUP(initrd->paddr + initrd->size,
> +                                       PAGE_SIZE) - 1) != 0 )
> +        return INVALID_PADDR;
> +
>      rangeset_report_ranges(ram, MB(1), -1, _find_memory, &info);
>  
>      rangeset_destroy(ram);
> @@ -689,6 +743,70 @@ static bool __init check_and_adjust_load
>      return true;
>  }
>  
> +static paddr_t __init find_initrd_memory(
> +    const struct domain *d,
> +    const struct elf_binary *elf,
> +    const struct boot_module *initrd,
> +    size_t align,
> +    paddr_t limit)
> +{
> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
> +    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
> +                                 PAGE_SIZE);
> +    unsigned long initrd_size = ROUNDUP(initrd->size, PAGE_SIZE);
> +    unsigned long initrd_len = initrd_size - initrd->arch.headroom;
> +
> +    if ( !IS_ALIGNED(initrd->start | initrd_size, align) )
> +        return INVALID_PADDR;
> +
> +    /*
> +     * The memory map is sorted.  Search backwards to find the highest
> +     * suitable address.
> +     */
> +    for ( unsigned int i = d->arch.nr_e820; i--; )
> +    {
> +        paddr_t start = d->arch.e820[i].addr;
> +        paddr_t end = start + d->arch.e820[i].size;
> +
> +        if ( d->arch.e820[i].type != E820_RAM )
> +            continue;
> +
> +        if ( end > limit )
> +            continue;

Don't you want to clamp end to limit here, ie:

end = min(end, limit);

Like we clamp start to be above MB(1)?

We possibly want to continue if start > limit, as then there's nothing
to clamp?

> +
> +        start = MAX(ROUNDUP(start, align), MB(1));

You need to roundup after the max, ie:

ROUNDUP(MAX(start, MB(1)), align);

Otherwise the result might be unaligned if start > 0 and < MB(1)
depending on the requested alignment.

> +        end = ROUNDDOWN(end, align);
> +
> +        /* Don't use memory below 1MB, as it could overwrite BDA/EBDA/IBFT. */
> +        if ( end <= MB(1) )
> +            break;
> +
> +        if ( end <= initrd_size )
> +            break;
> +
> +        if ( end - initrd_size <= start )

This should be <, otherwise an exact fit is rejected.

> +            continue;
> +
> +        /*
> +         * NB: Even better would be to use rangesets to determine a suitable
> +         * range, in particular in case a kernel requests multiple heavily
> +         * discontiguous regions (which right now we fold all into one big
> +         * region).
> +         */

I understand that you switched find_memory() to use a rangeset because
it will need to deal with two discontinuous region because of the
initrd plus the kernel.  However the code here could be adjusted to
possibly use a rangeset from the start?

I think we should find a way to pass a rangeset around with the
available memory regions for the allocation functions to use.  Maybe
that way we could even remove the need to add a separate
find_initrd_memory()?  Which TBH looks like it wants to share its code
with plain find_memory().

> +        if ( end <= kernel_start || end - initrd_len >= kernel_end )
> +            return end - initrd_size; /* No overlap. */
> +
> +        /* Deal with the kernel already being loaded in the region. */
> +        if ( kernel_end < end && end - kernel_end >= initrd_len )

The condition in this second branch is never reached, as the if above
already has the same condition: "end - initrd_len >= kernel_end".

> +            return end - initrd_size;
> +        if ( kernel_start > start &&
> +             ROUNDDOWN(kernel_start, align) - start >= initrd_size )
> +            return ROUNDDOWN(kernel_start, align) - initrd_size;
> +    }
> +
> +    return INVALID_PADDR;
> +}
> +
>  static int __init pvh_place_kernel(
>      const struct boot_domain *bd,
>      struct elf_binary *elf,
> @@ -744,9 +862,93 @@ static int __init pvh_place_kernel(
>      return 0;
>  }
>  
> +static void __init pvh_place_initrd(
> +    const struct boot_domain *bd,
> +    const struct elf_binary *elf,
> +    struct hvm_modlist_entry *mod,
> +    paddr_t *blob_start,
> +    paddr_t *blob_end)
> +{
> +    struct domain *d = bd->d;
> +    struct boot_module *initrd = bd->initrd;
> +    struct boot_module try = *initrd;

Looking at the line below initrd can be NULL here, and hence this
should be:

struct boot_module try = initrd ? *initrd : {};

Or possibly only initialize 'try' after the initrd_len check?

> +    unsigned long initrd_len =
> +        initrd ? initrd->size - initrd->arch.headroom : 0;
> +    size_t align = 1UL << L3_PAGETABLE_SHIFT;
> +    int rc;
> +
> +    *blob_start = INVALID_PADDR;
> +    *blob_end   = 0;
> +
> +    if ( !initrd_len )
> +        return;
> +
> +    mod->size = initrd_len;
> +
> +    /*
> +     * As we promise to place below 4G whatever fits there, make a first pass
> +     * limiting permitted addresses.  If we can't fit it there, fall back to
> +     * placing above 4G.
> +     */
> +    for ( paddr_t limit = GB(4); ; )
> +    {
> +        paddr_t start;
> +
> +        *blob_start = find_initrd_memory(d, elf, &try, align, limit);
> +        if ( *blob_start != INVALID_PADDR )
> +            break;
> +
> +        if ( align == PAGE_SIZE )
> +        {
> +            if ( !(limit + 1) )
> +                return;
> +
> +            limit = -1;
> +            align = 1UL << L3_PAGETABLE_SHIFT;

Aren't you possibly asking for an alignment better than what's
required by the actual initrd memory?  Maybe it's using 2M pages yet
you request 1G alignment here.

Thanks, Roger.

