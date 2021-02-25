Return-Path: <SRS0=BiGO=H3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D40C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 11:56:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0320764F13
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 11:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0320764F13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89684.169132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFFFh-0007jZ-TM; Thu, 25 Feb 2021 11:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89684.169132; Thu, 25 Feb 2021 11:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFFFh-0007jS-QP; Thu, 25 Feb 2021 11:56:17 +0000
Received: by outflank-mailman (input) for mailman id 89684;
 Thu, 25 Feb 2021 11:56:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFFFh-0007jN-0c
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 11:56:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFFFe-0007mj-Ok; Thu, 25 Feb 2021 11:56:14 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFFFe-0005u3-GS; Thu, 25 Feb 2021 11:56:14 +0000
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
	bh=jfKE6v+97vvm05vcCCHW1xOpycuNa1wG849fCaL3QJM=; b=hizpKIfJSLB4OaAq+rnNW0pq95
	H7rXYuggxgpXR4jvacL65kdK1GHmgLaQLbkAfSfgWHqHoI1y8ae8ot8A3dN7oBBrm5IIpG7Zrb3Fc
	UCSB0Yk47YBwQARvxrmAKQ3c3IO2wyfFikvVH9tZqZVyHFaHIFrQD482490Ujo1865DA=;
Subject: Re: [for-4.15][RESEND PATCH v4 1/2] xen/x86: iommu: Ignore IOMMU
 mapping requests when a domain is dying
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210224094356.7606-1-julien@xen.org>
 <20210224094356.7606-2-julien@xen.org>
 <d5a09319-614d-398b-b911-bc2533bec587@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7ce1deb9-e362-439c-dd14-a17dbb6fb1c8@xen.org>
Date: Thu, 25 Feb 2021 11:56:12 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d5a09319-614d-398b-b911-bc2533bec587@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 24/02/2021 14:07, Jan Beulich wrote:
> On 24.02.2021 10:43, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The new x86 IOMMU page-tables allocator will release the pages when
>> relinquishing the domain resources. However, this is not sufficient
>> when the domain is dying because nothing prevents page-table to be
>> allocated.
>>
>> As the domain is dying, it is not necessary to continue to modify the
>> IOMMU page-tables as they are going to be destroyed soon.
>>
>> At the moment, page-table allocates will only happen when iommu_map().
>> So after this change there will be no more page-table allocation
>> happening.
> 
> While I'm still not happy about this asymmetry, I'm willing to accept
> it in the interest of getting the underlying issue addressed. May I
> ask though that you add something like "... because we don't use
> superpage mappings yet when not sharing page tables"?

Sure.

> But there are two more minor things:
> 
>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -267,6 +267,12 @@ int iommu_free_pgtables(struct domain *d)
>>       struct page_info *pg;
>>       unsigned int done = 0;
>>   
>> +    if ( !is_iommu_enabled(d) )
>> +        return 0;
> 
> Why is this addition needed? Hitting a not yet initialize spin lock
> is - afaict - no worse than a not yet initialized list, so it would
> seem to me that this can't be the reason. No other reason looks to
> be called out by the description.

struct domain_iommu will be initially zeroed as it is part of struct domain.

For the list, we are so far fine because page_list_remove_head() 
tolerates NULL. If we were using the normal list operations (e.g. 
list_del), then this code would have segfaulted.

Now about the spinlock, at least lock debugging expects a non-zero 
initial value. We are lucky here because this path is not called with 
IRQ disabled. If it were, Xen would crash as it would consider the lock 
was used in a non-IRQ safe environment.

So in the spinlock case, we are really playing with the fire. Hence, the 
check here.

>> +    /* After this barrier, no more IOMMU mapping can happen */
>> +    spin_barrier(&hd->arch.mapping_lock);
> 
> On the v3 discussion I thought you did agree to change the wording
> of the comment to something like "no new IOMMU mappings can be
> inserted"?

Sorry I missed this comment. I will update it in the next version.

Cheers,

-- 
Julien Grall

