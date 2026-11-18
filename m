Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9C6606A32C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 09:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bGSGidBv
Received: from list by lists.xenproject.org with outflank-mailman.1494090.1693767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbhr-00066s-E6; Wed, 18 Nov 2026 09:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494090.1693767; Wed, 18 Nov 2026 09:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbhr-00066l-BK; Wed, 18 Nov 2026 09:11:55 +0000
Received: by outflank-mailman (input) for mailman id 1494090;
 Wed, 18 Nov 2026 09:11:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTbhq-00066f-GA
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:11:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTbhp-000U7B-Sa
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 10:11:53 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd6bd8-2eae-0a2a0a5409dd-0a2a4509c9d8-10
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 10:11:53 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd6bd9-be1a-0a2a45090019-d1558029b4e9-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 10:11:53 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4bb69f5b161so4504045e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 01:11:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb78422d2dsm188324875e9.10.2026.11.18.01.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 01:11:52 -0800 (PST)
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
        d=suse.com; s=google; t=1794993113; x=1795597913; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvkYIFPnR+UFtN+aOzqZ3Zynfu9Dz52iRzf4nUeu1ao=;
        b=bGSGidBvyZtTtdvnwmDwhar5jKS4o2JQq7ANNmFr1uEIGiCgOR5LGvcYvfnodQt7M1
         gykfkF8GUYEGXfi0Stf1OCTFF+hgi4lXyK3Lkh9pwq1JhXJGivGc/u/H9sqMFGzREjRk
         QiXoBSnmidDoY9P8y02FxxdA4H2y8hgqWjFaxjxM2tuRzicMXuFIqfZNskSLi24SyRV8
         ONskCL3UmVpd0YvADrx7RLjs0S4bWkEoi+896PGTSSdxbLUBXqc79XTVkZAoAed3TB50
         dk1ARWezTkWDnl6cCe35ibm/aWvf5hUxvOWkRLe8xq32NRU2u/56OUHIJq79+Z6KrSum
         7i6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993113; x=1795597913;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LvkYIFPnR+UFtN+aOzqZ3Zynfu9Dz52iRzf4nUeu1ao=;
        b=nOJzIAUMK6sbftKgFfMbVT764ZW9CLZNX/HHMpAy9cZ4ytcxdYWkFgdZhE/u3BOX5Z
         0cJEvQi+bFcgUOoHKNY6NO/HDnRV1U+UjuhgFkfqs8A9jMbuE7cZS9Zas9DegCl7X0t7
         Nvukzza/PYbwolUTVjzDzDweA7tzaKhnqw+y/pXuGe8AoJwE4BopYYgflH5gZk3HiHyi
         Ob6CAddXWdtkYz4dnrrXcVH5F+AgXW8SQFoG0m4h1tEtDjfDVSkVAReZtoPz40V/si8f
         jH/xxf8mibp5mxH6WWep1q3FejzB+VJL6BpBnbJH1LXdpg8QnLc4V/ACdPnt5eJhoIPI
         xywg==
X-Forwarded-Encrypted: i=1; AL+hErEOIP4q5jwdObx26lKARafPkN82OtvEJ8jLL1wTtGFBctZAIHsphGgDrMV8iGWu78ewBOjK838aBmo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9ktaWvmw6NiftOek6ADn6954lduDehoamvVmjPUaQgix1uFJav
	m/7V0ySQOxCfE6SZ/QhNqXc6N7G8p3IvXqCUVLlfywPsNqgHCxkxur1bHiOoyQyhYw==
X-Gm-Gg: AYBFou3FHydcuzAcqWxwNvJaq6IFI7RuVmX1CcYdNt4K7irQNkW0PSbVEtnU3JZtVac
	B+s/W6we8lXbqIOXAr3AEL84xtFsza8H1gfGjrKealCUKGXNCfEKokxMGv5Yyab8i1b1nnNPhoT
	DNzbAaPWylx1akOv9BCL3c+kM3J4u3sIPtz1aPiCtcvgAr9RhhnGxmgkSOuul1178Lk2GzRUBIn
	W/3VhoVA9okZe45IwdF9YPvocclUY6sSlXbXtt4PkfIRj1pHd4+/TV7i/uOZuGrWk2DCayah9Fz
	FTrKNxv9JST2VxYXIvsdgW8WnRWUHuI9jXFpqbPQhJdbngIebZ7nWlT8Hu9eAeTMrKiHV+roqj2
	tWZ3QA9LknAK6mA+Bju3+4yX+ukH8JYiio/uLhJdcJ36hqFhS9xJlmJM/oTPQ/uYqz9vYeIkr8u
	3zccvt5cnAhzRPhuc1IILTHkH0PMGKQ0u4jBafYQCeua4v8F6g2bySq9se0h2o8rebq0g8iQGQD
	Vyuxbe8id/EQ+N5sj9ADJQXZbFOHGf9ILi72hMwtzvVOVrcMWmiNQTv6wrCx1QnmsEGve6CGLek
	FXsxSAg/FTPNlbN2oU46985FmQhGoP66z9XTwqvaMu9jFCB79fjrCfVLL9ZIBgc/QTFk6ppw5Fw
	wf4JKIzzViEM7bXrbVg==
X-Received: by 2002:a05:600c:800c:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4bb7da3d581mr36535525e9.35.1794993113207;
        Wed, 18 Nov 2026 01:11:53 -0800 (PST)
Message-ID: <4b2c79a8-c9e1-4b6c-800f-10b68ff24343@suse.com>
Date: Wed, 18 Nov 2026 10:11:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul: Zero-extend the XOP0A and MOV B8+r immediates
 when decoding
To: Stephen Cheng <stephen.cheng@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261118085711.564158-1-stephen.cheng@citrix.com>
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
In-Reply-To: <20261118085711.564158-1-stephen.cheng@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1794993113-FDC6D034-003C0FBC/10/78276251493
X-purgate-type: spam
X-purgate-size: 2670
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 09:57, Stephen Cheng wrote:
> The decoder sign-extends the 32-bit immediate of the XOP0A insns
> (BEXTR, LWPINS, LWPVAL), but this immediate is unsigned. It also
> sign-extends the immediate of MOV B8+r without REX.W, while with REX.W
> the low half is already zero-extended to build the 64-bit immediate.
> In 64-bit mode MOV r32,imm32 zero-extends into the full register, and
> no form of B8+r sign-extends its immediate. Emulation uses only the low
> bits, so only x86_insn_immediate() returns a wrong value. No current
> caller reads it for these insns.
> 
> Zero-extend the XOP0A immediate, as commit aa6070d2c840 ("x86emul:
> Zero-extend unsigned 8-bit immediates when decoding") did for the 0F,
> 0F3A and XOP08 maps. For MOV B8+r, zero-extend the immediate for all
> operand sizes, and keep only the fetch of the high half in the REX.W
> path. Other insns' 16-bit immediates are left as they are for now.
> 
> Fixes: 653cae725cea ("x86/32on64: use generic instruction decoding for call gate emulation")
> Requested-by: Jan Beulich <jbeulich@suse.com>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> I left the 16-bit immediates of other insns as they are, because
> changing the shared fetch would affect many insns.

Sure. For ALU insns with 16-bit operand size it is ambiguous anyway whether
to treat the unused bits as sign- or zero-extended.

> --- a/xen/arch/x86/x86_emulate/decode.c
> +++ b/xen/arch/x86/x86_emulate/decode.c
> @@ -683,9 +683,10 @@ decode_onebyte(struct x86_emulate_state *s,
>          break;
>  
>      case 0xb8 ... 0xbf: /* mov imm{16,32,64},r{16,32,64} */
> +        /* The immediate is zero-extended, not sign-extended. */
> +        s->imm1 &= s->op_bytes == 2 ? 0xffff : 0xffffffffU;
>          if ( s->op_bytes == 8 ) /* Fetch more bytes to obtain imm64. */
> -            s->imm1 = ((uint32_t)s->imm1 |
> -                       ((uint64_t)insn_fetch_type(uint32_t) << 32));
> +            s->imm1 |= (uint64_t)insn_fetch_type(uint32_t) << 32;
>          break;

You covering the 16-bit case here as well makes me wonder about the 8-bit
one. I think we want to be consistent: Either we leave the 16-bit form
alone here (then a v2 would be needed), and then we don't need to do
anything else for the 8-bit form. Or we make the 8-bit form match the 16-
bit one (then another small patch amending the earlier one would be
needed, while this patch could go in as-is). Personally I favor the
former option, as that's less change in behavior (and less churn) overall.

Jan

