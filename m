Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C8EC55184
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 15:27:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381608.1625140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wquZ0-0000wy-SA; Mon, 03 Aug 2026 15:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381608.1625140; Mon, 03 Aug 2026 15:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wquZ0-0000wr-P9; Mon, 03 Aug 2026 15:26:50 +0000
Received: by outflank-mailman (input) for mailman id 1381608;
 Mon, 03 Aug 2026 15:26:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wquYz-0000wV-Q2
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 15:26:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wquYz-00C8Z0-6b
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 17:26:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a70b325-5cb7-0a2a0a5109dd-0a2a450b990c-18
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 17:26:49 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a70b334-b7e8-0a2a450b0019-d155dd29dc98-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 17:26:44 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-47f92e3c14bso2492538f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 08:26:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41e2484sm35099096f8f.11.2026.08.03.08.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 08:26:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1785770804; x=1786375604; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmwVO0GCSPE8S03FffRhOAtiOUMzJODrygXLq0JIkfA=;
        b=IDR/rD/DpKn7sHMysRmuOz1IL35d6BM1/tYTxgxC4ubpAn+6diYiV/F1FXZaaSJmlp
         KmqH5QwOfkVJwXEUpjb5fLlzBCUlrb0XPQJCyYK/rW3LEAFEhXvrj5dXswTn2mIjKMLq
         cceeliPG92uENlJNphnY7JGXvNQQ0JLQ3JpEm0x0BE4saIpOaQoptDp+NS6FBukEhNDJ
         tpD7N4sKcOsDoOpiQa+8LU38zSL1CRjnSfFRR/lAfrkeRGDxQXcgQ1zYBPHtrrZa0Qnh
         Y/HtC62i7BWb4iR1OmZrw/7scPjpUV7c9BHNxCWYr/rcdXjJoPWhjhXNwK14E4g3MR01
         RFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785770804; x=1786375604;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmwVO0GCSPE8S03FffRhOAtiOUMzJODrygXLq0JIkfA=;
        b=q6EX9ZwuqBDI08yjtd+eGn1gA5sAO1tw+IdN+IAQxElDNgF3OROhs3jDOONzRWMeoy
         vxat+7OAaX5DoYzis3Ntoc1p9aVMQq1M3XGSxSgseTQPpItCibz9YmR+xM3FVnnFdXVl
         71H1cNJaIHG/D2/asDgDVFr4ZK3BCqqfm4VoqSHh5rm6QsvWnDlQNtxSP4sH9KEUvlhP
         lcv97pWFK6PKWM/dWxwfWy9+/I34vu72vAoGHPgNHKXfFGMI+fp0uTqzJ24yaDB1yE5Q
         E1g8JTXqhPaUxr/a7fHORngiNwdPNq2y6skfw4LJtwhIjZt77A9pSzelUAPscaP+Dziy
         5VPQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro3poHwx76+vI8eXQaVJvr/Uu1EJnL3pipfg4rD82HqISdgEyVX/ZzKl5mukBoR1TLc9MXPvtENpLY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwCo5njVOjMKcBSkiAk4KY7mXyKNSQO4fQjBq2pVkEUTR60+LOc
	xc6rAivQaPvCBeglh7x2XLyz9NKnp8xrtRowrmv8jamEHX11GxclA/lNkLpxbVINDw==
X-Gm-Gg: AR+sD11zlCpvalFNLhF8OrFIoGAnimO9FkWIYFZ4vG/nu9PW95c63aFk2m1RlfIAaZn
	W7l5STuGxTyh6qRt+q5ZPaDt6ptxhjtwMpwzeTojiux81HHRJVMhksa0AEhUiLkIddjLD0q+6iX
	K9GbpXlSAqUo5s0H6EsZyI2o6/Sdf9K5L6tRMoC25xo7MA2WTCeN7Adib+nW3itJ0DCDaBR1ms0
	3VjhkX9F0gcbDcGfqGB3rOdAnYY/9XWDbZjUEYOQqRouS6YV++yZwp8uJPm3sdc7T10AAnF1kls
	/LSbRwLPNyusDJjL2O9WtzZHqBL60uW9t7YYCQXcwxxDW9u8aDARNm7UWiQDYnuLd2cM/PIhioY
	98brod6B1Q66QnGz9kGoIHRX/BeidZZ61FZ3RGG2jqO5od8u9NSyDAGKW9M8grUau2waXLco5F/
	UXqduwpLHLzYSJisOwi9LWFCNzCi+WChoQLeOYMx0Vbdn+6w41wO69i3D18ezfw8GbmM1Dab8f1
	/ge7MdlDq/eNir1wJseSjZAt4AZblenY/V1wcaER8upi1jPAzMv
X-Received: by 2002:a05:6000:3102:b0:47f:5a97:2a63 with SMTP id ffacd0b85a97d-47fd729fce9mr29683590f8f.9.1785770803801;
        Mon, 03 Aug 2026 08:26:43 -0700 (PDT)
Message-ID: <01b27228-fdc0-4546-aa23-2bcdafb22727@suse.com>
Date: Mon, 3 Aug 2026 17:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] x86/emul: Introduce x86_decode_lite()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260803072006.9678-1-andrew.cooper3@citrix.com>
 <20260803072006.9678-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260803072006.9678-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785770804-1A8D99EA-4B094D6B/0/0
X-purgate-type: clean
X-purgate-size: 12314

> --- /dev/null
> +++ b/xen/arch/x86/x86_emulate/decode-lite.c
> @@ -0,0 +1,330 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifdef __XEN__
> +# include <xen/init.h>
> +# include <xen/livepatch.h>
> +#endif
> +
> +#include "private.h"
> +
> +#undef ModRM
> +
> +/*
> + * Bare minimum x86 instruction decoder to parse the alternative replacement
> + * instructions and locate the IP-relative references that may need updating.
> + *
> + * These are:
> + *  - disp8/32 from near direct branches
> + *  - RIP-relative memory references
> + *
> + * The following simplifications are used:
> + *  - All code is 64bit, the instruction stream is well formed and safe to
> + *    read.
> + *  - Instruction groups and prefixes not used by Xen's current alternatives
> + *    are not implemented in order to reduce the decode complexity.
> + *  - Certain instructions are intentionally not recognised, when it is more
> + *    likely for their presence to be an error than intentional.
> + *
> + * Inputs:
> + *  @ip  The position to start decoding from.
> + *  @end End of the replacement block.  Exceeding this is considered an error.

Why do you mention replacement blocks here? Are we entirely set on this
code not possibly gaining any purpose beyond the scanning of those?

> + * Returns: x86_decode_lite_t
> + *  - On failure, length of 0.
> + *  - On success, length > 0.  For rel_sz > 0, rel points at the relative
> + *    field in the instruction stream.
> + */
> +x86_decode_lite_t init_or_livepatch x86_decode_lite(void *ip, void *end)

Is there a reason the parameters can't be pointer-to-const? Hmm,
apparently for x86_decode_lite_t's "rel" field not be plaing void *, "ip"
needs to be this way as well. But not "end", I don't think.

> +{
> +#define Imm8   (1 << 0)
> +#define Imm    (1 << 1)
> +#define Moffs  (1 << 2)
> +#define Branch (1 << 5) /* Near direct branches, which have a displacement */
> +#define ModRM  (1 << 6)
> +#define Known  (1 << 7)
> +
> +    static const uint8_t init_or_livepatch_const onebyte[256] = {
> +
> +#define ALU_OPS(x)                              \
> +        [(x) + 0] = (Known|ModRM),              \
> +        [(x) + 1] = (Known|ModRM),              \
> +        [(x) + 2] = (Known|ModRM),              \
> +        [(x) + 3] = (Known|ModRM),              \
> +        [(x) + 4] = (Known|Imm8),               \
> +        [(x) + 5] = (Known|Imm)
> +
> +        ALU_OPS(0x00) /* ADD */, ALU_OPS(0x08) /* OR  */,
> +        ALU_OPS(0x10) /* ADC */, ALU_OPS(0x18) /* SBB */,
> +        ALU_OPS(0x20) /* AND */, ALU_OPS(0x28) /* SUB */,
> +        ALU_OPS(0x30) /* XOR */, ALU_OPS(0x38) /* CMP */,
> +
> +#undef ALU_OPS
> +
> +        [0x50 ... 0x5f] = (Known),             /* PUSH/POP %reg */
> +
> +        [0x62]          = 0,                   /* BOUND, but also EVEX prefix, not implemented. */
> +        [0x63]          = (Known|ModRM),       /* MOVSxd */
> +
> +        [0x68]          = (Known|Imm),         /* PUSH $imm */
> +        [0x69]          = (Known|ModRM|Imm),   /* IMUL $imm */
> +        [0x6a]          = (Known|Imm8),        /* PUSH $imm8 */
> +        [0x6b]          = (Known|ModRM|Imm8),  /* PUSH $imm8 */
> +        [0x6c ... 0x6f] = (Known),             /* INS/OUTS */
> +        [0x70 ... 0x7f] = (Known|Branch|Imm8), /* Jcc disp8 */
> +        [0x80]          = (Known|ModRM|Imm8),  /* Grp1 */
> +        [0x81]          = (Known|ModRM|Imm),   /* Grp1 */
> +
> +        [0x83]          = (Known|ModRM|Imm8),  /* Grp1 */
> +        [0x84 ... 0x8e] = (Known|ModRM),       /* TEST/XCHG/MOV/MOV-SREG/LEA */
> +        [0x8f]          = 0,                   /* Grp1A - POP but also XOP prefix, not implemented. */

POP doesn't look all that unlikely to be used in inline assembly, and
hence in alternatives. That said, of course using it with a memory
operand requires quite a bit of care. I don't see you excluding the
PUSH counterpart, though - being consistent for any such pairs would
seem somewhat desirable.

> +        [0x90 ... 0x99] = (Known),             /* NOP/XCHG %rAX/CLTQ/CQTO */
> +
> +        [0x9b ... 0x9f] = (Known),             /* FWAIT/PUSHF/POPF/SAHF/LAHF */
> +        [0xa0 ... 0xa3] = (Known|Moffs),       /* MOVABS */
> +        [0xa4 ... 0xa7] = (Known),             /* MOVS/CMPS */
> +        [0xa8]          = (Known|Imm8),        /* TEST %al */
> +        [0xa9]          = (Known|Imm),         /* TEST %rAX */
> +        [0xaa ... 0xaf] = (Known),             /* STOS/LODS/SCAS */
> +        [0xb0 ... 0xb7] = (Known|Imm8),        /* MOV $imm8, %reg */
> +        [0xb8 ... 0xbf] = (Known|Imm),         /* MOV $imm{16,32,64}, %reg */
> +        [0xc0 ... 0xc1] = (Known|ModRM|Imm8),  /* Grp2 (ROL..SAR $imm8, %reg) */
> +
> +        [0xc3]          = (Known),             /* RET */
> +        [0xc4 ... 0xc5] = 0,                   /* LES/LDS but also VEX prefixes, not implemented. */

This may bite us sooner or later, due to the VEX-encoded integer insns
that there are. Of course as long as we don't use this function on
compiled code, and as long as my "x86: allow Kconfig control over psABI
level" doesn't come close to going in, that's merely a theoretical
concern.

Same goes for not supporting the 3-byte opcodes, which also encode
certain integer insns.

> +        [0xc6]          = (Known|ModRM|Imm8),  /* Grp11, Further ModRM decode */
> +        [0xc7]          = (Known|ModRM|Imm),   /* Grp11, Further ModRM decode */
> +
> +        [0xcb ... 0xcc] = (Known),             /* LRET/INT3 */
> +        [0xcd]          = (Known|Imm8),        /* INT $imm8 */
> +
> +        [0xd0 ... 0xd3] = (Known|ModRM),       /* Grp2 (ROL..SAR {$1,%cl}, %reg) */
> +
> +        [0xd6]          = (Known),             /* UDB */

I guess you consider XLAT, LOOP*, and J*CXZ as too odd to use in alternatives?
Decoding-wise they're rather easy to implement.

> +        [0xe4 ... 0xe7] = (Known|Imm8),        /* IN/OUT $imm8 */
> +        [0xe8 ... 0xe9] = (Known|Branch|Imm),  /* CALL/JMP disp32 */
> +
> +        [0xeb]          = (Known|Branch|Imm8), /* JMP disp8 */
> +        [0xec ... 0xef] = (Known),             /* IN/OUT %dx */
> +
> +        [0xf1]          = (Known),             /* ICEBP */
> +
> +        [0xf4]          = (Known),             /* HLT */
> +        [0xf5]          = (Known),             /* CMC */
> +        [0xf6 ... 0xf7] = (Known|ModRM),       /* Grp3, Further ModRM decode */
> +        [0xf8 ... 0xfd] = (Known),             /* CLC ... STD */
> +        [0xfe ... 0xff] = (Known|ModRM),       /* Grp4 */
> +    };
> +    static const uint8_t init_or_livepatch_const twobyte[256] = {
> +        [0x00 ... 0x03] = (Known|ModRM),       /* Grp6/Grp7/LAR/LSL */

Leaving out INVD is surely find, but WBINVD?

> +        [0x0b]          = (Known),             /* UD2 */
> +
> +        [0x18 ... 0x1f] = (Known|ModRM),       /* Grp16 (Hint Nop) */
> +        [0x20 ... 0x23] = (Known|ModRM),       /* MOV %cr/%dr */
> +
> +        [0x30 ... 0x33] = (Known),             /* WRMSR/RDTSC/RDMSR/RDPMC */
> +
> +        [0x40 ... 0x4f] = (Known|ModRM),       /* CMOVcc */
> +
> +        [0x80 ... 0x8f] = (Known|Branch|Imm),  /* Jcc disp32 */
> +        [0x90 ... 0x9f] = (Known|ModRM),       /* SETcc */
> +
> +        [0xa0 ... 0xa2] = (Known),             /* PUSH/POP %fs/CPUID */
> +        [0xa3]          = (Known|ModRM),       /* BT */
> +        [0xa4]          = (Known|ModRM|Imm8),  /* SHLD $imm8 */
> +        [0xa5]          = (Known|ModRM),       /* SHLD %cl */
> +
> +        [0xa8 ... 0xa9] = (Known),             /* PUSH/POP %gs */
> +
> +        [0xab]          = (Known|ModRM),       /* BTS */
> +        [0xac]          = (Known|ModRM|Imm8),  /* SHRD $imm8 */
> +        [0xad ... 0xaf] = (Known|ModRM),       /* SHRD %cl/Grp15/IMUL */
> +
> +        [0xb0 ... 0xb9] = (Known|ModRM),       /* CMPXCHG/LSS/BTR/LFS/LGS/MOVZxx/POPCNT/UD1 */
> +        [0xba]          = (Known|ModRM|Imm8),  /* Grp8 */
> +        [0xbb ... 0xbf] = (Known|ModRM),       /* BTC/BSF/BSR/MOVSX */
> +        [0xc0 ... 0xc1] = (Known|ModRM),       /* XADD */

What about MOVNTI?

> +        [0xc7]          = (Known|ModRM),       /* Grp9 */
> +        [0xc8 ... 0xcf] = (Known),             /* BSWAP */
> +    };

What about UD0?

> +    void *start = ip, *rel = NULL;
> +    unsigned int opc, rel_sz = 0;
> +    uint8_t b, d, rex = 0, osize = 4;
> +
> +#define OPC_TWOBYTE (1 << 8)
> +
> +    /* Mutates IP, uses END. */
> +#define FETCH(ty)                                       \
> +    ({                                                  \
> +        ty _val;                                        \
> +                                                        \
> +        if ( (ip + sizeof(ty)) > end )                  \
> +            goto overrun;                               \
> +        _val = *(ty *)ip;                               \
> +        ip += sizeof(ty);                               \
> +        _val;                                           \
> +    })
> +
> +    for ( ;; ) /* Prefixes */
> +    {
> +        switch ( b = FETCH(uint8_t) )
> +        {
> +        case 0x26: /* ES override */
> +        case 0x2e: /* CS override */
> +        case 0x36: /* DS override */
> +        case 0x3e: /* SS override */
> +        case 0x64: /* FS override */
> +        case 0x65: /* GS override */
> +        case 0xf0: /* LOCK */
> +        case 0xf2: /* REPNE */
> +        case 0xf3: /* REP */
> +            break;
> +
> +        case 0x66: /* Operand size override */
> +            osize = 2;
> +            break;
> +
> +        /* case 0x67: Address size override, not implemented */
> +
> +        case 0x40 ... 0x4f: /* REX */
> +            rex = b;
> +            continue;
> +
> +        default:
> +            goto prefixes_done;
> +        }
> +        rex = 0; /* REX cancelled by subsequent legacy prefix. */
> +    }
> + prefixes_done:
> +
> +    if ( rex & REX_W )
> +        osize = 8;
> +
> +    /* Fetch the main opcode byte(s) */
> +    if ( b == 0x0f )
> +    {
> +        b = FETCH(uint8_t);
> +        opc = OPC_TWOBYTE | b;
> +
> +        d = twobyte[b];
> +    }
> +    else
> +    {
> +        opc = b;
> +        d = onebyte[b];
> +    }
> +
> +    if ( unlikely(!(d & Known)) )
> +        goto unknown;
> +
> +    if ( d & ModRM )
> +    {
> +        uint8_t modrm = FETCH(uint8_t);
> +        uint8_t mod = modrm >> 6;
> +        uint8_t reg = (modrm >> 3) & 7;
> +        uint8_t rm = modrm & 7;
> +
> +        /* ModRM/SIB decode */
> +        if ( mod == 0 && rm == 5 ) /* RIP relative */
> +        {
> +            rel = ip;
> +            rel_sz = 4;
> +            FETCH(int32_t);

FETCH() here but ...

> +        }
> +        else if ( mod != 3 && rm == 4 ) /* SIB */
> +        {
> +            uint8_t sib = FETCH(uint8_t);
> +            uint8_t base = sib & 7;
> +
> +            if ( mod == 0 && base == 5 )
> +                goto disp32;

... goto here?

> +        }
> +
> +        if ( mod == 1 ) /* disp8 */
> +            FETCH(int8_t);
> +        else if ( mod == 2 ) /* disp32 */
> +        {
> +        disp32:
> +            FETCH(int32_t);
> +        }

In several cases the FETCH()ed value isn't used. Compilers as well as Eclair
(and alike) are happy with that? And compilers also manage to eliminate the
memory accesses then?

> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> @@ -835,4 +835,18 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
>      ctxt->event = (struct x86_event){};
>  }
>  
> +/*
> + * x86_decode_lite().  Very minimal decoder for managing alternatives.
> + *
> + * @len is 0 on error, or nonzero on success.  If the instruction has a
> + * relative field, @rel_sz is nonzero, and @rel points at the field.
> + */
> +typedef struct {
> +    uint8_t len;
> +    uint8_t rel_sz; /* bytes: 0, 1 or 4 */

Perhaps use bitfields in favor of fixed-width integers, seeing what
./CODING_STYLE says?

Jan

