Return-Path: <SRS0=cbMO=BQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04183C433E1
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 12:19:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D06CA204FD
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 12:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D06CA204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3erL-0002H4-8U; Thu, 06 Aug 2020 12:18:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3erK-0002Gz-8r
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 12:18:58 +0000
X-Inumbo-ID: caa4109b-9966-41a1-96b1-177eed54cf97
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id caa4109b-9966-41a1-96b1-177eed54cf97;
 Thu, 06 Aug 2020 12:18:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CAE5BAD89;
 Thu,  6 Aug 2020 12:19:13 +0000 (UTC)
Subject: Re: [PATCH v4 10/14] iommu: remove the share_p2m operation
To: Paul Durrant <paul@xen.org>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-11-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d19fe76d-2972-2e8d-86a1-08741dca0f9d@suse.com>
Date: Thu, 6 Aug 2020 14:18:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200804134209.8717-11-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.2020 15:42, Paul Durrant wrote:
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -318,6 +318,48 @@ static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int alloc)
>      return pte_maddr;
>  }
>  
> +static uint64_t domain_pgd_maddr(struct domain *d, struct vtd_iommu *iommu)

The 2nd param can be const, and I wonder whether it wouldn't better be
named e.g. "vtd". Then again all you're after is iommu->nr_pt_levels,
so maybe the caller would better pass in that value (removing the
appearance of there being some further dependency about the specific
IOMMU's properties)?

> +{
> +    struct domain_iommu *hd = dom_iommu(d);
> +    uint64_t pgd_maddr;
> +    unsigned int agaw;
> +
> +    ASSERT(spin_is_locked(&hd->arch.mapping_lock));
> +
> +    if ( iommu_use_hap_pt(d) )
> +    {
> +        mfn_t pgd_mfn =
> +            pagetable_get_mfn(p2m_get_pagetable(p2m_get_hostp2m(d)));
> +
> +        return pagetable_get_paddr(pagetable_from_mfn(pgd_mfn));

Why the pagetable -> MFN -> pagetable -> paddr transformation? I.e. just

        return pagetable_get_paddr(p2m_get_pagetable(p2m_get_hostp2m(d)));

? Oh, I've now realized that's how the old code was written.

> +    }
> +
> +    if ( !hd->arch.vtd.pgd_maddr )
> +    {
> +        addr_to_dma_page_maddr(d, 0, 1);
> +
> +        if ( !hd->arch.vtd.pgd_maddr )
> +            return 0;
> +    }
> +
> +    pgd_maddr = hd->arch.vtd.pgd_maddr;
> +
> +    /* Skip top levels of page tables for 2- and 3-level DRHDs. */
> +    for ( agaw = level_to_agaw(4);
> +          agaw != level_to_agaw(iommu->nr_pt_levels);
> +          agaw-- )
> +    {
> +        struct dma_pte *p = map_vtd_domain_page(pgd_maddr);

const?

> +
> +        pgd_maddr = dma_pte_addr(*p);
> +        unmap_vtd_domain_page(p);
> +        if ( !pgd_maddr )
> +            return 0;
> +    }
> +
> +    return pgd_maddr;
> +}

Jan

