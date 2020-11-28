Return-Path: <SRS0=f3nK=FC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53094C63697
	for <xen-devel@archiver.kernel.org>; Sat, 28 Nov 2020 11:54:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB49722268
	for <xen-devel@archiver.kernel.org>; Sat, 28 Nov 2020 11:54:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="omxf2WG2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB49722268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.39974.73037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiynZ-0003mz-0Z; Sat, 28 Nov 2020 11:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39974.73037; Sat, 28 Nov 2020 11:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiynY-0003ms-TD; Sat, 28 Nov 2020 11:53:52 +0000
Received: by outflank-mailman (input) for mailman id 39974;
 Sat, 28 Nov 2020 11:53:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kiynX-0003mm-6C
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2020 11:53:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiynV-0005WV-Pr; Sat, 28 Nov 2020 11:53:49 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiynV-0006Gr-H0; Sat, 28 Nov 2020 11:53:49 +0000
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
	bh=0MRFU9GEJlCAUQHDbLbvMKBb6H68pNi65RWtgrYNB6E=; b=omxf2WG2ZapdC5zNJzSSrB0Jgj
	9U5ePwNW8sl3XdMrjV4bjS2yPS+YFMcXQXN7XDDs/XEf03i/PmeU4LgntnaK/qccIE1hYyRv0wfFE
	OpKxGU8JaEa5XX+l0Q3r2nBv+4uuo5TfXH6CuzBh5s9XO7HQIbHpiEdXyO19RRsWVxP4=;
Subject: Re: [PATCH RFC 4/6] xen/arm: mm: Allow other mapping size in
 xen_pt_update_entry()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201119190751.22345-1-julien@xen.org>
 <20201119190751.22345-5-julien@xen.org>
 <alpine.DEB.2.21.2011191706420.7979@sstabellini-ThinkPad-T480s>
 <1ba4afef-7efa-6d1a-5929-ec2652dbbb21@xen.org>
 <alpine.DEB.2.21.2011231409050.7979@sstabellini-ThinkPad-T480s>
 <eff4cb40-ac90-940c-aa97-16a5021386d3@xen.org>
 <alpine.DEB.2.21.2011231612330.7979@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <d02e29cb-a4f1-4ebe-a04f-67b4a159a193@xen.org>
Date: Sat, 28 Nov 2020 11:53:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011231612330.7979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 24/11/2020 00:25, Stefano Stabellini wrote:
> On Mon, 23 Nov 2020, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 23/11/2020 22:27, Stefano Stabellini wrote:
>>> On Fri, 20 Nov 2020, Julien Grall wrote:
>>>>>>         /*
>>>>>>          * For arm32, page-tables are different on each CPUs. Yet, they
>>>>>> share
>>>>>> @@ -1265,14 +1287,43 @@ static int xen_pt_update(unsigned long virt,
>>>>>>           spin_lock(&xen_pt_lock);
>>>>>>     -    for ( ; addr < addr_end; addr += PAGE_SIZE )
>>>>>> +    while ( left )
>>>>>>         {
>>>>>> -        rc = xen_pt_update_entry(root, addr, mfn, flags);
>>>>>> +        unsigned int order;
>>>>>> +        unsigned long mask;
>>>>>> +
>>>>>> +        /*
>>>>>> +         * Don't take into account the MFN when removing mapping (i.e
>>>>>> +         * MFN_INVALID) to calculate the correct target order.
>>>>>> +         *
>>>>>> +         * XXX: Support superpage mappings if nr is not aligned to a
>>>>>> +         * superpage size.
>>>>>
>>>>> It would be good to add another sentence to explain that the checks
>>>>> below are simply based on masks and rely on the mfn, vfn, and also
>>>>> nr_mfn to be superpage aligned. (It took me some time to figure it out.)
>>>>
>>>> I am not sure to understand what you wrote here. Could you suggest a
>>>> sentence?
>>>
>>> Something like the following:
>>>
>>> /*
>>>    * Don't take into account the MFN when removing mapping (i.e
>>>    * MFN_INVALID) to calculate the correct target order.
>>>    *
>>>    * This loop relies on mfn, vfn, and nr_mfn, to be all superpage
>>>    * aligned, and it uses `mask' to check for that.
>>
>> Unfortunately, I am still not sure to understand this comment.
>> The loop can deal with any (super)page size (4KB, 2MB, 1GB). There are no
>> assumption on any alignment for mfn, vfn and nr_mfn.
>>
>> By OR-ing the 3 components together, we can use it to find out the maximum
>> size that can be used for the mapping.
>>
>> So can you clarify what you mean?
> 
> In pseudo-code:
> 
>    mask = mfn | vfn | nr_mfns;
>    if (mask & ((1<<FIRST_ORDER) - 1))
>    if (mask & ((1<<SECOND_ORDER) - 1))
>    if (mask & ((1<<THIRD_ORDER) - 1))
>    ...
> 
> As you wrote the mask is used to find the max size that can be used for
> the mapping.
> 
> But let's take nr_mfns out of the equation for a moment for clarity:
> 
>    mask = mfn | vfn;
>    if (mask & ((1<<FIRST_ORDER) - 1))
>    if (mask & ((1<<SECOND_ORDER) - 1))
>    if (mask & ((1<<THIRD_ORDER) - 1))
>    ...
> 
> How would you describe this check? I'd call this an alignment check,
> is it not?
If you take the ``if`` alone, yes they are alignment check. But if you 
take the overall code, then it will just compute which mapping size can 
be used.

However, what I am disputing here is "rely" because there are no 
assumption made on the alignment in the loop (we are able to cater any 
size). In fact, the fact mfn and vfn should be aligned to the mapping 
size is a requirement from the hardware and not the implementation.

Cheers,

-- 
Julien Grall

