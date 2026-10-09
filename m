Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36BDCA6019
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 14:15:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444437.1661292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFBNf-0003Oj-1z; Fri, 09 Oct 2026 14:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444437.1661292; Fri, 09 Oct 2026 14:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFBNe-0003Oc-Vd; Fri, 09 Oct 2026 14:15:26 +0000
Received: by outflank-mailman (input) for mailman id 1444437;
 Fri, 09 Oct 2026 14:15:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xFBNd-0003OW-Sn
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 14:15:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFBNd-004mFA-9W
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 16:15:25 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6ac8f6ed-bab6-0a2a0a5309dd-0a2a4509c22e-28
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 16:15:25 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6ac8f6fd-be1a-0a2a45090019-d155dd33a5fd-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 16:15:25 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48870973bddso1195396f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 07:15:25 -0700 (PDT)
Received: from [192.168.0.114] ([91.123.150.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db93d6069sm3878029f8f.0.2026.10.09.07.15.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 07:15:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791555325; x=1792160125; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHPCuC0Z5PfEAw1qPTnZIfiaqv2lLm8bFwsyxAno1Go=;
        b=lj3GC/bANh5hO/RG64ybc++PvoZGW7oKgsTqhRctYyS5QpSnk7CoeFLLi0SZL69M2f
         NciBHlnhdtrjF7AXYcLatku3eh85eA2yn8yWlAcRF8/6XMgYTxug0JKwks6FWwYbIX+S
         0ThrbffEz8MKJanYppiWjiya3gR28D7RkMN5ArmGqIBmwRB9Nm5yLqsaAHH27Rr6rGgk
         NVwfpfmO5/AkzeEsSa+p+2bwxvXL75qr+kGr/nf9pdfa7u8A916M+C2B4StfDS81Rz0K
         irny8iToqo+nCAWILzvgAm24stewM0aGQTwBP7oQyHaoZYrlHSirMp+77OWkuDK+KF8u
         lSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791555325; x=1792160125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHPCuC0Z5PfEAw1qPTnZIfiaqv2lLm8bFwsyxAno1Go=;
        b=cGmBbaa0UQWaueDjM/Dzst2Cp0bN+YR/FdR61kOtgwHrcuIPORkgNxpmpBSIvEw0Ng
         fZlBW4no6ZDT0BVVlP/WzUwUBuVKKjhNKyHTbT8rKi5Zl97UEEd5xuQpdSVHdaQmCq2U
         /BF0Qb+9/e6wcLrbczBZAz5ZdrMWhFRc+2B153fT/hxdw1WdIiKPalD5ZmQ98kSeGu/K
         fiaAjwF5d7Pfub0hyd9fhHjtW59+fx0CpjvFSdF1SVGaB8dwkf8FWgUB5PteIsVod0eU
         epFMqwbNtKOT93+06lb8eKSVTMxAGmGk9Rh+CEfol1smIiufva23Q84UZF5SXvZKPxrw
         DOXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmYQ8l/G9j/qjbQ78F46fVAA9E8+SEcLo5HAcaRoYV8NabABPH+l7c0EKn2Z0geqCi+fbiGmUVA/Y=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIplZiLwZQ15KqUNfjVRO+ontEkZ6poH2+ENs50ub7rWs/tdWlu
	vm2FJku0CBW7jQUXiSGzofz3RA71VXn0NLjy4gnF0qnu33O7JG9UuGLl
X-Gm-Gg: AYBFou0htNbv6ByrE4HC1zQiwOgud/PAZbiVj1+m5BodyvWVX9J2TEh6+oN4W4HQEMx
	2NfUC3R0ZEjmWbMQAUm8gY+adrJXyYEj1mwNFuChs7mIU0NRu4ksCDuqzLECS8YXx8zjpZI9UfW
	AKu+kN9aRAw/UnPHLMgR7BIkP3X4UEmHIr7HxTl83m5Gj8c/UxuQeNmQNoHRV6n9Sku7AE7y7uW
	acSk6qfXBbeoHunD1ZCkOKPxOe3KToBp8Cck1hxnx3v9fuQR9vNRjTCDjslPj5WaQKWGhg9QoCj
	5uCabKYDA2LQudEuS2dp5FuB+H6qMzmzXT8Wku9mpJnUEGISQCnIG6lQojdOGTqlGvTrYRFgVNV
	PHAv/MN1v5+JU3sCyQci3A64qPPBTcwopixLiFCX3L+m2Ce/dUZ4U91WvW+Ij+AzanR2h7wF4aK
	IGZycCykLhhbznzK+ODmfAwa76v6x93DBr/88yKbBO/eVURj2+svB0QKAhqyDTg5bLUl8h0nCjY
	mM=
X-Received: by 2002:a5d:5e88:0:b0:48d:bafc:a3f6 with SMTP id ffacd0b85a97d-48dbafca4a1mr3971395f8f.0.1791555324411;
        Fri, 09 Oct 2026 07:15:24 -0700 (PDT)
Message-ID: <d997e441-5697-4b13-8a49-e07838d83de1@gmail.com>
Date: Fri, 9 Oct 2026 17:15:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/22] xen/arm: vIOMMU vSID->pSID mapping layer
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <a559fb6eca6befc043ab9a7eacf36f470ed01050.1791328190.git.milan_djokic@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <a559fb6eca6befc043ab9a7eacf36f470ed01050.1791328190.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1791555325-BF0DD034-4BB31841/0/0
X-purgate-type: clean
X-purgate-size: 16922



On 10/7/26 03:07, Milan Djokic wrote:

Hello Milan

> Introduce a vIOMMU mapping layer to support passthrough of IOMMU devices
> attached to different physical IOMMUs, including devices with the same
> Stream ID.
> 
> Add a new generic vIOMMU API, viommu_allocate_vsid(), which allocates a
> guest vSID and maps it to the input pSID and the backing physical SMMU.
> 
> Once the mapping is established, the guest uses the vSID for stage-1
> commands, and Xen translates the vSID to the corresponding pSID before
> processing the command on the physical SMMU.
> 
> Implement usage of the new API for dom0less guests. Allocate vSIDs when
> creating the guest device tree and replace the original pSIDs with vSIDs
> that are subsequently used by the guest driver.
> 
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/arch/arm/include/asm/viommu.h       |  12 +++
>   xen/common/device-tree/dom0less-build.c |  33 +++++--
>   xen/drivers/passthrough/arm/smmu-v3.c   |  10 ++-
>   xen/drivers/passthrough/arm/viommu.c    |   9 ++
>   xen/drivers/passthrough/arm/vsmmu-v3.c  | 109 +++++++++++++++++++++++-
>   xen/include/xen/iommu.h                 |   6 +-
>   6 files changed, 165 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
> index 5ae21042f0..3d0eb92655 100644
> --- a/xen/arch/arm/include/asm/viommu.h
> +++ b/xen/arch/arm/include/asm/viommu.h
> @@ -34,6 +34,16 @@ struct viommu_ops {
>        * Called during domain destruction to free resources used by vIOMMU.
>        */
>       int (*relinquish_resources)(struct domain *d);
> +
> +    /*
> +     * Allocate free vSID/vRID for the guest device and establish vID->pID mapping
> +     * Called during domain device assignment.
> +     * Returns 0 on success and sets vsid argument to newly allocated vSID/vRID
> +     * mapped to physical ID (id argument).
> +     * Negative error code returned if allocation fails.
> +     */
> +    int (*allocate_vsid)(struct domain *d, uint32_t id, uint32_t phandle,
> +                         uint32_t *vsid);
>   };
>   
>   struct viommu_desc {
> @@ -54,6 +64,8 @@ extern struct list_head host_iommu_list;
>   int domain_viommu_init(struct domain *d, uint8_t viommu_type);
>   int viommu_relinquish_resources(struct domain *d);
>   uint8_t viommu_get_type(void);
> +int viommu_allocate_vsid(struct domain *d, uint32_t id, uint32_t phandle,
> +                         uint32_t *vsid);
>   void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>                               const struct dt_device_node *node,
>                               const void *iommu);
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 7280bcf72b..673bcbbd1c 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -31,6 +31,8 @@
>   #include <xen/static-memory.h>
>   #include <xen/static-shmem.h>
>   
> +#include <asm/viommu.h>
> +
>   #define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
>   
>   static domid_t __initdata xs_domid = DOMID_INVALID;
> @@ -332,11 +334,12 @@ static int __init handle_prop_pfdt(struct kernel_info *kinfo,
>   }
>   
>   #ifdef CONFIG_ARM_VIRTUAL_IOMMU
> -static void __init modify_pfdt_node(void *pfdt, int nodeoff)
> +static void __init modify_pfdt_node(void *pfdt, int nodeoff, struct domain *d)
>   {
>       int proplen, i, rc;
>       const fdt32_t *prop;
>       fdt32_t *prop_c;
> +    uint32_t psid, phandle, vsid;
>   
>       prop = fdt_getprop(pfdt, nodeoff, "iommus", &proplen);
>       if ( !prop )
> @@ -346,10 +349,23 @@ static void __init modify_pfdt_node(void *pfdt, int nodeoff)
>       if ( !prop_c )
>           return;
>   
> +    /*
> +     * Assign <vIOMMU vSID> pairs to iommus property and establish
> +     * vSID->pSID mappings
> +     */
>       for ( i = 0; i < proplen / 8; ++i )
>       {
> +        phandle = fdt32_to_cpu(prop[i * 2]);
> +        psid = fdt32_to_cpu(prop[i * 2 + 1]);
> +        rc = viommu_allocate_vsid(d, psid, phandle, &vsid);
> +        if ( rc )
> +        {
> +            dprintk(XENLOG_ERR, "(DOMID=%u) Failed to allocate vSID for "
> +                    "pSID: %u, pIOMMU: %u", d->domain_id, psid, phandle);
> +            return;

As I mentioned in prev commit #19/22, in that case the guest DT keeps 
the host phandle and pSID while the domain creates normally since the 
failure is ignored. I think, we need to propagate the error and fail 
domain creation. What do you think?


> +        }
>           prop_c[i * 2] = cpu_to_fdt32(GUEST_PHANDLE_VSMMUV3);
> -        prop_c[i * 2 + 1] = prop[i * 2 + 1];
> +        prop_c[i * 2 + 1] = cpu_to_fdt32(vsid);
>       }
>   
>       rc = fdt_setprop(pfdt, nodeoff, "iommus", prop_c, proplen);
> @@ -362,7 +378,8 @@ static void __init modify_pfdt_node(void *pfdt, int nodeoff)
>       return;
>   }
>   #else
> -    static inline void __init modify_pfdt_node(void *pfdt, int nodeoff)
> +    static inline void __init modify_pfdt_node(void *pfdt, int nodeoff,
> +                                               struct domain *d)
>       {
>           return;
>       }
> @@ -371,7 +388,7 @@ static void __init modify_pfdt_node(void *pfdt, int nodeoff)
>   static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
>                                    int nodeoff,
>                                    uint32_t address_cells, uint32_t size_cells,
> -                                 bool scan_passthrough_prop)
> +                                 bool scan_passthrough_prop, struct domain *d)
>   {
>       int rc = 0;
>       void *fdt = kinfo->fdt;
> @@ -394,9 +411,9 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, void *pfdt,
>       node_next = fdt_first_subnode(pfdt, nodeoff);
>       while ( node_next > 0 )
>       {
> -        modify_pfdt_node(pfdt, node_next);
> +        modify_pfdt_node(pfdt, node_next, d);
>           rc = scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
> -                            scan_passthrough_prop);
> +                            scan_passthrough_prop, d);
>           if ( rc )
>               return rc;
>   
> @@ -483,7 +500,7 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>               res = scan_pfdt_node(kinfo, pfdt, node_next,
>                                    DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>                                    DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
> -                                 false);
> +                                 false, d);
>               if ( res )
>                   goto out;
>               continue;
> @@ -493,7 +510,7 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>               res = scan_pfdt_node(kinfo, pfdt, node_next,
>                                    DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>                                    DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
> -                                 true);
> +                                 true, d);
>               if ( res )
>                   goto out;
>               continue;
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index e44f872d2d..297d2e5e7b 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -3048,7 +3048,7 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *dev)
>   }
>   
>   static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
> -				u32 sid)
> +				u32 sid, const struct arm_smmu_device *smmu)
>   {
>   	int i;
>   	unsigned long flags;
> @@ -3064,6 +3064,9 @@ static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
>   	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
>   		smmu_domain = to_smmu_domain(io_domain);
>   
> +		if (smmu_domain->smmu != smmu)
> +			continue;
> +
>   		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
>   		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
>   			for (i = 0; i < master->num_streams; i++) {
> @@ -3292,14 +3295,15 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>   }
>   
>   static int arm_smmu_attach_guest_config(struct domain *d, uint32_t sid,
> -		const struct iommu_guest_config *cfg)
> +				const struct iommu_guest_config *cfg,
> +				const struct arm_smmu_device *smmu)
>   {
>   	int ret = -EINVAL;
>   	unsigned long flags;
>   	struct arm_smmu_master *master;
>   	struct arm_smmu_domain *smmu_domain;
>   	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> -	struct iommu_domain *io_domain = arm_smmu_get_domain_by_sid(d, sid);
> +	struct iommu_domain *io_domain = arm_smmu_get_domain_by_sid(d, sid, smmu);
>   
>   	if (!io_domain)
>   		return -ENODEV;
> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
> index 407e68e62d..6c97acb049 100644
> --- a/xen/drivers/passthrough/arm/viommu.c
> +++ b/xen/drivers/passthrough/arm/viommu.c
> @@ -75,6 +75,15 @@ int viommu_relinquish_resources(struct domain *d)
>       return cur_viommu->ops->relinquish_resources(d);
>   }
>   
> +int viommu_allocate_vsid(struct domain *d, uint32_t id, uint32_t phandle,
> +                         uint32_t *vsid)
> +{
> +    if ( !cur_viommu )
> +        return -ENODEV;
> +
> +    return cur_viommu->ops->allocate_vsid(d, id, phandle, vsid);
> +}
> +
>   uint8_t viommu_get_type(void)
>   {
>       if ( !cur_viommu || host_iommu_list_incomplete ||
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
> index b71511c2eb..53fd7f2d63 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -85,6 +85,8 @@
>   #define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK, \
>                                       FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, x))
>   
> +#define MAX_VSID   (1 << SMMU_IDR1_SIDSIZE)
> +
>   /* event queue entry */
>   struct arm_smmu_evtq_ent {
>       /* Common fields */
> @@ -132,6 +134,14 @@ struct arm_vsmmu_queue {
>       uint8_t     max_n_shift;
>   };
>   
> +/* vSID->pSID mapping entry */
> +struct vsid_entry {
> +    bool        valid;
> +    uint32_t    vsid;
> +    uint32_t    psid;
> +    struct arm_smmu_device *smmu;
> +};
> +
>   struct virt_smmu {
>       struct      domain *d;
>       struct      list_head viommu_list;
> @@ -156,6 +166,7 @@ struct virt_smmu {
>       spinlock_t  cr2_lock;
>       spinlock_t  strtab_cfg_lock;
>       spinlock_t  irq_cfg_lock;
> +    struct vsid_entry *vsids;
>   };
>   
>   /* Helper functions */
> @@ -545,6 +556,49 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
>       struct arm_vsmmu_s1_trans_cfg s1_cfg = {0};
>       uint32_t sid = smmu_cmd_get_sid(cmdptr[0]);
>       struct iommu_guest_config guest_cfg = {0};
> +    struct arm_smmu_device *phys_smmu = NULL;
> +    struct host_iommu *host_iommu;
> +    uint32_t psid;
> +    struct arm_smmu_evtq_ent ent = {
> +        .opcode = EVT_ID_BAD_STREAMID,
> +        .sid = sid,
> +        .c_bad_ste_streamid = {
> +            .ssid = 0,
> +            .ssv = false,
> +        },
> +    };
> +
> +    /* vIOMMU->pIOMMU identity mapped for HW domain */
> +    if ( is_hardware_domain(d) )
> +    {
> +        psid = sid;
> +        list_for_each_entry(host_iommu, &host_iommu_list, entry)
> +        {
> +            if ( host_iommu->addr == smmu->addr )
> +            {
> +                phys_smmu = (struct arm_smmu_device *) host_iommu->iommu;
> +                break;
> +            }
> +        }
> +    }
> +    else {
> +        /* vSID out of range or not mapped to pSID */
> +        if ( sid >= MAX_VSID || !smmu->vsids[sid].valid )
> +        {
> +            arm_vsmmu_send_event(smmu, &ent);
> +            return -EINVAL;
> +        }
> +
> +        psid = smmu->vsids[sid].psid;
> +        phys_smmu = smmu->vsids[sid].smmu;
> +    }
> +
> +    /* vSID mapped to invalid physical SMMU */
> +    if (!phys_smmu)
> +    {
> +        arm_vsmmu_send_event(smmu, &ent);
> +        return -EINVAL;
> +    }
>   
>       ret = arm_vsmmu_find_ste(smmu, sid, ste);
>       if ( ret )
> @@ -565,7 +619,7 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
>       else
>           guest_cfg.config = ARM_SMMU_DOMAIN_S1;
>   
> -    ret = hd->platform_ops->attach_guest_config(d, sid, &guest_cfg);
> +    ret = hd->platform_ops->attach_guest_config(d, psid, &guest_cfg, phys_smmu);
>       if ( ret )
>           return ret;
>   
> @@ -1164,6 +1218,9 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
>       smmu->addr = addr;
>       smmu->cmdq.ent_size = CMDQ_ENT_DWORDS * DWORDS_BYTES;
>       smmu->evtq.ent_size = EVTQ_ENT_DWORDS * DWORDS_BYTES;
> +    smmu->vsids = xzalloc_array(struct vsid_entry, MAX_VSID);

^^^ is 65536 × 24 bytes = 1.5 MiB per vSMMU allocated contiguously even 
if, lets say, the domain has two devices?

And the hwdom allocates vsids[MAX_VSID] per pSMMU even though the hwdom 
never uses it (vIOMMU->pIOMMU identity mapped for HW domain) if I got 
the code right.


> +    if ( !smmu->vsids )
> +        return -ENOMEM;

Leaks smmu when the vsids allocation fails.

and failure of vgic_reserve_virq() (non-visible in the context) leaks vsids.

>   
>       spin_lock_init(&smmu->cmd_queue_lock);
>       spin_lock_init(&smmu->evt_queue_lock);
> @@ -1254,8 +1311,9 @@ static int vsmmuv3_relinquish_resources(struct domain *d)
>       if ( list_head_is_null(&d->arch.viommu_list) )
>           return 0;
>   
> -    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list )
> +    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list)
>       {
> +        xfree(pos->vsids);
>           list_del(&pos->viommu_list);
>           xfree(pos);
>       }
> @@ -1263,8 +1321,55 @@ static int vsmmuv3_relinquish_resources(struct domain *d)
>       return 0;
>   }
>   
> +int vsmmuv3_allocate_vsid(struct domain *d, uint32_t id, uint32_t phandle,
> +                          uint32_t *vsid)
> +{
> +    uint32_t i = 0;
> +    struct virt_smmu *smmu;
> +    struct host_iommu *host_iommu;
> +    struct arm_smmu_device *phys_smmu = NULL;
> +
> +    if ( list_head_is_null(&d->arch.viommu_list) )
> +        return -ENODEV;
> +
> +    smmu = list_first_entry(&d->arch.viommu_list, struct virt_smmu, viommu_list);
> +
> +    /*
> +     * Find the physical SMMU corresponding to the device-tree phandle.
> +     */
> +    list_for_each_entry(host_iommu, &host_iommu_list, entry)
> +    {
> +        if ( host_iommu->dt_node->phandle == phandle )
> +        {
> +            phys_smmu = (struct arm_smmu_device *) host_iommu->iommu;
> +            break;
> +        }
> +    }
> +
> +    if ( !phys_smmu )
> +        return -ENODEV;
> +
> +    /* Get first free vSID index */
> +    while ( i < MAX_VSID && smmu->vsids[i].valid )
> +        i++;
> +
> +    /* Max number of vSIDs already allocated? */
> +    if ( i == MAX_VSID )
> +        return -ENOMEM;
> +
> +    /* Establish vSID->pSID mapping */
> +    smmu->vsids[i].valid = true;
> +    smmu->vsids[i].vsid = i;
> +    smmu->vsids[i].psid = id;
> +    smmu->vsids[i].smmu = phys_smmu;
> +    *vsid = smmu->vsids[i].vsid;
> +
> +    return 0;
> +}
> +
>   static const struct viommu_ops vsmmuv3_ops = {
>       .domain_init = domain_vsmmuv3_init,
> +    .allocate_vsid = vsmmuv3_allocate_vsid,
>       .relinquish_resources = vsmmuv3_relinquish_resources,
>   };
>   
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 253f8bb6cb..c94ee4f08e 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -312,7 +312,10 @@ static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>   #endif /* HAS_DEVICE_TREE_DISCOVERY */
>   
>   struct page_info;
> +#ifdef CONFIG_ARM
>   struct iommu_guest_config;
> +struct arm_smmu_device;
> +#endif
>   
>   /*
>    * Any non-zero value returned from callbacks of this type will cause the
> @@ -391,7 +394,8 @@ struct iommu_ops {
>   
>   #ifdef CONFIG_ARM
>       int (*attach_guest_config)(struct domain *d, uint32_t sid,
> -                               const struct iommu_guest_config *cfg);
> +                               const struct iommu_guest_config *cfg,
> +                               const struct arm_smmu_device *smmu);
>   #endif
>   };
>   


