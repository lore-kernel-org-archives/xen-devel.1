Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4921FC88E72
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 15:02:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421063.1647202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x68CY-0007mR-CX; Mon, 14 Sep 2026 15:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421063.1647202; Mon, 14 Sep 2026 15:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x68CY-0007mK-9X; Mon, 14 Sep 2026 15:02:34 +0000
Received: by outflank-mailman (input) for mailman id 1421063;
 Mon, 14 Sep 2026 15:02:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x68CX-0007mE-JS
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 15:02:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x68CW-00HCzN-JA
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 17:02:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa80c83-e002-0a2a0a5209dd-0a2a450bcdbc-22
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 17:02:32 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa80c87-b7e8-0a2a450b0019-4a7de14ce8e8-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 17:02:32 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4834977ae75so1180753f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 08:02:31 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.149])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb2ecf2esm27574599f8f.2.2026.09.14.08.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 08:02:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1789398151; x=1790002951; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SiHZaQhv67cyk4hXA/7ZoxNWw/khsJFenYx83nLehNk=;
        b=DK/8zIHDjPP1PGPU2k3KFJUY/v+MNKEuvw7/KI/ZnyEwBDkP1hwLa4s67ggExSWTPK
         7l0p+wdS8GmziAwz6QrDRu76YA1up8zUCIk7l2+Xy7cUBpZ10d+YgL5OnW580NG5FiVi
         UUQH9NALHJWXwZ1L9zTb1hO7X2m74lVkIprdMIG6v2VoO2Sj/iWkMaEqnNDRpncYIrP3
         IJLF1NDjHmW2wfbgNahkP8c+qCQb2RbhL8iMtIYzgu9gDckG+o4X+2jXKJjOdcD7O/Kb
         ALt+30cJdWdNy2CuANixFEynhyf3jg2hEAc/fYCytxd0yt0vGcXVlMyJohal+86EgJ3h
         edcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398151; x=1790002951;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SiHZaQhv67cyk4hXA/7ZoxNWw/khsJFenYx83nLehNk=;
        b=mN9rG5jos8GGs76h+K4ktYbcM62mISL8mk3ndVp1AQOPxWvV86w0KOqTJth4/sQMXG
         6ICKv9/AYsF2UWEZ22S+kjSVJpfSvM51vQpawSqQ9w2IiLdwxz/6Ja+L0NQziBluVg8N
         gkGukzfLkJ888b9PzROzC9ZMauwG38L/XGsrzfZt43M6V1sAqD+OMhQhaDInxzIBtUeb
         SO9UBg+4i2RkRnYL63aJf/AfRyKl3/Ju9qFiM9xLlTO2Aj/3qwoLkNfpEDS4PBT9n+Fw
         w7QjUlYbN1ftw4JTUbWOGAXK7uZNXCtNUGykAP4Q+fnKrNEFTDX7WJyin0dqZSa0QKJG
         T8/A==
X-Forwarded-Encrypted: i=1; AKwUvBzZ5613IErjwy40y6gbDW6LHidoKxY5Nxb3ikpVynUs0EovamNuNgCWEZDkwmkBeat/QiPdLK4Gcdo=@lists.xenproject.org
X-Gm-Message-State: AFuF++lBT5UfN0ZDP70f5tRO5UOoKsTfnU/ZuLaK0RdpnYfNsjIeggEc
	Z+Lmvss1x93gETm8O3P3gCWYPlmsOx57i2bNVR66MHf3g7YqV/XJ9mgIvwN+z35yhg==
X-Gm-Gg: AYBFou2sfmtkArCTgbF70QBnSLYiH6JfNoBE/DJNR9Geq+cQcbEsxuMoxwPqA9g47sT
	6GhwACmBEao0GqG2DXB52BKebbgeq54xvOiVouIru1tDXWS98va9NU3Clzsfa0ypjphLATKmafn
	1on/eE8LCgbGrkkYB2gsn7RP7+Y+LINJZXCpLkgoBeTk03TNON42nN5Cxx1gXxDN2F4vWpRIDH0
	15/Ifu2I8+liq/Iiug6FMJuM9ZePjdIzzaeURL/dJRxr7lZyfusLH2+k9xbZcUKZ9mn3laJNmXH
	Z6rjx33Ij6vVAWacOQiVtnt1odX9Lmayqz3vH+CjSp48w02AjPgBIvaXh+KRvrFt8l+nIfww8Gc
	6T3UeFav8vGChRzHkzyxrBhQVAAE/IfiwvcuPf2E33ltMdxckgzNdxGJAGGOTGFHinJtgoXCZ25
	x0SuYkT63Gz9ae5Wn0gH0tuan/5YQp8FgxdXeMq2NJAztzW9qKN0tek8P4KoZGS4mi6/oXaa4Nh
	HiPyYd3Lr1j
X-Received: by 2002:a05:6000:4b05:b0:485:acdd:1524 with SMTP id ffacd0b85a97d-48702afdde6mr3943134f8f.11.1789398151205;
        Mon, 14 Sep 2026 08:02:31 -0700 (PDT)
Message-ID: <2394a616-16be-4657-be17-0a2dafebaeee@suse.com>
Date: Mon, 14 Sep 2026 17:02:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/39] xen/riscv: remap interrupts to new IMSIC VS-file
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
 <948e94b6610586b84626c98da033d301335dc7b0.1787838835.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <948e94b6610586b84626c98da033d301335dc7b0.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1789398152-1A4DB9EA-6D178448/0/0
X-purgate-type: clean
X-purgate-size: 4044

On 27.08.2026 17:21, Oleksii Kurochko wrote:
> @@ -60,6 +61,12 @@ static unsigned int __ro_after_init guest_num_msis;
>  #define IMSIC_DISABLE_EITHRESHOLD   1
>  #define IMSIC_ENABLE_EITHRESHOLD    0
>  
> +#define imsic_csr_read(c)           \
> +({                                  \
> +    csr_write(CSR_SISELECT, (c));   \

Nit: Excess parentheses again.

> @@ -242,6 +254,15 @@ void imsic_irq_disable(unsigned int irq)
>      spin_unlock(&imsic_cfg.lock);
>  }
>  
> +static bool imsic_local_is_pending(unsigned int id)
> +{
> +    unsigned long isel =
> +        (id / BITS_PER_LONG) * (BITS_PER_LONG / IMSIC_EIPx_BITS) + IMSIC_EIP0;
> +    unsigned long bit = BIT(id % BITS_PER_LONG, UL);

Both can be unsigned int, can't they?

> +    return !!(imsic_csr_read(isel) & bit);
> +}

No need for !! here.

What about endianness, btw? Does the IMSIC always match the CPU (and
its setting)?

Overall, what does "local" in the function name signify? (For a static
function, the "imsic" prefix may also be unnecessary.)

> @@ -497,6 +523,27 @@ static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
>          on_selected_cpus(cpumask_of(cpu), func, data, 1);
>  }
>  
> +/*
> + * Ensure that all the MSIs the APLIC has already generated for the hart this
> + * runs on have really reached the hart's IMSIC.
> + *
> + * The barrier is the one described by the AIA specification in
> + * "Synchronizing interactions between a hart and the APLIC": ask the APLIC to
> + * send an MSI to the hart itself and wait until it shows up as pending in the
> + * hart's own interrupt file. As it says nothing about MSIs on their way to
> + * any other hart, it has to be executed by the pCPU owning the interrupt file
> + * the MSIs were being sent to.
> + */
> +static void cf_check imsic_aplic_sync(void *data)

If the parameter isn't used, maybe best to name it "unused"?

> @@ -848,8 +899,22 @@ void imsic_migrate_vcpu(struct vcpu *v)
>      if ( v->arch.last_cpu == NR_CPUS )
>          return;
>  
> +    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
> +    old_vsfile_id = imsic_state->guest_file_id;
> +    old_vsfile_cpu = imsic_state->vsfile_cpu;
> +    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
> +
> +    /*
> +     * We don't support SW interrupt files at the moment. Bail out before
> +     * anything is touched, as the old file has no owning pCPU in that case
> +     * and there is nothing to retarget the producers away from.
> +     */
> +    if ( old_vsfile_cpu == NR_CPUS )
> +        panic("IMSIC SW-file isn't supported\n");
> +
>      /*
>       * At this point, all interrupt producers are still using the old IMSIC
> +     * VS-file so we first move all interrupt producers to the new IMSIC
>       * VS-file.
>       */

Isn't the new part of the comment premature? Moving doesn't start until ...

> @@ -870,5 +935,43 @@ void imsic_migrate_vcpu(struct vcpu *v)
>      /* Zero-out new IMSIC VS-file */
>      imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_clear, &vsfile_data);
>  
> +    /* Update G-stage mapping for the new IMSIC VS-file */
> +    if ( imsic_map_guest_file(v, new_vsfile_hgei) )
> +    {
> +        domain_crash(v->domain, "Migration to hw interrupt file failed\n");
> +
> +        return;
> +    }
> +
> +    imsic_update_state(v, new_vsfile_hgei);
> +
> +    /*
> +     * TODO: Modify the relevant translation tables at all IOMMUs so that MSIs
> +     *       for this virtual interrupt file are now sent to the new physical
> +     *       interrupt file.
> +     */
> +    if ( iommu_enabled )
> +        printk_once("IMSIC: IOMMU MSI retargeting is not implemented\n");
> +
> +    /*
> +     * If any interrupts at an APLIC are forwarded by MSIs to the old interrupt
> +     * file, reconfigure the APLIC to send them to the new interrupt file.
> +     */
> +    aplic_reconfigure_target(v, old_vsfile_id, old_vsfile_cpu);

... here, as it looks.

Jan

