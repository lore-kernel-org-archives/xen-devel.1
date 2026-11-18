Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABDC606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=d8ZWUzwJ
Received: from list by lists.xenproject.org with outflank-mailman.1494637.1694044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTgjv-0004Fx-S9; Wed, 18 Nov 2026 14:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494637.1694044; Wed, 18 Nov 2026 14:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTgjv-0004Fq-OL; Wed, 18 Nov 2026 14:34:23 +0000
Received: by outflank-mailman (input) for mailman id 1494637;
 Wed, 18 Nov 2026 14:34:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTgjt-0004Fj-Tn
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 14:34:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTgjt-001cfV-A1
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 15:34:21 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdb76d-8faa-0a2a0a5109dd-0a2a450983dc-0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 15:34:21 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdb76c-be1a-0a2a45090019-d155dd2ca8b1-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 15:34:21 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4a5024b3c28so929851f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 06:34:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a650d2e26csm5079041f8f.4.2026.11.18.06.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 06:34:20 -0800 (PST)
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
        d=suse.com; s=google; t=1795012460; x=1795617260; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZUzZ4v0wfyJku+72doFy04B9mkTDav3uBQamR49sHo=;
        b=d8ZWUzwJ0jvZh3sUTdwnPt/M1OHpBBiow0ePYvmtaAfmh3wlhst5QYpX8wbCQT6vSC
         pNc6y7bPbWwzBHuzhP5miyaGM2a7ywUI1MNwiDJb27bxLLDcmZR5vRQ6zIfnoHyBqJ7U
         zmteW3BawBQ4DDZcCHj5jRvNzSXl6NQKblNvlcOus1+PnP7ONb0Im4/sAQOY/fkwM6p/
         FDqrCm3YkgFf92XbxVie6Y0vwuttMIBAgTJqm3PnZrWd6Lt01Ig+ohrZIDMnuRXEGeXJ
         UJ6H05uCQTl5di8ODr15AB+BA6N2jjm6pR8lvHe2JZyEBYQ5OXh7gkDayw3AWKpu+/eB
         5l5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012460; x=1795617260;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZUzZ4v0wfyJku+72doFy04B9mkTDav3uBQamR49sHo=;
        b=tRxG9Z9S6j9/QnY+yn4JCHvvr3Pn6P5BFTOCoPfH4jxHFb08FQLZNAyFMSegtI4QBu
         xgKhnZZi5yFS4U6a71hboP6Wy4NIDpbHhEI2bBEBxKLzV8l8vXTiFC/GCXYRYOLDUh/s
         ENVSCyfhb7Ai3Xr6QqXlMha+30XwuOyDgl9xHsKWqSwxo3hfPi3ublgS0W64DklqednD
         Q12ghsPQi5zBj+PVo30ry0XAjAqQwhR+X65v+cO+OivKSP7ALlgd1gL3G3X00PKSs0vn
         Fcu29BmB9cd1fAhu2daZZxxL9RJYRpdW5CS2DleUZZ5MkuscRjoEot16pXUfbJKpdnvr
         wJQQ==
X-Forwarded-Encrypted: i=1; AL+hErFSfIz50qZPA4r8QCvnFIe+HG7+iyZ8BuabZQgDPsA+0UXSbZ6rIelcvbH276eXUthLX1+bjk35wWA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9FUzuimREFcNVxMQYzAuGAFa9xjxGRa8lswN6+nEN5guT6RV4R
	dZo8mYFnhXS1XqdXlBZrbIRGM6XNgA6TYmK5U6CfCiBGt470nhNSyqXQduMY45rieA==
X-Gm-Gg: AZFdTZcKH/VPE6EATUUbF53G7PLOYovv3RvB08Dd4KRh9MBL8WswljaqEJ0O3+6Of6b
	GTTBt3eWcXKmdN9/zz8Dlvz3qyTk7wXwHlJApDaxcwCkW+i5kxr6oocSK17L/t7dcIAv4Io6J58
	MKdaOCV7Bm7wiw+VXoClk4RzgU8331xeXX8dl4cPoHH4fntQl2uE7NtmY3+Ux4tM6NkYRu1ApZj
	lD88WM26CVSyWvWW/sUtjuwh88/bCksWOJv9wbAkL/uupaNFIjO2YZv0g9ZTJ8ZEQoiHoxFJl9E
	V1IhOLVcZd3EJ/WjD2Pw/S5UPY2WD36PQ8cyNXs5ni01RQpA5UW/NIQfu/yLrNT6Ma3Nws7OP5A
	wjNcxrgqqJogB/A8zvpc9Zza1ntwXzcMp6FNIeJvsVXhn1cNmFLG+E7Mne7ykHEZKDDfamtrqTQ
	Ay9FzNHtHV2NcWQZWXlAs5n9iCt6PAiRTWFdlKyjXFBSgfG5UnzkI6j6WZo4IxKc2E6Dea+QQK5
	JqNb1Gg2klISNg82mxRFArNkTdcRPdnw9lxiF02NPz9+j909ag3giCWdsGN5FteEcy2kffza0UC
	M4+v/VERZibmN2DQqJZ1QGpcjBzGyvPVdycdqg+gr6ndlxX9ln4vE6xV0FV6ZlcFkBPiHgn+FXp
	R1ou65Zpb8zbFt0FcCvsLcWrpWS6zIUky1EcT4Q0=
X-Received: by 2002:a05:6000:29c8:b0:4a3:c963:c1c3 with SMTP id ffacd0b85a97d-4a63937fce8mr3896158f8f.15.1795012460435;
        Wed, 18 Nov 2026 06:34:20 -0800 (PST)
Message-ID: <1efd2790-912a-495a-9fa2-ff77e0baff82@suse.com>
Date: Wed, 18 Nov 2026 15:34:19 +0100
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
 <a9186c61-c21e-48b1-9fd4-ce2625ac1a83@suse.com>
 <802b448e-e772-4e6a-9442-b44a99d9b00b@citrix.com>
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
In-Reply-To: <802b448e-e772-4e6a-9442-b44a99d9b00b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1795012461-FCC15034-7FF0D491/10/78276251493
X-purgate-type: spam
X-purgate-size: 6431
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 14:26, Andrew Cooper wrote:
> On 17/11/2026 7:37 am, Jan Beulich wrote:
>> On 16.11.2026 19:13, Andrew Cooper wrote:
>>> On 03/11/2026 12:50 pm, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/include/asm/setup.h
>>>> +++ b/xen/arch/x86/include/asm/setup.h
>>>> @@ -9,6 +9,8 @@ extern const char __2M_rodata_start[], _
>>>>  extern char __2M_init_start[], __2M_init_end[];
>>>>  extern char __2M_rwdata_start[], __2M_rwdata_end[];
>>>>  
>>>> +extern unsigned long brk_end;
>>>> +
>>>>  extern unsigned long xenheap_initial_phys_start;
>>>>  extern uint64_t boot_tsc_stamp;
>>>>  
>>>> --- a/xen/arch/x86/setup.c
>>>> +++ b/xen/arch/x86/setup.c
>>>> @@ -1,6 +1,7 @@
>>>>  #include <xen/acpi.h>
>>>>  #include <xen/alternative-call.h>
>>>>  #include <xen/bitops.h>
>>>> +#include <xen/brk.h>
>>>>  #include <xen/console.h>
>>>>  #include <xen/cpu.h>
>>>>  #include <xen/cpuidle.h>
>>>> @@ -164,6 +165,8 @@ cpumask_t __read_mostly cpu_present_map;
>>>>  
>>>>  unsigned long __read_mostly xen_phys_start;
>>>>  
>>>> +unsigned long __ro_after_init brk_end;
>>>> +
>>> I know it's only x86 which uses brk_end right now, but given uses such
>>> as ...
>>>
>>>
>>>>  /* Only used in asm code and within this source file */
>>>>  char asmlinkage __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
>>>>      cpu0_stack[STACK_SIZE];
>>>> @@ -1157,7 +1160,6 @@ void asmlinkage __init noreturn __start_
>>>>      struct boot_info *bi;
>>>>      unsigned long raw_max_page;
>>>>      int i, j, bytes = 0;
>>>> -    unsigned long eb_start, eb_end;
>>>>      bool acpi_boot_table_init_done = false, relocated = false;
>>>>      bool vm_init_done = false;
>>>>      int ret;
>>>> @@ -1523,7 +1525,7 @@ void asmlinkage __init noreturn __start_
>>>>          /*
>>>>           * This needs to remain in sync with remove_xen_ranges() and the
>>>>           * respective reserve_e820_ram() invocation below. No need to
>>>> -         * query efi_boot_mem_unused() here, though.
>>>> +         * query brk_cease() here, though.
>>>>           */
>>>>          xen->start = virt_to_maddr(_stext);
>>>>          xen->size  = __2M_rwdata_end - _stext;
>>>> @@ -1667,20 +1669,12 @@ void asmlinkage __init noreturn __start_
>>>>      if ( !xen_phys_start )
>>>>          panic("Not enough memory to relocate Xen\n");
>>>>  
>>>> -    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
>>>> -    if ( using_2M_mapping() )
>>>> -        efi_boot_mem_unused(NULL, NULL);
>>>> -
>>>>      /* This needs to remain in sync with remove_xen_ranges(). */
>>>> -    if ( efi_boot_mem_unused(&eb_start, &eb_end) )
>>>> -    {
>>>> -        if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start)) ||
>>>> -             !reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end)) )
>>>> -            panic("Failed to reserve Xen in E820\n");
>>>> -    }
>>>> -    else
>>>> -        if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end)) )
>>>> -            panic("Failed to reserve Xen in E820\n");
>>>> +    brk_end = brk_cease();
>>>> +    if ( using_2M_mapping() )
>>>> +        brk_end = PAGE_ALIGN_2M(brk_end);
>>>> +    if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(brk_end)) )
>>>> +        panic("Failed to reserve Xen in E820\n");
>>>>  
>>>>      /* Late kexec reservation (dynamic start address). */
>>>>      kexec_reserve_area();
>>>> @@ -2274,7 +2268,6 @@ __initcall(init_xen_cap_info);
>>>>  
>>>>  int __hwdom_init remove_xen_ranges(struct rangeset *r)
>>>>  {
>>>> -    paddr_t start, end;
>>>>      int rc;
>>>>  
>>>>      /* S3 resume code (and other real mode trampoline code) */
>>>> @@ -2296,26 +2289,10 @@ int __hwdom_init remove_xen_ranges(struc
>>>>          return rc;
>>>>  
>>>>      /* hypervisor .data + .bss */
>>>> -    if ( efi_boot_mem_unused(&start, &end) )
>>>> -    {
>>>> -        ASSERT(__pa(start) >= __pa(&__2M_rwdata_start));
>>>> -        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
>>>> -                                   PFN_DOWN(__pa(start) - 1));
>>>> -        if ( rc )
>>>> -            return rc;
>>>> -        ASSERT(__pa(end) <= __pa(&__2M_rwdata_end));
>>>> -        rc = rangeset_remove_range(r, PFN_DOWN(__pa(end)),
>>>> -                                   PFN_DOWN(__pa(&__2M_rwdata_end) - 1));
>>>> -        if ( rc )
>>>> -            return rc;
>>>> -    }
>>>> -    else
>>>> -    {
>>>> -        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
>>>> -                                   PFN_DOWN(__pa(&__2M_rwdata_end) - 1));
>>>> -        if ( rc )
>>>> -            return rc;
>>>> -    }
>>>> +    rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
>>>> +                               PFN_DOWN(__pa(brk_end) - 1));
>>>> +    if ( rc )
>>>> +        return rc;
>>> ... this, it clearly needs to be common in order for other architectures
>>> to start using the allocator.
>> I don't see why this would necessarily be this way. This is x86-specific
>> memory management, and other ports may have no need. I'd therefore prefer
>> to leave brk_end x86-only until proven otherwise. It was, after all, a
>> deliberate decision to make this x86-only.
> 
> I'm very unconvinced.
> 
> An architecture that doesn't care to reclaim unused space just uses
> plain data/bss objects, which is what happens today.
> 
> An architecture will only care to switch to brk in order to reclaim
> space, and to do so it *must* replace all of it's current end markers
> with brk_end.

Or we want to start using brk_alloc() in common code, without forcing
all ports to deal with the freeing of excess space. They then don't
need to record the return value of brk_cease(), they don't need to
call brk_free_unused(), and they would have no need for any form of
brk_end.

> brk_end will probably only be consumed by arch-specific code, but it's
> produced by common code and therefore it needs to be part of the common
> brk infrastructure.  This also has the important property of preventing
> it from getting named differently in different architectures.

Well, as almost always (no matter that as the patch author I think I
should have some room to choose between options) it's going to be me
to give in. Just to finally get this done.

Jan

