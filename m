Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED4CC5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 10:30:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393924.1632730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwH5j-0002zz-BD; Tue, 18 Aug 2026 10:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393924.1632730; Tue, 18 Aug 2026 10:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwH5j-0002zs-7V; Tue, 18 Aug 2026 10:30:47 +0000
Received: by outflank-mailman (input) for mailman id 1393924;
 Tue, 18 Aug 2026 10:30:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwH5i-0002zm-7D
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:30:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwH5h-00Ctdv-K5
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 12:30:45 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a84344b-bab6-0a2a0a5309dd-0a2a450887e2-36
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:30:45 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a843455-f659-0a2a45080019-d155dd2ae149-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 12:30:45 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so3875522f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 03:30:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a6c449dbsm10260610f8f.8.2026.08.18.03.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 03:30:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1787049045; x=1787653845; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJfs0zmMOm8zObf9eEZAFlFoq7G6tNcIx2OxBTDpWRk=;
        b=eu/2KuOuIkzINUEQV7b0Sf72thg7JLFLRmy5AuSBH189lDo6ewvcTqOU9vOBCt3J5V
         3yZL1EmcgsSrL3JH8Kp/E7fp+iWAcqBXE3qxzg+yD/NpoQcDOPKWIuESOEu2qjULt7ni
         HB7QJJhVpUkeAXvAzP7u2TM1COzRv9WGZvx3VpiFBk8w3WGo1utSz4cJFXsX6hAPojnp
         0PRw2ucf2F8GWs+fu609IEISy0K+P888xTgon0w4Wa8KliaPO3yV6cw563SwcOct3rFa
         242EASe/P/v1H2IxwdlWEzX30bMuCH8Ef156GajnEbw+Rg/d/8VqCdJjPomffoJTFX+N
         qdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049045; x=1787653845;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jJfs0zmMOm8zObf9eEZAFlFoq7G6tNcIx2OxBTDpWRk=;
        b=g4p1ejrfbym1BwcGDjmmzME7MONdTm4lOU2+PB/iiqwI50twmyx1qTsUitAKawzSVq
         I+ea1HfKiUbpILuESS9JgFkaEj0oQz9dbmPGw7W/dL8OX7BDPGZCpC0wkrOt8XMmWBiV
         S208oVEcoYtnr7EPsMbWMeDcH+SgtOLIcriEADlpvGQw5xvg/wjdG7+6uhOinpa0YvPU
         uhKns7If7O0Ah6WjLYSWHQWLpHMcjSeo2axlABy5nikx56FJjIfwKXgVP6spwMxAWF1C
         oMTf5gG5aXUEdywlICHonhNmgB3xwiMAD5ZxPQ+RxcAm7fRLvRt23bPlnwhByvFQbq+8
         b2hA==
X-Forwarded-Encrypted: i=1; AHgh+RrGJCOrIGjUaGa/AHtbsBZXpSlMdFyzPyitT+p23XZrSa3AspmQJAWaj3+ligSH1JANgMpAqSOpjuc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyq1N8En4qS+Ge/HYQM+VsANbwb4oUgfC7qoVS82qirmJ80CSXU
	Y+hpaNotj7edDosRbkt7MvfHG/vqzGh9iW31xreILf6UN/nBtb/4yvXtERiRERNdFA==
X-Gm-Gg: AR+sD12sGfKI4CblGjHwT2fXYpLR2FEYUrVi10UQUhOa8DtdkZMfUhbJnZfBcGrkIhn
	ghNi5jrOI3IGtEy/eeoSaWFLBw/qhUaRAf8BD0UKbjIUNN3CIpIgPDy50uMI5VD1hfF0qByNoXy
	oebt7T6slii7lyjIXJHthNPigXfWaqfHpTiPDywVVMOQrsy2X+xrDzsGZN2n2WBXKE2Ov6pk9ew
	kBG9R5owalZ4c6nZNFMEvjU2hhlwWnMaVy/ejkB3MewgsToYKtOzItWiKA/QesHVyh46Fz0Q8a3
	N5FVPzWtMrCh4nkkEobDTZO+Av0gikq63gFn3feAYRnluNnygNK6LNaW7yPeI1uq0NV80qK3BTr
	182HNJILfDEsxHLzulN7Wo8aSxrPTcq2hCf0l6NOOlXDLG/aM5nsCXlLv1BIYrKkvneipKIDU0w
	BOjGfJPy6fsuuQqkZpYHBiLT5k8/hNfBxWw2K12la2qm4AuFiiiyqU0x4C7EQVTFCVRM9vIVvXb
	czJiNEextZeVcxH73sv7GYvKZAY2Xpw1UxzTjpcHxfXD3T28eJE
X-Received: by 2002:a05:6000:3109:b0:47f:e748:3ae3 with SMTP id ffacd0b85a97d-4816070bf1fmr48632766f8f.3.1787049044931;
        Tue, 18 Aug 2026 03:30:44 -0700 (PDT)
Message-ID: <b3cfe45c-9d44-48b9-98d2-8682aa062184@suse.com>
Date: Tue, 18 Aug 2026 12:30:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/17] xen/riscv: extend exception tables with type and
 data fields
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <1eb9050ff6632f91682151471440990bd718ed90.1784560663.git.oleksii.kurochko@gmail.com>
 <be932384-6661-4c92-9137-8f6a9cd54057@suse.com>
 <3c9ef195-a8d4-489c-8daf-5635d3b53063@gmail.com>
 <b8b794ec-c86a-4a82-9d3a-b3ffcaa802f3@suse.com>
 <4a707c58-2225-477f-936e-9f99ae616c44@gmail.com>
 <eabb8190-51a9-4c25-b377-c25cd23af044@suse.com>
 <5005ead1-b7e2-4edc-8359-c2a9a89e5b4d@gmail.com>
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
In-Reply-To: <5005ead1-b7e2-4edc-8359-c2a9a89e5b4d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1787049045-CED4087B-7CBF197B/0/0
X-purgate-type: clean
X-purgate-size: 5115

On 18.08.2026 11:40, Oleksii Kurochko wrote:
> On 8/18/26 11:26 AM, Jan Beulich wrote:
>> On 18.08.2026 11:14, Oleksii Kurochko wrote:
>>> On 8/18/26 9:56 AM, Jan Beulich wrote:
>>>> On 17.08.2026 13:33, Oleksii Kurochko wrote:
>>>>> On 8/12/26 4:37 PM, Jan Beulich wrote:
>>>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>>>> @@ -60,6 +68,40 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
>>>>>>>         regs->sepc = ex_fixup(ex);
>>>>>>>     }
>>>>>>>     
>>>>>>> +static inline unsigned long regs_get_gpr(struct cpu_user_regs *regs,
>>>>>>> +                                         unsigned int offset)
>>>>>>> +{
>>>>>>> +    /*
>>>>>>> +     * The GPR number -> offset arithmetic below relies on x0..x31 being
>>>>>>> +     * laid out at the start of struct cpu_user_regs in architectural
>>>>>>> +     * order.
>>>>>>> +     */
>>>>>>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, ra) !=
>>>>>>> +                 sizeof(unsigned long));
>>>>>>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, t6) !=
>>>>>>> +                 31 * sizeof(unsigned long));
>>>>>>> +
>>>>>>> +    if ( unlikely(!offset || (offset > MAX_REG_OFFSET)) )
>>>>>>> +        return 0;
>>>>>>
>>>>>> And an offset not divisible by sizeof(unsigned long) is okay?
>>>>>
>>>>> No, it isn't okay. I will apply your comment ...
>>>>>
>>>>>>
>>>>>> Returning 0 as error indicator also feels fragile.
>>>>>
>>>>> With what I suggested below returning could be just dropped.
>>>>>
>>>>>>
>>>>>>> +    return *(unsigned long *)((unsigned long)regs + offset);
>>>>>>> +}
>>>>>>> +
>>>>>>> +static void ex_handler_trap_info(const struct exception_table_entry *ex,
>>>>>>> +                                 struct cpu_user_regs *regs)
>>>>>>> +{
>>>>>>> +    struct trap_info *trap_info =
>>>>>>> +        (struct trap_info *)regs_get_gpr(regs, ex->data * sizeof(unsigned long));
>>>>>>
>>>>>> Related to the earlier comment: Simply pass just ex->data here, leaving the
>>>>>> multiplication to regs_get_gpr()?
>>>>>
>>>>> ... It would be better to move the multiplication inside regs_get_gpr().
>>>>>
>>>>> Your comment made me think about whether the multiplication is needed at
>>>>> all (regardless of where it is done). In other words, ex->data contains
>>>>> the register number, so we could just write:
>>>>>
>>>>> static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
>>>>>                                      unsigned int num)
>>>>> {
>>>>>        /*
>>>>>         * The GPR number -> offset arithmetic below relies on x0..x31 being
>>>>>         * laid out at the start of struct cpu_user_regs in architectural
>>>>> order.
>>>>>         */
>>>>>        BUILD_BUG_ON(offsetof(struct cpu_user_regs, ra) != sizeof(unsigned
>>>>> long));
>>>>>        BUILD_BUG_ON(offsetof(struct cpu_user_regs, t6) != 31 *
>>>>> sizeof(unsigned long));
>>>>>
>>>>>        ASSERT(num && (num < 32));
>>>>>
>>>>>        return ((const unsigned long *)regs)[num];
>>>>> }
>>>>>
>>>>> Probably, we want to consider this function out of context (for now
>>>>> context is that we use it to recieve a pointer to trap_info which can't
>>>>> be obviously stored in x0 as it should be always hardwired zero). In
>>>>> that case, there is no need to check that num is 0.
>>>>>
>>>>> So, it probably makes sense to just have:
>>>>>      ASSERT(num < 32);
>>>>>
>>>>> ASSERT() is fine here as I don't think that compiler will use incorrect
>>>>> number during register allocation.
>>>>
>>>> I agree.
>>>>
>>>> However, the x0 aspect is still odd. Why again is it that struct cpu_user_regs
>>>> has a field for it, when the register value is always 0?
>>>
>>> zero field isn't there to hold a value, it's there so the first 32 slots
>>> form an x0..x31 array indexed by GPR number. It is useful for SET_RD()
>>> implementation, for example.
>>
>> But SET_RD() will need to avoid touching .zero anyway. Why waste the space,
>> when something useful can be put there?
> 
> For SET_RD() agree, it doesn't make sense. Bad example. But it could be 
> somehow a "protection" to not clobber something useful if SET_RD 
> arguments won't handled correctly.
> 
> SET_RD() is only half of it. The read accessors matter more: sd x0, 
> 0(a0) to an MMIO address is the normal way a guest writes 0 to a device 
> register, and emulate_store() fetches the operand with GET_RS2(), which 
> is a plain index by register number.

Oh, wow, how fragile. Without a bright comment in struct cpu_user_regs, one
should be permitted to move fields around or insert new ones at arbitrary
positions. That comment would then also help clarify why "zero" is there as
a field.

> If something useful lived at offset 
> 0, that store would hand the device that value instead of zero. So 
> whatever we put there would have to survive being read as a source 
> operand and being clobbered by SET_RD(), which means nothing can go there.

But you can't use it as (reliable zero) source when you allow SET_RD() to
clobber it.

Jan

