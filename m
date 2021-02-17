Return-Path: <SRS0=/9Q0=HT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADD1C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 17 Feb 2021 15:00:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AABF64E2F
	for <xen-devel@archiver.kernel.org>; Wed, 17 Feb 2021 15:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AABF64E2F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.86307.161943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCOJo-0001C7-A6; Wed, 17 Feb 2021 15:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86307.161943; Wed, 17 Feb 2021 15:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCOJo-0001C0-6n; Wed, 17 Feb 2021 15:00:44 +0000
Received: by outflank-mailman (input) for mailman id 86307;
 Wed, 17 Feb 2021 15:00:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCOJm-0001Bv-IG
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 15:00:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCOJj-0005Gs-K8; Wed, 17 Feb 2021 15:00:39 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCOJj-0007yi-BB; Wed, 17 Feb 2021 15:00:39 +0000
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
	bh=cOHzgwAC2Z9qphFZQv3GbMtfyp4vQstE7EdLfDTxIpA=; b=Cq0Vm+Vfm1JJuwsgpavP6jOo4n
	ssIpJoDLdEr6iP3PdOzmHhxzHdtACSvStnL6Zjdp72VPxwKu6QzEotZlggCpQ2VkQZDWEmjL2cbAY
	ZRyf/hCU4m45OA3g2t41BtBUwndsfB/Eh8mWDwrWUgkai2O8U4bN9zV6/SVcVROechaI=;
Subject: Re: [for-4.15][PATCH v3 1/3] xen/iommu: x86: Clear the root
 page-table before freeing the page-tables
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210217142458.3769-1-julien@xen.org>
 <20210217142458.3769-2-julien@xen.org>
 <d20d31ed-4392-a7fb-66ee-575eb254ae84@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <87548d76-36fa-f587-0137-6806280617ad@xen.org>
Date: Wed, 17 Feb 2021 15:00:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d20d31ed-4392-a7fb-66ee-575eb254ae84@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 17/02/2021 14:54, Jan Beulich wrote:
> On 17.02.2021 15:24, Julien Grall wrote:
>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -267,6 +267,15 @@ int iommu_free_pgtables(struct domain *d)
>>       struct page_info *pg;
>>       unsigned int done = 0;
>>   
>> +    if ( !is_iommu_enabled(d) )
>> +        return 0;
>> +
>> +    /*
>> +     * Pages will be moved to the free list below. So we want to
>> +     * clear the root page-table to avoid any potential use after-free.
>> +     */
>> +    hd->platform_ops->clear_root_pgtable(d);
> 
> Taking amd_iommu_alloc_root() as example, is this really correct
> prior to what is now patch 2? 

Yes, there are no more use-after-free...
	
> What guarantees a new root table
> won't get allocated subsequently?

It doesn't prevent root table allocation. I view the two as distincts 
issues, hence the two patches.

Cheers,

-- 
Julien Grall

