Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932FB606A323
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=G0C0v4Jp
Received: from list by lists.xenproject.org with outflank-mailman.1482052.1685932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQo9d-0008Gy-DR; Tue, 10 Nov 2026 15:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1482052.1685932; Tue, 10 Nov 2026 15:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQo9d-0008Gm-AV; Tue, 10 Nov 2026 15:53:01 +0000
Received: by outflank-mailman (input) for mailman id 1482052;
 Tue, 10 Nov 2026 15:53:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQo9c-0008G1-GS
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:53:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQo9b-000xZo-Mg
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:52:59 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af33dc8-2eae-0a2a0a5409dd-0a2a4506b0d2-26
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:52:56 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af33dd8-195a-0a2a45060019-d155dd36e103-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:52:56 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so1502460f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 07:52:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498369a4238sm5957432f8f.54.2026.11.10.07.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 07:52:55 -0800 (PST)
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
        d=suse.com; s=google; t=1794325976; x=1794930776; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hT3WLy6JaWCkD1uJN9/6imk7KHx9s2CgltGAI+j6n1c=;
        b=G0C0v4Jp945PKCnDlhxbtkSd8Y5XBw74bj8iMjDtgik6lZtVxjsYeqDv9MbpDolVs3
         kQWynJ0PAhFc4vUIG90Z5COX/ezzwB65jbOUG+4z2aDjba0V5kr7kbP+cb+KWHsyIAnY
         XtfN+7KXsyk8scJNM2m5mBt4koVxfS0p4pOVEW1jk+rRq5P8rf1baihQX1SM3v6wMb8s
         aV7lcHTZxBESj4CNAzr0wWf8QXxFmznP8LFOQ6jvBh7OIREC9tMrPl0w3QT9HvwEyVEw
         CksgGPjcjksluHOes0At4UbL1bw3PbrfIN5sNeJaUAWmqz0qXyab37pgBLycWXv/+PdH
         0JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794325976; x=1794930776;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hT3WLy6JaWCkD1uJN9/6imk7KHx9s2CgltGAI+j6n1c=;
        b=CRZQBElDgLwVDA2oVwJM2w+uuzmeFc4YHA6qqPurPWMz0o61e3RfI0kn0KZqwksOVR
         2+egSBNzbi1QqDIjn3qdh86G1NzI2eRRhhlEoDQx/+M//uFeT8qXO5gz6sDEn1rxlltj
         DKQKIAuEqikSrOezrjynC1YBcn0d2HAan46HL2/LWIw3KtUpTphvC02ftDto5f/EadK9
         YvsT4pbc65101Utz4uNxelG91uLZJfomMvuAj0GP7ZiMCyMFjdZqInoQ7sjgcTC1EcyP
         gJdZ5ewBS8KAcyWV6QTRC6MPWauiIeL8vpBfx3xcuAxWPTT40OAvPd7Ws6j/ngkQIAD3
         nXbQ==
X-Forwarded-Encrypted: i=1; AL+hErGj1fU51vunvmxN6Fb6+pWeHfY/MDsWXJpfgLBRuPkkX4U/LHfUD/otZwFSK+Sf7cnEmL51noPvusw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9f7OfiMIs2UM38W25Wn5Jl2DVjf+T1Ub7oadh3Dci3BdssFtZ7
	5wzO3zudEz6RF+QvnerCtbIfAFT2Jx4FnNUrqG292vuneNKvP9dt6Ud70B3B4bNzQQ==
X-Gm-Gg: AYBFou273ZvwcxQFfYS+RHGoqqgC22GDQXlWhIyOp3LFmgwnS9rEYWkntoR4+LALeX1
	muk8ZGDVeN/RW1Da/SEpZRIWOEvVSpAaOBZ/ua9bML1wey+RgbhtmdS0IOqzz9DP+CLYxlIzjRX
	zVkoBYznDqX27RPUhGkrnMmemdn531XzOXSpBentgFkMdTu8B8+ZM/E838iTsB+lrKfvgxLvSRU
	FMu6SFgQS/zxlABO9BFnIvIPXAgSXurj4bvracucliBS4SB17wbDUgL+7oA4R7uA499+HPug4f9
	d/Q9B/HlgmKDuRffNKYmJmR4gGC11g3LrF4pjwbbHfL29uoDEM1GEEaJJt9PMzXgpl7dXgMzSDt
	l7eC+pCaobGyCypjOreKYoRTdxJupX4j27kIE2qg2ihwfaLqu2BvnnRcJedlXMMOtlk07jJWNCh
	w6IRgrSqKblaJkD0Sv6q9Wm+noIqEsXyuLwQm3pn0q1/aIZv1dWcUjVu7aCA5Zqtxl8cyZhRW5T
	nThbKMjMQwdCzhU5qCydE69toezy79va2vwTNFv2wzwYulKLF5ieCnrY/SrmBiow01he8WKiTRY
	N9iMyt2YtcHIRSlVmR5sWzxFeX/phaggbvgXWdEIOi61FuD0xPqd8KX3kjtJljOXH230tP6Z7Sh
	OvnIgM07pAlsgUG7wBS3vnZG9h5RrkIR69MSVSA8=
X-Received: by 2002:a5d:59c9:0:b0:48f:bf3c:1631 with SMTP id ffacd0b85a97d-4982eb0b4femr5783547f8f.21.1794325975870;
        Tue, 10 Nov 2026 07:52:55 -0800 (PST)
Message-ID: <3dc50437-5417-4456-adfa-fe3268a4230a@suse.com>
Date: Tue, 10 Nov 2026 16:52:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/39] xen/riscv: implement vCPU context switching
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
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <6e539cc5ded7f62c4347781785af714840893184.1790779209.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <6e539cc5ded7f62c4347781785af714840893184.1790779209.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1794325976-FD00977B-44DDD3AF/10/78276251493
X-purgate-type: spam
X-purgate-size: 3374
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30.09.2026 18:23, Oleksii Kurochko wrote:
> @@ -323,6 +326,130 @@ int arch_domain_create(struct domain *d,
>      return rc;
>  }
>  
> +static void csr_regs_ctxt_switch_from(struct vcpu *p)
> +{
> +    /*
> +     * There is no need to save these CSRs as only hypervisor writes them in
> +     * csr_regs_ctxt_switch_to() and guest can't access them so they shouldn't
> +     * be stored here. Keep them commented here just for symmetry with the
> +     * restore CSRs register part.
> +     *
> +     * p->arch.hedeleg = csr_read(CSR_HEDELEG);
> +     * p->arch.hideleg = csr_read(CSR_HIDELEG);
> +     * p->arch.henvcfg = csr_read64(CSR_HENVCFG);
> +     * p->arch.hcounteren = csr_read(CSR_HCOUNTEREN);
> +     * p->arch.htimedelta = csr_read64(CSR_HTIMEDELTA);
> +     *
> +     * if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +     *     p->arch.hstateen0 = csr_read(CSR_HSTATEEN0);
> +     */

I don't understand this comment. Whether the guest can access a CSR doesn't
matter very much. If Xen modifies it on the guest's behalf, it may still
need saving/restoring. The question for each individual one is: Can its
value (or the guest-affecting fields of it) be reconstructed from other
state? Or is what it holds global state? Or are p->arch.* fields reliably
kept in sync with what is stored in the hw register?

> +    p->arch.hvip = csr_read(CSR_HVIP);
> +
> +    p->arch.vsstatus = csr_read(CSR_VSSTATUS);
> +    p->arch.vsie = csr_read64(CSR_VSIE);
> +    p->arch.vstvec = csr_read(CSR_VSTVEC);
> +    p->arch.vsscratch = csr_read(CSR_VSSCRATCH);
> +    p->arch.vscause = csr_read(CSR_VSCAUSE);
> +    p->arch.vstval = csr_read(CSR_VSTVAL);
> +    p->arch.vsepc = csr_read(CSR_VSEPC);
> +}
> +
> +static void csr_regs_ctxt_switch_to(struct vcpu *n)
> +{
> +    csr_write(CSR_HEDELEG, n->arch.hedeleg);
> +    csr_write(CSR_HIDELEG, n->arch.hideleg);
> +    csr_write(CSR_HVIP, n->arch.hvip);
> +    csr_write64(CSR_HENVCFG, n->arch.henvcfg);
> +    csr_write(CSR_HCOUNTEREN, n->arch.hcounteren);
> +    csr_write64(CSR_HTIMEDELTA, n->arch.htimedelta);
> +
> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
> +        csr_write(CSR_HSTATEEN0, n->arch.hstateen0);
> +
> +    csr_write(CSR_VSSTATUS, n->arch.vsstatus);
> +    csr_write64(CSR_VSIE, n->arch.vsie);
> +    csr_write(CSR_VSTVEC, n->arch.vstvec);
> +    csr_write(CSR_VSSCRATCH, n->arch.vsscratch);
> +    csr_write(CSR_VSCAUSE, n->arch.vscause);
> +    csr_write(CSR_VSTVAL, n->arch.vstval);
> +    csr_write(CSR_VSEPC, n->arch.vsepc);
> +}

Btw, for both function names possibly s/csr_regs/csrs/ ? Or even just singular?

> @@ -72,6 +79,12 @@
>      (void)csr ## H;                 \
>      csr_read(csr);                  \
>  })
> +
> +#define csr_read64(csr)             \
> +({                                  \
> +    (void)csr ## H;                 \

I continue to not really understand what use this is.

> --- a/xen/arch/riscv/include/asm/system.h
> +++ b/xen/arch/riscv/include/asm/system.h
> @@ -76,6 +76,8 @@ static inline bool local_irq_is_enabled(void)
>  
>  #define arch_fetch_and_add(x, v) __sync_fetch_and_add(x, v)
>  
> +struct vcpu *__context_switch(struct vcpu *prev, const struct vcpu *next);

asmlinkage (at least for Misra's sake)?

Jan

