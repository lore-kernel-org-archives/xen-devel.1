Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DC9C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 06:24:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382831.1626108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrV3C-0005kA-8E; Wed, 05 Aug 2026 06:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382831.1626108; Wed, 05 Aug 2026 06:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrV3C-0005k3-4S; Wed, 05 Aug 2026 06:24:26 +0000
Received: by outflank-mailman (input) for mailman id 1382831;
 Wed, 05 Aug 2026 06:24:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrV3A-0005jx-R2
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 06:24:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrV38-005ySU-NT
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:24:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72d709-5cb7-0a2a0a5109dd-0a2a4508c4ec-24
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 08:24:22 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72d716-f659-0a2a45080019-d1558034e9bb-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 08:24:22 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso3486835e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 23:24:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4994e0356d4sm66585515e9.10.2026.08.04.23.24.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 23:24:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1785911062; x=1786515862; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYw3nMG1tYUoCk6J6SHQzZAAsmfDb/DNYKs0P2jRYvU=;
        b=BKw+klG0iOZHY7/p6fSGWI9gIoLKUs1y3OmBVDlbHJUKdunninKJRXFF54d7IXhk4X
         nzEQLwUthSQfbUZaNMNHcNVp8BIysHX+gmf1LoxNr4hDCuukfhIr5wn2yPHkqULhGI0H
         HgLzR0UehJaGJS7aPsJElBrSbkMwm9tEOP8TCBgzhaKPb/DRexD4T7dpw2/i3gmoaxnc
         mUDObE5c7rdk5o1w0Pt4V2C+cFg36rgEBFC4Rj4UYFUZx+OySY55yNxR/JFLwB/Cp3X3
         7xNH2FCoxhs8MQu3PY5RhZsn28Kz0GbmNw/S5ZQRjzud1DjHU9zjMFfNfptfOiZoNh/r
         L8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785911062; x=1786515862;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tYw3nMG1tYUoCk6J6SHQzZAAsmfDb/DNYKs0P2jRYvU=;
        b=Mtg0wE63BuVG6d8R/+TqaZzrLjVcoYC/WYTiAtAd4LrkHIpZ1Z6TDtMpx7gICsY+bJ
         fdGr1DIAe8/tCDHXgUoEpIhTm5JJYmLpHuCWdu7VIu/JNYL2yeJuAFx0HZDx9+0JzE9/
         ML2eg2zP2bJIww9Ctc+h8+xLJlsFFQJ5TDACJqnfn9h4g22G/9QrDjaKY8L3G8j3jQ6n
         phsVwe65x+lE0tTdCXpioOvOrcHvL9ENcjieySp8Wbaezdrl72nOriDs6rCnUu8hmwaF
         2yLuqSE/rbsxGG/gEizkGalOFoUrM8Ypc7mDnYgxuCFMvaB+c9Zd6CN9tdSDovh3ZMIV
         EsxQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIDiufsIns3wDkRvCO9IiGGj/5jbLs6ZyrqUtq0xZzusMfhS/2BXg9rInQVleeNdVHqmLXczQXsgQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycAXbT2Vvw+Om3C6awHVdVu0zMXUXZzubJMSOIKCWsTll9uqGn
	TE/V9I8Ikmn1Vl9WXBrkXo3Fdeb5h+NCg1whuKoK9M0ccH4JgJO7j+5MPhBTtejQNA==
X-Gm-Gg: AR+sD1165FJ64qxUhY7ODPgmZmd93tlY2O9wHN88siVX42EhOfNmSjpvWv83PectX0z
	HqAGmmtnhLf4RWeH1AGazWFOYNXnNiB8j6c9dpgFsuvY6zmRTxwcnqF5FRjf+ck4D0fGjgndyIz
	Xy4DeSF9MQheP4ST3AndccJd8n+cBRkanaZy7AAJzqf/poVb66Z5BgyQcgfS6iFtIlX1DTJRAzW
	Qnf32P+ZZ6YdsWqYZyzLuvx7PW6frj+/5ewHPhlPXaRXydub3+bHkvizQ4wH8XAsiY+UMHGIDlI
	VfNUAB3H3qWIeBRnGL5FYgNymciQq/FGNBXd5Wxa+U6fTj7HYvyI56Feu+3d0HwY07xxSZ9M0n/
	hP38PasfYzj1TWO1/bQd9KLrQ9P72oWcn6eTMvRX3PMyWRx0oadDyBZhfPYnkLeC8FRkNHVwdGL
	cgtIRg7+Jd+vUG6MJhIyf+5o1Pr6ygf79vcUFRhoupEZqXoWo86cLLha0DfJNxvDpxIcXiRlCgG
	HV/o1xX11JkPfUiDB9/7XRpLSDl8ytQv4i3pJmz5xJhOHL1OpQyJGyubbcVhyM=
X-Received: by 2002:a05:600c:529b:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-4994e71d3e5mr47925195e9.8.1785911061197;
        Tue, 04 Aug 2026 23:24:21 -0700 (PDT)
Message-ID: <205b4024-c42f-48b6-a106-913b06485e53@suse.com>
Date: Wed, 5 Aug 2026 08:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] x86/emul: Introduce x86_decode_lite()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260803072006.9678-1-andrew.cooper3@citrix.com>
 <20260803072006.9678-2-andrew.cooper3@citrix.com>
 <01b27228-fdc0-4546-aa23-2bcdafb22727@suse.com>
 <1e1a1c4d-5ffc-44b1-b26c-244c9af1f250@citrix.com>
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
In-Reply-To: <1e1a1c4d-5ffc-44b1-b26c-244c9af1f250@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1785911062-D6F5F87B-3799B6E3/0/0
X-purgate-type: clean
X-purgate-size: 8566

On 04.08.2026 20:56, Andrew Cooper wrote:
> On 03/08/2026 4:26 pm, Jan Beulich wrote:
>>> +        [0x50 ... 0x5f] = (Known),             /* PUSH/POP %reg */
>>> +
>>> +        [0x62]          = 0,                   /* BOUND, but also EVEX prefix, not implemented. */
>>> +        [0x63]          = (Known|ModRM),       /* MOVSxd */
>>> +
>>> +        [0x68]          = (Known|Imm),         /* PUSH $imm */
>>> +        [0x69]          = (Known|ModRM|Imm),   /* IMUL $imm */
>>> +        [0x6a]          = (Known|Imm8),        /* PUSH $imm8 */
>>> +        [0x6b]          = (Known|ModRM|Imm8),  /* PUSH $imm8 */
>>> +        [0x6c ... 0x6f] = (Known),             /* INS/OUTS */
>>> +        [0x70 ... 0x7f] = (Known|Branch|Imm8), /* Jcc disp8 */
>>> +        [0x80]          = (Known|ModRM|Imm8),  /* Grp1 */
>>> +        [0x81]          = (Known|ModRM|Imm),   /* Grp1 */
>>> +
>>> +        [0x83]          = (Known|ModRM|Imm8),  /* Grp1 */
>>> +        [0x84 ... 0x8e] = (Known|ModRM),       /* TEST/XCHG/MOV/MOV-SREG/LEA */
>>> +        [0x8f]          = 0,                   /* Grp1A - POP but also XOP prefix, not implemented. */
>> POP doesn't look all that unlikely to be used in inline assembly, and
>> hence in alternatives. That said, of course using it with a memory
>> operand requires quite a bit of care.
> 
> We have no alternatives playing with the stack (beyond CALL
> instructions), and no alternatives which have any net %rsp delta.
> 
> PUSH/POP MEM are rare in general and Xen doesn't have any at all.

Well, okay then. Nevertheless I'd like to mention that the encoding can
also be used for REG forms. If needed for size reasons, that may or may
not be more efficient than adding a NOP or no-op prefix.

>>> +        [0x90 ... 0x99] = (Known),             /* NOP/XCHG %rAX/CLTQ/CQTO */
>>> +
>>> +        [0x9b ... 0x9f] = (Known),             /* FWAIT/PUSHF/POPF/SAHF/LAHF */
>>> +        [0xa0 ... 0xa3] = (Known|Moffs),       /* MOVABS */
>>> +        [0xa4 ... 0xa7] = (Known),             /* MOVS/CMPS */
>>> +        [0xa8]          = (Known|Imm8),        /* TEST %al */
>>> +        [0xa9]          = (Known|Imm),         /* TEST %rAX */
>>> +        [0xaa ... 0xaf] = (Known),             /* STOS/LODS/SCAS */
>>> +        [0xb0 ... 0xb7] = (Known|Imm8),        /* MOV $imm8, %reg */
>>> +        [0xb8 ... 0xbf] = (Known|Imm),         /* MOV $imm{16,32,64}, %reg */
>>> +        [0xc0 ... 0xc1] = (Known|ModRM|Imm8),  /* Grp2 (ROL..SAR $imm8, %reg) */
>>> +
>>> +        [0xc3]          = (Known),             /* RET */
>>> +        [0xc4 ... 0xc5] = 0,                   /* LES/LDS but also VEX prefixes, not implemented. */
>> This may bite us sooner or later, due to the VEX-encoded integer insns
>> that there are. Of course as long as we don't use this function on
>> compiled code, and as long as my "x86: allow Kconfig control over psABI
>> level" doesn't come close to going in, that's merely a theoretical
>> concern.
>>
>> Same goes for not supporting the 3-byte opcodes, which also encode
>> certain integer insns.
> 
> I have no doubt that we're going to need to add support eventually.
> 
> But,
> a) I don't have time right now
> b) We have real bugs/limitations right now needing this functionality to
> address (patch 5, and the xsave fixes, and bus lock trap enablement)
> c) GitlabCI will reliably notice any new alternative instructions that
> this can't decode (patch 3)
> d) This function is a fastpath during the alternatives patching critical
> region (patch 4)
> 
> Option d alone is a good reason not to decode VEX prefixes yet.

Personally I think a is most relevant. As said in the later reply, once
we start using MSR-IMM insns, at least VEX3 map 7 will need decoding
anyway.

>>> +        [0xe4 ... 0xe7] = (Known|Imm8),        /* IN/OUT $imm8 */
>>> +        [0xe8 ... 0xe9] = (Known|Branch|Imm),  /* CALL/JMP disp32 */
>>> +
>>> +        [0xeb]          = (Known|Branch|Imm8), /* JMP disp8 */
>>> +        [0xec ... 0xef] = (Known),             /* IN/OUT %dx */
>>> +
>>> +        [0xf1]          = (Known),             /* ICEBP */
>>> +
>>> +        [0xf4]          = (Known),             /* HLT */
>>> +        [0xf5]          = (Known),             /* CMC */
>>> +        [0xf6 ... 0xf7] = (Known|ModRM),       /* Grp3, Further ModRM decode */
>>> +        [0xf8 ... 0xfd] = (Known),             /* CLC ... STD */
>>> +        [0xfe ... 0xff] = (Known|ModRM),       /* Grp4 */
>>> +    };
>>> +    static const uint8_t init_or_livepatch_const twobyte[256] = {
>>> +        [0x00 ... 0x03] = (Known|ModRM),       /* Grp6/Grp7/LAR/LSL */
>> Leaving out INVD is surely find, but WBINVD?
> 
> Given now expensive WBINVD is, what possible reason can you think for
> having it in an alternative ?

It's more like e.g. WBNOINVD, which could appear in an alternative in
principle, if its encoding didn't mean WBINVD anyway on older hardware.

>>> +        [0x0b]          = (Known),             /* UD2 */
>>> +
>>> +        [0x18 ... 0x1f] = (Known|ModRM),       /* Grp16 (Hint Nop) */
>>> +        [0x20 ... 0x23] = (Known|ModRM),       /* MOV %cr/%dr */
>>> +
>>> +        [0x30 ... 0x33] = (Known),             /* WRMSR/RDTSC/RDMSR/RDPMC */
>>> +
>>> +        [0x40 ... 0x4f] = (Known|ModRM),       /* CMOVcc */
>>> +
>>> +        [0x80 ... 0x8f] = (Known|Branch|Imm),  /* Jcc disp32 */
>>> +        [0x90 ... 0x9f] = (Known|ModRM),       /* SETcc */
>>> +
>>> +        [0xa0 ... 0xa2] = (Known),             /* PUSH/POP %fs/CPUID */
>>> +        [0xa3]          = (Known|ModRM),       /* BT */
>>> +        [0xa4]          = (Known|ModRM|Imm8),  /* SHLD $imm8 */
>>> +        [0xa5]          = (Known|ModRM),       /* SHLD %cl */
>>> +
>>> +        [0xa8 ... 0xa9] = (Known),             /* PUSH/POP %gs */
>>> +
>>> +        [0xab]          = (Known|ModRM),       /* BTS */
>>> +        [0xac]          = (Known|ModRM|Imm8),  /* SHRD $imm8 */
>>> +        [0xad ... 0xaf] = (Known|ModRM),       /* SHRD %cl/Grp15/IMUL */
>>> +
>>> +        [0xb0 ... 0xb9] = (Known|ModRM),       /* CMPXCHG/LSS/BTR/LFS/LGS/MOVZxx/POPCNT/UD1 */
>>> +        [0xba]          = (Known|ModRM|Imm8),  /* Grp8 */
>>> +        [0xbb ... 0xbf] = (Known|ModRM),       /* BTC/BSF/BSR/MOVSX */
>>> +        [0xc0 ... 0xc1] = (Known|ModRM),       /* XADD */
>> What about MOVNTI?
> 
> I judged that to be on the unlikely side to be needed.

Hmm, I'm not going to insist, but I think we'd better have it right away.

>>> +        [0xc7]          = (Known|ModRM),       /* Grp9 */
>>> +        [0xc8 ... 0xcf] = (Known),             /* BSWAP */
>>> +    };
>> What about UD0?
> 
> UD0 differs between vendors and product lines from Intel.

Would you mind leaving a commented (to this effect) 0 entry?

>>> +        if ( mod == 1 ) /* disp8 */
>>> +            FETCH(int8_t);
>>> +        else if ( mod == 2 ) /* disp32 */
>>> +        {
>>> +        disp32:
>>> +            FETCH(int32_t);
>>> +        }
>> In several cases the FETCH()ed value isn't used. Compilers as well as Eclair
>> (and alike) are happy with that?
> 
> Yes.  The cover letter has a fully passing pipeline.

Which you know as well as I do, says next to nothing, as we don't even come
close to covering the complete version range. That said, it's likely good
enough. I'm merely surprised no tool has to say anything about these unused
"return" values of the macro.

>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
>>> @@ -835,4 +835,18 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
>>>      ctxt->event = (struct x86_event){};
>>>  }
>>>  
>>> +/*
>>> + * x86_decode_lite().  Very minimal decoder for managing alternatives.
>>> + *
>>> + * @len is 0 on error, or nonzero on success.  If the instruction has a
>>> + * relative field, @rel_sz is nonzero, and @rel points at the field.
>>> + */
>>> +typedef struct {
>>> +    uint8_t len;
>>> +    uint8_t rel_sz; /* bytes: 0, 1 or 4 */
>> Perhaps use bitfields in favor of fixed-width integers, seeing what
>> ./CODING_STYLE says?
> 
> No.  That destroys the code generation improvements gained by returning
> a pair like this in the first place.

I was under the pretty clear impression that halfway recent compilers
treat 8-bit bitfields the same as uint8_t ordinary fields. (And no, I
did by no means suggest to shrink the width of the fields.)

Jan

