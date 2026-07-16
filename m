Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5176BC4450A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 07:14:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363500.1615094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkGId-0003BU-Mt; Thu, 16 Jul 2026 07:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363500.1615094; Thu, 16 Jul 2026 07:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkGId-0003BN-JA; Thu, 16 Jul 2026 07:14:27 +0000
Received: by outflank-mailman (input) for mailman id 1363500;
 Thu, 16 Jul 2026 07:14:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wkGIc-0003BH-4p
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 07:14:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkGIb-00FdtV-Hw
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 09:14:25 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5884cb-e002-0a2a0a5209dd-0a2a4506b9f4-20
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 09:14:25 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5884d1-195a-0a2a45060019-d155802fa42d-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 09:14:25 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-493f6de72faso1799105e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 00:14:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49541e94e7asm38650395e9.12.2026.07.16.00.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 00:14:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1784186065; x=1784790865; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejvHhvCzxGyKF0db2MGBGqhIB1rnZViYfFavT4nZDUY=;
        b=PeoF9Ae8z/EFVkNx+Zi1uxCBPOR4KfV9SMqaxPNlevXPN+ZgJPEwwLUg9aHXwBVKt2
         Nb88AFZ0gttfa9niToqZWR3LP5D3fbX8Y4bT6g/yxN3uH4Klx9is+vJPVdIQhL8WNo5G
         usznIOZ3a2yaOur3Zy0twFyuqIfrIEG2O5QOuEcoc0yboAHI8COw+maOsLrA902yCqmy
         Npf9Cd4np8YeOoXv/MlmQivrS89964QSxUKuimEwKUZQBuMwGvbS9VWbFnhXf0PeBb4z
         9dX/WUaoJa8z/YrpH0L5HU6wAFEM/ntyiZGod1uvPzLbo+fLf93b4RNN4cuUwNqa2ta6
         PZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784186065; x=1784790865;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejvHhvCzxGyKF0db2MGBGqhIB1rnZViYfFavT4nZDUY=;
        b=qSxPe5WV9I6DgXi8e96BMLhXivaQibp2ow4qsSbgHe63f7NyFmk8p57R2enrL3syDM
         EduyhAFpb/r/SY8liIWHqR8ALrb3Wxanol5+hWLmhZD9po4x7OMF19B637WPWzfoyzo4
         LGFntkwEMyHmU4ql6SxQtvqQ6SmWLkljOQ8JLGlOY08kCH1RD+Xr2rrtIt+aj+lNZOAl
         lCDsdcqTL0i/0QvLWw70mYFHqAC4TjF9RebBUyeTX0lIxE8mceV1JL1DXf2RUt4s2F7Z
         12+fYxdHEiYlCHJRzi4D6j3+B9kRQTbE0lmRVDxgBlw0qj3+r+bbOytvc2Tzv9eghyrh
         vuvw==
X-Forwarded-Encrypted: i=1; AHgh+RrJjglky32UemtG3QJFvrGFLlJ0oxg/I84KOzZno6cTeiv4iXMMDLjkPz1S85OssSdb1x7oHh32Iig=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/NvxCqB0/pWnBhgS3WwOJRl2mYzN4BLGCjbI0r899Vxd4zTKz
	vGzbYAkrNrJFPEnP1tnq/eTWodYhSnxxhk+I8ZImi9kiOs+mB5fW15qwdmig+qv0XA==
X-Gm-Gg: AfdE7clpmiXc0KAyAkJp2cf9ZKpuGyS+KbnlaA/MkUkiKTM5TVBmCzaCWUaxGCASPqa
	W3R7uF6yV72ySktsDIoPkMowzy3twCP1gqbT78/KfP9cTJVyPPR5vxknPzMtEj+oEmvn8Lkz6ng
	OPG9kYOdkpBiQOV2Yt3NConStTKMSLjYzQSFo6dtW100IPbgkgCp7HVrYvmXSJdT6DP2YmvoOSF
	XENOOnRlukpCxgtSq9rTFb5g1FxqbIYbfKQPIOzx9vs4xhFkLp1BE4aDfHde4oATL47Q4C1u3j1
	k/hIoW+dM5rfnIJaF4BnkvGKp9+5gVhweG0kmuxR01gC5dtVu0gU8be3bLZMvqXHlsgsNrq0sSd
	AqyoG45ZaJS9AtDlsDTO+jIsHFrcmfSagDMWd5zNXGzubu+f41li8vu0nLSpTmAjZd6lC3fNRA0
	rdRaOToBVKPD1vI7VQlgqIKAINSRJMoiXMo0rqDyeGFZivUoO9SlacSwckud2ha0PfjQ==
X-Received: by 2002:a05:600c:8b78:b0:493:d117:18a8 with SMTP id 5b1f17b1804b1-4954288030fmr12526525e9.9.1784186064690;
        Thu, 16 Jul 2026 00:14:24 -0700 (PDT)
Message-ID: <dcd70818-9e03-43e8-b6a2-eefacfc0b894@suse.com>
Date: Thu, 16 Jul 2026 09:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1.1 1/2] x86emul: drop wrapper C file
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8a3ee9c3-489a-4dbf-b61b-cd078322b786@suse.com>
 <e482f2b5-382c-4fbb-b030-5cdaba362599@suse.com>
 <1784119334.8631fc262581453bbf619ec5b2062170.19f65cc9781000edb5@vates.tech>
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
In-Reply-To: <1784119334.8631fc262581453bbf619ec5b2062170.19f65cc9781000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1784186065-F76C877B-E9160BBA/0/0
X-purgate-type: clean
X-purgate-size: 7262

On 15.07.2026 14:42, Teddy Astie wrote:
> Le 14/07/2026 à 16:00, Jan Beulich a écrit :
>> Move the little bit that's still left in x86/x86_emulate.c into a __XEN__
>> conditional in x86/x86_emulate/x86_emulate.c. Move what are roughly the
>> test/fuzzing harness counterparts from there into the corresponding #else.
>>
>> Interestingly more recent gcc takes issue with three static const arrays
>> which are unused when HVM=n (noticeable in particule in the shim build).
>> Apparently such are diagnosed only when present in the top-level file, but
>> not when living in an #include-d one.
>>
>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> v1.1: Address HVM=n build issues. See
>>        https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2674985992.
>>
>> --- a/tools/tests/x86_emulator/x86-emulate.c
>> +++ b/tools/tests/x86_emulator/x86-emulate.c
>> @@ -3,27 +3,6 @@
>>   #include <errno.h>
>>   #include <sys/mman.h>
>>   
>> -/* See gcc bug 100680, but here don't bother making this version dependent. */
>> -#define gcc11_wrap(x) ({                  \
>> -    unsigned long x_;                     \
>> -    __asm__ ( "" : "=g" (x_) : "0" (x) ); \
>> -    (typeof(x))x_;                        \
>> -})
>> -
>> -#define cpu_has_amd_erratum(nr) 0
>> -#define cpu_has_mpx false
>> -#define read_bndcfgu() 0
>> -#define xstate_set_init(what)
>> -
>> -/* For generic assembly code: use macros to define operation/operand sizes. */
>> -#ifdef __i386__
>> -# define __OS          "l"  /* Operation Suffix */
>> -# define __OP          "e"  /* Operand Prefix */
>> -#else
>> -# define __OS          "q"  /* Operation Suffix */
>> -# define __OP          "r"  /* Operand Prefix */
>> -#endif
>> -
>>   uint32_t mxcsr_mask = 0x0000ffbf;
>>   struct cpu_policy cpu_policy;
>>   
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -69,7 +69,6 @@ obj-y += traps-setup.o
>>   obj-y += traps.o
>>   obj-$(CONFIG_INTEL) += tsx.o
>>   obj-$(CONFIG_VM_EVENT) += vm_event.o
>> -obj-y += x86_emulate.o
>>   obj-y += xstate.o
>>   
>>   ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>> @@ -86,13 +85,6 @@ hostprogs-y += efi/mkreloc
>>   
>>   $(obj)/efi/mkreloc: HOSTCFLAGS += -I$(srctree)/include
>>   
>> -ifneq ($(CONFIG_HVM),y)
>> -$(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
>> -endif
>> -ifeq ($(CONFIG_CONDITION_COVERAGE)$(CONFIG_CC_IS_GCC),yy)
>> -$(obj)/x86_emulate.o: CFLAGS-y += -Wno-error=coverage-too-many-conditions
>> -endif
>> -
>>   efi-y := $(shell if [ ! -r $(objtree)/include/xen/compile.h -o \
>>                         -O $(objtree)/include/xen/compile.h ]; then \
>>                            echo '$(TARGET).efi'; fi) \
>> --- a/xen/arch/x86/x86_emulate.c
>> +++ /dev/null
>> @@ -1,37 +0,0 @@
>> -/******************************************************************************
>> - * x86_emulate.c
>> - *
>> - * Wrapper for generic x86 instruction decoder and emulator.
>> - *
>> - * Copyright (c) 2008, Citrix Systems, Inc.
>> - *
>> - * Authors:
>> - *    Keir Fraser <keir@xen.org>
>> - */
>> -
>> -#include <xen/event.h>
>> -
>> -#include <asm/x86_emulate.h>
>> -#include <asm/processor.h> /* current_cpu_info */
>> -#include <asm/xstate.h>
>> -#include <asm/amd.h> /* cpu_has_amd_erratum() */
>> -
>> -/* Avoid namespace pollution. */
>> -#undef cmpxchg
>> -#undef cpuid
>> -#undef wbinvd
>> -
>> -#define cpu_has_amd_erratum(nr) \
>> -        cpu_has_amd_erratum(&current_cpu_data, AMD_ERRATUM_##nr)
>> -
>> -#include "x86_emulate/x86_emulate.c"
>> -
>> -/*
>> - * Local variables:
>> - * mode: C
>> - * c-file-style: "BSD"
>> - * c-basic-offset: 4
>> - * tab-width: 4
>> - * indent-tabs-mode: nil
>> - * End:
>> - */
>> --- a/xen/arch/x86/x86_emulate/Makefile
>> +++ b/xen/arch/x86/x86_emulate/Makefile
>> @@ -1,3 +1,14 @@
>> +# Put this ahead of the sorted list below, as it takes long to build and hence
>> +# we'd like parallel make to schedule its building early.
>> +obj-y += x86_emulate.o
>> +
>> +ifneq ($(CONFIG_HVM),y)
>> +$(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
>> +endif
>> +ifeq ($(CONFIG_CONDITION_COVERAGE)$(CONFIG_CC_IS_GCC),yy)
>> +$(obj)/x86_emulate.o: CFLAGS-y += -Wno-error=coverage-too-many-conditions
>> +endif
>> +
>>   obj-y += 0f01.o
>>   obj-y += 0fae.o
>>   obj-y += 0fc7.o
>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>> @@ -8,8 +8,52 @@
>>    * Copyright (c) 2005-2007 XenSource Inc.
>>    */
>>   
>> +#ifdef __XEN__
>> +
>> +# include <xen/event.h>
>> +
>> +# include <asm/amd.h> /* cpu_has_amd_erratum() */
>> +# include <asm/processor.h> /* current_cpu_info */
>> +# include <asm/x86_emulate.h>
>> +# include <asm/xstate.h>
>> +
>> +/* Avoid namespace pollution. */
>> +# undef cmpxchg
>> +# undef cpuid
>> +# undef wbinvd
>> +
>> +# define cpu_has_amd_erratum(nr) \
>> +         cpu_has_amd_erratum(&current_cpu_data, AMD_ERRATUM_##nr)
>> +
>> +#else /* !__XEN__ */
>> +
>> +/* See gcc bug 100680, but here don't bother making this version dependent. */
>> +# define gcc11_wrap(x) ({                  \
>> +     unsigned long x_;                     \
>> +     __asm__ ( "" : "=g" (x_) : "0" (x) ); \
>> +     (typeof(x))x_;                        \
>> +})
>> +
>> +# define cpu_has_amd_erratum(nr) 0
>> +# define cpu_has_mpx false
>> +# define read_bndcfgu() 0
>> +# define xstate_set_init(what)
>> +
>> +/* For generic assembly code: use macros to define operation/operand sizes. */
>> +# ifdef __i386__
>> +#  define __OS          "l"  /* Operation Suffix */
>> +#  define __OP          "e"  /* Operand Prefix */
>> +# else
>> +#  define __OS          "q"  /* Operation Suffix */
>> +#  define __OP          "r"  /* Operand Prefix */
>> +# endif
>> +
>> +#endif /* __XEN__ */
>> +
>>   #include "private.h"
>>   
>> +#ifndef X86EMUL_NO_MMX
>> +
>>   /*
>>    * The next two tables are indexed by high opcode extension byte (the one
>>    * that's encoded like an immediate) nibble, with each table element then
>> @@ -45,9 +89,15 @@ static const uint16_t _3dnow_ext_table[1
>>       [0xb] = (1 << 0xb) /* pswapd */,
>>   };
>>   
>> +#endif /* !X86EMUL_NO_MMX */
>> +
>> +#ifndef X86EMUL_NO_SIMD
>> +
>>   /* Shift values between src and dst sizes of pmov{s,z}x{b,w,d}{w,d,q}. */
>>   static const uint8_t pmov_convert_delta[] = { 1, 2, 3, 1, 2, 1 };
>>   
>> +#endif /* !X86EMUL_NO_SIMD */
>> +
>>   static const uint8_t sse_prefix[] = { 0x66, 0xf3, 0xf2 };
>>   
>>   #ifdef __x86_64__
>>
> 
> Reviewed-by: Teddy Astie <teddy.astie@vates.tech>

Thanks. May I ask, though, that you reduce reply context in such cases? Every
reader needs to scroll through the entire original mail just to find the single
line at the bottom. See how others do this, e.g.
https://lists.xen.org/archives/html/xen-devel/2026-07/msg00139.html
https://lists.xen.org/archives/html/xen-devel/2026-06/msg01595.html
https://lists.xen.org/archives/html/xen-devel/2026-06/msg01493.html

Thanks, Jan

