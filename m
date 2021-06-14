Return-Path: <SRS0=X5bA=LI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C2CC2B9F4
	for <xen-devel@archiver.kernel.org>; Mon, 14 Jun 2021 10:11:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE3BE610A1
	for <xen-devel@archiver.kernel.org>; Mon, 14 Jun 2021 10:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE3BE610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.141308.261055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsjYz-0001JE-1z; Mon, 14 Jun 2021 10:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141308.261055; Mon, 14 Jun 2021 10:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsjYy-0001J7-Ux; Mon, 14 Jun 2021 10:11:24 +0000
Received: by outflank-mailman (input) for mailman id 141308;
 Mon, 14 Jun 2021 10:11:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lsjYx-0001Ix-Td
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 10:11:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsjYw-0001gd-R1; Mon, 14 Jun 2021 10:11:22 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lsjYw-0005e0-J4; Mon, 14 Jun 2021 10:11:22 +0000
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
	bh=NpzWb+maa2BuXXssB8hk453klw7p/KghmtSFkGr3htg=; b=pvwnyHaEGPmld9aR3SpOn7KMxC
	9Cm984ggqEy3knbeiCMs0Q0RlJJc9tf+8qmjTY7Nx3S3UgzG8Q1myl7gGgutE/vm/hxrMWy1m+mB8
	q9A/EaN4LyvNqJg/SVUcklbiEuGKAnTVxV7PHQPNmIqbvDIKu9N4Y6Z3RIzdUF59kJwA=;
Subject: Re: [PATCH v2] xen/grant-table: Simplify the update to the per-vCPU
 maptrack freelist
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210608100824.25141-1-julien@xen.org>
 <3df3cc7b-a084-cc9c-5446-b662c884addd@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2d1d5588-5464-541c-5911-5c7942835b56@xen.org>
Date: Mon, 14 Jun 2021 12:11:20 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3df3cc7b-a084-cc9c-5446-b662c884addd@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 09/06/2021 12:20, Jan Beulich wrote:
> On 08.06.2021 12:08, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Since XSA-228 (commit 02cbeeb62075 "gnttab: split maptrack lock
>> to make it fulfill its purpose again"), v->maptrack_head,
>> v->maptrack_tail and the content of the freelist are accessed with
>> the lock v->maptrack_freelist_lock held.
>>
>> Therefore it is not necessary to update the fields using cmpxchg()
>> and also read them atomically.
>>
>> Note that there are two cases where v->maptrack_tail is accessed without
>> the lock. They both happen in get_maptrack_handle() when initializing
>> the free list of the current vCPU. Therefore there is no possible race.
>>
>> The code is now reworked to remove any use of cmpxch() and read_atomic()
>> when accessing the fields v->maptrack_{head, tail} as wel as the
>> freelist.
>>
>> Take the opportunity to add a comment on top of the lock definition
>> and explain what it protects.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks. I committed with...


> with one nit:
> 
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -255,7 +255,13 @@ struct vcpu
>>       /* VCPU paused by system controller. */
>>       int              controller_pause_count;
>>   
>> -    /* Grant table map tracking. */
>> +    /*
>> +     * Grant table map tracking. The lock maptrack_freelist_lock
>> +     * protects to:
> 
> I don't think you want "to" here.

... this addressed and ...

> 
> Jan
> 
>> +     *  - The entries in the freelist

... "The" removed.

>> +     *  - maptrack_head
>> +     *  - maptrack_tail
>> +     */
>>       spinlock_t       maptrack_freelist_lock;
>>       unsigned int     maptrack_head;
>>       unsigned int     maptrack_tail;
>>
> 

Cheers,

-- 
Julien Grall

