Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE4BCA6019
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 14:20:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444444.1661302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFBS5-00045R-L1; Fri, 09 Oct 2026 14:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444444.1661302; Fri, 09 Oct 2026 14:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFBS5-00045K-Hg; Fri, 09 Oct 2026 14:20:01 +0000
Received: by outflank-mailman (input) for mailman id 1444444;
 Fri, 09 Oct 2026 14:20:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xFBS4-00045E-8g
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 14:20:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFBS3-002uaB-Hk
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 16:19:59 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac8f7f7-2eae-0a2a0a5409dd-0a2a4509ac44-36
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 16:19:59 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac8f80f-be1a-0a2a45090019-d155802dd4ac-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 16:19:59 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a02667ccebso32596355e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 07:19:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18f3b43efsm63270195e9.1.2026.10.09.07.19.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 07:19:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1791555599; x=1792160399; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFDohNVEqor8J343V/3mVqI5r1oMdKV/L3Us9FLV25Y=;
        b=YvAZCvRvrGBMXghfKh7hKtlZLfWTVXxd36wYvicZ8RP26ymECmdADaNTzpvYS24Od0
         6dZVCg8pRY4fEBtjPtbPVFGhScYybFq6wHBn0lL8X0jCLCw3nC3oZM5KBM49nu/1DxJd
         JvALtg0PClgEY8HCKtv0oFvocTTRVrxneSXpme0gpkE8HMibcVxI01giQtah+y2I4RKc
         bNxyLRVBq9WIgLwgiNA1zy/XKdhMBLQbQDdf0KAQATDF1s+AfDydrPqGK5Jb9ONF4gTl
         JdOjVlc63WcYsK6RIn7zra1Ij3pCseLY1RZafW9rhU9i4G+NNF5TMYXgmx/M8O22QWtm
         526Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791555599; x=1792160399;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zFDohNVEqor8J343V/3mVqI5r1oMdKV/L3Us9FLV25Y=;
        b=zVgQqcftOA5/NAaW/VpMd5bU9NmCzVYVu9LEkocinsCgGR+5xsp9HhlwbPe8XHSflm
         HKZpJ/XqwUn9+A8TBBGPdv1Q+2oMhPbjxSUTEK7UERJzzuxuKtyNFqXFbSYg6OFLM6Qb
         gc6ZFQ0gumlDV2YcJpXy+Eg/3TtrSD82e/KHwYS8hHJQNxcAS5nvqL72RiRV48W65QJI
         EC+6riFxtiJrOXCwNOLenxsTR1d2Wcw8SC65YyM6sZ2Xk4Pqve/K2dMk11UYSa2dtCGv
         n1NcJX70Tn4wYix/dsY8mfjQfJJ4HUmlEQgttt9tXIuF9+RPjH5v96EfW8cMLwD4zQt9
         WBZg==
X-Forwarded-Encrypted: i=1; AKwUvBxB3zt+vf9AZY6UJTJccgcdFoFpDId/0tXgdFf7gFt3Q2eST8m6MRQ6P1HiiGSQXkIoO4vMTcV26aM=@lists.xenproject.org
X-Gm-Message-State: AFuF++kCtxAzTKTwnaNK0lw9NIZx0KMmKBNrzikx8zzoD0Mhq0oETz/s
	dZREpJ1yUGvjhQhG5pFpCJvERruRPydPxJvy8GrnqMnqcX+l0FgD4rTeADBmlmkj8Q==
X-Gm-Gg: AYBFou0pkt7uNNy/3hNW3b1Rjk3mOk9l8jV37uxbbRz9Z5lJ2OcCuJzdxfBUVtFAmBv
	QNF6GqR/9pwtzryrl/BjBsIiWnUTeKPMI8bL6DOkdz9/OwwqFQhLcQcwFdA4KCGFt4H3wVR4XDE
	XpZDIcCzbyYigzRYpIgRW+66dl6xksOfLr4ea0hsH70oyVD7q0deZGSGjYebkZrXhKG/gB+jE+q
	1gZe/xbHXfPM8+S0fk4ABb59p+ta5/KI8LE5L2RRuMt/scERC6D5eM6GuiRUuJ4l4DNUF1N/5At
	7OTOtg9pbrK+NaK1ffCT2NHyAOkZLCKLaGXuoHC2i01b7SXS/aqt8Bj9hYIGqSIOWGqFlDO0R0m
	IE3EwckQlq3MNCn8s5L1tYNWBR2UpiEYDOYqXihEJ6LzIeyu1bRLc4KFUkwIYkulBs5vSSp47TT
	4N+8j02UUwtoaHkRXdop5Nhcjtrjr7+01Ssc30HmGjPQ2ZbLYMMcD3FD4TV6vyaG4PBQ+u6SpEh
	Fv0TGsWwWqETh5S+w0eIfGafjPGT4cBGbV7TKjW76Yy/InN964ZKpV1R4ZBJPU=
X-Received: by 2002:a05:600c:a010:b0:4a0:2500:2cd0 with SMTP id 5b1f17b1804b1-4a18e4b4646mr37620695e9.18.1791555598754;
        Fri, 09 Oct 2026 07:19:58 -0700 (PDT)
Message-ID: <25cfacf6-7e3b-4498-93c2-471ecd2ad655@suse.com>
Date: Fri, 9 Oct 2026 16:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/39] xen/riscv: introduce csr_volatile_read64()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <af8a07a676749b83cad27332e88bf433f98f22e1.1790779209.git.oleksii.kurochko@gmail.com>
 <ce03cd67-2175-4c89-a25e-95be2a85328f@suse.com>
 <a1328bd1-7a7d-4abd-90e3-38df9fe57efa@gmail.com>
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
In-Reply-To: <a1328bd1-7a7d-4abd-90e3-38df9fe57efa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1791555599-BD4C3034-99518A7B/10/78276251493
X-purgate-type: spam
X-purgate-size: 3872

On 09.10.2026 16:00, Oleksii Kurochko wrote:
> On 10/8/26 4:46 PM, Jan Beulich wrote:
>> On 30.09.2026 18:18, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/csr.h
>>> +++ b/xen/arch/riscv/include/asm/csr.h
>>> @@ -39,12 +39,39 @@
>>>       csr_write(csr, v_);             \
>>>       csr_write(csr ## H, v_ >> 32);  \
>>>   })
>>> +
>>> +/*
>>> + * The two halves are read by separate instructions, so a CSR which hardware
>>> + * increments can carry from the low half into the high one in between,
>>> + * yielding a value the CSR never held. Re-read the high half and retry the
>>> + * sequence if it changed.
>>> + *
>>> + * Only needed for CSRs which change under Xen's feet.
>>> + */
>>> +#define csr_volatile_read64(csr)                    \
>>> +({                                                  \
>>> +    uint32_t hi_, lo_, old_;                        \
>>> +                                                    \
>>> +    hi_ = csr_read(csr ## H);                       \
>>
>> This could be the initializer of the variable.
>>
>>> +    do {                                            \
>>> +        old_ = hi_;                                 \
>>> +        lo_ = csr_read(csr);                        \
>>> +    } while ( (hi_ = csr_read(csr ## H)) != old_ ); \
>>> +                                                    \
>>> +    ((uint64_t)hi_ << 32) | lo_;                    \
>>> +})
>>>   #else
>>>   #define csr_write64(csr, val)       \
>>>   ({                                  \
>>>       csr_write(csr, val);            \
>>>       (void)csr ## H;                 \
>>
>> While I notice the same exists here already, I wonder what the purpose of
>> this and ...
> 
> I can drop it in separate patch. The purpose was just for the symmetry 
> with RV32 case.
> 
>>
>>>   })
>>> +
>>> +#define csr_volatile_read64(csr)    \
>>> +({                                  \
>>> +    (void)csr ## H;                 \
>>
>> ... this is (and why their placements differ). Generally a pure 64-bit
>> environment would have no need for these ...H constants, and their
>> availability looks to be all that's checked for here. As Baptiste did
>> point out on patch 11, these uses constitute Misra violations, which we
>> then would need to deviate. I think we want to try to limit the number of
>> needed deviations.
> 
> If I understood MISRA Rule 20.12 correctly (Baptiste pointed me to it on
> patch 11), the issue is that the csr parameter is used both as an operand
> of ## and in ordinary, macro-expanded context.
> 
> I think it would be better to just rewrite these macros so that no
> deviation is needed:
> 
> #ifdef CONFIG_RISCV_32
> #define csr_write64(name, val)                  \
> ({                                              \
>      uint64_t v_ = (val);                        \
>      csr_write(CSR_ ## name, v_);                \
>      csr_write(CSR_ ## name ## H, v_ >> 32);     \
> })
> 
> #define csr_read64(name)                        \
> ({                                              \
>      uint64_t v_ = csr_read(CSR_ ## name ## H);  \
>                                                  \
>      (v_ << 32) | csr_read(CSR_ ## name);        \
> })
> /* csr_volatile_read64() similarly */
> #else
> #define csr_write64(name, val)      \
> ({                                  \
>      csr_write(CSR_ ## name, val);   \
>      (void)CSR_ ## name ## H;        \
> })
> ...
> #endif
> 
> For RV64, '(void)CSR_ ## name ## H;' could be dropped altogether, and
> csr_volatile_read64() would be reworked in the same way.
> 
> IIUC, with such definitions there is no violation of MISRA Rule 20.12.

That's my understanding, too. So afaic - yes please (preferably with the
casts to void of the *H constants also dropped).

Jan

