Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107D0C61DD6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 07:07:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404495.1638176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1Iaa-0008SP-FU; Tue, 01 Sep 2026 07:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404495.1638176; Tue, 01 Sep 2026 07:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1Iaa-0008SI-Cn; Tue, 01 Sep 2026 07:07:24 +0000
Received: by outflank-mailman (input) for mailman id 1404495;
 Tue, 01 Sep 2026 07:07:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1IaY-0008SC-KV
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 07:07:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1IaY-00FuRb-12
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 09:07:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a967997-bab6-0a2a0a5309dd-0a2a450b95c8-26
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:07:21 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9679a9-b7e8-0a2a450b0019-d1558035c1fe-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:07:21 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49b8687630fso31729905e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 00:07:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d3b86dsm2881146f8f.11.2026.09.01.00.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 00:07:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1788246441; x=1788851241; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUVnxOtBYA/RXn9VIRzQEU5svBiEc2AvDOpHnvcLEMM=;
        b=WS2zrQo4RMDC/npFjaHIJpuUd31fvAsoRaLqmZOYHjXTqqYLvlR1UqKXZJmrNqxeex
         I9SJM1GnCaC1OkTUGt7+K4vQZxPjVw8Dfy9PScUREDoWLmmK1NRYMSmFpk7SOyW3dF9X
         3c1duARisL8tndvOnGXqyLz5fPMbY9NcPIAJsHAT60lKb0LrFz82i7+YCZ1CILSEofzJ
         UFJQb1JsqGzMNrkQGIePl371mHn8aIO76T5PlC7djRMqsBlRyOgo6xcPx1qzUv7NxvOr
         zpvUwQsxaPOXOZZfoBUhxoVKZtW1m6rVpwqpMZDoF/haEXZ9ViPfEP0L+kZsbphVPRnf
         n8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246441; x=1788851241;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUVnxOtBYA/RXn9VIRzQEU5svBiEc2AvDOpHnvcLEMM=;
        b=okLBkQVA3s2KvPQetcr7PZfpZMmwfDj2soY0ZZ4TaGah4gUP6uwD014E2/C3A82RwC
         tkflO3dDnbkNgyntadv9CYiQARXN/Kqek4675gDv7AR3Iup41cYAkvFPBI/cqls2tqlu
         huAWsRckxK9IM2sH+hTfhQTjOAT2Dq8ljArmII5igWSUnOKy+qstN0kZtWdGtnMStJ+n
         +mEeVvaLm+UXw+WUyawZ5rErRkV5GXqR/9YPIRFydi9q9nFiBuStxJI+OuAdtfaMVMdJ
         iEnO/5KmwxJ7y16MhwYqXsY2B1qWcqBraJ2kZzy7vfAfz6fcwBVbBLx8XJhnagy8FXf5
         cyFA==
X-Forwarded-Encrypted: i=1; AHgh+RpIRi4B35GuPpsSZWt8EtMVIjTgqmZ6EmMb3w1tn6g4zmuqNmjUKDdI8fQFZ+5VW4jHEcVA/Nt7G0M=@lists.xenproject.org
X-Gm-Message-State: AFuF++m/Cj8bv/6EVL6aG7FUGtMjXyfgecj74uXE4Cw2ozCz7lh+24ix
	c6gAMM7/keJ8QE0SdG/8mn7sHOhwMERvLCy+J/VjFCDtnmYRNbGExBGUguGYAL/BTQ==
X-Gm-Gg: AR+sD111gJSy6lDJ0dwehOqhJK7kvelXfNheLZlR40RAj+JclKVZWMrh8bn72NstXgq
	KZU6CRgeEqHcOm/85IdOfXqrr11P8fkmlGufqdv1QxroTW9hEJIEX9rjFURVUHDTUCYFBVvaesG
	wmfodBtmoWt2TYDIrayViEZ/GpGzpjdWqYV6LwI7HUmQ1znqQ24tPrqk+xDfYSSIXBEZzuPE4qv
	V/ghFDvQBdut9gsquWGjGxsh8rYUKcPbqGccHhEhYAh84u7TWexQq4tGL2LX/6dOH7lyJgFqgLs
	6lka8PQBLSehML3Yt4ilNrPA8yvXkxAhabNHKwIaNW6UNrWvWWaAJ+Yr7uZ40zDTQYs6fhdq30v
	rwqkBiVoXQLAiBmBh1NhrTErs7jFp0v5Gd1lCF8XTU+Dvs6BIRkUidO5Glc5F/l5cSNLIy6p4+Y
	x9h8KMnCY4+fcAERumzD8hw5pMjXKXYt1JgR39LeNMOD4ozQLl6UkMLPRWJurpdgECKjGCesyu+
	bLjzco0hgMbwJMfojZSJV854dxRWhhCi3VlH5f7uonGfOx9Wm73
X-Received: by 2002:a05:600c:4e0b:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49ce00540f1mr38527795e9.11.1788246441413;
        Tue, 01 Sep 2026 00:07:21 -0700 (PDT)
Message-ID: <0d04ad31-a733-4bb2-9e2c-50798de2b0f9@suse.com>
Date: Tue, 1 Sep 2026 09:07:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/39] xen/riscv: introduce csr_read64()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <0f7080ea4dc86a8bb3dae39d94e5b03e95d010c0.1787838835.git.oleksii.kurochko@gmail.com>
 <aded3bc6-6d5c-4c3f-879a-be428a8ad36a@citrix.com>
 <91ffbf33-0b54-406f-b91f-1a96afc616d7@gmail.com>
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
In-Reply-To: <91ffbf33-0b54-406f-b91f-1a96afc616d7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1788246441-182F49EA-44D6AC19/0/0
X-purgate-type: clean
X-purgate-size: 2752

On 31.08.2026 14:42, Oleksii Kurochko wrote:
> 
> 
> On 8/27/26 5:36 PM, Andrew Cooper wrote:
>> On 27/08/2026 4:20 pm, Oleksii Kurochko wrote:
>>> diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
>>> index 888d6a2a86d6..a5cdd6f99c8e 100644
>>> --- a/xen/arch/riscv/include/asm/csr.h
>>> +++ b/xen/arch/riscv/include/asm/csr.h
>>> @@ -39,12 +39,36 @@
>>>       csr_write(csr, v_);             \
>>>       csr_write(csr ## H, v_ >> 32);  \
>>>   })
>>> +
>>> +/*
>>> + * The two halves are read by separate instructions, so a CSR which hardware
>>> + * increments can carry from the low half into the high one in between,
>>> + * yielding a value the CSR never held. Re-read the high half and retry the
>>> + * sequence if it changed.
>>> + */
>>> +#define csr_read64(csr)                         \
>>> +({                                              \
>>> +    uint32_t hi_, lo_;                          \
>>> +                                                \
>>> +    do {                                        \
>>> +        hi_ = csr_read(csr ## H);               \
>>> +        lo_ = csr_read(csr);                    \
>>> +    } while ( hi_ != csr_read(csr ## H) );      \
>>> +                                                \
>>> +    ((uint64_t)hi_ << 32) | lo_;                \
>>> +})
>>
>> This double reads H in the looping case.  You want something more like:
>>
>> hi = csr_read();
>> do {
>>      old = hi;
>>      lo = csr_read();
>> } while ( (hi = csr_read()) != old );
> 
> Good point. I'll apply that.
> 
>>
>>
>> Still, this only matters for volatile CSRs, and is unnecessary in the
>> general case.  I'd suggest naming it csr_volatile_read64(). 
> 
> Yes, that makes sense. I will rename it to csr_volatile_read64().
> 
>> Most CSRs
>> can use a simple split access.
> 
> I may have misunderstood you here, but wouldn't it still make sense to 
> have a macro covering the case where a register is 64-bit on RV32 yet 
> accessed through two CSRs? VSIE and VSIEH, for example.
> 
> My plan was to use a single csr_read64() (but while loop then really 
> isn't needed in this case) call to abstract the access to VSIE, so that 
> the code looks the same on RV32 and RV64.
> 
> Does that make sense, or would it be better to have separate vsie and 
> vsieh fields instead?

For registers which can't change under your feet (or where both halves
are independent of one another) the simpler accessor form may still be
useful. And I really mean "change under your feet", i.e. "which
hardware increments" (as you have it in the comment) is really only a
subset of the cases where csr_volatile_read64() will need using.

Jan

