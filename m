Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FEB606A897
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cYB4rR1W
Received: from list by lists.xenproject.org with outflank-mailman.1490292.1691231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSsXy-0002N6-Dp; Mon, 16 Nov 2026 08:58:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490292.1691231; Mon, 16 Nov 2026 08:58:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSsXy-0002Mz-Ay; Mon, 16 Nov 2026 08:58:42 +0000
Received: by outflank-mailman (input) for mailman id 1490292;
 Mon, 16 Nov 2026 08:58:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSsXx-0002Mt-An
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 08:58:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSsXw-00HSw4-5K
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 09:58:40 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afac5b0-e002-0a2a0a5209dd-0a2a45058eb8-44
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:58:40 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afac5bf-4cb1-0a2a45050019-d155dd30d449-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:58:39 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-49a92144733so1198311f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 00:58:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f78214dsm21181731f8f.25.2026.11.16.00.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 00:58:38 -0800 (PST)
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
        d=suse.com; s=google; t=1794819519; x=1795424319; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3+rTk3NF67z+zczejY3jr4X1jSLwzIn21QfM+bykHY=;
        b=cYB4rR1WygPmv8F4PFqtnAaMEFEAxkleZMbYO1dKbaSsShHgEI0uSZ5rG2HJCfIQwR
         QfGRIE3FZ8UhoTU9pM0n4USdAZCo8iPsjYzB6QnVlHfbcTjFTHZpEQNe3f6zDu56hAtO
         /NMCWoeJ2/gb3a2jQ4g5eyBm+UiNGp+vAh9aZekm9XkW9bQlvhn0oFEiKac8Tqr3ivAh
         tZoDFNTw/6yz/SWQlnJAMvB22nKOeCY1quhEdODyBAf9zCiVqbv8+zFwKdhwA7PnJH5v
         mvnwZ8E3mTWd6WxhU/WzzzAKKEwwM0taWfiF9xKFQPB/DAtMYPm4LKCVK2c2v8OQqioG
         gwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819519; x=1795424319;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3+rTk3NF67z+zczejY3jr4X1jSLwzIn21QfM+bykHY=;
        b=DKvpuoJ8128a9DORf4VLTFeC4ZuMaaACKTBDCZY5T870jmBzei/1Fm4S9AHs1ZiZo7
         F9OC8Z0oFZ1Rs/rBC0GlyAldzRJON8HNogjwfeO0QBLQMEru0Bnq0StVdamu2RyR83wG
         ScXVQHe8xtLcBL1s3b1nAhKupasu25RWpbZiG9G0ghub9aJziudopTt3tEgf+9y9C57q
         v8c3BaoIjD8H/eeico0aM73v0j1X836aE1D4bTGLVQeSAJ1hZJ9AA9EDs5P8YEOKU+Zp
         uHSc1TWtboY1p26cU8d+jRnJHeuNgG3gX80k/6ji2WxMsOwEEuuhO1CGJOZFL0onZKlU
         pqoA==
X-Forwarded-Encrypted: i=1; AL+hErHWDR8BOYWuXBDu56jGp/Us3MJ7FKlnQ3pIvxhgiqlxJBBkaF+c+G2okUcAmYUt9SE0WbztIe9T5fA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+tubsuwg4GZOdZsbQJ/spjOq0gxjcuaTyhR4N96l+nW05gF0LC
	EDkEFyLCodxTyMHbeB4G9FLpJCNyqywcFcHt5iATes+cm+8qGG5qLBklq6DE41xHuA==
X-Gm-Gg: AZFdTZc63IOA6zfo/d+mRCTWC+tOxMwTVc9UB9YCe9zoNfEGCor4ugYPGFi4lR5AD5w
	y+2OfG9LknzFK+ImqPybuB25SX1S1sdSnhwb9oP8gTApNyCCApm7W6YSYuxNXyuTZj8YpLgmq1K
	d7at2TiZHvEEHp8RDLQNB0ifjCNXmARK+IdJUMBQ4eBO9RPFUUWR/wB5MjKVQt4gkQYckiEjll1
	lz348JwDzl4hySAz7GxCfg0/FJSn+1hGXZGSKj1e3Dd81yBvjMNk4vIi4SnJYdUU/vWk8e2c8Oa
	udZs4Z4Megt5xKmM6ekqzFT25bCGl7OHAc03082rL+TdLgPGuarE0Bo3TUFyFr+cu+M29ZeUAQY
	8zD0yh6UZK5DPyYsIjJYoQOJMuTkMQMzfoHKIaCHmSw74GiqIu3CbJjG61xMhbpBeDeYXGM9C0l
	ybpdHJr63HhV4NpwQkx+gw6ADT18wJ0oomCv9JCXltfV1SoWpTfPTOvFD/lwK6PvQySMUE7msNs
	BeH+NwIMLaoX7lOlTCH9m9RbKXmtgWBmq/viURepTPVmIgViz0Acc3HZ+E0OVEsyxfnPAqfcKuA
	z+fqiyu+QBMX4qZJvrZvGwCIMnBATmCYnqqUK7OOIQlChS3ok0dczOGR7RY3pwB17MkdapcMW93
	rK/MWaQPgqxMPmOaMfg==
X-Received: by 2002:a05:6000:25f1:b0:48a:fba3:d5b1 with SMTP id ffacd0b85a97d-49c7381a73amr19979286f8f.55.1794819519357;
        Mon, 16 Nov 2026 00:58:39 -0800 (PST)
Message-ID: <6c7b2b79-629e-4540-b94f-d88a2f039394@suse.com>
Date: Mon, 16 Nov 2026 09:58:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86emul: Zero-extend unsigned 8-bit immediates when
 decoding
To: Stephen Cheng <stephen.cheng@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261116012748.4872-1-stephen.cheng@citrix.com>
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
In-Reply-To: <20261116012748.4872-1-stephen.cheng@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1794819520-243112A1-273DE1E1/10/78276251493
X-purgate-type: spam
X-purgate-size: 4317
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.11.2026 02:27, Stephen Cheng wrote:
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
> Zero-extend these immediates in the decoder, and drop the (uint8_t)
> casts at the IN/OUT and AAM/AAD use sites, which are not needed any
> more.
> 
> Fixes: 653cae725cea ("x86/32on64: use generic instruction decoding for call gate emulation")
> Fixes: 52053d5fc2f9 ("x86/emul: Drop swint_emulate infrastructure")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>

Looks largely good to me now, just a few minor things:

> --- a/xen/arch/x86/x86_emulate/decode.c
> +++ b/xen/arch/x86/x86_emulate/decode.c
> @@ -650,10 +650,19 @@ decode_onebyte(struct x86_emulate_state *s,
>      case 0xc4: /* les */
>      case 0xc5: /* lds */
>      case 0xce: /* into */
> +    case 0xd6: /* salc / udb */
> +        s->not_64bit = true;
> +        break;
> +
>      case 0xd4: /* aam */
>      case 0xd5: /* aad */
> -    case 0xd6: /* salc / udb */
>          s->not_64bit = true;
> +        fallthrough;
> +    case 0xc0: case 0xc1: /* Grp2 */
> +    case 0xcd: /* int imm8 */
> +    case 0xe4 ... 0xe7: /* in/out imm8 */
> +        /* The 8-bit immediate is unsigned. */
> +        s->imm1 = (uint8_t)s->imm1;
>          break;

This now separate case block needs to move down. All such switch() statements
aim at having their case blocks sorted by lowest-numbered case each. There
may be anomalies to that rule, but we want to make sure to reduce their set,
not increase it.

> @@ -1796,6 +1805,8 @@ int x86emul_decode(struct x86_emulate_state *s,
>          break;
>  
>      case ext_0f:
> +        if ( (d & SrcMask) == SrcImmByte )
> +            s->imm1 = (uint8_t)s->imm1;
>          rc = decode_twobyte(s, ctxt, ops);
>          break;
>  
> @@ -1804,6 +1815,7 @@ int x86emul_decode(struct x86_emulate_state *s,
>          break;
>  
>      case ext_0f3a:
> +        s->imm1 = (uint8_t)s->imm1;
>          d = ext0f3a_table[b].to_mem ? DstMem | SrcReg : DstReg | SrcMem;
>          if ( ext0f3a_table[b].two_op )
>              d |= TwoOp;
> @@ -1814,6 +1826,7 @@ int x86emul_decode(struct x86_emulate_state *s,
>          break;
>  
>      case ext_8f08:
> +        s->imm1 = (uint8_t)s->imm1;
>          d = DstReg | SrcMem;
>          if ( ext8f08_table[b].two_op )
>              d |= TwoOp;

All of these three may benefit from having a brief comment added, e.g.
"All immediates in this encoding space are unsigned ones."

Also, just to mention - in the APX series, where I've done the respective
adjustments already, I've deliberately avoided the use of casts. "&= 0xff"
is shorter, and avoiding casts is generally a worthwhile goal imo.

> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
> @@ -2505,7 +2505,7 @@ x86_emulate(
>  
>      case 0xd4: /* aam */
>      case 0xd5: /* aad */
> -        n = (uint8_t)src.val;
> +        n = src.val;
>          if ( b & 0x01 )
>              _regs.ax = (uint8_t)(_regs.al + (_regs.ah * n));
>          else
> @@ -2561,7 +2561,7 @@ x86_emulate(
>      case 0xed: /* in %dx,%eax */
>      case 0xee: /* out %al,%dx */
>      case 0xef: /* out %eax,%dx */ {
> -        unsigned int port = ((b < 0xe8) ? (uint8_t)src.val : _regs.dx);
> +        unsigned int port = ((b < 0xe8) ? src.val : _regs.dx);
>  
>          op_bytes = !(b & 1) ? 1 : (op_bytes == 8) ? 4 : op_bytes;
>          if ( (rc = ioport_access_check(port, op_bytes, ctxt, ops)) != 0 )

How about an ASSERT() each, to make sure the handling doesn't break again?

Jan

