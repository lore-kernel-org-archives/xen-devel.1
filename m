Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0074E9B366
	for <xen-devel@archiver.kernel.org>; Mon,  2 Mar 2026 11:04:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1244123.1543584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx14C-0001zg-0n; Mon, 02 Mar 2026 11:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244123.1543584; Mon, 02 Mar 2026 11:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx14B-0001zZ-U2; Mon, 02 Mar 2026 11:03:59 +0000
Received: by outflank-mailman (input) for mailman id 1244123;
 Mon, 02 Mar 2026 11:03:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vx14A-0001yX-J9
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 11:03:58 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81dd1ba5-1627-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 12:03:56 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so49519735e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 03:03:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfbb465bsm291529605e9.3.2026.03.02.03.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 03:03:55 -0800 (PST)
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
X-Inumbo-ID: 81dd1ba5-1627-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772449436; x=1773054236; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AsZqZNlgR1am8i9fi1SsyDpNwO6zvCv9IgvoGIR0Bf8=;
        b=bYkTKKyMOLXMuLVz1HJT8FplfjFAz/KjcSvD8knpS/1s9hAe4RDEvkCkkEHN/ltt0R
         Dz2WK2PLUpvXV8t/794itLrc0XyX2/cE3oZyQ/XFYD0qwqKgIHPHpiZ6Lp9trthSUFgX
         +NQp7NUSL+6Y2S+XPl7rA/P2kjrmBEMfchvfRXA9Z0EahGErwNTZiE2y8cTl8cILEezG
         F/9JA1C1TUWQDmfpoygzHuxHCnj9v7cG50kIKl6ErZHwlzhu20h5Er4r08mlemAQP/1r
         8QcVf8Szg0nacW8kgnPmFNlnuIT+oeh7um2Hz3Ey16VJnoMXZPwjvRyt+VhFzaCeqOxp
         sCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449436; x=1773054236;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsZqZNlgR1am8i9fi1SsyDpNwO6zvCv9IgvoGIR0Bf8=;
        b=KThG4pKC4U5fgzVzBcabK3pYA8t8Lao24vvyWODovCca+Krl35EfJThjVaUKEY+xr1
         N140U5NtZFP2r5kT/gftDEaogoOw+vctZ7GR320Rb8Sw4/OfO5InMil+1jS4+OAKtQh9
         jwIO9KSb9MyoGBFEgr+hAmWwEh3FyKx2Yw9LVYf7sNQF7qqjWMsDZtwj4XbcL0UhiBD0
         huCH3DEU1CPK9yTWXH+3Wrelpy8wcPH4cGel4HHUbJmWiMcrb5M5AHqoxGL2Id1cMPDa
         qjf4ubXJc9S5nU6vrkPgvvDUE+6Euu1W/Vps74slKYhAJsQWfch9uR8GV83YZ/dHiVKZ
         /qgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX41d8/9RO6rcWaSCIu2RII11n8bi9X6fWaqWkL+2W4vS9wOlK69g2UMppRZ8uFkXDMzqKQt/fu084=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd10h4Jp4uy35xL5cuw6ok4o21FoHxtWNLdcbcyuI1cLjdqlH1
	IzUSR9g8/g3PnbRchpzr6ZSGUguSp9ph0FvUZcxSlDN/nOtGR+jzSdeVtdSc1HjRHw==
X-Gm-Gg: ATEYQzwfW6z5Q3ds+KkW1F11Ys1pXcw/HzDaPZYbme4S2OWGWbrGVS76j6Z/Xm0Xoc7
	QCBhrU9z7UxXgw4HBtqqHl1rJIB0TPMr0/qBrsvqA9AIPRNjHk3Ah+359FkrSFMnsVCSfZeOl0L
	+ME80C9SSLkL24nDW9fq1Rw5D1TAZLUC9N2pKXMivCOzuPryBdE45d4Q11Q2dSgp+MqfF/T2ZJ8
	G5myCIwIayHhsEOKqH2PiG86GoDX943bgV21bvp97YuiRq0Ki4b6+fSGJr4MgBbV5+e2oXus3b+
	UEMHdx+33y5FUNAfZM+L9YZ9KI9qJBxx4XvdCJjp2EzXlABEBCxxDQJtasXXyrv8efG5jaHlXmf
	ME6p0VPNoMrdJCKWr7KyWC2ZZxyActFiCRDkV1oILokeKILqkHO6LXyOs01zow9wzMW9eC53WxC
	dgoY7aacwcUhSKkRpUSHl/Tnk1XpDv1QIIalhaIlyy5SdpGJg0b4dnDSnlO1rfBH5spnxWVLMpA
	c2mOF2v5WShe9BTOP5Qz/NUVQ==
X-Received: by 2002:a05:600c:548a:b0:483:6e32:50d4 with SMTP id 5b1f17b1804b1-483c9bed9bbmr210520015e9.18.1772449435801;
        Mon, 02 Mar 2026 03:03:55 -0800 (PST)
Message-ID: <bf83838a-8401-4eb7-aea8-25ce59c9d492@suse.com>
Date: Mon, 2 Mar 2026 12:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/14] x86/pv: Don't assume that INT $imm8 instructions
 are two bytes long
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260227231636.3955109-1-andrew.cooper3@citrix.com>
 <20260227231636.3955109-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260227231636.3955109-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.02.2026 00:16, Andrew Cooper wrote:
> For INT $N instructions (besides $0x80 for which there is a dedicated fast
> path), handling is mostly fault-based because of DPL0 gates in the IDT.  This
> means that when the guest kernel allows the instruction too, Xen must
> increment %rip to the end of the instruction before passing a trap to the
> guest kernel.
> 
> When an INT $N instruction has a prefix, it's longer than two bytes, and Xen
> will deliver the "trap" with %rip pointing into the middle of the instruction.
> 
> Introduce a new pv_emulate_sw_interrupt() which uses x86_insn_length() to
> determine the instruction length, rather than assuming two.
> 
> This is a change in behaviour for PV guests, but the prior behaviour cannot
> reasonably be said to be intentional.
> 
> This change does not affect the INT $0x80 fastpath.  Prefixed INT $N
> instructions occur almost exclusively in test code or exploits, and INT $0x80
> appears to be the only user-usable interrupt gate in contemporary PV guests.

Whereas for the slow path, while the subtracting of 2 from %rip there isn't
quite right either, the insn size determination here would then simply yield
2 as well, so all is good for that case as well.

> @@ -1401,6 +1402,53 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
>      return 0;
>  }
>  
> +/*
> + * Hardware already decoded the INT $N instruction and determinted that there
> + * was a DPL issue, hence the #GP.  Xen has already determined that the guest
> + * kernel has permitted this software interrupt.
> + *
> + * All that is needed is the instruction length, to turn the fault into a
> + * trap.  All errors are turned back into the original #GP, as that's the
> + * action that really happened.
> + */
> +void pv_emulate_sw_interrupt(struct cpu_user_regs *regs)
> +{
> +    struct vcpu *curr = current;
> +    struct domain *currd = curr->domain;
> +    struct priv_op_ctxt ctxt = {
> +        .ctxt.regs = regs,
> +        .ctxt.lma = !is_pv_32bit_domain(currd),

The difference may not be overly significant here, but 64-bit guests can run
32-bit code, so setting .lma seems wrong in that case. As it ought to be
largely benign, perhaps to code could even be left as is, just with a comment
to clarify things?

> +    };
> +    struct x86_emulate_state *state;
> +    uint8_t vector = regs->error_code >> 3;
> +    unsigned int len, ar;
> +
> +    if ( !pv_emul_read_descriptor(regs->cs, curr, &ctxt.cs.base,
> +                                  &ctxt.cs.limit, &ar, 1) ||
> +         !(ar & _SEGMENT_S) ||
> +         !(ar & _SEGMENT_P) ||
> +         !(ar & _SEGMENT_CODE) )
> +        goto error;
> +
> +    state = x86_decode_insn(&ctxt.ctxt, insn_fetch);
> +    if ( IS_ERR_OR_NULL(state) )
> +        goto error;
> +
> +    len = x86_insn_length(state, &ctxt.ctxt);
> +    x86_emulate_free_state(state);
> +
> +    /* Note: Checked slightly late to simplify 'state' handling. */
> +    if ( ctxt.ctxt.opcode != 0xcd /* INT $imm8 */ )
> +        goto error;
> +
> +    regs->rip += len;
> +    pv_inject_sw_interrupt(vector);
> +    return;
> +
> + error:
> +    pv_inject_hw_exception(X86_EXC_GP, regs->entry_vector);

DYM regs->error_code here? Might it alternatively make sense to return a
boolean here, for ...

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1379,8 +1379,7 @@ void do_general_protection(struct cpu_user_regs *regs)
>  
>          if ( permit_softint(TI_GET_DPL(ti), v, regs) )
>          {
> -            regs->rip += 2;
> -            pv_inject_sw_interrupt(vector);
> +            pv_emulate_sw_interrupt(regs);
>              return;

... the return here to become conditional, leveraging the #GP injection at
the bottom of this function?

Jan

