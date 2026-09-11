Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EB1C88E4D
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 13:48:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416806.1645729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51bl-0008BG-IZ; Fri, 11 Sep 2026 13:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416806.1645729; Fri, 11 Sep 2026 13:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x51bl-0008B9-Fv; Fri, 11 Sep 2026 13:48:01 +0000
Received: by outflank-mailman (input) for mailman id 1416806;
 Fri, 11 Sep 2026 13:47:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x51bj-0008B3-OJ
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:47:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x51bj-003vLd-55
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:47:59 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa40687-8faa-0a2a0a5109dd-0a2a4509e558-6
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:47:54 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa4068a-be1a-0a2a45090019-d155dd2fc430-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 15:47:54 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-486f282cad5so306519f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 06:47:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e636f7fa2sm56091255e9.15.2026.09.11.06.47.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2026 06:47:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1789134474; x=1789739274; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rWtABwEmX9gpRXPDGM44bj3te4smT5urMfTbKWWSDD0=;
        b=LYj/b4wu3URXuTboYRV+kfFq2oHhPjnHYELM8mZeWnxrS8GaePKhvk2oa3onixexzA
         R2CfkdIYcawB+gX9eVjIyI9dORraCzccELt5EkKAL0wzHLqcM1ZwEeDbFYa2n4Yi5mPR
         lhkMjUdKKZhNzEA385HBxkrmX/7rqKCmKvMlMf/KrypFETnRCMwcVKOSzCmknkxOR6fZ
         UBXU3EL1CkSVRmiRcR+KT4WTwHSZm5YDuCIq40/A/qewC/j+HzU+VmBELEK3Q8MDy5ta
         FRnrgr8j+IVt0BR2OzLYiwSpJ5ne18Nbqb3gKVevL1kXf4m9Qz2pVsBO101Xqq+b3aXc
         Cjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134474; x=1789739274;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWtABwEmX9gpRXPDGM44bj3te4smT5urMfTbKWWSDD0=;
        b=LNuxKejPwwUhgDeHusqtNfbdTNDQ4saidx3zKTWHoOjsJq01mC7X3PoCSPWPbpsd0o
         VtAu25ICjOnSahmDF5B/degd6nhiWNRZN8QJ3248sCqUNkr8jp1sKIa0aCFqqOKjfM0I
         Stxdl6AK4fchbTgY4IN43+N9I+8J6apZ64nqKlmFLiPnds8jSh0Pg6Qh6QjPR2VOBtbN
         9tQmgs8IWjO4qfBmpPoFniOIPz1a8mDdV2nF1TsrQ04zNUFrjs7qNdlqDiJfr4mm5mwq
         Dp4AqlzOqsGW4OU9HcbkE473GnAJYPDg+7+CMSKsY8XSMqg5l11OS7sHIyuaxQ2jZEDN
         xbFg==
X-Gm-Message-State: AFuF++kkfY1oaFvKe/Oqf5JqQ98AGeLhBy1Niu+INOTbAkAvwXyZPGtE
	G3/8aptYlsD/IW3KEU9g5ynOym5wDodK5mv1bvLR61KLdQzCnW6H2YoQoaJRgAz4Xw==
X-Gm-Gg: AYBFou13AqaXIUdF7qZTfk1erqFeq3Ap+5Atb8v7DmmHrjjhuLWnh1DPztF3EEyaoLs
	0w5IEC2q751GDWsjs3JFK+9NUIziBrIg+EoGC7qcegI7jEDszhvqlPkIExbjFnrKdIAfr2iS3hk
	CDEwMJYWVuP5T6UKHsgLiKPng6Yi+PCJAB0VR94ifAWLjTiyw+cYLEjj1MuZDTvZTZ5IP3fYHul
	9hH9woYtFBQE0mviiPV4MdiDm2aoSejTTcWAIdTBI2oMtjm3Jr48uhBPjm6vIi89hg7cG4IHxX7
	ZqO4WmA1jc7Jxbk+eUMsRW4EMl26exzBgBO7tkCr5UwFezt391yK4izEPitLsiChX/GQZ2a5vMz
	of5sn1yEgOfR8FaV3Uic1rXRXFPLVH9ipY0IxewYxqLRq4JwfVj8X6Hl1fQFh/dmn36phcfa8o6
	F0lvRpMma8km6XCDLlA2lYa3eWnQmn/37CvE25PkAOcBIwxPC+rQxC9C9Pm3I5KmNptpdueJ0P/
	vONazffdJBrrvtRGQe2RQgniwaI+KyrJmahNk8NLG1ea8Aprv14RMgDBD9mX1o=
X-Received: by 2002:a05:600d:8496:20b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49e6199234amr34887665e9.14.1789134474185;
        Fri, 11 Sep 2026 06:47:54 -0700 (PDT)
Message-ID: <7a683895-d145-4640-b0c7-390408404a94@suse.com>
Date: Fri, 11 Sep 2026 15:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/39] xen/riscv: add guest memory read helper
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <b68a29b7ef5b2cb83fde405b3854c94a2f44f4d0.1787838835.git.oleksii.kurochko@gmail.com>
 <1788955499.8631fc262581453bbf619ec5b2062170.1a0860e9b57000c4f3@vates.tech>
 <7b743afb-409d-433b-86b9-7ec8be7ad860@gmail.com>
 <1ce9effb-a632-4a48-aaaa-3c810ebd255d@gmail.com>
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
In-Reply-To: <1ce9effb-a632-4a48-aaaa-3c810ebd255d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1789134474-3BCD7034-D0FBD2AD/10/73395122804
X-purgate-type: spam
X-purgate-size: 3416

On 11.09.2026 15:41, Oleksii Kurochko wrote:
> On 9/11/26 3:06 PM, Oleksii Kurochko wrote:
>> On 9/9/26 2:04 PM, Baptiste Le Duc wrote:
>>>> Introduce riscv_read_guest() to allow Xen to safely read guest memory
>>>> using HLV/HLVX instructions while reliably capturing trap context.
>>>
>>>> This is required for instruction fetch emulation and MMIO decoding, 
>>>> where
>>>> Xen must inspect guest memory that may not be directly accessible and 
>>>> may
>>>> fault.
>>>>
>>>> The implementation is based on kvm_riscv_vcpu_unpriv_read() from Linux,
>>>> with one deviation: the hlv/hlvx instructions translate the guest 
>>>> address
>>>> through the live vsatp/hgatp CSRs, i.e. through the address space of the
>>>> currently running vCPU, so the function can only be called safely for
>>>> current. Instead of taking a struct vcpu argument, it always operates on
>>>> current directly.
>>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>
>>>> diff --git a/xen/arch/riscv/guestcopy.c b/xen/arch/riscv/guestcopy.c
>>>> index 8a89212e0b..b2327822ac 100644
>>>> --- a/xen/arch/riscv/guestcopy.c
>>>> +++ b/xen/arch/riscv/guestcopy.c
>>>> @@ -6,6 +6,7 @@
>>>>   #include <xen/string.h>
>>>>   #include <asm/guest_access.h>
>>>> +#include <asm/traps.h>
>>>>   #define COPY_from_guest     0U
>>>>   #define COPY_to_guest       BIT(0, U)
>>>> @@ -114,3 +115,89 @@ unsigned long copy_to_guest_phys(struct domain 
>>>> *d, paddr_t gpa, void *buf,
>>>>       return copy_guest(buf, gpa, len, GPA_INFO(d),
>>>>                         COPY_to_guest | COPY_gpa);
>>>>   }
>>>> +
>>>> +/*
>>>> + * Read machine word from guest memory
>>>> + *
>>>> + * @guest_addr: Guest address to read
>>>> + * @read_insn: Flag representing whether we are reading instruction
>>>> + * @trap: Output pointer to trap details if something went wrong 
>>>> during read
>>>> + *
>>>> + * The hlv/hlvx instructions translate guest_addr through the live
>>>> + * vsatp/hgatp CSRs, so the read is only meaningful for the address
>>>> + * space of the currently running vCPU.
>>>> + *
>>>> + * At most two halfwords are fetched when @read_insn is true, i.e. 
>>>> encodings
>>>> + * wider than 32 bits are not supported. Such an encoding cannot be 
>>>> completed
>>>> + * by calling this function again at @guest_addr + 4: the length 
>>>> check is
>>>> + * applied to the first halfword read, which would then be a 
>>>> continuation of
>>>> + * the instruction rather than its opcode. It is up to the caller to 
>>>> reject
>>>> + * anything that is neither a 16- nor a 32-bit encoding.
>>>> + */
>>>> +unsigned long riscv_read_guest(unsigned long guest_addr, bool 
>>>> read_insn,
>>>> +                               struct trap_info *trap)
>>> Nit: every other function in this file / declared in this header
>>> (raw_copy_from_guest, copy_to_guest_phys, ...) has no riscv_ prefix. Why
>>> does this one get it?
>>
>> Agree not to much sense. I will drop it.
> 
> Probably we still want to have riscv_ prefix to show that this 
> read_guest() is specific to RISC-V but others (raw_copy_from_guest, 
> copy_to_guest_phys, ...) could be used in Xen common code too.
> 
> So I think we could keep riscv_ prefix.

Please may I suggest to avoid unnecessary prefixes?

Jan

