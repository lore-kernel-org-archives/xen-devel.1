Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E70606A329
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 19:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NVXWVGuW
Received: from list by lists.xenproject.org with outflank-mailman.1470579.1679292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOKKB-0003iF-7l; Tue, 03 Nov 2026 19:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470579.1679292; Tue, 03 Nov 2026 19:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOKKB-0003i8-3W; Tue, 03 Nov 2026 19:37:39 +0000
Received: by outflank-mailman (input) for mailman id 1470579;
 Tue, 03 Nov 2026 19:37:37 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <robin.murphy@arm.com>) id 1xOKK9-0003hr-Bc
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 19:37:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOKK8-009fiY-OH
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 20:37:36 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <robin.murphy@arm.com>)
 id 6aea37ec-2eae-0a2a0a5409dd-0a2a4504dbde-20
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 20:37:36 +0100
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <robin.murphy@arm.com>)
 id 6aea37fe-b57f-0a2a45040019-d98c6eacb5aa-1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 20:37:35 +0100
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1E7E41595;
 Tue,  3 Nov 2026 11:37:31 -0800 (PST)
Received: from [10.57.17.5] (unknown [10.57.17.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC6CA3F673;
 Tue,  3 Nov 2026 11:37:32 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="Date:Subject:To:Cc:References:From:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793734654; bh=Rm8y5tIfxnWYPvt+78NGMbrQ7Xjp1++7s/xeLIgNX20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NVXWVGuW8y/VQO6Nl3FjzkUDEY3dr4YIzLnyURdSWlMUBR9Malf6oUwvl3YXJU8Zp
	 /8ybIJzPjeHB5BpkAgiFNUYuzhVHstSsXmrM8okvzFNt1McylpO6sBbtqJ+pBVeM5c
	 RthGexOKnqVtxBujM4QmlOqB7eJKov6qEZU8MLLM=
Message-ID: <3660110a-8add-486d-9a79-c057757550e6@arm.com>
Date: Tue, 3 Nov 2026 19:37:30 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/22] xen/arm: smmuv3: Extend HW features detection
 and apply errata
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Will Deacon <will@kernel.org>
References: <cover.1793726692.git.milan_djokic@epam.com>
 <6a25a02d52ad58d406200ebbe9aa17ca0e997104.1793726692.git.milan_djokic@epam.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <6a25a02d52ad58d406200ebbe9aa17ca0e997104.1793726692.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1793734656-C2CCFB50-0D526A09/0/0
X-purgate-type: clean
X-purgate-size: 16615
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-03 5:30 pm, Milan Djokic wrote:
> Backport Linux commits 4bbd63eb685b and fd86b5944215, adapted to the
> Xen SMMUv3 implementation, applying errata workarounds to prevent
> nesting on MMU-600 and MMU-700 products.

Note that there were subsequent releases of MMU-700 which fixed the 
offending errata and so don't need a workaround:

https://lore.kernel.org/linux-iommu/4c4664b2427cef212a06efdd78a9faa8d9ded302.1773933699.git.robin.murphy@arm.com/

Also note that if you do actually implement S1 vSMMU support for nested 
translation already, disabling it is a bit drastic. The real workaround 
is to take care with the appropriate invalidation sequences - those 
Linux patches were basically just a reminder to come back and take a 
better look once all the parts of our vIOMMU support do eventually fall 
into place.

Thanks,
Robin.

> 
> Detect IOMMU hardware features and store them in the IOMMU host list
> for each probed SMMUv3 device, allowing the emulated IOMMU to advertise
> features supported by the physical IOMMU.
> 
> Linux commits:
> 
>    4bbd63eb685b ("iommu/arm-smmu-v3: Work around MMU-600 erratum 1076982")
>    fd86b5944215 ("iommu/arm-smmu-v3: Add explicit feature for nesting")
> 
> Link: https://lore.kernel.org/all/08adbe3d01024d8382a478325f73b56851f76e49.1683731256.git.robin.murphy@arm.com/
> Link: https://lore.kernel.org/all/136c3f4a3a84cc14a5a1978ace57dfd3ed67b688.1683731256.git.robin.murphy@arm.com/
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4bbd63eb685b
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git fd86b5944215
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/arch/arm/include/asm/viommu.h      |  8 ++-
>   xen/drivers/passthrough/arm/smmu-v3.c  | 81 +++++++++++++++++++++++--
>   xen/drivers/passthrough/arm/smmu-v3.h  | 32 ++++++++--
>   xen/drivers/passthrough/arm/viommu.c   |  4 +-
>   xen/drivers/passthrough/arm/vsmmu-v3.c | 83 ++++++++++++++++++++++++--
>   5 files changed, 191 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
> index 287595068b..844cf34d56 100644
> --- a/xen/arch/arm/include/asm/viommu.h
> +++ b/xen/arch/arm/include/asm/viommu.h
> @@ -12,6 +12,8 @@ struct host_iommu {
>       struct list_head entry;
>       /* IOMMU DT node used to establish virtual to physical IOMMU/SID mapping */
>       const struct dt_device_node *dt_node;
> +    /* Physical IOMMU device structure used to detect supported features */
> +    const void *iommu;
>       /* Used for dom0 vIOMMU instantiation (1-1 MMIO regions mappings) */
>       paddr_t addr;
>       /* Used for dom0 vIOMMU instantiation (1-1 MMIO regions mappings) */
> @@ -52,7 +54,8 @@ int domain_viommu_init(struct domain *d, uint8_t viommu_type);
>   int viommu_relinquish_resources(struct domain *d);
>   uint8_t viommu_get_type(void);
>   void add_to_host_iommu_list(paddr_t addr, paddr_t size,
> -                            const struct dt_device_node *node);
> +                            const struct dt_device_node *node,
> +                            const void *iommu);
>   void set_cur_viommu(const struct viommu_desc *desc);
>   unsigned int domain_viommu_get_num_mmio_handlers(struct domain *d);
>   
> @@ -77,7 +80,8 @@ static inline int viommu_relinquish_resources(struct domain *d)
>   }
>   
>   static inline void __init add_to_host_iommu_list(paddr_t addr, paddr_t size,
> -                                          const struct dt_device_node *node)
> +                                          const struct dt_device_node *node,
> +                                          const void *iommu)
>   {
>       return;
>   }
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index b85ad730db..d2dfb06cae 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2509,6 +2509,37 @@ err_free_irqs:
>   	return ret;
>   }
>   
> +static void arm_smmu_device_iidr_probe(struct arm_smmu_device *smmu)
> +{
> +	u32 reg;
> +	unsigned int implementer, productid, variant, revision;
> +
> +	reg = readl_relaxed(smmu->base + ARM_SMMU_IIDR);
> +	implementer = FIELD_GET(IIDR_IMPLEMENTER, reg);
> +	productid = FIELD_GET(IIDR_PRODUCTID, reg);
> +	variant = FIELD_GET(IIDR_VARIANT, reg);
> +	revision = FIELD_GET(IIDR_REVISION, reg);
> +
> +	switch (implementer) {
> +	case IIDR_IMPLEMENTER_ARM:
> +		switch (productid) {
> +		case IIDR_PRODUCTID_ARM_MMU_600:
> +			/* Arm erratum 1076982 */
> +			if (variant == 0 && revision <= 2)
> +				smmu->features &= ~ARM_SMMU_FEAT_SEV;
> +			/* Arm erratum 1209401 */
> +			if (variant < 2)
> +				smmu->features &= ~ARM_SMMU_FEAT_NESTING;
> +			break;
> +		case IIDR_PRODUCTID_ARM_MMU_700:
> +			/* Arm errata 2268618, 2812531 */
> +			smmu->features &= ~ARM_SMMU_FEAT_NESTING;
> +			break;
> +		}
> +		break;
> +	}
> +}
> +
>   static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   {
>   	u32 reg;
> @@ -2597,8 +2628,10 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   	switch (FIELD_GET(IDR0_TTF, reg)) {
>   	case IDR0_TTF_AARCH32_64:
>   		smmu->ias = 40;
> +		smmu->features |= ARM_SMMU_FEAT_TTF_AARCH32_64;
>   		fallthrough;
>   	case IDR0_TTF_AARCH64:
> +		smmu->features |= ARM_SMMU_FEAT_TTF_AARCH64;
>   		break;
>   	default:
>   		dev_err(smmu->dev, "AArch64 table format not supported!\n");
> @@ -2607,6 +2640,8 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   
>   	/* ASID/VMID sizes */
>   	smmu->vmid_bits = reg & IDR0_VMID16 ? 16 : 8;
> +	if (reg & IDR0_ASID16)
> +		smmu->features |= ARM_SMMU_FEAT_ASID_16;
>   
>   	/* IDR1 */
>   	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR1);
> @@ -2646,12 +2681,18 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   	smmu->evtq.max_stalls = FIELD_GET(IDR5_STALL_MAX, reg);
>   
>   	/* Page sizes */
> -	if (reg & IDR5_GRAN64K)
> +	if (reg & IDR5_GRAN64K) {
>   		smmu->pgsize_bitmap |= SZ_64K | SZ_512M;
> -	if (reg & IDR5_GRAN16K)
> +		smmu->features |= ARM_SMMU_FEAT_GRAN64K;
> +	}
> +	if (reg & IDR5_GRAN16K) {
>   		smmu->pgsize_bitmap |= SZ_16K | SZ_32M;
> -	if (reg & IDR5_GRAN4K)
> +		smmu->features |= ARM_SMMU_FEAT_GRAN16K;
> +	}
> +	if (reg & IDR5_GRAN4K) {
>   		smmu->pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
> +		smmu->features |= ARM_SMMU_FEAT_GRAN4K;
> +	}
>   
>   	/* Input address size */
>   	if (FIELD_GET(IDR5_VAX, reg) == IDR5_VAX_52_BIT)
> @@ -2684,15 +2725,46 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   		fallthrough;
>   	case IDR5_OAS_48_BIT:
>   		smmu->oas = 48;
> +		smmu->features |= ARM_SMMU_FEAT_OAS_48_BIT;
>   		break;
>   	}
>   
>   	smmu->oas = min_t(unsigned long, PADDR_BITS, smmu->oas);
>   	smmu->ias = max(smmu->ias, smmu->oas);
>   
> +	switch (smmu->oas) {
> +	case 32:
> +		smmu->features |= ARM_SMMU_FEAT_OAS_32_BIT;
> +		break;
> +	case 36:
> +		smmu->features |= ARM_SMMU_FEAT_OAS_36_BIT;
> +		break;
> +	case 40:
> +		smmu->features |= ARM_SMMU_FEAT_OAS_40_BIT;
> +		break;
> +	case 42:
> +		smmu->features |= ARM_SMMU_FEAT_OAS_42_BIT;
> +		break;
> +	case 44:
> +		smmu->features |= ARM_SMMU_FEAT_OAS_44_BIT;
> +		break;
> +	case 48:
> +		smmu->features |= ARM_SMMU_FEAT_OAS_48_BIT;
> +		break;
> +	case 52:
> +		smmu->features |= ARM_SMMU_FEAT_OAS_52_BIT;
> +		break;
> +	}
> +
>   	/* Xen: Set maximum Stage-2 input size supported by the SMMU. */
>   	p2m_restrict_ipa_bits(smmu->ias);
>   
> +	if ((smmu->features & ARM_SMMU_FEAT_TRANS_S1) &&
> +		(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
> +		smmu->features |= ARM_SMMU_FEAT_NESTING;
> +
> +	arm_smmu_device_iidr_probe(smmu);
> +
>   	dev_info(smmu->dev, "ias %lu-bit, oas %lu-bit (features 0x%08x)\n",
>   		 smmu->ias, smmu->oas, smmu->features);
>   	return 0;
> @@ -2887,9 +2959,8 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
>   	spin_lock(&arm_smmu_devices_lock);
>   	list_add(&smmu->devices, &arm_smmu_devices);
>   	spin_unlock(&arm_smmu_devices_lock);
> -
>   	/* Add to host IOMMU list to initialize vIOMMU for dom0 */
> -	add_to_host_iommu_list(ioaddr, iosize, dev_to_dt(pdev));
> +	add_to_host_iommu_list(ioaddr, iosize, dev_to_dt(pdev), (void *) smmu);
>   
>   	return 0;
>   
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
> index f302c69d02..4a912be740 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.h
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -60,6 +60,16 @@
>   #define IDR5_VAX			GENMASK(11, 10)
>   #define IDR5_VAX_52_BIT			1
>   
> +#define ARM_SMMU_IIDR			0x18
> +#define IIDR_PRODUCTID			GENMASK(31, 20)
> +#define IIDR_VARIANT			GENMASK(19, 16)
> +#define IIDR_REVISION			GENMASK(15, 12)
> +#define IIDR_IMPLEMENTER		GENMASK(11, 0)
> +
> +#define IIDR_IMPLEMENTER_ARM		0x43b
> +#define IIDR_PRODUCTID_ARM_MMU_600	0x483
> +#define IIDR_PRODUCTID_ARM_MMU_700	0x487
> +
>   #define ARM_SMMU_CR0			0x20
>   #define CR0_ATSCHK			(1 << 4)
>   #define CR0_CMDQEN			(1 << 3)
> @@ -603,10 +613,24 @@ struct arm_smmu_device {
>   #define ARM_SMMU_FEAT_COHERENCY		(1 << 8)
>   #define ARM_SMMU_FEAT_TRANS_S1		(1 << 9)
>   #define ARM_SMMU_FEAT_TRANS_S2		(1 << 10)
> -#define ARM_SMMU_FEAT_STALLS		(1 << 11)
> -#define ARM_SMMU_FEAT_HYP		(1 << 12)
> -#define ARM_SMMU_FEAT_STALL_FORCE	(1 << 13)
> -#define ARM_SMMU_FEAT_VAX		(1 << 14)
> +#define ARM_SMMU_FEAT_NESTING	    (1 << 11)
> +#define ARM_SMMU_FEAT_STALLS		(1 << 12)
> +#define ARM_SMMU_FEAT_HYP		(1 << 13)
> +#define ARM_SMMU_FEAT_STALL_FORCE	(1 << 14)
> +#define ARM_SMMU_FEAT_VAX		(1 << 15)
> +#define ARM_SMMU_FEAT_ASID_16		(1 << 16)
> +#define ARM_SMMU_FEAT_TTF_AARCH64		(1 << 17)
> +#define ARM_SMMU_FEAT_TTF_AARCH32_64	(1 << 18)
> +#define ARM_SMMU_FEAT_GRAN64K	(1 << 19)
> +#define ARM_SMMU_FEAT_GRAN16K	(1 << 20)
> +#define ARM_SMMU_FEAT_GRAN4K	(1 << 21)
> +#define ARM_SMMU_FEAT_OAS_32_BIT	(1 << 22)
> +#define ARM_SMMU_FEAT_OAS_36_BIT	(1 << 23)
> +#define ARM_SMMU_FEAT_OAS_40_BIT	(1 << 24)
> +#define ARM_SMMU_FEAT_OAS_42_BIT	(1 << 25)
> +#define ARM_SMMU_FEAT_OAS_44_BIT	(1 << 26)
> +#define ARM_SMMU_FEAT_OAS_48_BIT	(1 << 27)
> +#define ARM_SMMU_FEAT_OAS_52_BIT	(1 << 28)
>   	u32				features;
>   
>   #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
> index 2b16f11017..b4b91ab1cb 100644
> --- a/xen/drivers/passthrough/arm/viommu.c
> +++ b/xen/drivers/passthrough/arm/viommu.c
> @@ -18,7 +18,8 @@ static bool host_iommu_list_incomplete;
>   
>   /* Common function for adding to host_iommu_list */
>   void __init add_to_host_iommu_list(paddr_t addr, paddr_t size,
> -                            const struct dt_device_node *node)
> +                            const struct dt_device_node *node,
> +                            const void *iommu)
>   {
>       struct host_iommu *iommu_data;
>       int irq;
> @@ -46,6 +47,7 @@ void __init add_to_host_iommu_list(paddr_t addr, paddr_t size,
>           return;
>       }
>       iommu_data->irq = irq;
> +    iommu_data->iommu = iommu;
>   
>       printk("vIOMMU: Found IOMMU @0x%"PRIx64"\n", addr);
>   
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
> index 7540c6fc54..e3ef68d193 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -6,9 +6,13 @@
>   #include <asm/mmio.h>
>   #include <asm/viommu.h>
>   
> +#include "smmu-v3.h"
> +#include "vsmmu-v3.h"
> +
>   struct virt_smmu {
>       struct      domain *d;
>       struct      list_head viommu_list;
> +    uint32_t    features;
>   };
>   
>   static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
> @@ -30,7 +34,8 @@ static const struct mmio_handler_ops vsmmuv3_mmio_handler = {
>       .write = vsmmuv3_mmio_write,
>   };
>   
> -static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
> +static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size,
> +                               uint32_t features)
>   {
>       struct virt_smmu *smmu;
>   
> @@ -39,6 +44,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
>           return -ENOMEM;
>   
>       smmu->d = d;
> +    smmu->features = features;
>   
>       register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
>   
> @@ -51,23 +57,90 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
>   static int domain_vsmmuv3_init(struct domain *d)
>   {
>       int ret;
> +    struct host_iommu *hw_iommu;
> +    const struct arm_smmu_device *smmu;
> +
> +    if ( list_head_is_null(&host_iommu_list) )
> +        return -ENODEV;
> +
> +    /*
> +    * Check physical IOMMUs for Stage-1 and nesting support.
> +    * vIOMMU exposure is rejected if Stage-1 is not supported or
> +    * if both Stage-1 and Stage-2 are supported but nesting is
> +    * disabled, e.g. due to hardware errata.
> +    */
> +    list_for_each_entry(hw_iommu, &host_iommu_list, entry)
> +    {
> +        smmu = (const struct arm_smmu_device *)hw_iommu->iommu;
> +
> +        if ( !(smmu->features & ARM_SMMU_FEAT_TRANS_S1) )
> +        {
> +            printk(XENLOG_G_ERR
> +                "vSMMUv3: Stage-1 translation not supported by HW IOMMU\n");
> +            return -EINVAL;
> +        }
> +
> +        if ( (smmu->features & ARM_SMMU_FEAT_TRANS_S2) &&
> +             !(smmu->features & ARM_SMMU_FEAT_NESTING) )
> +        {
> +            printk(XENLOG_G_ERR
> +                "vSMMUv3: Nesting not supported by HW IOMMU\n");
> +            return -EINVAL;
> +        }
> +    }
>   
>       INIT_LIST_HEAD(&d->arch.viommu_list);
>   
>       if ( domain_use_host_layout(d) )
>       {
> -        struct host_iommu *hw_iommu;
> -
>           list_for_each_entry(hw_iommu, &host_iommu_list, entry)
>           {
> -            ret = vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size);
> +            smmu = (const struct arm_smmu_device *) hw_iommu->iommu;
> +            ret = vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size,
> +                                      smmu->features);
>               if ( ret )
>                   return ret;
>           }
>       }
>       else
>       {
> -        ret = vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE);
> +        /*
> +         * Require: For non-hardware domains, features must be uniform across
> +         * physical SMMUs to avoid advertising features that are unsupported by
> +         * certain units.
> +         */
> +        uint32_t features;
> +        hw_iommu = list_first_entry(&host_iommu_list, struct host_iommu, entry);
> +        smmu = (const struct arm_smmu_device *) hw_iommu->iommu;
> +        features = smmu->features;
> +        list_for_each_entry(hw_iommu, &host_iommu_list, entry)
> +        {
> +            smmu = (const struct arm_smmu_device *) hw_iommu->iommu;
> +
> +            if ( smmu->features != features )
> +            {
> +                printk(XENLOG_G_ERR
> +                       "vSMMUv3: Unsupported HW layout: physical SMMUs must " \
> +                       "have a uniform set of features\n");
> +                return -EINVAL;
> +            }
> +        }
> +
> +        /*
> +         * Reject vIOMMU exposure to non-hardware
> +         * domains if the physical SMMU does not support stage-2
> +         * (stage-1-only mode is supported for direct-mapped domains only)
> +         */
> +        if ( !(features & ARM_SMMU_FEAT_TRANS_S2) )
> +        {
> +            printk(XENLOG_G_ERR
> +                   "vSMMUv3: Physical SMMU must support stage-2 translation "
> +                   "for non-hardware domains.\n");
> +            return -EINVAL;
> +        }
> +
> +        ret = vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE,
> +                                  features);
>           if ( ret )
>               return ret;
>       }


