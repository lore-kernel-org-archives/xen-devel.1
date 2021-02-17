Return-Path: <SRS0=/9Q0=HT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E60C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 17 Feb 2021 15:13:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E077B64E33
	for <xen-devel@archiver.kernel.org>; Wed, 17 Feb 2021 15:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E077B64E33
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.86313.161967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCOWG-0002Lg-NW; Wed, 17 Feb 2021 15:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86313.161967; Wed, 17 Feb 2021 15:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCOWG-0002LZ-KU; Wed, 17 Feb 2021 15:13:36 +0000
Received: by outflank-mailman (input) for mailman id 86313;
 Wed, 17 Feb 2021 15:13:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCOWF-0002LU-Eh
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 15:13:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee381065-6981-45b0-afd8-7c2aad9b7d6c;
 Wed, 17 Feb 2021 15:13:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70CFAB90D;
 Wed, 17 Feb 2021 15:13:33 +0000 (UTC)
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
X-Inumbo-ID: ee381065-6981-45b0-afd8-7c2aad9b7d6c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613574813; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i7EBXH+yfdd8lzydHD+wFYX2HKu7Kze86WnApKq84eU=;
	b=ijCMpvGLhyGn1ZKUMHciSd8UB2ZAUojlUibCJfW0JLxxaemVsAzRUrrVMhjNhM9orl/MYf
	/hC1YIsfhnnORbcDKT+vDt73SP2A/K6K0JoQJuvMyqfu6iXRqdpaQF0N3mwlb7Mdio3lgs
	7KlcK9o8m9AgJTt1tUmmurXOTsO+8A8=
Subject: Re: [for-4.15][PATCH v3 3/3] xen/iommu: x86: Harden the IOMMU
 page-table allocator
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210217142458.3769-1-julien@xen.org>
 <20210217142458.3769-4-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf303aee-3d89-5608-f358-6bef5c32d706@suse.com>
Date: Wed, 17 Feb 2021 16:13:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210217142458.3769-4-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.02.2021 15:24, Julien Grall wrote:> --- a/xen/drivers/passthrough/x86/iommu.c> +++ b/xen/drivers/passthrough/x86/iommu.c> @@ -149,6 +149,13 @@ int arch_iommu_domain_init(struct domain *d)>  >  void arch_iommu_domain_destroy(struct domain *d)>  {> +    /*> +     * There should be not page-tables left allocated by the time the
Nit: s/not/no/ ?

> +     * domain is destroyed. Note that arch_iommu_domain_destroy() is
> +     * called unconditionally, so pgtables may be unitialized.
> +     */
> +    ASSERT(dom_iommu(d)->platform_ops == NULL ||
> +           page_list_empty(&dom_iommu(d)->arch.pgtables.list));
>  }
>  
>  static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
> @@ -279,6 +286,9 @@ int iommu_free_pgtables(struct domain *d)
>       */
>      hd->platform_ops->clear_root_pgtable(d);
>  
> +    /* After this barrier no new page allocations can occur. */
> +    spin_barrier(&hd->arch.pgtables.lock);

Didn't patch 2 utilize the call to ->clear_root_pgtable() itself as
the barrier? Why introduce another one (with a similar comment)
explicitly now?

> @@ -315,9 +326,29 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
>      unmap_domain_page(p);
>  
>      spin_lock(&hd->arch.pgtables.lock);
> -    page_list_add(pg, &hd->arch.pgtables.list);
> +    /*
> +     * The IOMMU page-tables are freed when relinquishing the domain, but
> +     * nothing prevent allocation to happen afterwards. There is no valid
> +     * reasons to continue to update the IOMMU page-tables while the
> +     * domain is dying.
> +     *
> +     * So prevent page-table allocation when the domain is dying.
> +     *
> +     * We relying on &hd->arch.pgtables.lock to synchronize d->is_dying.
> +     */
> +    if ( likely(!d->is_dying) )
> +    {
> +        alive = true;
> +        page_list_add(pg, &hd->arch.pgtables.list);
> +    }
>      spin_unlock(&hd->arch.pgtables.lock);
>  
> +    if ( unlikely(!alive) )
> +    {
> +        free_domheap_page(pg);
> +        pg = NULL;
> +    }
> +
>      return pg;
>  }

As before I'm concerned of this forcing error paths to be taken
elsewhere, in case an allocation still happens (e.g. from unmap
once super page mappings are supported). Considering some of the
error handling in the IOMMU code is to invoke domain_crash(), it
would be quite unfortunate if we ended up crashing a domain
while it is being cleaned up after.

Additionally, the (at present still hypothetical) unmap case, if
failing because of the change here, would then again chance to
leave mappings in place while the underlying pages get freed. As
this would likely require an XSA, the change doesn't feel like
"hardening" to me.

Jan

