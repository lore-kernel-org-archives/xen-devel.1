Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03996CA9EBD
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 17:38:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444612.1661380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFEXI-0002Dp-Eu; Fri, 09 Oct 2026 17:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444612.1661380; Fri, 09 Oct 2026 17:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFEXI-0002Di-CF; Fri, 09 Oct 2026 17:37:36 +0000
Received: by outflank-mailman (input) for mailman id 1444612;
 Fri, 09 Oct 2026 17:37:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xFEXG-0002DQ-TD
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 17:37:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFEXF-009Q9J-Kr
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 19:37:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6ac9264b-bab6-0a2a0a5309dd-0a2a4508ec7e-6
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 19:37:31 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6ac9265b-f659-0a2a45080019-d155802fa594-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 19:37:31 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a166199820so661575e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 10:37:31 -0700 (PDT)
Received: from [192.168.0.114] ([91.123.150.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18ee9bd19sm46952685e9.1.2026.10.09.10.37.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 10:37:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791567451; x=1792172251; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uHmt7UFh3M6yXtrvb6bO+ouICIWFWyTELgpVwoR0wF4=;
        b=Ut1nJCr80YJJ0xd/qKq2rTOdUphmi4Vbmfd5f3h9gzeeb0B1J1XPhXcZnGUj13iE0V
         Flcko3A6Kpv8mPGvnUd+GMhzz3r6L4pqYtVO9IrWxsDjURhJsGKgxFDw52H9BMGmAtrm
         ceZeFHpqHo4xCwGaSLCkPQqgDEk/6thJMP/z3lkaOaPAL+EuZts3EqZ6QV97EDoHdQmZ
         vUKf+wR1JJ1IIY4N56Gs5y3fJcChy+mdFDIkE//ygcGkwzzpiGKbcS95gxAMUpkyVLSb
         cUPer1JPTx/YZid0OceLX3jk8f5mu9nFvIW7LxuYb89tUDiN0dm2DfCMjySA5bEQrEN1
         8A/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791567451; x=1792172251;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHmt7UFh3M6yXtrvb6bO+ouICIWFWyTELgpVwoR0wF4=;
        b=zzwSUl9M4UQoSC0Eb2ThNwJbEPGIxmYmIyGO9LmbbzzYsmTHvLNOAiKRFAmH9s8JIz
         7/9fa9gBRBOhbfOzDPtowfC2Posx+JPr3rouYy7JQax1JYV799VKsQzK+tC0fC9PfnSF
         0AiPt8XLqzXGezexYqWweT6bHQdpEmvu0izzKV1GxmIYGT9m2Jue0DS0mwsFIz0wIywN
         EmRc3pJYN4/zSdz87YwCQ4sG28tDEwwJp6Gb3+89D9vRZukTHSvG55/PR4IL4lLKVtsK
         pLuOHKRNT0TuNesACr/0jT4ifgocBcal7IfVwOjNe16qHGAsfxqEHUOuj7Vf4kZFl/h4
         6gUA==
X-Forwarded-Encrypted: i=1; AKwUvBzAPY4JiQ4ogZMLE7zN07OFgx/mNPY0YSO4gCXCwNpquSW1GngG4E0HNd4dIBrMBFnpq6/bK3N6uiM=@lists.xenproject.org
X-Gm-Message-State: AFuF++n9cGUo3gX02vjhcWVh29qCHVFfoRaPjORTk0RmUX5woJqVNud/
	YctvhinOrkBON2O/VmuLTlDO65kyUccxiwOP+qQd2tdklfT4CC4uNY2c
X-Gm-Gg: AYBFou3QCiZaf+6ky6ckmVEcYffJNmqsVLhLRJunfPu3RYP4kCzAS8dDKoszLLSOeFL
	JGRX9Rz8gGFvYOBlULvaqgbJRbf2K7Bh5ry8StwJVJlkGr43Qi6Jm2aQLZoMOLDn9+B83fKFBhl
	QBdz6tUYiYQF++eh6YJDc9ARfYnEb9F/QWryxaDJSI87PcXfLtFDd6ZZYLuVQsM+Jul9yvCn0dC
	aWSkGy8qOiJPCg0d+GjZXMnutAnAqq7jBo+vVRWFQSV950rvpOdThzQvhVZ3E8oZ42xim9TDD+R
	HdiGLTXPoQ9oyXGJwQy9OZFfzKmfaJXE2iZ3OmNqYPBpcJrIym83txBuFsuFjiLmsj7Q9dhBzPx
	QPuoXaxO6J6h8P9VLXnYYETAfZhUuOyAz42jVoKRGLG9L/Ei5p5wRe0vgdXZyx28IeEYdN7PeyO
	aKHyfvErlJgr0HfELq99f96nF/ln4qkPQzreMUJULDR4pRzhGQTJ0Hou+SApilkJJewD7chSAFH
	nbs0DMSZ5hTrQ==
X-Received: by 2002:a05:600c:3b0a:b0:4a1:8963:b865 with SMTP id 5b1f17b1804b1-4a18e447e9emr52422685e9.1.1791567450673;
        Fri, 09 Oct 2026 10:37:30 -0700 (PDT)
Message-ID: <ef146c92-fc46-4ba6-b863-fe7aadf97b59@gmail.com>
Date: Fri, 9 Oct 2026 20:37:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/22] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <6e45683f154be94e573a4a5e5d25c7efcc29fbe5.1791328190.git.milan_djokic@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <6e45683f154be94e573a4a5e5d25c7efcc29fbe5.1791328190.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1791567451-DF8D587B-28E33593/0/0
X-purgate-type: clean
X-purgate-size: 8725



On 10/7/26 03:06, Milan Djokic wrote:

Hello Milan

> From: Rahul Singh <rahul.singh@arm.com>
> 
> Xen SMMUv3 driver only supports stage-2 translation. Add support for
> Stage-1 translation that is required to support nested stage
> translation.
> 
> In true nested mode, both s1_cfg and s2_cfg will coexist.
> Let's remove the union. When nested stage translation is setup, both
> s1_cfg and s2_cfg are valid.
> 
> We introduce a new smmu_domain abort field that will be set
> upon guest stage-1 configuration passing. If no guest stage-1
> config has been attached, it is ignored when writing the STE.
> 
> arm_smmu_write_strtab_ent() is modified to write both stage
> fields in the STE and deal with the abort field.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/drivers/passthrough/arm/smmu-v3.c | 96 +++++++++++++++++++++++----
>   xen/drivers/passthrough/arm/smmu-v3.h |  9 +++
>   2 files changed, 93 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 7162473d62..d3e88d5a55 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -683,8 +683,10 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>   	 * 3. Update Config, sync
>   	 */
>   	u64 val = le64_to_cpu(dst[0]);
> -	bool ste_live = false;
> +	bool s1_live = false, s2_live = false, ste_live = false;
> +	bool abort, translate = false;
>   	struct arm_smmu_device *smmu = NULL;
> +	struct arm_smmu_s1_cfg *s1_cfg = NULL;
>   	struct arm_smmu_s2_cfg *s2_cfg = NULL;
>   	struct arm_smmu_domain *smmu_domain = NULL;
>   	struct arm_smmu_cmdq_ent prefetch_cmd = {
> @@ -699,30 +701,57 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>   		smmu = master->smmu;
>   	}
>   
> -	if (smmu_domain)
> -		s2_cfg = &smmu_domain->s2_cfg;
> +	if (smmu_domain) {
> +		switch (smmu_domain->stage) {
> +		case ARM_SMMU_DOMAIN_S1:
> +			s1_cfg = &smmu_domain->s1_cfg;
> +			break;
> +		case ARM_SMMU_DOMAIN_NESTED:
> +			s1_cfg = &smmu_domain->s1_cfg;
> +			fallthrough;
> +		case ARM_SMMU_DOMAIN_S2:
> +			s2_cfg = &smmu_domain->s2_cfg;
> +			break;
> +		default:
> +			break;
> +		}
> +		translate = s1_cfg || s2_cfg;
> +	}
>   
>   	if (val & STRTAB_STE_0_V) {
>   		switch (FIELD_GET(STRTAB_STE_0_CFG, val)) {
>   		case STRTAB_STE_0_CFG_BYPASS:
>   			break;
> +		case STRTAB_STE_0_CFG_S1_TRANS:
> +			s1_live = true;
> +			break;
>   		case STRTAB_STE_0_CFG_S2_TRANS:
> -			ste_live = true;
> +			s2_live = true;
> +			break;
> +		case STRTAB_STE_0_CFG_NESTED:
> +			s1_live = true;
> +			s2_live = true;
>   			break;
>   		case STRTAB_STE_0_CFG_ABORT:
> -			BUG_ON(!disable_bypass);
>   			break;
>   		default:
>   			BUG(); /* STE corruption */
>   		}
>   	}
>   
> +	ste_live = s1_live || s2_live;
> +
>   	/* Nuke the existing STE_0 value, as we're going to rewrite it */
>   	val = STRTAB_STE_0_V;
>   
>   	/* Bypass/fault */
> -	if (!smmu_domain || !(s2_cfg)) {
> -		if (!smmu_domain && disable_bypass)
> +	if (!smmu_domain)
> +		abort = disable_bypass;
> +	else
> +		abort = smmu_domain->abort;
> +
> +	if (abort || !translate) {
> +		if (abort)
>   			val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_ABORT);
>   		else
>   			val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_BYPASS);
> @@ -740,7 +769,32 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>   		return;
>   	}
>   
> +	if (ste_live) {
> +		/* First invalidate the live STE */
> +		dst[0] = cpu_to_le64(STRTAB_STE_0_CFG_ABORT);
> +		arm_smmu_sync_ste_for_sid(smmu, sid);
> +	}
> +
> +	if (s1_cfg) {
> +		dst[1] = cpu_to_le64(
> +			 FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
> +			 FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> +			 FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> +			 FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
> +			 FIELD_PREP(STRTAB_STE_1_STRW, STRTAB_STE_1_STRW_NSEL1));
> +
> +		if (smmu->features & ARM_SMMU_FEAT_STALLS &&
> +		   !(smmu->features & ARM_SMMU_FEAT_STALL_FORCE))
> +			dst[1] |= cpu_to_le64(STRTAB_STE_1_S1STALLD);
> +
> +		val |= (s1_cfg->s1ctxptr & STRTAB_STE_0_S1CTXPTR_MASK) |
> +			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS) |
> +			FIELD_PREP(STRTAB_STE_0_S1CDMAX, s1_cfg->s1cdmax) |
> +			FIELD_PREP(STRTAB_STE_0_S1FMT, s1_cfg->s1fmt);
> +	}
> +
>   	if (s2_cfg) {
> +		u64 vttbr = s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK;
>   		u64 strtab =
>   			 FIELD_PREP(STRTAB_STE_2_S2VMID, s2_cfg->vmid) |
>   			 FIELD_PREP(STRTAB_STE_2_VTCR, s2_cfg->vtcr) |
> @@ -750,12 +804,19 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>   			 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
>   			 STRTAB_STE_2_S2R;
>   
> -		BUG_ON(ste_live);
> +		if (s2_live) {
> +			u64 s2ttb = le64_to_cpu(dst[3]) & STRTAB_STE_3_S2TTB_MASK;
> +			BUG_ON(s2ttb != vttbr);
> +		}
> +
>   		dst[2] = cpu_to_le64(strtab);
>   
> -		dst[3] = cpu_to_le64(s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK);
> +		dst[3] = cpu_to_le64(vttbr);
>   
>   		val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
> +	} else {
> +		dst[2] = 0;
> +		dst[3] = 0;
>   	}
>   
>   	if (master->ats_enabled)
> @@ -1254,8 +1315,16 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
>   {
>   	int ret;
>   	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +
> +	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
> +		return 0;


I am not fully confident I understood all the magic here correctly, but 
it appears the initial state may be broken on SMMUs without stage-2
(stage-1-only hosts).

Here we return early without setting a stage, and the zeroed domain has 
stage-1 (enum value 0). So a new domain is left in a default stage-1 
state with no real config. The first attach then writes a live S1 STE 
with s1ctxptr = 0 in arm_smmu_write_strtab_ent(), so the hardware reads 
a context descriptor from physical address 0. I wonder we should default 
the domain to abort.

Could you please double-check?

Also, it is my understanding that without stage-2 translation the 
guest’s s1ctxptr and the stage-1 output address are used as host 
physical addresses. The guest decides where the hardware reads and 
writes. I wonder whether we should refuse this mode for non-hardware 
(non-direct-mapped) domains.

Apologies if this has already been discussed.

>   
> -	/* Restrict the stage to what we can actually support */
> +	/*
> +	 * Default to stage-2 support and initialize it. Stage-1 will be
> +	 * initialized during guest config attachment, if nested or stage-1
> +	 * mode is required
> +	 */
>   	smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
>   
>   	ret = arm_smmu_domain_finalise_s2(smmu_domain, master);
> @@ -2398,11 +2467,14 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   		break;
>   	}
>   
> +	if (reg & IDR0_S1P)
> +		smmu->features |= ARM_SMMU_FEAT_TRANS_S1;
> +
>   	if (reg & IDR0_S2P)
>   		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
>   
> -	if (!(reg & IDR0_S2P)) {
> -		dev_err(smmu->dev, "no stage-2 translation support!\n");
> +	if (!(reg & (IDR0_S1P | IDR0_S2P))) {
> +		dev_err(smmu->dev, "no translation support!\n");
>   		return -ENXIO;
>   	}
>   
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
> index ab1f29f6c7..e257de6db9 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.h
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -197,6 +197,7 @@
>   #define STRTAB_STE_0_CFG_BYPASS		4
>   #define STRTAB_STE_0_CFG_S1_TRANS	5
>   #define STRTAB_STE_0_CFG_S2_TRANS	6
> +#define STRTAB_STE_0_CFG_NESTED		7
>   
>   #define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
>   #define STRTAB_STE_0_S1FMT_LINEAR	0
> @@ -549,6 +550,12 @@ struct arm_smmu_strtab_l1_desc {
>   	dma_addr_t			l2ptr_dma;
>   };
>   
> +struct arm_smmu_s1_cfg {
> +	u64				s1ctxptr;
> +	u8				s1fmt;
> +	u8				s1cdmax;
> +};
> +
>   struct arm_smmu_s2_cfg {
>   	u16				vmid;
>   	u64				vttbr;
> @@ -669,6 +676,8 @@ struct arm_smmu_domain {
>   	atomic_t			nr_ats_masters;
>   
>   	enum arm_smmu_domain_stage	stage;
> +	bool			abort;
> +	struct arm_smmu_s1_cfg	s1_cfg;
>   	struct arm_smmu_s2_cfg	s2_cfg;
>   
>   	/* Xen domain associated with this SMMU domain */


