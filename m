Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1A0C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 14:17:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412098.1642584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3wd4-0003oj-8v; Tue, 08 Sep 2026 14:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412098.1642584; Tue, 08 Sep 2026 14:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3wd4-0003oc-6J; Tue, 08 Sep 2026 14:16:54 +0000
Received: by outflank-mailman (input) for mailman id 1412098;
 Tue, 08 Sep 2026 14:16:52 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3wd2-0003oW-JX
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:16:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3wd1-004mjy-PK
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 16:16:51 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa018ba-2eae-0a2a0a5409dd-0a2a4502cdc8-22
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 16:16:51 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa018d3-6ca4-0a2a45020019-d155802dad22-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 16:16:51 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49b0dd3c9a0so45248875e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 07:16:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee7fec25sm562374895e9.13.2026.09.08.07.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 07:16:50 -0700 (PDT)
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
        d=suse.com; s=google; t=1788877011; x=1789481811; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkFu4wHmCm79gU+WiRRgAh0ocsuf24N8LsJQC8PS9Ss=;
        b=bvpyJzUd1Qnzl1skMzwhd0KyVlbZzGt7ceOCV9RXwyz1nUl0OskHiHJ1vRkbXL/brH
         qR/OdeSUsiN9d30ogJZGsv2rZ9dnt3oWaHjQ3vIeypFI7SWO8dolH6pMp4YwcfyKJ3jd
         pCwfV0lw9OBLWE2XH9wuDjSx2cEroKuFEtQ/FPJAvD5u0szjiP9+ScmnUMQLEbBbmpsd
         actaXF9NcYxDLNlEw/KxPIG+UhEIAnA9orrcvyWdcizNVgYuNgB+Z5Mc8if84vWl2sHe
         drWBi6ku5ZbNie5uFqR1gCkPRIcChQZyuva2vg8+o14XPIHnPMsx6YOILV9JFmIPp/8U
         T1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788877011; x=1789481811;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkFu4wHmCm79gU+WiRRgAh0ocsuf24N8LsJQC8PS9Ss=;
        b=ollSpty4pnPSbvY+px0lwCESWOilwyqvfqZys582OdgPUqbtCbthlQNMecPUG81jOe
         cuyrrw5WMo+Wf5pygee1dQ2CYHZV7SM+psNe9Knolx/YeTEMj/knZEHoyGIfPm19DBT0
         XvYPXWGrdiH5TuKIpLw2os+5pIrlMlfOyT1N5Cj7DgYZcfEq3J6tezbzJHUnuFuAaQM+
         QBh9lD3pfZS9JHaR08iu+5+CEJt5NKWbsBguYKYv0pryejNuuVOCW/V0lzdjGZDwAo5z
         yCA7J6BCgwnim0ldFgLQug89KdnhP20rM8YnlxFzoUCnM/wJ3A/sTGi1fYPNOArLY3uO
         bA/g==
X-Forwarded-Encrypted: i=1; AKwUvByKX/8gXPkFxeO+05fviZS88cdGPv4zeq9EPDpT6a/e4Vijb3qZZpo5qmYsWZii83STq72cK1LtQGU=@lists.xenproject.org
X-Gm-Message-State: AFuF++l81qSjMO4CELT46gGhT/JA7gkiQedyj5BDf/NDKbSwVw2B6Fcn
	fG1slZJj5sB2IQ98PBBGVLc3kAEUrjZgpSwx/jbvO3Eos0L3CCZ1h0ZQfxWU3pDvIw==
X-Gm-Gg: AYBFou1km9X36/G4aS/lcGy/2vQAV9h4ybEee3JWx5j0KNXWPWlg1fbQ9zFj5flie9k
	6h5WruSIc0kU1LR91SsVqr2dBy5pVbIMQYf/2uM+yE5NByENjGy6kQ2aZhkp+1wHMZuFxLIdQaL
	Dija0ESgDlSFn4FFPxDh9bWIQvXh5O5PPvTJsNjlSo1b7JVscNKjwhdj2pSUOx2P1Q0IFjYvzBT
	WS5yiPH+NLEck52XN8EJxyeMR2zMmjhKQKD3qmKeS9l08Tg6uJ0UZpXKVdqLCzj+xJKshPwK/8t
	DjJ/Iho/1hEsfc60BmN4IYnIDtd9oECf+jJHV7yiP4HzHvZkODdH4gZbPFZyR7AyuUbjjYDGd7c
	0Ui6aPv2RnUbr2mog+5zOqmcRkRIruI7bjaO2XCgiVenuIU4f8Gw7L+quNBAY4Q6HiSeGsy0E4b
	JqTIKRCr4MBAV9DULY8xA7SHuk0mUh/ZsRFrJb0zFiMOYIoGuEuCf5E6/K/lu9pgJuFFq86r11y
	CnGlCt0NcWGPNy4hPBaItY+ua0UkL5yDDIRwRMMR0jejJBpdiIV
X-Received: by 2002:a05:600c:6214:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49cf825115bmr595119825e9.13.1788877011010;
        Tue, 08 Sep 2026 07:16:51 -0700 (PDT)
Message-ID: <1afe58b5-feff-44cc-9be5-c4dc759b2d87@suse.com>
Date: Tue, 8 Sep 2026 16:16:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/39] xen/riscv: implement trap redirection to a guest
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <583b0a190bad7121eae9bc99bd1e13dc1743efe4.1787838835.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <583b0a190bad7121eae9bc99bd1e13dc1743efe4.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1788877011-F1CAA2AC-CD9490D3/0/0
X-purgate-type: clean
X-purgate-size: 2882

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/riscv_encoding.h
> +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> @@ -109,6 +109,12 @@
>  #define SIP_SSIP			MIP_SSIP
>  #define SIP_STIP			MIP_STIP
>  
> +/* stvec/vstvec: MODE is bits [1:0], BASE is bits [XLEN-1:2] */
> +#define STVEC_MODE_MASK			_UL(0x3)
> +#define STVEC_MODE_DIRECT		_UL(0x0)
> +#define STVEC_MODE_VECTORED		_UL(0x1)

As on earlier occasions: Do the 0x here actually add any value? There are
none ...

> +#define STVEC_BASE_MASK			(~STVEC_MODE_MASK)
> +
>  #define PRV_U				_UL(0)
>  #define PRV_S				_UL(1)
>  #define PRV_M				_UL(3)

... here, for example.

> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -294,5 +294,53 @@ enum mc_disposition arch_do_multicall_call(struct mc_state *state)
>  /* Redirect trap to Guest. */
>  void trap_redirect(const struct trap_info *trap)
>  {
> -    BUG_ON("unimplemented");
> +    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(current);
> +    unsigned long vsstatus = csr_read(CSR_VSSTATUS);
> +
> +    /*
> +     * Redirecting a trap makes sense only if the trap was taken from
> +     * virtualized mode, i.e. sret is going to return to VS-mode.
> +     */
> +    ASSERT(regs->hstatus & HSTATUS_SPV);
> +
> +    /*
> +     * Only synchronous exceptions can be redirected. Interrupts must be
> +     * injected via hvip instead, so that the hardware itself performs
> +     * VS-mode trap entry, respecting vsstatus.SIE and the vectored
> +     * dispatch (BASE + 4 * cause) if vstvec is configured so.
> +     */
> +    ASSERT(!(trap->scause & CAUSE_IRQ_FLAG));
> +
> +    /* Change Guest SSTATUS.SPP bit */
> +    vsstatus &= ~SSTATUS_SPP;
> +    if ( regs->sstatus & SSTATUS_SPP )
> +        vsstatus |= SSTATUS_SPP;
> +
> +    /* Change Guest SSTATUS.SPIE bit */
> +    vsstatus &= ~SSTATUS_SPIE;
> +    if ( vsstatus & SSTATUS_SIE )
> +        vsstatus |= SSTATUS_SPIE;
> +
> +    /* Clear Guest SSTATUS.SIE bit */
> +    vsstatus &= ~SSTATUS_SIE;
> +
> +    /* Update Guest SSTATUS */
> +    csr_write(CSR_VSSTATUS, vsstatus);
> +
> +    /* Update Guest SCAUSE, STVAL, and SEPC */
> +    csr_write(CSR_VSCAUSE, trap->scause);
> +    csr_write(CSR_VSTVAL, trap->stval);
> +    csr_write(CSR_VSEPC, trap->sepc);
> +
> +    /*
> +     * Set Guest PC to Guest exception vector.
> +     *
> +     * vstvec's MODE field is not part of the address. Exceptions always
> +     * target BASE regardless of MODE, so mask it off explicitly instead of
> +     * relying on the hardwired zero bit of sepc to drop it.
> +     */
> +    regs->sepc = csr_read(CSR_VSTVEC) & STVEC_BASE_MASK;

Nit: Given how much the comment talks about MODE, imo using ~STVEC_MODE_MASK
here directly (and dropping STVEC_BASE_MASK) might be better.

Jan

