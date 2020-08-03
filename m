Return-Path: <SRS0=+EUz=BN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD22C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2020 15:59:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE2272072A
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2020 15:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE2272072A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2crb-0002bl-J0; Mon, 03 Aug 2020 15:58:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uwFZ=BN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2cra-0002bg-8q
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 15:58:58 +0000
X-Inumbo-ID: 3c6f5180-d5a2-11ea-90a4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c6f5180-d5a2-11ea-90a4-bc764e2007e4;
 Mon, 03 Aug 2020 15:58:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 50FA3B16E;
 Mon,  3 Aug 2020 15:59:11 +0000 (UTC)
Subject: Re: [PATCH v3 02/11] x86/iommu: add common page-table allocator
To: Paul Durrant <paul@xen.org>
References: <20200803122914.2259-1-paul@xen.org>
 <20200803122914.2259-3-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1bc6fcbe-534a-b056-7744-e96eb4f09757@suse.com>
Date: Mon, 3 Aug 2020 17:58:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200803122914.2259-3-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.08.2020 14:29, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Instead of having separate page table allocation functions in VT-d and AMD
> IOMMU code, we could use a common allocation function in the general x86 code.
> 
> This patch adds a new allocation function, iommu_alloc_pgtable(), for this
> purpose. The function adds the page table pages to a list. The pages in this
> list are then freed by iommu_free_pgtables(), which is called by
> domain_relinquish_resources() after PCI devices have been de-assigned.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> 
> v2:
>  - This is split out from a larger patch of the same name in v1
> ---
>  xen/arch/x86/domain.c               |  9 +++++-
>  xen/drivers/passthrough/x86/iommu.c | 50 +++++++++++++++++++++++++++++
>  xen/include/asm-x86/iommu.h         |  7 ++++
>  3 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index f8084dc9e3..d1ecc7b83b 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2153,7 +2153,8 @@ int domain_relinquish_resources(struct domain *d)
>          d->arch.rel_priv = PROG_ ## x; /* Fallthrough */ case PROG_ ## x
>  
>          enum {
> -            PROG_paging = 1,
> +            PROG_iommu_pagetables = 1,
> +            PROG_paging,
>              PROG_vcpu_pagetables,
>              PROG_shared,
>              PROG_xen,

Is there a particular reason to make this new item the very first
one?

> @@ -257,6 +260,53 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>          return;
>  }
>  
> +int iommu_free_pgtables(struct domain *d)
> +{
> +    struct domain_iommu *hd = dom_iommu(d);
> +    struct page_info *pg;
> +
> +    while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
> +    {
> +        free_domheap_page(pg);
> +
> +        if ( general_preempt_check() )
> +            return -ERESTART;

Perhaps better only check once every so many pages?

> +struct page_info *iommu_alloc_pgtable(struct domain *d)
> +{
> +    struct domain_iommu *hd = dom_iommu(d);
> +    unsigned int memflags = 0;
> +    struct page_info *pg;
> +    void *p;
> +
> +#ifdef CONFIG_NUMA
> +    if (hd->node != NUMA_NO_NODE)

Missing blanks inside parentheses.

> @@ -131,6 +135,9 @@ int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
>          iommu_vcall(ops, sync_cache, addr, size);       \
>  })
>  
> +int __must_check iommu_free_pgtables(struct domain *d);
> +struct page_info * __must_check iommu_alloc_pgtable(struct domain *d);

Commonly we put a blank on the left side of *, but none to its right.

Jan

