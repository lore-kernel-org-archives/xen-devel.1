Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9326CA9EC7
	for <xen-devel@archiver.kernel.org>; Sun, 11 Oct 2026 14:07:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445598.1661651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFuCO-0004CX-G3; Sun, 11 Oct 2026 14:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445598.1661651; Sun, 11 Oct 2026 14:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFuCO-0004CQ-DE; Sun, 11 Oct 2026 14:06:48 +0000
Received: by outflank-mailman (input) for mailman id 1445598;
 Sun, 11 Oct 2026 14:06:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xFuCN-0004CK-A8
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2026 14:06:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFuCK-009C9C-1p
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2026 16:06:44 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6acb97cb-e002-0a2a0a5209dd-0a2a4508bdb2-40
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 16:06:44 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6acb97f3-f659-0a2a45080019-d1558031f1fd-3
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 16:06:43 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso13644225e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 07:06:43 -0700 (PDT)
Received: from [192.168.0.114] ([91.123.150.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e4225f4sm276043415e9.0.2026.10.11.07.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Oct 2026 07:06:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791727603; x=1792332403; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNP0IY6tQpS+QuFI40+y6YIPkQ3x50tKOZJ+SbSc1zI=;
        b=VJGqWsrFL8lCXA4hOpQ9CGlqJ95axnsx8Cxr6L+6Qj0jn9/QyeNF5VLaZa6RelUl57
         BdFmr9Q+dLDcaxQtIaWMlnP2p1ke4UVbdTF0hu2+s4YzdgoFvdp0rgB3ld4xY6JgzUOP
         x6T+hDCqP4ERjOxo4Ge/i+9pFRGW5uEVVgBIC5dpXdVo7mLeDJbCL25EcZ+nYXXUw05S
         jvPoxnQP2yq5fhcxnDOd0mtNSzpfk3rb64MaJRp4foSag+rVdmjz9cVdnPWPD5VFiMZT
         xyKfoBij1gAO1Oi35aAgkLT2J/dbVqE0pspgCe50tD5/mn0ex7Ty4YYrHTKYHbZvl7jp
         Ba0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791727603; x=1792332403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oNP0IY6tQpS+QuFI40+y6YIPkQ3x50tKOZJ+SbSc1zI=;
        b=BQgJvNe4UvbE1smG3LCuC4R8gDSJZ0wscLg4GCSNOAfhaXIk5pWVfuooLo785snTp4
         OHRrOOkPZ/w5rA6rrXhaxdAN200rmbAkRMb2zeoASC/HuH7j0IDsi7COvrfxNW8BrqeX
         5DU4l3nvV0SCAeGrIdtKrqiRT81+QXzbnro5uclwHPpTpDDlQ//e1YnBc/IJvGq8iFbF
         jj43aEW+3u0fv8kaaFxZKtFPX1YAOYdoIZ6nNczsryP7qlaFm2ZHCa4OD2fRaGWQ8sYL
         Oijrnf6pOfU8ltc8OnDb8z4viHKEtAzo9lx27RPbhybyddVwg4lfLtctrRNqv73cgQIB
         M7lA==
X-Forwarded-Encrypted: i=1; AKwUvByU+tKlq9/mHABwR0jXYpKoFhyi7gBf9uxSiMtJP0b7XvWWubMbM7NH2swe2wBQUa2hxGmnnW/Ts7Q=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKVAuKA8abE0TmuIUNMRUvfJYAqxUb02hDbo+U6IM4/g3TgOuQt
	4sTFzlM2UxQ/1BsAqxOcOqpa3WapYG2MVOA/4hrTfZXDrlxSrfu+ILIe
X-Gm-Gg: AYBFou2UWhQNXRE5B7V9T29EOHNSs+7elEUsikNoPGOmvJ7UZJoV3L7Jbk9yA+fSj+t
	NZoyv7qR63yOUtBj+WWfOd29QzWKOvdwxh+FqJhiGwhOxOJdUjMz/VnPZ+tX05pUab+Y9AemBIx
	LyJ1G3cW74V4tvf/h6YaOrBeD1phtKkwb3APncKZpQiclRJzFc9CGUFwbv1/iCrAEWZ4aFzCoDw
	N02ASIYFs68vl7v7L+/6YD9ve/tpGqsrIY5Y9ZKDttIGTxoqZ2FdEfzRLlGktfPYV4rtu9tkLx5
	Vl6lmw0u8GNBvoAZ0Z1UoQadpCnq1e3UBJPxvYTRlmheLChPYKFbJFoHuAe12SGsFKNOj0VbGy6
	wRcKZlBUmwX3C/gpeHX3Sg9a4fxRJwJEZT8QkpB/Hvlffwxt6egPJo1AaUxls4MbQBmVnVgLzHf
	5MN+SVihaIyeI9AvA9NaDKfjpNnkPIfVpi8bY5UusHe97d1ltGiyp7i2YR/o6b3B1WzDRG+0L5P
	f8=
X-Received: by 2002:a05:600c:34cd:b0:4a1:7163:3e41 with SMTP id 5b1f17b1804b1-4a18e49885emr122869345e9.9.1791727603214;
        Sun, 11 Oct 2026 07:06:43 -0700 (PDT)
Message-ID: <a2cd2c05-00fe-4b50-a4fa-e316677cd31e@gmail.com>
Date: Sun, 11 Oct 2026 17:06:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/22] xen/arm: vsmmuv3: Add dummy support for virtual
 SMMUv3 for guests
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <2094abe1b6faba477e771390bf47921f80e7e0e7.1791328190.git.milan_djokic@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <2094abe1b6faba477e771390bf47921f80e7e0e7.1791328190.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1791727603-DFCD387B-4311AC05/0/0
X-purgate-type: clean
X-purgate-size: 16438



On 10/7/26 03:06, Milan Djokic wrote:

Hello Milan

> From: Rahul Singh <rahul.singh@arm.com>
> 
> domain_viommu_init() will be called during domain creation and will add
> the dummy trap handler for virtual IOMMUs for guests.
> 
> A host IOMMU list will be created when host IOMMU devices are probed
> and this list will be used to create the IOMMU device tree node for
> dom0. For dom0, 1-1 mapping will be established between vIOMMU in dom0
> and physical IOMMU.
> 
> For domUs, the 1-N mapping will be established between domU and physical
> IOMMUs. A new area has been reserved in the arm guest physical map at
> which the emulated vIOMMU node is created in the device tree.
> 
> Also set the vIOMMU type to vSMMUv3 to enable vIOMMU framework to call
> vSMMUv3 domain creation/destroy functions.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/arch/arm/domain.c                  |   6 +-
>   xen/arch/arm/include/asm/domain.h      |   5 ++
>   xen/arch/arm/include/asm/viommu.h      |  36 ++++++++
>   xen/drivers/passthrough/Kconfig        |   8 ++
>   xen/drivers/passthrough/arm/Makefile   |   1 +
>   xen/drivers/passthrough/arm/smmu-v3.c  |   7 ++
>   xen/drivers/passthrough/arm/viommu.c   |  83 ++++++++++++++++-
>   xen/drivers/passthrough/arm/vsmmu-v3.c | 118 +++++++++++++++++++++++++
>   xen/drivers/passthrough/arm/vsmmu-v3.h |  20 +++++
>   xen/include/public/arch-arm.h          |   5 ++
>   10 files changed, 287 insertions(+), 2 deletions(-)
>   create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.c
>   create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.h
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 5c411a2310..003a8d45b9 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -672,7 +672,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>           return -EINVAL;
>       }
>   
> -    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> +    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE &&
> +         config->arch.viommu_type != viommu_get_type() )
>       {
>           dprintk(XENLOG_INFO,
>                   "vIOMMU type requested not supported by the platform or Xen\n");
> @@ -728,6 +729,9 @@ int arch_domain_create(struct domain *d,
>   
>       count += domain_vpci_get_num_mmio_handlers(d);
>   
> +    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> +        count += domain_viommu_get_num_mmio_handlers(d);
> +
>       if ( (rc = domain_io_init(d, count + MAX_IO_HANDLER)) != 0 )
>           goto fail;
>   
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index c3d2c4981f..70af0bf8b7 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -102,6 +102,11 @@ struct arch_domain
>   #ifdef CONFIG_MPU
>       uint8_t v8r_el1_msa;
>   #endif
> +
> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
> +    struct list_head viommu_list;     /* List of virtual IOMMUs */
> +#endif
> +
>   }  __cacheline_aligned;
>   
>   struct arch_vcpu
> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
> index 95f82d9cf5..287595068b 100644
> --- a/xen/arch/arm/include/asm/viommu.h
> +++ b/xen/arch/arm/include/asm/viommu.h
> @@ -3,9 +3,23 @@
>   #define __ARCH_ARM_VIOMMU_H__
>   
>   #include <xen/lib.h>
> +#include <xen/list.h>
>   #include <xen/types.h>
>   #include <public/xen.h>
>   
> +/* data structure for each hardware IOMMU */
> +struct host_iommu {
> +    struct list_head entry;
> +    /* IOMMU DT node used to establish virtual to physical IOMMU/SID mapping */
> +    const struct dt_device_node *dt_node;
> +    /* Used for dom0 vIOMMU instantiation (1-1 MMIO regions mappings) */
> +    paddr_t addr;
> +    /* Used for dom0 vIOMMU instantiation (1-1 MMIO regions mappings) */
> +    paddr_t size;
> +    /* Used for dom0 EVTQ and GERROR interrupts (1-1 IRQ mapping) */
> +    uint32_t irq;
> +};
> +
>   struct viommu_ops {
>       /*
>        * Called during domain construction if toolstack requests to enable
> @@ -32,9 +46,15 @@ struct viommu_desc {
>   
>   #ifdef CONFIG_ARM_VIRTUAL_IOMMU
>   
> +extern struct list_head host_iommu_list;
> +
>   int domain_viommu_init(struct domain *d, uint8_t viommu_type);
>   int viommu_relinquish_resources(struct domain *d);
>   uint8_t viommu_get_type(void);
> +void add_to_host_iommu_list(paddr_t addr, paddr_t size,
> +                            const struct dt_device_node *node);
> +void set_cur_viommu(const struct viommu_desc *desc);
> +unsigned int domain_viommu_get_num_mmio_handlers(struct domain *d);
>   
>   #else
>   
> @@ -56,6 +76,22 @@ static inline int viommu_relinquish_resources(struct domain *d)
>       return 0;
>   }
>   
> +static inline void __init add_to_host_iommu_list(paddr_t addr, paddr_t size,
> +                                          const struct dt_device_node *node)
> +{
> +    return;
> +}
> +
> +static inline unsigned int domain_viommu_get_num_mmio_handlers(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +static inline void __init set_cur_viommu(const struct viommu_desc *desc)
> +{
> +    return;
> +}
> +
>   #endif /* CONFIG_ARM_VIRTUAL_IOMMU */
>   
>   #endif /* __ARCH_ARM_VIOMMU_H__ */
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index a92cfbea98..40d072822f 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -40,6 +40,14 @@ config ARM_VIRTUAL_IOMMU
>   	help
>   	  Support virtual IOMMU infrastructure to implement vIOMMU.
>   
> +config VIRTUAL_ARM_SMMU_V3
> +	bool "ARM Ltd. Virtual SMMUv3 Support (UNSUPPORTED)"
> +	depends on ARM_SMMU_V3 && ARM_VIRTUAL_IOMMU
> +	help
> +	 Support for implementations of the virtual ARM System MMU architecture
> +	 version 3. Virtual SMMUv3 is unsupported feature and should not be used
> +	 in production.
> +
>   endif
>   
>   config AMD_IOMMU
> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough/arm/Makefile
> index c3783188e3..c8f0a5f802 100644
> --- a/xen/drivers/passthrough/arm/Makefile
> +++ b/xen/drivers/passthrough/arm/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_ARM_SMMU) += smmu.o
>   obj-$(CONFIG_IPMMU_VMSA) += ipmmu-vmsa.o
>   obj-$(CONFIG_ARM_SMMU_V3) += smmu-v3.o
>   obj-$(CONFIG_ARM_VIRTUAL_IOMMU) += viommu.o
> +obj-$(CONFIG_VIRTUAL_ARM_SMMU_V3) += vsmmu-v3.o
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index bd0689664b..21b82eba85 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -93,6 +93,7 @@
>   #include <asm/platform.h>
>   
>   #include "smmu-v3.h"
> +#include "vsmmu-v3.h"
>   
>   #define ARM_SMMU_VTCR_SH_IS		3
>   #define ARM_SMMU_VTCR_RGN_WBWA		1
> @@ -2829,6 +2830,9 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
>   	list_add(&smmu->devices, &arm_smmu_devices);
>   	spin_unlock(&arm_smmu_devices_lock);
>   
> +	/* Add to host IOMMU list to initialize vIOMMU for dom0 */
> +	add_to_host_iommu_list(ioaddr, iosize, dev_to_dt(pdev));
> +
>   	return 0;
>   
>   
> @@ -3181,6 +3185,9 @@ static __init int arm_smmu_dt_init(struct dt_device_node *dev,
>   
>   	platform_features &= smmu->features;
>   
> +	/* Set vIOMMU type to SMMUv3 */
> +	vsmmuv3_set_type();
> +
>   	return 0;
>   }
>   
> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
> index 0c0efd668e..3401e4f7d9 100644
> --- a/xen/drivers/passthrough/arm/viommu.c
> +++ b/xen/drivers/passthrough/arm/viommu.c
> @@ -2,12 +2,54 @@
>   
>   #include <xen/errno.h>
>   #include <xen/init.h>
> +#include <xen/irq.h>
>   #include <xen/types.h>
> +#include <xen/sched.h>
>   
>   #include <asm/viommu.h>
>   
> +/* List of all host IOMMUs */
> +LIST_HEAD(host_iommu_list);
> +
>   /* Struct to hold the vIOMMU ops and vIOMMU type */
>   static const struct viommu_desc __ro_after_init *cur_viommu;
> +static bool host_iommu_list_incomplete;
> +
> +/* Common function for adding to host_iommu_list */
> +void __init add_to_host_iommu_list(paddr_t addr, paddr_t size,
> +                            const struct dt_device_node *node)
> +{
> +    struct host_iommu *iommu_data;
> +    int irq;
> +
> +    iommu_data = xzalloc(struct host_iommu);
> +    if ( !iommu_data )
> +    {
> +        host_iommu_list_incomplete = true;
> +        printk(XENLOG_WARNING
> +               "vIOMMU: Cannot allocate memory for host IOMMU data\n");
> +        return;
> +    }
> +
> +    iommu_data->addr = addr;
> +    iommu_data->size = size;
> +    iommu_data->dt_node = node;
> +    irq = platform_get_irq(node, 0);
> +    if ( irq < 0 )
> +    {
> +        host_iommu_list_incomplete = true;
> +        printk(XENLOG_WARNING
> +               "vIOMMU: disabling support because IOMMU @0x%"PRIx64
> +               " has no usable IRQ (%d)\n", addr, irq);
> +        xfree(iommu_data);
> +        return;
> +    }
> +    iommu_data->irq = irq;
> +
> +    printk("vIOMMU: Found IOMMU @0x%"PRIx64"\n", addr);
> +
> +    list_add_tail(&iommu_data->entry, &host_iommu_list);
> +}
>   
>   int domain_viommu_init(struct domain *d, uint8_t viommu_type)
>   {
> @@ -33,12 +75,51 @@ int viommu_relinquish_resources(struct domain *d)
>   
>   uint8_t viommu_get_type(void)
>   {
> -    if ( !cur_viommu )
> +    if ( !cur_viommu || host_iommu_list_incomplete ||
> +         list_empty(&host_iommu_list) )
>           return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
>   
>       return cur_viommu->viommu_type;
>   }
>   
> +void __init set_cur_viommu(const struct viommu_desc *desc)
> +{
> +    if ( cur_viommu && (cur_viommu != desc) )
> +    {
> +        printk("WARNING: Cannot set vIOMMU, already set to a different value\n");
> +        return;
> +    }
> +
> +    cur_viommu = desc;
> +}
> +
> +unsigned int domain_viommu_get_num_mmio_handlers(struct domain *d)
> +{
> +    if ( is_hardware_domain(d) )
> +    {
> +        struct host_iommu *hw_iommu;
> +        int count = 0;
> +
> +        /*
> +        * For hardware domain, vIOMMU per pIOMMU is exposed. Number of
> +        * regions required for the configuration space is equal to number of
> +        * host IOMMUs.
> +        */
> +        list_for_each_entry(hw_iommu, &host_iommu_list, entry)
> +        {
> +            count++;
> +        }
> +
> +        return count;
> +    }
> +
> +    /*
> +     * For unpriviliged domains, single vIOMMU is exposed and requires one
> +     * region to cover the configuration space.
> +     */
> +    return 1;
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
> new file mode 100644
> index 0000000000..ea3b5bb34d
> --- /dev/null
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -0,0 +1,118 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +
> +#include <xen/param.h>
> +#include <xen/sched.h>
> +#include <asm/mmio.h>
> +#include <asm/viommu.h>
> +
> +struct virt_smmu {
> +    struct      domain *d;
> +    struct      list_head viommu_list;
> +};
> +
> +static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
> +                              register_t r, void *priv)
> +{
> +    BUG_ON("unimplemented");
> +    return IO_HANDLED;
> +}
> +
> +static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
> +                             register_t *r, void *priv)
> +{
> +    BUG_ON("unimplemented");
> +    return IO_HANDLED;
> +}
> +
> +static const struct mmio_handler_ops vsmmuv3_mmio_handler = {
> +    .read  = vsmmuv3_mmio_read,
> +    .write = vsmmuv3_mmio_write,
> +};
> +
> +static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
> +{
> +    struct virt_smmu *smmu;
> +
> +    smmu = xzalloc(struct virt_smmu);
> +    if ( !smmu )
> +        return -ENOMEM;
> +
> +    smmu->d = d;
> +
> +    register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
> +
> +    /* Register the vIOMMU to be able to clean it up later. */
> +    list_add_tail(&smmu->viommu_list, &d->arch.viommu_list);
> +
> +    return 0;
> +}
> +
> +static int domain_vsmmuv3_init(struct domain *d)
> +{
> +    int ret;
> +
> +    INIT_LIST_HEAD(&d->arch.viommu_list);
> +
> +    if ( is_hardware_domain(d) )


Looking over other device emulations in Xen (vpl011, vgic, etc.), I see 
that the host (hardware) MMIO range is also exposed to direct-mapped 
domains, as there might be a non-hwdom 1:1 domain. Xen even has a 
specific macro for that: domain_use_host_layout. Here, however, the 
guest MMIO range will be exposed to a regular direct-mapped domain. Is 
there a specific reason for that (is this intentional)?


> +    {
> +        struct host_iommu *hw_iommu;
> +
> +        list_for_each_entry(hw_iommu, &host_iommu_list, entry)
> +        {
> +            ret = vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size);
> +            if ( ret )
> +                return ret;
> +        }
> +    }
> +    else
> +    {
> +        ret = vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE);
> +        if ( ret )
> +            return ret;
> +    }
> +
> +    return 0;
> +}
> +
> +static int vsmmuv3_relinquish_resources(struct domain *d)
> +{
> +    struct virt_smmu *pos, *temp;
> +
> +    /* Cope with uninitialized vIOMMU */
> +    if ( list_head_is_null(&d->arch.viommu_list) )
> +        return 0;
> +
> +    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list )
> +    {
> +        list_del(&pos->viommu_list);
> +        xfree(pos);
> +    }
> +
> +    return 0;
> +}
> +
> +static const struct viommu_ops vsmmuv3_ops = {
> +    .domain_init = domain_vsmmuv3_init,
> +    .relinquish_resources = vsmmuv3_relinquish_resources,
> +};
> +
> +static const struct viommu_desc vsmmuv3_desc = {
> +    .ops = &vsmmuv3_ops,
> +    .viommu_type = XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3,
> +};
> +
> +void __init vsmmuv3_set_type(void)
> +{
> +    const struct viommu_desc *desc = &vsmmuv3_desc;
> +
> +    set_cur_viommu(desc);
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.h b/xen/drivers/passthrough/arm/vsmmu-v3.h
> new file mode 100644
> index 0000000000..9f4c86abd5
> --- /dev/null
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +#ifndef __ARCH_ARM_VSMMU_V3_H__
> +#define __ARCH_ARM_VSMMU_V3_H__
> +
> +#include <asm/viommu.h>
> +
> +#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
> +
> +void vsmmuv3_set_type(void);
> +
> +#else
> +
> +static inline void __init vsmmuv3_set_type(void)
> +{
> +    return;
> +}
> +
> +#endif /* CONFIG_VIRTUAL_ARM_SMMU_V3 */
> +
> +#endif /* __ARCH_ARM_VSMMU_V3_H__ */
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index a1491f9cf7..8863e2e457 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -335,6 +335,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>   #define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA    2
>   
>   #define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
> +#define XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3 1
>   
>   struct xen_arch_domainconfig {
>       /* IN/OUT */
> @@ -463,6 +464,10 @@ typedef uint64_t xen_callback_t;
>   #define GUEST_GICV3_GICR0_BASE     xen_mk_ullong(0x03020000) /* vCPU0..127 */
>   #define GUEST_GICV3_GICR0_SIZE     xen_mk_ullong(0x01000000)
>   
> +/* vsmmuv3 MMIO mappings */
> +#define GUEST_VSMMUV3_BASE     xen_mk_ullong(0x04040000)
> +#define GUEST_VSMMUV3_SIZE     xen_mk_ullong(0x00020000)
> +
>   /*
>    * 256 MB is reserved for VPCI configuration space based on calculation
>    * 256 buses x 32 devices x 8 functions x 4 KB = 256 MB


