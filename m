Return-Path: <SRS0=Jb4W=DF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E6AC2D0A8
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 10:40:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 904FE206F7
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 10:40:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="4zWB8WGw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 904FE206F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMqZX-0002Kr-Aa; Mon, 28 Sep 2020 10:39:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eCUB=DF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kMqZW-0002Km-HN
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 10:39:54 +0000
X-Inumbo-ID: 0bea2508-2284-4966-b602-fc71e38a3772
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bea2508-2284-4966-b602-fc71e38a3772;
 Mon, 28 Sep 2020 10:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=xtx7/VZA3T4GV0uPNSP5l1jVxUOkgAE8aNGWWXjfoIQ=; b=4zWB8WGw0o10U/R1E+Ap1NcHZs
 xXneTRoVfVegNF8pMFECN9K0cyjMd8dHReJhHe9z7PshwOsvU+nbjRpwXd5929Ks3FK40cYOpr3kZ
 yYooYFEgRfLpaw5iETpABh9FkjYDIG1AQBOiD8r7l5KFNhZLsW6sNvvjA8gREj7pm0kc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kMqZO-0008OG-H6; Mon, 28 Sep 2020 10:39:46 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kMqZO-0004w0-6p; Mon, 28 Sep 2020 10:39:46 +0000
Subject: Re: [PATCH 1/4] xen/acpi: Rework acpi_os_map_memory() and
 acpi_os_unmap_memory()
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
 masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200926205542.9261-1-julien@xen.org>
 <20200926205542.9261-2-julien@xen.org>
 <fe055799-de10-891a-bcee-bbb01a8c0b3d@suse.com>
 <b5624bfa-f24b-4c0a-6735-3473892fbd2f@xen.org>
 <a07b59a0-41a3-ee4e-f28a-38499a2a4055@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0d7d239e-a9ca-394a-9c7c-19f3aead6790@xen.org>
Date: Mon, 28 Sep 2020 11:39:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a07b59a0-41a3-ee4e-f28a-38499a2a4055@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 28/09/2020 11:09, Jan Beulich wrote:
> On 28.09.2020 11:58, Julien Grall wrote:
>> On 28/09/2020 09:18, Jan Beulich wrote:
>>> On 26.09.2020 22:55, Julien Grall wrote:
>>>> --- a/xen/arch/x86/acpi/lib.c
>>>> +++ b/xen/arch/x86/acpi/lib.c
>>>> @@ -46,6 +46,10 @@ char *__acpi_map_table(paddr_t phys, unsigned long size)
>>>>    	if ((phys + size) <= (1 * 1024 * 1024))
>>>>    		return __va(phys);
>>>>    
>>>> +	/* No arch specific implementation after early boot */
>>>> +	if (system_state >= SYS_STATE_boot)
>>>> +		return NULL;
>>>
>>> Considering the code in context above, the comment isn't entirely
>>> correct.
>>
>> How about "No arch specific implementation after early boot but for the
>> first 1MB"?
> 
> That or simply "No further ...".

I will do that.

>>>> +{
>>>> +	unsigned long vaddr = (unsigned long)ptr;
>>>> +
>>>> +	if (vaddr >= DIRECTMAP_VIRT_START &&
>>>> +	    vaddr < DIRECTMAP_VIRT_END) {
>>>> +		ASSERT(!((__pa(ptr) + size - 1) >> 20));
>>>> +		return true;
>>>> +	}
>>>> +
>>>> +	return (vaddr >= __fix_to_virt(FIX_ACPI_END)) &&
>>>> +		(vaddr < (__fix_to_virt(FIX_ACPI_BEGIN) + PAGE_SIZE));
>>>
>>> Indentation is slightly wrong here.
>>
>> This is Linux coding style and therefore is using hard tab. Care to
>> explain the problem?
> 
> The two opening parentheses should align with one another,
> shouldn't they?

Hmmm... somehow vim wants to indent this way. I am not entirely sure why...

I will force the indentation manually.

> 
>>>> +	ptr = __vmap(&mfn, PFN_UP(offs + size), 1, 1,
>>>> +		     ACPI_MAP_MEM_ATTR, VMAP_DEFAULT);
>>>> +
>>>> +	return !ptr ? NULL : (ptr + offs);
>>>
>>> Slightly odd that you don't let the success case go first,
>>
>> I don't really see the problem. Are you nitpicking?
>>
>>> the more that it's minimally shorter:
>>>
>>> 	return ptr ? ptr + offs : NULL;
> 
> Well, I said "slightly odd" as sort of a replacement of "Nit:".
> But I really think it would be more logical the other way
> around, not so much for how it looks like, but to aid the not
> uncommon compiler heuristics of assuming the "true" path is
> the common one.

Ah, you are trying to outsmart the compilers again...

Cheers,

-- 
Julien Grall

