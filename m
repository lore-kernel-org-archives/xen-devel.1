Return-Path: <SRS0=DgKf=NL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73F7C4338F
	for <xen-devel@archiver.kernel.org>; Fri, 20 Aug 2021 08:24:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71BEB610A3
	for <xen-devel@archiver.kernel.org>; Fri, 20 Aug 2021 08:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71BEB610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.169322.309273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGzol-0004IV-Up; Fri, 20 Aug 2021 08:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169322.309273; Fri, 20 Aug 2021 08:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGzol-0004IO-RZ; Fri, 20 Aug 2021 08:23:59 +0000
Received: by outflank-mailman (input) for mailman id 169322;
 Fri, 20 Aug 2021 08:23:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGzol-0004II-7z
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 08:23:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGzok-0005Rk-AF; Fri, 20 Aug 2021 08:23:58 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGzok-0000HC-4P; Fri, 20 Aug 2021 08:23:58 +0000
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
	bh=+yFMNC13pToffs3kT/4MGiIUX70KT/zYGf+8Au4J5+g=; b=Rz3PA8in9y4wqPGszUUCSksAe3
	596D6iOQIZ+pibjEIAeRlJ50p2pQbNqk+dWmwYkkZzli2IJIGn9XVThAHTcjfbo7HJ86h5oWdJRfN
	/1HHJouJkYGm6DLRNJq0YV8TS3BRb5SZQ1mRbYuqVldxFXkEYRnB20s2QxOB7kSpGa3E=;
Subject: Re: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep fake NUMA
 API
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-8-wei.chen@arm.com>
 <e9a45fe3-e4b0-6533-8b41-ac3f10ef386a@xen.org>
 <DB9PR08MB6857D0004A59BC90866AE4C89EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4de5b7ed-ada5-2114-2002-7f5e26a89417@xen.org>
Date: Fri, 20 Aug 2021 09:23:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB6857D0004A59BC90866AE4C89EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 20/08/2021 03:08, Wei Chen wrote:
> Hi Julien,

Hi Wei,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2021年8月19日 21:34
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; jbeulich@suse.com
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep fake
>> NUMA API
>>
>> Hi Wei,
>>
>> On 11/08/2021 11:23, Wei Chen wrote:
>>> Only Arm64 supports NUMA, the CONFIG_NUMA could not be
>>> enabled for Arm32.
>>
>> What do you mean by "could not be enabled"?
> 
> I have not seen any Arm32 hardware support NUMA, so I think
> we don't need to support Arm32 NUMA.

I understand that there may not be 32-bit platform with NUMA. And that's 
fine stating that in the commit message. However...

> In this case, this Kconfig
> option could not be enabled on Arm32.

... you continue to say "couldn't be enabled" without clarifying whether 
this mean that the build will break or this was just not tested because 
you don't have any platform.

To put it differently, the code for NUMA looks bitness neutral. So I 
cannot really what what prevent us to potentially use it on Arm 32-bit.

> 
>>
>>> Even in Arm64, users still can disable
>>> the CONFIG_NUMA through Kconfig option. In this case, keep
>>> current fake NUMA API, will make Arm code still can work
>>> with NUMA aware memory allocation and scheduler.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>>    xen/include/asm-arm/numa.h | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
>>> index 31a6de4e23..ab9c4a2448 100644
>>> --- a/xen/include/asm-arm/numa.h
>>> +++ b/xen/include/asm-arm/numa.h
>>> @@ -5,6 +5,8 @@
>>>
>>>    typedef u8 nodeid_t;
>>>
>>> +#if !defined(CONFIG_NUMA)
>>
>> NIT: We tend to use #ifndef rather than #if !defined(...)
>>
> 
> OK, I will change related changes in this series.
> 
>>> +
>>>    /* Fake one node for now. See also node_online_map. */
>>>    #define cpu_to_node(cpu) 0
>>>    #define node_to_cpumask(node)   (cpu_online_map)
>>> @@ -25,6 +27,8 @@ extern mfn_t first_valid_mfn;
>>>    #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
>>>    #define __node_distance(a, b) (20)
>>>
>>> +#endif
>>> +
>>>    #endif /* __ARCH_ARM_NUMA_H */
>>>    /*
>>>     * Local variables:
>>>
>>
>> Cheers,
>>
>> --
>> Julien Grall

Cheers,

-- 
Julien Grall

