Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A599C44529
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 07:18:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367480.1617221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm4jr-0005UE-RM; Tue, 21 Jul 2026 07:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367480.1617221; Tue, 21 Jul 2026 07:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm4jr-0005U7-Ob; Tue, 21 Jul 2026 07:18:03 +0000
Received: by outflank-mailman (input) for mailman id 1367480;
 Tue, 21 Jul 2026 07:18:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wm4jq-0005U1-DO
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 07:18:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm4jp-00Bc77-B1
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 09:18:01 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f1d20-bab6-0a2a0a5309dd-0a2a450a96d0-42
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:18:01 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f1d28-f2d2-0a2a450a0019-d155802fa572-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 09:18:01 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-495437bb891so37676165e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 00:18:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63e49469sm38134762f8f.7.2026.07.21.00.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 00:17:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1784618280; x=1785223080; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kC7MsGOcZE9ciOq8ZcLifHjHtsVdqYHkmGO7ekhF7o0=;
        b=Quk0dtstxC59+tn3WQ1E3Z/ZBbhsDmBXdHx2zcGbn+5ayWN6jyoaCPU8OLJFqbYEjE
         1b0CwfSysC+TxoY1Z+bDCIw/9NQIkw5a39umF9tZBgaDNGtdkPHjCKJcIko15eC0PXHL
         FIExDJ9d0OGCXrIrVTshp4fPdFCoHyMVvl6EWx5+P1KN7gAnjMnChkF/HfUr9/q92gsJ
         C1MASZ9uryaDi/monNerE/EbCEe/kTo2soHxjRnyGH5PGN8oFf2mVC0xL4cdLmFlU1RC
         2xO948I082o6Jdj5WIhvUXr+xZohXNE6XIrsVTzPof+dAf5B8td8qCgHr+yWMqj7eCRJ
         5iMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784618280; x=1785223080;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kC7MsGOcZE9ciOq8ZcLifHjHtsVdqYHkmGO7ekhF7o0=;
        b=DIIlTEhJunKosnNVBSINI6ZILwYey7KohmCPUZ34voEWA53PQSPaYYoSuWj70CtvI5
         pTK+xfO2lNbJUGQzO6JvSG/ihsbZdvqVRwXtVbJObFKVhobPPiAocqFBqkfTP/SzRnp0
         6xe6OHDiKqJh5nribI9beBzwqEMaAtWJXsPUKKCggALLYUTlshIE75S/8MepSsLqVNgU
         mJnyC7upVG3hLc4DTkdsnURgNuHrEbFCcvY4xtdWaEAC45cz0YnqWS6rekDkE2MTaT+7
         /krvM+5JFyWmt6rwXrNuxym/YhV1wtwu+9I3SvY3E5hibnTeNmCzXrlrxiJJbtBKW+Ch
         169w==
X-Forwarded-Encrypted: i=1; AHgh+RqM0vAgKF/JmNEaBo9wS1roteI7jBxg5LtCZSmzYaGDdGtcGJ6EMMkVrbF2fJ76m8quNylkRZa8XIk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynfzoN1zP6fYK9No1kllBNm4MMK6muKpJaJeYAwKAyId76otjl
	4lwQISv0H1tX3lCSfZ+RaQP37v/UcsAoQGkq9knVnOugHh4vMLGpnbMiY2U6eCvEvQ==
X-Gm-Gg: AfdE7cmMxj65zdgR2FMtwDBM49rRwDFxEpbAK1GaMcoxkPzZ2ua4VfaKvtU/HFUonMA
	2Abs7PPUUe2WRZndxJBi+OGIy0JUq1PzrYDhxEr+DzFih8Aa/OkRPCI/A37X6IWvX+l+iBgNKNm
	tHCX/wZhSQB9rxkh7UYdgiAc/hv5R6VD0l5yzEG1NXzDCWi5BizU8HAEhnveVh6dqkP4fJiUhbG
	HfDv0LXdL6sssiJrj/blfRRx/z2Lv2o4A/AkHOXrqihQHbtVputop9CdmaUnBhMhQDM5Urskye5
	n/uU6UJetSazJuiYTBor0V6/eJTV8B+UDnLDrm0E/NgOhON6ZMUEXfO+pc6/wJZlvZuzaWxsF4c
	qsjSkvVyh39N8qe34Exi7UCFng/UzHXHVShd8VoMahOySaojPsFHTmK5erHp/ARr0i3dBblPiLd
	tO7Flvka8B0diAtCsCEeex5jgO5Tu5Pg8OD2tI6KZLhKjKj42ThooZAaC/svwpv2FE4g==
X-Received: by 2002:a05:600c:1906:b0:495:3bc6:d381 with SMTP id 5b1f17b1804b1-4954affd764mr181176405e9.2.1784618280528;
        Tue, 21 Jul 2026 00:18:00 -0700 (PDT)
Message-ID: <fc46a5b8-ed98-414c-b643-7d1fac53e733@suse.com>
Date: Tue, 21 Jul 2026 09:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] x86/PV: avoid HVM-copying alternatives in PV-only
 code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8e6f5ad5-21e4-4325-96de-e03ba65a1b8d@suse.com>
 <d1a522ac-5b28-4e9b-bc45-d9cc61245662@citrix.com>
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
In-Reply-To: <d1a522ac-5b28-4e9b-bc45-d9cc61245662@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1784618281-5A3DCCFC-08588CE5/0/0
X-purgate-type: clean
X-purgate-size: 9065

On 20.07.2026 22:07, Andrew Cooper wrote:
> On 30/06/2026 2:38 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/include/asm/guest_access.h
>> +++ b/xen/arch/x86/include/asm/guest_access.h
>> @@ -14,11 +14,15 @@
>>  
>>  /* Raw access functions: no type checking. */
>>  #define raw_copy_to_guest(dst, src, len)        \
>> -    (is_hvm_vcpu(current) ?                     \
>> +    ((IS_ENABLED(HVM_ONLY_SOURCE) ||            \
>> +      (!IS_ENABLED(PV_ONLY_SOURCE) &&           \
>> +       is_hvm_vcpu(current))) ?                 \
>>       copy_to_user_hvm((dst), (src), (len)) :    \
>>       copy_to_guest_pv(dst, src, len))
>>  #define raw_copy_from_guest(dst, src, len)      \
>> -    (is_hvm_vcpu(current) ?                     \
>> +    ((IS_ENABLED(HVM_ONLY_SOURCE) ||            \
>> +      (!IS_ENABLED(PV_ONLY_SOURCE) &&           \
>> +       is_hvm_vcpu(current))) ?                 \
>>       copy_from_user_hvm((dst), (src), (len)) :  \
>>       copy_from_guest_pv(dst, src, len))
>>  #define raw_clear_guest(dst,  len)              \
>> @@ -26,11 +30,15 @@
>>       clear_user_hvm((dst), (len)) :             \
>>       clear_guest_pv(dst, len))
>>  #define __raw_copy_to_guest(dst, src, len)      \
>> -    (is_hvm_vcpu(current) ?                     \
>> +    ((IS_ENABLED(HVM_ONLY_SOURCE) ||            \
>> +      (!IS_ENABLED(PV_ONLY_SOURCE) &&           \
>> +       is_hvm_vcpu(current))) ?                 \
>>       copy_to_user_hvm((dst), (src), (len)) :    \
>>       __copy_to_guest_pv(dst, src, len))
>>  #define __raw_copy_from_guest(dst, src, len)    \
>> -    (is_hvm_vcpu(current) ?                     \
>> +    ((IS_ENABLED(HVM_ONLY_SOURCE) ||            \
>> +      (!IS_ENABLED(PV_ONLY_SOURCE) &&           \
>> +       is_hvm_vcpu(current))) ?                 \
>>       copy_from_user_hvm((dst), (src), (len)) :  \
>>       __copy_from_guest_pv(dst, src, len))
> 
> Looking back at my own attempt to do this, which was from August 2024, I
> started by cleaning up this code block as such:
> 
> --- a/xen/arch/x86/include/asm/guest_access.h
> +++ b/xen/arch/x86/include/asm/guest_access.h
> @@ -12,27 +12,33 @@
>  #include <asm/hvm/support.h>
>  #include <asm/hvm/guest_access.h>
>  
> +#define GUEST_ACCESS_HVM is_hvm_vcpu(current)
> +
>  /* Raw access functions: no type checking. */
>  #define raw_copy_to_guest(dst, src, len)        \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_to_user_hvm((dst), (src), (len)) :    \
> -     copy_to_guest_pv(dst, src, len))
> +    (GUEST_ACCESS_HVM                           \
> +     ? copy_to_user_hvm(dst, src, len)          \
> +     : copy_to_guest_pv(dst, src, len))
> +
>  #define raw_copy_from_guest(dst, src, len)      \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_from_user_hvm((dst), (src), (len)) :  \
> -     copy_from_guest_pv(dst, src, len))
> +    (GUEST_ACCESS_HVM                           \
> +     ? copy_from_user_hvm(dst, src, len)        \
> +     : copy_from_guest_pv(dst, src, len))
> +
>  #define raw_clear_guest(dst,  len)              \
> -    (is_hvm_vcpu(current) ?                     \
> -     clear_user_hvm((dst), (len)) :             \
> -     clear_guest_pv(dst, len))
> +    (GUEST_ACCESS_HVM                           \
> +     ? clear_user_hvm(dst, len)                 \
> +     : clear_guest_pv(dst, len))
> +
>  #define __raw_copy_to_guest(dst, src, len)      \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_to_user_hvm((dst), (src), (len)) :    \
> -     __copy_to_guest_pv(dst, src, len))
> +    (GUEST_ACCESS_HVM                           \
> +     ?   copy_to_user_hvm(dst, src, len)        \
> +     : __copy_to_guest_pv(dst, src, len))
> +
>  #define __raw_copy_from_guest(dst, src, len)    \
> -    (is_hvm_vcpu(current) ?                     \
> -     copy_from_user_hvm((dst), (src), (len)) :  \
> -     __copy_from_guest_pv(dst, src, len))
> +    (GUEST_ACCESS_HVM                           \
> +     ?   copy_from_user_hvm(dst, src, len)      \
> +     : __copy_from_guest_pv(dst, src, len))
>  
>  /*
>   * Pre-validate a guest handle.
> 
> 
> 
> so they're all consistent and legible,

Sure, why not. There's one Misra concern though: In my patch I'm
specifically avoiding (naming aside)

#define GUEST_ACCESS_HVM is_hvm_vcpu(current)

in the header, as that then requires #undef elsewhere to override. Misra
wants us to avoid #undef as much as possible. In x86/mm.c this then would
also require the original form to be re-instated. (Yes, I'm not getting
away without #undef either, but it's truly removal of the definition, not
removal to then re-instate the macro with a different expansion.)

Perhaps something like

#define IS_HVM_ACCESS                    \
    (IS_ENABLED(GUEST_ACCESS_HVM) ||     \
     (!IS_ENABLED(GUEST_ACCESS_PV) &&    \
      is_hvm_vcpu(current)))             \

to reduce redundancy in the macros while keeping the property of my patch?

> then extended GUEST_ACCESS_HVM to:
> 
> --- a/xen/arch/x86/include/asm/guest_access.h
> +++ b/xen/arch/x86/include/asm/guest_access.h
> @@ -12,7 +12,12 @@
>  #include <asm/hvm/support.h>
>  #include <asm/hvm/guest_access.h>
>  
> -#define GUEST_ACCESS_HVM is_hvm_vcpu(current)
> +#define GUEST_ACCESS_HVM                        \
> +    (IS_ENABLED(GA_ALWAYS_PV)                   \
> +     ? 0                                        \
> +     : (IS_ENABLED(GA_ALWAYS_HVM)               \
> +        ? 1                                     \
> +        : is_hvm_vcpu(current)))                \
>  
>  /* Raw access functions: no type checking. */
>  #define raw_copy_to_guest(dst, src, len)        \
> 
> 
> 
> to allow ways to force it one way or another.

Sure, perhaps simplified to

#define GUEST_ACCESS_HVM                        \
    (IS_ENABLED(GA_ALWAYS_PV)                   \
     ? false                                    \
     : (IS_ENABLED(GA_ALWAYS_HVM) ||            \
        is_hvm_vcpu(current)))                  \

or something yet closer to what I have in my patch. The conditional
operators aren't overly useful here.

Yet one of the RFC questions remains with this: Is there anywhere we'd
actually be able to use GA_ALWAYS_HVM?

> For forcing it one way or another, while ...
> 
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -3407,6 +3407,9 @@ int new_guest_cr3(mfn_t mfn)
>>  #endif
>>  
>>  #ifdef CONFIG_PV
>> +
>> +#define PV_ONLY_SOURCE 1
>> +
> 
> ... mm.c is certainly complicated, others like ...
> 
>> --- a/xen/arch/x86/pv/callback.c
>> +++ b/xen/arch/x86/pv/callback.c
>> @@ -5,6 +5,8 @@
>>   * hypercall handles and helper functions for guest callback
>>   */
>>  
>> +#define PV_ONLY_SOURCE 1
>> +
>>  #include <xen/event.h>
>>  #include <xen/hypercall.h>
>>  #include <xen/guest_access.h>
>> --- a/xen/arch/x86/pv/descriptor-tables.c
>> +++ b/xen/arch/x86/pv/descriptor-tables.c
>> @@ -8,6 +8,8 @@
>>   * Copyright (c) 2004 Christian Limpach
>>   */
>>  
>> +#define PV_ONLY_SOURCE 1
>> +
>>  #include <xen/guest_access.h>
>>  #include <xen/hypercall.h>
>>  
>> --- a/xen/arch/x86/pv/shim.c
>> +++ b/xen/arch/x86/pv/shim.c
>> @@ -6,6 +6,9 @@
>>   *
>>   * Copyright (c) 2017 Citrix Systems Ltd.
>>   */
>> +
>> +#define PV_ONLY_SOURCE 1
>> +
>>  #include <xen/event.h>
>>  #include <xen/guest_access.h>
>>  #include <xen/hypercall.h>
> 
> all of these could have a general CFLAGS += in arch/x86/pv/Makefile
> rather than having to state it in every file.

A general CFLAGS += is (at least latently / conceptually) wrong in pv/,
as code there may come into play when a PVH Dom0 controls a PV DomU. Much
like a fair bit of care is needed in x86/mm.c (where we may want to try
to move some more code to x86/pv/mm.c).

I did consider this on a per-object basis and meant to put in a remark to
this effect, but then forgot. The issue I see with using this approach is
the disconnect between setting of the control (Makefile) and it being
correct to use for the particular source file (in particular when making
changes down the road). Having the #define near the top of the files has
(imo) at least slightly better chances of being noticed when opening the
file for editing.

> Naming wise, while PV_ONLY_SOURCE works in pv/, it's more dubious in
> arch/x86/mm.c.  GUEST_ACCESS_* at least identifies the property that's
> being decided upon.

I'm happy to see your naming used; I wasn't overly happy with my naming
choice anyway.

Jan

