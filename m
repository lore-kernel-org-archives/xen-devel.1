Return-Path: <SRS0=1gSS=KN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7C3C433B4
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 10:15:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59F6061185
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 10:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59F6061185
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.129030.242205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liwl2-0005DY-Ty; Tue, 18 May 2021 10:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129030.242205; Tue, 18 May 2021 10:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liwl2-0005DR-Qx; Tue, 18 May 2021 10:15:24 +0000
Received: by outflank-mailman (input) for mailman id 129030;
 Tue, 18 May 2021 10:15:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1liwl1-0005DL-MK
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 10:15:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liwl1-00007d-GO; Tue, 18 May 2021 10:15:23 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liwl1-0000N3-9u; Tue, 18 May 2021 10:15:23 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=1/88tc7pt7D9K/vJHj8cbqJZgUXseqadmmKl2VSgJcU=; b=aXDAbC3bEh6CIJnus3aAV9jJJ0
	TMxY56RbOEUKKYHcpoodkTSPbzo61guWAc2g7Qmp+Gxu2TprIdEdLSHSb3d/VpLtl4F7a/jCGBaB7
	OXOQrgPolvcPxmLtTW8dp+19mdP9ORi4EZ5ZkE8ztl+iU072Fwkqvicag7giHXPcfz7w=;
Subject: Re: [PATCH 05/10] xen/arm: introduce alloc_staticmem_pages
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-6-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e8e4148e-017b-955b-dd18-4576ce7c94ec@xen.org>
Date: Tue, 18 May 2021 11:15:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518052113.725808-6-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 18/05/2021 06:21, Penny Zheng wrote:
> alloc_staticmem_pages is designated to allocate nr_pfns contiguous
> pages of static memory. And it is the equivalent of alloc_heap_pages
> for static memory.
> This commit only covers allocating at specified starting address.
> 
> For each page, it shall check if the page is reserved
> (PGC_reserved) and free. It shall also do a set of necessary
> initialization, which are mostly the same ones in alloc_heap_pages,
> like, following the same cache-coherency policy and turning page
> status into PGC_state_used, etc.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/common/page_alloc.c | 64 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 64 insertions(+)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 58b53c6ac2..adf2889e76 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1068,6 +1068,70 @@ static struct page_info *alloc_heap_pages(
>       return pg;
>   }
>   
> +/*
> + * Allocate nr_pfns contiguous pages, starting at #start, of static memory.
> + * It is the equivalent of alloc_heap_pages for static memory
> + */
> +static struct page_info *alloc_staticmem_pages(unsigned long nr_pfns,

This wants to be nr_mfns.

> +                                                paddr_t start,

I would prefer if this helper takes an mfn_t in parameter.

> +                                                unsigned int memflags)
> +{
> +    bool need_tlbflush = false;
> +    uint32_t tlbflush_timestamp = 0;
> +    unsigned int i;
> +    struct page_info *pg;
> +    mfn_t s_mfn;
> +
> +    /* For now, it only supports allocating at specified address. */
> +    s_mfn = maddr_to_mfn(start);
> +    pg = mfn_to_page(s_mfn);

We should avoid to make the assumption the start address will be valid. 
So you want to call mfn_valid() first.

At the same time, there is no guarantee that if the first page is valid, 
then the next nr_pfns will be. So the check should be performed for all 
of them.

> +    if ( !pg )
> +        return NULL;
> +
> +    for ( i = 0; i < nr_pfns; i++)
> +    {
> +        /*
> +         * Reference count must continuously be zero for free pages
> +         * of static memory(PGC_reserved).
> +         */
> +        ASSERT(pg[i].count_info & PGC_reserved);
> +        if ( (pg[i].count_info & ~PGC_reserved) != PGC_state_free )
> +        {
> +            printk(XENLOG_ERR
> +                    "Reference count must continuously be zero for free pages"
> +                    "pg[%u] MFN %"PRI_mfn" c=%#lx t=%#x\n",
> +                    i, mfn_x(page_to_mfn(pg + i)),
> +                    pg[i].count_info, pg[i].tlbflush_timestamp);
> +            BUG();

So we would crash Xen if the caller pass a wrong range. Is it what we want?

Also, who is going to prevent concurrent access?

> +        }
> +
> +        if ( !(memflags & MEMF_no_tlbflush) )
> +            accumulate_tlbflush(&need_tlbflush, &pg[i],
> +                                &tlbflush_timestamp);
> +
> +        /*
> +         * Reserve flag PGC_reserved and change page state
> +         * to PGC_state_inuse.
> +         */
> +        pg[i].count_info = (pg[i].count_info & PGC_reserved) | PGC_state_inuse;
> +        /* Initialise fields which have other uses for free pages. */
> +        pg[i].u.inuse.type_info = 0;
> +        page_set_owner(&pg[i], NULL);
> +
> +        /*
> +         * Ensure cache and RAM are consistent for platforms where the
> +         * guest can control its own visibility of/through the cache.
> +         */
> +        flush_page_to_ram(mfn_x(page_to_mfn(&pg[i])),
> +                            !(memflags & MEMF_no_icache_flush));
> +    }
> +
> +    if ( need_tlbflush )
> +        filtered_flush_tlb_mask(tlbflush_timestamp);
> +
> +    return pg;
> +}
> +
>   /* Remove any offlined page in the buddy pointed to by head. */
>   static int reserve_offlined_page(struct page_info *head)
>   {
> 

Cheers,

-- 
Julien Grall

