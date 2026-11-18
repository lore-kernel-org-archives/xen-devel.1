Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEFB606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 10:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YFqZb14w
Received: from list by lists.xenproject.org with outflank-mailman.1494171.1693813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTcTB-0000Lg-P8; Wed, 18 Nov 2026 10:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494171.1693813; Wed, 18 Nov 2026 10:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTcTB-0000LZ-MI; Wed, 18 Nov 2026 10:00:49 +0000
Received: by outflank-mailman (input) for mailman id 1494171;
 Wed, 18 Nov 2026 10:00:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTcT9-0000LS-RQ
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 10:00:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTcT8-001iYh-Ji
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 11:00:46 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd7746-e002-0a2a0a5209dd-0a2a4501dbd4-34
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:00:46 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd774e-5bcc-0a2a45010019-d155802fcdd5-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:00:46 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4bb64ef5a14so7911115e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 02:00:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a6560961cfsm3820184f8f.39.2026.11.18.02.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 02:00:44 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794996046; x=1795600846; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VcSKDImLn/593uWW6YppiQI6jKLkcD+TeMoc2gYKcKA=;
        b=YFqZb14wg9lLeeYpB4dR8j/o+qXMhbTkdogYa34y/hRWdwULZxSmV1xIc8rhMxy7KB
         TgA01uhVpD5IkT+ioQLZwasvl1QVxQEBTBQrdD03kVsRq+rtUQACN5cvmROlyzgIDZBH
         XgBsMbb8Gc/SqbTYjFRY+z1w1b3uUcWqwObXIHlJ/+dzKCG1S/Fhx6WSForaK9XVA6gw
         DaAbmOrwjycRtQCUBjlDhSFibzwVj5krfPaiAlzkfspiK22bWwxZ93xkWod9ZKx6BIOk
         3SH6ofIq1FqiCHjsKQgwfXLpuvbuP/igaGz2Obu0qn9zLADlf6bUpET0sORVJGnFK1mu
         LbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996046; x=1795600846;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VcSKDImLn/593uWW6YppiQI6jKLkcD+TeMoc2gYKcKA=;
        b=Oy6/VAnN3/8QOZtynraT3re8lh4XLBxP2vWKvpG6g1eaIaGCxEcfZlcDgB/+Ypg8+L
         mEOASUMupM5Zn2DZ9rOK6kwhSzPdMnGIgJ0IZHUUnd22V/ctTn7SmY4PH3oxlJOTM/SQ
         cV7WBDF5aEItRXtXVLsMCbvQZOEo0kIZED7omKCoVVqfAbOsbBMm/hCABjGxKjKHdTwV
         qE8YyT/7TldvfekzMZLeJq1bxugulArUjxivlG/6wqJBpADRcTGx6xSKU08jPdnvuwK6
         f+y0s8pA59yT+LO6jrAfnvqVxI+azsbX5JA3Yuv7W77NgEORTM1ndN3Gkjfsn0dst8xc
         /7zA==
X-Forwarded-Encrypted: i=1; AL+hErGH2G35WDL+/pV+8rETNp2siLjM5KuibTASjZqydFBz28h/hB/RttaiBWw75lLhKsoHi+ZqW13Rrdg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z88vCIBRjAJ2wnd+a+YU0k307/Cd0W/wm9IT0uLoJse/MdmB8vt
	DGTkQ1UtvOOEONWdBFmv3uERFoH/8faCbzfOfUVDSfcd7unen/C3MENFnCTA5omkyqiCdcY/UWF
	7siz42Q==
X-Gm-Gg: AYBFou0nmauafHR62yIegImKiZnlBPw2Am1tQhyHm3MDLVkMACdXjdsaMJm5zbKcMSA
	EJUOPVxXKlLZjH4Wgtn6wFjTvRj92vFbRfHtPTbkCG0mLvo+gQuzp9RkX60qbUNfcqXSnuuZxEd
	l3bLiu7YrlZcsDVBMuhlNEx3/NocSUMXDlT7xAXodYAGqPNkGWgtOzSv1wIylgHdSgROlqSHuag
	FogSjrGUZJCgvGucQEZChnK7N7hXbLr7lH++ZLjWWqXFR/TeTYlEDNgX14Qp/lELXwdkwtZDa/+
	WZRmm1+a7iaPxRMNohRq9z5vhfUsBtdWwVEzzp3LGV4ylXtnLh1Ju8/PlAI0WO3AnuIRijMoF3Y
	I3/t00/1kUzAJqe+xyTq3metZvbMvRhrzlQ7UlXMqC+y/ie5WcOzqea2GcT5pIEpamDNjH7g7Eb
	IbnV5sI0PZZKhbmT9GZGNoRS8CC9Sowy8nPVBYHd8lu5oIa+Na+rS9v9urM5wVHcakTAFWUu9QI
	XLV38cqO7zdxR4xW773COg+nAmAI7nonx30KqR/ige/FjuM/937RP+BgJm4odSxR6ZY8bLnqLqP
	yM3C2IxU9vRZvnpWQK89a9CRiGtJovxPoGFnNV5CSNuWteQ6Qgv9rec9qqy2CG6HjseMBsi4S/q
	9201v+BrIdhUQ1YKwHA==
X-Received: by 2002:a05:600c:46d0:b0:4bb:69b3:2b42 with SMTP id 5b1f17b1804b1-4bb7da23d03mr39628935e9.16.1794996045766;
        Wed, 18 Nov 2026 02:00:45 -0800 (PST)
Message-ID: <4e005a73-7690-4b83-8215-ece5ed17582c@suse.com>
Date: Wed, 18 Nov 2026 11:00:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] x86/EFI: replace ebmalloc()
From: Jan Beulich <jbeulich@suse.com>
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
Content-Language: en-US
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
In-Reply-To: <a9186c61-c21e-48b1-9fd4-ce2625ac1a83@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1794996046-BE8D15FD-F9D2A800/10/78276251493
X-purgate-type: spam
X-purgate-size: 6137
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 08:37, Jan Beulich wrote:
> On 16.11.2026 19:13, Andrew Cooper wrote:
>> On 03/11/2026 12:50 pm, Jan Beulich wrote:
>>> --- a/xen/arch/x86/include/asm/setup.h
>>> +++ b/xen/arch/x86/include/asm/setup.h
>>> @@ -9,6 +9,8 @@ extern const char __2M_rodata_start[], _
>>>  extern char __2M_init_start[], __2M_init_end[];
>>>  extern char __2M_rwdata_start[], __2M_rwdata_end[];
>>>  
>>> +extern unsigned long brk_end;
>>> +
>>>  extern unsigned long xenheap_initial_phys_start;
>>>  extern uint64_t boot_tsc_stamp;
>>>  
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -1,6 +1,7 @@
>>>  #include <xen/acpi.h>
>>>  #include <xen/alternative-call.h>
>>>  #include <xen/bitops.h>
>>> +#include <xen/brk.h>
>>>  #include <xen/console.h>
>>>  #include <xen/cpu.h>
>>>  #include <xen/cpuidle.h>
>>> @@ -164,6 +165,8 @@ cpumask_t __read_mostly cpu_present_map;
>>>  
>>>  unsigned long __read_mostly xen_phys_start;
>>>  
>>> +unsigned long __ro_after_init brk_end;
>>> +
>>
>> I know it's only x86 which uses brk_end right now, but given uses such
>> as ...
>>
>>
>>>  /* Only used in asm code and within this source file */
>>>  char asmlinkage __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
>>>      cpu0_stack[STACK_SIZE];
>>> @@ -1157,7 +1160,6 @@ void asmlinkage __init noreturn __start_
>>>      struct boot_info *bi;
>>>      unsigned long raw_max_page;
>>>      int i, j, bytes = 0;
>>> -    unsigned long eb_start, eb_end;
>>>      bool acpi_boot_table_init_done = false, relocated = false;
>>>      bool vm_init_done = false;
>>>      int ret;
>>> @@ -1523,7 +1525,7 @@ void asmlinkage __init noreturn __start_
>>>          /*
>>>           * This needs to remain in sync with remove_xen_ranges() and the
>>>           * respective reserve_e820_ram() invocation below. No need to
>>> -         * query efi_boot_mem_unused() here, though.
>>> +         * query brk_cease() here, though.
>>>           */
>>>          xen->start = virt_to_maddr(_stext);
>>>          xen->size  = __2M_rwdata_end - _stext;
>>> @@ -1667,20 +1669,12 @@ void asmlinkage __init noreturn __start_
>>>      if ( !xen_phys_start )
>>>          panic("Not enough memory to relocate Xen\n");
>>>  
>>> -    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
>>> -    if ( using_2M_mapping() )
>>> -        efi_boot_mem_unused(NULL, NULL);
>>> -
>>>      /* This needs to remain in sync with remove_xen_ranges(). */
>>> -    if ( efi_boot_mem_unused(&eb_start, &eb_end) )
>>> -    {
>>> -        if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start)) ||
>>> -             !reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end)) )
>>> -            panic("Failed to reserve Xen in E820\n");
>>> -    }
>>> -    else
>>> -        if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end)) )
>>> -            panic("Failed to reserve Xen in E820\n");
>>> +    brk_end = brk_cease();
>>> +    if ( using_2M_mapping() )
>>> +        brk_end = PAGE_ALIGN_2M(brk_end);
>>> +    if ( !reserve_e820_ram(&boot_e820, __pa(_stext), __pa(brk_end)) )
>>> +        panic("Failed to reserve Xen in E820\n");
>>>  
>>>      /* Late kexec reservation (dynamic start address). */
>>>      kexec_reserve_area();
>>> @@ -2274,7 +2268,6 @@ __initcall(init_xen_cap_info);
>>>  
>>>  int __hwdom_init remove_xen_ranges(struct rangeset *r)
>>>  {
>>> -    paddr_t start, end;
>>>      int rc;
>>>  
>>>      /* S3 resume code (and other real mode trampoline code) */
>>> @@ -2296,26 +2289,10 @@ int __hwdom_init remove_xen_ranges(struc
>>>          return rc;
>>>  
>>>      /* hypervisor .data + .bss */
>>> -    if ( efi_boot_mem_unused(&start, &end) )
>>> -    {
>>> -        ASSERT(__pa(start) >= __pa(&__2M_rwdata_start));
>>> -        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
>>> -                                   PFN_DOWN(__pa(start) - 1));
>>> -        if ( rc )
>>> -            return rc;
>>> -        ASSERT(__pa(end) <= __pa(&__2M_rwdata_end));
>>> -        rc = rangeset_remove_range(r, PFN_DOWN(__pa(end)),
>>> -                                   PFN_DOWN(__pa(&__2M_rwdata_end) - 1));
>>> -        if ( rc )
>>> -            return rc;
>>> -    }
>>> -    else
>>> -    {
>>> -        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
>>> -                                   PFN_DOWN(__pa(&__2M_rwdata_end) - 1));
>>> -        if ( rc )
>>> -            return rc;
>>> -    }
>>> +    rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
>>> +                               PFN_DOWN(__pa(brk_end) - 1));
>>> +    if ( rc )
>>> +        return rc;
>>
>> ... this, it clearly needs to be common in order for other architectures
>> to start using the allocator.
> 
> I don't see why this would necessarily be this way. This is x86-specific
> memory management, and other ports may have no need. I'd therefore prefer
> to leave brk_end x86-only until proven otherwise. It was, after all, a
> deliberate decision to make this x86-only.
> 
>> So, I think the variable ought to be in xen/brk.h and common/brk.c, and
>> with that, brk_cease() can lose the return value.
>>
>> I know that's yet another change to both patches 1 and 2.  If you're
>> happy with this suggestion then consider both Reviewed-by: Andrew Cooper
>> <andrew.cooper3@citrix.com> in light of those changes.
> 
> I'd prefer to commit patch 1 as is. Strictly speaking patches 2 and 3 can
> go in on top with Marek's R-b. As it's not clear whether your reply here
> is an objection to this patch, I'll go with just patches 1 and 3 for now.
> If need be, the adjustment you describe could easily be done by a small
> independent prep patch for the one here, or perhaps also right in this
> patch (yet as said, I'd prefer to keep things as-are).

To add to this: With a bit better isolation/abstraction, brk_end could
actually be static in setup.c. Which (to me) also speaks against making
it a common var.

Jan

