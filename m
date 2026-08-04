Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7462FC55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 13:41:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382174.1625544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrFO7-0001JG-6C; Tue, 04 Aug 2026 13:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382174.1625544; Tue, 04 Aug 2026 13:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrFO7-0001J9-3T; Tue, 04 Aug 2026 13:40:59 +0000
Received: by outflank-mailman (input) for mailman id 1382174;
 Tue, 04 Aug 2026 13:40:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrFO5-0001J2-DR
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 13:40:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrFO4-00EzIj-AN
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:40:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a71ebdc-5cb7-0a2a0a5109dd-0a2a4507af8a-44
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 15:40:56 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a71ebe7-b4ea-0a2a45070019-d1558029e403-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 15:40:56 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso22305565e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 06:40:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fc6f16sm159359965e9.2.2026.08.04.06.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 06:40:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785850855; x=1786455655; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJJQReJUi7fUzVzzuopy47u3RxzqcfK1FXi07EBFiFs=;
        b=FzxPh1Hb5Zc+wY9VXIP0tz/nNr41bOv0/pEnbRWvFou+uHatSd3K2TspxcTqxL4yco
         WJ66jnjO7EfbdH6zKB1Hgx22lYDBYO+LQYKdcGwjzMaW6LhOBYqKZkHiPjoyppHpZvzZ
         TV7N5vqUuodoS9yIHh+S+oYSJj8cMEE9X730LYcPe1cysKYExCaBw6oTPgXqbfB/tAlx
         TG+/yiEP2DFPkvWhLK+bFuPwG8Sp+GqeIRi9eVdCdwWXVmq47wtlJj2or1ahaT+7l+Fq
         Np2k3N+wFYtXpc8RK+DhMFz/opAWa8sx29NBeDRMHD5IA5uJe5Xp4wS+tUTRqzYTlNqK
         fyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850855; x=1786455655;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJJQReJUi7fUzVzzuopy47u3RxzqcfK1FXi07EBFiFs=;
        b=IwQ9ss10WD4Xfid07yrdpzX6Ej8bCpSv4x4VsyFbz/A+Uh9ARjFtbZSAMOnnQwuJWQ
         Cs1vMTKfl+1Ng6n9M+4ETz07xwhlqZVqKU5T1QrzLdaHsCDRNbbKimTCKctNMZMRoIDL
         VnQWpKAorY17WXPO4fqzAktk8eFTBVSn4ESp160lyql5P6xPiU3YsY9dkgENXXrb92A6
         eK5SJzjxEKZVCQkppNSw2eofAbSj3JUu2Uhn2HGdCxCi5DK9FAvcixR3ivWllivg9IvQ
         Qm2P2laX+F6bDzyA4Dflfypx/g0Ru+yWYDL+QCwCUXpCgoCY6PsiKTrzTYep486GHPRa
         Lycg==
X-Forwarded-Encrypted: i=1; AHgh+RqjJBSr9eqVphtdrOaZyZTjNIjaQ6cvvC2XKEWKHBF0OUhrGy3BgIq1LGq8U8bE8StTwDEKByc8zNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzw0ZbPpfkovqGlqDyXNNpJfV6IEHSKGkD8CXJV7cjWLwgQJGLa
	ocJ0tA1KP3DkFHhLeUeeJ4tTnJGl3liKnRbdIXkTYM+z/YfD43jbkz03aDKtoO7+ow==
X-Gm-Gg: AR+sD11LgpZ7BPZjRdnb27UwUQXh4WLsE9q1GR46dRHHEqr9GwQr4rqLhXyph6tx5RX
	UT79dPUhb1KGBDLIBPabPbUkO+A51hYYdqKgQHz1lOViXbWgLEofJE6gy6l7e4YuLC3utehoebj
	9VDw3oWyzS8yxB+usZMMVIZKGimDSFSE4svBjlSCYAiIb7/9Ey3CDVnYpAO+X/biuAzLEs2RDE/
	gx8vR5ROowwlDITAT4z6eP2w7p46jYlxX3jRUabnsIslyskiahsWBt9/p1ARrZ01lta+9JJa3hr
	pJCFh7QAKXw2OLIU0h4WUaAL8z7HL7fWUTnFqTb/pBoPzdOB2D0l+C1P7i+U2KJP+FUv9MM570o
	alpYPiv5hl6pVaPmoXwzdbOmWS/4OrqTRmDb41Ot/i1olss/s8w+m+5WrkNCIW4k05DMsLXDDol
	bYP+tj7ZCnlmgb8isgcgKCsuzpUs5LuqgoJnuDA1KfNdoSTvjZudCNELc41T5XvHq6fGRaLxGFk
	cv7TJlBwwqC4XL4jiR664i25GAZrDbNlSmG0RGer2pGB8Vft5ni
X-Received: by 2002:a05:600c:840f:b0:495:5fdf:2075 with SMTP id 5b1f17b1804b1-4980c5fa29amr299658695e9.0.1785850852314;
        Tue, 04 Aug 2026 06:40:52 -0700 (PDT)
Message-ID: <2c012213-0fd0-40f8-8806-0096040370aa@suse.com>
Date: Tue, 4 Aug 2026 15:40:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86: introduce "brk" allocator
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <31ba7ff2-a42d-44aa-976c-17fbff44a56f@suse.com>
 <f7e3cd68-f6de-4ada-87d9-1a5dff277b2f@suse.com>
 <91bdef16-2da7-49e7-af5a-e395da533330@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <91bdef16-2da7-49e7-af5a-e395da533330@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1785850856-36CDFAE4-6EA4D02B/0/0
X-purgate-type: clean
X-purgate-size: 4240

On 30.07.2026 19:59, Andrew Cooper wrote:
> On 27/07/2026 11:19 am, Jan Beulich wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/boot/brk.c
> 
> While brk.c has x86 specifics, I'm not sure it's worthy if being in
> boot/, rather than simply in x86/.  It's used until mid way through
> __start_xen().

As discussed, I'll move this to common/brk.c right away, abstracting out
the x86 specifics.

>> @@ -0,0 +1,72 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +#include <xen/efi.h>
>> +#include <xen/lib.h>
>> +#include <xen/mm.h>
>> +#include <xen/page-defs.h>
>> +
>> +#include <asm/brk.h>
>> +
>> +extern char __brk_start[];
>> +extern const char __bss_end[];
>> +
>> +static unsigned long __initdata allocated;
>> +static bool __initdata finished;
>> +
>> +void *__init brk_alloc(size_t size)
>> +{
>> +    void *ptr = __brk_start + allocated;
>> +
>> +    if ( finished )
>> +        return NULL;
>> +
>> +    /* Allocations PAGE_SIZE and up will be page-aligned. */
>> +    if ( size >= PAGE_SIZE )
>> +        allocated = ROUNDUP(allocated, PAGE_SIZE);
>> +
>> +    allocated += ROUNDUP(size, sizeof(void *));
>> +
>> +    if ( allocated > __bss_end - __brk_start )
>> +        return NULL;
> 
> This means one (or more) subsystem has brk_alloc()'d more than they
> reserved.
> 
> While returning NULL is probably the best action, I think a
> printk_once() is also warranted.

Hmm, yes, just that there's a quirk to work around: The static that
printk_once() uses gets in the way of the file getting compiled into
brk.init.o.

>> +
>> +    return ptr;
>> +}
>> +
>> +unsigned long __init brk_get_unused_start(void)
>> +{
>> +    finished = true;
> 
> This doesn't get the unused start.  It also terminates the allocator,
> and the name needs to reflect that.

brk_cease() then.

> But combined with brk_end in the next patch, it's really quite a mess. 
> Integrating brk_end properly simplifies this patch too.

No, brk_end really is an x86-specific helper variable. I'd like to keep
that as it is.

>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/brk.h
>> @@ -0,0 +1,7 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +#include <xen/types.h>
>> +
>> +void *brk_alloc(size_t size);
>> +unsigned long brk_get_unused_start(void);
>> +void brk_free_unused(void);
> 
> It's inevitable that brk is going to be used in other architectures, and
> none of this is x86 specific.
> 
> This should be xen/include/brk.h right from the outset, even if that's
> all we do in the way of making it generic.
> 
> Except, brk_end in patch 2 really needs to live in common/brk.c so it's
> probably easier to go in arch-neutral right from the outset and use
> "select ARCH_HAS_BRK" or so to allow the arches to opt into using it.
> 
> Furthermore, this header needs some commentary.  To do this nicely,
> DEFINE_BRK() needs to be introduced here so the comment makes sense.

Sure, I can move introduction of the macro here.

Jan

> -----
> Early Boot memory allocator.
> 
> Subsystems which conditionally need memory prior to the main heap being
> set up should use DEFINE_BRK() to reserve BSS space in Xen.
> 
> During boot, brk_alloc() allocates memory from the reserved space.  Such
> allocations are good for the lifetime of Xen.  Subsystems MUST NOT
> brk_alloc() more memory than they reserved.
> 
> When the main heap is set up, brk allocations become unavailable. 
> Reserved but unallocated space is handed to the main heap, so it doesn't
> go to waste.
> -----
> 
> 
> With just a few sentences, it's now far clearer what brk is and how to
> use it.
> 
> 
>> --- a/xen/arch/x86/xen.lds.S
>> +++ b/xen/arch/x86/xen.lds.S
>> @@ -321,7 +321,11 @@ SECTIONS
>>         __bss_start = .;
>>         *(.bss.page_aligned*)
>>         PERCPU_BSS
>> -       *(.bss .bss.*)
>> +       *(.bss .bss.[a-zA-Z0-9_]*)
>> +       . = ALIGN(PAGE_SIZE);
>> +       __brk_start = .;
>> +       *(.bss..brk.page_aligned*)
>> +       *(.bss..brk*)
>>         . = ALIGN(POINTER_ALIGN);
> 
> This looks fine, but if it's becoming common then it wants to be a macro
> in xen.lds.h
> 
> ~Andrew


