Return-Path: <SRS0=BMSw=HM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEAD4C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 10 Feb 2021 09:35:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7004164E37
	for <xen-devel@archiver.kernel.org>; Wed, 10 Feb 2021 09:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7004164E37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83505.155572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9lte-0006OW-4f; Wed, 10 Feb 2021 09:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83505.155572; Wed, 10 Feb 2021 09:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9lte-0006OP-1S; Wed, 10 Feb 2021 09:34:54 +0000
Received: by outflank-mailman (input) for mailman id 83505;
 Wed, 10 Feb 2021 09:34:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9ltc-0006OH-As
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 09:34:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9ltZ-00063z-RE; Wed, 10 Feb 2021 09:34:49 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9ltZ-0000tB-K1; Wed, 10 Feb 2021 09:34:49 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=K9Yn1SJvphKf8IhuSW3R+W+2hUnJQyo7vbUspJHeoNM=; b=mwCTUYW8aUWMpYuPp1yInCe1h1
	Z0DlP2vHCoLm47UXXAmJ3tC4gebM6MfUywvzmu1pOsMGg8tAiaSDLw5dRGgHEeYejOzJ1WJkjtQGQ
	MgaWZNuQmhtssVAk1T2XCiwr0+MWsQwVoT1ySmwW1rQU9ipdp+nZdYA9FwSy8Ya790go=;
Subject: Re: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special
 pages in the IOMMU page-tables
From: Julien Grall <julien@xen.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, hongyxia@amazon.co.uk,
 iwj@xenproject.org, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-2-julien@xen.org> <YCOZbNly7YCSNtHY@Air-de-Roger>
 <0910de32-8af9-6c21-b17a-b569aa59c4a4@xen.org>
Message-ID: <a52aaaa5-1cca-3137-c405-4597288b1331@xen.org>
Date: Wed, 10 Feb 2021 09:34:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <0910de32-8af9-6c21-b17a-b569aa59c4a4@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 10/02/2021 08:50, Julien Grall wrote:
> Hi Roger,
> 
> On 10/02/2021 08:29, Roger Pau Monné wrote:
>> On Tue, Feb 09, 2021 at 03:28:12PM +0000, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Currently, the IOMMU page-tables will be populated early in the domain
>>> creation if the hardware is able to virtualize the local APIC. However,
>>> the IOMMU page tables will not be freed during early failure and will
>>> result to a leak.
>>>
>>> An assigned device should not need to DMA into the vLAPIC page, so we
>>> can avoid to map the page in the IOMMU page-tables.
>>>
>>> This statement is also true for any special pages (the vLAPIC page is
>>> one of them). So to take the opportunity to prevent the mapping for all
>>> of them.
>>
>> Hm, OK, while I assume it's likely for special pages to not be target
>> of DMA operations, it's not easy to spot what are special pages.
> 
> Special pages are allocated by Xen for grant-table, vCPU info...
> 
>>
>>> Note that:
>>>      - This is matching the existing behavior with PV guest
>>
>> You might make HVM guests not sharing page-tables 'match' PV
>> behavior, but you are making behavior between HVM guests themselves
>> diverge.
>>
>>
>>>      - This doesn't change the behavior when the P2M is shared with the
>>>      IOMMU. IOW, the special pages will still be accessibled by the
>>>      device.
>>
>> I have to admit I don't like this part at all. Having diverging device
>> mappings depending on whether the page tables are shared or not is
>> bad IMO, as there might be subtle bugs affecting one of the two
>> modes.
>>
>> I get the feeling this is just papering over an existing issue instead
>> of actually fixing it: IOMMU page tables need to be properly freed
>> during early failure.
> 
> My initial approach was to free the IOMMU page tables during early 
> failure (see [1] and [2]). But Jan said the special pages should really 
> not be mapped in the IOMMU ([3]) and he wasn't very happy with freeing 
> the IOMMU pages table for early failure.
> 
> I don't particularly care about the approach as long as we don't leak 
> IOMMU page-tables at the end.
> 
> So please try to find a common ground with Jan here.
> 
> Cheers,
> 
> [1] <20201222154338.9459-1-julien@xen.org>
> [2] <20201222154338.9459-5-julien@xen.org>

Roger pointed out on IRC that I forgot to add a link for [3]. So here we go:

[3] <a22f7364-518f-ea5f-3b87-5c0462cfc193@suse.com>

Cheers,

-- 
Julien Grall

