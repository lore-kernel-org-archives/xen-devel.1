Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142F8C56207
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 14:48:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384886.1627619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrzOD-00077P-5L; Thu, 06 Aug 2026 14:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384886.1627619; Thu, 06 Aug 2026 14:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrzOD-00077I-2G; Thu, 06 Aug 2026 14:48:09 +0000
Received: by outflank-mailman (input) for mailman id 1384886;
 Thu, 06 Aug 2026 14:48:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrzOB-00077C-RX
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 14:48:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrzOB-004XwN-1c
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 16:48:07 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a749ea0-e002-0a2a0a5209dd-0a2a45029324-6
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:48:03 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a749ea3-6ca4-0a2a45020019-d1558035e41a-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:48:03 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso17093035e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 07:48:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995422b741sm73799625e9.14.2026.08.06.07.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 07:48:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1786027683; x=1786632483; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yeruhxuIPamUdYkWP7spwzBqzWKRPoiRPaCXYfXcQp4=;
        b=dou3MvI95s38manyguIPx5CCo8HLb1khLoieNt7hO81g/hqEDn2NVvc1pUKXF28RsM
         lxHNvl12EsZUKBQ2z6Jg3zJpQrbkG3r+wxVy0BuXAkzTgM7sTgcOZ7Cmsyv5w0E7RCYy
         kwuTPudOCY14pmuoXg4tRMUFb9Vypiv1Q2lhVX2uSl+BC81BHQF4p0HDtpW4meJPBNB2
         9zdkRkxChi60itToUt+Nm+KFCbrY0LFFtNl8SwaLU+onWRvWFXwZcPL9ytKkrENhhc1a
         qTqVNCoVo/as2OLIRGSmTkGRZkyy/gU6WtB34OIeolYuHhOYlVjl4cBsJaUdc5X6af8a
         qY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027683; x=1786632483;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yeruhxuIPamUdYkWP7spwzBqzWKRPoiRPaCXYfXcQp4=;
        b=O1HOhLlnle8u2bfsYCVWBNnrybn3A/y+1tWh4zvog1v42NLAcUFkm5Mi/t9cWM+YNY
         1xHN2l4hCANmFwOeHMfcMt9UYYLgD5ZIelwzeguMuyPpcL0q3QdO5i8x4iLAt22sFa42
         XNTeb5M3PgC3DjWYcwEu7mMEPe2++yqsf6OfvkJwRhBtnqEBzfZom0HFSnUSQsEQiEy5
         9GVEy+FgTi7wQkpEwfoVgCKFKsHXDs3IkZtTUEtTrmm8yPgtC0pweZtScCoUhJYexR0X
         v5rYgO9FTW2FCaWdcwXfpbS2NZyEiY59XGvH+XjPKCg9HoLj71igDjzbxIEG5CyzNID5
         Obpg==
X-Forwarded-Encrypted: i=1; AHgh+RrqQ4azrhovjs1hvnKvCRlMHiJMvUIY/oh8QgllwkU7Qdaga4fVon4/nt9pJ/nAdxunOncVtBgVRyI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8skxZG+9bwKkthBV9ElagHg2nGW4QWdUG7akV5yjOYUiCNDRc
	O5jaZm6oohixLrNHPOKyIDB3qm2YeLlBshot75/pNBIfVvwPRBr0OdOTfCPcNaUBog==
X-Gm-Gg: AR+sD12yQcK0l2bcglV5IJ1Ku9nKw4KBZ3NytuMwjmmA7u7PCYawmKWAEyPU+Tw00+f
	hJTIxJz0zJrY8gCz+UPBU9n4GmVPo6XTDXdsc6aIiY8p7eNdLlAWfktfDnXpooIE83enNJIneRR
	//ATvRP7NpXd/gvRC5pam4bqqFvWY/JmqXITTEx0hWAwc/L5OBdXage8WfAvplIrogm5qlkYy1u
	h7Eq+ISpRVt9YAG1fpUodVo4NnBYPKVJ8MEIa0P9pk8XP4dD0+NPJn1tGQF4dBNK4LDztbKX0su
	Ac8HPjXKaolYUiyHj3LU0lF9XHSDqRFSfXG4Hcgcs/z+REdkDhTiet2doUlZzRjugMz3z4OLyhD
	aalcGKz+AydIfK9ySeLQTrkRPu6IhwVLryUJwafFvY74zxejqMI1UyXhSL73foNomuTQ2WNudtV
	jyIpCEqbXEiiQsM6j8abcbaRlGK+EQWjn005/qh9vDnDWSEcZTt5ntDFsnUNC9ex8e/f+4m7sTt
	Braur25KSNGUfN25QsyGC1K2VCIv+FEQGEWpvsgILAfysIl9fxN
X-Received: by 2002:a05:600c:529b:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-4994e71d3e5mr224238625e9.8.1786027682662;
        Thu, 06 Aug 2026 07:48:02 -0700 (PDT)
Message-ID: <dda2f05b-2965-4fff-92d9-326619be313b@suse.com>
Date: Thu, 6 Aug 2026 16:48:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/17] xen/riscv: map IMSIC interrupt file for vCPUs
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
 <254f470ae2e2b2a4affa7c405be8c07a7d8b300e.1784560663.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <254f470ae2e2b2a4affa7c405be8c07a7d8b300e.1784560663.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1786027683-307C22AC-0DD0A8B4/10/73395122804
X-purgate-type: spam
X-purgate-size: 4328

On 20.07.2026 18:02, Oleksii Kurochko wrote:
> A guest running in VS-mode expects its own IMSIC S-file at offset 0 of its
> guest-physical IMSIC block. Physically, the guest-file (G-file) assigned to
> this vCPU lives at a hart-relative offset given by guest_file_id (assigned
> via the vGEIN allocator). Therefore, imsic_map_guest_file() uses stage-2
> translation to redirect the guest's fixed per-vCPU GPA page (offset 0) to
> the specific physical guest-file page.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> The corresponding unmap of the IMSIC interrupt file will be introduced
> separately when the need arises.

Doesn't the need exist right away? There is ...

> @@ -342,6 +344,67 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
>      return 0;
>  }
>  
> +/*
> + * Map the physical IMSIC guest interrupt file (G-file) assigned to vCPU v
> + * into the domain's stage-2 guest-physical address space.
> + *
> + * In the machine's physical address space (SPA), each hart's IMSIC
> + * supervisor-level file (S-file) is located at offset 0 of its address block,
> + * followed contiguously by GEILEN guest files at offsets of 1, 2, ..., N pages.
> + *
> + * Because a guest OS running in VS-mode expects its own supervisor-level
> + * interrupt file to be at offset 0 of its guest-physical IMSIC block, the
> + * hypervisor must use stage-2 address translation to map the vCPU's
> + * guest-physical "supervisor" page (GPA offset 0) to the specific
> + * physical guest file page (SPA offset guest_file_id) on the physical hart.
> + *
> + * Xen pins each vCPU to a pCPU (v->processor) and assigns it a physical

... an apparently wrong assumption here: Xen doesn't normally pin vCPU-s.
When a vCPU migrates between pCPU-s, clearly the mapping referencing the
page associated with the old hart needs tearing down again.

That said, since the new mapping will appear at the same GFN, the original
mapping may simply end up being replaced. If such direct replacement is
legitimate to do, maybe this could actually be mentioned here?

> + * guest file index (guest_file_id) from the vGEIN allocator. A guest_file_id
> + * of 0 indicates that no hardware guest file is selected (matching the
> + * architectural behavior where vGEIN = 0 in the hstatus CSR selects no
> + * guest external interrupt source), requiring the VS-file to be emulated
> + * in software.
> + *
> + * The base guest-physical address advertised to the guest in the device
> + * tree matches offset 0 of the vCPU's virtual IMSIC block. Stage-2
> + * translation ensures that guest supervisor accesses to this page are
> + * transparently routed to the real hardware VS-file granted to it on
> + * the current pCPU.
> + */
> +int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
> +{
> +    int res = 0;
> +    struct domain *d = v->domain;
> +    unsigned int cpu = v->processor;
> +    vaddr_t gaddr = imsic_cfg.base_addr + (IMSIC_MMIO_PAGE_SZ * v->vcpu_id);
> +    paddr_t paddr;
> +    unsigned long guest_stride;
> +
> +    /* Nothing to map in the case of sw interrupt file. */
> +    if ( !vsfile_id )
> +        return res;
> +
> +    guest_stride = vsfile_id * IMSIC_MMIO_PAGE_SZ;

To me "stride" feels the wrong term here, as there's nothing that repeats.
"offset" likely would be better, assuming the use of this local variable is
really deemed worth it, as it's used ...

> +    paddr = imsic_cfg.msi[cpu].base_addr + imsic_cfg.msi[cpu].offset +
> +            guest_stride;

... only here.

> +#ifdef IMSIC_DEBUG
> +    printk("%s: %pv: ga(%#lx) -> pa(%#lx), cpu(%#x), guest_file_id(%d) "
> +           "base_addr(%#lx) offset(%#lx)\n", __func__, v, gaddr, paddr, cpu,
> +           vsfile_id, imsic_cfg.msi[cpu].base_addr, imsic_cfg.msi[cpu].offset);
> +#endif
> +
> +    res = map_regions_p2mt(d, gaddr_to_gfn(gaddr),
> +                           PFN_DOWN(IMSIC_MMIO_PAGE_SZ), maddr_to_mfn(paddr),
> +                           arch_dt_passthrough_p2m_type());
> +    if ( res )
> +        printk("%s: Failed to map %#lx to the guest at %#lx\n",
> +               __func__, paddr, gaddr);

I think you mean to use PRIpaddr with paddr_t (oddly enough there's no
PRIgaddr).

Jan

