Return-Path: <SRS0=1gSS=KN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DEB8C433ED
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 12:06:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52A586113C
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 12:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52A586113C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.129136.242424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liyU2-0007p7-AZ; Tue, 18 May 2021 12:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129136.242424; Tue, 18 May 2021 12:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liyU2-0007p0-7N; Tue, 18 May 2021 12:05:58 +0000
Received: by outflank-mailman (input) for mailman id 129136;
 Tue, 18 May 2021 12:05:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1liyU0-0007or-QD
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 12:05:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liyU0-000259-L4; Tue, 18 May 2021 12:05:56 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liyU0-0000rv-FH; Tue, 18 May 2021 12:05:56 +0000
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
	bh=s527q3jSUoyvqtJKS+4JbLgnjGNc4W4dYEbupvnnUeU=; b=0necZ8mO6HtDLKmYlRqpP4gpia
	pOYS9rmlo7OuCJuo69vF7VfUfYveMy6jc83FFZn+Tfv8ORP+oQzzCdqy95UgmBq/QIKeYSOptf3CQ
	b1suK+8HJOI7fal4+43tPH3XGNPlM9jH3xj7sLhfHv+Aox57mEjzo9y+xJRYRPtisFSg=;
Subject: Re: [PATCH 10/10] xen/arm: introduce allocate_static_memory
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-11-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7e9bacde-8a1c-c9f8-a06d-2f39f2192315@xen.org>
Date: Tue, 18 May 2021 13:05:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518052113.725808-11-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 18/05/2021 06:21, Penny Zheng wrote:
> This commit introduces allocate_static_memory to allocate static memory as
> guest RAM for domain on Static Allocation.
> 
> It uses alloc_domstatic_pages to allocate pre-defined static memory banks
> for this domain, and uses guest_physmap_add_page to set up P2M table,
> guest starting at fixed GUEST_RAM0_BASE, GUEST_RAM1_BASE.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/domain_build.c | 157 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 155 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 30b55588b7..9f662313ad 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -437,6 +437,50 @@ static bool __init allocate_bank_memory(struct domain *d,
>       return true;
>   }
>   
> +/*
> + * #ram_index and #ram_index refer to the index and starting address of guest
> + * memory kank stored in kinfo->mem.
> + * Static memory at #smfn of #tot_size shall be mapped #sgfn, and
> + * #sgfn will be next guest address to map when returning.
> + */
> +static bool __init allocate_static_bank_memory(struct domain *d,
> +                                               struct kernel_info *kinfo,
> +                                               int ram_index,

Please use unsigned.

> +                                               paddr_t ram_addr,
> +                                               gfn_t* sgfn,

I am confused, what is the difference between ram_addr and sgfn?

> +                                               mfn_t smfn,
> +                                               paddr_t tot_size)
> +{
> +    int res;
> +    struct membank *bank;
> +    paddr_t _size = tot_size;
> +
> +    bank = &kinfo->mem.bank[ram_index];
> +    bank->start = ram_addr;
> +    bank->size = bank->size + tot_size;
> +
> +    while ( tot_size > 0 )
> +    {
> +        unsigned int order = get_allocation_size(tot_size);
> +
> +        res = guest_physmap_add_page(d, *sgfn, smfn, order);
> +        if ( res )
> +        {
> +            dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
> +            return false;
> +        }
> +
> +        *sgfn = gfn_add(*sgfn, 1UL << order);
> +        smfn = mfn_add(smfn, 1UL << order);
> +        tot_size -= (1ULL << (PAGE_SHIFT + order));
> +    }
> +
> +    kinfo->mem.nr_banks = ram_index + 1;
> +    kinfo->unassigned_mem -= _size;
> +
> +    return true;
> +}
> +
>   static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>   {
>       unsigned int i;
> @@ -480,6 +524,116 @@ fail:
>             (unsigned long)kinfo->unassigned_mem >> 10);
>   }
>   
> +/* Allocate memory from static memory as RAM for one specific domain d. */
> +static void __init allocate_static_memory(struct domain *d,
> +                                            struct kernel_info *kinfo)
> +{
> +    int nr_banks, _banks = 0;

AFAICT, _banks is the index in the array. I think it would be clearer if 
it is caller 'bank' or 'idx'.

> +    size_t ram0_size = GUEST_RAM0_SIZE, ram1_size = GUEST_RAM1_SIZE;
> +    paddr_t bank_start, bank_size;
> +    gfn_t sgfn;
> +    mfn_t smfn;
> +
> +    kinfo->mem.nr_banks = 0;
> +    sgfn = gaddr_to_gfn(GUEST_RAM0_BASE);
> +    nr_banks = d->arch.static_mem.nr_banks;
> +    ASSERT(nr_banks >= 0);
> +
> +    if ( kinfo->unassigned_mem <= 0 )
> +        goto fail;
> +
> +    while ( _banks < nr_banks )
> +    {
> +        bank_start = d->arch.static_mem.bank[_banks].start;
> +        smfn = maddr_to_mfn(bank_start);
> +        bank_size = d->arch.static_mem.bank[_banks].size;

The variable name are slightly confusing because it doesn't tell whether 
this is physical are guest RAM. You might want to consider to prefix 
them with p (resp. g) for physical (resp. guest) RAM.

> +
> +        if ( !alloc_domstatic_pages(d, bank_size >> PAGE_SHIFT, bank_start, 0) )
> +        {
> +            printk(XENLOG_ERR
> +                    "%pd: cannot allocate static memory"
> +                    "(0x%"PRIx64" - 0x%"PRIx64")",

bank_start and bank_size are both paddr_t. So this should be PRIpaddr.

> +                    d, bank_start, bank_start + bank_size);
> +            goto fail;
> +        }
> +
> +        /*
> +         * By default, it shall be mapped to the fixed guest RAM address
> +         * `GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`.
> +         * Starting from RAM0(GUEST_RAM0_BASE).
> +         */

Ok. So you are first trying to exhaust the guest bank 0 and then moved 
to bank 1. This wasn't entirely clear from the design document.

I am fine with that, but in this case, the developper should not need to 
know that (in fact this is not part of the ABI).

Regarding this code, I am a bit concerned about the scalability if we 
introduce a second bank.

Can we have an array of the possible guest banks and increment the index 
when exhausting the current bank?

Cheers,

-- 
Julien Grall

