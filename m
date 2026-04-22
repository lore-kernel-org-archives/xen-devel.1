Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D30F94CD9
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2026 07:01:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1289914.1569588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFRaF-0002W1-OP; Wed, 22 Apr 2026 07:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289914.1569588; Wed, 22 Apr 2026 07:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFRaF-0002Vu-LT; Wed, 22 Apr 2026 07:01:15 +0000
Received: by outflank-mailman (input) for mailman id 1289914;
 Wed, 22 Apr 2026 07:01:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wFRaD-0002Vo-OJ
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 07:01:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wFRaD-00EB7T-1F;
 Wed, 22 Apr 2026 07:01:13 +0000
Received: from [2a02:8012:3a1:0:a171:8b59:6670:784a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wFRaD-00F4Ig-09;
 Wed, 22 Apr 2026 07:01:13 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Dz4gErmCIIkM30bY14XeUH7vMfnqt1t5br/PitpWIV8=; b=gRd3lBJtahMFQ+Wgj0i75p7Kd3
	GxEh+AmdSUfYgAxlv4P0SQS3s8aQfhYDKlbFosqWIDWnnAJHMIF4iT0ZqtKRSB5jfP/5t0r+lE/Zh
	Imi4Go8/L3pS+y9QPeHXlV+ahXWaAh0ddeHd2QAwh/BtH8gdWHhanJQp3OCap719vofQ=;
Message-ID: <6a43af84-ca86-41f2-b58d-57be5baf49de@xen.org>
Date: Wed, 22 Apr 2026 08:01:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: skip holes in physical address space when
 setting up frametable
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <20260417091124.39552-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260417091124.39552-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 17/04/2026 10:11, Michal Orzel wrote:
> Refactor setup_frametable_mappings() into init_frametable(), modeled
> after x86's implementation. Instead of mapping one contiguous frametable
> covering ram_start to ram_end (including holes), iterate the
> pdx_group_valid bitmap to allocate and map frametable memory only for
> valid PDX groups, skipping gaps in the physical address space. At the
> moment we don't really take into account pdx_group_valid bitmap.
> 
> This reduces memory consumption on systems with sparse RAM layouts by
> not allocating frametable entries for non-existent memory regions.
> 
> A file-local pdx_to_page() override is needed because the generic macro
> in xen/include/xen/pdx.h does not account for ARM's non-zero
> frametable_base_pdx.

Can you provide a bit more details? I am a bit concerned that this could 
result to subttle bug in the future if code within mm.c is expecting the 
original behavior. It would be preferable if the change is either for 
everyone on Arm or the function is renamed to avoid any clash.

[...]

> +void __init init_frametable(paddr_t ram_start)
> +{
> +    unsigned int sidx, nidx, max_idx;
>   
>       /*
>        * The size of paddr_t should be sufficient for the complete range of
> @@ -26,24 +47,34 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>       BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
>       BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
>   
> -    if ( frametable_size > FRAMETABLE_SIZE )
> -        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
> -              ps, pe);
> +    max_idx = DIV_ROUND_UP(max_pdx, PDX_GROUP_COUNT);
> +    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ram_start));
>   
> -    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
> -    /* Round up to 2M or 32M boundary, as appropriate. */
> -    frametable_size = ROUNDUP(frametable_size, mapping_size);
> -    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
> +    /*
> +     * pdx_to_page(pdx_s) in init_frametable_chunk must be page-aligned
> +     * for map_pages_to_xen(). Aligning to PDX_GROUP_COUNT guarantees this
> +     * because PDX_GROUP_COUNT * sizeof(page_info) is always a multiple of
> +     * PAGE_SIZE by construction.
> +     */
> +    frametable_base_pdx = ROUNDDOWN(frametable_base_pdx, PDX_GROUP_COUNT);
>   
> -    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
> -                          frametable_size >> PAGE_SHIFT,
> -                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
> -    if ( rc )
> -        panic("Unable to setup the frametable mappings.\n");
> +    if ( (max_pdx - frametable_base_pdx) > FRAMETABLE_NR )
> +        panic("Frametable too small\n");
> +
> +    for ( sidx = (frametable_base_pdx / PDX_GROUP_COUNT); ; sidx = nidx )
> +    {
> +        unsigned int eidx;
> +
> +        eidx = find_next_zero_bit(pdx_group_valid, max_idx, sidx);
> +        nidx = find_next_bit(pdx_group_valid, max_idx, eidx);
> +
> +        if ( nidx >= max_idx )
> +            break;
> +
> +        init_frametable_chunk(sidx * PDX_GROUP_COUNT, eidx * PDX_GROUP_COUNT);

The function will do a round-up the mapping to either a 2MiB or 32MiB 
aligned size. This means we could potentially cover the previous mapped 
region or the next one. I can't seem to find any code to cover this 
use-case. What did I miss?

Cheers,

-- 
Julien Grall


