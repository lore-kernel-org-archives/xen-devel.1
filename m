Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97299C55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 14:04:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382197.1625571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrFkR-0005yu-EQ; Tue, 04 Aug 2026 14:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382197.1625571; Tue, 04 Aug 2026 14:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrFkR-0005yn-BL; Tue, 04 Aug 2026 14:04:03 +0000
Received: by outflank-mailman (input) for mailman id 1382197;
 Tue, 04 Aug 2026 14:04:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrFkQ-0005yh-A7
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 14:04:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrFkP-001Ss4-Mw
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 16:04:01 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a71f133-e002-0a2a0a5209dd-0a2a4504ce8e-24
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 16:04:01 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a71f151-b57f-0a2a45040019-d1558029a5ee-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 16:04:01 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-495437bb891so9046985e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 07:04:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b4bdc7sm199977865e9.0.2026.08.04.07.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 07:04:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785852241; x=1786457041; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AK/eiZ5xlog3jlcYi/mBuAqCNsuak+f8+DnZSCJJgmE=;
        b=AsYxcn3atE77CQUSyAgY7ox4yngG2SLKc026pY1kHAQS9c17bkO+VBdlb2wS+rrkDq
         odpxhq9dWqwq01AZ4+5yxsB3QMyQ7ZDRfnkyWtCbsRRUsVhaoEIltkjW2WvzJ6vj0qL7
         ifmIBMBmHlcblItHz9/kXzL1zfqjuboGJdfAAmIlRWYPtOus2/4Uk6POSJjq+RU1mIkx
         AgsINOt25+hJAGjbnRO5ELOjO7wQ+CRmagI9isFBhPYBpUQxqOBEMogQU4RKGVM9tHTC
         tV11CpIm0UwBkTTjMN0SU16wDvZHQzpPIg3q0a9bpW9Vx4LhFNJe8G27O+7WeA8ma0oh
         6bWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785852241; x=1786457041;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AK/eiZ5xlog3jlcYi/mBuAqCNsuak+f8+DnZSCJJgmE=;
        b=NDmExA5CmsBroUQ7/zXCohYOu2e//n8b2ehmm2TJGia5xHWUnblsuU5/m7SH1htCfC
         E68m7SG7J0yYE6CrtPQC6iz3eKfDQ2Zt7aPicdXjL6G6PRs/bN6JEZczw1tiQWZzMsGt
         W81Cxl8jbGmhwOwl1PHLAb2WF0MAukNDRGhif8uGWD6/UAiffsdheqxOjR/+RSPLELw2
         EYNXrM958exHfGpthSnKZ6TZ2cCQ9vKBkI1aLTHWMWiqcFGukSLOSjITg4tng/r/BrKu
         l5twmYPTuDrW9s5cWCWn09dF5FI9LoHXPnq5pySdoPa455h/2/5KpFYuCTPXCS55Qyg/
         ptiw==
X-Forwarded-Encrypted: i=1; AHgh+RpWpslPWCtnRJJP810r6CtWHShp2P3f2JpLXiC00LTBuqBP8WmfEnWaYdKrJxTFpsAcypqJsEYGPiw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwI1jIThXmv9/sMiXVkoZTO+UqCYnF6QgwoTHRN0GiFfMAmNs2R
	EyrQnxUgR5Vo8a8UAwAbJwRuTfBtoC9Zcy6Kv+TwJ57kOY8GSYpZKdbz4A3tgj3Xuw==
X-Gm-Gg: AR+sD13Fj+lTWadIxO/jwVcIAKOxheX5RRTCBqFBze2scjKHgvIpmpEe93hnd3iApkS
	Q8fWlw3KGj25cuutkzB05iZf6C5ueYPBJBwZmR81MJETIkCFg3gTaN+9ug6tsWKewQdtE1Fg+eY
	/4JlWMPLu1TEiNommKVCtt7pM72RjiyPv+lwp4uPMQqAXOXjaeZIToHACldm7MfmiRvEoNGWkV/
	eUlxEAiD24t9vYM1HE8vrbdKNZjkjqB+GrrB0aMtKPmKIWLtbPS4plzMyp9pZDMNYR1JSsPHiYi
	FevlUINGWj7EJHvecj4AFgWMRqc/yRdFWVmtDq7+jMFDLeZ5pjUe7kUYgSe28tY+o9VD1//EkQz
	PnZUirjJKgauMfWq85dcfNaDmmmxz1RE2ANYanXFeJDPlsVCAIwaK7nC6Qjwa2Yz+bsp8QHc190
	jvuIb54d5o/dPBW1rBKtu5M5aJzuSGUa1nYdrX9F4kOosoCzRRSv1GUNpBF0t575eSPJueijEtU
	fhXDvJxG0NiICwYGc4eP76kiGlAYLxLIMmBdfJL/3cl0fHToF+db0PRXl7RI3g=
X-Received: by 2002:a05:600c:1987:b0:495:69eb:27d3 with SMTP id 5b1f17b1804b1-4994a101e6cmr70831905e9.8.1785852240938;
        Tue, 04 Aug 2026 07:04:00 -0700 (PDT)
Message-ID: <36859779-a6c1-448b-91ae-511ada7260fe@suse.com>
Date: Tue, 4 Aug 2026 16:03:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/EFI: replace ebmalloc()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <31ba7ff2-a42d-44aa-976c-17fbff44a56f@suse.com>
 <98388998-c5c6-4991-8662-2b4bf25188f2@suse.com>
 <2eb924b2-11fd-45be-b933-c6352fb2dfe0@citrix.com>
 <d12a6815-612d-4cf6-af50-8370d1ff4108@suse.com>
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
In-Reply-To: <d12a6815-612d-4cf6-af50-8370d1ff4108@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1785852241-506DAB50-DB12CCA5/0/0
X-purgate-type: clean
X-purgate-size: 3429

On 04.08.2026 16:01, Jan Beulich wrote:
> On 30.07.2026 20:08, Andrew Cooper wrote:
>> On 27/07/2026 11:20 am, Jan Beulich wrote:
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -31,6 +31,7 @@
>>>  #include <asm/alternative.h>
>>>  #include <asm/apic.h>
>>>  #include <asm/bootinfo.h>
>>> +#include <asm/brk.h>
>>>  #include <asm/bzimage.h>
>>>  #include <asm/cpu-policy.h>
>>>  #include <asm/e820.h>
>>> @@ -164,6 +165,8 @@ cpumask_t __read_mostly cpu_present_map;
>>>  
>>>  unsigned long __read_mostly xen_phys_start;
>>>  
>>> +unsigned long __ro_after_init brk_end;
>>> +
>>>  /* Only used in asm code and within this source file */
>>>  char asmlinkage __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
>>>      cpu0_stack[STACK_SIZE];
>>> @@ -1141,7 +1144,6 @@ void asmlinkage __init noreturn __start_
>>>      struct boot_info *bi;
>>>      unsigned long nr_pages, raw_max_page;
>>>      int i, j, bytes = 0;
>>> -    unsigned long eb_start, eb_end;
>>>      bool acpi_boot_table_init_done = false, relocated = false;
>>>      bool vm_init_done = false;
>>>      int ret;
>>> @@ -1511,7 +1513,7 @@ void asmlinkage __init noreturn __start_
>>>          /*
>>>           * This needs to remain in sync with remove_xen_ranges() and the
>>>           * respective reserve_e820_ram() invocation below. No need to
>>> -         * query efi_boot_mem_unused() here, though.
>>> +         * query brk_get_unused_start() here, though.
>>>           */
>>>          xen->start = virt_to_maddr(_stext);
>>>          xen->size  = __2M_rwdata_end - _stext;
>>> @@ -1654,18 +1656,11 @@ void asmlinkage __init noreturn __start_
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
>>> -        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start));
>>> -        reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end));
>>> -    }
>>> -    else
>>> -        reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));
>>> +    brk_end = brk_get_unused_start();
>>> +    if ( using_2M_mapping() )
>>> +        brk_end = PAGE_ALIGN_2M(brk_end);
>>> +    reserve_e820_ram(&boot_e820, __pa(_stext), __pa(brk_end));
>>
>> Hiding brk_end in setup.c like this is quite rude.  I guess it's because
>> you want to have brk.c be brk.init.o, but it really does live with the
>> other brk functions.
> 
> As said in reply to you comments on patch 1 - brk_end is purely an x86
> helper variable. I don't want it to move to common code.
> 
>> Furthermore, having brk_end right from the outset fixes the fact that
>> brk_get_unused_start() is doing things beyond retrieving a value.
>>
>> With brk_end being the real bump pointer the allocator uses,
> 
> Hmm, no - I don't view the variable as fulfilling that purpose.

In fact, to add to this, originally I had a variable of this purpose. It
simply didn't work out nicely, in particular because of the page alignment
which may need enforcing. (Surely it could be done like you say, but I'd
really prefer not to.)

Jan

