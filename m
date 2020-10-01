Return-Path: <SRS0=IV2x=DI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BD8C47420
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 15:15:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEE75208B6
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 15:15:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="gc4Wt2mk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEE75208B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1338.4437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO0IT-00023n-7H; Thu, 01 Oct 2020 15:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338.4437; Thu, 01 Oct 2020 15:15:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO0IT-00023g-2Q; Thu, 01 Oct 2020 15:15:05 +0000
Received: by outflank-mailman (input) for mailman id 1338;
 Thu, 01 Oct 2020 15:15:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gWzX=DI=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kO0IR-00023a-Qa
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 15:15:03 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55192bde-89b2-4eb7-bab5-bf871795e01f;
 Thu, 01 Oct 2020 15:15:03 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kO0IC-0000Vq-Nv; Thu, 01 Oct 2020 15:14:48 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kO0IC-0003LG-4e; Thu, 01 Oct 2020 15:14:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gWzX=DI=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kO0IR-00023a-Qa
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 15:15:03 +0000
X-Inumbo-ID: 55192bde-89b2-4eb7-bab5-bf871795e01f
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 55192bde-89b2-4eb7-bab5-bf871795e01f;
	Thu, 01 Oct 2020 15:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=9DvD4fxxOzIhhFkXL2N/eUTq9f0ag0x4wfuy5TxXWK8=; b=gc4Wt2mkigdAZ+w8wegIiq7faZ
	ZZAjrhamhEs83JcvllqDXKizhpx76renpbfObFUs2fYMOeDyfthm3syf/Bm6/ShmbcBuFwQriB0FC
	24YhbHs6BAaDypgg0FXvy3p86fu46xNDLuhGuS09gYRPkPrbSDk5gMGrobWfYzVCD0xA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kO0IC-0000Vq-Nv; Thu, 01 Oct 2020 15:14:48 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kO0IC-0003LG-4e; Thu, 01 Oct 2020 15:14:48 +0000
Subject: Re: [PATCH 2/4] xen/arm: acpi: The fixmap area should always be
 cleared during failure/unmap
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
 masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Xu <xuwei5@hisilicon.com>
References: <20200926205542.9261-1-julien@xen.org>
 <20200926205542.9261-3-julien@xen.org>
 <alpine.DEB.2.21.2009301711190.10908@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <15c30bad-0a01-bd89-325d-cf2a90a3070b@xen.org>
Date: Thu, 1 Oct 2020 16:14:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2009301711190.10908@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 01/10/2020 01:30, Stefano Stabellini wrote:
> On Sat, 26 Sep 2020, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Commit 022387ee1ad3 "xen/arm: mm: Don't open-code Xen PT update in
>> {set, clear}_fixmap()" enforced that each set_fixmap() should be
>> paired with a clear_fixmap(). Any failure to follow the model would
>> result to a platform crash.
>>
>> Unfortunately, the use of fixmap in the ACPI code was overlooked as it
>> is calling set_fixmap() but not clear_fixmap().
>>
>> The function __acpi_os_map_table() is reworked so:
>>      - We know before the mapping whether the fixmap region is big
>>      enough for the mapping.
>>      - It will fail if the fixmap is always inuse.
> 
> I take you mean "it will fail if the fixmap is *already* in use"?

Yes.

> 
> If so, can it be a problem? Or the expectation is that in practice
> __acpi_os_map_table() will only get called once before SYS_STATE_boot?
> 
> Looking at the code it would seem that even before this patch
> __acpi_os_map_table() wasn't able to handle multiple calls before
> SYS_STATE_boot.

Correct, I am not changing any expectation here. It is only making 
clearer because before commit 022387ee1ad3 we would just overwrite the 
existing mapping with no warning.

After commit 022387ee1ad3, we would just hit the BUG_ON() in set_fixmap().

I will clarify it in the commit message.

[...]

>>   bool __acpi_unmap_table(void *ptr, unsigned long size)
>>   {
>> -    return ( vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) &&
>> -             vaddr < (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE) );
>> +    vaddr_t vaddr = (vaddr_t)ptr;
>> +    unsigned int idx;
>> +
>> +    /* We are only handling fixmap address in the arch code */
>> +    if ( vaddr < FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) ||
>> +         vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_END) )
> 
> The "+ PAGE_SIZE" got lost

Hmmm yes.

> 
> 
>> +        return false;
>> +
>> +    /*
>> +     * __acpi_map_table() will always return a pointer in the first page
>> +     * for the ACPI fixmap region. The caller is expected to free with
>> +     * the same address.
>> +     */
>> +    ASSERT((vaddr & PAGE_MASK) == FIXMAP_ADDR(FIXMAP_ACPI_BEGIN));
>> +
>> +    /* The region allocated fit in the ACPI fixmap region. */
>> +    ASSERT(size < (FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE - vaddr));
>> +    ASSERT(fixmap_inuse);
>> +
>> +    fixmap_inuse = false;
>> +
>> +    size += FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) - vaddr;
> 
> Sorry I got confused.. Shouldn't this be:
> 
>    size += vaddr - FIXMAP_ADDR(FIXMAP_ACPI_BEGIN);
> 
> ?

It should be. :) I guess this was unoticed because vaddr == 
FIXMAP_ADDR(FIXMAP_ACPI_BEGIN) in my testing.

I will fix it.

> 
> 
>> +    idx = FIXMAP_ACPI_BEGIN;
>> +
>> +    do
>> +    {
>> +        clear_fixmap(idx);
>> +        size -= min(size, (unsigned long)PAGE_SIZE);
>> +        idx++;
>> +    } while ( size > 0 );
>> +
>> +    return true;
>>   }
>>   
>>   /* True to indicate PSCI 0.2+ is implemented */
>> -- 
>> 2.17.1
>>

Cheers,

-- 
Julien Grall

