Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94C1606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 09:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VSk1ZZmK
Received: from list by lists.xenproject.org with outflank-mailman.1462992.1673968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM0GL-0007wB-AT; Wed, 28 Oct 2026 09:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462992.1673968; Wed, 28 Oct 2026 09:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM0GL-0007w4-7z; Wed, 28 Oct 2026 09:48:05 +0000
Received: by outflank-mailman (input) for mailman id 1462992;
 Wed, 28 Oct 2026 09:48:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xM0GK-0007vl-84
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 09:48:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM0GJ-006O23-HW
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 10:48:03 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1c4c9-e002-0a2a0a5209dd-0a2a4505ecc8-26
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 10:48:03 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae1c4d3-4cb1-0a2a45050019-d155dd31ddfc-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 10:48:03 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48e20edd106so569580f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 02:48:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebd48e0sm27944912f8f.38.2026.10.28.02.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 02:48:02 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793180883; x=1793785683; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIRvX8cIau+XDlHLuogFp15o/j+RYWBpn/8pySM2qvI=;
        b=VSk1ZZmKtf05X5K6PkkDqNBYc8uMXZvy5+anaOlpRqJ4hg3NJX/FHbK0xnJziGta4H
         eWeA8/+DpWhogvutGQ7w/Rkc36fZEEH7iyLcfGz5KM9s+V3V6Ebb3he92dSf2b3Q7cKa
         mxANwEiX1fnft/Q2C4ml/ERbtItLcaeiv0JIRHyEQZKh6MwFulKr5Mw/QlVjFDYfV4G0
         +717/zs7N9xtIidhbla4Feb1NYvb7Mm1tzXEuN1QX3JaEP7d84hHTx6/4sKKzzTMu6Ax
         LR7NJY9xmK65F9eLgMu/t25lpJX/2QUcWOmrBOCUSXLEv/RmYwR+SNPjNk3UJoCu2c66
         kB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180883; x=1793785683;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MIRvX8cIau+XDlHLuogFp15o/j+RYWBpn/8pySM2qvI=;
        b=nVhcgp2EFyNxSAt9ze9K6eOspwYxelSJExlyC27FitKU9rf/DoA0pmeuE7a3pNr5g3
         myDjiURYFcZgH73nd+XmaPPIauRQWNyq7sky5Y0XIYGvzOQs1k7NkkIe5SqzmAjzlvNG
         wqg5ny2kkr94ZyLwsuWmzH0psJ69I3aOEymJHOEE1N58cgLJ7jSSgYxNoY/qqJ9WbDQ0
         XdQo7UmqcjIABmEABOC2LI5SiXhRhLBQ3LXI2c7Bk2Z3jmlD+u3y8uxc4CtdFAGa5P0q
         0Jwkn9p6Yo2zfRVBl2hQOma7RN6bxo0tEIer6zd4WEsKf4uqCQ1cTpoUOX6tnDvPozoX
         5iQg==
X-Forwarded-Encrypted: i=1; AKwUvBwq/wpQobAoy8KyqJ441HH2a1iHEulNkzMV7R5rNCuxdN61n6fScj+LAx+NJ4UnHcUVnylPHzDbFzk=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKzX6/VQ51xZO9jEK4hZQcyAQwEJQrmf0CCsbNfTtiYHI3IxOR5
	kgDGD7n2NlCkLtOtA8rx65I+nieBz3W7nsxn38JtFlF2dEG9bqEx/wJqVQX8wJhEFQ==
X-Gm-Gg: AYBFou2cDJHhkzq7GWufjH0iblDiLLool+Jb8UoEAdYBcUEOiBQJ/NwxzsvlGeRzQBL
	e1m6bhJHB/r7lR0qrmsWpzCEuM/BoxkXtE3yIfTMfOLyARGOpLFc9P659NwY5TbHa26S2ibafqQ
	yRR/sZLE4jl9jG1DY6vpKId2M5XqT6/KJR3H12SWh3eVFDzX9Jy9oUqpb4J5WASPyuClne3jdUS
	1gySaIDY/EAAV+hPlNIGv+dgCQ0E0WPEV84uGOVyiG51QZOhxTuXc6KPciNCt+I1yfTpQhADKOB
	jC0dIjVm7mIxLsHR35WmR3C8K2jrdVsG7dSdogx+iRsN0WjT+wva+pp6kmfref7x1iwmFmJSCGf
	94eEuyvNhrx/F1iBabSAMs3mNa3qJT8KjRqzjAIfFLHUry4DBiO3D0RhRb/VKWMf0DH06LdJlg8
	SAkgdjDBc38OnnYfAMGUAo1mz80v5NycKVJpOyIIvgD4QA4CQ+BKulAXYHogPj00XKt+qUhLDvI
	UoDB9Ul/lkD9AuzICG3WytFPsV8YuVKdn655EPI7ejAw+29BxF7oPG6V9z29iqakLIt5Y/UdnW1
	z3Y3TacSOO9yyOFfB1pPS3XCtuEFj9yzVhKSYRpqJjoUSuNC0JM1HhaRKbmITcIXr3Sh9Dvkvng
	LFqmzNUfPkQTFuYLVmya/E3Y6wU+IB9fdYDH3xg==
X-Received: by 2002:a05:6000:2086:b0:48b:118e:7454 with SMTP id ffacd0b85a97d-48e5d5a45e2mr4074342f8f.31.1793180882489;
        Wed, 28 Oct 2026 02:48:02 -0700 (PDT)
Message-ID: <998b084e-1a3f-4b51-bad3-4b175e6027a0@suse.com>
Date: Wed, 28 Oct 2026 10:48:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] x86/emul: Introduce x86_decode_lite()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261015210530.786604-1-andrew.cooper3@citrix.com>
 <20261015210530.786604-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261015210530.786604-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793180883-24D1E2A1-3CD65039/10/78276251493
X-purgate-type: spam
X-purgate-size: 9126
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 15.10.2026 23:05, Andrew Cooper wrote:
> In order to relocate all IP-relative fields in an alternative replacement
> block, we need to decode the instructions enough to obtain their length and
> any relative fields.
> 
> Full x86_decode() is far too heavyweight, so introduce a minimal form which
> can make several simplifying assumptions.
> 
> This a mostly-complete decoder for integer instruction in the onebyte and
> twobyte maps.  Some instructions are intentionally unrecognised, as finding
> them in an alternative is more likely to be a bug than intentional.  Some
> instruction groups and prefixes are unimplemented to reduce decode complexity,
> as this will be a fasthpath during patching.

Just that patching isn't really something where performance matters very much.
It's done during boot (or livepatch load), and then not anymore. (I still
agree that reduction of complexity is a worthwhile goal, or course.)

> --- /dev/null
> +++ b/xen/arch/x86/x86_emulate/decode-lite.c
> @@ -0,0 +1,331 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifdef __XEN__
> +# include <xen/init.h>
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
> + *  @end End of the code block.  Exceeding this is considered an error.
> + *
> + * Returns: x86_decode_lite_t
> + *  - On failure, length of 0.
> + *  - On success, length > 0.  For rel_sz > 0, rel points at the relative
> + *    field in the instruction stream.
> + */
> +x86_decode_lite_t init_or_livepatch x86_decode_lite(void *ip, const void *end)
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

Given the purpose, BOUND isn't relevant here at all: We don't mean to use
this decoder on 32- or 16-bit code. Hence I'd suggest to put emphasis on
EVEX, and name BOUND secondarily. See how ...

> +        [0x63]          = (Known|ModRM),       /* MOVSxd */

... here you don't mention ARPL at all. (Also - why xd in lower case?)

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

I continue thinking that the asymmetry between PUSH r/m and POP r/m being
deliberate wants at least mentioning in the description.

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
> +        [0xc6]          = (Known|ModRM|Imm8),  /* Grp11, Further ModRM decode */
> +        [0xc7]          = (Known|ModRM|Imm),   /* Grp11, Further ModRM decode */
> +
> +        [0xcb ... 0xcc] = (Known),             /* LRET/INT3 */

Here and for RET above: I think it's fine to entirely omit entries for
opcodes not defined in 64-bit mode (e.g. 9A, EA), and for SIMD ones. At
the same time I think we'd be better off having explicit (zero) entries
for (integer) opcodes we deliberately mean to not support (RET/LRET with
imm16, ENTER, LEAVE; more further down).

> +        [0xcd]          = (Known|Imm8),        /* INT $imm8 */
> +
> +        [0xd0 ... 0xd3] = (Known|ModRM),       /* Grp2 (ROL..SAR {$1,%cl}, %reg) */
> +
> +        [0xd6]          = (Known),             /* UDB */
> +
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
> +
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

With it being MOVSX here, perhaps MOVZX above? Or the other way around,
MOVSxx here?

> +        [0xc0 ... 0xc1] = (Known|ModRM),       /* XADD */

Is there a reason to permit XADD but not CMPXCHG?

Preferably with the above addressed (but explicitly also with some / all
left as is, yet then with the expectation that I may send an adjustment
patch on top, which I'd then expect to not be outright refused/ignored):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

