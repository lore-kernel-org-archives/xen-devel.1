Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026EEE9A03B
	for <xen-devel@archiver.kernel.org>; Wed, 18 Feb 2026 10:46:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1235435.1538420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsf4F-00066U-2j; Wed, 18 Feb 2026 10:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235435.1538420; Wed, 18 Feb 2026 10:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsf4F-00066N-08; Wed, 18 Feb 2026 10:46:03 +0000
Received: by outflank-mailman (input) for mailman id 1235435;
 Wed, 18 Feb 2026 10:46:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cF4C=AW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsf4D-00065y-VC
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 10:46:01 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffb86221-0cb6-11f1-9ccf-f158ae23cfc8;
 Wed, 18 Feb 2026 11:45:54 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4837907f535so37533635e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 02:45:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483740be167sm373444625e9.15.2026.02.18.02.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Feb 2026 02:45:52 -0800 (PST)
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
X-Inumbo-ID: ffb86221-0cb6-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771411553; x=1772016353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=guaIVk1bitGgKUwQCbBmi7WJHzwKBp/VOb4RXDcQbGI=;
        b=X201QsFvbNyA0U4K2ttkj35RqN/t+sJV2WMMQNv5PV+MP1oXkc51OR0I43XX7lNFwQ
         Gq2sm0nZ59KK0OPVYO5KWkJOI3j2wVNJaCZyYagUM94tmcU19ZkOW9edC6DIwnq4bOva
         1lxgk2lYjbsfzwVS5WW6cJwImtgcr+jQW5sAb2mjl8M/1J8sfBMm83OwNEuaez/GtZUz
         92Y3NkksZD1+TpSK5BSrWp9pUCTK4M0e1kB9Eo+BZGOyyz5bJTg9LXA39vIV1w05Mt4t
         W67vF9UAp/wveML9xkhhnokGsI+5SQ6dBAlCG+34L18gGoo3br7PVJF8FJ7VcUBqcFa+
         HL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771411553; x=1772016353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guaIVk1bitGgKUwQCbBmi7WJHzwKBp/VOb4RXDcQbGI=;
        b=Dv9TJmEGqPxvjh1YQcwnKMVlTVS9pfpT/vwsFunm/l42/+xEVopvQX3fPD3L5Rlbci
         XcJ2VAqCa5zjVtZyhsYspW67kTtnPGIsyDkdm5aOuMccQzz6UOAGHCTJaB4POcS9xDO5
         ArbUwtdfTHsYXLC9bGc0Yv8yveNQEBa1spw2iNY5SgKKKGej5Ri7nl3iFsDCeyR8DES9
         sAfnTVnh1d0Itv0cnicDbnrs4gD896pVd9nU65RbYVvcxBNurz05gTg6atjokKsEBnmJ
         S75PgvYMAHYUEzY73q5YGywX9timfDsTjHp1cE9Qp1EpfcDNgkZ5x85QbOyQBiZuYLTn
         K1AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7e+akdbqVUfbCkod+AGsQqEqhbqdeYaCOpYBMSLf3UcFRVpXem1Nvkozy7lmf+qvP/tqBj/ntKfM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvdT4M86uvOWZ+rcVAiDo5dHVvntBwUtypq32nkhgnsLpe3KJ+
	YvGAqKK4YXyMTjquwLEPOp4khM4duekAwVOLxVGw2c1A6CBD0SdeB9zFbPBLFLgwtg==
X-Gm-Gg: AZuq6aK3bbvdSfvL3X7UzyJLbM/8os2f26d0qf+oa3E8sw975N16Aa114ID3TwMtfWS
	u7IWG4H8Zz5oQvfPyto0BS6npQO1iZ6RWtcTI/pN9IWKy/98AmOBPtZZq9pzO2QIx9I1w0zhcoh
	Uj/3JU00zmP1zp6KSb/83tlnKWF33Gqb7Rh2PYmDTrrZCcD5CaYWavE0jDlGs5XeqFMSqG7FNzK
	67zab++j5UwF9NA1HsI5lbyod4+26Amau88WhT+vnFvkIReeLiJi+ehjZuRT9DBZ+69cNy6sKRp
	FgEbiBMoHhBe66GGh5U9ow0yLkkzr3gUwZe7UNKcFuWaVbxaH2Nh7GnEk7uEgfpCPnNH32N75To
	jf2Z+TOJes9ei+03eoqyiMb9qwsMR6ZoQ2vGSjeYYOmiJHStG5CIr3SQOAn9LslDcUdfTFsBPY/
	NsnXzoXpPwGPKOF5Z8KkpRylcPuvWOsncVPU6RqYV6ZGYc3cjLzP5ZhZd4RNjWagQQLJojjEi+1
	Mx7990m58dUfWA=
X-Received: by 2002:a05:600c:310e:b0:480:4b5d:9ec with SMTP id 5b1f17b1804b1-48379bf4709mr263623085e9.33.1771411553205;
        Wed, 18 Feb 2026 02:45:53 -0800 (PST)
Message-ID: <82c65bab-f9a1-497a-a16d-79b29c4d4045@suse.com>
Date: Wed, 18 Feb 2026 11:45:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] xen/riscv: enable DOMAIN_BUILD_HELPERS
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <6ab04f3584e45795dc82c25f62a6c950913f5c7d.1770821989.git.oleksii.kurochko@gmail.com>
 <aac9b5ac-6660-4ec0-b88e-605903217588@suse.com>
 <b4ac883d-ce90-40b0-93fc-95c925c7ac61@gmail.com>
 <a35d5566-7da1-406d-abf7-13b423d013f8@suse.com>
 <760d7b95-2e76-453c-8d13-ca4432eb22e5@gmail.com>
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
In-Reply-To: <760d7b95-2e76-453c-8d13-ca4432eb22e5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2026 11:39, Oleksii Kurochko wrote:
> 
> On 2/13/26 2:11 PM, Jan Beulich wrote:
>> On 13.02.2026 13:54, Oleksii Kurochko wrote:
>>> On 2/12/26 5:39 PM, Jan Beulich wrote:
>>>> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>>>>> --- a/xen/include/public/arch-riscv.h
>>>>> +++ b/xen/include/public/arch-riscv.h
>>>>> @@ -50,6 +50,14 @@ typedef uint64_t xen_ulong_t;
>>>>>    
>>>>>    #if defined(__XEN__) || defined(__XEN_TOOLS__)
>>>>>    
>>>>> +#define GUEST_RAM_BANKS   1
>>>>> +
>>>>> +#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
>>>>> +#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)
>>>>> +
>>>>> +#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
>>>>> +#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }
>>>> Hmm, does RISC-V really want to go with compile-time constants here?
>>> It is needed for allocate_memory() for guest domains, so it is expected
>>> to be compile-time constant with the current code of common dom0less
>>> approach.
>>>
>>> It represents the start of RAM address for DomU and the maximum RAM size
>>> (the actual size will be calculated based on what is mentioned in DomU node
>>> in dts) and then will be used to generate memory node for DomU (GUEST_RAM0_BASE
>>> as RAM start address and min(GUEST_RAM0_SIZE, dts->domU->memory->size) as a
>>> RAM size).
>>>
>>>>    And
>>>> if so, why would guests be limited to just 2 Gb?
>>> It is enough for guest domain I am using in dom0less mode.
>> And what others may want to use RISC-V for once it actually becomes usable
>> isn't relevant? As you start adding things to the public headers, you will
>> need to understand that you can't change easily what once was put there.
>> Everything there is part of the ABI, and the ABI needs to remain stable
>> (within certain limits).
> 
> Considering this ...
> 
>>>> That may more efficiently
>>>> be RV32 guests then, with perhaps just an RV32 hypervisor.
>>> I  didn't get this point. Could you please explain differently what do you
>>> mean?
>> If all you want are 2Gb guests, why would such guests be 64-bit? And with
>> (iirc) RV32 permitting more than 4Gb (via PPN being 22 bits wide), perhaps
>> even a 32-bit hypervisor would suffice?
> 
> ... now I can agree that Xen should permit bigger amount of RAM. At least,
> (2^34-1) should be allowed for RV32 and so for RV64 so it could be used
> like a base for both of them. As RV64 allows (2^56 - 1) it makes sense
> to add another bank to cover range from 2^34 to (2^56 -1) for RV64 (and ifdef
> this second bank for  RV64).
> 
> Would it be better?

Having a 2nd bank right away for RV64 would seem better to me, yes. Whether
that means going all the way up to 2^56 I don't know.

In whether a public header can be changed, it also matters whether these
#define-s actually are meant to be exposed to guests (vs. merely the tool
stack). Longer-term, however, this is going to change (as we intend to move
to a fully stable ABI).

Jan

