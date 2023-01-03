Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62876C3DA7D
	for <xen-devel@archiver.kernel.org>; Tue,  3 Jan 2023 09:56:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.470525.730054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCe29-0000og-2D; Tue, 03 Jan 2023 09:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470525.730054; Tue, 03 Jan 2023 09:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCe28-0000oZ-UD; Tue, 03 Jan 2023 09:56:36 +0000
Received: by outflank-mailman (input) for mailman id 470525;
 Tue, 03 Jan 2023 09:56:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pCe27-0000oS-66
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 09:56:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pCe27-0005kL-1z; Tue, 03 Jan 2023 09:56:35 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=[192.168.2.2])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pCe26-0001gu-R1; Tue, 03 Jan 2023 09:56:34 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=Usdo28dg4bFOA1INrPO7hb0HNbXQ9TsZkQjhVBPS8YE=; b=yRG0WEh7qnNYMQLG7sr8ScIxSx
	/mL2DyiY9gxVe07H0G2xqSU0KSfRXymdEDKVDSZeBPkxMJ39E6qucOybjZby9x6rFiV/Kl/koKu6n
	0HHDPUFuugImvhYg8Om2fp9j3/Xa5/8pqfNk+UBPn9x0WNK7ynfjraaapyGgUxDy2O/g=;
Message-ID: <adbaed89-3327-c339-3e36-0a0243a3ffd2@xen.org>
Date: Tue, 3 Jan 2023 09:56:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/arm: Print memory size in decimal in construct_domU
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, xen-devel@lists.xenproject.org
References: <20230102144904.17619-1-michal.orzel@amd.com>
 <2ddcaf95-03f5-81fb-3091-316b99201a1c@amd.com>
 <562770a6-2933-43b8-326f-3bb6d8e0ce61@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <562770a6-2933-43b8-326f-3bb6d8e0ce61@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 03/01/2023 09:39, Michal Orzel wrote:
> On 03/01/2023 10:21, Ayan Kumar Halder wrote:
>>
>>
>> Hi Michal,
>>
>> On 02/01/2023 14:49, Michal Orzel wrote:
>>> Printing domain's memory size in hex without even prepending it
>>> with 0x is not very useful and can be misleading. Switch to decimal
>>> notation.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>>    xen/arch/arm/domain_build.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 829cea8de84f..7e204372368c 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -3774,7 +3774,7 @@ static int __init construct_domU(struct domain *d,
>>>        if ( rc != 0 )
>>>            return rc;
>>>
>>> -    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n", d->max_vcpus, mem);
>>> +    printk("*** LOADING DOMU cpus=%u memory=%"PRIu64"KB ***\n", d->max_vcpus, mem);
>>
>> I will prefer it to be printed in hex format with 0x prefixed. The
>> reason being the mem is obtained from device-tree domU's 'memory' prop
>> where the values are in hex.
> No, I cannot agree. Refer to booting.txt documentation:
> "A 64-bit integer specifying the amount of kilobytes of RAM to allocate to the guest."
> Also note that in the provided examples, we are using the decimal values.
> All in all it does not matter the notation, you can provide e.g. "memory = 131072;" or "memory = 0x20000".
> I find it a bit odd to print e.g. 0x20000KB and decimal is easier to read.
By easier, do you mean you can easily figure out how much memory in 
GB/MB/KB you gave to the guest? If so, then I have to disagree. Without 
a calculator, I will find quicker the split.

If you want to print in decimal, then I think we should split the amount 
in GB/MB/KB. Otherwise, we should stick in hexadecimal (so add 0x).

Cheers,

-- 
Julien Grall

