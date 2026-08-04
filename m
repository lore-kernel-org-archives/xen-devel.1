Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6914C55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:40:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382248.1625598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHF5-00053D-Fc; Tue, 04 Aug 2026 15:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382248.1625598; Tue, 04 Aug 2026 15:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHF5-000536-Cv; Tue, 04 Aug 2026 15:39:47 +0000
Received: by outflank-mailman (input) for mailman id 1382248;
 Tue, 04 Aug 2026 15:39:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrHF3-000530-Nq
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:39:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHF3-00FjQT-1K
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:39:45 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72079c-bab6-0a2a0a5309dd-0a2a45048a62-44
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:39:44 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7207c0-b57f-0a2a45040019-d155dd36b9c3-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:39:44 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47f84023916so4588659f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:39:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fec23ec3asm551990f8f.31.2026.08.04.08.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 08:39:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1785857984; x=1786462784; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2toUDhZyEbbG0kKRohXauBWdzsUJgpoNHOwbrQ7ecrY=;
        b=M9BRdTf5M3TFz626lH0amRKEftLvy7JVlaGDDh563EyJBgyJtqJVRpcoCPQpkjUltx
         AGK/PEQSL2vFZ5/fkVm1H2wKz0qnSdzt85ngwNvBsulyodKDEfwsoUQlgS+jorOfep3v
         iE4xLQ3VK/SHrldhqzUNXbjWHH1v7QLgTlWm3OYJCbbSVyYBi9R+WluTh8NouBL0or1u
         xxRVY3y909A8UoA0bzl7Eu79c2GI8A9iQ5cY0GHuD0GPo79Ap5SBDefztlAudftVYhqh
         q1xQrV6JoDl4JHvAo/LaUJkfgJk+UUbjPVvZey858VNRWP4ofS/NMdETyC/qobg7JZKp
         gNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857984; x=1786462784;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2toUDhZyEbbG0kKRohXauBWdzsUJgpoNHOwbrQ7ecrY=;
        b=HCVGrLg343fnvOtFK7X3Igtr9WRpVgqSl7THz67kLAYasI2F5qI1tonEpobMAXzgp/
         oTvDvHy1z41IqRqLOSOXFjG3vsHDw39oJZRhnqXnYKJdz+3IQI2QQHj9lo9ZS1EFPXam
         V1XjN0uFZDa/EIKk5z1U9wzkDOaj7ZsLowz5k6CDzniB7BEyInAcpA2Ai8xLqqyhFxpF
         HuVo2omTbkuWfJ35/zz5m0zTghrvMROA/GUg9yEsobm/3AJXoBFZftcKjV1RByImw8vo
         ND6nMY0PCIM17d9fx/jEMchqxDrBi81K9KJDrNbHN0WXW4X0GzRQ2tS1/WyRKC6fei1n
         55Vg==
X-Forwarded-Encrypted: i=1; AHgh+RqTIIwAEgcHBusoK7XsLmPyEyJSx3Dv1gCmfBPUol/jqGZLdVgDGeo189Zj8EQwD7sEokFzTlzPw7o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZQlX+CFJLp7bCCy3C+3kSfiqIbnLZ6bS3mTVniQNDs4TBJ2N1
	IVGTZPSpAo44BbUeGZvway7i+kny2yTzi67kX2MZ5+ZlBv4zuMwnAtSHTc4EUT4zcA==
X-Gm-Gg: AR+sD10ptemqVp5oEzIwu29sf7+23L1gXDX9Mjq2T0m5L5Z/B/C3/8SD7kEOIJsyc1N
	rfMluDtNIchAjxc3Gkra2WnNE0oC1KxvyiMGkmaKcMvHgkJiPZMwrV9Vqwi6KbTQizGWzzegkcl
	Nzvt9ApJnEoF/+x+oZG7Qy5Kg+5hS73Mg1aihHtUW6AvvJdvuMQf6MpPhfnIoeN8ZtezaWSvlyx
	iIqLAMFSYLSI4QBrstzwL2Iqg/n208g6+wcea6/2MRv/AR1iMpyS+U137LB099Kqdbnmx50AIjJ
	JJ8t64AE8EsYHfJ+JOQBpl996MGOouKsD4KpcWj+WdwCzhvlaCDuhhA4pwhSE15pg6s9Zc2v7OO
	AXpzwZXA4sQftIwrlCGhdpJs9u4kb1cVCOlUaNbi3+cZYOBijHk7yPzAuTIQVJeCJimCmKg8Y37
	nkGqjbrMMIH3WszaDlVtHWgNqAIFwwS0GjdW92rxoJCg8TBP6hVu+IQ1JOnlNvwbPAo/iXxc8k/
	aJEmqE0iY4ZexljztdNs83EMOcJmWo8t1+IJtbDIlrSmpLVxqX2
X-Received: by 2002:adf:fec7:0:b0:47e:81aa:3832 with SMTP id ffacd0b85a97d-47fec519ff8mr221710f8f.16.1785857984304;
        Tue, 04 Aug 2026 08:39:44 -0700 (PDT)
Message-ID: <0b892cfe-0a7d-4e7f-b7f6-4fc2575762ac@suse.com>
Date: Tue, 4 Aug 2026 17:39:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] x86/emul: Introduce x86_decode_lite()
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260803072006.9678-1-andrew.cooper3@citrix.com>
 <20260803072006.9678-2-andrew.cooper3@citrix.com>
 <01b27228-fdc0-4546-aa23-2bcdafb22727@suse.com>
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
In-Reply-To: <01b27228-fdc0-4546-aa23-2bcdafb22727@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1785857984-528C9B50-3F73523E/0/0
X-purgate-type: clean
X-purgate-size: 5585

On 03.08.2026 17:26, Jan Beulich wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/x86_emulate/decode-lite.c
>> @@ -0,0 +1,330 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifdef __XEN__
>> +# include <xen/init.h>
>> +# include <xen/livepatch.h>
>> +#endif
>> +
>> +#include "private.h"
>> +
>> +#undef ModRM
>> +
>> +/*
>> + * Bare minimum x86 instruction decoder to parse the alternative replacement
>> + * instructions and locate the IP-relative references that may need updating.
>> + *
>> + * These are:
>> + *  - disp8/32 from near direct branches
>> + *  - RIP-relative memory references
>> + *
>> + * The following simplifications are used:
>> + *  - All code is 64bit, the instruction stream is well formed and safe to
>> + *    read.
>> + *  - Instruction groups and prefixes not used by Xen's current alternatives
>> + *    are not implemented in order to reduce the decode complexity.
>> + *  - Certain instructions are intentionally not recognised, when it is more
>> + *    likely for their presence to be an error than intentional.
>> + *
>> + * Inputs:
>> + *  @ip  The position to start decoding from.
>> + *  @end End of the replacement block.  Exceeding this is considered an error.
> 
> Why do you mention replacement blocks here? Are we entirely set on this
> code not possibly gaining any purpose beyond the scanning of those?
> 
>> + * Returns: x86_decode_lite_t
>> + *  - On failure, length of 0.
>> + *  - On success, length > 0.  For rel_sz > 0, rel points at the relative
>> + *    field in the instruction stream.
>> + */
>> +x86_decode_lite_t init_or_livepatch x86_decode_lite(void *ip, void *end)
> 
> Is there a reason the parameters can't be pointer-to-const? Hmm,
> apparently for x86_decode_lite_t's "rel" field not be plaing void *, "ip"
> needs to be this way as well. But not "end", I don't think.
> 
>> +{
>> +#define Imm8   (1 << 0)
>> +#define Imm    (1 << 1)
>> +#define Moffs  (1 << 2)
>> +#define Branch (1 << 5) /* Near direct branches, which have a displacement */
>> +#define ModRM  (1 << 6)
>> +#define Known  (1 << 7)
>> +
>> +    static const uint8_t init_or_livepatch_const onebyte[256] = {
>> +
>> +#define ALU_OPS(x)                              \
>> +        [(x) + 0] = (Known|ModRM),              \
>> +        [(x) + 1] = (Known|ModRM),              \
>> +        [(x) + 2] = (Known|ModRM),              \
>> +        [(x) + 3] = (Known|ModRM),              \
>> +        [(x) + 4] = (Known|Imm8),               \
>> +        [(x) + 5] = (Known|Imm)
>> +
>> +        ALU_OPS(0x00) /* ADD */, ALU_OPS(0x08) /* OR  */,
>> +        ALU_OPS(0x10) /* ADC */, ALU_OPS(0x18) /* SBB */,
>> +        ALU_OPS(0x20) /* AND */, ALU_OPS(0x28) /* SUB */,
>> +        ALU_OPS(0x30) /* XOR */, ALU_OPS(0x38) /* CMP */,
>> +
>> +#undef ALU_OPS
>> +
>> +        [0x50 ... 0x5f] = (Known),             /* PUSH/POP %reg */
>> +
>> +        [0x62]          = 0,                   /* BOUND, but also EVEX prefix, not implemented. */
>> +        [0x63]          = (Known|ModRM),       /* MOVSxd */
>> +
>> +        [0x68]          = (Known|Imm),         /* PUSH $imm */
>> +        [0x69]          = (Known|ModRM|Imm),   /* IMUL $imm */
>> +        [0x6a]          = (Known|Imm8),        /* PUSH $imm8 */
>> +        [0x6b]          = (Known|ModRM|Imm8),  /* PUSH $imm8 */
>> +        [0x6c ... 0x6f] = (Known),             /* INS/OUTS */
>> +        [0x70 ... 0x7f] = (Known|Branch|Imm8), /* Jcc disp8 */
>> +        [0x80]          = (Known|ModRM|Imm8),  /* Grp1 */
>> +        [0x81]          = (Known|ModRM|Imm),   /* Grp1 */
>> +
>> +        [0x83]          = (Known|ModRM|Imm8),  /* Grp1 */
>> +        [0x84 ... 0x8e] = (Known|ModRM),       /* TEST/XCHG/MOV/MOV-SREG/LEA */
>> +        [0x8f]          = 0,                   /* Grp1A - POP but also XOP prefix, not implemented. */
> 
> POP doesn't look all that unlikely to be used in inline assembly, and
> hence in alternatives. That said, of course using it with a memory
> operand requires quite a bit of care. I don't see you excluding the
> PUSH counterpart, though - being consistent for any such pairs would
> seem somewhat desirable.
> 
>> +        [0x90 ... 0x99] = (Known),             /* NOP/XCHG %rAX/CLTQ/CQTO */
>> +
>> +        [0x9b ... 0x9f] = (Known),             /* FWAIT/PUSHF/POPF/SAHF/LAHF */
>> +        [0xa0 ... 0xa3] = (Known|Moffs),       /* MOVABS */
>> +        [0xa4 ... 0xa7] = (Known),             /* MOVS/CMPS */
>> +        [0xa8]          = (Known|Imm8),        /* TEST %al */
>> +        [0xa9]          = (Known|Imm),         /* TEST %rAX */
>> +        [0xaa ... 0xaf] = (Known),             /* STOS/LODS/SCAS */
>> +        [0xb0 ... 0xb7] = (Known|Imm8),        /* MOV $imm8, %reg */
>> +        [0xb8 ... 0xbf] = (Known|Imm),         /* MOV $imm{16,32,64}, %reg */
>> +        [0xc0 ... 0xc1] = (Known|ModRM|Imm8),  /* Grp2 (ROL..SAR $imm8, %reg) */
>> +
>> +        [0xc3]          = (Known),             /* RET */
>> +        [0xc4 ... 0xc5] = 0,                   /* LES/LDS but also VEX prefixes, not implemented. */
> 
> This may bite us sooner or later, due to the VEX-encoded integer insns
> that there are. Of course as long as we don't use this function on
> compiled code, and as long as my "x86: allow Kconfig control over psABI
> level" doesn't come close to going in, that's merely a theoretical
> concern.

Actually perhaps sooner - we're meaning to use MSR-IMM insns after all, if
I'm not mistaken.

Jan

