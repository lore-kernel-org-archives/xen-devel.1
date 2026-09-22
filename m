Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5F1C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 06:24:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428143.1650843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8tve-00005E-Ai; Tue, 22 Sep 2026 06:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428143.1650843; Tue, 22 Sep 2026 06:24:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8tve-000050-7Y; Tue, 22 Sep 2026 06:24:34 +0000
Received: by outflank-mailman (input) for mailman id 1428143;
 Tue, 22 Sep 2026 06:24:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8tvc-00004u-Gf
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 06:24:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8tvb-004RUU-QO
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:24:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab21f12-e002-0a2a0a5209dd-0a2a4503872a-46
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:24:31 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab21f1f-fae8-0a2a45030019-4a7de14cacab-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:24:31 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f635552aso3066283f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 23:24:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48862795232sm2477190f8f.32.2026.09.21.23.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 23:24:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1790058271; x=1790663071; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+i/FLEpoYM3jyVxrmr+96M+gRgikrqxasWb8sYr+7H8=;
        b=Q74m+fWe2mbDj/ZvUpVAXVh8dNyWA/suP4iCoy4qYHommLoqE+dVqsvKKgwoOlzMw7
         0+9JxmB6wTX3Dyuc6f/vqXYQaRwY5aaNRX1hzl/oU+d53Yl62fvs4C/wFptNH62QzIgW
         3A7DjjHTVMCXxF/PoizgbaRhyuQSz6tXUjRXY4QfMJf2YUIX97bgzPnYbWS+DLv+i67k
         Nqgs2tn13ZKw98ybiOalJo3/zC/8pkdtVXpPFLsFINZB8LLHGFFW6r9Xd4FIjgoSqVSj
         VD33Rp78ojNJz4ejraMWn8KrMHaKQmUti+UeQGv3Pan43hI2FnGYlK75e083VPUqW0k2
         viFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790058271; x=1790663071;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+i/FLEpoYM3jyVxrmr+96M+gRgikrqxasWb8sYr+7H8=;
        b=ZSM5nt4X0LzyF1o1tLvSQF2krYDDa2ziTV8COfFH7hSZRhBt8/kGBMagahjK/mvRZM
         RkZ9J7M83IWki6SODSwURqVByIjlZ8vLxebZgnCUfLjgxdIA0dkZaXJZV20g+4xqFJOa
         VYh+W5WwtS4louMCTa5fuxiKcLuR2Ti7efjKa7WKTlCRo/NaUsVdsWAQjXXE7q3Mi51X
         dmQWqq3JSIB/r3PQDlAtWxmF9Xao652ipDsClDIvIDZulx20YoCMkTROySmZm1zhywa5
         Cfdc/4gCQw/cqyz+G7UPnbz+IgK26r7ppJaNfdHP9gQUJdaN1OWfVcGuWkagA2L+/MrU
         SCUQ==
X-Gm-Message-State: AFuF++lrSxtJZmIAgqVs7WlhYfUYSka+srLoHe0IBMufodxVvLJvn7HJ
	KmMCEw8Tg5TpWtfQ/Is5CMHA87Dwa+x5lgdcnyjzhs3MdX/7drsGGbupCHNPATg6WA==
X-Gm-Gg: AYBFou0f9xZ6L7Jh2jeEtRgBXdw8hlBkIrGHPoandS69hgGufPVMYD2tkQg9sByu1z5
	GLwUvgNt+zOoUWYodsPtzJBkR8KbEw+CKJv0oaJERXGWvYCIOO3mGFVBkxOmee8UUhjNYl4F9Ts
	A3LXf5a6nfoAS4A51XQ2pax6cvxaGTx0Suh1uG8nJA+HBXalvUy0eNu7Jenxi8WdF4/fQrpYAUD
	0m2PfLa4x30ZZZRjLR7sHRo5agxjcK3MV1R9tahUZDt75QcgQ7iEEReMZOV4VWE030uqR02zCpu
	zKUKDsCvdKgpEn4dPspddWeOOQrMaUQRJp8f8uAXCca6KiDbbG+UHpzXNBQw5aogfNC0IM3GHgN
	RVcWAR2UHs/5/IDFXz0OlcRU91YbzYmcfyp7PGsCQf1AJ5qsnL+fmEEUB/+Ld6k0WlEOXRY+D0p
	5BVRGKFofIG3EC3wghyuhbU0tFdWaTC0SUakYBKRQBrxFur3Edsg3Cm4kQPDl7cDsTAnOY+GV9e
	/gsnX+mEiANvewUWOU6FT7/CTv5tFjz9ZUAd38OqjtRxD1zJ5KuREn1xoKwig==
X-Received: by 2002:a5d:6f05:0:b0:487:d7e:52c7 with SMTP id ffacd0b85a97d-4871e255cf1mr16460189f8f.19.1790058271144;
        Mon, 21 Sep 2026 23:24:31 -0700 (PDT)
Message-ID: <e8b1257b-3b28-43d3-b692-5e79f5cae68a@suse.com>
Date: Tue, 22 Sep 2026 08:24:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] xen/riscv: fix Svade/Svadu A/D bit handling
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1789032657.8631fc262581453bbf619ec5b2062170.1a08aa7f23b000c4f3@vates.tech>
 <1789032897.8631fc262581453bbf619ec5b2062170.1a08aab9d76000c4f3@vates.tech>
 <450d0c5e-2101-4b1c-98fd-2f438bd0ccf3@suse.com>
 <1790010225.8631fc262581453bbf619ec5b2062170.1a0c4ec74f000072c4@vates.tech>
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
In-Reply-To: <1790010225.8631fc262581453bbf619ec5b2062170.1a0c4ec74f000072c4@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1790058271-750864E9-FE9BCA50/0/0
X-purgate-type: clean
X-purgate-size: 5266

On 21.09.2026 19:03, Baptiste Le Duc wrote:
> On 2026-09-21 17:26:47+02:00, Jan Beulich wrote:
>> On 10.09.2026 11:34, Baptiste Le Duc wrote:
>>> @@ -468,6 +469,62 @@ static bool __init has_isa_extensions_property(void)
>>>      return false;
>>>  }
>>>  
>>> +/*
>>> + * Svade and Svadu extensions represent two schemes for managing the PTE A/D
>>> + * bits. When the PTE A/D bits need to be set, the Svade extension indicates
>>> + * that a page fault will be raised. In contrast, the Svadu extension supports
>>> + * hardware updating of the PTE A/D bits.
>>> + *
>>> + * There are 4 possible combinations of these extensions in the device tree.
>>> + * The default hardware behavior for each is:
>>> + *
>>> + * 1) Neither Svade nor Svadu present in DT => It is technically unknown
>>> + *    whether the platform uses Svade or Svadu. Xen should be prepared to
>>> + *    handle either hardware updating of the PTE A/D bits or page faults when
>>> + *    they need updating. In that case, Xen assumes Svade because it's
>>> + *    harmless if the platform is actually Svadu, while assuming Svadu on real
>>> + *    Svade hardware risks an unhandled page fault.
>>> + *
>>> + * 2) Only Svade present in DT => Xen must assume Svade to be always enabled.
>>> + *
>>> + * 3) Only Svadu present in DT => Xen must assume Svadu to be always enabled.
>>> + *
>>> + * 4) Both Svade and Svadu present in DT => Xen must assume Svadu is turned off
>>> + *    at boot time by setting A/D bits. To use Svadu, the supervisor must
>>> + *    explicitly enable it using the SBI FWFT extension.
>>> + *
>>> + * The Svade extension is mandatory and the Svadu extension is optional in the
>>> + * RVA23 profile. Platforms wanting to take advantage of Svadu can choose
>>> + * option 3. Platforms aware of the profile can choose option 4, and Xen won't
>>> + * get the benefit of Svadu until the SBI FWFT extension is available.
>>> + *
>>> + * In other words, hardware manages the A/D bits on its own only in case 3, in
>>> + * all the other cases software has to preset them. Instead of open coding this
>>> + * in every A/D bits user, RISCV_ISA_EXT_svade is used to mean "software is
>>> + * responsible for the A/D bits" and is set here for the cases 1, 2 and 4.
>>> + */
>>> +static void __init riscv_resolve_ad_scheme(void)
>>> +{
>>> +    bool svade = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade);
>>> +    bool svadu = riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu);
>>> +
>>> +    /* Case 3: leave the A/D bits management to hardware. */
>>> +    if ( svadu && !svade )
>>> +        return;
>>> +
>>> +    /* Case 4 */
>>> +    if ( svadu && svade ){
>>> +        if ( !sbi_probe_extension(SBI_EXT_FWFT) ){
>>
>> Nit (style): Brace placement.
> Sorry for that. I will fix that in v3.
>> Furthermore this is written in a way which Misra would call "dead code". I'd
>> like to suggest (leaving out comments):
>>
>>     if ( svadu )
>>     {
>>         if ( !svade )
>>             return;
>>
>>         if ( !sbi_probe_extension(SBI_EXT_FWFT) )
>>             printk(...);
>>     }
> I assume you are referring to Misra C:2012 Rule 13.5 "The right operand
> of a logical && or || operand shall not contain persistent side effect"
> 
> If yes, IMO, I think it doesn't apply here as `svade` is evaluated
> before the `if` so there is no side effect that wouldn't have been
> executed in case of svadu=false.

No, there's nothing side-effect-ish here. With "svadu && !svade" in the
first if(), the rhs of "svadu && svade" in the second one is dead code:
Things would function the same with it dropped.

>>> +          printk(XENLOG_WARNING "RISC-V: Both Svade and Svadu detected, but SBI FWFT is missing.\n"
>>> +                  "RISC-V: Defaulting to software A/D updates (Svade).\n"
>>> +                  "RISC-V: To force hardware A/D updates (Svadu), remove 'svade' from DT.\n");
>>
>> Nit (style): Indentation (in multiple ways). Furthermore XENLOG_* needs
>> repeating after every newline.
>>
>>> +        }
>>> +    }
>>> +
>>> +    /* Cases 1, 2: Xen assume Svade to be enabled */
>>> +    __set_bit(RISCV_ISA_EXT_svade, riscv_isa);
>>
>> Isn't this a lie (to ourselves) then?
> If you are talking about case 1:
>     [1] Yes, it's technically a lie for boards shipped before
>     the svade/svadu extension was ratified (e.g., HiFive Premier P550).
>     These extensions merely formalized a mechanism that already existed in
>     hardware.

Wait, how do you know this for _all_ boards anyone may ever have made?
And for all qemu (and alike) versions which supported RISC-V?

>     [2] For boards that do support svade, we could enforce DT
>     declaration by adding it to `required_extension` as they are
>     explicitly supporting it. However, doing so would cause boards
>     without svade/svadu support (as described above) to hit a panic
>     during boot.
> 
>     So in both case ([1], [2]), the svade extension exist either implicitely or
>     explicitly. Therefore, force it doesn't compromize anything.

If, despite my comment above, this is indeed what is wanted, I think it
requires a little more commentary.

Jan

