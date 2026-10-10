Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5316FCA9EBE
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 14:48:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445166.1661579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFYMg-0007bd-Iy; Sat, 10 Oct 2026 14:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445166.1661579; Sat, 10 Oct 2026 14:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFYMg-0007bW-G9; Sat, 10 Oct 2026 14:47:58 +0000
Received: by outflank-mailman (input) for mailman id 1445166;
 Sat, 10 Oct 2026 14:47:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xFYMf-0007bQ-U9
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 14:47:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFYMf-00HDZl-6i
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 16:47:57 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6aca5017-bab6-0a2a0a5309dd-0a2a450b9ab6-2
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 16:47:57 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6aca501d-b7e8-0a2a450b0019-d155dd33f077-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 16:47:57 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48afe75f055so573922f8f.2
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 07:47:57 -0700 (PDT)
Received: from [192.168.0.114] ([91.123.150.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ae17e9sm9563108f8f.57.2026.10.10.07.47.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2026 07:47:54 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791643676; x=1792248476; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9CJCR04M4KEKAlC6TAhPNCSjMy7tExBRGygibQ8+QA=;
        b=C0PB0VpOEmkh3a12iU2hdcArlQz24yxgvMWVATbveNxiiilUik2iHWt+CNMgi5yYRp
         D7Y/KS/r5zZao6bb/j1AhF1up4hPF1wRmBJoDC6090y1W4+El3qDbSNWoF1ayFYEgSmm
         ArbA5NdEMGeuGJd3x9X8ZXy/ZGdoqdBjPMIonS/B7DCt6PKXdfuyiKcw22NASY5Z2L2/
         mwV1I0f/bsKf57y11qDFn9g7K0BfLUfIVoDEBtGHL+iWTstKRwv0kLZ4hqCvg2Isu3qY
         pby17DGW9rC1e78WwPO6yMfRVUiMIPQjiwVi1hkMIC7TIUmgaaXSZMBVJrcliKjlcH5k
         dWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791643676; x=1792248476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9CJCR04M4KEKAlC6TAhPNCSjMy7tExBRGygibQ8+QA=;
        b=u4cfjboJsqlD8ZCo+4Clxt36MiBTHEJrwqIcAJjnE/dOfdVKiM1ZgrGH53ajklanvg
         fLrHYxxLIQcPD7xQ5C9s4RkmYTi6OgqUcxxTdVWMyWfIJhs86/w7Nwserjw4fEx9z5ie
         BO+4A7p9Cgdg/+sLLlJbnOjzGCl2vQ+D720WAftrA15XSVcJspGELpxcYESnPG8DL6Vs
         M0g6059UkDW01FTe+zjs9TYrtvIzp6byjgJQpzX5B2SXkvNv4keANPnJzg79D06akpc0
         I4r/SKCzHVFaDqpDuE4ZBDjUE3f6WoVlGIVm205IONWg2YzlY71Si3cAzl4V/pO9g6xg
         9CRg==
X-Forwarded-Encrypted: i=1; AKwUvBxFQ1WzR7LMry1Ln7rOoMjHKmxn7zU9gu0D6y5Av9QrOiknuhUnYtxqFYvl1CM3RiLmYqCvBiJULik=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLBCf53v8O+una/ARiOuQMSSGppWbFCMqmMda1+hmyJniz2lbn3
	ld571B4zC3uZMxLFlS+ej0dpcvIm1JaksoH1YmZz1Svl3Ejmfyf2HKn8
X-Gm-Gg: AYBFou1KbgJNcPFX1LMwKrfCKwdAHiHYu/Xeud4kMJgV3cQsznGnLNH1FNH8H9V2F3B
	2g6R+uwXchJ9+6ivfLF+MHucqHqM2bWc/WCAWFKCd1vry3M/uF7/UqCzbuC5/pL9ETdFtxHvLk6
	nJGV63rV51AFeAjOX7lWBlFtM5RaZ/HbyaVqqanPROmaCVRcRoCLbDx7WrFHp25gcvBg5hoY0xI
	v473afiwzJEg9cRM4dDC8Y23q6zzYhpLkFt3WkxF8u0yI4oxB0Dw5d3/r55aCqn2zea8MoX4wWj
	/aXhA8exAfPgGhfdpHOHuF730cQI6LhtMfUrAcL5Dw7xfxyWIQ1JpKWYYmo8v7ecN4mezqW07gx
	wRyoyLkBPYtPNYGdcf+rBoNrim8fKTK6zNILA5ANorvFmeBQzUNHRy8lcUN0StMaJIxOpWPIFuy
	1oIK9MDw3RaMcMBmxxbBq+Gba/qbHLmucYS/TWZCdkx+5HMQhPWMAI2Rq5g0xBI4SL8Dko3bdPT
	Y4=
X-Received: by 2002:a05:6000:29c3:b0:488:764c:7a17 with SMTP id ffacd0b85a97d-48dba788922mr6170623f8f.1.1791643676372;
        Sat, 10 Oct 2026 07:47:56 -0700 (PDT)
Message-ID: <84d8b1c8-f716-41bf-82f7-fdfdb6207c04@gmail.com>
Date: Sat, 10 Oct 2026 17:47:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/22] xen/arm: vsmmuv3: Attach Stage-1 configuration
 to SMMUv3 hardware
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
 <4f83a0ee7f46e19c6afec3460a2a7e1bbe8e3c1a.1791328190.git.milan_djokic@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <4f83a0ee7f46e19c6afec3460a2a7e1bbe8e3c1a.1791328190.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1791643677-AA6DA9EA-63932922/0/0
X-purgate-type: clean
X-purgate-size: 11172



On 10/7/26 03:07, Milan Djokic wrote:


Hello Milan

> From: Rahul Singh <rahul.singh@arm.com>
> 
> Attach the Stage-1 configuration to device STE to support nested
> translation for the guests.

My review of this is based on the full series being applied and includes 
the surrounding code context.

> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/arch/arm/include/asm/iommu.h       |   7 ++
>   xen/drivers/passthrough/arm/smmu-v3.c  | 105 +++++++++++++++++++++++++
>   xen/drivers/passthrough/arm/smmu-v3.h  |   1 +
>   xen/drivers/passthrough/arm/vsmmu-v3.c |  18 +++++
>   xen/include/xen/iommu.h                |   6 ++
>   5 files changed, 137 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/iommu.h b/xen/arch/arm/include/asm/iommu.h
> index ad15477e24..56bc9314a7 100644
> --- a/xen/arch/arm/include/asm/iommu.h
> +++ b/xen/arch/arm/include/asm/iommu.h
> @@ -20,6 +20,13 @@ struct arch_iommu
>       void *priv;
>   };
>   
> +struct iommu_guest_config {
> +    paddr_t     s1ctxptr;
> +    uint8_t     config;
> +    uint8_t     s1fmt;
> +    uint8_t     s1cdmax;
> +};
> +
>   const struct iommu_ops *iommu_get_ops(void);
>   void iommu_set_ops(const struct iommu_ops *ops);
>   
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 9d2b8a708b..196ac660ef 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -3003,6 +3003,37 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *dev)
>   	return NULL;
>   }
>   
> +static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
> +				u32 sid)
> +{
> +	int i;
> +	unsigned long flags;
> +	struct iommu_domain *io_domain;
> +	struct arm_smmu_domain *smmu_domain;
> +	struct arm_smmu_master *master;
> +	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> +
> +	/*
> +	 * Loop through the &xen_domain->contexts to locate a context
> +	 * associated with the target SMMU and device SID
> +	 */
> +	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
> +		smmu_domain = to_smmu_domain(io_domain);
> +
> +		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
> +		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
> +			for (i = 0; i < master->num_streams; i++) {
> +				if (sid != master->streams[i].id)
> +					continue;
> +				spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
> +				return io_domain;
> +			}
> +		}
> +		spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
> +	}
> +	return NULL;
> +}
> +
>   static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
>   				struct device *dev)
>   {
> @@ -3216,6 +3247,79 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>   	xfree(xen_domain);
>   }
>   
> +static int arm_smmu_attach_guest_config(struct domain *d, uint32_t sid,
> +		const struct iommu_guest_config *cfg)
> +{
> +	int ret = -EINVAL;
> +	unsigned long flags;
> +	struct arm_smmu_master *master;
> +	struct arm_smmu_domain *smmu_domain;
> +	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> +	struct iommu_domain *io_domain = arm_smmu_get_domain_by_sid(d, sid);
> +
> +	if (!io_domain)
> +		return -ENODEV;
> +
> +	smmu_domain = to_smmu_domain(io_domain);


I might be wrong, but it feels to me that io_domain should be fetched 
after acquiring the lock below since concurrent deassign can free the 
io_domain. arm_smmu_deassign_dev() takes xen_domain->lock, decrements 
io_domain->ref, and if it hits 0, calls arm_smmu_destroy_iommu_domain() 
which frees the memory.

> +
> +	spin_lock(&xen_domain->lock);
> +
> +	switch (cfg->config) {
> +	case ARM_SMMU_DOMAIN_ABORT:
> +		smmu_domain->abort = true;
> +		smmu_domain->stage = cfg->config;
> +		break;
> +	case ARM_SMMU_DOMAIN_BYPASS:
> +		smmu_domain->abort = false;
> +		smmu_domain->stage = cfg->config;

I am not quite sure where the best place is to leave this comment, but 
unless I am missing something, it looks like a guest can trivially 
disable stage-2 translation.

If the guest requests CFG_BYPASS, arm_vsmmu_decode_ste() sets bypassed
and guest_cfg.config becomes ARM_SMMU_DOMAIN_BYPASS. 
arm_smmu_attach_guest_config() then sets that stage. Consequently, 
arm_smmu_write_strtab_ent() finds neither s1_cfg nor s2_cfg and writes 
the physical STE as CFG_BYPASS, which bypasses both stages.

So any device the guest puts in bypass (which Linux might legitimately 
do for identity domains) can read and write any physical memory, 
including Xen’s memory. Even for well-behaved guests, this is 
problematic: the device would use IOVA (which equals IPA) directly as a 
host physical address instead of going through the domain’s P2M.

I think that guest bypass request should map to S2-only physical STE.


> +		break;
> +	case ARM_SMMU_DOMAIN_S1:
> +		/* Check stage-1 support */
> +		if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_TRANS_S1)) {
> +			dev_info(smmu_domain->smmu->dev,
> +					"stage-1 not implemented\n");
> +			goto out;
> +		}
> +
> +		/* If stage-2 is not supported, configure stage-1 only */
> +		if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_TRANS_S2)) {
> +				dev_warn(smmu_domain->smmu->dev,
> +						"SMMU does not implement stage-2 translation support. "
> +						"Fallback to stage-1-only translation configuration\n");
> +			/* Enable Stage-1 translation. */
> +			smmu_domain->stage = ARM_SMMU_DOMAIN_S1;

As I already mentioned for commit #02/22, Without stage-2 there is no 
layer to turn the stage-1 output's IPA into PA. Should we allow this 
fallback only for privileged, direct-mapped domains?

And apologies if this has already been discussed.


> +		}
> +		else {
> +			/* Check nested support */
> +			if (!(smmu_domain->smmu->features & ARM_SMMU_FEAT_NESTING)) {
> +					dev_info(smmu_domain->smmu->dev,
> +							"Nested translation not supported\n");
> +					goto out;

According to commit #07/22 "MMU-600 variant < 2 and all MMU-700" are 
affected. But it seems that Xen still offers SMMU, a guest still sees 
SMMU and might believe it is working. The attach fails with only a log 
line (gdprintk in arm_vsmmu_handle_cmds()) and the guest is never told. 
Device DMA then might land in the wrong guest memory.

Please consider gating this at viommu_get_type() or at domain creation.


> +			}
> +			smmu_domain->stage = ARM_SMMU_DOMAIN_NESTED;
> +		}
> +
> +		/* Enable Stage-1 translation. */
> +		smmu_domain->s1_cfg.s1ctxptr = cfg->s1ctxptr;
> +		smmu_domain->s1_cfg.s1fmt = cfg->s1fmt;
> +		smmu_domain->s1_cfg.s1cdmax = cfg->s1cdmax;
> +		smmu_domain->abort = false;

Since all this stored per smmu_domain, one domain-wide S1 config 
(bypass, abort, context pointer) is applied to all of device’s SIDs 
(from the design doc I got this as intentional for current driver 
implementation) ...


> +		break;
> +	default:
> +		goto out;
> +	}
> +
> +	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
> +	list_for_each_entry(master, &smmu_domain->devices, domain_head)
> +		arm_smmu_install_ste_for_dev(master);

  ... ^^^ loops over all masters and applies the identical config to all 
of them. If, lets say, a device (PCI?) exposes several SIDs, and the 
guest tries to program SID 0 with one mappings and SID 1 with a 
different mappings, the second command will silently overwrite SID 0's 
mappings.

I do not want to ask for extra work, but should Xen at least report an 
error when a guest programs different configs, rather than silently 
overwriting the previous one? Or at least leave a TODO?


> +	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
> +
> +	ret = 0;
> +out:
> +	spin_unlock(&xen_domain->lock);
> +	return ret;
> +}
> +
>   static const struct iommu_ops arm_smmu_iommu_ops = {
>   	.page_sizes		= PAGE_SIZE_4K,
>   	.init			= arm_smmu_iommu_xen_domain_init,
> @@ -3228,6 +3332,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
>   	.unmap_page		= arm_iommu_unmap_page,
>   	.dt_xlate		= arm_smmu_dt_xlate,
>   	.add_device		= arm_smmu_add_device,
> +	.attach_guest_config = arm_smmu_attach_guest_config,
>   };
>   
>   static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
> index ef492098ae..4a912be740 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.h
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -402,6 +402,7 @@ enum arm_smmu_domain_stage {
>   	ARM_SMMU_DOMAIN_S2,
>   	ARM_SMMU_DOMAIN_NESTED,
>   	ARM_SMMU_DOMAIN_BYPASS,
> +	ARM_SMMU_DOMAIN_ABORT,
>   };
>   
>   /* Xen specific code. */
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
> index 25ba734fa7..3f557d1c4d 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -319,8 +319,11 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
>   {
>       int ret;
>       uint64_t ste[STRTAB_STE_DWORDS];
> +    struct domain *d = smmu->d;
> +    struct domain_iommu *hd = dom_iommu(d);
>       struct arm_vsmmu_s1_trans_cfg s1_cfg = {0};
>       uint32_t sid = smmu_cmd_get_sid(cmdptr[0]);
> +    struct iommu_guest_config guest_cfg = {0};
>   
>       ret = arm_vsmmu_find_ste(smmu, sid, ste);
>       if ( ret )
> @@ -330,6 +333,21 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
>       if ( ret )
>           return (ret == -EAGAIN ) ? 0 : ret;
>   
> +    guest_cfg.s1ctxptr = s1_cfg.s1ctxptr;
> +    guest_cfg.s1fmt = s1_cfg.s1fmt;
> +    guest_cfg.s1cdmax = s1_cfg.s1cdmax;
> +
> +    if ( s1_cfg.bypassed )
> +        guest_cfg.config = ARM_SMMU_DOMAIN_BYPASS;
> +    else if ( s1_cfg.aborted )
> +        guest_cfg.config = ARM_SMMU_DOMAIN_ABORT;
> +    else
> +        guest_cfg.config = ARM_SMMU_DOMAIN_S1;
> +
> +    ret = hd->platform_ops->attach_guest_config(d, sid, &guest_cfg);
> +    if ( ret )
> +        return ret;
> +
>       return 0;
>   }
>   
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 37c4a1dc82..253f8bb6cb 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -312,6 +312,7 @@ static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
>   #endif /* HAS_DEVICE_TREE_DISCOVERY */
>   
>   struct page_info;
> +struct iommu_guest_config;
>   
>   /*
>    * Any non-zero value returned from callbacks of this type will cause the
> @@ -387,6 +388,11 @@ struct iommu_ops {
>   #endif
>       /* Inhibit all interrupt generation, to be used at shutdown. */
>       void (*quiesce)(void);
> +
> +#ifdef CONFIG_ARM
> +    int (*attach_guest_config)(struct domain *d, uint32_t sid,
> +                               const struct iommu_guest_config *cfg);
> +#endif
>   };
>   
>   /*


