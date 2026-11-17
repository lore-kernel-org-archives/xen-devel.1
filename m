Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66415606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 08:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=HdEJQM8l
Received: from list by lists.xenproject.org with outflank-mailman.1491942.1692627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEVB-000069-8X; Tue, 17 Nov 2026 08:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491942.1692627; Tue, 17 Nov 2026 08:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTEVB-000061-5m; Tue, 17 Nov 2026 08:25:17 +0000
Received: by outflank-mailman (input) for mailman id 1491942;
 Tue, 17 Nov 2026 08:25:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTEV9-00005v-Gj
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 08:25:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTEV8-00Ak2V-Ec
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 09:25:14 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc0f5f-e002-0a2a0a5209dd-0a2a4503db1c-32
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:25:14 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afc0f69-fae8-0a2a45030019-d155802cdc0f-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:25:13 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4bb6c7b6dbdso26196245e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 00:25:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb783853b5sm51434645e9.2.2026.11.17.00.25.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2026 00:25:12 -0800 (PST)
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
        d=suse.com; s=google; t=1794903913; x=1795508713; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A/e7Pgzr1crb4oFCa7jFyqiS3XgiVyrISKnK13G9sqs=;
        b=HdEJQM8li1sU6dfRGrxAE1qZuOmMpmmepPx+mr6Sv+vlVRoT7cRTlsjccwrOOXhd6A
         37Sb3GCB8k5QJIA3KPz7fdreNEXLO5riYwqZ1hiGjx2jD4DDpFqdwxwENsUNX6CLsY3e
         fLeH4vQxTYuWfKXgwKCvlyM0V1DpeZvdL68ojp0W3Pb+tpvJcGuWuBYsiYvLrXceZVf5
         AsGrzmoB4hdF/eak/8eMQtnd90iSSkzQj2WseW0rrcb7Hc24+5xvEIfKxTWCcW0iDNtD
         15bcrYQHGPp9UVw+kDcY4aC/MqGbxDIRCltjDWiiMUS4XudurYDHcRq5x8tGDLTKJ7lp
         EFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903913; x=1795508713;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/e7Pgzr1crb4oFCa7jFyqiS3XgiVyrISKnK13G9sqs=;
        b=dOEalilj6mfJArwEfD/A4PMKSABNhKJz3lRgTGzYjti3Dp5IK1v4oxL0KWsAu8e4AE
         pJUBdBmVO0e9FH5w8Zo8lElM0P7f5fvvUFp6V1sKYViJtHGcD1gHzuH2emtEy1smB22V
         cQzh434pSrD/HiIdkQM9cZnAIeGodQn9kfCi3ikf3RtIYb/zwHa3pokJwxCzRsCIvHoj
         37Rkr/3RX2t2n8VVngBnlrCQl4CIr1iwniT2Gtg4AewHIwZx39OwVI8C1IJhvQHcwywS
         MtmnhcOc0mEdtOAVRESr/U5OZvmuE7EGfz0wUhO1JkZYxpMcc0NTzkB6x6oj/Nm2amZw
         iokA==
X-Forwarded-Encrypted: i=1; AL+hErHsWs5hQOKYqEqRwXwwQ435uyl2boVVc9JNK/ywlkwX6VyKqKOhO+gLM4FhTPaAwV8CiIdDT4QiIDY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+mlg37DipwDU/7L9BPkmcJEtrkD2hlojzSKy6vTGNihMcN05gH
	B8fkKucFoR3BLhX7HRkzQ80zTgMzh+gdiaziXCCQ8rXOvdjKN693i8fVkgabTAmWwA==
X-Gm-Gg: AYBFou16hddw5iKGRspx7YbqQG7HswbHBMOvj+IrrwMikY8KsGk2GeCHVeZ+R6+sZmw
	Ob3qVveSsfjQjD0NZ6C8VhBdZuEYC/y/n84pureT+XQnOUkBLdCVQspRiSpE70EPuRuJBN3rI4S
	hG3HgW4uqdldauC/cTequT+A/Kcba9QuKWTsEFsJQSS3fnfDTVP0j5a/MGmeGE7GcxXaPFqMMy3
	WRxuXS9y4daY/9iVOoSmP5QygYc9gwLCtI5cZ44OpI6nFDiYE6933Z1Vb0nx9A/ujwAWm2yPoP4
	otPjBcTTprynQYFARxKzGX+w7I2HFezsVvqoiKrPYfzdq8rjbZNjK1x3LL6nc0pyA/EtvXUCVKj
	c6WXdUy1bzLAffUQKhC1cjO9Db0ElwNEk2jTZyJTKBqrWUPFgvOP+TTmdo/wgYCpJ5sZg9lxGYS
	euZL1Ddacx/fO4YmtS7zS2iSUsTN+DPn1HhWwNKGcHplpc1WITXMv8U80vIyCda4GEtY+oVN7hA
	21GEn/3nJj5/2P8Gc/ywPEef24SfLymQ4giNJEJtMqAqfDBKIfwNzPYdZSQqUf+XRQnBv+gB2af
	waMEuy8AQiw0qKi9LvzBtvpvPaWyyt+Lbg6Yu6CYQmEs4DOsuHYoEiGtmbdaSJEevj5jbBfrVX9
	jTz36fWMPJQvKw1fyPg==
X-Received: by 2002:a05:600c:501f:b0:4bb:76f6:d23a with SMTP id 5b1f17b1804b1-4bb779f5b93mr59729635e9.21.1794903912898;
        Tue, 17 Nov 2026 00:25:12 -0800 (PST)
Message-ID: <521ed475-45b0-4dfa-8b66-11d5f76a2a96@suse.com>
Date: Tue, 17 Nov 2026 09:25:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86emul: Zero-extend unsigned 8-bit immediates when
 decoding
To: Stephen Cheng <stephen.cheng@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261117025010.229327-1-stephen.cheng@citrix.com>
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
In-Reply-To: <20261117025010.229327-1-stephen.cheng@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1794903913-6D2D84E9-DE403F16/10/78276251493
X-purgate-type: spam
X-purgate-size: 3303
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17.11.2026 03:50, Stephen Cheng wrote:
> The decoder sign-extends all 8-bit immediates. This is right for e.g.
> Jcc rel8 and Grp1 (83), but some 8-bit immediates are unsigned: the
> vector of INT, the port of IN/OUT, the base of AAM/AAD, the count of
> the Grp2 shifts (C0, C1), and the 8-bit immediates in the 0F, 0F3A and
> XOP08 maps. For these, s->imm1 holds a wrong value for 0x80 and above.
> x86_insn_immediate() can return this value too.
> 
> The worst case is INT $0x80 to INT $0xff, which puts a negative vector
> into the event (e.g. -128 for 0x80). hvm_inject_event() then fails its
> "vector == event->vector" assertion, and a debug Xen panics. An HVM
> guest can trigger this with the forced emulation prefix (hvm_fep).
> 
> Zero-extend these immediates in the decoder. At the IN/OUT and AAM/AAD
> use sites, replace the (uint8_t) casts, which are not needed any more,
> with ASSERT()s.
> 
> Fixes: 653cae725cea ("x86/32on64: use generic instruction decoding for call gate emulation")
> Fixes: 52053d5fc2f9 ("x86/emul: Drop swint_emulate infrastructure")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -1804,6 +1816,8 @@ int x86emul_decode(struct x86_emulate_state *s,
>          break;
>  
>      case ext_0f3a:
> +        /* All immediates in this encoding space are unsigned ones. */
> +        s->imm1 &= 0xff;
>          d = ext0f3a_table[b].to_mem ? DstMem | SrcReg : DstReg | SrcMem;
>          if ( ext0f3a_table[b].two_op )
>              d |= TwoOp;

RORX in this space is interesting. Both AMD and Intel implicitly say the
immediate there is unsigned (by clarifying that the upper few bits are
ignored), but (largely like for VPROTx below, just with directions
reversed) one can view negative values are rotates to the left.

> @@ -1814,6 +1828,8 @@ int x86emul_decode(struct x86_emulate_state *s,
>          break;
>  
>      case ext_8f08:
> +        /* All immediates in this encoding space are unsigned ones. */
> +        s->imm1 &= 0xff;
>          d = DstReg | SrcMem;
>          if ( ext8f08_table[b].two_op )
>              d |= TwoOp;

I think I'll adjust this comment slightly: For VPROTx one can look at the
immediate as both signed and unsigned: "When the count value is negative,
bits are rotated to the right". I.e. I'll do s/are/can be viewed as/.

Would you further be up to following up with another, smaller patch
dealing with a similar issue? XOP0A has a 32-bit immediate, which we
(apparently wrongly) sign-extend, as all three insns there use only the
low 16 bits anyway. (This only affects x86_insn_immediate() afaics.)
This may extend elsewhere, so the scope of this isn't entirely clear just
yet: For example, MOV (opcode B8) in 64-bit mode without REX.W zero-
extends its immediate. The zero-extension we do in decode_onebyte() for
the REX.W case wants pulling out. The 16-bit forms may also better zero-
extend their immediates.

While benign there (for now), I'll adjust the JMPABS patch in the APX
series accordingly as well. Similarly Map7 handling will want to have
the immediate zero-extended (for now uniformly), even if again only for
x86_insn_immediate()'s sake.

Jan

