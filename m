Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5701C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 14:17:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412099.1642594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3wd6-00041m-IK; Tue, 08 Sep 2026 14:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412099.1642594; Tue, 08 Sep 2026 14:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3wd6-00041f-Fj; Tue, 08 Sep 2026 14:16:56 +0000
Received: by outflank-mailman (input) for mailman id 1412099;
 Tue, 08 Sep 2026 14:16:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3wd5-00040c-9Z
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:16:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3wd4-00HS4H-Mb
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 16:16:54 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa018cb-e002-0a2a0a5209dd-0a2a4505cc84-24
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 16:16:50 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa018d2-4cb1-0a2a45050019-d155802eadbe-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 16:16:50 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49b0dd3c9a0so45248615e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 07:16:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee7fec25sm562374895e9.13.2026.09.08.07.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 07:16:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1788877010; x=1789481810; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkFu4wHmCm79gU+WiRRgAh0ocsuf24N8LsJQC8PS9Ss=;
        b=O1C0M+3XTJXjvs6YwwePoDnJluQQKIJYxkcLvtP+P6Q7/vHmGh5gdsfn2yXMeWxEFG
         2UNn0mygdWEJcqdzabS3pQu/itMLDKxs2u36S23U/UcG5r/3rc6n1RC9N+onzw5JeDD7
         8QVIh0y1CfpWl91Jyb793Ug6EOjd+5t3K4ep58oFekDf3iY1pyrDbOkQMjAZEJZvdBJc
         dqQL1i1uyB84C6SWd0bbTmtAfc4Qo1N/2QnMhxnBRSMG1ASj5+bpSq+TwNJb4OfoIroR
         4s+PYx4o9Ceobqj+CUq4a/8fJ8pC3Icy8Shmsnqeuu4EGL1RtImN40Uw90BxoCyaDmWG
         ZjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788877010; x=1789481810;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkFu4wHmCm79gU+WiRRgAh0ocsuf24N8LsJQC8PS9Ss=;
        b=f3tA/eusPjDD8mEw5QUjhRVAWRBo1uRK4TVawyYQh2YlFnzgkkiy1ZPsngLmn0ED+j
         3kq3v5oZ6Abl7UwX9q1PNHfbEYya1OS9EV1ApiLlqxDfhwiSwUd59W7SgBJLT9WswR/1
         YOm4ee4riT3Tzd8EWsCrhQ3+0Pyy7ImVM+PfRwu0HTQNXV5Spz40c//Vea/5FvjVklWL
         /WAPTJEwrmMZwOHHV4aLhbL0BNZ+ee1j2yxS0H6F7MDLOSAT6obzQPzCIE1GbCpueLcS
         TwICrwcKAlTE5HXUOh4SUhud6Ewu8CDGQLMw6egqWcsXSdDHEdo/GhwiYBAGzMPR/69v
         00yw==
X-Forwarded-Encrypted: i=1; AKwUvBwE+ceDG4ANudjO3yQ1mLFztEmF1mdZ7BP6f1qC/vNK1IGbbGyKW1AeV2Uc/9gvzIEgkO2jjj1B3ko=@lists.xenproject.org
X-Gm-Message-State: AFuF++nfzETZJhM0DFcLQEBbUAD13O9EoXun5s0/Mqvqzz9eeDpV302n
	TDr+WTyWwhaj/JWLFHct+tYtYvqRAFzTVaj6B+62amAr7FBKkKcTeRCctUtgp7j4Kw==
X-Gm-Gg: AYBFou2Nubok2JQ/x2rIKm2JYJ3YWAtoFzFeW+0u+c52GGpaXa1mSrR84H6wPvAo6PO
	Acqbr/dPAxh8AYy754bnQXg4CFCxaBX6adstflTlzxfk15ZRVKfCCCT3USIaVSZGu4Ekqb5oftl
	CIpWzAxVWy+9ClbLJR40kMFm15eGHPew4CecflfqgkmYaiUpPLkpycvDv2Yu+qo+Fm+xvyPDp6C
	Lp2tk2kpxa5yDP+uODG8bmrLzmb2emtUzmR7VOjcXbCZAZrfYh2YI8p2PNSvstrzXjRgJqkq9We
	+IDCSOkUUNoDZoHOvjAY1me7UQ+lr3xq0UG6ZJOXaBFJ1GiJNNuB4O45oDwXMD50r05nuLoNg/j
	I0fyLpjM6jIGMkegzn3JtVKFklo69MkffzCYa9xcnvUQJ2a55ldDmTYw8NtK17bAXmVJj1mX9fL
	rNG+iROecaWBG9BSaqQIr/ISa4INnDCeVvyePAjwHSIZoXUwFbgsPbJUDN8/7f0Ke5e6tGMseVZ
	bwuVdJN5y2N5ssGS/ZBCcBXa+eQ6adocRVYyigrmyGpj9wh
X-Received: by 2002:a05:600c:3496:b0:49d:1deb:a629 with SMTP id 5b1f17b1804b1-49d1deba75cmr49158825e9.2.1788877009658;
        Tue, 08 Sep 2026 07:16:49 -0700 (PDT)
Message-ID: <ae5f1302-8024-44fb-bd2b-6684c90aefef@suse.com>
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
X-purgate-ID: tlsNG-c201ff/1788877010-F66B52A1-0899C172/0/0
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

