Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2978CC5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 06:01:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393407.1632207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwCtA-0002JS-MB; Tue, 18 Aug 2026 06:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393407.1632207; Tue, 18 Aug 2026 06:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwCtA-0002JL-Jb; Tue, 18 Aug 2026 06:01:32 +0000
Received: by outflank-mailman (input) for mailman id 1393407;
 Tue, 18 Aug 2026 06:01:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwCt9-0002JF-Ih
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 06:01:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwCt8-00Fgci-JJ
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:01:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a83f53a-bab6-0a2a0a5309dd-0a2a45088aa2-0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:01:30 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a83f534-f659-0a2a45080019-d1558029d87c-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:01:24 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4998e0916faso23063665e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 23:01:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d10ba73sm105465885e9.13.2026.08.17.23.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 23:01:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1787032884; x=1787637684; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NOp3YRdEs0Br3Bo1DJ4Emf3CGg1rsxA93QX7Vcmweq0=;
        b=gM8imaItgNuuoVDfAJGx0qPuDFvytYxvXBc2d/ZGVfcBUUhCHs2kJDqLuQiucWfjzf
         hUlNVajWimJqYWQxgzQVGuoA5wuds/4ZUQ/jPvn4lZnhEGHl1/Uum2oLde3fceudEQTN
         oWrhwl2cqkPzMpzf1tbskcdoEaMk3Xu5IiomoNSbE3aAIpXU3F7vpxjYoROwQrZq8QEf
         ySEfQ9lUEVLMD6+XzLBm+im3QgaU+tsP8Qphxx6AbbJgPweY3cwVEEwS6zcvipQ7OITT
         /zsl8FETowhXpXEsRMS/8bPG0z4HMyogbfZbg8tu000MBSKpxrcPQwYECEMoJXrTgBmZ
         msTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787032884; x=1787637684;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NOp3YRdEs0Br3Bo1DJ4Emf3CGg1rsxA93QX7Vcmweq0=;
        b=JIlPZZPKx0B4KpzZm0g0dlzVDAodXa+Vm7V+ZE4akc60vNyYEU/taBDjjOWrR7STYh
         c3Fdqg9zylYm5RNZI4uEGs/Be9uP8wU0MJ25TWcnFt6oErWaJp5IwUKq7hxYDxoMO0jJ
         CPA7zf3aEjHhc/qTy5x/RzR5UJf8j4SxCoyavT9llEd8aaHGJUyc2irOXGmiTiYcbjOr
         Vd2hBPrAE444Y5AX8kuNdkQoJEVdTVQX7pno2SqKASFYZWf5fUsLvx+EqMIS62IRHI21
         k5Z/Z2n1UIqTdyOqCA7Mb/hy7o6503+K6nBpJQUCez8XBP7cmYlXd/dMQT8SkaHExIE2
         vHRA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7bF1xf5W5a7KUBeUjuQBFZ7nYFj16AKL7UG0d7nCUHT9Gq+YYmSdrKoSsmWL+/PeU1LeDIvb7gUM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxF5vZstmnVSKQ+JSoefqNw+/k6G1w4h2EOfdZdD3Mc0uiayE0y
	IbRLJJWkIzAY1N4onK9W3tPZ/rgA3rafL69rg5Ownu6fF6Yi/jQlYOU/swHPOPUMsw==
X-Gm-Gg: AR+sD10RE7rD70B1stvqM70S/smZtTasP6+9tmCuAJlexkz7cgDYPJU4l/ksua1ibDp
	/OeASKpLfmksHqwRgKdKATdFvVa+rdlZNuVpdZ46leKbaSwJ8bDNre0P8MAn6+sg3ooLS0JEBzp
	DoNSXBKEZV6IN6pClmOHab9bD6EUSUrUlUUvpB1awCBrNy/8+J5a44VLtN9ga+SjnMqdl8rAyis
	dRO9qRrWfX8vHwnLO+Oo72B7yc5J+IL0FHLlqZ3en7Yk54Vw1UzcOprQhPsIZX5jR4qSYLbc+KQ
	X2+A2Pu14fkrF4B47UIOQz46sj42kIFSE7G2szg4jy0E/DkoaFW9RA4aJEUL4Umq2OmBsZNN2Vn
	CpF2aT6pKYdBmmV+r2cpORCi4rf2yhRnU3AwB5IVMkYhVhpFs/rANZ2KDLxZDRAAsEoNb+iCYqh
	hlSQGtNgDhsKD0zOoY5peRW7hQHDz+0YdnYpir0ytL7SWyCMdWupjYMQHRYRkw7OsnwHrnAgsnG
	F8aaQgRyQI6JfGxLl+OkokQ1XiV11qTLl3BtZWTLyxkbDDnf3Vv
X-Received: by 2002:a05:600c:820d:b0:499:7a36:88b with SMTP id 5b1f17b1804b1-4998794402emr532729175e9.5.1787032884143;
        Mon, 17 Aug 2026 23:01:24 -0700 (PDT)
Message-ID: <f40229a5-6108-4d92-b612-a9daa2c83474@suse.com>
Date: Tue, 18 Aug 2026 08:01:22 +0200
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
 <dd065a33-0105-4527-92f5-f3f127422ee6@suse.com>
 <21d3fae8-e9b0-4c8a-a7b9-483a0257e44e@citrix.com>
 <b76b3fa9-cac9-401f-adc7-88f6881a64f6@suse.com>
 <5b358558-1b17-49b2-af5e-37981d11094f@citrix.com>
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
In-Reply-To: <5b358558-1b17-49b2-af5e-37981d11094f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1787032889-D477387B-7D8B61CE/0/0
X-purgate-type: clean
X-purgate-size: 7307

On 17.08.2026 14:40, Andrew Cooper wrote:
> On 05/08/2026 7:45 am, Jan Beulich wrote:
>> On 04.08.2026 21:37, Andrew Cooper wrote:
>>> On 03/08/2026 5:03 pm, Jan Beulich wrote:
>>>> On 03.08.2026 09:20, Andrew Cooper wrote:
>>>>> --- /dev/null
>>>>> +++ b/tools/tests/x86-decode-lite/insns.S
>>>>> @@ -0,0 +1,703 @@
>>>>> +#include "macro-magic.h"
>>>>> +
>>>>> +        .code64
>>>>> +
>>>>> +        .allow_index_reg
>>>>> +
>>>>> +        .text
>>>>> +
>>>>> +DECL(tests_rel0)
>>>>> +modrm:
>>>>> +        /* Mod=0, Reg=0, RM {0..f} */
>>>>> +        _ add %al, (%rax)
>>>>> +        _ add %al, (%rcx)
>>>>> +        _ add %al, (%rdx)
>>>>> +        _ add %al, (%rbx)
>>>>> +        _ add %al, (%rsp) /* SIB */
>>>>> +        /*add %al, (%rbp)    RIP --> tests_rel4 */
>>>>> +        _ add %al, (%rsi)
>>>>> +        _ add %al, (%rdi)
>>>>> +        _ add %al, (%r8)
>>>>> +        _ add %al, (%r9)
>>>>> +        _ add %al, (%r10)
>>>>> +        _ add %al, (%r11)
>>>>> +        _ add %al, (%r12) /* SIB */
>>>>> +        /*add %al, (%r13)    RIP --> tests_rel4 */
>>>>> +        _ add %al, (%r14)
>>>>> +        _ add %al, (%r15)
>>>>> +
>>>>> +        /* Mod=1, Reg=0, RM {0..f} */
>>>>> +        _ add %al, 0x01(%rax)
>>>>> +        _ add %al, 0x01(%rcx)
>>>>> +        _ add %al, 0x01(%rdx)
>>>>> +        _ add %al, 0x01(%rbx)
>>>>> +        _ add %al, 0x01(%rsp) /* SIB */
>>>>> +        _ add %al, 0x01(%rbp)
>>>>> +        _ add %al, 0x01(%rsi)
>>>>> +        _ add %al, 0x01(%rdi)
>>>>> +        _ add %al, 0x01(%r8)
>>>>> +        _ add %al, 0x01(%r9)
>>>>> +        _ add %al, 0x01(%r10)
>>>>> +        _ add %al, 0x01(%r11)
>>>>> +        _ add %al, 0x01(%r12) /* SIB */
>>>>> +        _ add %al, 0x01(%r13)
>>>>> +        _ add %al, 0x01(%r14)
>>>>> +        _ add %al, 0x01(%r15)
>>>>> +
>>>>> +        /* Mod=2, Reg=0, RM {0..f} */
>>>>> +        _ add %al, 0x7f000001(%rax)
>>>>> +        _ add %al, 0x7f000001(%rcx)
>>>>> +        _ add %al, 0x7f000001(%rdx)
>>>>> +        _ add %al, 0x7f000001(%rbx)
>>>>> +        _ add %al, 0x7f000001(%rsp) /* SIB */
>>>>> +        _ add %al, 0x7f000001(%rbp)
>>>>> +        _ add %al, 0x7f000001(%rsi)
>>>>> +        _ add %al, 0x7f000001(%rdi)
>>>>> +        _ add %al, 0x7f000001(%r8)
>>>>> +        _ add %al, 0x7f000001(%r9)
>>>>> +        _ add %al, 0x7f000001(%r10)
>>>>> +        _ add %al, 0x7f000001(%r11)
>>>>> +        _ add %al, 0x7f000001(%r12) /* SIB */
>>>>> +        _ add %al, 0x7f000001(%r13)
>>>>> +        _ add %al, 0x7f000001(%r14)
>>>>> +        _ add %al, 0x7f000001(%r15)
>>>>> +
>>>>> +        /* Mod=3, Reg=0, RM {0..f} */
>>>>> +        _ add %al, %al
>>>>> +        _ add %al, %cl
>>>>> +        _ add %al, %dl
>>>>> +        _ add %al, %bl
>>>>> +        _ add %al, %ah
>>>>> +        _ add %al, %ch
>>>>> +        _ add %al, %dh
>>>>> +        _ add %al, %dl
>>>> Perhaps also include %bpl, %sil, and %dil?
>>> They're not relevant to this test, and interfere with the intentional
>>> pattern set up.
>> Hmm, how does a particular pattern matter here? I don't think you test those
>> cases (or more generally an empty REX prefix) anywhere else.
> 
> There's nothing structurally interesting about those; I'm not testing
> the assembler, and x86_decode_lite() doesn't decode registers.
> 
> The ModRM byte has multiple structurally interesting interactions with
> REX prefixes, hence the coverage of Mod and RM value.

If covering _every_ bit pattern of ModR/M.rm is of interest, I simply find
I hard to see why also covering them empty-REX case should be of no
interest at all.

> The patten makes it trivial to look at the disassembled result and check
> the coverage.  (And spot the bug that's hiding in plain sight above.)

Oh, I see (now).

>>>>> --- /dev/null
>>>>> +++ b/tools/tests/x86-decode-lite/main.c
>>>>> @@ -0,0 +1,111 @@
>>>>> +/*
>>>>> + * Userspace test harness for x86_decode_lite().
>>>>> + */
>>>>> +#include <stdio.h>
>>>>> +
>>>>> +#include "x86-emulate.h"
>>>>> +
>>>>> +static unsigned int nr_failures;
>>>>> +#define fail(t, fmt, ...)                                       \
>>>>> +({                                                              \
>>>>> +    const unsigned char *insn = (t)->ip;                        \
>>>>> +                                                                \
>>>>> +    nr_failures++;                                              \
>>>>> +                                                                \
>>>>> +    (void)printf("  Fail '%s' [%02x", (t)->name, *insn);        \
>>>>> +    for ( unsigned int i = 1; i < (t)->len; i++ )               \
>>>>> +        printf(" %02x", insn[i]);                               \
>>>>> +    printf("]\n");                                              \
>>>>> +                                                                \
>>>>> +    (void)printf(fmt, ##__VA_ARGS__);                           \
>>>>> +})
>>>>> +
>>>>> +struct test {
>>>>> +    const char *name;
>>>>> +    void *ip;
>>>>> +    unsigned long len;
>>>>> +};
>>>>> +
>>>>> +extern const struct test
>>>>> +/* Defined in insns.S, ends with sentinel */
>>>>> +    tests_rel0[], /* No relocatable entry */
>>>>> +    tests_rel1[], /* disp8 */
>>>>> +    tests_rel4[], /* disp32 or RIP-relative */
>>>>> +    tests_unsup[]; /* Unsupported instructions */
>>>>> +
>>>>> +static inline void run_tests(const struct test *tests, unsigned int rel_sz)
>>>>> +{
>>>>> +    printf("Test rel%u\n", rel_sz);
>>>>> +
>>>>> +    for ( unsigned int i = 0; tests[i].name; ++i )
>>>>> +    {
>>>>> +        const struct test *t = &tests[i];
>>>>> +        x86_decode_lite_t r;
>>>>> +
>>>>> +        /*
>>>>> +         * Don't end strictly at t->len.  This provides better diagnostics if
>>>>> +         * too many bytes end up getting consumed.
>>>>> +         */
>>>>> +        r = x86_decode_lite(t->ip, t->ip + /* t->len */ 20);
>>>> For the excess bytes to at least be legitimate to access (not causing UB),
>>>> shouldn't finish_arr emit enough filler bytes?
>>> finish_arr is the wrong place, but I've folded in:
>>>
>>> --- a/tools/tests/x86-decode-lite/insns.S
>>> +++ b/tools/tests/x86-decode-lite/insns.S
>>> @@ -695,6 +695,13 @@ unsup_insn: /* Instructions that would complicated decode, or shouldn't be used
>>>  
>>>  END(tests_unsup)
>>>  
>>> +        /*
>>> +         * For improved diagnostics, we allow some overreading of the
>>> +         * instruction under test.  Ensure there are good bytes to read.
>>> +         */
>>> +overread_padding:
>>> +        .skip 20
>>> +
>>>          /* This is here to cause jmps to use their disp32 form. */
>>>          .section .text.other_section, "ax", @progbits
>>>  other_section:
>> How would this help? run_tests() is never invoked with tests_unsup[] as
>> argument. And run_tests_unsup() wants to only fetch up to t->len.
> 
> Oh, in which case nothing is needed at all.  I'll take it back out.

Yet then, as previously indicated, the possible overrun in run_tests()'
fetching will want covering. Hence why I suggested the particular other
place to put extra padding.

Jan

