Return-Path: <SRS0=jOUd=6S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4707C3A5A9
	for <xen-devel@archiver.kernel.org>; Mon,  4 May 2020 07:33:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB55D20721
	for <xen-devel@archiver.kernel.org>; Mon,  4 May 2020 07:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB55D20721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVVbF-0004fN-QW; Mon, 04 May 2020 07:33:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WsoH=6S=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jVVbF-0004fI-Bv
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 07:33:13 +0000
X-Inumbo-ID: 81a2ac18-8dd9-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 81a2ac18-8dd9-11ea-b9cf-bc764e2007e4;
 Mon, 04 May 2020 07:33:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4C4B3AEC1;
 Mon,  4 May 2020 07:33:11 +0000 (UTC)
Subject: Re: [PATCH v1.1 2/3] xen/sched: fix theoretical races accessing
 vcpu->dirty_cpu
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200430152848.20275-1-jgross@suse.com>
 <987abb9e-e4f1-1981-595d-0474e91d67f8@xen.org>
 <678d3815-d554-7b92-aa81-908978e2b19b@suse.com>
 <2c72bb17-cf67-a7ce-6dcb-2c3b4d1231e7@xen.org>
 <e274cf53-261d-0af5-6d81-2031e70da3e3@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6256827c-c703-8158-d47b-79e3f0d44140@suse.com>
Date: Mon, 4 May 2020 09:33:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e274cf53-261d-0af5-6d81-2031e70da3e3@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.05.20 18:09, Julien Grall wrote:
> 
> 
> On 02/05/2020 13:34, Julien Grall wrote:
>>>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>>>> index 195e7ee583..81628e2d98 100644
>>>>> --- a/xen/include/xen/sched.h
>>>>> +++ b/xen/include/xen/sched.h
>>>>> @@ -844,7 +844,7 @@ static inline bool is_vcpu_dirty_cpu(unsigned 
>>>>> int cpu)
>>>>>   static inline bool vcpu_cpu_dirty(const struct vcpu *v)
>>>>>   {
>>>>> -    return is_vcpu_dirty_cpu(v->dirty_cpu);
>>>>> +    return is_vcpu_dirty_cpu(read_atomic((unsigned int 
>>>>> *)&v->dirty_cpu));
>>>>
>>>> Is the cast necessary?
>>>
>>> Yes, that was the problem when building for ARM I encountered.
>>>
>>> read_atomic() on ARM has a local variable of the same type as the
>>> read_atomic() parameter for storing the result. Due to the const
>>> attribute of v this results in assignment to a read-only variable.
>>
>> Doh, we should be able to read from a const value without. So I would 
>> argue this is a bug in the read_atomic() implementation on Arm. I will 
>> try to come up with a patch.
> 
> I have just sent a series [1] to address the issue reported here and a 
> few more.

With that series V1 of this patch is fine again. :-)


Juergen

