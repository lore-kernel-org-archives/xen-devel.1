Return-Path: <SRS0=6BBm=J2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C17C433ED
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 11:29:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D985261445
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 11:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D985261445
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.119895.226689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc4rN-0007Gc-4W; Thu, 29 Apr 2021 11:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119895.226689; Thu, 29 Apr 2021 11:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc4rN-0007GV-1N; Thu, 29 Apr 2021 11:29:33 +0000
Received: by outflank-mailman (input) for mailman id 119895;
 Thu, 29 Apr 2021 11:29:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lc4rM-0007GQ-7w
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 11:29:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lc4rK-00035E-P4; Thu, 29 Apr 2021 11:29:30 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lc4rK-00019y-Ic; Thu, 29 Apr 2021 11:29:30 +0000
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
	bh=rOxxts5pM2NKEoFqF46g5CZbNAxszbWHdxsPtitv6V0=; b=SKrTTmkXJmXLfsYQAYTVG4WnGF
	EaOb0hVe+j7IVgXWAXfrvsFAFceILvxyAWwli6MDwlh9dCwCK3uN392kZb82S1Aq/tt4u9uYgTkS6
	Dw3S/MW+C97wxxn2chzLCh308Qw5SpXwpnEQQy/ZS5Oc0JPNoLev+rIPukUT0GTzml98=;
Subject: Re: [PATCH 3/5] tools/libs/foreignmemory: Fix PAGE_SIZE redefinition
 error
To: Costin Lupu <costin.lupu@cs.pub.ro>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1619524463.git.costin.lupu@cs.pub.ro>
 <b9a300edca034d44375d8b16d352110186657e75.1619524463.git.costin.lupu@cs.pub.ro>
 <8803561c-b3bd-4979-f9ef-3f58542af70b@xen.org>
 <7c465859-5af3-3d9f-81f4-2062b29e57f0@cs.pub.ro>
From: Julien Grall <julien@xen.org>
Message-ID: <4d527d96-6baa-1558-5df0-363300572044@xen.org>
Date: Thu, 29 Apr 2021 12:29:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <7c465859-5af3-3d9f-81f4-2062b29e57f0@cs.pub.ro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 28/04/2021 19:27, Costin Lupu wrote:
> Hi Julien,

Hi Costin,

> On 4/28/21 12:03 PM, Julien Grall wrote:
>> Hi Costin,
>>
>> On 27/04/2021 13:05, Costin Lupu wrote:
>>>    tools/libs/foreignmemory/private.h | 6 ++++--
>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tools/libs/foreignmemory/private.h
>>> b/tools/libs/foreignmemory/private.h
>>> index 1ee3626dd2..f3c1ba2867 100644
>>> --- a/tools/libs/foreignmemory/private.h
>>> +++ b/tools/libs/foreignmemory/private.h
>>> @@ -10,11 +10,13 @@
>>>    #include <xen/xen.h>
>>>    #include <xen/sys/privcmd.h>
>>>    -#ifndef PAGE_SHIFT /* Mini-os, Yukk */
>>> +#ifndef PAGE_SHIFT
>>>    #define PAGE_SHIFT           12
>>>    #endif
>>> -#ifndef __MINIOS__ /* Yukk */
>>> +#ifndef PAGE_SIZE
>>>    #define PAGE_SIZE            (1UL << PAGE_SHIFT)
>>> +#endif
>>> +#ifndef PAGE_MASK
>>>    #define PAGE_MASK            (~(PAGE_SIZE-1))
>>>    #endif
>>
>> Looking at the usage, I believe PAGE_* are referring to the page
>> granularity of Xen rather than the page granularity of the control
>> domain itself.
>>
>> So it would be incorrect to use the domain's page granularity here and
>> would break dom0 using 64KB page granularity on Arm.
>>
>> Instead, we should replace PAGE_* with XC_PAGE_*. If some of them are
>> still referring to the control domain granularity, then we should use
>> getpageshift() (Or equivalent) because the userspace shouldn't rely on a
>> specific page granularity.
> 
> Yes, this makes sense. One thing I need to clarify: what does XC stand
> for? I thought for some time it stands for Xen Control.

I think it is Xen Control, which is a bit confusing for that specific 
define.

Cheers,

-- 
Julien Grall

