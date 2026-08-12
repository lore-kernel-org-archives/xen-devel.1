Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EBAC5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 16:03:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389217.1630104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuBQS-00010n-24; Wed, 12 Aug 2026 16:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389217.1630104; Wed, 12 Aug 2026 16:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuBQR-00010g-UY; Wed, 12 Aug 2026 16:03:31 +0000
Received: by outflank-mailman (input) for mailman id 1389217;
 Wed, 12 Aug 2026 16:03:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuBQR-00010a-7O
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 16:03:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuBQQ-007b8W-KD
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 18:03:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c993c-8faa-0a2a0a5109dd-0a2a450387e8-22
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 18:03:30 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c9952-fae8-0a2a45030019-d1558033e04a-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 18:03:30 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4956242332dso10589245e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 09:03:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4997aaae7acsm83944525e9.4.2026.08.12.09.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 09:03:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1786550610; x=1787155410; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=44tzlAMe2DMRuxp++yVpi01YJeWLEdKk2hvh5JUlNlM=;
        b=cRcSCIfnOFXklscIwvFaERc16vSWHfxzkmKPO0UGLmwpLN56CS3Ff2hweSgdSEs3X1
         TcGv2LuK2CJUiFJv53ocTU5xUuac353CZO+sZf2iozD7JbpuSQOFa02eJj3EFiX+a2YF
         D2+Mx69pepF2S9Pir8m+lev0JEGtmKqN+2jdaURwW4vES5DdbIXKZeIszC+FTEVf3QKM
         E/YDu0zhD8u+Dnj8ZnLvZb/pgUzr9Sto/B9Da93xcd8EoWDaLRuc1dMqalD46Hnco2zj
         ba9GivhKddGVgmNiIhHlGH+mLkgM6iKFzDwk/2eoF25d3pVmp3nDT0C04EBtjiq7IPyp
         raxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786550610; x=1787155410;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44tzlAMe2DMRuxp++yVpi01YJeWLEdKk2hvh5JUlNlM=;
        b=fmqW7GWkLONhDsWsTylGSkSW8y6RKESVL5d9twB43iyAY/QkILREOqjfaNuuH4Ljtu
         pUl5iQrgTA2wgQd5w5q9x3CeaeAUm18vkXwY4EtjCrMsAdiNjHd3MB5jO7QBm7jUnn/A
         XSWcyc937v1svZwVs3vilpBsdNgwqQ+/Q9nZZCCapk4GgMDdZhHHPyiRCvRpYxFiAMJo
         5pFZj48fvotRjOf8nniNFqhnnk7iBdydomA3j6UKagc7HH6bJqVF0NLtOM2DInJ6gsgz
         sHHvTqA3scw3JFoKTHjjH6oHtSiIeSBo25RfCpiRVfNKywTzrP3FftyLhmcj6xKT5yKo
         uu+g==
X-Forwarded-Encrypted: i=1; AHgh+RphtECMsJ3dUvluvTFfOT6txp77Uv8185uyQodo7LmqF7fKlcG0s14I3FbokLVlGfFqgYRrciBVpVw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0ve1QYx3mKF2DxVV3V923LH5DR3AH/RhZAoxDbwjQolgAsQc4
	vAtV0PMrCL7MRvnyl6bBxMuY7qeOCgrQUVvQ8PwfrjU0M2Bx1U4adoCzmBrcawKZQw==
X-Gm-Gg: AR+sD10CT7WxlgNRW6T7a9FqBFoZk37JacIY95ARQac/x4FL4iMPdz8/gycwNKnxqS1
	UVeUKI/u9ujxVZFImcdXza7OlYvCzoMiNxe0AseKxYsFpEz2Ugzd5GtIhdkBCHiww+MHufB2j6N
	7GVmmH9jt8j1aa96mmKdzQeyLOk3bTVUxHHZ5T8A7AnIDhcjuGccsB9m1a4Do8yGGdnbA02xKpB
	MNnxPh02xMw1dmhOz5j8BAKsia3zJUeo9/XYF07kq1dkWBR6tuAjyeGo5hcGwka3Nt7HSpjWsBc
	60nG+AfOa3KrG2/EdnHXSVmbLUQIstwJP7+jMf/FS5k85uc3TibXVZpuOBaFhZO37l3/k1A2os8
	9fUFvWs2yW5/VrQByM9B52QspK+h1QYw0vl0SPR9VCBs5eJbOvwglNUCZQ/+8dEVohKPVKT4a1S
	uEsgW5AmhkCqA1A/Z/zuQVUeaCn3/n293TGapjRozLw9a3IdbRdyPosN1ayiFlbxNY2eQL0hure
	+vUNkGxEOK9XN31Vr9mc9pvjGIjVtlPoShQUGWBvlhG1Gq/u5wZ
X-Received: by 2002:a05:600c:470d:b0:499:4d4d:822a with SMTP id 5b1f17b1804b1-4997c16007cmr71221155e9.17.1786550609819;
        Wed, 12 Aug 2026 09:03:29 -0700 (PDT)
Message-ID: <f3ca2cf9-49b9-4515-b634-6de4ae9614ce@suse.com>
Date: Wed, 12 Aug 2026 18:03:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 15/17] xen/riscv: implement trap redirection to a guest
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <8b14a7926e42c7e3308dc7f730334fed56210d81.1784560663.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8b14a7926e42c7e3308dc7f730334fed56210d81.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1786550610-76CF84E9-90620B63/10/73395122804
X-purgate-type: spam
X-purgate-size: 4367

On 20.07.2026 18:02, Oleksii Kurochko wrote:
> Some traps taken by Xen on behalf of a guest can't or shouldn't be
> handled by the hypervisor and must be forwarded to the guest's own
> S-mode exception handler instead: e.g. when riscv_vcpu_unpriv_read()
> faults while accessing guest memory, or when emulation hits a condition
> only the guest kernel can resolve.

Is the plan to use riscv_vcpu_unpriv_read() also for reading hypercall
buffers? In that case trap redirection shouldn't come into play.

> Introduce riscv_vcpu_trap_redirect() for that purpose. It makes the
> trap appear to the guest as if it had been taken directly in VS-mode:
> the trap information is transferred to the guest's virtual supervisor
> CSRs and the vCPU is resumed at its exception vector in supervisor
> mode, following the trap entry rules of the RISC-V privileged
> specification.
> 
> The implementation is based on kvm_riscv_vcpu_trap_redirect() from
> Linux, with a few deviations:
>  - The function reads and writes physical VS-mode CSRs, so it is only
>    meaningful for the currently running vCPU. Instead of taking a
>    struct vcpu argument, it always operates on current.
>  - The MODE field of vstvec is masked off explicitly when computing the
>    exception target PC (exceptions always vector to BASE), rather than
>    relying on the hardwired zero bit of sepc to drop it on VM entry.
>  - Assertions document the preconditions: the trap must have been taken
>    from virtualized mode (hstatus.SPV set), and only synchronous
>    exceptions may be redirected - interrupts must be injected via hvip
>    instead, so that the hardware performs VS-mode trap entry itself,
>    respecting vsstatus.SIE and vectored vstvec dispatch.

For this last bullet point - how is a reviewer supposed to validate the
assertions added when no caller of the new function exists?

> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/guestcopy.c                | 54 +++++++++++++++++++++++
>  xen/arch/riscv/include/asm/guest_access.h |  2 +
>  2 files changed, 56 insertions(+)

I don't understand this placement - trap redirection has nothing
(directly) to do with accessing guest memory.

> --- a/xen/arch/riscv/guestcopy.c
> +++ b/xen/arch/riscv/guestcopy.c
> @@ -205,3 +205,57 @@ unsigned long riscv_vcpu_unpriv_read(bool read_insn,
>  
>      return val;
>  }
> +
> +/* Redirect trap to Guest. */
> +void riscv_vcpu_trap_redirect(const struct trap_info *trap)
> +{
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
> +     * vstvec[1:0] is the vector MODE, not part of the address. Exceptions
> +     * always target BASE regardless of MODE, so mask it off explicitly
> +     * instead of relying on the hardwired zero bit of sepc to drop it.
> +     */
> +    regs->sepc = csr_read(CSR_VSTVEC) & ~0x3UL;

Can there be a proper constant please for this mask?

Jan

