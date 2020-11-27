Return-Path: <SRS0=GZ64=FB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A5BC2D0E4
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 15:18:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADDC6206CA
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2020 15:18:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="1gazHFRu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADDC6206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.39582.72521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kifVM-0004j3-Go; Fri, 27 Nov 2020 15:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39582.72521; Fri, 27 Nov 2020 15:17:48 +0000
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
	id 1kifVM-0004iw-Dy; Fri, 27 Nov 2020 15:17:48 +0000
Received: by outflank-mailman (input) for mailman id 39582;
 Fri, 27 Nov 2020 15:17:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kifVK-0004ir-MB
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 15:17:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kifVJ-0007EG-TO; Fri, 27 Nov 2020 15:17:45 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kifVJ-0003mi-Kv; Fri, 27 Nov 2020 15:17:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kifVK-0004ir-MB
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 15:17:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=OXmodtBH3zSpvwdmcbuG2U3A3o3pRJ/OPBOaK6sKTAQ=; b=1gazHFRuAwqxbjSO1OVtTe15Ao
	4agvzu1uE7h7hlvqITciZeJku3R12fE/WjCDZ7OF8FcqfrhpQGbnMhYqcgiatScekXQ4Z0lcjHVg8
	1eFwWOhLYI39gm7qsglgK76mrpBJuRd0yBhOILbJlXG6srztRidCtIyo2pwyUX4KH81c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kifVJ-0007EG-TO; Fri, 27 Nov 2020 15:17:45 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kifVJ-0003mi-Kv; Fri, 27 Nov 2020 15:17:45 +0000
Subject: Re: [PATCH v8 3/3] xen/events: do some cleanups in
 evtchn_fifo_set_pending()
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-4-jgross@suse.com>
 <0ab6f8b5-1a9a-845e-3935-a660e5c7fc16@xen.org>
 <a11fb0fc-9a2e-8f9a-5fd3-356c0e0a0f60@suse.com>
 <29c8daf7-8af4-df16-716e-113bcc3e96a1@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7e4f42a5-4ab6-8aac-c8d9-95403c90dc4b@xen.org>
Date: Fri, 27 Nov 2020 15:17:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <29c8daf7-8af4-df16-716e-113bcc3e96a1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 27/11/2020 14:48, Jan Beulich wrote:
> On 27.11.2020 15:39, Jürgen Groß wrote:
>> On 27.11.20 15:23, Julien Grall wrote:
>>> On 25/11/2020 10:51, Juergen Gross wrote:
>>>> --- a/xen/common/event_fifo.c
>>>> +++ b/xen/common/event_fifo.c
>>>> @@ -175,6 +175,18 @@ static void evtchn_fifo_set_pending(struct vcpu
>>>> *v, struct evtchn *evtchn)
>>>>            return;
>>>>        }
>>>> +    /*
>>>> +     * Control block not mapped.  The guest must not unmask an
>>>> +     * event until the control block is initialized, so we can
>>>> +     * just drop the event.
>>>> +     */
>>>> +    if ( unlikely(!v->evtchn_fifo->control_block) )
>>>
>>> Sort of unrelated, AFAICT, v->evtchn_fifo->control_block can be set
>>> concurrently to this access.
>>>
>>> Thankfully, once the control block is mapped, it can't be unmapped.
>>> However, there is still a possibility that you may see half of the update.
>>>
>>> Shouldn't the field access with ACCESS_ONCE()?
>>
>> Shouldn't this be another patch? Especially as the writing side needs
>> the same treatment.
> 
> Indeed. As said on several different occasions - our code base is
> full of places where we chance torn accesses, if there really was
> a compiler to let us down on this.

I am quite amazed you that you managed to test all the version of 
GCC/Clang that were built and confirm this is unlikely to happen :).

> This recurring pattern
> shouldn't lead to unrelated patches getting bloated, unless _all_
> affected sites get touched anyway.

You probably missed the point where I say "sort of unrelated". This 
wasn't not a suggestion to fix it here (I should have been clearer 
though) but instead point out issue as I see them.

Cheers,

-- 
Julien Grall

