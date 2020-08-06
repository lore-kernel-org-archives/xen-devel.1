Return-Path: <SRS0=cbMO=BQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E09C433DF
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 12:53:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EABF523117
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 12:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EABF523117
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3fOr-0005uH-LI; Thu, 06 Aug 2020 12:53:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3fOq-0005uC-QE
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 12:53:36 +0000
X-Inumbo-ID: 06a152a4-15d3-41eb-b53a-737220859221
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06a152a4-15d3-41eb-b53a-737220859221;
 Thu, 06 Aug 2020 12:53:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C54FAE09;
 Thu,  6 Aug 2020 12:53:52 +0000 (UTC)
Subject: Re: [PATCH v4 14/14] vtd: use a bit field for dma_pte
To: Paul Durrant <paul@xen.org>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-15-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <918260ba-0241-80eb-567c-a2d48419c12a@suse.com>
Date: Thu, 6 Aug 2020 14:53:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200804134209.8717-15-paul@xen.org>
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Kevin Tian <kevin.tian@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.2020 15:42, Paul Durrant wrote:
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1772,13 +1772,14 @@ static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
>      old = *pte;
>  
>      dma_set_pte_addr(new, mfn_to_maddr(mfn));
> -    dma_set_pte_prot(new,
> -                     ((flags & IOMMUF_readable) ? DMA_PTE_READ  : 0) |
> -                     ((flags & IOMMUF_writable) ? DMA_PTE_WRITE : 0));
> +    if ( flags & IOMMUF_readable )
> +        dma_set_pte_readable(new);
> +    if ( flags & IOMMUF_writable )
> +        dma_set_pte_writable(new);
>  
>      /* Set the SNP on leaf page table if Snoop Control available */
>      if ( iommu_snoop )
> -        dma_set_pte_snp(new);
> +        dma_set_pte_snoop(new);

Perhaps simply use an initializer:

    new = (struct dma_ptr){
            .r = flags & IOMMUF_readable,
            .w = flags & IOMMUF_writable,
            .snp = iommu_snoop,
            .addr = mfn_x(mfn),
        };

? This also points out that the "addr" field isn't really an address,
and hence may want renaming.

Again comments on the two earlier patch apply here respectively (or
else part of the suggestion above isn't going to work as is).

Jan

