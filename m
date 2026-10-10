Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30808CA9EBE
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 15:30:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445201.1661598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFZ1e-0007bV-Ul; Sat, 10 Oct 2026 15:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445201.1661598; Sat, 10 Oct 2026 15:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFZ1e-0007bO-RS; Sat, 10 Oct 2026 15:30:18 +0000
Received: by outflank-mailman (input) for mailman id 1445201;
 Sat, 10 Oct 2026 15:30:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xFZ1d-0007bI-Cy
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 15:30:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFZ1c-00HHMl-QD
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 17:30:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6aca59be-e002-0a2a0a5209dd-0a2a45099080-26
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 17:30:16 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6aca5a08-be1a-0a2a45090019-d155802ed178-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 17:30:16 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a1923f15afso1988725e9.3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 08:30:16 -0700 (PDT)
Received: from [192.168.0.114] ([91.123.150.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e481993sm114124975e9.2.2026.10.10.08.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2026 08:30:15 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791646216; x=1792251016; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdsCltFn/cNp2RN68Rx6lk8r6oZbvRWdm6uZaoASPZ4=;
        b=VcMY5bpzaJqfdYSUD4HsUJAofXx9vgzizgUvQAeweMkVHhyPhuX8jFij5P+3F2ag0p
         V/cvCGsyR5SkHySKIujMbc6xSg2VQEdHAtig7vuValyVTxGOhnsLWxX02NfZui+SW5wd
         QqXOzkIS+HfK4D+lB090bIrCsAfhlzDJYmc2ZDUEgKyosfLwzGcaWzq0B98r9fC1HEhg
         /I4kPTb7acPtW1Fg8Dz3bGlWLqht/3Vh4iCFlvDh57ze4f/lY/37jAZ0wgFfb+/e86ii
         WoJ25beejIPwNtbO4rHsOEULNViujn5yUWPu7VkzDjAp1HvgzJOr2MV+uHoept9X0w6A
         h7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791646216; x=1792251016;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdsCltFn/cNp2RN68Rx6lk8r6oZbvRWdm6uZaoASPZ4=;
        b=Htsq7KYXfIIkDkamIIzQz7r7zczJgigrw/ZOOQmdMZOKBoL5RumXmMtcFeQDK2fXAN
         w4vQ+LsQpOX//mT6hg0FA3Bjka8jI6RRi04558Z3Ug4ovV3xkur++yqRR0bPAnXZIYSE
         QxkJo513PSacODhrxMGt6XdxtPFajwt+ouBVak9+SWa5nqggYCZd8cMvYDB3tRGKoLP/
         QxPwxc6/icwkWO1S+JIRK4Hl992Qz3kcJabJeTJMvdVJft2BHCGJFEQV9AWsunwFx4x8
         4iuxuhVEl//czDG3OW+canMZUPfOkDim7B7/ihAQk0jZqt/9X22kjX+GFt6p7ViNw1U4
         LsqA==
X-Forwarded-Encrypted: i=1; AKwUvBwaL++IuvRJxl8pQFv37tRQT4pQJjpMO9Ua1z+DJPSO3QTDBK1RVi0b6CTfDGgZ030LdTdYN4pyjsw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKTtjlTr9QYYkzPbeAEoOOhXnue7MU4bJb/uyKtgRPWRYXAKGr/
	541cjLisnNN3iZlvQiOrl+fyrj0KQ5fta6o50ar3SNxRadPm4zqC4Ux1
X-Gm-Gg: AYBFou1deO29MEDi2IipL7uvvBE/3zdhEuOAQ8gnSyPGVqjJNJStvvLKDdZ3MOCK94f
	03h56EOuDlg4wdSB80Y2CmRlJKEiEtAnjSUx/nlRMoEDorPLCodxJ/vaoKxRvhhJ0dNTXf/s0+1
	9tHZf/i9RNqkJ2XunDfC6Vz+g3i24llsz7YBtgfAiQIO4CQ66rHWcL/22A22vAwzdopWqH6OYls
	Shbexj+zT/jQJcLpRnKrGRg7+QlgsOi62ixihOCvNTqV/nzkoonPom4PiU/6wgiLka8vzWqDekd
	bUarHRa82QWIHWKRz2D0Z6lUy5Byd3CFK9OpGxUP/6nebxDoRslEeiGmnlmD3s+pkTqkw8bltki
	4rOQCIcW1nDmbY/T96QoyW96zXE3GPYZKydFJYptkMUmCHemS4N1dyI1Zbl9bHlGzDCBUzicZOE
	MK1g53MVpQz10pk0k90dyHZktVllsttNqIy+a1N19aSXeyqI9aAt5gQbVHCHSXLWeGr4O+fTDy9
	TY=
X-Received: by 2002:a05:600c:354a:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4a18e3ef23cmr88925775e9.0.1791646215886;
        Sat, 10 Oct 2026 08:30:15 -0700 (PDT)
Message-ID: <b92b4b48-f4b3-452b-a973-d98744adfb2d@gmail.com>
Date: Sat, 10 Oct 2026 18:30:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/22] xen/arm: vsmmuv3: IOMMU device tree node for
 dom0
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <c38b1a9476f54e42050e4712a98b19bf1d97f3a0.1791328190.git.milan_djokic@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <c38b1a9476f54e42050e4712a98b19bf1d97f3a0.1791328190.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1791646216-3AEDE034-C78D83DD/0/0
X-purgate-type: clean
X-purgate-size: 5618



On 10/7/26 03:07, Milan Djokic wrote:

Hello Milan

> From: Rahul Singh <rahul.singh@arm.com>
> 
> XEN will create an IOMMU device tree node in the device tree
> to enable the dom0 to discover the virtual SMMUv3 during dom0 boot.
> IOMMU device tree node will only be created when viommu is enabled
> via Kconfig build options.
> 
> "iommus" property will be added for dom0 devices to virtual
> IOMMU node to enable the dom0 linux kernel to configure the IOMMU.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/arch/arm/domain_build.c       | 102 +++++++++++++++++++++++++++++-
>   xen/arch/arm/include/asm/viommu.h |   1 +
>   2 files changed, 101 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index cd2e09f005..6513140133 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -557,9 +557,12 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>               continue;
>           }
>   
> -        if ( iommu_node )
> +        /*
> +         * Expose IOMMU specific properties to hwdom when vIOMMU is
> +         * enabled.
> +         */
> +        if ( iommu_node && viommu_get_type() == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>           {
> -            /* Don't expose IOMMU specific properties to hwdom */
>               if ( dt_property_name_is_equal(prop, "iommus") )
>                   continue;
>   
> @@ -1457,6 +1460,95 @@ int __init make_timer_node(const struct kernel_info *kinfo)
>       return res;
>   }
>   
> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
> +static int __init make_hwdom_viommu_node(const struct kernel_info *kinfo)
> +{
> +    uint32_t len;
> +    int res;
> +    char buf[24];
> +    void *fdt = kinfo->fdt;
> +    const void *prop = NULL;
> +    const struct dt_device_node *iommu = NULL;
> +    struct host_iommu *iommu_data;
> +    gic_interrupt_t intr;
> +
> +    if ( list_empty(&host_iommu_list) )
> +        return 0;
> +
> +    list_for_each_entry( iommu_data, &host_iommu_list, entry )
> +    {
> +        if ( iommu_data->hwdom_node_created )
> +            return 0;
> +
> +        iommu = iommu_data->dt_node;
> +
> +        snprintf(buf, sizeof(buf), "iommu@%"PRIx64, iommu_data->addr);
> +
> +        res = fdt_begin_node(fdt, buf);
> +        if ( res )
> +            return res;
> +
> +        prop = dt_get_property(iommu, "compatible", &len);
> +        if ( !prop )
> +        {
> +            res = -FDT_ERR_XEN(ENOENT);
> +            return res;
> +        }
> +
> +        res = fdt_property(fdt, "compatible", prop, len);
> +        if ( res )
> +            return res;
> +
> +        if ( iommu->phandle )
> +        {
> +            res = fdt_property_cell(fdt, "phandle", iommu->phandle);
> +            if ( res )
> +                return res;
> +        }
> +
> +        /* Use the same reg regions as the IOMMU node in host DTB. */
> +        prop = dt_get_property(iommu, "reg", &len);
> +        if ( !prop )
> +        {
> +            printk(XENLOG_ERR "vIOMMU: Can't find IOMMU reg property.\n");
> +            res = -FDT_ERR_XEN(ENOENT);
> +            return res;
> +        }
> +
> +        res = fdt_property(fdt, "reg", prop, len);
> +        if ( res )
> +            return res;
> +
> +        prop = dt_get_property(iommu, "#iommu-cells", &len);
> +        if ( !prop )
> +        {
> +            res = -FDT_ERR_XEN(ENOENT);
> +            return res;
> +        }
> +
> +        res = fdt_property(fdt, "#iommu-cells", prop, len);
> +        if ( res )
> +            return res;
> +
> +        res = fdt_property_string(fdt, "interrupt-names", "combined");
> +        if ( res )
> +            return res;
> +
> +        set_interrupt(intr, iommu_data->irq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
> +
> +        res = fdt_property_interrupts(kinfo, &intr, 1);
> +        if ( res )
> +            return res;
> +
> +        iommu_data->hwdom_node_created = true;
> +
> +        fdt_end_node(fdt);
> +    }
> +
> +    return res;
> +}
> +#endif
> +
>   static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>                                 struct dt_device_node *node,
>                                 p2m_type_t p2mt)
> @@ -1525,6 +1617,12 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>       if ( dt_match_node(timer_matches, node) )
>           return make_timer_node(kinfo);
>   
> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
> +    if ( device_get_class(node) == DEVICE_IOMMU &&
> +         viommu_get_type() != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> +        return make_hwdom_viommu_node(kinfo);

So all vIOMMU nodes are created at the position of the first pIOMMU 
node, right? If so, could it be possible in real life for IOMMUs to sit 
under different buses (under different parent nodes)?


> +#endif
> +
>       /* Skip nodes used by Xen */
>       if ( dt_device_used_by(node) == DOMID_XEN )
>       {
> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
> index 844cf34d56..5ae21042f0 100644
> --- a/xen/arch/arm/include/asm/viommu.h
> +++ b/xen/arch/arm/include/asm/viommu.h
> @@ -20,6 +20,7 @@ struct host_iommu {
>       paddr_t size;
>       /* Used for dom0 EVTQ and GERROR interrupts (1-1 IRQ mapping) */
>       uint32_t irq;
> +    bool hwdom_node_created;
>   };
>   
>   struct viommu_ops {


