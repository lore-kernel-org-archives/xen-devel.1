Return-Path: <SRS0=l70B=6A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10053C2BB85
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 08:34:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2766208E4
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 08:34:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="zB/xDfUV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2766208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOzyF-0007Ru-Me; Thu, 16 Apr 2020 08:34:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FuWY=6A=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jOzyE-0007Rm-Qc
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 08:34:02 +0000
X-Inumbo-ID: 05f25732-7fbd-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05f25732-7fbd-11ea-b4f4-bc764e2007e4;
 Thu, 16 Apr 2020 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5rwClm+Zgtmmy4ztGRUQ5EJ3hSqUkJhruPU33x8OK9U=; b=zB/xDfUVKw75+nC3KYbUWUXn7u
 FC/L4uVg8CHqoYa7cmGVfqcLdC9Di1oNEby7Ks4dhmMsKE7ayxO7eRnQplV5yQVhkClbHQi/5lmXP
 zfLEYBtK4YxbB/oEUJ73oEq9V5mMYO+A1xh72ybD+bYZR0D8AFLJ5ULF/b9WQH1azk8M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOzyA-0007g2-UV; Thu, 16 Apr 2020 08:33:58 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOzyA-0006FQ-NK; Thu, 16 Apr 2020 08:33:58 +0000
Subject: Re: [PATCH] x86/boot: Fix early exception handling with
 CONFIG_PERF_COUNTERS
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20200415173911.13286-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1123ff61-4e82-26dc-6727-d6a877f3723d@xen.org>
Date: Thu, 16 Apr 2020 09:33:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415173911.13286-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <jgrall@amazon.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Andrew,

On 15/04/2020 18:39, Andrew Cooper wrote:
> The PERFC_INCR() macro uses current->processor, but current is not valid
> during early boot.  This causes the following crash to occur if
> e.g. rdmsr_safe() has to recover from a #GP fault.
> 
>    (XEN) Early fatal page fault at e008:ffff82d0803b1a39 (cr2=0000000000000004, ec=0000)
>    (XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
>    (XEN) CPU:    0
>    (XEN) RIP:    e008:[<ffff82d0803b1a39>] x86_64/entry.S#handle_exception_saved+0x64/0xb8
>    ...
>    (XEN) Xen call trace:
>    (XEN)    [<ffff82d0803b1a39>] R x86_64/entry.S#handle_exception_saved+0x64/0xb8
>    (XEN)    [<ffff82d0806394fe>] F __start_xen+0x2cd/0x2980
>    (XEN)    [<ffff82d0802000ec>] F __high_start+0x4c/0x4e
> 
> Furthermore, the PERFC_INCR() macro is wildly inefficient.  There has been a
> single caller for many releases now, so inline it and delete the macro
> completely.
> 
> For the assembly, move entry_vector from %eax into %ecx.  There is no encoding
> benefit for movzbl, and it frees up %eax to be used inside the
> CONFIG_PERF_COUNTERS block where there is an encoding benefit.
> 
> There is no need to reference current at all.  What is actually needed is the
> per_cpu_offset which can be obtained directly from the top-of-stack block.
> This simplifies the counter handling to 3 instructions and no spilling to the
> stack at all.
> 
> The same breakage from above is now handled properly:
> 
>    (XEN) traps.c:1591: GPF (0000): ffff82d0806394fe [__start_xen+0x2cd/0x2980] -> ffff82d0803b3bfb
> 
> Reported-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I can confirm the crash I have seen has now disappeared.

Tested-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

