Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57887C5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 09:26:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393819.1632640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwG5R-00045r-KE; Tue, 18 Aug 2026 09:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393819.1632640; Tue, 18 Aug 2026 09:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwG5R-00045k-Gh; Tue, 18 Aug 2026 09:26:25 +0000
Received: by outflank-mailman (input) for mailman id 1393819;
 Tue, 18 Aug 2026 09:26:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwG5Q-00045e-UT
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:26:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwG5Q-0028EO-B2
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:26:24 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a842530-e002-0a2a0a5209dd-0a2a45018608-28
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:26:24 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a842540-5984-0a2a45010019-d1558035c40d-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:26:24 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4954df200ddso31225805e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 02:26:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d10be27sm143981755e9.14.2026.08.18.02.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 02:26:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1787045184; x=1787649984; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jEgNroY0JsJnddGsmWEYJrQYgdk5+i9LPOWctWmuOH8=;
        b=NmQ3RrxzQUo6fDDgeVyHuLZc1U241Hl10WGPTCRRnrvk3hg6jVdg34UAr1/fLz5+dF
         s8G4h6T0BjiJyD6cbiRogp43s/ZnNKgK1x1x5kUr5NNkhK7qJM1sq00fq4/MTqQrt87F
         K0m7ghGpPEan3b1Zh0LYOb4L/AcsShEFlYhPhoPYeD3KG4FUusLQzPffN6++MP0JknS9
         b9lZjAY1m+e8JEg0K1c796El2K4F8QZ5STECeik6AsybYKfOWkUbSZjj+HWAbf/MIyHj
         V5KlEV4zCZibJsTlgMDGVVmQV2ipSDSBw8KXCj5BKCwxOUnDgL8bT59nuSoUDX7PROLb
         I/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045184; x=1787649984;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jEgNroY0JsJnddGsmWEYJrQYgdk5+i9LPOWctWmuOH8=;
        b=XH+q+vIbZYRBXuWrAajv/IbAyFhQCxfTIbiPhQZYvy0xeZTE6zFqad0mxds3+syNtQ
         G5APX2y+lSdrOlpeY8eKTreoAwBVnEcLSbfAINtU8j4IRIj0P6/Hb6DIl4ersruaJcWn
         my6CBW3uwpfCkBV0cckSN5T+Oa3Ym7Dpvi0JyneucZrVoIhLtGr7ijLJ/BDD1M8IuTnd
         O1bu+d36spHYYZN22uF09SDn622VeRG5ogQgbyymtTOop97Q443nHTsZZiE1/nNi2vUo
         rpFvl8JGAlsv8/tVbkSJjE98nR8BYFfS6SbP/cJ6UxmaIoxylS9Odk6eXlDt2zd8rOnF
         4sAg==
X-Forwarded-Encrypted: i=1; AHgh+RoPg2e5tWTdej1/t4GmLt37AfXLsA9ls0IKRaYrM4ibvoA40xjGLy1FzHPTr1wJ2IFLWBvKCscumc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpSx47V+BSYDoU/iXzKQw9XJAd9a9ego7ahcS9yzSLXifl9HcJ
	RVzIgpoLTDrraFu9Tavoiazw8WG5he4Fi0+6V6HeA4sGzrXjIF/so6waaY/IzxvN8w==
X-Gm-Gg: AR+sD12rohgyowCqDuNFoIv/M7CpJbpPlrk6dQGootpQQUkjje3xaFbPttwcuzPtAO7
	PgHombY3wEK4EEAGaz8+xDoQ1n+Nx0gvYPqtm6RGrYGGHgw/WFDvpqcFsrJCdtKbt2lGJ6HZk11
	TWjTNhxtg46mJUaPlMWTKh81Xr3Opg9pfoqTU6HJWPfFfMEFsPIgkLkDE5zx3O+mpCWNXpxlUET
	tI7joYZKyMANZw5BwJc2ZB4zB+QHpmEPmg1Dx6v+zBxxWgr+8drC6lWDAqNwqz7Nlw8e9OBtwfd
	Woe6ksXERIV1ppD1m2NHZB1VhJTbR1rT+LrMZ1wf6C8YeGaAsQxQQL14fiNhCx++13J1gUr7Zha
	PK0+y84f+wlcNlkckRBLMMZhkVQ2WdAK8XNykkn7J+htN2o4WVULeK319PL1CkzYT8VtM+XvXbH
	jX3Uu2e5j6s2LjmSjVxgGDgJix3pKJLQOC3VC81nrq8TSGOk25lfGv3PbOE3+P8jiejdOGXgXMM
	AhJEZHvkOAJvyTulYVnOnRQfob6jPKM8HVSHX3vb+mKO7e6igEN
X-Received: by 2002:a05:600c:3049:b0:499:781e:25fc with SMTP id 5b1f17b1804b1-4998792e359mr333704495e9.3.1787045183695;
        Tue, 18 Aug 2026 02:26:23 -0700 (PDT)
Message-ID: <eabb8190-51a9-4c25-b377-c25cd23af044@suse.com>
Date: Tue, 18 Aug 2026 11:26:22 +0200
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
In-Reply-To: <4a707c58-2225-477f-936e-9f99ae616c44@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1787045184-1E07B757-EEF9512C/0/0
X-purgate-type: clean
X-purgate-size: 3780

On 18.08.2026 11:14, Oleksii Kurochko wrote:
> On 8/18/26 9:56 AM, Jan Beulich wrote:
>> On 17.08.2026 13:33, Oleksii Kurochko wrote:
>>> On 8/12/26 4:37 PM, Jan Beulich wrote:
>>>> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>>>>> @@ -60,6 +68,40 @@ static void ex_handler_fixup(const struct exception_table_entry *ex,
>>>>>        regs->sepc = ex_fixup(ex);
>>>>>    }
>>>>>    
>>>>> +static inline unsigned long regs_get_gpr(struct cpu_user_regs *regs,
>>>>> +                                         unsigned int offset)
>>>>> +{
>>>>> +    /*
>>>>> +     * The GPR number -> offset arithmetic below relies on x0..x31 being
>>>>> +     * laid out at the start of struct cpu_user_regs in architectural
>>>>> +     * order.
>>>>> +     */
>>>>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, ra) !=
>>>>> +                 sizeof(unsigned long));
>>>>> +    BUILD_BUG_ON(offsetof(struct cpu_user_regs, t6) !=
>>>>> +                 31 * sizeof(unsigned long));
>>>>> +
>>>>> +    if ( unlikely(!offset || (offset > MAX_REG_OFFSET)) )
>>>>> +        return 0;
>>>>
>>>> And an offset not divisible by sizeof(unsigned long) is okay?
>>>
>>> No, it isn't okay. I will apply your comment ...
>>>
>>>>
>>>> Returning 0 as error indicator also feels fragile.
>>>
>>> With what I suggested below returning could be just dropped.
>>>
>>>>
>>>>> +    return *(unsigned long *)((unsigned long)regs + offset);
>>>>> +}
>>>>> +
>>>>> +static void ex_handler_trap_info(const struct exception_table_entry *ex,
>>>>> +                                 struct cpu_user_regs *regs)
>>>>> +{
>>>>> +    struct trap_info *trap_info =
>>>>> +        (struct trap_info *)regs_get_gpr(regs, ex->data * sizeof(unsigned long));
>>>>
>>>> Related to the earlier comment: Simply pass just ex->data here, leaving the
>>>> multiplication to regs_get_gpr()?
>>>
>>> ... It would be better to move the multiplication inside regs_get_gpr().
>>>
>>> Your comment made me think about whether the multiplication is needed at
>>> all (regardless of where it is done). In other words, ex->data contains
>>> the register number, so we could just write:
>>>
>>> static unsigned long regs_get_gpr(const struct cpu_user_regs *regs,
>>>                                     unsigned int num)
>>> {
>>>       /*
>>>        * The GPR number -> offset arithmetic below relies on x0..x31 being
>>>        * laid out at the start of struct cpu_user_regs in architectural
>>> order.
>>>        */
>>>       BUILD_BUG_ON(offsetof(struct cpu_user_regs, ra) != sizeof(unsigned
>>> long));
>>>       BUILD_BUG_ON(offsetof(struct cpu_user_regs, t6) != 31 *
>>> sizeof(unsigned long));
>>>
>>>       ASSERT(num && (num < 32));
>>>
>>>       return ((const unsigned long *)regs)[num];
>>> }
>>>
>>> Probably, we want to consider this function out of context (for now
>>> context is that we use it to recieve a pointer to trap_info which can't
>>> be obviously stored in x0 as it should be always hardwired zero). In
>>> that case, there is no need to check that num is 0.
>>>
>>> So, it probably makes sense to just have:
>>>     ASSERT(num < 32);
>>>
>>> ASSERT() is fine here as I don't think that compiler will use incorrect
>>> number during register allocation.
>>
>> I agree.
>>
>> However, the x0 aspect is still odd. Why again is it that struct cpu_user_regs
>> has a field for it, when the register value is always 0? 
> 
> zero field isn't there to hold a value, it's there so the first 32 slots 
> form an x0..x31 array indexed by GPR number. It is useful for SET_RD() 
> implementation, for example.

But SET_RD() will need to avoid touching .zero anyway. Why waste the space,
when something useful can be put there?

Jan

