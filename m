Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0698BC43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 14:59:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350095.1607671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewP0-0004pt-Kh; Wed, 01 Jul 2026 14:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350095.1607671; Wed, 01 Jul 2026 14:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewP0-0004pm-HU; Wed, 01 Jul 2026 14:59:02 +0000
Received: by outflank-mailman (input) for mailman id 1350095;
 Wed, 01 Jul 2026 14:59:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mfo@igalia.com>) id 1wewOy-0004p4-Mb
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 14:59:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wewOx-009Bxm-I3
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 16:58:59 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mfo@igalia.com>)
 id 6a452b2d-e002-0a2a0a5209dd-0a2a450a99f4-2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 16:58:58 +0200
Received: from [213.97.179.56] (helo=fanzine2.igalia.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mfo@igalia.com>)
 id 6a452b31-e40e-0a2a450a0019-d561b338a1fe-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 16:58:58 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtps 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wewOT-007byj-B1; Wed, 01 Jul 2026 16:58:29 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
 by mail.igalia.com with esmtp (Exim)
 id 1wewOQ-00841m-SR; Wed, 01 Jul 2026 16:58:29 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
 by webmail.service.igalia.com with esmtp (Exim 4.98.2)
 (envelope-from <mfo@igalia.com>) id 1wewOQ-0000000DnWw-2mEJ;
 Wed, 01 Jul 2026 16:58:26 +0200
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
	bh=BZbTYczaqR+mc0JSoafl6QcdAzR5SvJPdrKk020zPEg=; b=PVy1HSQLMkQpFi7ZTp853RG96b
	F2mF12VBmD1hT/zcrqto++UkCFfRWhhxRJ8mlk5lnCU1HMZ9w9MSTXUCDJJxTL464QIi5fLKqe53P
	hQWAUxmAxLJKfvrZoGTRDyyvP0Rz5BFSu1uRa4rGqFFLGyMdIYEk7QE359FXCSzpWrixldz1LYPsG
	Y6ug4IkBhv1nKfxHNt62cYIL3DC+ySS+M8Sq49/nhmGYCeVMGwLqvXJO9VzNJxjdKVEV9fSEu+CMe
	VFT9FcR4vkE9tQI3/rsi9C/rCdhcT6wDhaKgo+P6UC5pznSJ6pe1cata4EyIIgqE+hM58kzVi9uOw
	PC7GOjjQ==;
MIME-Version: 1.0
Date: Wed, 01 Jul 2026 11:58:26 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH RESEND v5 1/3] x86/asm, x86/boot: expose inline memcmp
In-Reply-To: <20260701070531.GK48970@noisy.programming.kicks-ass.net>
References: <20260630-pvh-kasan-inline-v5-0-52afc979be81@igalia.com>
 <20260630-pvh-kasan-inline-v5-1-52afc979be81@igalia.com>
 <20260701070531.GK48970@noisy.programming.kicks-ass.net>
Message-ID: <a433b566c26191283da0506cc6781e45@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1782917938-D5129DDE-38EB2725/0/0
X-purgate-type: clean
X-purgate-size: 3568

On 2026-07-01 04:05, Peter Zijlstra wrote:
> On Tue, Jun 30, 2026 at 02:21:46PM -0300, Mauricio Faria de Oliveira wrote:
>> Move the inline memcmp function currently only available in 'boot/string.c'
>> into the shared string function header <asm/shared/string.h> to be reused.
>> 
>> This is not done through <asm/string.h> to avoid pulling unnecessary code
>> in 'boot/string.c' that causes build errors in 'boot/compressed/string.c'
>> and 'purgatory/purgatory.ro'.
>> 
>> Note that the inline memcmp() returns 0/1, not -1/0/1 as regular memcmp()
>> (reported by David Laight <david.laight.linux@gmail.com>).
>> 
>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
>> ---
>>  arch/x86/boot/string.c               |  6 ++----
>>  arch/x86/include/asm/shared/string.h | 16 ++++++++++++++++
>>  arch/x86/include/asm/string.h        |  1 +
>>  3 files changed, 19 insertions(+), 4 deletions(-)
>> 
>> diff --git a/arch/x86/boot/string.c b/arch/x86/boot/string.c
>> index ac0f900ebc47efa81c92e1bb2010ea41677899c4..be454a6864225f3a972c3e81826b77ed4e8a57fe 100644
>> --- a/arch/x86/boot/string.c
>> +++ b/arch/x86/boot/string.c
>> @@ -15,6 +15,7 @@
>>  #include <linux/errno.h>
>>  #include <linux/limits.h>
>>  #include <asm/asm.h>
>> +#include <asm/shared/string.h>
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
>> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include/asm/shared/string.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..422952152f533ad75b98f3873297b39c4f5e2477
>> --- /dev/null
>> +++ b/arch/x86/include/asm/shared/string.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_X86_SHARED_STRING_H
>> +#define _ASM_X86_SHARED_STRING_H
>> +
>> +/* Note: this memcmp() returns 0/1, not -1/0/1 as regular memcmp(). */
>> +static __always_inline int __inline_memcmp(const void *s1, const void *s2, size_t len)
>> +{
>> +	bool diff;
>> +
>> +	asm("repe cmpsb"
>> +	    : "=@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
>> +
>> +	return diff;
>> +}
>> +
>> +#endif /* _ASM_X86_SHARED_STRING_H */
>> diff --git a/arch/x86/include/asm/string.h b/arch/x86/include/asm/string.h
>> index 9cb5aae7fba9ffcf0f5af8f939d30467750ccaa9..f0f4fd8227bf992e78c69209efb31f0a9a0cc3b1 100644
>> --- a/arch/x86/include/asm/string.h
>> +++ b/arch/x86/include/asm/string.h
>> @@ -7,6 +7,7 @@
>>  #else
>>  # include <asm/string_64.h>
>>  #endif
>> +#include <asm/shared/string.h>
>>  
>>  static __always_inline void *__inline_memcpy(void *to, const void *from, size_t len)
>>  {
> 
> It seems weird to have __inline_mem{cpy,set}() in a different header than
> __inline_memcmp(). I'm assuming this is because boot cannot include the
> normal string thing?
> 
> Perhaps make inline_string.h or somesuch to carry all three of them and
> include that from the relevant places?

Thanks for looking into this.

Yes, your question and suggestion above are essentially patch 1 in v4
[1].

Borislav Petkov requested a clean header in arch/x86/include/asm/shared/
for this (without other code), which is patch 1 in v5.

cheers,

[1]
https://lore.kernel.org/all/20260526-pvh-kasan-inline-v4-1-a310e6a25ecd@igalia.com/

-- 
Mauricio

