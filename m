Return-Path: <SRS0=BiGO=H3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F78C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 07:42:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53A3464E21
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 07:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53A3464E21
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89630.168977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFBHd-00075B-Dt; Thu, 25 Feb 2021 07:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89630.168977; Thu, 25 Feb 2021 07:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFBHd-000752-Am; Thu, 25 Feb 2021 07:42:01 +0000
Received: by outflank-mailman (input) for mailman id 89630;
 Thu, 25 Feb 2021 07:41:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFBHb-00074m-Or
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 07:41:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d55fe98f-7ef8-498c-88f6-ba5d95124160;
 Thu, 25 Feb 2021 07:41:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A04C8ACD9;
 Thu, 25 Feb 2021 07:41:57 +0000 (UTC)
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
X-Inumbo-ID: d55fe98f-7ef8-498c-88f6-ba5d95124160
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614238917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T9J3EkjHcnq+Seqkk/bd0FqqRXY4OdossGLUOe//c+8=;
	b=JdSn1OcKPfNuxc8lkQxPQ0UlbcITwRh+jV0HE5XfjBFdabyZCRLqn3LcXnnYinkX6OEOnV
	9aZTny6c9RlqCtECCwq4/1zHpfH2zvRjYtgpN8vxYNYCYrcVi3lt3Iz1Ifjpg9xHq0TENN
	k1rycT+0yCjM3idZr0Wv8tI5Zt2gmEk=
Subject: Re: [PATCH 0/2] hvmloader: drop usage of system headers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
References: <20210224102641.89455-1-roger.pau@citrix.com>
 <35864c33-b375-a3c6-13bc-ad1e7d0773eb@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61932477-d44c-5592-da3f-b0b5ff5c6321@suse.com>
Date: Thu, 25 Feb 2021 08:41:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <35864c33-b375-a3c6-13bc-ad1e7d0773eb@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 24.02.2021 21:08, Andrew Cooper wrote:
> On 24/02/2021 10:26, Roger Pau Monne wrote:
>> Hello,
>>
>> Following two patches aim to make hvmloader standalone, so that it don't
>> try to use system headers. It shouldn't result in any functional
>> change.
>>
>> Thanks, Roger.
> 
> After some experimentation in the arch container
> 
> Given foo.c as:
> 
> #include <stdint.h>
> 
> extern uint64_t bar;
> uint64_t foo(void)
> {
>     return bar;
> }
> 
> int main(void)
> {
>     return 0;
> }
> 
> The preprocessed form with `gcc -m32 -E` is:
> 
> # 1 "foo.c"
> # 1 "<built-in>"
> # 1 "<command-line>"
> # 31 "<command-line>"
> # 1 "/usr/include/stdc-predef.h" 1 3 4
> # 32 "<command-line>" 2
> # 1 "foo.c"
> # 1 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint.h" 1 3 4
> # 9 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint.h" 3 4
> # 1 "/usr/include/stdint.h" 1 3 4
> # 26 "/usr/include/stdint.h" 3 4
> # 1 "/usr/include/bits/libc-header-start.h" 1 3 4
> # 33 "/usr/include/bits/libc-header-start.h" 3 4
> # 1 "/usr/include/features.h" 1 3 4
> # 450 "/usr/include/features.h" 3 4
> # 1 "/usr/include/sys/cdefs.h" 1 3 4
> # 452 "/usr/include/sys/cdefs.h" 3 4
> # 1 "/usr/include/bits/wordsize.h" 1 3 4
> # 453 "/usr/include/sys/cdefs.h" 2 3 4
> # 1 "/usr/include/bits/long-double.h" 1 3 4
> # 454 "/usr/include/sys/cdefs.h" 2 3 4
> # 451 "/usr/include/features.h" 2 3 4
> # 474 "/usr/include/features.h" 3 4
> # 1 "/usr/include/gnu/stubs.h" 1 3 4
> 
> # 1 "/usr/include/gnu/stubs-32.h" 1 3 4
> # 8 "/usr/include/gnu/stubs.h" 2 3 4
> # 475 "/usr/include/features.h" 2 3 4
> # 34 "/usr/include/bits/libc-header-start.h" 2 3 4
> # 27 "/usr/include/stdint.h" 2 3 4
> # 1 "/usr/include/bits/types.h" 1 3 4
> # 27 "/usr/include/bits/types.h" 3 4
> # 1 "/usr/include/bits/wordsize.h" 1 3 4
> # 28 "/usr/include/bits/types.h" 2 3 4
> # 1 "/usr/include/bits/timesize.h" 1 3 4
> # 29 "/usr/include/bits/types.h" 2 3 4
> 
> # 31 "/usr/include/bits/types.h" 3 4
> typedef unsigned char __u_char;
> ...
> 
> while the freestanding form with `gcc -ffreestanding -m32 -E` is:
> 
> # 1 "foo.c"
> # 1 "<built-in>"
> # 1 "<command-line>"
> # 1 "foo.c"
> # 1 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint.h" 1 3 4
> # 11 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint.h" 3 4
> # 1 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint-gcc.h" 1 3 4
> # 34 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint-gcc.h" 3 4
> 
> # 34 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint-gcc.h" 3 4
> typedef signed char int8_t;
> ...
> 
> 
> I can compile and link trivial programs using -m32 and stdint.h without
> any issue.
> 
> Clearly something more subtle is going on with our choice of options
> when compiling hvmloader, but it certainly looks like stdint.h is fine
> to use in the way we want to use it.

Why "more subtle"? All we're lacking is -ffreestanding. The
question is whether it is an acceptably risky thing to do at
this point in the release cycle to add the option.

Jan

