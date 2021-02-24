Return-Path: <SRS0=y6zA=H2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E19C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 11:39:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E3B964DAF
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 11:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E3B964DAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89279.168065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEsVf-0007Hr-52; Wed, 24 Feb 2021 11:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89279.168065; Wed, 24 Feb 2021 11:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEsVf-0007Hk-1m; Wed, 24 Feb 2021 11:39:15 +0000
Received: by outflank-mailman (input) for mailman id 89279;
 Wed, 24 Feb 2021 11:39:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEsVe-0007Hf-Cn
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 11:39:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc812aea-8584-4c65-b787-fee87fed8138;
 Wed, 24 Feb 2021 11:39:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E6D7ADDD;
 Wed, 24 Feb 2021 11:39:12 +0000 (UTC)
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
X-Inumbo-ID: cc812aea-8584-4c65-b787-fee87fed8138
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614166752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0siXn6TJ90QOL1JmkIRuuoNWfa9xZ4Kmuu52ceU3t6A=;
	b=BsO9sKGbtW5yLfdjeuFPZr9icn3Fvbr2ci9WEQuoZPsS6KxETHSSmv+LbQI51C4Hhlx4uk
	MTFXvwUezDyB+AEzBwPHDqybCABa1CIQiRBUF8MfizdMA3D9lb+YyTfcZEo6WD6oDVxWQU
	22P+QyMDi+4C/JO9R/sT+2cw4ytCp+0=
Subject: Re: [PATCH 2/2] hvmloader: do not include system headers for type
 declarations
To: Ian Jackson <iwj@xenproject.org>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210224102641.89455-1-roger.pau@citrix.com>
 <20210224102641.89455-3-roger.pau@citrix.com>
 <fb677f29-2b21-aaf1-1127-6774fb8e91e9@suse.com>
 <24630.13192.874503.894268@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9e64f1b3-fbb3-6561-cf7b-498ed3839020@suse.com>
Date: Wed, 24 Feb 2021 12:39:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24630.13192.874503.894268@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.02.2021 12:07, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH 2/2] hvmloader: do not include system headers for type declarations"):
>> On 24.02.2021 11:26, Roger Pau Monne wrote:
>>> --- /dev/null
>>> +++ b/tools/firmware/hvmloader/types.h
>>> @@ -0,0 +1,47 @@
>>> +#ifndef _HVMLOADER_TYPES_H_
>>> +#define _HVMLOADER_TYPES_H_
>>> +
>>> +typedef unsigned char uint8_t;
>>> +typedef signed char int8_t;
>>> +
>>> +typedef unsigned short uint16_t;
>>> +typedef signed short int16_t;
>>> +
>>> +typedef unsigned int uint32_t;
>>> +typedef signed int int32_t;
>>> +
>>> +typedef unsigned long long uint64_t;
>>> +typedef signed long long int64_t;
>>
>> I wonder if we weren't better of not making assumptions on
>> short / int / long long, and instead use
>> __attribute__((__mode__(...))) or, if available, the compiler
>> provided __{,U}INT*_TYPE__.
> 
> This code is only ever going to be for 32-bit x86, so I think the way
> Roger did it is fine.

It is technically correct at this point in time, from all we can
tell. I can't see any reason though why a compiler might not
support wider int or, in particular, long long. hvmloader, unlike
most of the rest of the tools, is a freestanding binary and hence
not tied to any particular ABI the compiler used may have been
built for.

> Doing it the other way, to cope with this file being used with
> compiler settings where the above set of types is wrong, would also
> imply more complex definitions of INT32_MIN et al.

Well, that's only as far as the use of number suffixes goes. The
values used won't change, as these constants describe fixed width
types.

>>> +typedef uint32_t size_t;
> 
> I would be inclined to provide ssize_t too but maybe hvmloader will
> never need it.
> 
>> Like the hypervisor, we should prefer using __SIZE_TYPE__
>> when available.
> 
> I disagree.

May I ask why? There is a reason providing of these types did get
added to (at least) gcc.

One argument against this would be above mentioned independence
on any ABI the compiler would be built for, but I'd buy that only
if above we indeed used __attribute__((__mode__())), as that's
the only way to achieve such independence.

IOW imo if we stick to what is there now for {,u}int<N>_t, we
should use __SIZE_TYPE__ here. If we used the mode attribute
approach there, using uint32_t here would indeed be better.

>>> +typedef uint32_t uintptr_t;
>>
>> Again - use __UINTPTR_TYPE__ or, like Xen,
>> __attribute__((__mode__(__pointer__))).
> 
> I disagree.

The same question / considerations apply here then.

>>> +#define bool _Bool
>>> +#define true 1
>>> +#define false 0
>>> +#define __bool_true_false_are_defined   1
>>> +
>>> +typedef __builtin_va_list va_list;
>>> +#define va_copy(dest, src)    __builtin_va_copy((dest), (src))
>>> +#define va_start(ap, last)    __builtin_va_start((ap), (last))
>>
>> Nit: Perhaps better omit the unnecessary inner parentheses?
> 
> We should definitely keep the inner parentheses.  I don't want to
> start carefully reasoning about precisely which inner parentheses are
> necesary for macro argument parsing correctness.

Can you give me an example of when the inner parentheses would be
needed? I don't think they're needed no matter whether (taking the
example here) __builtin_va_...() were functions or macros. They
would of course be needed if the identifiers were part of
expressions beyond the mere function invocation. We've been trying
to eliminate such in the hypervisor part of the tree, and since
hvmloader is more closely related to the hypervisor than the tools
(see also its maintainership), I think we would want to do so
here, too. But of course if there are cases where such
parentheses are really needed, we'd want (need) to change our
approach in hypervisor code as well.

The primary reason why I've been advocating to avoid them is that,
as long as they're not needed for anything, they harm readability
and increase the risk of mistakes like the one that had led to
XSA-316.

Jan

