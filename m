Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C97CC55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 06:45:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382851.1626125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrVNe-0000yE-4o; Wed, 05 Aug 2026 06:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382851.1626125; Wed, 05 Aug 2026 06:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrVNe-0000y7-2C; Wed, 05 Aug 2026 06:45:34 +0000
Received: by outflank-mailman (input) for mailman id 1382851;
 Wed, 05 Aug 2026 06:45:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrVNc-0000y1-8o
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 06:45:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrVNb-00B8I4-1D
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:45:31 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72dc07-5cb7-0a2a0a5109dd-0a2a450bed12-14
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 08:45:30 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72dc0a-b7e8-0a2a450b0019-d155dd32f15f-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 08:45:30 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47f7872abb6so275049f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 23:45:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47febfda0d7sm5935370f8f.2.2026.08.04.23.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2026 23:45:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1785912330; x=1786517130; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LdT17TjKaxzE87YoDYMRL848nK49edta2evd9yGu/dI=;
        b=YZpqR9qDSxMDRClRcahcKvJSkgQTLv+4UM7S+rCunLQGcVzdaOHlBHpy6gfWJLNB7M
         6m2DSEgBCBYfJYVpIdUOnV95yDIVIMvf9JHmm3eKBPCChabzLAK3Uc3CHuee27bB2fJF
         tM4Fyw+VKSAays2G9cHIWAtw7ddZHIxNzHfdwg6ABk0NEDUowl+uabGAQD5P6ikxrNur
         afb0UwKycuLneVGvyqQaiih1ZWaszGt6LsagXPsuI5F+u+RFHN3Tmnms67OfLVAO0vrt
         PW0uLcH/wjdldv2I6VGgG7X1arMgv8fSpbPWCRJVw7l/8JSlS/b5IFrviUBEaiilbZaJ
         G6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785912330; x=1786517130;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LdT17TjKaxzE87YoDYMRL848nK49edta2evd9yGu/dI=;
        b=XpoSoBmFKB/wMHgSk4x5QIKma6f7Vle0NdE9eH2k7ww2p1MAeWZYra0+AKzZzE2872
         FgEe2v13JBYr2PNZsXkoQaalL9efNE0YHT4g8W+cycwuwwhAjZdGuzRusL3TfPm+2Qj0
         LmYPHJzNVTxu0qYySiNNJLhqn/iJFDNnGqw+YC20bcnrtJP7IDSleuFTYERjpxglZCMK
         tcFxbsfJ2LIlMxnGiwuyhkosd1wSjBi178YLOGXiVmcVoDFpFx+uBe6lvhmWqfHAAjSh
         iBExTm2eT7igz8XePkiD8on5LzCpduQWSppwWr7Dq8jVsFE9dnkOAtqWJw13BXlxgtKB
         6jTw==
X-Forwarded-Encrypted: i=1; AHgh+RpJ/XkPwCOUKOQV+pgXArRgfXfkwrjgzdIt8SZXCS1bOmZoI6gYIsVF+DuhsN8afeStWYAevEVzwqI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyID3S67iv4nS7YDwHonZjpcXIEvp9nlNTvKw8yJKp9DYoBX2Tu
	z6/0yfkojW09L+li3VSQ3PbtSzoGTNuCWhWbEx1TXmAygECjKn8LVnJ2BnoTvprYVoGLEEu/tiU
	5aJGVfg==
X-Gm-Gg: AR+sD107p/W1NTaZOYaEUU5SogbOtAWzxHDusXVB6/OBfvdXtGa++z5vKh1dvxpzodn
	vsi+Qc9nXf29ySZszhUmURNNSc67npQsnUWqQY3YvPQLkmy1HtFS6MVgZumV47POuKBX+KEogC6
	4qjtN4msCX4gPj8/DrB/O4GW4j+DuMeYuoMWOD3i7gFYkygTObi0YDE8fs2UPYxTkx+mclIIeRv
	Df/aSgSAl2WSoeESlcdJ4vQK+SONtytvY/WSuf3DCBmveWPI1/Zkqp+sNwX4tB75P0kCK2FbhJV
	eFmKxuZEEywwoUcD3PvPWXSJ4n2l7Irj9/4oHIIr54jQS/25zr4VlcPMSGUURh/QfTFE+k0UmIV
	mM1iWH995ZvIhEzsjCUe2hlznBDwmtKvM4j2ab8PVwgN3OaWrMHzYfiGNa6NhPROZzrYB6m+dv0
	YJ+m8lARog3pHYNPTxOXQBVSPlN7lkiQVKxVqKyARiccJGn2PhwU8/1PlKq5kFWu3unA4Ha8Pcj
	exEfbu4QvroZJ6xaolUQQF2D64CcYXdsjLy5s/yhAOMb9GhE4pd
X-Received: by 2002:a05:6000:601:b0:47f:81c4:36b4 with SMTP id ffacd0b85a97d-47fec52172amr6515452f8f.14.1785912330171;
        Tue, 04 Aug 2026 23:45:30 -0700 (PDT)
Message-ID: <b76b3fa9-cac9-401f-adc7-88f6881a64f6@suse.com>
Date: Wed, 5 Aug 2026 08:45:28 +0200
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
In-Reply-To: <21d3fae8-e9b0-4c8a-a7b9-483a0257e44e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1785912330-A9EC69EA-AD3522B9/0/0
X-purgate-type: clean
X-purgate-size: 13130

On 04.08.2026 21:37, Andrew Cooper wrote:
> On 03/08/2026 5:03 pm, Jan Beulich wrote:
>> On 03.08.2026 09:20, Andrew Cooper wrote:
>>> --- /dev/null
>>> +++ b/tools/tests/x86-decode-lite/insns.S
>>> @@ -0,0 +1,703 @@
>>> +#include "macro-magic.h"
>>> +
>>> +        .code64
>>> +
>>> +        .allow_index_reg
>>> +
>>> +        .text
>>> +
>>> +DECL(tests_rel0)
>>> +modrm:
>>> +        /* Mod=0, Reg=0, RM {0..f} */
>>> +        _ add %al, (%rax)
>>> +        _ add %al, (%rcx)
>>> +        _ add %al, (%rdx)
>>> +        _ add %al, (%rbx)
>>> +        _ add %al, (%rsp) /* SIB */
>>> +        /*add %al, (%rbp)    RIP --> tests_rel4 */
>>> +        _ add %al, (%rsi)
>>> +        _ add %al, (%rdi)
>>> +        _ add %al, (%r8)
>>> +        _ add %al, (%r9)
>>> +        _ add %al, (%r10)
>>> +        _ add %al, (%r11)
>>> +        _ add %al, (%r12) /* SIB */
>>> +        /*add %al, (%r13)    RIP --> tests_rel4 */
>>> +        _ add %al, (%r14)
>>> +        _ add %al, (%r15)
>>> +
>>> +        /* Mod=1, Reg=0, RM {0..f} */
>>> +        _ add %al, 0x01(%rax)
>>> +        _ add %al, 0x01(%rcx)
>>> +        _ add %al, 0x01(%rdx)
>>> +        _ add %al, 0x01(%rbx)
>>> +        _ add %al, 0x01(%rsp) /* SIB */
>>> +        _ add %al, 0x01(%rbp)
>>> +        _ add %al, 0x01(%rsi)
>>> +        _ add %al, 0x01(%rdi)
>>> +        _ add %al, 0x01(%r8)
>>> +        _ add %al, 0x01(%r9)
>>> +        _ add %al, 0x01(%r10)
>>> +        _ add %al, 0x01(%r11)
>>> +        _ add %al, 0x01(%r12) /* SIB */
>>> +        _ add %al, 0x01(%r13)
>>> +        _ add %al, 0x01(%r14)
>>> +        _ add %al, 0x01(%r15)
>>> +
>>> +        /* Mod=2, Reg=0, RM {0..f} */
>>> +        _ add %al, 0x7f000001(%rax)
>>> +        _ add %al, 0x7f000001(%rcx)
>>> +        _ add %al, 0x7f000001(%rdx)
>>> +        _ add %al, 0x7f000001(%rbx)
>>> +        _ add %al, 0x7f000001(%rsp) /* SIB */
>>> +        _ add %al, 0x7f000001(%rbp)
>>> +        _ add %al, 0x7f000001(%rsi)
>>> +        _ add %al, 0x7f000001(%rdi)
>>> +        _ add %al, 0x7f000001(%r8)
>>> +        _ add %al, 0x7f000001(%r9)
>>> +        _ add %al, 0x7f000001(%r10)
>>> +        _ add %al, 0x7f000001(%r11)
>>> +        _ add %al, 0x7f000001(%r12) /* SIB */
>>> +        _ add %al, 0x7f000001(%r13)
>>> +        _ add %al, 0x7f000001(%r14)
>>> +        _ add %al, 0x7f000001(%r15)
>>> +
>>> +        /* Mod=3, Reg=0, RM {0..f} */
>>> +        _ add %al, %al
>>> +        _ add %al, %cl
>>> +        _ add %al, %dl
>>> +        _ add %al, %bl
>>> +        _ add %al, %ah
>>> +        _ add %al, %ch
>>> +        _ add %al, %dh
>>> +        _ add %al, %dl
>> Perhaps also include %bpl, %sil, and %dil?
> 
> They're not relevant to this test, and interfere with the intentional
> pattern set up.

Hmm, how does a particular pattern matter here? I don't think you test those
cases (or more generally an empty REX prefix) anywhere else.

>>> +DECL(tests_rel1)
>>> +disp8:
>>> +1:
>>> +        _ jo   1b
>>> +        _ jno  1b
>>> +        _ jb   1b
>>> +        _ jae  1b
>>> +        _ je   1b
>>> +        _ jne  1b
>>> +        _ jbe  1b
>>> +        _ ja   1b
>>> +        _ js   1b
>>> +        _ jns  1b
>>> +        _ jp   1b
>>> +        _ jnp  1b
>>> +        _ jl   1b
>>> +        _ jge  1b
>>> +        _ jle  1b
>>> +        _ jg   1b
>>> +        _ jmp  1b
>>> +
>>> +disp8_rex:
>>> +        _ rex.w jo   1b
>>> +        _ rex.w jno  1b
>>> +        _ rex.w jb   1b
>>> +        _ rex.w jae  1b
>>> +        _ rex.w je   1b
>>> +        _ rex.w jne  1b
>>> +        _ rex.w jbe  1b
>>> +        _ rex.w ja   1b
>>> +        _ rex.w js   1b
>>> +        _ rex.w jns  1b
>>> +        _ rex.w jp   1b
>>> +        _ rex.w jnp  1b
>>> +        _ rex.w jl   1b
>>> +        _ rex.w jge  1b
>>> +        _ rex.w jle  1b
>>> +        _ rex.w jg   1b
>>> +        _ rex.w jmp  1b
>>> +END(tests_rel1)
>> What's the idea behind the separate REX.W testing?
> 
> Testing osize handling vs Imm8/Imm.

I see, albeit I very much hope osize would never, ever have an effect on Imm8
encodings, as far as the size of the immediate goes.

>>  It almost suggests that
>> tests with an operand size prefix also may want adding. Except that's
>> difficult, because of ...
>>
>>> +DECL(tests_rel4)
>>> +disp32:
>>> +        _ call   other_section
>>> +        _ jmp    other_section
>>> +        _ jo     other_section
>>> +        _ jno    other_section
>>> +        _ jb     other_section
>>> +        _ jae    other_section
>>> +        _ je     other_section
>>> +        _ jne    other_section
>>> +        _ jbe    other_section
>>> +        _ ja     other_section
>>> +        _ js     other_section
>>> +        _ jns    other_section
>>> +        _ jp     other_section
>>> +        _ jnp    other_section
>>> +        _ jl     other_section
>>> +        _ jge    other_section
>>> +        _ jle    other_section
>>> +        _ jg     other_section
>>> +        _ xbegin other_section
>>> +
>>> +disp32_rex:
>>> +        _ rex.w call   other_section
>>> +        _ rex.w jmp    other_section
>>> +        _ rex.w jo     other_section
>>> +        _ rex.w jno    other_section
>>> +        _ rex.w jb     other_section
>>> +        _ rex.w jae    other_section
>>> +        _ rex.w je     other_section
>>> +        _ rex.w jne    other_section
>>> +        _ rex.w jbe    other_section
>>> +        _ rex.w ja     other_section
>>> +        _ rex.w js     other_section
>>> +        _ rex.w jns    other_section
>>> +        _ rex.w jp     other_section
>>> +        _ rex.w jnp    other_section
>>> +        _ rex.w jl     other_section
>>> +        _ rex.w jge    other_section
>>> +        _ rex.w jle    other_section
>>> +        _ rex.w jg     other_section
>>> +        _ rex.w xbegin other_section
>> ... vendor differences here. Perhaps the decoder itself would better
>> reject handling of operand-size-prefixed branches.
> 
> Excluding 66-prefix is easy, but excluding rex.w on jumps is hard and
> would require extra logic.

To exclude 66 is all I was suggesting. REX.W isn't treated differently by
the vendors, afaik, likely simply because it's meaningless altogether for
these insns.

>>> +opsize_branch: /* 66-prefixed branches are decoded differently by vendors */
>>> +        _ data16 call   other_section
>>> +        _ data16 jmp    other_section
>>> +        _ data16 jo     other_section
>>> +        _ data16 jno    other_section
>>> +        _ data16 jb     other_section
>>> +        _ data16 jae    other_section
>>> +        _ data16 je     other_section
>>> +        _ data16 jne    other_section
>>> +        _ data16 jbe    other_section
>>> +        _ data16 ja     other_section
>>> +        _ data16 js     other_section
>>> +        _ data16 jns    other_section
>>> +        _ data16 jp     other_section
>>> +        _ data16 jnp    other_section
>>> +        _ data16 jl     other_section
>>> +        _ data16 jge    other_section
>>> +        _ data16 jle    other_section
>>> +        _ data16 jg     other_section
>>> +        _ data16 xbegin other_section
>> Oh, you even cover the case here. For XBEGIN, however, this can only be pure
>> guesswork as to AMD behavior, I suppose.
> 
> Remember that RTM is available on Zen2 if you know which chickenbits to
> clobber.
> 
> I've not tried.  I expect it's more likely that they behave consistently
> than differently.
> 
>> I also don't see how you force which form you want.
> 
> Binutils always produces AMD behaviour.  (As far as I can see.)

By default, yes. Quite some time ago CALL and JMP were covered more
correctly, via the -mamd64 / -mintel64 cmdline options. Not very long ago
I realized we had never extended that to Jcc.

> This is in the negative-tests section, which confirms that
> x86_decode_lite() rejects the byte pattern.
> 
> If Binutils changes behaviour, the test will start failing.

Changing the default behavior seems extremely unlikely to me. Changing
the non default behavior, otoh, has happened (and if need be could
happen again).

Anyway, all of this is becoming moot if 66 was rejected on branches.

>>> --- /dev/null
>>> +++ b/tools/tests/x86-decode-lite/main.c
>>> @@ -0,0 +1,111 @@
>>> +/*
>>> + * Userspace test harness for x86_decode_lite().
>>> + */
>>> +#include <stdio.h>
>>> +
>>> +#include "x86-emulate.h"
>>> +
>>> +static unsigned int nr_failures;
>>> +#define fail(t, fmt, ...)                                       \
>>> +({                                                              \
>>> +    const unsigned char *insn = (t)->ip;                        \
>>> +                                                                \
>>> +    nr_failures++;                                              \
>>> +                                                                \
>>> +    (void)printf("  Fail '%s' [%02x", (t)->name, *insn);        \
>>> +    for ( unsigned int i = 1; i < (t)->len; i++ )               \
>>> +        printf(" %02x", insn[i]);                               \
>>> +    printf("]\n");                                              \
>>> +                                                                \
>>> +    (void)printf(fmt, ##__VA_ARGS__);                           \
>>> +})
>>> +
>>> +struct test {
>>> +    const char *name;
>>> +    void *ip;
>>> +    unsigned long len;
>>> +};
>>> +
>>> +extern const struct test
>>> +/* Defined in insns.S, ends with sentinel */
>>> +    tests_rel0[], /* No relocatable entry */
>>> +    tests_rel1[], /* disp8 */
>>> +    tests_rel4[], /* disp32 or RIP-relative */
>>> +    tests_unsup[]; /* Unsupported instructions */
>>> +
>>> +static inline void run_tests(const struct test *tests, unsigned int rel_sz)
>>> +{
>>> +    printf("Test rel%u\n", rel_sz);
>>> +
>>> +    for ( unsigned int i = 0; tests[i].name; ++i )
>>> +    {
>>> +        const struct test *t = &tests[i];
>>> +        x86_decode_lite_t r;
>>> +
>>> +        /*
>>> +         * Don't end strictly at t->len.  This provides better diagnostics if
>>> +         * too many bytes end up getting consumed.
>>> +         */
>>> +        r = x86_decode_lite(t->ip, t->ip + /* t->len */ 20);
>> For the excess bytes to at least be legitimate to access (not causing UB),
>> shouldn't finish_arr emit enough filler bytes?
> 
> finish_arr is the wrong place, but I've folded in:
> 
> diff --git a/tools/tests/x86-decode-lite/insns.S b/tools/tests/x86-decode-lite/insns.S
> index e52c2934c8d8..dc017016b2d2 100644
> --- a/tools/tests/x86-decode-lite/insns.S
> +++ b/tools/tests/x86-decode-lite/insns.S
> @@ -695,6 +695,13 @@ unsup_insn: /* Instructions that would complicated decode, or shouldn't be used
>  
>  END(tests_unsup)
>  
> +        /*
> +         * For improved diagnostics, we allow some overreading of the
> +         * instruction under test.  Ensure there are good bytes to read.
> +         */
> +overread_padding:
> +        .skip 20
> +
>          /* This is here to cause jmps to use their disp32 form. */
>          .section .text.other_section, "ax", @progbits
>  other_section:

How would this help? run_tests() is never invoked with tests_unsup[] as
argument. And run_tests_unsup() wants to only fetch up to t->len.

>>> --- /dev/null
>>> +++ b/tools/tests/x86-decode-lite/x86-emulate.h
>>> @@ -0,0 +1,27 @@
>>> +#ifndef X86_EMULATE_H
>>> +#define X86_EMULATE_H
>>> +
>>> +#include <assert.h>
>>> +#include <stdbool.h>
>>> +#include <stdint.h>
>>> +#include <stdlib.h>
>>> +#include <string.h>
>>> +
>>> +#include <xen/asm/x86-defns.h>
>>> +#include <xen/asm/x86-vendors.h>
>>> +
>>> +#include <xen-tools/common-macros.h>
>>> +
>>> +#define ASSERT assert
>>> +
>>> +#define printk(...)
>>> +
>>> +#define likely
>>> +#define unlikely
>>> +#define cf_check
>>> +#define init_or_livepatch
>>> +#define init_or_livepatch_const
>>> +
>>> +#include "x86_emulate/x86_emulate.h"
>> Why does this end up being needed?
> 
> Well, this for starters:
> 
> main.c: In function ‘run_tests’:
> main.c:43:9: error: unknown type name ‘x86_decode_lite_t’
>    43 |         x86_decode_lite_t r;
>       |         ^~~~~~~~~~~~~~~~~
> main.c:49:13: error: implicit declaration of function ‘x86_decode_lite’ [-Werror=implicit-function-declaration]
>    49 |         r = x86_decode_lite(t->ip, t->ip + /* t->len */ 20);
>       |             ^~~~~~~~~~~~~~~

Hmm, yes, that should have been obvious, if only I didn't expect decode-lite
to be largely (up to entirely) independent of the core emulator, irrespective
of its placement in the same dir. x86_emulate/x86_emulate.h is a pretty
involved header, which I think would be nice to avoid growing more
dependencies on. Then again it looks as if about every object file already
depends on it (which imo is bad).

Jan

