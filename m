Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D03CA601D
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 15:12:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444484.1661319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFCGs-0004WE-D7; Fri, 09 Oct 2026 15:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444484.1661319; Fri, 09 Oct 2026 15:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFCGs-0004W7-83; Fri, 09 Oct 2026 15:12:30 +0000
Received: by outflank-mailman (input) for mailman id 1444484;
 Fri, 09 Oct 2026 15:12:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xFCGr-0004W1-0b
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 15:12:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFCGq-00GOwQ-Dq
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 17:12:28 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6ac9044c-8faa-0a2a0a5109dd-0a2a4504b49e-16
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 17:12:28 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6ac9045c-b57f-0a2a45040019-d155dd36a94b-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 17:12:28 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48b0d19cf7eso1446777f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 08:12:28 -0700 (PDT)
Received: from [192.168.0.114] ([91.123.150.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db98c3a13sm4260445f8f.25.2026.10.09.08.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 08:12:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791558747; x=1792163547; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mXUTk109MUNiV3CHwbLxgh4TujqsBi7GZrDNElkSRj8=;
        b=jX3N9KUIVCC9mMij0d+IiKMgR9QZOVEac7EeDh75+k+C4KI8udSEiEexqzfUY+yG49
         wOHUDhV0xxCqdUc442w2JjAZ2xuVIXxSb0sepuaVHcOip5xHKEpN7FfHUuz/byQg5+Oy
         XFanGJcgdH7IQhl5b45rSmcIdjAnL6zTd8Dwy3WBlpxYfZb5QixNVkvp7d1socxjLVQS
         ffmrjYk+Nw+RAh8i7YQ6Y7B55whIFGBqTL+LPW8M+mS0r5+bSODfJAvvxbmDKY54z3Z8
         jTcl42pJ2SRyjoSJR9cQpMJaXwy6TqHzrqANAkr3EYcikMDepfBpARXr4dKMCScfQjGZ
         TGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558747; x=1792163547;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXUTk109MUNiV3CHwbLxgh4TujqsBi7GZrDNElkSRj8=;
        b=hd7IOsP1Uir8+7kg9RAXLSZcvEPuIZRC7jhEss0Yp/K9T9JrSwvp18aj7h2cNcR6ol
         eUewB5ZBztwtM/dweCiwx0yPIfifvtJwUJnc7kfE0Fr6OBx1e6kkvxRSSsSTKxfBluPx
         tUOXMp4mt2egydD38/RjkVn4mQGdkWxoykUj61OCJYdi8NMUAkOtDlZGSaDFSHhicAFq
         5BZzSKZ2OIthIX3oeOmH9oMuvS0DXVMRcNr/pB2gzKFh48L4ru0ZuXt8tbiwvn5KN6p/
         HmvwBxRCtgJmd8RWW2qvLI4cbR0fE8+Ro0rBEunwhTvJtArd6a0UvGGKnIELjUrVq+3o
         Bvog==
X-Forwarded-Encrypted: i=1; AKwUvBzcjC6JH8DZARAaKrCmk5EnrA9ZHBBkhGnLLwef6xQpf1pPeRx5FfzHDAa48aAwpyqAznCVQA0mH+0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL/AczXMB6kGhsO6zyMr9tsSnrnA1WOSP4l+cNw4xj/VUbLWYQf
	oW4Th7Oi2RgI94ybtQol+GZFvShJHA+Lg+wAb7Jj8dcbVEy/HXKHWiJv
X-Gm-Gg: AYBFou3iU4657pvrqqGcUJp3viGNniua0ZEKffXr3E1iWqku0Jg7b4tyGnoZ6cVtuOh
	TiQo4+ekOtSovIEaDeZDQP5FqUntHX40wPdSTcvKsQm1piWQHNR5AaI6O4SGuDbD23YV3gRpNLz
	OpaUdBct/t4rg+oRahyVFMwTxKKb5DWDUhZgTNdf1J4jHVau9p+Ix6kvzSpFGLkRW8EC7grLQBB
	xiQ+fZ6GCiF5bPq9njySvGcXnnog+JCL9qKI/GwjtCIOTQq7YTLMOdD/TSdY6z5BvDleprSd440
	0T9J0m+7UuI2xZ2+nK4dVKKYuiQqj8U8yivL2+S95T0nO/JV5ho9AAzycqnTzklBBcAaPXPLvZy
	vdAZsAO3xT8sUyaWcID/eOvpBfDxrkwd4i8TK1W/XAU/b57cfoFwM/tVDbqdqVGR86ooChO9PuS
	MKbJFD+ShXiXyhL3Dlp9crcJ1EpgJ3NUHlguR5DICGeYU3bQ1JANKqxF//wh8dSx3Rpt0sUauAx
	8U=
X-Received: by 2002:a05:6000:2dc5:b0:48a:f4d4:e1f3 with SMTP id ffacd0b85a97d-48dbaaecd68mr3640264f8f.13.1791558745058;
        Fri, 09 Oct 2026 08:12:25 -0700 (PDT)
Message-ID: <7b1f3938-2d07-4884-a377-ce7d9b66fdb9@gmail.com>
Date: Fri, 9 Oct 2026 18:12:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/22] xen/arm: vsmmuv3: Add support to send stage-1
 event to guest
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <94ab2741c9c61f2b66d9c5a207f913f4241c42a4.1791328190.git.milan_djokic@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <94ab2741c9c61f2b66d9c5a207f913f4241c42a4.1791328190.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1791558748-51AD0B50-1BD0A6AA/0/0
X-purgate-type: clean
X-purgate-size: 6197



On 10/7/26 03:07, Milan Djokic wrote:

Hello Milan

> From: Rahul Singh <rahul.singh@arm.com>
> 
> Stage-1 translation is handled by guest, therefore stage-1 fault has to
> be forwarded to guest.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/drivers/passthrough/arm/smmu-v3.c  | 48 ++++++++++++++++++++++++--
>   xen/drivers/passthrough/arm/vsmmu-v3.c | 44 +++++++++++++++++++++++
>   xen/drivers/passthrough/arm/vsmmu-v3.h |  8 +++++
>   3 files changed, 98 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 196ac660ef..e44f872d2d 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -871,7 +871,6 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
>   	return 0;
>   }
>   
> -__maybe_unused
>   static struct arm_smmu_master *
>   arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
>   {
> @@ -892,10 +891,51 @@ arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
>   	return NULL;
>   }
>   
> +static int arm_smmu_handle_evt(struct arm_smmu_device *smmu, u64 *evt)
> +{
> +	int ret;
> +	struct arm_smmu_master *master;
> +	u32 sid = FIELD_GET(EVTQ_0_SID, evt[0]);

Maybe my comment should better be suited for commit #20/22 (where the 
vSID->pSID mapping is introduced)...

Look like the event is copied to the guest unchanged (with patch 20 
applied). It carries the pSID instead of the vSID, even though patch 
20’s table could translate it. So the domain might not find the device, 
or might blame a different one whose vSID matches that number. Or I 
missed something?


> +
> +	switch (FIELD_GET(EVTQ_0_ID, evt[0])) {
> +	case EVT_ID_TRANSLATION_FAULT:
> +		break;
> +	case EVT_ID_ADDR_SIZE_FAULT:
> +		break;
> +	case EVT_ID_ACCESS_FAULT:
> +		break;
> +	case EVT_ID_PERMISSION_FAULT:
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* Stage-2 event */
> +	if (evt[1] & EVTQ_1_S2)
> +		return -EFAULT;
> +
> +	mutex_lock(&smmu->streams_mutex);
> +	master = arm_smmu_find_master(smmu, sid);
> +	if (!master) {
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +	ret = arm_vsmmu_handle_evt(master->domain->d, smmu->dev, evt);

^^^ dereferences master->domain->d with no NULL check. Would it be 
possible that a fault event queued earlier can still arrive after the 
device is detached (on domain destruction), so master->domain is NULL?

> +	if (ret) {
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&smmu->streams_mutex);
> +	return ret;
> +}
> +
>   /* IRQ and event handlers */
>   static void arm_smmu_evtq_tasklet(void *dev)
>   {
> -	int i;
> +	int i, ret;
>   	struct arm_smmu_device *smmu = dev;
>   	struct arm_smmu_queue *q = &smmu->evtq.q;
>   	struct arm_smmu_ll_queue *llq = &q->llq;
> @@ -905,6 +945,10 @@ static void arm_smmu_evtq_tasklet(void *dev)
>   		while (!queue_remove_raw(q, evt)) {
>   			u8 id = FIELD_GET(EVTQ_0_ID, evt[0]);
>   
> +			ret = arm_smmu_handle_evt(smmu, evt);
> +			if (!ret)
> +				continue;
> +
>   			dev_info(smmu->dev, "event 0x%02x received:\n", id);
>   			for (i = 0; i < ARRAY_SIZE(evt); ++i)
>   				dev_info(smmu->dev, "\t0x%016llx\n",
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
> index 87342fdf69..b71511c2eb 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -338,6 +338,49 @@ static void arm_vsmmu_send_event(struct virt_smmu *smmu,
>       return;
>   }
>   
> +static struct virt_smmu *vsmmuv3_find_by_addr(struct domain *d, paddr_t paddr)
> +{
> +    struct virt_smmu *smmu;
> +
> +    list_for_each_entry( smmu, &d->arch.viommu_list, viommu_list )
> +    {
> +        if ( smmu->addr == paddr )
> +            return smmu;
> +    }
> +
> +    return NULL;
> +}
> +
> +int arm_vsmmu_handle_evt(struct domain *d, struct device *dev, uint64_t *evt)
> +{
> +    int ret;
> +    struct virt_smmu *smmu;
> +
> +    if ( is_hardware_domain(d) )
> +    {
> +        paddr_t paddr;
> +        /* Base address */
> +        ret = dt_device_get_address(dev_to_dt(dev), 0, &paddr, NULL);
> +        if ( ret )
> +            return -EINVAL;
> +
> +        smmu = vsmmuv3_find_by_addr(d, paddr);
> +        if ( !smmu )
> +            return -ENODEV;
> +    }
> +    else
> +    {
> +        smmu = list_entry(d->arch.viommu_list.next,
> +                          struct virt_smmu, viommu_list);
> +    }
> +
> +    ret = arm_vsmmu_write_evtq(smmu, evt);
> +    if ( ret )
> +        arm_vsmmu_set_gerror(smmu, GERROR_EVTQ_ABT_ERR);
> +
> +    return 0;
> +}
> +
>   static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
>                                 uint64_t *ste)
>   {
> @@ -1118,6 +1161,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
>       smmu->d = d;
>       smmu->features = features;
>       smmu->virq = virq;
> +    smmu->addr = addr;
>       smmu->cmdq.ent_size = CMDQ_ENT_DWORDS * DWORDS_BYTES;
>       smmu->evtq.ent_size = EVTQ_ENT_DWORDS * DWORDS_BYTES;
>   
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.h b/xen/drivers/passthrough/arm/vsmmu-v3.h
> index 9f4c86abd5..d4b7cf805f 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.h
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.h
> @@ -8,6 +8,8 @@
>   
>   void vsmmuv3_set_type(void);
>   
> +int arm_vsmmu_handle_evt(struct domain *d, struct device *dev, uint64_t *evt);
> +
>   #else
>   
>   static inline void __init vsmmuv3_set_type(void)
> @@ -15,6 +17,12 @@ static inline void __init vsmmuv3_set_type(void)
>       return;
>   }
>   
> +static inline int arm_vsmmu_handle_evt(struct domain *d,
> +                                       struct device *dev, uint64_t *evt)
> +{
> +    return -EINVAL;
> +}
> +
>   #endif /* CONFIG_VIRTUAL_ARM_SMMU_V3 */
>   
>   #endif /* __ARCH_ARM_VSMMU_V3_H__ */


