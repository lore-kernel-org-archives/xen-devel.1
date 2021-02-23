Return-Path: <SRS0=trq0=HZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCDEC433DB
	for <xen-devel@archiver.kernel.org>; Tue, 23 Feb 2021 09:04:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C44E64D5D
	for <xen-devel@archiver.kernel.org>; Tue, 23 Feb 2021 09:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C44E64D5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.88640.166770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lETc1-0002ve-5O; Tue, 23 Feb 2021 09:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88640.166770; Tue, 23 Feb 2021 09:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lETc1-0002vX-2N; Tue, 23 Feb 2021 09:04:09 +0000
Received: by outflank-mailman (input) for mailman id 88640;
 Tue, 23 Feb 2021 09:04:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lETbz-0002vR-Vw
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 09:04:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lETbz-0007X1-H3; Tue, 23 Feb 2021 09:04:07 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lETbz-0000lp-90; Tue, 23 Feb 2021 09:04:07 +0000
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
	bh=D0/+6qeBKZ7NdRi3TvHYcLe/GaCdj7Z4YKoUAwfw7es=; b=LSHWvaYQQTtMbvXWDl3sNJSwC4
	3raxNp2wSfxzX+pMMyimMWfw6LgbjdnrExLItpUUdYUgIwle+6lDg53hbdCFeFOqbe4oxNroUzUBR
	ty6/cU+dct5YIsJ7KlPIii8pCq9rPYewvv9lXWgi3QQPwNToEhlCNTZgX4fUcbU/dNjs=;
Subject: Re: [PATCH for-4.15] xen/sched: Add missing memory barrier in
 vcpu_block()
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: iwj@xenproject.org, ash.j.wilding@gmail.com,
 Julien Grall <jgrall@amazon.com>, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20210220194701.24202-1-julien@xen.org>
 <744ca7e5-328d-0c5f-bc52-e4c0e78dad97@suse.com>
 <alpine.DEB.2.21.2102221208050.3234@sstabellini-ThinkPad-T480s>
 <b68a644f-8b9c-3e1d-49c6-4058d276228b@xen.org>
 <dd2ce0b0-4bd4-15e5-c4b2-2540799ed493@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7f246e9f-dc5b-f730-2cb3-1920309bdb3a@xen.org>
Date: Tue, 23 Feb 2021 09:04:04 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <dd2ce0b0-4bd4-15e5-c4b2-2540799ed493@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 23/02/2021 07:00, Jan Beulich wrote:
> On 22.02.2021 21:12, Julien Grall wrote:
>> On 22/02/2021 20:09, Stefano Stabellini wrote:
>>> On Mon, 22 Feb 2021, Jan Beulich wrote:
>>>> On 20.02.2021 20:47, Julien Grall wrote:
>>>>> This is a follow-up of the discussion that started in 2019 (see [1])
>>>>> regarding a possible race between do_poll()/vcpu_unblock() and the wake
>>>>> up path.
>>>>>
>>>>> I haven't yet fully thought about the potential race in do_poll(). If
>>>>> there is, then this would likely want to be fixed in a separate patch.
>>>>>
>>>>> On x86, the current code is safe because set_bit() is fully ordered. SO
>>>>> the problem is Arm (and potentially any new architectures).
>>>>>
>>>>> I couldn't convince myself whether the Arm implementation of
>>>>> local_events_need_delivery() contains enough barrier to prevent the
>>>>> re-ordering. However, I don't think we want to play with devil here as
>>>>> the function may be optimized in the future.
>>>>
>>>> In fact I think this ...
>>>>
>>>>> --- a/xen/common/sched/core.c
>>>>> +++ b/xen/common/sched/core.c
>>>>> @@ -1418,6 +1418,8 @@ void vcpu_block(void)
>>>>>    
>>>>>        set_bit(_VPF_blocked, &v->pause_flags);
>>>>>    
>>>>> +    smp_mb__after_atomic();
>>>>> +
>>>>
>>>> ... pattern should be looked for throughout the codebase, and barriers
>>>> be added unless it can be proven none is needed. >
>>> And in that case it would be best to add an in-code comment to explain
>>> why the barrier is not needed
>> .
>> I would rather not add comment for every *_bit() calls. It should be
>> pretty obvious for most of them that the barrier is not necessary.
>>
>> We should only add comments where the barrier is necessary or it is not
>> clear why it is not necessary.
> 
> I guess by "pattern" I didn't necessarily mean _all_ *_bit()
> calls - indeed there are many where it's clear that no barrier
> would be needed. I was rather meaning modifications like this
> of v->pause_flags (I'm sure there are further such fields).

Agree, this work is mostly a side project for now. So I will continue to 
go through the pattern when I find time.

Cheers,

-- 
Julien Grall

