Return-Path: <SRS0=eaQF=F2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DF3C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 22 Dec 2020 11:06:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A67C23105
	for <xen-devel@archiver.kernel.org>; Tue, 22 Dec 2020 11:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A67C23105
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.57757.101181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krfUD-0005Gf-3z; Tue, 22 Dec 2020 11:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57757.101181; Tue, 22 Dec 2020 11:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krfUD-0005GY-0Y; Tue, 22 Dec 2020 11:05:49 +0000
Received: by outflank-mailman (input) for mailman id 57757;
 Tue, 22 Dec 2020 11:05:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1krfUC-0005GT-6d
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 11:05:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krfUB-0002oT-Ss; Tue, 22 Dec 2020 11:05:47 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krfUB-0001ul-Kz; Tue, 22 Dec 2020 11:05:47 +0000
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
	bh=GAYYImh/e8Dov7zf5WchrBeZLpC407M9Y8+vzejXDOQ=; b=ak9TVYlzddtoCxRS7ZUXbDk8UJ
	YVqTt0bg1gkaTDWre+FhCJpKJnga16zRTASj6Lu3m7nTHW0V8KnoVvFWfwgAUJQB94Vezpedtim5A
	JsO1uODP3kxWyrx501CmPOgmbBOnW9lHwCV27BCsIrXQqQzQ7pRCv1HHkAQepwVnSWK4=;
Subject: Re: [PATCH 2/3] xen/domain: Introduce domain_teardown()
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-3-andrew.cooper3@citrix.com>
 <f42f6b6e-3ee3-f58e-513b-70f80f7541ee@xen.org>
 <7edf2139-b63e-00c9-7172-524566f942ae@citrix.com>
 <09fd7598-9899-9b4c-68ba-f90b3bc47d6f@suse.com>
 <35b24879-e075-8066-603a-518fbb82f656@xen.org>
 <892cb753-594b-15df-2342-9d10d5787f46@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d65c0e96-bd8e-15b9-18da-a33147477199@xen.org>
Date: Tue, 22 Dec 2020 11:05:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <892cb753-594b-15df-2342-9d10d5787f46@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 22/12/2020 10:53, Jan Beulich wrote:
> On 22.12.2020 11:25, Julien Grall wrote:
>> On 22/12/2020 07:50, Jan Beulich wrote:
>>> On 21.12.2020 19:45, Andrew Cooper wrote:
>>>> On 21/12/2020 18:36, Julien Grall wrote:
>>>>>> @@ -553,6 +606,9 @@ struct domain *domain_create(domid_t domid,
>>>>>>         if ( init_status & INIT_watchdog )
>>>>>>             watchdog_domain_destroy(d);
>>>>>>     +    /* Must not hit a continuation in this context. */
>>>>>> +    ASSERT(domain_teardown(d) == 0);
>>>>> The ASSERT() will become a NOP in production build, so
>>>>> domain_teardown_down() will not be called.
>>>>
>>>> Urgh - its not really a nop, but it's evaluation isn't symmetric between
>>>> debug and release builds.  I'll need an extra local variable.
>>>
>>> Or use ASSERT_UNREACHABLE(). (I admit I don't really like the
>>> resulting constructs, and would like to propose an alternative,
>>> even if I fear it'll be controversial.)
>>>
>>>>> However, I think it would be better if we pass an extra argument to
>>>>> indicated wheter the code is allowed to preempt. This would make the
>>>>> preemption check more obvious in evtchn_destroy() compare to the
>>>>> current d->is_dying != DOMDYING_dead.
>>>>
>>>> We can have a predicate if you'd prefer, but plumbing an extra parameter
>>>> is wasteful, and can only cause confusion if it is out of sync with
>>>> d->is_dying.
>>>
>>> I agree here - it wasn't so long ago that event_channel.c gained
>>> a DOMDYING_dead check, and I don't see why we shouldn't extend
>>> this approach to here and elsewhere.
>>
>> I think the d->is_dying != DOMYING_dead is difficult to understand even
>> with the comment on top. This was ok in one place, but now it will
>> spread everywhere. So at least, I would suggest to introduce a wrapper
>> that is better named.
>>
>> There is also a futureproof concern. At the moment, we are considering
>> the preemption will not be needed in domain_create(). I am ready to bet
>> that the assumption is going to be broken sooner or later.
> 
> This is a fair consideration, yet I'm having trouble seeing what it
> might be that would cause domain_create() to require preemption.
> The function is supposed to only produce an empty container. But yes,
> if e.g. vCPU creation was to move here, the situation would indeed
> change.
We are not really creating an "empty container". There are at least one 
initial pool of memory allocated for HAP (256 pages) which need to be 
freed if we fail to create the domain.

There is a second pool in discussion for the IOMMU (see [1]) which will 
also initially allocate 256 pages.

To me it looks like domain_create() is getting quite big and preemption 
is going to be required sooner or later.

Cheers,

[1] <20201005094905.2929-6-paul@xen.org>

> 
> Jan
> 

-- 
Julien Grall

