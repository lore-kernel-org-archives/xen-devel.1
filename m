Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCCDC88E50
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 12:25:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420899.1647119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x65kX-0003Tv-SE; Mon, 14 Sep 2026 12:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420899.1647119; Mon, 14 Sep 2026 12:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x65kX-0003To-P9; Mon, 14 Sep 2026 12:25:29 +0000
Received: by outflank-mailman (input) for mailman id 1420899;
 Mon, 14 Sep 2026 12:25:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x65kW-0003Ti-AK
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 12:25:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x65kV-009oxT-N9
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 14:25:27 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7e7b1-2eae-0a2a0a5409dd-0a2a4509bc2a-8
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 14:25:27 +0200
Received: from [209.85.208.45] (helo=mail-ed1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7e7b5-be1a-0a2a45090019-d155d02df14c-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 14:25:25 +0200
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-6a68279dd86so3784832a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 05:25:25 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c296601f4ccsm418223666b.20.2026.09.14.05.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 05:25:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789388725; x=1789993525; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hx2uFWIyZzNHhpXFCEL4qmHY6+FmVxnXkFpagWWooc=;
        b=M6CzoqnEx7pPyIF/O9kJNjKbMIdTS2dgQTwXNd6mvcJxErCEEDCyjBHljAwjE+79QB
         //yIKbeqr4Q+uWAWH3gdO6V7N5bLPoYB7GnbKqB1UIvhw1cpd+JD6rrQjwWjUDHDVCPH
         OexjIp4JrylRmf6pSsFra05b0rY3YsHubBhFCVxLrNUEUmnZBdlb+UujpWJdoE4/glWm
         k98m5X+CPtsc5ozi1uVAOUed7xf6U55oUhkLiWDTMtTTa1g7XxP7Qd1faSHyGl/0FIaa
         pn6StbAKIVivk6eA6ugMVE6ktYiBopQGyXpg70vDa8OMkfrgq0tPCAX3HULDrZdj9v6o
         +iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388725; x=1789993525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4hx2uFWIyZzNHhpXFCEL4qmHY6+FmVxnXkFpagWWooc=;
        b=tRCxYZusTVYT9y6v8wm/z+JqvdQQLkfzLesCnJZIzlrBEHfdiNmPauvj4i0zDuD4NU
         Qgy313PwTKUDP+JlhoTYf5VzZsxCY5QH5liUFMMxbYPfaptyzX6jZP6ZuR8w9df2bZYA
         P8EWDgdB22s5GVLz2/tqlA6zgI0LhW7PgDQmmqb/NBziHho7rjHmFJqp4hFP7wXysE6X
         W+plCpgWBWP/+cagTV25cx0765GdZowJnzGiIXxXweplLeYqhSvu3c/Zf2Ph02mImuiB
         GU5v2HCKq31uvxCZOtgRl4UpSOavQdiksaqFFC92RWmRqfTBxdY1pMqiHVK0ineWzL/X
         T8bw==
X-Forwarded-Encrypted: i=1; AKwUvBxfXKejQ/x2tWfgWkYXwm+qyrEAhUVzY2H/84sk2V8l5RmoC2PfXY71h6/WH7IKTcE5IBxHPqYbafs=@lists.xenproject.org
X-Gm-Message-State: AFuF++nqezJSYCLMZHZkhHKWbSDq5f40bB8eUOvJC7zX1xFT2zZtX3JT
	uTZ5dBpFVJDmY714PunUxMDrMCB/e9brknDSyzUb9tcxzO9O4A5CYn+wAeMUmlyB4A==
X-Gm-Gg: AYBFou0x5b2SX5xzsNEL1xKqxbyxUtCfkGRkoKGfEISzmXBXFjWqtIENsCe4hCRH61w
	Y83VyaLp97vEzl01EE/d7X0ql9dlCrRPbnnAKStjSrYPxipJG03GXVoP/U5/e4f72bHgoMgqAQD
	+N+R1V4uN/xv83SzsCO3YNdkP/UWjbil25m87GykcwewJ8U+ixQ6VrGMR5hGDBdQPCemYRLJ2sl
	lFXy2WgsFQLZDgDwvD9nCJk2fudqwnXEQnCgANnjZ4ejQ1For4uk1Ca1/FDilfc/Cg0SBKeyKcw
	SfxbIqHAMslnje6FGGrDgK/j8jiWAKwQVFzF6i/zWOplVdFaJv3tkRmH1LZuEmg1w0WKL2LuEFE
	R1vKh64KWud98nYvMsEbKUcwBFkAtOCUL37OgxadCc3+e0v1MD2y1YZ25XS0r4vSWSYLhB/sUc4
	yoUs2PnpiAFg1nwmlaN0RZ548yFqabXoXv/zdaj6kcD2l1TVU/FZdWgxfycvp+nNbKB1ZYd5FMq
	UiicraEm3r8heN9gIzxy0M=
X-Received: by 2002:a17:907:d0d:b0:c29:3d59:7072 with SMTP id a640c23a62f3a-c29b8647a82mr145566166b.16.1789388725361;
        Mon, 14 Sep 2026 05:25:25 -0700 (PDT)
Message-ID: <2e29de1d-370d-4251-8e1d-dd9f17720339@suse.com>
Date: Mon, 14 Sep 2026 14:25:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 29/39] xen/riscv: introduce aplic_reconfigure_target()
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
 <d90832888c1bcb08146a6c36591ac0c31b8b0ce1.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d90832888c1bcb08146a6c36591ac0c31b8b0ce1.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1789388725-3BCD7034-27909F39/10/73395122804
X-purgate-type: spam
X-purgate-size: 2642

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> When a vCPU is migrated to a different pCPU, its IMSIC guest interrupt
> file changes. Any APLIC interrupt previously configured to deliver an
> MSI to the old interrupt file must be retargeted to the new one.
> 
> Implement aplic_reconfigure_target() to scan all interrupts allocated
> to the domain and update their APLIC TARGET registers accordingly.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

First of all I'd like to understand how this "reconfigure" works without
losing interrupts and at the same time without other possible races. An
interrupt can be raised at any time, after all.

> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -138,6 +138,48 @@ uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu,
>      return base_val;
>  }
>  
> +void aplic_reconfigure_target(const struct vcpu *v,
> +                              unsigned int old_guest_file_id,
> +                              unsigned int old_cpu)
> +{
> +    const struct vintc *vintc = v->domain->arch.vintc;
> +    const unsigned long *auth_irq_bmp = vintc->used_irqs;
> +    unsigned long old_hart_field = aplic_hart_field(old_cpu);

Once again a question you may already recognize: What extra value does
"field" in the variable name add?

> +    unsigned long flags;
> +    unsigned int irqn;
> +
> +    /* Support only MSI mode at the moment */
> +    BUG_ON(!aplic_msi_mode());
> +
> +    spin_lock_irqsave(&aplic.lock, flags);

Taking a global lock for a per-vCPU operation isn't going to scale
very well. Even more so when then ...

> +    bitmap_for_each ( irqn, auth_irq_bmp, vintc->nr_virqs )

... you run a loop with perhaps many (hundreds? thousands?)
iterations.

> +    {
> +        volatile uint32_t __iomem *ptarget;
> +        uint32_t target_val;
> +        unsigned int guest_index, hart_index;
> +
> +        if ( !irqn )
> +            continue;
> +
> +        ptarget = &aplic.regs->target[irqn - 1];
> +        target_val = readl(ptarget);
> +
> +        guest_index = MASK_EXTR(target_val, APLIC_TARGET_GUEST_IDX);
> +        hart_index = MASK_EXTR(target_val, APLIC_TARGET_HART_IDX);
> +
> +        if ( (guest_index != old_guest_file_id) ||
> +             (hart_index != old_hart_field) )
> +            continue;

Along the lines of the naming comment above: This would be more
logical to follow if it was

        if ( (guest_id != old_guest_id) ||
             (hart != old_hart) )
            continue;

i.e. names on each side of the != suitably matching up.

Jan

