Return-Path: <SRS0=1gSS=KN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D844EC433ED
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 12:13:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9331960C41
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 12:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9331960C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.129157.242462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liybE-00029o-Tp; Tue, 18 May 2021 12:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129157.242462; Tue, 18 May 2021 12:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liybE-00029h-Qk; Tue, 18 May 2021 12:13:24 +0000
Received: by outflank-mailman (input) for mailman id 129157;
 Tue, 18 May 2021 12:13:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1liybD-00029b-M4
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 12:13:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liybD-0002Dq-9v; Tue, 18 May 2021 12:13:23 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liybD-0001fz-3z; Tue, 18 May 2021 12:13:23 +0000
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
	bh=pM30EnypZaP2BuhRnIaEemhN0UI2YBiwJXbTiA4Khus=; b=3su872PzYVx/huA7JB+KkOJ74S
	an8Y9jKSi2ai9tzSAegtpIrbyreR9qeiU3N6K38k9sz1PWrjo75j4GL3W3Heig+rKvpu64Pu94pXn
	aqjiOWldfU942gTgqUcEF8cR3LFt0Zu3IEmjhh8AK9ENLJltUP6GxWg5VzxHfDaajlkE=;
Subject: Re: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
To: Penny Zheng <Penny.Zheng@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-8-penny.zheng@arm.com>
 <7e4706dc-70ea-4dc9-3d70-f07396b462d8@suse.com>
 <VE1PR08MB521528492991FDFC87AC361BF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <75275b2f-9de3-944a-d55c-a62bbbf1bb8c@xen.org>
Date: Tue, 18 May 2021 13:13:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB521528492991FDFC87AC361BF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 18/05/2021 09:57, Penny Zheng wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, May 18, 2021 3:35 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>; nd <nd@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; julien@xen.org
>> Subject: Re: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
>>
>> On 18.05.2021 07:21, Penny Zheng wrote:
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -2447,6 +2447,9 @@ int assign_pages(
>>>       {
>>>           ASSERT(page_get_owner(&pg[i]) == NULL);
>>>           page_set_owner(&pg[i], d);
>>> +        /* use page_set_reserved_owner to set its reserved domain owner.
>> */
>>> +        if ( (pg[i].count_info & PGC_reserved) )
>>> +            page_set_reserved_owner(&pg[i], d);
>>
>> Now this is puzzling: What's the point of setting two owner fields to the same
>> value? I also don't recall you having introduced
>> page_set_reserved_owner() for x86, so how is this going to build there?
>>
> 
> Thanks for pointing out that it will fail on x86.
> As for the same value, sure, I shall change it to domid_t domid to record its reserved owner.
> Only domid is enough for differentiate.
> And even when domain get rebooted, struct domain may be destroyed, but domid will stays
> The same.
> Major user cases for domain on static allocation are referring to the whole system are static,
> No runtime creation.

One may want to have static memory yet doesn't care about the domid. So 
I am not in favor to restrict about the domid unless there is no other way.

Cheers,

-- 
Julien Grall

