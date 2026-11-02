Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD2E606A326
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 08:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=agjeh3/D
Received: from list by lists.xenproject.org with outflank-mailman.1467813.1676844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNn6r-0000tF-Dw; Mon, 02 Nov 2026 08:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467813.1676844; Mon, 02 Nov 2026 08:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNn6r-0000t8-BI; Mon, 02 Nov 2026 08:09:41 +0000
Received: by outflank-mailman (input) for mailman id 1467813;
 Mon, 02 Nov 2026 08:09:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNn6q-0000t2-9s
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 08:09:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNn6p-006J7v-7s
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 09:09:39 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae8453e-e002-0a2a0a5209dd-0a2a4505e320-10
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 09:09:35 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae8453f-4cb1-0a2a45050019-d155802ec93d-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 09:09:35 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so19989545e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 00:09:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa81a896ecsm343448895e9.9.2026.11.02.00.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2026 00:09:34 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793606975; x=1794211775; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkjuEr0ZHS6yz+4IZVRbzWP0WQjy7Wkzzke+VN3k/0M=;
        b=agjeh3/DLo6FwDcvEUj9f5052fuhIquLf5a7ZEErROeg17ZaYC8vC87ouBpaZQVsMi
         XBhy4iN8wBgwxJqxifzXF5ULI8rL2qep/MHLa+TABPYuHTNhvBQJgY3KBsi+m+8Kq+Pn
         EO13wnEssSMJjbgVMTr01eL+DvmjR/2A6B4fixn0bRL1VwluVBB93k01WYa1ly0E9pVL
         UpVA58Su4bC/OQQqqRQDG9PH2/KYiwShYjK/BpsLALmNJoyOrTZkz8feBeySeEKiXS88
         xGDDpwoaKHqTu78ZK3tk4+IcvKGB5yMrTIdVzKPhlA+DoPEQPGNdrIobk3FZnlpvcTJl
         SuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606975; x=1794211775;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WkjuEr0ZHS6yz+4IZVRbzWP0WQjy7Wkzzke+VN3k/0M=;
        b=xBrr0SFAesRlMuY+3P0twJGrsYN6jdP44phXDDbPRUTyR+agVnWwm7TeWBwo+v7Gdx
         VkhQhblwQ0XPZT1mYW5L2AvhwdgUgzQWpvQgSpcKfuJwl7GhacofIonSZfZZU8k8rO5k
         ha1I+QIWFogfMjfxN+xJXNt6WrsVgboxvIAHxUH7pb7AqIkKQctQiHBEWysgSykag8i5
         Fu5/xg1zDRcgSz0Y+vR1v+VO+yvsMTIuKVVx9LNZUbycd5cnI8LZ/iqfTyfuP2hQ0+lv
         ccgzNZH5MZ1VrGrFVRq2zOifrVVBme8qz/X6EbePsgb1Xsp9yU6aisq9yJ15RJ+Uqjtz
         nuTA==
X-Gm-Message-State: AFq9FYKGkVhawqMXLcVo+epQiGLdQUkFTNmpb39/IUNeMSOZ8maul9Gi
	YhVFytndlfNWnBsWteEDYWVKbT29nQbUO8ctAxp6wta1T3Tc7ohS/RJ9nWy5SIZ0ZA==
X-Gm-Gg: AYBFou0CnvRn1Dw8U6+lvIJHcOt3HOWmj5ZGtQF/XxjlNtRRRcWxuHi7xlDpaah+uuQ
	1JuELLlMGNE0gC/SopUO1YCgxdyDg+kTHXdCUAjcDTQro5iewwWWst2ujYNKIXnB5wXegpE5xWb
	croYVWw4JYJ9PyGKDIYJD3b2m/Gxu5FoOEDMqvigWByOZYd+wcoESmwTTi5fV5xFsX9RQbvJTFp
	ha96GM3iZpt4xY74WwpoWbhwvJXoKbpTcGSD4RSm/L8xypnbxqUnWmZK/J49BhT9CnA+t9fB5EL
	ihlPy+qPVQYRUKlIOmA5w2eNTF6n1FGYmXRJFLKor0kMVgE+rElBw1fjczdQQ1j12EcQaAaBOgx
	iNR5DLsjOaq6ckowVN2k3IZHHoiOcTKdZz+Bbi98q+dpPLcNNGUX5YFyI4pUV5NkVtHGAa8278x
	64Lx1Kkn9TIVYAI4yrR4ilM2W7OLdw3iPCtozi7/ZyqFZ7euJncVWLDIyutpA1z8Lj5/mHpaxHW
	cCQf9RhiihabK0ouFrBDgK8d6criX4v7L8CyduszUIHG/RrE5+mX57CW/964WlqK+Iu8x5GWpF8
	/7ok99pVaqfe23QrV3eGmgweEjOf0e4oErSNfJY1j5pDySTCMBhuCHFrZhMDXICnljtGPqFiujB
	IxiMoResUKY9897A=
X-Received: by 2002:a05:600c:6211:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4ac17191046mr221775665e9.6.1793606975131;
        Mon, 02 Nov 2026 00:09:35 -0800 (PST)
Message-ID: <a9698062-27a5-4fc7-b507-4536f3685f5d@suse.com>
Date: Mon, 2 Nov 2026 09:09:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] common: introduce "brk" allocator
To: George Dunlap <dunlapg@umich.edu>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <8ad3beb3-af5a-477b-af97-614edb22631a@suse.com>
 <4fc90702-fb9a-4f96-88f0-35bd3b4857f4@suse.com>
 <CAFLBxZZ5i9E6P_Gbt79coQikRG2uscxGRb+yAs2++U_Mkku9_w@mail.gmail.com>
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
In-Reply-To: <CAFLBxZZ5i9E6P_Gbt79coQikRG2uscxGRb+yAs2++U_Mkku9_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1793606975-F78BE2A1-1F5ED1BF/10/78276251493
X-purgate-type: spam
X-purgate-size: 4519
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29.10.2026 22:40, George Dunlap wrote:
> On Wed, Oct 14, 2026 at 2:02 PM Jan Beulich <jbeulich@suse.com> wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/brk.h
>> @@ -0,0 +1,23 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#ifndef X86_BRK_H
>> +#define X86_BRK_H
>> +
>> +static inline unsigned long brk_adjust_start(unsigned long start)
>> +{
>> +    unsigned int subsys;
>> +
>> +    /*
>> +     * Only xen.efi will have the symbol __subsystem__ available, and it'll
>> +     * be non-zero (10) there.  In ELF the symbol will be undefined, and
>> +     * hence zero will be loaded into the register.
>> +     */
>> +    asm ( ".weak __subsystem__; mov $__subsystem__, %0" : "=r" (subsys) );
>> +
>> +    /* using_2M_mapping() isn't available here. */
>> +    if ( IS_ENABLED(CONFIG_XEN_ALIGN_2M) || subsys )
>> +        start = PAGE_ALIGN_2M(start);
> 
> This seems a bit fragile: As it happens this corresponds to the clip
> to brk_end in setup.c in patch 2, but if it didn't, then the boundary
> in the resulting e820 reservation and what gets unmapped in
> brk_free_unsed() wouldn't match.
> 
> Claude seems to think you could make using_2M_mapping() available
> here; and then brk_adjust_start() becomes return using_2M_mapping() ?
> PAGE_ALIGN_2M(start) : start.  That drops the ASM, and the comment
> about the linker producing a bogus relocation.  2/3 could then do
> brk_end = brk_adjust_start(brk_cease()), and guaranteeing that the two
> are the same.

I don't think exposing using_2M_mapping() globally would be a good idea.

>> --- /dev/null
>> +++ b/xen/common/brk.c
>> @@ -0,0 +1,74 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +#include <xen/brk.h>
>> +#include <xen/efi.h>
>> +#include <xen/lib.h>
>> +#include <xen/mm.h>
>> +#include <xen/page-defs.h>
>> +
>> +#if __has_include(<asm/brk.h>)
>> +# include <asm/brk.h>
>> +#endif
>> +
>> +extern char __brk_start[];
>> +extern const char __bss_end[];
>> +
>> +static unsigned long __initdata allocated;
>> +static bool __initdata finished;
>> +
>> +void *__init brk_alloc(size_t size)
>> +{
>> +    void *ptr;
>> +
>> +    if ( finished )
>> +        return NULL;
>> +
>> +    /* Allocations PAGE_SIZE and up will be page-aligned. */
>> +    if ( size >= PAGE_SIZE )
>> +        allocated = ROUNDUP(allocated, PAGE_SIZE);
>> +
>> +    ptr = __brk_start + allocated;
>> +
>> +    allocated += ROUNDUP(size, sizeof(void *));
>> +
>> +    if ( allocated > __bss_end - __brk_start )
>> +    {
>> +        printk_once_init(
>> +            "%pS: over-sized BRK request: %zu bytes\n",
>> +            __builtin_extract_return_addr(__builtin_return_address(0)),
>> +            size);
>> +        return NULL;
>> +    }
> 
> You bump the global `allocated` variable here before the check, and
> don't reset it afterwards.   All future allocation attempts will
> continue to bump this value, and
> continue to fail.  So now allocated + brk_start is past _bbs_end,
> brk_cease() will return something past bss_end, and (in patch 2) pass
> that as reserve_e820_ram().  So now, so far from reducing the size
> reserved to Xen by , we may be *increasing* the size reserved to Xen
> with unused pages.  Worse, if it ends up overshooting the region Xen
> is in, then reserve_e820_ram() will fail, and the host will panic.
> 
> This should probably use a local variable, then set the global
> variable after we've determined that the check has succeeded.

Could be done, but did Claude also realize that failure to set aside
enough space so allocations can't fail is, effectively, a fatal bug?
The printk_once_init() isn't a panic() here merely because panic()
isn't going to work very well when still in EFI boot services: We
shouldn't halt the system there, we should only yield control back to
EFI (such that another boot attempt can be made). See patch 2.

> The other thing Claude points out is that is_xen_fixed_mfn() isn't
> updated, so if ever any of these pages want to be offlined for any
> reason, it will be blocked, claiming that they're part of Xen, even if
> they've already been assigned to a guest.  This is a pre-existing
> situation that is extended by this patch.

This indeed needs taking care of, albeit in patch 2. It's not clear
to me though why you (they?) say this would be a pre-existing
situation. The use of __2M_rwdata_end there looks correct to me prior
to this series.

Jan

