Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B17606A320
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 14:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=e3+CAEjd
Received: from list by lists.xenproject.org with outflank-mailman.1494683.1694055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTh41-0007lR-2Q; Wed, 18 Nov 2026 14:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494683.1694055; Wed, 18 Nov 2026 14:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTh40-0007lK-V8; Wed, 18 Nov 2026 14:55:08 +0000
Received: by outflank-mailman (input) for mailman id 1494683;
 Wed, 18 Nov 2026 14:55:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTh3z-0007lE-6l
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 14:55:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTh3y-00GBB6-JT
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 15:55:06 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdbc40-2eae-0a2a0a5409dd-0a2a450a9438-32
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 15:55:06 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdbc4a-f2d2-0a2a450a0019-d1558036a8f2-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 15:55:06 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4bb666304fdso17172925e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 06:55:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb7d2c31c6sm75676145e9.12.2026.11.18.06.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 06:55:05 -0800 (PST)
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
        d=suse.com; s=google; t=1795013706; x=1795618506; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZX4Tc9pKlVjlrSyxFFdrOMyFXuw2xFF1ee9Bb77E7pc=;
        b=e3+CAEjdlBEzBJJ55D0zHSzcarXkA2qGnoJa/reY3GSRVsqdXfcvu03sF65tJpe8k6
         dQ9ekJtN/MIIR5sjH80VyMJRnIQ9hb9XvWZNo9OtxzriUjCunBKRZsp0nmuJn0xd9Aqj
         izkMyol1VxG7v/3qzVNBamvjFTzWxx4bR8cI87ShV9OQxTabh/2qJE5FS+PZu07SP/U7
         9r5kQyQHaMY3+UYDMDRsJ+ECqwmYNWgElHRI48byIHeNsqolAepu+RUtN5BYScaIqzuE
         QwCwVlE5XhVPbG1K7raOZguIO/sWVMszBe+cLSZ4xdHZVnnKHsCs8NfPbPBawW5f5wxp
         xCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795013706; x=1795618506;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZX4Tc9pKlVjlrSyxFFdrOMyFXuw2xFF1ee9Bb77E7pc=;
        b=SL3VcZaHD5XpyFyUNBiFerEExPJX0wFW7ZHdJ9sfMUsWnS9NUHQDgbe8K14UJiXpJJ
         G3BgQFxUfTUjAEGOqWhl/Q3CqMH6nWuD+7cdfJEazk0rDS41BSPSWJL7QTUBA+MmFw8a
         l6VhVSUWouU70CtRXCs1r6qsfIL76WHm8xNJ0gB+bloMGLbVcxo6sgyPz3Emwlo8qYMr
         ujVAmPasP1plzzflOweocAZPAFqPwu0XQ5DpKyQKv7ZX9N/RzmHKJshYF/85gMVUT+G4
         AdX/kagp70nwF0Vr8B+nR8K2zBuYcTTwUROt8rAMy4UCddbxAV3cRyVn5eE/sNV9SgZQ
         cjtA==
X-Forwarded-Encrypted: i=1; AL+hErF/l2O3DrxYfRd+OCQo72GeK4Svhyw1a1bnRGppDRnzMBJT+ZU9rJj+cx8LjUdZS7G7p99v9SXrqSc=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+d+4YLpFKGloQbMneQuQmDNHUe1jzCzxy8VY90P+/vroU6HEze
	DtBa9ygcOiVHTMMAQ592sui7e+iTpwRbCRaZQXU43/3DXzILvvOcGkiwjoGexyVJhw==
X-Gm-Gg: AYBFou3/9T/6T2nlRsBatV3RkCmzTeEaKkcMdyXzWCqBc+gxRnPNDtQjU3dR4CuhwoV
	5k+7FlKYeQ1wxkhQK906VfaeGgNn001kFAYwJ+wU5m8E23DSFZakJw7UumOLRhKWB5bDI1Vy4zb
	oYCPMBMFST1GD5fKzZqmweEbQ+Lo0PFprXmz6vT5gYqiiDzkTZv8Zx3gNgtmbAhuSEx4Xe+X2+g
	JOyNSYD1iENkR+vjoO8pBedeYdMXtz/jByrEWDQjilq+bKA3MO9/TKuHmiiaBIOltHnztYcSD1q
	TfFuWfz2BZKTlxg1AlbAM+2HxpEjQ5n22gw82ODywz5pkI91lFQMJYWofqgeGb+QzxQfVkU2QWh
	gCFTGjTJ2Zqtg5Es5gHxaOQcmHIunq7DmAjBdsmDBY4UOZFGKLvxSIuJvOrkqipKIJXDqlHxJ5s
	chzZPFlGYnbPqot0NkD4MHU5rcBBstMlzCft3jHVWORqKGsXvixDn7l+EpgU/6r4yLkBW4lNyL/
	CEh0Bz/s2ghDlBQF0XUGfPHVmPKtOrf1tlNqoJGJkLUSFjDnDabpHSB1YFxIBpukeYA/3aSccnM
	P/+IQa4zXAwf2KUCw+RN4aUeS/TXv+aaJITS+93EkuwoWUSNJrNKCm3dOF0nrlAOpJ24hbwAYiv
	va4+VBsIDzXZf45An
X-Received: by 2002:a05:600c:a54:b0:4bb:5fd1:92aa with SMTP id 5b1f17b1804b1-4bb7da30033mr53526135e9.15.1795013705767;
        Wed, 18 Nov 2026 06:55:05 -0800 (PST)
Message-ID: <ecedb5b8-96c8-4708-8007-d5333fa590aa@suse.com>
Date: Wed, 18 Nov 2026 15:55:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] x86/EFI: replace ebmalloc()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <640c0ea5-fbbf-436d-b150-4537cbe98fdf@suse.com>
 <2d45d102-e26f-4e93-a213-b02fb685b6ef@suse.com>
 <c31e3a82-ea24-4985-8410-9cda5a9c9681@citrix.com>
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
In-Reply-To: <c31e3a82-ea24-4985-8410-9cda5a9c9681@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1795013706-502F0CFC-42DB1F80/10/78276251493
X-purgate-type: spam
X-purgate-size: 5481
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.11.2026 19:13, Andrew Cooper wrote:
> On 03/11/2026 12:50 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/include/asm/setup.h
>> +++ b/xen/arch/x86/include/asm/setup.h
>> @@ -9,6 +9,8 @@ extern const char __2M_rodata_start[], _
>>  extern char __2M_init_start[], __2M_init_end[];
>>  extern char __2M_rwdata_start[], __2M_rwdata_end[];
>>  
>> +extern unsigned long brk_end;
>> +
>>  extern unsigned long xenheap_initial_phys_start;
>>  extern uint64_t boot_tsc_stamp;
>>  
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1,6 +1,7 @@
>>  #include <xen/acpi.h>
>>  #include <xen/alternative-call.h>
>>  #include <xen/bitops.h>
>> +#include <xen/brk.h>
>>  #include <xen/console.h>
>>  #include <xen/cpu.h>
>>  #include <xen/cpuidle.h>
>> @@ -164,6 +165,8 @@ cpumask_t __read_mostly cpu_present_map;
>>  
>>  unsigned long __read_mostly xen_phys_start;
>>  
>> +unsigned long __ro_after_init brk_end;
>> +
> 
> I know it's only x86 which uses brk_end right now, but given uses such
> as ...
> 
> 
>>  /* Only used in asm code and within this source file */
>>  char asmlinkage __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
>>      cpu0_stack[STACK_SIZE];
>> @@ -1157,7 +1160,6 @@ void asmlinkage __init noreturn __start_
>>      struct boot_info *bi;
>>      unsigned long raw_max_page;
>>      int i, j, bytes = 0;
>> -    unsigned long eb_start, eb_end;
>>      bool acpi_boot_table_init_done = false, relocated = false;
>>      bool vm_init_done = false;
>>      int ret;
>> @@ -1523,7 +1525,7 @@ void asmlinkage __init noreturn __start_
>>          /*
>>           * This needs to remain in sync with remove_xen_ranges() and the
>>           * respective reserve_e820_ram() invocation below. No need to
>> -         * query efi_boot_mem_unused() here, though.
>> +         * query brk_cease() here, though.
>>           */
>>          xen->start = virt_to_maddr(_stext);
>>          xen->size  = __2M_rwdata_end - _stext;
>> @@ -1667,20 +1669,12 @@ void asmlinkage __init noreturn __start_
>>      if ( !xen_phys_start )
>>          panic("Not enough memory to relocate Xen\n");
>>  
>> -    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
>> -    if ( using_2M_mapping() )
>> -        efi_boot_mem_unused(NULL, NULL);
>> -
>>      /* This needs to remain in sync with remove_xen_ranges(). */
>> -    if ( efi_boot_mem_unused(&eb_start, &eb_end) )
>> -    {
>> -        if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start)) ||
>> -             !reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end)) )
>> -            panic("Failed to reserve Xen in E820\n");
>> -    }
>> -    else
>> -        if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end)) )
>> -            panic("Failed to reserve Xen in E820\n");
>> +    brk_end = brk_cease();
>> +    if ( using_2M_mapping() )
>> +        brk_end = PAGE_ALIGN_2M(brk_end);
>> +    if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(brk_end)) )
>> +        panic("Failed to reserve Xen in E820\n");
>>  
>>      /* Late kexec reservation (dynamic start address). */
>>      kexec_reserve_area();
>> @@ -2274,7 +2268,6 @@ __initcall(init_xen_cap_info);
>>  
>>  int __hwdom_init remove_xen_ranges(struct rangeset *r)
>>  {
>> -    paddr_t start, end;
>>      int rc;
>>  
>>      /* S3 resume code (and other real mode trampoline code) */
>> @@ -2296,26 +2289,10 @@ int __hwdom_init remove_xen_ranges(struc
>>          return rc;
>>  
>>      /* hypervisor .data + .bss */
>> -    if ( efi_boot_mem_unused(&start, &end) )
>> -    {
>> -        ASSERT(__pa(start) >= __pa(&__2M_rwdata_start));
>> -        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
>> -                                   PFN_DOWN(__pa(start) - 1));
>> -        if ( rc )
>> -            return rc;
>> -        ASSERT(__pa(end) <= __pa(&__2M_rwdata_end));
>> -        rc = rangeset_remove_range(r, PFN_DOWN(__pa(end)),
>> -                                   PFN_DOWN(__pa(&__2M_rwdata_end) - 1));
>> -        if ( rc )
>> -            return rc;
>> -    }
>> -    else
>> -    {
>> -        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
>> -                                   PFN_DOWN(__pa(&__2M_rwdata_end) - 1));
>> -        if ( rc )
>> -            return rc;
>> -    }
>> +    rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
>> +                               PFN_DOWN(__pa(brk_end) - 1));
>> +    if ( rc )
>> +        return rc;
> 
> ... this, it clearly needs to be common in order for other architectures
> to start using the allocator.
> 
> So, I think the variable ought to be in xen/brk.h and common/brk.c, and
> with that, brk_cease() can lose the return value.

common/brk.c is built into brk.init.o, which means it may not have any
__ro_after_init objects. Where else do you suggest to put the variable
then? Or do you suggest to not make it an init-only object?

> I know that's yet another change to both patches 1 and 2.  If you're
> happy with this suggestion then consider both Reviewed-by: Andrew Cooper
> <andrew.cooper3@citrix.com> in light of those changes.

Plus moving the decl affects users of is_xenheap_fixed_mfn(), which now
need to include xen/brk.h just for this x86 detail. Its prior placement
happened to fit all present users.

Jan

