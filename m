Return-Path: <SRS0=7M4+=KK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C02C433ED
	for <xen-devel@archiver.kernel.org>; Sat, 15 May 2021 08:54:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B802A613F1
	for <xen-devel@archiver.kernel.org>; Sat, 15 May 2021 08:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B802A613F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.127693.240003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhq4K-0001J6-GK; Sat, 15 May 2021 08:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127693.240003; Sat, 15 May 2021 08:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhq4K-0001Iz-DA; Sat, 15 May 2021 08:54:44 +0000
Received: by outflank-mailman (input) for mailman id 127693;
 Sat, 15 May 2021 08:54:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lhq4I-0001It-TP
 for xen-devel@lists.xenproject.org; Sat, 15 May 2021 08:54:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhq4E-0003Mv-Jo; Sat, 15 May 2021 08:54:38 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhq4E-000592-BD; Sat, 15 May 2021 08:54:38 +0000
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
	bh=ATct03ZRjkatB2Crje2oNczGFYgbArRpdYy7QxMVz6s=; b=KtqeDFJ1LgSDjvVbt/3wglgi4H
	PaUCCAGx9OBoecuA9wFt5NGR+eELWoZvIlvIhS5BXxzZ8Iwh7bXXG1oRdfMH4MI+xMxv+z4oMkNXN
	zRy07/iK4BD7AbS+tUwD+ymCmlAnVtWHIBo8kipBPfEA9v1d9CTY2nb02LftbPGVyWZM=;
Subject: Re: [PATCH RFCv2 12/15] xen/arm: add Persistent Map (PMAP)
 infrastructure
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com,
 Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, Wei Liu
 <wei.liu2@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Hongyan Xia <hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Hongian Xia <hongyax@amazon.com>
References: <20210425201318.15447-1-julien@xen.org>
 <20210425201318.15447-13-julien@xen.org>
 <alpine.DEB.2.21.2105141602330.14426@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <46b2da6d-d0db-0016-079c-72e18991eb1e@xen.org>
Date: Sat, 15 May 2021 09:54:34 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105141602330.14426@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 15/05/2021 00:25, Stefano Stabellini wrote:
> On Sun, 25 Apr 2021, Julien Grall wrote:
>> From: Wei Liu <wei.liu2@citrix.com>
>> +extern lpae_t xen_fixmap[LPAE_ENTRIES];
>> +
>> +void *__init pmap_map(mfn_t mfn)
>> +{
>> +    unsigned long flags;
>> +    unsigned int idx;
>> +    vaddr_t linear;
>> +    unsigned int slot;
>> +    lpae_t *entry, pte;
>> +
>> +    BUILD_BUG_ON(sizeof(inuse) * BITS_PER_LONG < NUM_FIX_PMAP);
>> +
>> +    ASSERT(system_state < SYS_STATE_smp_boot);
> 
> One small concern here is that we have been using SYS_STATE_early_boot
> to switch implementation of things like xen_map_table. Between
> SYS_STATE_early_boot and SYS_STATE_smp_boot there is SYS_STATE_boot.
> 
> I guess I am wondering if instead of three potentially different mapping
> functions (<= SYS_STATE_early_boot, < SYS_STATE_smp_boot, >=
> SYS_STATE_smp_boot) we can get away with only two?

This is more flexible than the existing method to map memory when state 
== SYS_STATE_early_boot. If you look at the next patch (#13), you will 
see that there will be only two method to map memory.

[...]

>> diff --git a/xen/include/asm-arm/pmap.h b/xen/include/asm-arm/pmap.h
>> new file mode 100644
>> index 000000000000..8e1dce93f8e4
>> --- /dev/null
>> +++ b/xen/include/asm-arm/pmap.h
>> @@ -0,0 +1,10 @@
>> +#ifndef __ASM_PMAP_H__
>> +#define __ARM_PMAP_H__
> 
> ASM/ARM

I will fix it.

> 
> 
>> +/* Large enough for mapping 5 levels of page tables with some headroom */
>> +#define NUM_FIX_PMAP 8
>> +
>> +void *pmap_map(mfn_t mfn);
>> +void pmap_unmap(const void *p);
> 
>> +#endif	/* __ASM_PMAP_H__ */

Cheers,

-- 
Julien Grall

