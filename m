Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D249C5DF80
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:29:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393653.1632468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFCJ-0002ZO-4h; Tue, 18 Aug 2026 08:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393653.1632468; Tue, 18 Aug 2026 08:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFCJ-0002ZH-11; Tue, 18 Aug 2026 08:29:27 +0000
Received: by outflank-mailman (input) for mailman id 1393653;
 Tue, 18 Aug 2026 08:29:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwFCH-0002YI-Bv
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:29:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFCG-0063jF-OV
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:29:24 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8417d6-8faa-0a2a0a5109dd-0a2a45079842-38
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:29:20 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8417e0-b4ea-0a2a45070019-d1558029b06e-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:29:20 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4954d29264cso21678455e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 01:29:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996100082sm301181995e9.2.2026.08.18.01.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 01:29:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1787041760; x=1787646560; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VcANKyrGAhQFs8JEyLNEdPsIOZJssOQGyQ8mwhhhccM=;
        b=WXIqE22KnuHE5rbB1B5rgnsynt6tqSXWpYiPix7XxF3bPOA80ILn9QlD1jsLUzehWu
         TjBVIhxoqDF8HJyoCxlDSKn9ej6wK7tqOfPdx+IQtlfac6GsctcmZ5BB5Q6rD9srmxP3
         CGsnNvbVhzm4w8Erze1/l023lTeI4HtHOrgLRWL6F4jx38wbc/s8r4rB5zomjthrn4Kt
         7qDu5ZOIHvGr/vjiTeMbao42/zxkBismrkp94KdEDMby1m1g1oPOobNAsdWYlgphfTOC
         SeOX3txY3Hw9WXW986wrsBhJCpNXseTjMBUzjgS6K0iXpUjoiGaf3MDRvWNEy7Ne8Fwz
         6Yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041760; x=1787646560;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VcANKyrGAhQFs8JEyLNEdPsIOZJssOQGyQ8mwhhhccM=;
        b=py5kIFDA97cgBoXE9QGXi+TTGuX9yjHMgdZ/KsqSLNb6elF/ggJvD0eYFdZl+8sgDw
         lK6nvvIw2+GazIj8anQZmKF0MlRWX1B5A7ICfmkV2J7Q8dnf1AbNj2hU0smvHIsgSSlD
         3IrIEDRlG55TtK2cneazKORYEGTgUgMGJ4Wrfv4HXDCuP3tNML73SFWAf2fMSoJpGngK
         Url8OLETHWMCKEYSndXXAp4BQpOHftcxlX8mK4WbPRKMrbs96swRYckCW8+moQ/gM4ZR
         EDY6QWFPXUkno2k7o1FPyuZ06LPiEYh4hE7BABg8GqCJT08GEh2RwpWZq2c36fTQzIZi
         cevQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFCpsQuRU5YMwb+V2bZ6UxBiFNmAXeIfVMir6i12V3Sd7YR9nT3q0DnU1p+4L6zmn6v8aSqdXQzrs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzbqf63OgOFFdtkzZ4IcIoUb4HwsLKmbPUSnqOHahj4XQDMx1CT
	FXbPtRrF9UPdfWmfnWIYz0deYmkPedUpjh1TEjNpyJRODJxmbtH+os1xZrubmOIkug==
X-Gm-Gg: AR+sD10Ad/IlP91VUiHpOeMHz5zbuZxCGz3pirit9AGenKNo1ranempDCnxCmhc5xCG
	5hVIVkd8CpdVqe/zbNTdx5vC3cxSfhMELHCGtuaMRRAynB5zk+/0H1AbnG6oTSJayRLuRU6Xs5V
	UKM9NYjPMuNppDsyfj7gaIJXCHTeU85Y8vg8fLg4xaokP6xZXJMsv8yprymO1Z+vmaPwzBQHcFQ
	PB+ll2yGt7+UiSH5V9BoPWZ+PYsa9dKClcsmnnr7jSNtdgTelrtQFuUqIkJrcJMrH/DEEVtabg2
	w6mudeTI2tNxYJ9kJKbFjcA4MZwyJDAywtz8tNA42B7qfCKty1PCalTHDyP+a9mHmIOrjf0xTdp
	bV6Ned41Me3YLlGHoop880fsGyNHv6+JFycdOYDxfextMvF3WN4w8YSEJkAkv9uMWZ58pLlKax/
	mYcMklBJ2hswg7xGTeyGJejMDDzQrsWC9qvNDy7nj3oLezzTpw8LdJaVMd1FChn3wZQQY+ojd1+
	VQUOg1QJQoJt6CEBs8hPJ4Mvrqh05W8azVA7sgJjLsoH10mKmdNe68R93viaTs=
X-Received: by 2002:a05:600c:c490:b0:495:4859:8f9b with SMTP id 5b1f17b1804b1-4999fb76fc2mr88466925e9.9.1787041760170;
        Tue, 18 Aug 2026 01:29:20 -0700 (PDT)
Message-ID: <f6e12465-dcd0-4f04-bdd4-8e1943e1ade7@suse.com>
Date: Tue, 18 Aug 2026 10:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/17] xen/riscv: add guest page fault handling stub
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <7ef8919f12c269d180a2b56a83218cc54e0e357c.1784560663.git.oleksii.kurochko@gmail.com>
 <ab3eb1be-ec62-42ae-8966-e2801752ce4f@suse.com>
 <61b9f565-7193-4192-9f57-1b4bd258fc11@gmail.com>
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
In-Reply-To: <61b9f565-7193-4192-9f57-1b4bd258fc11@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1787041760-350CDAE4-01FB4293/0/0
X-purgate-type: clean
X-purgate-size: 3572

On 17.08.2026 18:10, Oleksii Kurochko wrote:
> On 8/12/26 5:48 PM, Jan Beulich wrote:
>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/traps.c
>>> +++ b/xen/arch/riscv/traps.c
>>> @@ -191,6 +191,67 @@ static void timer_interrupt(void)
>>>       raise_softirq(TIMER_SOFTIRQ);
>>>   }
>>>   
>>> +static always_inline unsigned long get_faulting_gpa(void)
>>
>> May I suggest to use always_inline only when inlining is _functionally_
>> required?
> 
> Sure. But it ins't clear to me why it isn't a case here? Is it connected 
> to that function is static and too simple so a compiler will do by itself?

Counter question: What is it that would functionally break if the function
ended up not being inlined? (This is the question you generally need to
answer to justify use of always_inline. Of course there's the additional
case of performance being affected, but I don't view that as applicable
here; I'm open to be proven wrong, though.)

>>> +{
>>> +    /*
>>> +     * According to RISC-V spec:
>>> +     *  18.2.8. Hypervisor Trap Value Register (htval)
>>> +     *   ...
>>> +     *   A guest physical address written to htval is shifted right by 2 bits
>>> +     *   to accommodate addresses wider than the current XLEN.
>>> +     *   ...
>>> +     *   If the least-significant two bits of a faulting guest physical address
>>> +     *   are needed, these bits are ordinarily the same as the
>>> +     *   least-significant two bits of the faulting virtual address in stval.
>>> +     *   For faults due to implicit memory accesses for VS-stage address
>>> +     *   translation, the least-significant two bits are instead zeros. These
>>> +     *   cases can be distinguished using the value provided in register htinst.
>>> +     */
>>> +    return (csr_read(CSR_HTVAL) << 2) | (csr_read(CSR_STVAL) & 0x3);
>>
>> Well, okay, but instead of not losing the bottom two bits you're now losing
>> the top two ones.
> 
> Oh, right, I will add a cast ((uint64_t)csr_read(CSR_HTVAL) << 2) | ...
> 
> It will cover all the cases RV32 which has 34-bit guest address and it 
> will be enough for RV64 where GPA is 59bit (the highest possible for Sv59).

Only if the function return type then also changes.

>> Also the spec reads as if htval only _may_ hold the original address of the
>> faulting access. What if htval ends up 0?
> 
> good point. then we have to emulate fault instruction and get an address 
> from an instruction. I think that for now it will be enough just to 
> support platforms which always write GPA to HTVAL.
> 
> If I understand correctly if htval is supported by platform then htval 
> will be always filled for guest page fault. To verify if HTVAL is 
> supported we could do:
> 
> 'Unless it has reason to assume otherwise (such as a platform standard), 
> software that writes a value to htval should read back from htval to 
> confirm the stored value.'

How does this matter here? It's one thing for htval to be capable of
holding (all?) non-zero values, and another that it would always be
written. If the platform doesn't indicate the behavior, I fear you have
to assume that you may (perhaps even randomly) observe 0.

> And is it true because:
> ```
> A value of zero in mtval signifies either that the feature is not 
> supported, or an illegal zero instruction was fetched.
> ```
> (yes, it is about mtval but I asssume that htval has the same behaviour').

Right, but what you quote is specific to illegal instruction exceptions.

Jan

