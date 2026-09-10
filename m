Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0139BC79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 12:53:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414594.1644340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4eH9-0000X0-Kq; Thu, 10 Sep 2026 12:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414594.1644340; Thu, 10 Sep 2026 12:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4eH9-0000Wt-HX; Thu, 10 Sep 2026 12:53:11 +0000
Received: by outflank-mailman (input) for mailman id 1414594;
 Thu, 10 Sep 2026 12:53:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4eH8-0000Wn-0a
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 12:53:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4eH7-00AnLu-4q
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 14:53:09 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2a820-bab6-0a2a0a5309dd-0a2a45049dcc-36
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 14:53:09 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa2a834-b57f-0a2a45040019-d155dd33c90a-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 14:53:08 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48441fa5c37so4973741f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 05:53:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885be01bsm49092335f8f.31.2026.09.10.05.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 05:53:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1789044788; x=1789649588; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OZQiX16Un81CpdtvuHndGBWmAvi5bEUyfkFhTR+Kig=;
        b=YSedXQfGJj2Uo2Bj++/cchpAGNrZXcD0RtDVZ6FPzh5Fz5S6pOCWawOFc7UspXudHe
         sExSnvNzu4KclgobVi8r36v0wFizsr5dPE1moYvKI56e11pAe+JgXnTDA5WBPP6/da+c
         dCSCH4sfTaRtx8LnPdwMfDNBq9NktUWzaSCZucR7UFRjM0mYW61rcl1FQyMQeESk26bB
         UDTvNCxZwMjnVo8iOVVt6XO+LaTtvSwkTwWNXxo23iXXY4y8hQ9rnSBiQXg6PjWrFKCD
         CQfh16YW1NH29a7IqXRDfxuw8wQcB/ze8dar5sjzHLYPcoG2dI0zlOTqgznnHAQs+eyY
         IRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044788; x=1789649588;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3OZQiX16Un81CpdtvuHndGBWmAvi5bEUyfkFhTR+Kig=;
        b=NEA9NU6iA8fxnbGvsYVQiXXI4sFTyhPQf+B1wdfXBye6k4ldkPQbltItDT+t6uDhi4
         RY1DmTG0ooFekWM9R+5yYmC53FY0M3y33frPZ5UcUQwW2Fzg3NqYrodeMCu2eMFeLAa2
         JYVFnYQnkgon+LWcz3awyA8g5ZVHpGovt4cyKAzSEGFSYhDg52B0vlfOIUFFp480QC2G
         zy8ZY434yAeVGpDAaPa5M1h7K0HvqFVYIjmTuqSZDqQ1SyKR5ureN0i5b1izaY0cm2i1
         0BL1xLp9OvWwaohnRkXoi9ZiCBFWwe2Kc92su9Za4E71VR5HAa70mrPm4KY947Z0fCIV
         /hjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWi9WJHvrgx6DVnV+iySOsEsjQBH1yaHheZQ3tAJ8xTfBP2BHggCfdQZrf5IKGVjN5Y9IjHP8krV4=@lists.xenproject.org
X-Gm-Message-State: AFuF++kyKrQyA8Bn/Hn56YnleU7tM8xQrMr6C2n4DkAqUzsFVljOiCjw
	E14Cgbw2KUsKM2969et4HG3b4CgD4RFcEN/HUGEyo6NSq1PtHkqXO7jJyiUe9RkFFA==
X-Gm-Gg: AYBFou2SZVXySCxEez2s7jK7tYjGbynbXSxqMdBlV0IYfiMAOSgTq4vjdavYfj6b4dD
	tpTmNpZHZ4gqVzqCG+OlpX8TCTwDClwG59Nqxo7fN5yHA3ak454ofspNmYbwiyCVLSDk81oPh4+
	blj7iwls1RLiILYm0LUTbI3UoCp6wXXwbMKbE1q8IXfCbASSLBfAnl5lfPPdeMpGlD0Nr1MfNNR
	QvnEHAeq1f+YoPq+JqU9cFicssRjbKZZKx4nvxLt4dtXoxmYNwsfMuNaLho9WabP+yUKTrVigO7
	BuLKICubxDFrvAv1qaAUioEHpthKTfv6RVIQPyFd16T4BRDILnaE50ERmf8xetYsCACNtUZUXT6
	8CM/94nUgEnEB7tvTGGHrREvc7ja5y75YNkZulhIU6o3kHNEdgqZzBSaZBZhx2SgbFEXD93sns8
	9tgnwI+2mu87jtmy4W6bECXOJfONdCrHYtJtD13BYk5B4z5JKJ+Y+dVxegEyZ1M8kju7TcVjhCS
	G/AKv/DSgCrYtMb3Jd/qRMGJODGeGc9gbCpnffx3bLq1gvc2Laja5tzDxoGbhsW
X-Received: by 2002:a5d:588b:0:b0:485:ac96:7263 with SMTP id ffacd0b85a97d-485ac9673b3mr10591953f8f.12.1789044788381;
        Thu, 10 Sep 2026 05:53:08 -0700 (PDT)
Message-ID: <e1d611bc-115d-4050-89c9-9781e9900ea1@suse.com>
Date: Thu, 10 Sep 2026 14:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/20] xen/riscv: implement IRQ routing for device
 passthrough
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
 <afef58245a58f4084e38ea1d9880282a8e8beeef.1788876411.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <afef58245a58f4084e38ea1d9880282a8e8beeef.1788876411.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1789044788-C20D5B50-51A4FEBD/0/0
X-purgate-type: clean
X-purgate-size: 4035

On 09.09.2026 17:07, Oleksii Kurochko wrote:
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -205,7 +205,7 @@ void __init init_IRQ(void)
>  static inline struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
>  {
>      ASSERT(spin_is_locked(&desc->lock));
> -    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
> +    ASSERT(desc->status & IRQ_GUEST);
>      ASSERT(desc->action != NULL);
>  
>      return desc->action->dev_id;

Why did an Arm change slip into a RISC-V patch?

> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -325,9 +325,40 @@ static const hw_irq_controller aplic_xen_irq_type = {
>      .set_affinity = aplic_set_irq_affinity,
>  };
>  
> +static unsigned int cf_check aplic_guest_irq_startup(struct irq_desc *desc)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +/*
> + * Shared by ->shutdown(), ->enable(), ->disable() and ->end(), which have
> + * no state.
> + */
> +static void cf_check aplic_guest_irq_stub(struct irq_desc *desc)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +static void cf_check aplic_guest_set_irq_affinity(struct irq_desc *desc,
> +                                                  const cpumask_t *mask)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +static const hw_irq_controller aplic_guest = {
> +    .typename     = "aplic",

This is indistinguishable from aplic_xen_irq_type. Naming of both variables
also isn't consistent

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

Why is this suddenly necessary? There are ...

> @@ -76,10 +82,13 @@ void register_intc_ops(const struct intc_hw_init_ops *init_ops);
>  void intc_init(void);
>  
>  void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
> +int intc_route_irq_to_guest(struct irq_desc *desc, unsigned int priority);
>  
>  void intc_handle_external_irqs(struct cpu_user_regs *regs);
>  
>  int domain_vintc_init(struct domain *d);
>  void domain_vintc_deinit(struct domain *d);
>  
> +int vintc_reserve_virq(const struct domain *d, unsigned int virq);

... existing uses of struct domain already, immediately ahead of this added
line.

> @@ -78,6 +82,22 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>      intc_set_irq_priority(desc, priority);
>  }
>  
> +int intc_route_irq_to_guest(struct irq_desc *desc,
> +                            unsigned int priority)
> +{
> +    ASSERT(spin_is_locked(&desc->lock));
> +
> +    ASSERT(intc_hw_ops->guest_irq_type);
> +
> +    desc->handler = intc_hw_ops->guest_irq_type;
> +    __set_bit(_IRQ_GUEST, &desc->status);

The revlog says you replaced all of these bitops.

> @@ -227,3 +251,240 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
>      spin_unlock(&desc->lock);
>      irq_exit();
>  }
> +
> +static struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
> +{
> +    ASSERT(spin_is_locked(&desc->lock));
> +    ASSERT(test_bit(_IRQ_GUEST, &desc->status));

Same here. And more elsewhere.

> +/* Route an IRQ to a specific guest */
> +int route_irq_to_guest(struct domain *d, unsigned int virq,
> +                       unsigned int irq, const char *devname)
> +{
> +    struct irq_guest *info;
> +    struct irq_desc *desc = irq_to_desc(irq);
> +    unsigned long flags;
> +    int retval = 0;
> +
> +    if ( d->is_dying )
> +        return -EINVAL;
> +
> +    info = xvzalloc(struct irq_guest);
> +    if ( !info )
> +        return -ENOMEM;
> +
> +    info->d = d;
> +    info->virq = virq;
> +
> +    info->action.dev_id = info;
> +    info->action.name = devname;
> +    /* The action is part of 'info', thus it is freed together with it. */
> +    info->action.free_on_release = false;

The revlog says this line doesn't exist anymore.

Jan

