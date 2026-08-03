Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2952C55184
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 16:03:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381670.1625217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqv8V-0001k2-Kx; Mon, 03 Aug 2026 16:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381670.1625217; Mon, 03 Aug 2026 16:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqv8V-0001jv-Hc; Mon, 03 Aug 2026 16:03:31 +0000
Received: by outflank-mailman (input) for mailman id 1381670;
 Mon, 03 Aug 2026 16:03:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wqv8U-0001jo-5Y
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 16:03:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqv8T-00FOCh-IM
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 18:03:29 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a70bbcb-2eae-0a2a0a5409dd-0a2a4507cde2-20
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 18:03:29 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a70bbd1-b4ea-0a2a45070019-d155dd2fb0a4-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 18:03:29 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-472326ca506so2510721f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:03:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd42d91bfsm36196367f8f.15.2026.08.03.09.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 09:03:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1785773009; x=1786377809; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gR6EXUyY3JxG4Cgz9uSawE1d5EoxywOylNGrSFbS9E4=;
        b=I+Rc1G573QadXwAZiWQGAtm7nbIA8lpokPQ+FVQC5hWxSe+pCJzlduhCK1/AEyNZxY
         Ysw2klLoZYHcP68WjCctYP+XdBHqwfm9CTOjzfAI2ndPuRxiPDiwuEoElsh84TV78Ubl
         F9h36sRP/HCTBJ1ci/KeiB2wE1St1CAESTXGOhwl5NRLJjmJU6wxek5JRkyqiPLEk+py
         TYaSE2iFL1spzBzl+67G3bMa1KXKAZmfZ4rwJrBJcs7A+FZPKikJNWb4WdnyajiKWW2R
         cqJSl9gyyAXER4UGOskKWcyDzj/NE8fHbAw2iM2x3o3KJ9ka7zxb0EjzWZmNFrDX5iOC
         DEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773009; x=1786377809;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gR6EXUyY3JxG4Cgz9uSawE1d5EoxywOylNGrSFbS9E4=;
        b=kYCv+2kDgr9Iy6TtNmP34vRMRuI6bY0/h3Olz2AelzX/SqvgkowgUBmZc3++e5aovO
         3ODKO09gcws4Jx5XckspxXZP8Yo+CyiV9w3ko0kOP/syEOaVHDX7QHJ6gPxGx24/tjfw
         B0ijkUpnzHzyTJsRYwNZawAAAHmLMjnQD8iEPmC0e1Cr3fiQ4O0/zrNoUw/CWz+jALeD
         zHsTbKYFT4wNPMWz7Erqc7C7TqTeiTEXNcjb8nkcjYVEGCdU5vcCRYAAlW8D4PaRmQut
         fA5sCBpANY1y8aILxSu/1h3sXdSi2ry5MKhqXSeLo1QMF2Ddf0f0lwnMYCzP7Fm33xCP
         Hq0w==
X-Forwarded-Encrypted: i=1; AHgh+RptA5Sgl5eAk13m3oJv1A3Vu8xw6An+Ex6AQu474paulYWHgH6xQTVonqWXOlVzgWI3ThOoxHdhtuY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJ1OcGzIqWsh0sTYM71DMtCjJbCa2fZUFFZh43mjmhcJ0T01te
	miloh6o6po2n1dfTMfj+cr69LXIjU9e6+anv34RGUM//bpQHWUpRjhtTNbrkLh4BZA==
X-Gm-Gg: AR+sD11Qp3EGvQpUkWm8MpX53QkbamvgwUkjZqiJNN9vRW0Ymni9nwtc6VVw+euege9
	jGrl+XEfdItHmy8lmr+oxiUkS/Gxb3W7DfW1f9NvEBBojA2z6j4nnm/8GIn4acSVP2/RipASD6i
	5MiEpBMsLwPx/TyotStpD2/bl9KJUhrMZ4E4DyssYx+biNO20/KGvkO+gmwraY9NPM1C2UIimrc
	Abm1N6ntox4cy/qO0SSAII49VTiZx2JXUMuCQyPvfN9oUJH/Rprc4RjfMvBqng2RUpQnATZmc8G
	MelQ25AWeW1kcUsHT37UaEoGLdiOlXEI2c5JNNY3gVDGznycwaoE4qseH3/8ay0O2rpE2nwMt2I
	oIHSaqV6/H75zaX8/T3wfMeN402IxIS02kN6vL13jX43ukDVuCllEfD22zVax5CVAbXyhZVJrjT
	NphJqmhz4bMpADAup8PSGDd4rMR2GCjxwIR2rndFfswzjOVJdZznoX/AVxhyLfIdFkCULHehwfc
	pqNvzAD9t0Oh3fXNKGJvRkuK52XBmitdIqWhjoKPb6BLJJ0oMvk
X-Received: by 2002:a05:6000:1a87:b0:47a:b86f:3ed1 with SMTP id ffacd0b85a97d-47fd72c6dacmr26654371f8f.21.1785773008460;
        Mon, 03 Aug 2026 09:03:28 -0700 (PDT)
Message-ID: <dd065a33-0105-4527-92f5-f3f127422ee6@suse.com>
Date: Mon, 3 Aug 2026 18:03:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] tests/x86: Introduce a userspace test harness for
 x86_decode_lite()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260803072006.9678-1-andrew.cooper3@citrix.com>
 <20260803072006.9678-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260803072006.9678-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1785773009-3C411AE4-B99B1469/0/0
X-purgate-type: clean
X-purgate-size: 9440

On 03.08.2026 09:20, Andrew Cooper wrote:
> --- /dev/null
> +++ b/tools/tests/x86-decode-lite/insns.S
> @@ -0,0 +1,703 @@
> +#include "macro-magic.h"
> +
> +        .code64
> +
> +        .allow_index_reg
> +
> +        .text
> +
> +DECL(tests_rel0)
> +modrm:
> +        /* Mod=0, Reg=0, RM {0..f} */
> +        _ add %al, (%rax)
> +        _ add %al, (%rcx)
> +        _ add %al, (%rdx)
> +        _ add %al, (%rbx)
> +        _ add %al, (%rsp) /* SIB */
> +        /*add %al, (%rbp)    RIP --> tests_rel4 */
> +        _ add %al, (%rsi)
> +        _ add %al, (%rdi)
> +        _ add %al, (%r8)
> +        _ add %al, (%r9)
> +        _ add %al, (%r10)
> +        _ add %al, (%r11)
> +        _ add %al, (%r12) /* SIB */
> +        /*add %al, (%r13)    RIP --> tests_rel4 */
> +        _ add %al, (%r14)
> +        _ add %al, (%r15)
> +
> +        /* Mod=1, Reg=0, RM {0..f} */
> +        _ add %al, 0x01(%rax)
> +        _ add %al, 0x01(%rcx)
> +        _ add %al, 0x01(%rdx)
> +        _ add %al, 0x01(%rbx)
> +        _ add %al, 0x01(%rsp) /* SIB */
> +        _ add %al, 0x01(%rbp)
> +        _ add %al, 0x01(%rsi)
> +        _ add %al, 0x01(%rdi)
> +        _ add %al, 0x01(%r8)
> +        _ add %al, 0x01(%r9)
> +        _ add %al, 0x01(%r10)
> +        _ add %al, 0x01(%r11)
> +        _ add %al, 0x01(%r12) /* SIB */
> +        _ add %al, 0x01(%r13)
> +        _ add %al, 0x01(%r14)
> +        _ add %al, 0x01(%r15)
> +
> +        /* Mod=2, Reg=0, RM {0..f} */
> +        _ add %al, 0x7f000001(%rax)
> +        _ add %al, 0x7f000001(%rcx)
> +        _ add %al, 0x7f000001(%rdx)
> +        _ add %al, 0x7f000001(%rbx)
> +        _ add %al, 0x7f000001(%rsp) /* SIB */
> +        _ add %al, 0x7f000001(%rbp)
> +        _ add %al, 0x7f000001(%rsi)
> +        _ add %al, 0x7f000001(%rdi)
> +        _ add %al, 0x7f000001(%r8)
> +        _ add %al, 0x7f000001(%r9)
> +        _ add %al, 0x7f000001(%r10)
> +        _ add %al, 0x7f000001(%r11)
> +        _ add %al, 0x7f000001(%r12) /* SIB */
> +        _ add %al, 0x7f000001(%r13)
> +        _ add %al, 0x7f000001(%r14)
> +        _ add %al, 0x7f000001(%r15)
> +
> +        /* Mod=3, Reg=0, RM {0..f} */
> +        _ add %al, %al
> +        _ add %al, %cl
> +        _ add %al, %dl
> +        _ add %al, %bl
> +        _ add %al, %ah
> +        _ add %al, %ch
> +        _ add %al, %dh
> +        _ add %al, %dl

Perhaps also include %bpl, %sil, and %dil?

> +onebyte_row_9x:
> +        _ nop
> +        _ pause
> +        _ xchg %ax, %ax
> +        _ xchg %eax, %eax
> +        _ xchg %rax, %rax
> +        _ rex.w xchg %rax, %rax
> +        _ cltq
> +        _ cqto
> +        _ wait
> +        _ pushf
> +        _ popf
> +        _ sahf
> +        _ lahf
> +
> +onebyte_row_ax:

May I suggest onebyte_row_Ax?

> +DECL(tests_rel1)
> +disp8:
> +1:
> +        _ jo   1b
> +        _ jno  1b
> +        _ jb   1b
> +        _ jae  1b
> +        _ je   1b
> +        _ jne  1b
> +        _ jbe  1b
> +        _ ja   1b
> +        _ js   1b
> +        _ jns  1b
> +        _ jp   1b
> +        _ jnp  1b
> +        _ jl   1b
> +        _ jge  1b
> +        _ jle  1b
> +        _ jg   1b
> +        _ jmp  1b
> +
> +disp8_rex:
> +        _ rex.w jo   1b
> +        _ rex.w jno  1b
> +        _ rex.w jb   1b
> +        _ rex.w jae  1b
> +        _ rex.w je   1b
> +        _ rex.w jne  1b
> +        _ rex.w jbe  1b
> +        _ rex.w ja   1b
> +        _ rex.w js   1b
> +        _ rex.w jns  1b
> +        _ rex.w jp   1b
> +        _ rex.w jnp  1b
> +        _ rex.w jl   1b
> +        _ rex.w jge  1b
> +        _ rex.w jle  1b
> +        _ rex.w jg   1b
> +        _ rex.w jmp  1b
> +END(tests_rel1)

What's the idea behind the separate REX.W testing? It almost suggests that
tests with an operand size prefix also may want adding. Except that's
difficult, because of ...

> +DECL(tests_rel4)
> +disp32:
> +        _ call   other_section
> +        _ jmp    other_section
> +        _ jo     other_section
> +        _ jno    other_section
> +        _ jb     other_section
> +        _ jae    other_section
> +        _ je     other_section
> +        _ jne    other_section
> +        _ jbe    other_section
> +        _ ja     other_section
> +        _ js     other_section
> +        _ jns    other_section
> +        _ jp     other_section
> +        _ jnp    other_section
> +        _ jl     other_section
> +        _ jge    other_section
> +        _ jle    other_section
> +        _ jg     other_section
> +        _ xbegin other_section
> +
> +disp32_rex:
> +        _ rex.w call   other_section
> +        _ rex.w jmp    other_section
> +        _ rex.w jo     other_section
> +        _ rex.w jno    other_section
> +        _ rex.w jb     other_section
> +        _ rex.w jae    other_section
> +        _ rex.w je     other_section
> +        _ rex.w jne    other_section
> +        _ rex.w jbe    other_section
> +        _ rex.w ja     other_section
> +        _ rex.w js     other_section
> +        _ rex.w jns    other_section
> +        _ rex.w jp     other_section
> +        _ rex.w jnp    other_section
> +        _ rex.w jl     other_section
> +        _ rex.w jge    other_section
> +        _ rex.w jle    other_section
> +        _ rex.w jg     other_section
> +        _ rex.w xbegin other_section

... vendor differences here. Perhaps the decoder itself would better
reject handling of operand-size-prefixed branches.

> +opsize_branch: /* 66-prefixed branches are decoded differently by vendors */
> +        _ data16 call   other_section
> +        _ data16 jmp    other_section
> +        _ data16 jo     other_section
> +        _ data16 jno    other_section
> +        _ data16 jb     other_section
> +        _ data16 jae    other_section
> +        _ data16 je     other_section
> +        _ data16 jne    other_section
> +        _ data16 jbe    other_section
> +        _ data16 ja     other_section
> +        _ data16 js     other_section
> +        _ data16 jns    other_section
> +        _ data16 jp     other_section
> +        _ data16 jnp    other_section
> +        _ data16 jl     other_section
> +        _ data16 jge    other_section
> +        _ data16 jle    other_section
> +        _ data16 jg     other_section
> +        _ data16 xbegin other_section

Oh, you even cover the case here. For XBEGIN, however, this can only be pure
guesswork as to AMD behavior, I suppose.

I also don't see how you force which form you want.

> --- /dev/null
> +++ b/tools/tests/x86-decode-lite/main.c
> @@ -0,0 +1,111 @@
> +/*
> + * Userspace test harness for x86_decode_lite().
> + */
> +#include <stdio.h>
> +
> +#include "x86-emulate.h"
> +
> +static unsigned int nr_failures;
> +#define fail(t, fmt, ...)                                       \
> +({                                                              \
> +    const unsigned char *insn = (t)->ip;                        \
> +                                                                \
> +    nr_failures++;                                              \
> +                                                                \
> +    (void)printf("  Fail '%s' [%02x", (t)->name, *insn);        \
> +    for ( unsigned int i = 1; i < (t)->len; i++ )               \
> +        printf(" %02x", insn[i]);                               \
> +    printf("]\n");                                              \
> +                                                                \
> +    (void)printf(fmt, ##__VA_ARGS__);                           \
> +})
> +
> +struct test {
> +    const char *name;
> +    void *ip;
> +    unsigned long len;
> +};
> +
> +extern const struct test
> +/* Defined in insns.S, ends with sentinel */
> +    tests_rel0[], /* No relocatable entry */
> +    tests_rel1[], /* disp8 */
> +    tests_rel4[], /* disp32 or RIP-relative */
> +    tests_unsup[]; /* Unsupported instructions */
> +
> +static inline void run_tests(const struct test *tests, unsigned int rel_sz)
> +{
> +    printf("Test rel%u\n", rel_sz);
> +
> +    for ( unsigned int i = 0; tests[i].name; ++i )
> +    {
> +        const struct test *t = &tests[i];
> +        x86_decode_lite_t r;
> +
> +        /*
> +         * Don't end strictly at t->len.  This provides better diagnostics if
> +         * too many bytes end up getting consumed.
> +         */
> +        r = x86_decode_lite(t->ip, t->ip + /* t->len */ 20);

For the excess bytes to at least be legitimate to access (not causing UB),
shouldn't finish_arr emit enough filler bytes?

> --- /dev/null
> +++ b/tools/tests/x86-decode-lite/x86-emulate.h
> @@ -0,0 +1,27 @@
> +#ifndef X86_EMULATE_H
> +#define X86_EMULATE_H
> +
> +#include <assert.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <stdlib.h>
> +#include <string.h>
> +
> +#include <xen/asm/x86-defns.h>
> +#include <xen/asm/x86-vendors.h>
> +
> +#include <xen-tools/common-macros.h>
> +
> +#define ASSERT assert
> +
> +#define printk(...)
> +
> +#define likely
> +#define unlikely
> +#define cf_check
> +#define init_or_livepatch
> +#define init_or_livepatch_const
> +
> +#include "x86_emulate/x86_emulate.h"

Why does this end up being needed?

Jan

