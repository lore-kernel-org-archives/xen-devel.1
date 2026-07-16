Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC3EC44501
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 12:35:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1363971.1615368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkLJN-0004Ho-I9; Thu, 16 Jul 2026 12:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1363971.1615368; Thu, 16 Jul 2026 12:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkLJN-0004Hh-FH; Thu, 16 Jul 2026 12:35:33 +0000
Received: by outflank-mailman (input) for mailman id 1363971;
 Thu, 16 Jul 2026 12:35:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wkLJM-0004Hb-3E
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 12:35:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkLJJ-00EhIW-3l
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 14:35:29 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58d009-bab6-0a2a0a5309dd-0a2a4508dc80-32
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 14:35:28 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a58d010-f659-0a2a45080019-d155dd2ee4e5-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 14:35:28 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-470174001a0so1700344f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 05:35:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464caeffsm22746633f8f.36.2026.07.16.05.35.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jul 2026 05:35:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1784205328; x=1784810128; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GsA1hnt7dB4Nount0NQW3/ntJN4n8sOG/E6DgsVMf4=;
        b=DnWusp+VseJRB9eJ4O015Gu/wcAU8yGiPzf60kpWAKNw22tWJk2XdEmTz2nD/bwCci
         hqAU30SDPq1gpT8bA5m7pEEgfOzNaZbGed8/1ZQVbM0tPyyIpf9isUvxFKU+XFfYCJN2
         7DNSXTIKzaRqINuTFRKuYlreIjxM57ge9jdVTdkUOJzuCDVy5p/louQzOCre+axD/30B
         C9JDqCai32rSdNmF6bMxArnT/0tCrwfji512eCfWJXcgCyXqJF3yoQGoa3zBvBLdhmA7
         TEPlsvPhwrn+MmohJrnbakOR0jpH3uBmRkZz7IOvaSHNq14nlwm9Ff9RSBvvr8qUxMoL
         3HZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205328; x=1784810128;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GsA1hnt7dB4Nount0NQW3/ntJN4n8sOG/E6DgsVMf4=;
        b=CVCeqyrwQWkPDfjjnCoonMdb76REfM6RYNKayHPEtYJoIaiPO3omOf1P73nYrIL3SY
         YFzcdShyJzFp9FnB1XCcqz4atlnYDrRIZEx7amDAMujOgCGofAifsvlh2nvRrncFWYEL
         QfVfLQLpl8JP8qkJGKyFIN+bTkUqDSvdZ8ZqVUKFr6cbeOk8vDxvAwnr0hHWrG0BcxPE
         j900noEYytLN+IPegJhizsdwOXuHExH9QEZwkWKNvXDRq3O1bzlEseMCJy60yLdSTK5P
         uvj0EPwJckEz/P026zQpJvtRQd/rM6+ehVPyd7cCAK0cMmte7aQfmFvFlGJfChHawF6O
         T/1A==
X-Forwarded-Encrypted: i=1; AHgh+RrBINMQPL/bWvgzStlMuairSyGOQBySRtj5T3jJy5wRgp5K/X9x88Kh8AyC85z8lU3vmZdFWC9qr50=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEfLM0eBugoZAedBJDp93hoLVvGsQ+Ziy7P7DYKPXR1luRT7Bn
	Xku4F9DFuHs7gM5bWV4IibO+hParu/sZjrvjtjFYYaLU/4yXj4uq/OxrS9B683yfYQ==
X-Gm-Gg: AfdE7clZ8CTlN+vuCoj0WPzRpt7wTlyrZf6Plz9DygGlyWFr7hM8kHKUshz7CJF1Z7t
	8UaJv5JKo+Np3CzxDfe1Yk87wTnMbjKFG4iRmbH8sVA3se6P32Y4YBnPDxNzHX5V1S6vgDavxkF
	oOGZJU/k6y4Mkfx9oUL7mIOiAAZxyXbW8G9LnRBzdXoMEUW3o0mMzo5JKa9LtFhVbaETKhihNki
	ynB0nbQ9CJw/K0iQiz29XGf6HWW/2mGGyKX1tlnZpWEmO3wZoaL43IZS/AsqNrM2hFqbnymgc+J
	FzFYLHP1YP3jNFnbQjO1Q79kYI/PyMSq72f61HM+hGixZkSqAfGlGx/J50UQCi5iyRtPUy3aRbI
	4F/VihHAs0nYVMXi0iBMvz2la3CUg9Anz08lpsYSkVf2QyPjQ2x63p4GXdCQVDym6TRhVUjmDFw
	f/21DwJrPSrl5VnTM4A0DWH0twAqHJOckzRQM0ZM/DAoduvyH6LMfBHW39Yfv/5kH7WQ==
X-Received: by 2002:a5d:588e:0:b0:47d:f43d:8947 with SMTP id ffacd0b85a97d-47f2dce306dmr24886863f8f.47.1784205328269;
        Thu, 16 Jul 2026 05:35:28 -0700 (PDT)
Message-ID: <fb34a560-9f54-4b16-86b0-2cedd63b7af6@suse.com>
Date: Thu, 16 Jul 2026 14:35:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/26] xen/riscv: implement IRQ routing for device
 passthrough
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <c8611ea230ffaf44bec4b4232dfbb9832bb24619.1783331040.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <c8611ea230ffaf44bec4b4232dfbb9832bb24619.1783331040.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1784205328-CE74387B-3DAF04C9/10/73395122804
X-purgate-type: spam
X-purgate-size: 3706

On 06.07.2026 17:58, Oleksii Kurochko wrote:
> dom0less device passthrough requires granting guest domains access to
> device interrupts.  Introduce map_device_irqs_to_domain() to enumerate
> a DT node's interrupt properties, skipping those not owned by
> the primary interrupt controller (as at the moment I haven't seen usages
> of it), and map_irq_to_domain() to grant domain access and configure
> Xen's interrupt descriptor accordingly. Sharing IRQ between domains is
> rejected.
> 
> Both map_irq_to_domain() and map_device_irqs_to_domain() are marked
> __overlay_init, mirroring Arm: without CONFIG_OVERLAY_DTB this expands to
> __init, so the functions are init-only and need no XSM check; with
> CONFIG_OVERLAY_DTB they become runtime-callable, but the only runtime
> entry point is dt_overlay_domctl(), which performs the XSM checks at the
> domctl layer.  RISC-V does not wire up DT overlay yet, so today these are
> strictly __init; if/when overlay support is added, the domctl-level XSM
> gating must be added together with it, as on Arm.
> 
> route_irq_to_guest() and release_irq() manage irq_desc ownership for
> guest-assigned interrupts.  Each assignment carries a small irq_guest
> structure as irqaction::dev_id, recording the owning domain and virtual
> IRQ number which is 1:1 mapped to physical IRQ number.  A per-domain
> vIRQ allocation bitmap (used_irqs in struct vintc), managed by
> vintc_reserve_virq(), prevents the same vIRQ being claimed twice.
> 
> Host and guest interrupts may differ in some operations (EOI timing in
> particular, possibly others): a host IRQ is completed once Xen's handler
> runs, whereas a passthrough IRQ must defer the physical completion until
> the guest issues its own EOI, otherwise a still-asserted level line would
> immediately retrigger and storm.  This affects only the .end callback;
> the rest of hw_interrupt_type is shared, hence the separate host and
> guest hw_interrupt_type instances.
> 
> With APLIC+IMSIC, guest interrupts are delivered directly by hardware
> through the IMSIC, bypassing do_IRQ(). The _IRQ_GUEST branch in
> do_IRQ() is therefore left as BUG() until a platform without direct
> IMSIC delivery is encountered.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Irrespective I'm pretty curious how ...

> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -306,9 +306,13 @@ static const hw_irq_controller aplic_xen_irq_type = {
>      .set_affinity = aplic_set_irq_affinity,
>  };
>  
> +/* At the moment there is no difference between guest and Xen ops */
> +#define aplic_guest_irq_type aplic_xen_irq_type
> +
>  static const struct intc_hw_operations aplic_ops = {
>      .info                = &aplic_info,
>      .host_irq_type       = &aplic_xen_irq_type,
> +    .guest_irq_type      = &aplic_guest_irq_type,
>      .handle_interrupt    = aplic_handle_interrupt,
>      .set_irq_type        = aplic_set_irq_type,
>  };

... this duplication of the same struct into ...

> --- a/xen/arch/riscv/include/asm/intc.h
> +++ b/xen/arch/riscv/include/asm/intc.h
> @@ -15,6 +15,7 @@ enum intc_variant {
>  };
>  
>  struct cpu_user_regs;
> +struct domain;
>  struct irq_desc;
>  struct kernel_info;
>  struct vcpu;
> @@ -34,6 +35,9 @@ struct intc_hw_operations {
>      /* hw_irq_controller to enable/disable/eoi host irq */
>      const struct hw_interrupt_type *host_irq_type;
>  
> +    /* hw_irq_controller to enable/disable/eoi guest irq */
> +    const struct hw_interrupt_type *guest_irq_type;

... two distinct fields is going to work / be useful.

Jan

