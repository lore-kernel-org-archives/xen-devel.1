Return-Path: <SRS0=FTcr=IH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA35C433DB
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 10:08:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA11264F30
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 10:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA11264F30
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.95293.179823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZHQ-0007Oy-S3; Tue, 09 Mar 2021 10:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95293.179823; Tue, 09 Mar 2021 10:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJZHQ-0007Or-OM; Tue, 09 Mar 2021 10:07:56 +0000
Received: by outflank-mailman (input) for mailman id 95293;
 Tue, 09 Mar 2021 10:07:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lJZHP-0007Om-RP
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 10:07:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJZHO-0004Xp-TQ; Tue, 09 Mar 2021 10:07:54 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJZHO-0007O2-N8; Tue, 09 Mar 2021 10:07:54 +0000
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
	bh=HxwwefvHBT4hnuYPFrWIFg0Iu9+1e660KWLIRwS9goQ=; b=yUZ2Cgcxu7Yx/tl1hDP2unShJe
	xOZ26YGQxo37g5xDTM8b6eEPL2bW3/oVK5sTIjW4exg82zrT/scg3r25h+1xzaQfXHawk0ASvK+5W
	KNSlMbnnDCK4W0KsVx+pMqKd0u1+rfw4Xr53pE8q8lX/2temphWA2oDnYctc/i/3w5+4=;
Subject: Re: [PATCH] xen/arm: Use register_t type in cpuinfo entries
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b65f29a67f87de8b25cd23b5fa111c50a2efb1d0.1615209093.git.bertrand.marquis@arm.com>
 <712d7c6a-3ace-a6b7-a188-faeb4f1258d3@xen.org>
 <62BD194F-C673-42CD-AEA0-BE4AFA21849E@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <33a75f39-7626-97a9-a90b-3fe8f1fa856f@xen.org>
Date: Tue, 9 Mar 2021 10:07:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <62BD194F-C673-42CD-AEA0-BE4AFA21849E@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 09/03/2021 09:30, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

> 
>> On 8 Mar 2021, at 20:48, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 08/03/2021 17:18, Bertrand Marquis wrote:
>>> All cpu identification registers that we store in the cpuinfo structure
>>> are 64bit on arm64 and 32bit on arm32 so storing the values in 32bit on
>>> arm64 is removing the higher bits which might contain information in the
>>> future.
>>> This patch is changing the types in cpuinfo to register_t (which is
>>> 32bit on arm32 and 64bit on arm64) and adding the necessary paddings
>>> inside the unions.
>>
>> I read this as we would replace uint32_t with register_t. However, there are a few instances where you, validly, replace uint64_t with register_t. I would suggest to clarify it in the commit message.
> 
> How about adding the following sentence: “For coherency uint64_t entries are also changed to register_t on 64bit systems."

I think you mean consistency rather than coherency.

> 
>>
>>> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
>>> index cae2179126..ea0dd3451e 100644
>>> --- a/xen/arch/arm/smpboot.c
>>> +++ b/xen/arch/arm/smpboot.c
>>> @@ -321,7 +321,8 @@ void start_secondary(void)
>>>       if ( !opt_hmp_unsafe &&
>>>            current_cpu_data.midr.bits != boot_cpu_data.midr.bits )
>>>       {
>>> -        printk(XENLOG_ERR "CPU%u MIDR (0x%x) does not match boot CPU MIDR (0x%x),\n"
>>> +        printk(XENLOG_ERR "CPU%u MIDR (0x%"PRIregister") does not match boot "
>>> +               "CPU MIDR (0x%"PRIregister"),\n"
>>
>> For printk messages, we don't tend to split it like that (even for more than 80 characters one). Instead, the preferred approach is:
>>
>> printk(XENLOG_ERR
>>        "line 1\n"
>>        "line 2\n")
> 
> Ok.
> 
> Do you want me to send a v2 or can you fix this during the commit ?

Both can be fixed on commit. I will queue it to my next branch soon.

Cheers,

-- 
Julien Grall

