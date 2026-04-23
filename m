Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB880FC037D
	for <xen-devel@archiver.kernel.org>; Thu, 23 Apr 2026 15:59:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1292354.1570826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFwSD-0003AS-5i; Thu, 23 Apr 2026 15:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292354.1570826; Thu, 23 Apr 2026 15:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFwSD-0003AL-1d; Thu, 23 Apr 2026 15:59:01 +0000
Received: by outflank-mailman (input) for mailman id 1292354;
 Thu, 23 Apr 2026 15:58:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wFwSB-0003AF-D4
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 15:58:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFwS9-001RvN-U8
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 17:58:58 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 69ea41a6-e002-0a2a0a5209dd-0a2a450bc83c-32
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 17:58:57 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <mfo@igalia.com>)
 id 69ea41c0-212f-0a2a450b0019-d561b338e004-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 17:58:56 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wFwRl-001AbI-Gv; Thu, 23 Apr 2026 17:58:32 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wFwRi-002EgO-KM; Thu, 23 Apr 2026 17:58:32 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wFwRh-00000000VIN-47KH;
 Thu, 23 Apr 2026 17:58:30 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20170329 header.d=igalia.com header.i="@igalia.com" header.h="Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=xdei9ZM7WTccU6AfBRlzsKRTYKtjrdEquFKjWHLZr4Y=; b=iTiYf3Nzj5Np2xldc79/j65JLs
	VjsDJrQ0MdOSXjVwmYndAMc5CnAJyL/qhkfzeFgVSH9oP/iuNoZrJlGwDBRnoNdn3tdnvoys5Ergx
	QAYzIVZiJU5wlHxM9zjXdUkms7dq3RA9wS1oGADO5CXHpkPzA7wmZrUNtIjQS/xz/3bTCsTFqLiGj
	bl7gSF67h3l35cYri9xNAn8Sb6Vod1++ofxhxBe3pltxcKtmqMDZ5odZ8Umc1pGyQ23Zw3xEWfuAF
	yjtpFRvwqnJ0LAc/o5PN2wHBjE3lHZtIU2q72C4U67i5xCkmksAu0QlUoCXis2FXMEERxuMVFGHWa
	ZvBmMFsQ==;
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 12:58:30 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Juergen Gross
 <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] x86/asm, x86/boot: Expose inline memcmp
In-Reply-To: <20260422215441.4204c142@pumpkin>
References: <20260422-pvh-kasan-inline-v1-0-7e6194344c92@igalia.com>
 <20260422-pvh-kasan-inline-v1-1-7e6194344c92@igalia.com>
 <20260422215441.4204c142@pumpkin>
Message-ID: <324ef97b16f52e0ccc72f6381d1b5dd2@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1776959937-05D6FF3B-89058958/0/0
X-purgate-type: clean
X-purgate-size: 3135

On 2026-04-22 17:54, David Laight wrote:
> On Wed, 22 Apr 2026 17:07:45 -0300
> Mauricio Faria de Oliveira <mfo@igalia.com> wrote:
> 
>> Move the inline memcmp function, currently only available to boot code
>> (boot/string.c), into the header with similar inline string functions
>> (include/asm/string.h) so it may be reused.
> 
> This needs a comment/warning that it is incompatible with normal memcmp()
> because it only returns 0/1 not -1/0/1.
> Most callers don't care.

Thanks for catching and suggesting this.

I can also change it to -1/0/1 in a later patch, to keep v2 only a fix
and split a behavior change, with something like this (lightly tested):

static __always_inline int __inline_memcmp(const void *s1, const void
*s2, size_t len)
{
        bool above, below;

        asm("repe cmpsb"
            : "+S" (s1), "+D" (s2), "+c" (len),
              "=@cca" (above),
              "=@ccb" (below));

        return above - below;
}

cheers,

> 
> 	David
> 
> 
>> 
>> Add a _SETUP guard in string.h so not to include the 32/64-bit specific
>> string headers in boot/ code (16-bit, real mode) and avoid build errors.
>> 
>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>> ---
>>  arch/x86/boot/string.c        |  6 ++----
>>  arch/x86/include/asm/string.h | 11 +++++++++++
>>  2 files changed, 13 insertions(+), 4 deletions(-)
>> 
>> diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
>> index b25c6a9303b7314d5caf5c9306239811705294fe..bbee78637b349e42e9281d8df50d89d48f4490b9 100644
>> --- a/arch/x86/boot/string.c
>> +++ b/arch/x86/boot/string.c
>> @@ -15,6 +15,7 @@
>>  #include <linux/errno.h>
>>  #include <linux/limits.h>
>>  #include <asm/asm.h>
>> +#include <asm/string.h>
>>  #include "ctype.h"
>>  #include "string.h"
>>  
>> @@ -31,10 +32,7 @@
>>  
>>  int memcmp(const void *s1, const void *s2, size_t len)
>>  {
>> -	bool diff;
>> -	asm("repe cmpsb"
>> -	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
>> -	return diff;
>> +	return __inline_memcmp(s1, s2, len);
>>  }
>>  
>>  /*
>> diff --git a/arch/x86/include/asm/string.h b/arch/x86/include/asm/string.h
>> index 9cb5aae7fba9ffcf0f5af8f939d30467750ccaa9..736a6f6a31f0a68281b4f17415aba0fcd95dc228 100644
>> --- a/arch/x86/include/asm/string.h
>> +++ b/arch/x86/include/asm/string.h
>> @@ -2,11 +2,13 @@
>>  #ifndef _ASM_X86_STRING_H
>>  #define _ASM_X86_STRING_H
>>  
>> +#ifndef _SETUP
>>  #ifdef CONFIG_X86_32
>>  # include <asm/string_32.h>
>>  #else
>>  # include <asm/string_64.h>
>>  #endif
>> +#endif
>>  
>>  static __always_inline void *__inline_memcpy(void *to, const void *from, size_t len)
>>  {
>> @@ -29,4 +31,13 @@ static __always_inline void *__inline_memset(void *s, int v, size_t n)
>>  	return ret;
>>  }
>>  
>> +static __always_inline int __inline_memcmp(const void *s1, const void *s2, size_t len)
>> +{
>> +	bool diff;
>> +
>> +	asm("repe cmpsb"
>> +	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
>> +	return diff;
>> +}
>> +
>>  #endif /* _ASM_X86_STRING_H */
>>

-- 
Mauricio

