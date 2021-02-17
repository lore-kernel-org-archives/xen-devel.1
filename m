Return-Path: <SRS0=/9Q0=HT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3A8C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 17 Feb 2021 16:07:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA5D861481
	for <xen-devel@archiver.kernel.org>; Wed, 17 Feb 2021 16:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA5D861481
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.86340.162042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPM4-00085f-AW; Wed, 17 Feb 2021 16:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86340.162042; Wed, 17 Feb 2021 16:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCPM4-00085Y-6R; Wed, 17 Feb 2021 16:07:08 +0000
Received: by outflank-mailman (input) for mailman id 86340;
 Wed, 17 Feb 2021 16:07:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCPM2-00085T-6c
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 16:07:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCPLz-0006t3-Vb; Wed, 17 Feb 2021 16:07:03 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCPLz-00058q-Lk; Wed, 17 Feb 2021 16:07:03 +0000
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
	bh=xcnzsdAIA2LNIs/7vC0zkePqE7Axn2nUGgNJd7ObN5s=; b=UaymHbSaRMAsimqRxPTaHSI14Y
	Yt3qltAcQJMch0HRWwNLW9ksJm8j8mGXkr2pg4RSOXjQUahqkAvqTx8lEo8ctfBxyKI/pksixQVdT
	DAQJKHPMT95tqD++FEVj353jSLIzmZX1IjqghlvRXiGkPRw4Vk5eD1ttTxZlCs07bGsg=;
Subject: Re: [for-4.15][PATCH v3 2/3] xen/x86: iommu: Ignore IOMMU mapping
 requests when a domain is dying
To: Jan Beulich <jbeulich@suse.com>
Cc: hongyxia@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210217142458.3769-1-julien@xen.org>
 <20210217142458.3769-3-julien@xen.org>
 <20f68b12-a767-b1d3-a3dd-9f92172def5f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d1116875-dd98-8f51-9113-314c1a62b4bf@xen.org>
Date: Wed, 17 Feb 2021 16:07:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20f68b12-a767-b1d3-a3dd-9f92172def5f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 17/02/2021 15:01, Jan Beulich wrote:
> On 17.02.2021 15:24, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The new x86 IOMMU page-tables allocator will release the pages when
>> relinquishing the domain resources. However, this is not sufficient
>> when the domain is dying because nothing prevents page-table to be
>> allocated.
>>
>> Currently page-table allocations can only happen from iommu_map(). As
>> the domain is dying, there is no good reason to continue to modify the
>> IOMMU page-tables.
> 
> While I agree this to be the case right now, I'm not sure it is a
> good idea to build on it (in that you leave the unmap paths
> untouched).

I don't build on that assumption. See next patch.

> Imo there's a fair chance this would be overlooked at
> the point super page mappings get introduced (which has been long
> overdue), and I thought prior discussion had lead to a possible
> approach without risking use-after-free due to squashed unmap
> requests.

I know you suggested to zap the root page-tables... However, I don't 
think this is 4.15 material and you agree with this (you were the one 
pointed out that out).

>> --- a/xen/drivers/passthrough/x86/iommu.c
>> +++ b/xen/drivers/passthrough/x86/iommu.c
>> @@ -273,6 +273,9 @@ int iommu_free_pgtables(struct domain *d)
>>       /*
>>        * Pages will be moved to the free list below. So we want to
>>        * clear the root page-table to avoid any potential use after-free.
>> +     *
>> +     * After this call, no more IOMMU mapping can happen.
>> +     *
>>        */
>>       hd->platform_ops->clear_root_pgtable(d);
> 
> I.e. you utilize the call in place of spin_barrier(). Maybe worth
> saying in the comment?

Sure.

> 
> Also, nit: Stray blank comment line.

Cheers,

-- 
Julien Grall

