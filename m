Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A75A606CB44
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 21:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vioLyGN2
Received: from list by lists.xenproject.org with outflank-mailman.1495176.1694272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTmoj-0000dl-I2; Wed, 18 Nov 2026 21:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495176.1694272; Wed, 18 Nov 2026 21:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTmoj-0000de-DM; Wed, 18 Nov 2026 21:03:45 +0000
Received: by outflank-mailman (input) for mailman id 1495176;
 Wed, 18 Nov 2026 21:03:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xTmoh-0000dY-T3
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 21:03:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTmoh-009WL9-5u
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 22:03:43 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6afe127a-8faa-0a2a0a5109dd-0a2a45098476-22
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 22:03:43 +0100
Received: from [209.85.208.174] (helo=mail-lj1-f174.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6afe12ae-be1a-0a2a45090019-d155d0aef12d-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 22:03:43 +0100
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3ae25dcbd81so14306891fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 13:03:43 -0800 (PST)
Received: from [192.168.0.114] ([91.123.151.27])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5c1aa770a6csm837033e87.36.2026.11.18.13.03.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 13:03:41 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795035822; x=1795640622; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdKz14d2Ec4KIT6wev1sRyvogfK8D5ov1xy4gXeo5BY=;
        b=vioLyGN2CGLMxIXeCs/M/HzCAnCMuBvs1ixDDbq5BJ2Kb+L5w2wnpT/xJet8jn/OZz
         CU7FqYACfRKFN+7d7gZBj7Zi+pqFwukaxy1Qh22k4HFBHX5uJROP2wY/Apiz5Xued8lV
         pQVdqeIahE3XT2mn/kUZmMEdJbzqwoG0KYDCLA+rtLB0UDhvt5poNYBDNWWPlIICGI+3
         dQbLYsCIS2wrjYp3iQO10sGggy6Wqps9uf7zzXlpRAsOJBbnDAIy2GtB/t6MegKy1xid
         gmydwjOanYnEWbVLxbVenD+BpVp0qogBpZOJrSzQ1BKiqhAgNM3d6OArTWpiiG1xgFCf
         pZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035822; x=1795640622;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdKz14d2Ec4KIT6wev1sRyvogfK8D5ov1xy4gXeo5BY=;
        b=ma/Ol8HDxjGZ3ISeqTD4airvlnM9YfX3nlGNm1CaVhBasaCjVP3eJ9wfyQMg5UnyHl
         ZSUbQao3+RZhXvXra4jWP3yfHTPsWnsl5LJzHVfCaOcs2/2hyfZLz2EYEkBbY2JnO6uN
         FHzCH55/VZFeiU3EYxzg0ttqSb+zZ6y0j2+fEx0CL2Pc2i1RIh2zon28cUSUL5fPaPCh
         /dz+3XOymkpKKc7pSZZ4SzI6X73Nh2M730mZ38GLsyPX0E2QrLmBCHHg6ZdhaliR9j1Q
         MtdqHbWV1z4XQ9ZACmI2t/25IafrvXkU/A9y+2r67ixzYT9Z3bl/p2BVYYje3PSOXwcF
         0Gpw==
X-Forwarded-Encrypted: i=1; AL+hErGus7yqX3jGgVVt7qMmlZMV/Gb5PgCTZQYsOMC9ToK9/s8VzXGSW34w05fy4geehsoPwW4DzITH1T4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/DEawOb94CZYTfDRicRrvVRn6CbMyVOa6NrgcssH6UqnKoOxCk
	xfIuZhsVJ50ACDdsCOSWyOFLKNz7LkmZReQrsIicvFbH3aiESd+wBKCy
X-Gm-Gg: AYBFou2X/tnrnLka+/fX+roz1nPzJn2imhowPWgr07kU9T5VYVSnB83xkf2rPGKhxzP
	lNBBHReXlVGstdPURrAqVT35egWPwNQrzxSZQtmq4oOweH+dsfbJi649kZHhjjvrnOrOW/q6WYn
	Jp63kICMAHF1F2l/hAMKFLrMNOpxd4QHYKqN8zTFAWqMdTFRnjoN1TG1xi2ee/siyGsURhSaqXQ
	21ynxXuwkt1UL/XSB4m0DW0mOHiSUsK/whk/ftTcOi0JL2VGHr9E4MDlcoxMysdDdqRoKsBVc4a
	VmhJVHlplWPIZirobKICWzzyIkm3liKbukblmjbEoGcRPSBAgzPRnGEurNuJFqwuBnvbQT3a4JK
	SwYw+s4K9ArxGLkSiYjDEBKwY0/DM4dvdJOjkyBYn8UWyKhC1V2FPBDFIGOv84y1DVrCxv8yMQ+
	SgtddkB7hvGbSL8dpFyttEx+a8IGITvuS8i4EgbVVumVnlPbGsyvDDLqRVmCRavra/ZoGyqVD7y
	cGvLu4MZsbbsi76IQhNtJPN03vENM0m9iWlIhBId2X7l7i3QoOk08koq0/gDd3gwfByaBFTeuxS
	4WCoVZkJb5gjbTlcszd3yFfQxqhe3PY=
X-Received: by 2002:a05:6512:6602:b0:5c1:ac60:c69 with SMTP id 2adb3069b0e04-5c1ac600d44mr949123e87.34.1795035822128;
        Wed, 18 Nov 2026 13:03:42 -0800 (PST)
Message-ID: <9cbce55d-7c36-4e8d-a32d-3dc2af0b3246@gmail.com>
Date: Wed, 18 Nov 2026 23:03:39 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm/smmuv3: clean stream tables for non-coherent
 hardware
To: Mykola Kvach <Mykola_Kvach@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <29e61dc16bff44403131d87a85c0050248d87309.1794829488.git.mykola_kvach@epam.com>
Content-Language: ru
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <29e61dc16bff44403131d87a85c0050248d87309.1794829488.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1795035823-3A0C5034-C1D7FFE7/0/0
X-purgate-type: clean
X-purgate-size: 7986
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



16.11.2026 13:47, Mykola Kvach пишет:

Hello Mykola


> Xen's dmam_alloc_coherent() returns cacheable memory. A non-coherent
> SMMU cannot see writes that remain in the CPU cache.
> 
> On Orange Pi 5 (RK3588S), NVMe initialization failed with C_BAD_STREAMID
> for SID 0x4100 while the CPU saw a populated L1 descriptor.
> 
> Clean new stream tables before use. Clean updated STE data in
> arm_smmu_sync_ste_for_sid() before issuing CFGI_STE and CMD_SYNC.
> Keep both sync points around the dst[0] update.
> 
> Clean the L2 table before writing its L1 pointer, then clean the pointer.
> Skip these cache operations on coherent SMMUs.
> 
> See Arm IHI 0070G.b, sections 3.15 and 3.21.3.1.
> 
> Fixes: 452ddbe3592b ("xen/arm: smmuv3: Add support for SMMUv3 driver")
> Assisted-by: Codex:GPT-6.1
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>


So, If I understand the patch/problem correctly, this looks like a 
follow-up to "xen/arm: smmuv3: Add cache maintenance for non-coherent 
SMMU queues". The underlying issue seems the same, cache maintenance for 
in-memory data structures, except that previous patch addressed the 
command queue, while this one targets the stream table.

I did not find any serious issues with the current patch, just a couple 
of NITs below for you to consider.

Preferably with the NITs addressed:
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

> ---
> Changes in v2:
> - Rename arm_smmu_clean_strtab() to arm_smmu_clean_dcache().
> - Pass the STE pointer and clean size to arm_smmu_sync_ste_for_sid().
>    Clean the given range there before CFGI_STE and CMD_SYNC. Keep the
>    original clean ranges, both sync points around dst[0], and the
>    explicit cleaning during table initialisation.
> ---
>   xen/drivers/passthrough/arm/smmu-v3.c | 27 +++++++++++++++++++++++----
>   1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 232df2421c..945a18a7a1 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -637,6 +637,14 @@ static int arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>   }
>   
>   /* Stream table manipulation functions */
> +static void arm_smmu_clean_dcache(struct arm_smmu_device *smmu,
> +				const void *ptr, size_t size)
> +{
> +	/* Xen's dmam_alloc_coherent() returns cacheable memory. */
> +	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
> +		(void)clean_dcache_va_range(ptr, size);

So, two ways of testing coherency in one file. The queues use 
q->non_coherent in several places. The new helper reads smmu->features & 
ARM_SMMU_FEAT_COHERENCY. Both derive from the same bit, so behaviour is 
correct.

NIT 1: Cast is inconsistent. The helper casts the int return of 
clean_dcache_va_range() to (void). The queue code in the same file 
ignores the same return without a cast.

NIT 2: I wonder if the queue code's open-coded "if (q->non_coherent) 
clean/invalidate..." calls could share the helper? That would eliminate 
the duplicate coherency checks, avoid spreading CMO logic across the 
driver, and also resolve NIT 1 since the cast (or lack thereof) would 
live in one place.

***

Somthing like this:
+static void arm_smmu_clean_dcache(struct arm_smmu_device *smmu,
+				  const void *ptr, size_t size)
+{
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		(void)clean_dcache_va_range(ptr, size);
+}
+
+static void arm_smmu_invalidate_dcache(struct arm_smmu_device *smmu,
+				       const void *ptr, size_t size)
+{
+	if (!(smmu->features & ARM_SMMU_FEAT_COHERENCY))
+		(void)invalidate_dcache_va_range(ptr, size);
+}


The queue callers would then look like this:

-	if (q->non_coherent)
-		clean_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_addr));
+	arm_smmu_clean_dcache(q->smmu, q_addr,
+			      q->ent_dwords * sizeof(*q_addr));

...

-	if (q->non_coherent)
-		invalidate_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_addr));
+	arm_smmu_invalidate_dcache(q->smmu, q_addr,
+				   q->ent_dwords * sizeof(*q_addr));

For this to work, the queue needs a back pointer to the SMMU
(replacing the non_coherent flag), set in arm_smmu_init_one_queue():

-	q->non_coherent = !(smmu->features & ARM_SMMU_FEAT_COHERENCY);
+	q->smmu = smmu;


struct arm_smmu_queue {
         ...

-	/* Is the memory access coherent? */
-	bool				non_coherent;
+	struct arm_smmu_device		*smmu;
  };

This is optional, so feel free to keep the code as it is if you prefer.


> +}
> +
>   static void
>   arm_smmu_write_strtab_l1_desc(__le64 *dst, struct arm_smmu_strtab_l1_desc *desc)
>   {
> @@ -649,7 +657,8 @@ arm_smmu_write_strtab_l1_desc(__le64 *dst, struct arm_smmu_strtab_l1_desc *desc)
>   	write_atomic(dst, cpu_to_le64(val));
>   }
>   
> -static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u32 sid)
> +static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u32 sid,
> +				      const __le64 *dst, size_t size)
>   {
>   	struct arm_smmu_cmdq_ent cmd = {
>   		.opcode	= CMDQ_OP_CFGI_STE,
> @@ -659,6 +668,7 @@ static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u32 sid)
>   		},
>   	};
>   
> +	arm_smmu_clean_dcache(smmu, dst, size);
>   	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
>   	arm_smmu_cmdq_issue_sync(smmu);
>   }
> @@ -736,7 +746,8 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>   		 * the STE regardless of whether the old value was live.
>   		 */
>   		if (smmu)
> -			arm_smmu_sync_ste_for_sid(smmu, sid);
> +			arm_smmu_sync_ste_for_sid(smmu, sid, dst,
> +						  STRTAB_STE_DWORDS << 3);
>   		return;
>   	}
>   
> @@ -762,9 +773,9 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>   		dst[1] |= cpu_to_le64(FIELD_PREP(STRTAB_STE_1_EATS,
>   						 STRTAB_STE_1_EATS_TRANS));
>   
> -	arm_smmu_sync_ste_for_sid(smmu, sid);
> +	arm_smmu_sync_ste_for_sid(smmu, sid, dst, STRTAB_STE_DWORDS << 3);
>   	write_atomic(&dst[0], cpu_to_le64(val));
> -	arm_smmu_sync_ste_for_sid(smmu, sid);
> +	arm_smmu_sync_ste_for_sid(smmu, sid, dst, sizeof(*dst));
>   
>   	/* It's likely that we'll want to use the new STE soon */
>   	if (!(smmu->options & ARM_SMMU_OPT_SKIP_PREFETCH))
> @@ -805,7 +816,10 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
>   	}
>   
>   	arm_smmu_init_bypass_stes(desc->l2ptr, 1 << STRTAB_SPLIT);
> +	/* Clean the L2 table before writing the L1 pointer. */
> +	arm_smmu_clean_dcache(smmu, desc->l2ptr, size);
>   	arm_smmu_write_strtab_l1_desc(strtab, desc);
> +	arm_smmu_clean_dcache(smmu, strtab, STRTAB_L1_DESC_DWORDS << 3);
>   	return 0;
>   }
>   
> @@ -1744,6 +1758,7 @@ static int __init arm_smmu_init_queues(struct arm_smmu_device *smmu)
>   static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
>   {
>   	unsigned int i;
> +	size_t size;
>   	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
>   	void *strtab = smmu->strtab_cfg.strtab;
>   
> @@ -1757,6 +1772,9 @@ static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
>   		strtab += STRTAB_L1_DESC_DWORDS << 3;
>   	}
>   
> +	size = cfg->num_l1_ents * (STRTAB_L1_DESC_DWORDS << 3);
> +	arm_smmu_clean_dcache(smmu, cfg->strtab, size);

NIT 3: arm_smmu_init_l1_strtab() recomputes the L1 size that its caller 
already has as l1size. I would move arm_smmu_clean_dcache() to 
arm_smmu_init_strtab_2lvl() to avoid recalculating it and reduce the diff.


> +
>   	return 0;
>   }
>   
> @@ -1823,6 +1841,7 @@ static int arm_smmu_init_strtab_linear(struct arm_smmu_device *smmu)
>   	cfg->strtab_base_cfg = reg;
>   
>   	arm_smmu_init_bypass_stes(strtab, cfg->num_l1_ents);
> +	arm_smmu_clean_dcache(smmu, strtab, size);
>   	return 0;
>   }
>   


