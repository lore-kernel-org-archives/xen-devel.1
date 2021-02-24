Return-Path: <SRS0=y6zA=H2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FF0C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 14:07:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFD3264E2B
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 14:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFD3264E2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89360.168242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEuor-00066p-NJ; Wed, 24 Feb 2021 14:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89360.168242; Wed, 24 Feb 2021 14:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEuor-00066i-K6; Wed, 24 Feb 2021 14:07:13 +0000
Received: by outflank-mailman (input) for mailman id 89360;
 Wed, 24 Feb 2021 14:07:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEuoq-00066d-NZ
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 14:07:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03393f60-9fba-422f-86a4-d19239253c23;
 Wed, 24 Feb 2021 14:07:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1281AAD5C;
 Wed, 24 Feb 2021 14:07:10 +0000 (UTC)
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
X-Inumbo-ID: 03393f60-9fba-422f-86a4-d19239253c23
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614175630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AaZrvd0hlbCE7Mcy+OTHJieEox1to3Lvp/Fc03YRH3k=;
	b=IuluAClreHDvA3iq4Un+HAw0bK7YlfvnnVKiSwf9aQcovOz4q5raO97J3Vg3jAotHm4J1D
	j1vbVwPKv2IVAguXBIXK0SW7izWQEoTIt3BZ4qb8Yxg8yy4O9Ry2d/iNqEr4vlLEVIcXOY
	s1QSbBm+T7uvQDX1mxBktYUxiyB7uTc=
Subject: Re: [for-4.15][RESEND PATCH v4 1/2] xen/x86: iommu: Ignore IOMMU
 mapping requests when a domain is dying
To: Julien Grall <julien@xen.org>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210224094356.7606-1-julien@xen.org>
 <20210224094356.7606-2-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d5a09319-614d-398b-b911-bc2533bec587@suse.com>
Date: Wed, 24 Feb 2021 15:07:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210224094356.7606-2-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.02.2021 10:43, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The new x86 IOMMU page-tables allocator will release the pages when
> relinquishing the domain resources. However, this is not sufficient
> when the domain is dying because nothing prevents page-table to be
> allocated.
> 
> As the domain is dying, it is not necessary to continue to modify the
> IOMMU page-tables as they are going to be destroyed soon.
> 
> At the moment, page-table allocates will only happen when iommu_map().
> So after this change there will be no more page-table allocation
> happening.

While I'm still not happy about this asymmetry, I'm willing to accept
it in the interest of getting the underlying issue addressed. May I
ask though that you add something like "... because we don't use
superpage mappings yet when not sharing page tables"?

But there are two more minor things:

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -267,6 +267,12 @@ int iommu_free_pgtables(struct domain *d)
>      struct page_info *pg;
>      unsigned int done = 0;
>  
> +    if ( !is_iommu_enabled(d) )
> +        return 0;

Why is this addition needed? Hitting a not yet initialize spin lock
is - afaict - no worse than a not yet initialized list, so it would
seem to me that this can't be the reason. No other reason looks to
be called out by the description.

> +    /* After this barrier, no more IOMMU mapping can happen */
> +    spin_barrier(&hd->arch.mapping_lock);

On the v3 discussion I thought you did agree to change the wording
of the comment to something like "no new IOMMU mappings can be
inserted"?

Jan

