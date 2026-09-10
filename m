Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29650C79FBF
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 15:20:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414875.1644557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4gZ4-0001ob-NU; Thu, 10 Sep 2026 15:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414875.1644557; Thu, 10 Sep 2026 15:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4gZ4-0001oU-KQ; Thu, 10 Sep 2026 15:19:50 +0000
Received: by outflank-mailman (input) for mailman id 1414875;
 Thu, 10 Sep 2026 15:19:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4gZ3-0001oO-AU
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 15:19:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4gZ2-0018Cw-GK
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 17:19:48 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2ca86-bab6-0a2a0a5309dd-0a2a450aafaa-30
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 17:19:48 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2ca93-f2d2-0a2a450a0019-d1558035cd96-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 17:19:47 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-498028b3d5eso69005205e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 08:19:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26c1bc5fsm80054205e9.3.2026.09.10.08.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 08:19:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1789053587; x=1789658387; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VFGfL608L0tEIsdTQbjBfTAhVuCxwcfL5Ww2FNPtdYc=;
        b=OAxzC/JVhr5bz+9vW7kSQMC4YrbT0XRhDurJTzRqMDaDfaDigwKJn9HOphLv7aF9oD
         uckjE29axLW0M27b/tEcTPlqmOKx8lfEBm+1sEuiM5zUmPeVAbDhvH40X29UaC3kWVPY
         kGichyVD4SJ5iI8IWU/OLp/RMl1O0XtWuNqqo38UXrkPhdwV3WErcMLjZ0GMU/9C5eiK
         LIm4G3oUvIyKBkir+d3nMTo68gKgrSjY/HkGEmqzQVZLpKJ53R2Bvofe2uv5yA7BmY+K
         aFJ6eGTCwWyllzoEa0KwSDElBHh8L5ScPdwqB2uFYzInifOqej2BS/TJagBWWGpAk5uY
         P6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053587; x=1789658387;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VFGfL608L0tEIsdTQbjBfTAhVuCxwcfL5Ww2FNPtdYc=;
        b=PGLpnLQUz5jM5eYC+ACW2W1UcrPKjksviYB7JNPc771SVFBpkffLV6yWouV8r5EcGd
         MwkC1gYvRvm8vllVHUoUjbpFprGRVmbsTEl2StsiWG8QNzbDTsoyclWITONJWzmRLFCQ
         LFE6025nR5YbBELf2yYGvZBg6QSNKb0/t28oZH4Wh6yviEPBweTtAGfpg7eszp2xBqYN
         6mBjbmEcQC1kF3RZpFI/9YAHjcuf3mcTmssfcRZ05tpwDdbmFxjkYZ/SB08LIKnQ3fFq
         3Rkk7+LfLOHoDFE3hzkhlJixLY2i5Ss0vVlxN7wcnAIVttDTsFTFRdsyqIcPhD0MFfJB
         vl8g==
X-Gm-Message-State: AFuF++niNOmmPXBg+eidQ1g7KQEGrBhSAL7cfwN4tDs9lIjH6UEcOrDG
	3qReDVP8B8YXf1rHIvpd/V/Io0zg7Qyoh+oqIUnHD2KIvwW4+f6XT4LHB4rew9mhzA==
X-Gm-Gg: AYBFou1OvA57Gljapb89PRAetlh3A/u6rZ5S4TZyHL55txzqodGCRp7jb4KLm8R9W3K
	tX84+vCX/JpT49ocMqNWsEWhDbJ+a3tXtixURczxB6suUn2PaRIIbeS5Jntorzf/Wk+N7YxRop6
	ZgBCnN+BrZqNLHucYOn4UD/A3pLdCWMzCyTYPbS9XRSjiEZDm3bZc6N/hrp9qwGfh1s5cAVy0/z
	WnUGZld2TsuIiDhmMbmPUrXUHeERTKuHU9TitX793BmlQlRvhW5u+tu+6lAU8kLRKWegaYiCcZN
	tYXutrn2bzVlurbLMIpZSIQmcWeRxFMoq7BhGVCUgHBvupqVPLnBKrrz9lboH39c7x900vaA2G9
	q+Y3wwDNzdtWHtD+L5SS5g86wyHZLwxnNfDBoiXuNqBhiD84Dqys6am9NEPDhFQDdJyvBM6Eoq+
	CLMoCVrCU6iZOlzPaH121EtPdZxQo4PCOGVoIeOsveOMVYmZoLhS1oRC24eH1MZgtGnOjuBcMTM
	XR64Sb5RfPvKVr/nyQQA6zuu0YpBXhAO16pq3fRWmZ8gmbmiogVzHDx/N2+WVDWDm7PgiaunA==
X-Received: by 2002:a05:600c:45d5:b0:49d:2562:d670 with SMTP id 5b1f17b1804b1-49d2562d699mr80028265e9.14.1789053586862;
        Thu, 10 Sep 2026 08:19:46 -0700 (PDT)
Message-ID: <03f026a8-28ad-4d5f-bc0d-e78c1acb50c2@suse.com>
Date: Thu, 10 Sep 2026 17:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/39] xen/riscv: add guest memory read helper
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <b68a29b7ef5b2cb83fde405b3854c94a2f44f4d0.1787838835.git.oleksii.kurochko@gmail.com>
 <1788955499.8631fc262581453bbf619ec5b2062170.1a0860e9b57000c4f3@vates.tech>
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
In-Reply-To: <1788955499.8631fc262581453bbf619ec5b2062170.1a0860e9b57000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1789053587-587CACFC-30E0709D/10/73395122804
X-purgate-type: spam
X-purgate-size: 3324

On 09.09.2026 14:04, Baptiste Le Duc wrote:
>> Introduce riscv_read_guest() to allow Xen to safely read guest memory
>> using HLV/HLVX instructions while reliably capturing trap context.
> 
>> This is required for instruction fetch emulation and MMIO decoding, where
>> Xen must inspect guest memory that may not be directly accessible and may
>> fault.
>>
>> The implementation is based on kvm_riscv_vcpu_unpriv_read() from Linux,
>> with one deviation: the hlv/hlvx instructions translate the guest address
>> through the live vsatp/hgatp CSRs, i.e. through the address space of the
>> currently running vCPU, so the function can only be called safely for
>> current. Instead of taking a struct vcpu argument, it always operates on
>> current directly.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
>> index 8a89212e0b..b2327822ac 100644
>> --- a/xen/arch/riscv/guestcopy.c
>> +++ b/xen/arch/riscv/guestcopy.c
>> @@ -6,6 +6,7 @@
>>  #include <xen/string.h>
>>  
>>  #include <asm/guest_access.h>
>> +#include <asm/traps.h>
>>  
>>  #define COPY_from_guest     0U
>>  #define COPY_to_guest       BIT(0, U)
>> @@ -114,3 +115,89 @@ unsigned long copy_to_guest_phys(struct domain *d, paddr_t gpa, void *buf,
>>      return copy_guest(buf, gpa, len, GPA_INFO(d),
>>                        COPY_to_guest | COPY_gpa);
>>  }
>> +
>> +/*
>> + * Read machine word from guest memory
>> + *
>> + * @guest_addr: Guest address to read
>> + * @read_insn: Flag representing whether we are reading instruction
>> + * @trap: Output pointer to trap details if something went wrong during read
>> + *
>> + * The hlv/hlvx instructions translate guest_addr through the live
>> + * vsatp/hgatp CSRs, so the read is only meaningful for the address
>> + * space of the currently running vCPU.
>> + *
>> + * At most two halfwords are fetched when @read_insn is true, i.e. encodings
>> + * wider than 32 bits are not supported. Such an encoding cannot be completed
>> + * by calling this function again at @guest_addr + 4: the length check is
>> + * applied to the first halfword read, which would then be a continuation of
>> + * the instruction rather than its opcode. It is up to the caller to reject
>> + * anything that is neither a 16- nor a 32-bit encoding.
>> + */
>> +unsigned long riscv_read_guest(unsigned long guest_addr, bool read_insn,
>> +                               struct trap_info *trap)
> Nit: every other function in this file / declared in this header
> (raw_copy_from_guest, copy_to_guest_phys, ...) has no riscv_ prefix. Why
> does this one get it?
>> +{
>> +    /*
>> +     * Poison the result: if the very first access faults, the fixup skips
>> +     * over the loads without writing it. Callers must check trap->scause.
>> +     */
>> +    unsigned long val = ~0UL, tmp;
>>
> The actual "did a trap happen" contract callers rely on is
> trap->scause == 0. If the very first access faults, fixup_exception() will
> write scause accordingly to a non-zero value, but nothing in this function
> clears trap->scause on the success path.

So perhaps the assumption is that callers pass in a zero-filled struct?
Would want (need) spelling out, though.

Jan

