Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32FBC531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 15:42:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371782.1619252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woNSl-00041x-Iq; Mon, 27 Jul 2026 15:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371782.1619252; Mon, 27 Jul 2026 15:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woNSl-00041q-GD; Mon, 27 Jul 2026 15:41:55 +0000
Received: by outflank-mailman (input) for mailman id 1371782;
 Mon, 27 Jul 2026 15:41:54 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woNSk-00041k-3C
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 15:41:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woNSj-000CI2-8j
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 17:41:53 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a677c16-e002-0a2a0a5209dd-0a2a450bc896-46
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:41:53 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a677c40-b7e8-0a2a450b0019-d155802bc9cd-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 17:41:53 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so18081995e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 08:41:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c45cbd09sm709215e9.10.2026.07.27.08.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 08:41:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1785166912; x=1785771712; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vNJoMysnPfpiK8yoK1EwXQbE8HhvNEaBaVgn84LKaYE=;
        b=K2pZmxCeqOI47sjTSFlTSmLyjaeyej8bmPBqcPT7fj9jqHWb3JtmzJ/2u38me90bac
         0P29R+JbNedauyAk4wS+aa4zoouVS+DFWC5n4+amFhxfpXuN2GbPX4mzpdhWiMwFOOHz
         VFuboZdc2gTGrlseiVpXpQ0QtOa08KuCKQMHMC1eeDi6bJ67EUjKoLkeFkWyuQ5h+CeX
         GILB1frSnVU9WnqVPV80tSh3MDAPMLoizi1eDz3l51DbIcb2hr4QHvVqSVL6p22A0uhG
         /it1jJr2af3GPVQF47z1lpQrQBDsP1gex1d5ltcTG0oyE69zhSYsUp2rwX6kIbsCAweV
         Wo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785166912; x=1785771712;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNJoMysnPfpiK8yoK1EwXQbE8HhvNEaBaVgn84LKaYE=;
        b=WNsMjKMkC9USGaKcLam+jvv5siK7uTMQIJqHuj1NVqFhZfDKSUxmq6cISgiys06oV7
         82J+1BQBrdDX4CQnwsuLoVKF6bIuhMg2bU1QSUFwJRznm7QFWibaIX/b3kEg57cIvzY/
         BQVzQx2yspselH5c8Ji5C6w4IwwVHQqixGahEXnuBINA5OMgWHJg486pXbOhTnn55w1H
         l+qzWI8OpJ/p2Ed1qpMAkIh4JCfRIpgLANRuRTLwbJAYWuQ83BgFIm0E5DP2iCvMJJbW
         6P1N9gmCIjmx3srigi38Sx11e/NPtTqMna29eyLbuOA1grS/8G4Tj1dcvpZfMBDIFG40
         Us0A==
X-Forwarded-Encrypted: i=1; AHgh+Rq1dRHO5tgAbZAkLJ04XvKOwlCYX7z3oJiN5ePK4rYlJuRccLwHy3KfQBr/Is+lh/58AaIyal205ts=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTXaXWyWyGKz1RvbyBdg0Uxsi7cXMlVww/9R8JDNFasBHdcPuD
	dToAoAInAWlkaIgFFSO1Kd+5M1eZy/C21cM/vLko1z3ECVBt0wqRSr/tKVQ19d1zxyK8/6V4NPr
	83NTyHA==
X-Gm-Gg: AR+sD11+P6lmQZ3bk6yn8RMu+EwaIYY2w6p8Hsi2fY04bjiPBMYUXrC/PL7o5OS7fUh
	qgQ7TiyUa9EeHSphOv66rUWJ23Yd0iTZDMTPnvFzJFEZ/T+prXDOnlCfTXukK53Z8ypywRbpGKU
	IM8oeAGjpuxmiIuJvUZYM8jQGSh1sRq6WCF0P0/lj2FNoedQVgg0kUONAEiehCrpJL3d2Yo0aZU
	OIYC2qjbXm2TIeIYkq2r94hSRvBN3Q/lbTIMqoAmcpG9Vx227/HkkjiyEKi5t7gxj+NuI/LHf0F
	yKSZDYa18T36F+kW4rz10w6CbpsA5+YpwMdpQ0Y1rYPHDFigXnw5ts6U7rBreHWDCODrAsUAoTi
	xUHJETPTfTZCh7ZaHheLutbSUdHeQVfNZSNVqkqJuYBFDsQxI4hvG/r5xo9OgrXr1FBllC8epC3
	fjTz/WArE59xok0lNG55QXXnQi2grBr1r45IDXJpQR3JyCLYgpvdR2Sanx6HdNOfa/4Q==
X-Received: by 2002:a05:600c:a0d:b0:495:5b02:23b0 with SMTP id 5b1f17b1804b1-496b571dd8fmr108833125e9.26.1785166912443;
        Mon, 27 Jul 2026 08:41:52 -0700 (PDT)
Message-ID: <6501f040-ea59-4e78-8854-030f786dbcf7@suse.com>
Date: Mon, 27 Jul 2026 17:41:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/17] xen/riscv: add basic VGEIN management for AIA
 guests
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
 <b141b8d976719bb9b76147cacfd5842fb7aac74e.1784560663.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b141b8d976719bb9b76147cacfd5842fb7aac74e.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785166913-1ACDF9EA-AAE05D9D/0/0
X-purgate-type: clean
X-purgate-size: 5992

On 20.07.2026 18:02, Oleksii Kurochko wrote:
> It was decided to add support for IMSIC from the start instead of having APLIC
> operate in direct delivery mode, as it requires a trap-and-emulation approach,
> which is not optimal from a performance standpoint.
> 
> AIA provides a hardware-accelerated mechanism for delivering external
> interrupts to domains via "guest interrupt files" located in IMSIC.
> A single physical hart can implement multiple such files (up to GEILEN),
> allowing several virtual harts to receive interrupts directly from hardware.
> 
> Introduce per-CPU tracking of guest interrupt file identifiers (VGEIN)
> for systems implementing AIA specification. Each CPU maintains
> a bitmap describing which guest interrupt files are currently in use.
> 
> Add helpers to initialize the bitmap based on the number of available
> guest interrupt files (GEILEN), assign a VGEIN to a vCPU, and release it
> when no longer needed. When assigning a VGEIN, the corresponding value
> is written to the VGEIN field of the guest hstatus register so that
> VS-level external interrupts are delivered from the selected interrupt
> file.

And when exactly is this "assignment" intended to occur? vgein_assign() and
vgein_release() have no callers here, so this remains entirely unclear.

> @@ -14,10 +36,133 @@ bool aia_usable(void)
>      return _aia_usable;
>  }
>  
> +static int vgein_init(unsigned int cpu)
> +{
> +    struct vgein_ctrl *vgein = &per_cpu(vgein, cpu);
> +
> +    csr_write(CSR_HGEIE, -1UL);
> +    vgein->geilen = flsl(csr_read(CSR_HGEIE) >> 1);
> +    csr_write(CSR_HGEIE, 0);
> +
> +    printk("cpu%u.geilen=%u\n", cpu, vgein->geilen);

At most dprintk(), I'd say. Better drop altogether.

> +    if ( !vgein->geilen )
> +        return -EOPNOTSUPP;
> +
> +    vgein->owners = xvzalloc_array(struct vcpu *, vgein->geilen);
> +    if ( !vgein->owners )
> +        return -ENOMEM;
> +
> +    spin_lock_init(&vgein->lock);
> +
> +    return 0;
> +}
> +
> +static int cf_check cpu_callback(struct notifier_block *nfb, unsigned long action,

Nit: Line length.

> +                        void *hcpu)

Nit: Indentation.

> +{
> +    unsigned int cpu = (unsigned long)hcpu;
> +    int rc = 0;
> +
> +    switch ( action )
> +    {
> +    case CPU_STARTING:
> +        rc = vgein_init(cpu);
> +        if ( rc )
> +            printk("AIA: failed to init vgein for CPU%u\n", cpu);
> +        break;
> +    }
> +
> +    return notifier_from_errno(rc);
> +}

Where's the freeing of the allocation vgein_init(), when CPU bringup fails
or a CPU was brought down?

> +static struct notifier_block cpu_nfb = {
> +    .notifier_call = cpu_callback,
> +};
> +
>  void __init aia_init(void)
>  {
> +    int rc;
> +
>      if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ssaia) )
> +    {
> +        dprintk(XENLOG_WARNING, "SSAIA isn't present in riscv,isa\n");
>          return;
> +    }
> +
> +    if ( (rc = vgein_init(0)) )
> +    {
> +        dprintk(XENLOG_ERR, "vgein_init() failed: %d\n", rc);
> +        return;
> +    }
>  
>      _aia_usable = true;
> +
> +    register_cpu_notifier(&cpu_nfb);
> +}
> +
> +unsigned int vgein_assign(struct vcpu *v)
> +{
> +    unsigned int vgein_id;
> +    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
> +    unsigned long *bmp = &vgein->bmp;
> +    unsigned long flags;
> +
> +    if ( !vgein->geilen )
> +        return 0;
> +
> +    spin_lock_irqsave(&vgein->lock, flags);

Because it's unclear where this is to be called from, it's also unclear whether
a lock is needed here (and if so whether a plain spin lock is appropriate).

> +    /*
> +     * The vgein_id shouldn't be zero, as it will indicate that no guest
> +     * external interrupt source is selected for VS-level external interrupts
> +     * according to RISC-V privileged spec:
> +     *   Hypervisor Status Register (hstatus) in RISC-V privileged spec:
> +     *
> +     *   The VGEIN (Virtual Guest External Interrupt Number) field selects
> +     *   a guest external interrupt source for VS-level external interrupts.
> +     *   VGEIN is a WLRL field that must be able to hold values between zero
> +     *   and the maximum guest external interrupt number (known as GEILEN),
> +     *   inclusive.
> +     *   When VGEIN=0, no guest external interrupt source is selected for
> +     *   VS-level external interrupts.
> +     *
> +     * So start to search from bit number 1.
> +     */
> +    vgein_id = find_next_zero_bit(bmp, vgein->geilen + 1, 1);
> +
> +    if ( vgein_id > vgein->geilen )
> +        vgein_id = 0;
> +    else
> +    {
> +        __set_bit(vgein_id, bmp);
> +        vgein->owners[vgein_id] = v;

Again somewhat related to is being unclear how the function is going to be used,
it also remains unclear what ->owners[] is going to be needed for. Right now the
array is only ever written to.

> +    }
> +
> +    spin_unlock_irqrestore(&vgein->lock, flags);
> +
> +#ifdef VGEIN_DEBUG
> +    gprintk(XENLOG_DEBUG, "%s: %pv: vgein_id(%u), xen_cpu%u_bmp=%#lx\n",
> +           __func__, v, vgein_id, v->processor, *bmp);
> +#endif
> +
> +    return vgein_id;
> +}
> +
> +void vgein_release(struct vcpu *v, unsigned int vgein_id)
> +{
> +    unsigned long flags;
> +    struct vgein_ctrl *vgein = &per_cpu(vgein, v->processor);
> +
> +    if ( !vgein_id )
> +        return;
> +
> +    spin_lock_irqsave(&vgein->lock, flags);
> +    __clear_bit(vgein_id, &vgein->bmp);
> +    vgein->owners[vgein_id] = NULL;

If already you track the vCPU, also assert that prior to clearing the array
slot it has the expected value? For the bit being cleared, maybe also

    if ( !__test_and_clear_bit(vgein_id, &vgein->bmp) )
        ASSERT_UNREACHABLE();

? Yet as said - much remains unclear without knowing how all of this is
meant to be used.

Jan

