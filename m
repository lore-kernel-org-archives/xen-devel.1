Return-Path: <SRS0=FDQh=L6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF9CC07E96
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 09:40:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6BCA61995
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 09:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6BCA61995
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.150963.279063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0hYI-0007aT-8h; Tue, 06 Jul 2021 09:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150963.279063; Tue, 06 Jul 2021 09:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0hYI-0007aM-5X; Tue, 06 Jul 2021 09:39:38 +0000
Received: by outflank-mailman (input) for mailman id 150963;
 Tue, 06 Jul 2021 09:39:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m0hYH-0007aG-4y
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 09:39:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0hYG-0005yq-Rb; Tue, 06 Jul 2021 09:39:36 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0hYG-0000rz-L1; Tue, 06 Jul 2021 09:39:36 +0000
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
	bh=/VX9nd6K+ZmccVXF72yysg9mlQ4BAirww3PVC5N0+Y0=; b=uSOTSOCmOBAGPaln3ltDt9v/5z
	Dnyho7IWaEJuO2YmE1umOYVaeCOUOW4c9LgS+WJwtB5fKcSdsB8Tpm/tt1y2DGBuehd4FSTUmfFkg
	DVZO/N40FEnsLTrCzxp07IVBHSl8WnFjj974IcU75qav4mtrftPrBW06bzfE7anNgfH8=;
Subject: Re: [PATCH 6/9] xen/arm: introduce alloc_staticmem_pages and
 alloc_domstatic_pages
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-7-penny.zheng@arm.com>
 <c31a85c3-89ea-76a4-3b29-a411d419fb59@suse.com>
 <VE1PR08MB5215E2802F3DE22F1F244023F71B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <caa11a54-acb6-928d-de3a-8e081a7c3d34@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c6ab1b8d-1598-f7fc-f717-f58f8e0aba68@xen.org>
Date: Tue, 6 Jul 2021 10:39:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <caa11a54-acb6-928d-de3a-8e081a7c3d34@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan & Penny,

On 06/07/2021 07:53, Jan Beulich wrote:
> On 06.07.2021 07:58, Penny Zheng wrote:
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: Thursday, June 10, 2021 6:23 PM
>>>
>>> On 07.06.2021 04:43, Penny Zheng wrote:
>>>> --- a/xen/common/page_alloc.c
>>>> +++ b/xen/common/page_alloc.c
>>>> @@ -1065,6 +1065,75 @@ static struct page_info *alloc_heap_pages(
>>>>       return pg;
>>>>   }
>>>>
>>>> +#ifdef CONFIG_STATIC_ALLOCATION
>>>> +/*
>>>> + * Allocate nr_mfns contiguous pages, starting at #smfn, of static memory.
>>>> + * It is the equivalent of alloc_heap_pages for static memory  */
>>>> +static struct page_info *alloc_staticmem_pages(unsigned long nr_mfns,
>>>> +                                               mfn_t smfn,
>>>> +                                               unsigned int memflags)
>>>> +{
>>>> +    bool need_tlbflush = false;
>>>> +    uint32_t tlbflush_timestamp = 0;
>>>> +    unsigned long i;
>>>> +    struct page_info *pg;
>>>> +
>>>> +    /* For now, it only supports allocating at specified address. */
>>>> +    if ( !mfn_valid(smfn) || !nr_mfns )
>>>> +    {
>>>> +        printk(XENLOG_ERR
>>>> +               "Invalid %lu static memory starting at %"PRI_mfn"\n",
>>>
>>> Reading a log containing e.g. "Invalid 0 static memory starting at ..." I don't
>>> think I would recognize that the "0" is the count of pages.
>>
>> Sure. How about "try to allocate out of range page %"PRI_mfn"\n"?
> 
> This still doesn't convey _both_ parts of the if() that would cause
> the log message to be issued.
> 
>>>> +               nr_mfns, mfn_x(smfn));
>>>> +        return NULL;
>>>> +    }
>>>> +    pg = mfn_to_page(smfn);
>>>> +
>>>> +    for ( i = 0; i < nr_mfns; i++ )
>>>> +    {
>>>> +        /*
>>>> +         * Reference count must continuously be zero for free pages
>>>> +         * of static memory(PGC_reserved).
>>>> +         */
>>>> +        ASSERT(pg[i].count_info & PGC_reserved);
>>>
>>> What logic elsewhere guarantees that this will hold? ASSERT()s are to verify
>>> that assumptions are met. But I don't think you can sensibly assume the caller
>>> knows the range is reserved (and free), or else you could get away without any
>>> allocation function.
>>
>> The caller shall only call alloc_staticmem_pages when it knows range is reserved,
>> like, alloc_staticmem_pages is only called in the context of alloc_domstatic_pages
>> for now.
> 
> If the caller knows the static ranges, this isn't really "allocation".
> I.e. I then question the need for "allocating" in the first place.

We still need to setup the page so the reference counting works 
properly. So can you clarify whether you are objecting on the name? If 
yes, do you have a better suggestion?

Cheers,

-- 
Julien Grall

