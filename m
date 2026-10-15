Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC5ACC6B34
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 08:45:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450048.1665552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHH5A-0008He-Va; Thu, 15 Oct 2026 08:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450048.1665552; Thu, 15 Oct 2026 08:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHH5A-0008HX-Ry; Thu, 15 Oct 2026 08:45:00 +0000
Received: by outflank-mailman (input) for mailman id 1450048;
 Thu, 15 Oct 2026 08:44:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHH59-0008HR-3R
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 08:44:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHH58-006YcF-8k
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 10:44:58 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad09289-2eae-0a2a0a5409dd-0a2a4504b5e6-4
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:44:58 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ad09289-b57f-0a2a45040019-d155dd2dcc61-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:44:58 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48df8fe8513so81896f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 01:44:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de09693c7sm21677051f8f.4.2026.10.15.01.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2026 01:44:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1792053897; x=1792658697; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IYPnqtd+/baPeKbOuz8zkbnyzx2QS60iP2/pLZfCFQM=;
        b=MEQcpX8P1waYm3Q+368icXk6zqxDOWeAE6H3Lr2x/GZwH6cO0cz2p6KZk7cpB0fgwI
         h2lIutV9+W8wkcOPmtKbQiwIsqM3j7bmxFJQpd+aEX4+VByLLyk1Xvt58P7h1YUDKGnM
         vb2b+Gwd6cCWdvbsUEjFHHmF9tn6Rb3mBeXaRiRNiKAvy/riELxQF/7RAh8+Qnml6iuK
         Qe1S0MFMetvKNFn0sdLs+J8O0NWn0ZCrtJrqpcEzA7Rlfoi32G2aeiANSy9wXOu518Dw
         8veoDlVDe1w+yzAOZMu1yBzsL+13bkY/SaMQFWi7GvNDz0igZEvRV298/J9xJus69QNZ
         LjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053897; x=1792658697;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IYPnqtd+/baPeKbOuz8zkbnyzx2QS60iP2/pLZfCFQM=;
        b=uYOhk5yHv8BOs+7NQoJE0fEIVQCIP5KhhpkGF4NPXSUM7YaQaui/C+yQ4esO4ARDS0
         BaUSVBfMaXgTnuMHZVAOyjv3GL7YdF7ez8b6mCPCfS8NB/6F8y1E2OEChBejx+SGgPCX
         v12s65iGk2ROJoUbsoy4loAb/P9Yf/35wxNCknmP6rq3Rb42JPlmqdzmITRy/WLkgHyJ
         AIkZD7gz3kNwOoHpCBE1aHkga2Axx1+PPGUbzhl+lgyL25mH7gJFPoBNEIk+D/YHLyoR
         7stWlEWLMfX6+ji8Kiov8qLsRGEnWZF0ICAYrsdCW7LImH2CaZVIRLQZ8Oi5gT6qKuH2
         +x8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwKHRnQsU3wRlohcVACtDdECcNjkuSnIfajmodlRpeiyzyQrzfnde3sVujXeeRJF3XqneSjwKB8fc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIB29RWk60Eti+TLWqzYXhik1e2PXwjJCKoxbd8kKTXvaTUQ7/8
	qeCyfVKBhf14ObL8NXz13A+xVd/xLL0z/3yD/NZ+yD8I1Y+a+f6CXHJdndC6/XIaxg==
X-Gm-Gg: AYBFou00tnpuAUAEBthas3/DW3Yel5EQNeSTciOAiP2IB+hUW937XXWx6cRD9oWN5HI
	gnh9WZMQX9Zs3Rl56FMzEgS8Y8aKjMZOsIBDF1yC48qqKDl2mhanklFzaTOVcL1PcFy64VSUub9
	/HqGkRAgnyngil53scd30jVSfwnEl1dbur9ECKzANFall0WAtRFtdehBpff9p8lk2Lg6ehrctpp
	AjMF5B/+0Te6OR11mFm8BzvDbnauti+5GDKiie18GTLJu6oahlXqJp1YhJGk2MfqDLJylpNq96q
	e7IHIjTMm7WxKCyv99VTOfClALvct1IXo59W9So3OHyRQfYoUuWz1GAggmB5gTqVbMu3uZom2OE
	K7jtA+ri5F544PJAeXfjC+hRN/DebDEHzlMzZ2fgwTSJv1/3QVoZF88wCC0ZBdYDa5iKTMZWnby
	CKM5xt72Q4pO8NAQxguKIP0V8z7mEBdttIb3BCTpmMuvOAQTPVNdnbA4/VEl0oll+VwKJpENbzJ
	8sqqRXwqfeyf6IHH1n2edY2diKtS9HlQtYW3sLfC9ytiKmCGh8t8s5mCbJ0aQ==
X-Received: by 2002:a5d:588e:0:b0:48a:fcf9:acb5 with SMTP id ffacd0b85a97d-48dba787752mr35296898f8f.2.1792053897427;
        Thu, 15 Oct 2026 01:44:57 -0700 (PDT)
Message-ID: <e1d27ef8-ecc8-4010-b570-2d2c2af89368@suse.com>
Date: Thu, 15 Oct 2026 10:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] xen/riscv: probe the PTE A/D bits update scheme at
 boot
From: Jan Beulich <jbeulich@suse.com>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
References: <1791885904.8631fc262581453bbf619ec5b2062170.1a134b909b40008425@vates.tech>
 <1791886038.8631fc262581453bbf619ec5b2062170.1a134bb169d0008425@vates.tech>
 <21a48f53-385b-4f36-958c-cc82bf390c89@suse.com>
 <1791901979.8631fc262581453bbf619ec5b2062170.1a135ae53690008425@vates.tech>
 <7ed5d117-80d5-4862-af60-c3e0143564ea@suse.com>
 <1791968412.8631fc262581453bbf619ec5b2062170.1a139a403a30008425@vates.tech>
 <db0d448a-ff1f-4549-84f1-c53e3e4a711e@suse.com>
 <1791996314.8631fc262581453bbf619ec5b2062170.1a13b4dc2b50008425@vates.tech>
 <4e914f14-50ff-48a5-9f56-836913e487fb@suse.com>
 <1792052907.8631fc262581453bbf619ec5b2062170.1a13ead4e580008425@vates.tech>
 <7f5da80c-424f-49dc-8ce3-10ca2fae9f55@suse.com>
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
In-Reply-To: <7f5da80c-424f-49dc-8ce3-10ca2fae9f55@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1792053898-C2CCFB50-57D91A81/10/78276251493
X-purgate-type: spam
X-purgate-size: 2767

On 15.10.2026 10:41, Jan Beulich wrote:
> On 15.10.2026 10:28, Baptiste Le Duc wrote:
>> On 2026-10-15 09:14 +0200, Jan Beulich wrote:
>>> On 14.10.2026 18:45, Baptiste Le Duc wrote:
>>>> On 2026-10-14 11:09:58+02:00, Jan Beulich wrote:
>>>>> On 14.10.2026 11:00, Baptiste Le Duc wrote:
>>>>>
>>>>> In which case it would need to be
>>>>>
>>>>>     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) ||
>>>>>          !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
>>>>>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>>>>
>>>>> albeit I have to admit that permitting two contradicting extensions to
>>>>> be exposed at the same time is irritating.
>>>>>
>>>>>> I see two ways to address this:
>>>>>>
>>>>>> 1) Keep checking Svade:
>>>>>>
>>>>>>     if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) )
>>>>>>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>>>>>
>>>>>>     After resolve_ad_scheme(), the Svade bit is set in every case where
>>>>>>     software has to preset the A/D bits. The only imprecise case is both
>>>>>>     extensions advertised with hardware updating already enabled by
>>>>>>     firmware, where presetting A/D is unnecessary but harmless.
>>>>>>
>>>>>> 2) Record the probe result in a global, e.g.
>>>>>>
>>>>>>     static bool __ro_after_init hw_ad_update;
>>>>>>
>>>>>>     and use:
>>>>>>
>>>>>>     if ( !hw_ad_update )
>>>>>>         e->pte |= PTE_ACCESSED | PTE_DIRTY;
>>>>>>
>>>>>>     This is exact in all cases, at the cost of a new global that mostly
>>>>>>     duplicates what resolve_ad_scheme() already records in the ISA bitmap.
>>>>>>
>>>>>> I discussed with Oleksii and we are fine with either. What do you prefer?
>>>>>
>>>>> As to 1), see above. For 2), while maybe okay, I think we're better off
>>>> Sorry, I don't fully follow the issue with 1). Compared to what you proposed,
>>>> it only differs when neither Svade nor Svadu is recorded, which cannot
>>>> happen as resolve_ad_scheme() runs before and always records one of the
>>>> two.
>>>
>>> Yet previously we said that recording extensions (as such, i.e. later also
>>> possibly exposing them to guests) when they weren't really advertised may
>>> not be the right thing to do. I.e. imo the probing may be used to drive
>> But we also said that platforms (such as the P550) may implement an
>> extension without advertising it, as a RISC-V spec maintainer
>> confirmed in [1].
>>
>> [1] https://github.com/riscv/riscv-isa-manual/issues/3450#issuecomment-6076851535
> 
> What Andrew says there suggests to me that the behavior you observe on P550
> is against the spec.

Or wait - no, he doesn't. He said this only to the strange combination you had
indicated.

Jan

