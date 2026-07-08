Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615ECC43602
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2026 09:37:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1356763.1611308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOij-0007bM-FI; Wed, 08 Jul 2026 09:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356763.1611308; Wed, 08 Jul 2026 09:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whOij-0007bF-Ce; Wed, 08 Jul 2026 09:37:33 +0000
Received: by outflank-mailman (input) for mailman id 1356763;
 Wed, 08 Jul 2026 09:37:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whOih-0007ay-PQ
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 09:37:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whOig-00Gwfm-VU
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:37:30 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4e1a58-bab6-0a2a0a5309dd-0a2a4506c5ce-10
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:37:30 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4e1a5a-08de-0a2a45060019-d155dd36dd30-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 11:37:30 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4720d22c94aso434203f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 02:37:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d6e4csm38520513f8f.10.2026.07.08.02.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 02:37:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1783503450; x=1784108250; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fH5CDyDdzF7ihKjWedoLPGXI1TZw1MP2SFX7+Ew4YSk=;
        b=SMLXFybfPYf4Uo1u6wET7Bq9X3+BV9QWkfCqJEhXpgtBeg3NdWA5ZSls4GfIem0haR
         IphE4y/BqKxx6+WJBYOw7dA9cvw2CCEuUHjes4bIGM6Z3RRb8AfkJLZzecMNQR7vA6Dr
         DqvMQCiyQFYOGInKCC2M/DxbS4EoQ2gIFhMRSz5NIStNRqBlVRWlN4CFxL+k6FKUDSEC
         fpO8BDTCA0cYomJh7nTujG3j4uKGyRjwKHacgWUuKbv3awiOk7vazbqv4bdxu6VtvU22
         ihJhwKM1Xgfz+h15SKmHMQStsc8flyI+U/e3D4xRr6QsFXC4ek+3Crc7PsKUwtWLxOpK
         W0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783503450; x=1784108250;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fH5CDyDdzF7ihKjWedoLPGXI1TZw1MP2SFX7+Ew4YSk=;
        b=r4xMtQOW2AUAtNjE03tjLzuAGEHGQN/QZBxVGN8ItRgXYJiTyHb8rkFhBPNnsYm54L
         6tDhyqh8Fx7twL6nl+PPhmxReG+EejjBm+bzfpD+P9Y1lxEFcYII3sJTvnzAFqmk6Ev3
         dmdSeb2o+HRCn4JVyZLwYFIebU1bXtGFsraJu7stXu/GsaVpuwpBv5cGhQCYzt8sO3bE
         faS//lkbaaxp7B9+MGbDjK9pDhMkK0biEPoO1J+y8wICn4iFnbkrHjPSwRdPSRf/JHIe
         yz+aRfcjuoVq7WQUr9fABb93bfPAEh8OeyoAcQkf3dfeUQ0MfyLTeTvzWjc5zg9+h6sm
         ANng==
X-Forwarded-Encrypted: i=1; AHgh+RqSm3GBBzDaLkjwbrn1mUtwbmN79ihqYk+JsT0BJIkOPPNDmIRSukTDfbmjDJWX1HBRMX1hVPSGF4Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkPc3iDKw1RspeohiIelPrsXLOX1vkRAwmjGUBjVR+8O+fl/+R
	haXJjw9TCRimrkDF7PLIlxTt6tyY2tB1gKkfKIpopYjfAG8g3rZNgSz/PI3TRLQ5QA==
X-Gm-Gg: AfdE7cmgBarplrnUxdw6ET7dnKBbh+boDBY+72C4p6qca77+e/EPbG0N4tSOL+WH1cO
	kGbAp5GoNfLh4X8eBiZJXjumM6upvffbYcYj/K2cLzA/II+ce7MxgmBBWQdXe4C4godsFw/M6uu
	uVqajC3bKqUDpDmOQA7sTUdMqF1Q7AIMpvO1twHkiWHa7vzE7ZraDlt16CNmTDN/N9wJWWVJGK9
	LhoQlNrwyclkmrpexoTqwKFn0fgBQQ5Ahop/X1cOZ6B4F0T3JQn0gy2U4k5IHeyOS5LK+7Uu1DA
	rhdoxuIGfgzVYn3+bH2sS7H6nzah0Q8qFnRwQYcCMHXz1m+bjXxfQKq/LBHhvqWal6MCCBOFxG0
	8yW2F0BygsC2igNfo43wC7ATSEl1HhRhAwDfndYUQpIVhKuhwm36IGN1g4EntO3xYdRY9x1gLPC
	kOEYgb2MqNNPEiKXcKeraWO2e5K5XLOxgnJDaSpwsvA+tCtMYmIXyfpkG/bnpkC6cC6l9ZwNAcj
	zXC
X-Received: by 2002:a05:6000:2381:b0:473:76a2:67ef with SMTP id ffacd0b85a97d-47df0748b20mr1854620f8f.13.1783503450320;
        Wed, 08 Jul 2026 02:37:30 -0700 (PDT)
Message-ID: <4d38fc9c-0d80-4632-98e8-7fb4682bc0b0@suse.com>
Date: Wed, 8 Jul 2026 11:37:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/emul: Adjust handling of CR8_LEGACY
To: Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260707194921.1425926-1-andrew.cooper3@citrix.com>
 <1783502974.8631fc262581453bbf619ec5b2062170.19f410fad6d00080a8@vates.tech>
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
In-Reply-To: <1783502974.8631fc262581453bbf619ec5b2062170.19f410fad6d00080a8@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1783503450-43B2A68D-F6CFA8BD/0/0
X-purgate-type: clean
X-purgate-size: 1266

On 08.07.2026 11:29, Teddy Astie wrote:
> Le 07/07/2026 à 21:49, Andrew Cooper a écrit :
>> --- a/xen/arch/x86/x86_emulate/decode.c
>> +++ b/xen/arch/x86/x86_emulate/decode.c
>> @@ -780,12 +780,12 @@ decode_twobyte(struct x86_emulate_state *s,
>>           break;
>>   
>>       case 0x20: case 0x22: /* mov to/from cr */
>> -        if ( s->lock_prefix && vcpu_has_cr8_legacy() )
>> +        if ( s->lock_prefix && vcpu_has_cr8_legacy() && s->modrm_reg == 0 )
>>           {
>> -            s->modrm_reg += 8;
>> +            s->modrm_reg = 8;
>>               s->lock_prefix = false;
>>           }
>> -        /* fall through */
>> +        fallthrough;
>>       case 0x21: case 0x23: /* mov to/from dr */
>>           ASSERT(s->ea.type == OP_REG); /* Early operand adjustment ensures this. */
>>           generate_exception_if(s->lock_prefix, X86_EXC_UD);
> 
> I'm fine with it; though we probably want to make sure we always 
> advertise the AltMovCr8 feature bit as APM suggest users to always check 
> for this before relying on this behavior.

Why would we set the flag when hardware doesn't have it? Note the
vcpu_has_cr8_legacy() check there - we only engage this behavior if
the guest sees the feature as available.

Jan

