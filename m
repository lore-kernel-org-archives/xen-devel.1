Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1186FCA9EBD
	for <xen-devel@archiver.kernel.org>; Sun, 11 Oct 2026 13:28:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445584.1661642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFtat-0006tA-OB; Sun, 11 Oct 2026 13:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445584.1661642; Sun, 11 Oct 2026 13:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFtat-0006t2-JN; Sun, 11 Oct 2026 13:28:03 +0000
Received: by outflank-mailman (input) for mailman id 1445584;
 Sun, 11 Oct 2026 13:28:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xFtas-0006sw-3S
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2026 13:28:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFtar-00CWd9-Gc
 for xen-devel@lists.xenproject.org; Sun, 11 Oct 2026 15:28:01 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6acb8ed9-bab6-0a2a0a5309dd-0a2a4502bd2e-8
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 15:28:01 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6acb8ee1-6ca4-0a2a45020019-d155dd32b57a-3
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 15:28:01 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48c4d99c32bso1016110f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 11 Oct 2026 06:28:01 -0700 (PDT)
Received: from [192.168.0.114] ([91.123.150.146])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dba033a0fsm12420647f8f.14.2026.10.11.06.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Oct 2026 06:27:59 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791725281; x=1792330081; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNpvVUPDUetdWXIygPA+RI81XwLH8JbVKHpBZJrVaFQ=;
        b=A1EdHF3jYGg0v0u4TE3O504CDglz5jODx+/DKpnPxie8Ggr+Nk5+GB1EflQzK4JDke
         rD9rdL8uncu8yWZC+vfHA36+NzmLyjWXkAb5oE47kmc8jR6EZPt1w0QD5XMDMfHqpLgZ
         qI56TNrSVEydBv9OkGB6wnKz8LyqIOLSfsq9Ox55wk/7PsfGCMhDhxiWCDDFJ3B3ODTH
         7UqFd4JgilKqqLWo/aO2xe2qduEPR0DVOjqdo8hZezduumgzOmX2/VYQ89DE963OPEQp
         SWMYXERgvFmWm/9NmC+Z5IVW2SAb5RS23hoYxCkkPf2n9CRnq0i55qENqu08pMxh7lV4
         UHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791725281; x=1792330081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNpvVUPDUetdWXIygPA+RI81XwLH8JbVKHpBZJrVaFQ=;
        b=hMbR58vvM5VBK2U3z0wTmvZWQIi0yTXewvMtrhhUx2k95VeHvoFKBCRREN3jTIQ7cO
         NqBVumo/GgNCqRCmfSqGhgytjgzOSEE7V/nfMUuaCr507mD2E7S9qiP+THBCLILveG9R
         DR3TOyFkZEMvGXwI2i57DaNs+F9x5EuiQ1oWBiWdEojBQkFsBF8Fp+EOtnZ5PTyy2cII
         dhjhZFFYrPr9X0857e7Qm/mk1sAniMm1oseINV0Gli4Fvm6y5Ne7Qr0ta3d0Lv7+M/C7
         KCkEqeMU/FreV9N1VXhRTEVlFc2T/dYaeLpE7I1spdmEKidn/EpfLZFnJlm0wpUQOzD4
         3rtA==
X-Forwarded-Encrypted: i=1; AKwUvBz5im6uYQUHgU9PTCtdsXrOfcH6PF9iA7EFJs39fVrsNxw/3mFQkPlL5jRWxbNJmon/K3Y4o++zC1w=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJn0X8BUuEtBZRxsqL9AVxlisdfbM8nLAqDaizwAlrRiHlV9yHA
	lkrRAhYVPm7zyAjcs2aAK4owErKYAWjbwixa+3quOqcBWdbtRt5TLoG8
X-Gm-Gg: AYBFou0v2UfDBffz2aTe5KB0zC/BQNTbhOaJHHaObhPHag0R9dHRmovtc7ikbMGIfTh
	d5NbH9rcIezwA/IMH3Q6M/HCevpH65X9vWOUuXGsBFEDnlrM5jWBbNHmjpJZAfW3BxzL2lhyB6u
	Nxg0rnEzbHUOdt1qgGrEIssku1Tgyar/DLoxpxiSmuHOtw6UHScdzM0nZ8rzDn4KbzRjhvZt4W3
	teEkA7JdP5cbr/pjWPuHLb8xWMCeUOSyyE0kSVlpABvCu2Bfv54osXjx2qhnPmrEJDkMktKGS4R
	QtgLZFuDvhjgwod6DJjavn8d75DZa+h0FLxsXeHMC1JXX+7x0Q2sw/Mou33J/moueOJGK964Amp
	2filkW0a+GGyMKNgeIagsHqTQA5RXPDPYSYPIehTwxgtN5s2L2S4ipEc09ZXkeOk5NTDdmGGVqh
	POi6LOAC8zidOz6K8Q0St1yTvRU+BzRzyGH1Lhwoj7/8wUtXBObzO91+yyZFOpUlEmCvWEEoeyJ
	fY=
X-Received: by 2002:a5d:4988:0:b0:48b:4c8:7b08 with SMTP id ffacd0b85a97d-48dbaae3a61mr9100131f8f.34.1791725280520;
        Sun, 11 Oct 2026 06:28:00 -0700 (PDT)
Message-ID: <ce585f3f-e2f3-46ec-ad5e-50e1f29523ba@gmail.com>
Date: Sun, 11 Oct 2026 16:27:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/22] xen/arm: vsmmuv3: Add support for event queue
 and global error
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <1bf1f69e50fa7f6f90bfa6b2c7434c1ba3f65bbf.1791328190.git.milan_djokic@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <1bf1f69e50fa7f6f90bfa6b2c7434c1ba3f65bbf.1791328190.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1791725281-F26B72AC-935A3263/0/0
X-purgate-type: clean
X-purgate-size: 17405



On 10/7/26 03:07, Milan Djokic wrote:

Hello Milan


> From: Rahul Singh <rahul.singh@arm.com>
> 
> Event queue is used to send the events to guest when there is an events/
> faults. Add support for event queue to send events to guest.
> 
> Global error in SMMUv3 hw will be updated in smmu_gerror and
> smmu_gerrorn register. Add support for global error registers to send
> global error to guest.
> 
> Add architectural error handling to the emulated command queue,
> updating the global error register and stopping command consumption
> on error.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/drivers/passthrough/arm/smmu-v3.h  |  20 +++
>   xen/drivers/passthrough/arm/vsmmu-v3.c | 233 +++++++++++++++++++++++--
>   xen/include/public/arch-arm.h          |   2 +
>   3 files changed, 244 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
> index 4a912be740..44ecb5d89c 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.h
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -358,6 +358,26 @@
>   
>   #define EVTQ_0_ID			GENMASK_ULL(7, 0)
>   
> +#define EVT_ID_BAD_STREAMID		0x02
> +#define EVT_ID_BAD_STE		    	0x04
> +#define EVT_ID_TRANSLATION_FAULT	0x10
> +#define EVT_ID_ADDR_SIZE_FAULT		0x11
> +#define EVT_ID_ACCESS_FAULT		0x12
> +#define EVT_ID_PERMISSION_FAULT		0x13
> +
> +#define EVTQ_0_SSV			(1UL << 11)
> +#define EVTQ_0_SSID			GENMASK_ULL(31, 12)
> +#define EVTQ_0_SID			GENMASK_ULL(63, 32)
> +#define EVTQ_1_STAG			GENMASK_ULL(15, 0)
> +#define EVTQ_1_STALL			(1UL << 31)
> +#define EVTQ_1_PnU			(1UL << 33)
> +#define EVTQ_1_InD			(1UL << 34)
> +#define EVTQ_1_RnW			(1UL << 35)
> +#define EVTQ_1_S2			(1UL << 39)
> +#define EVTQ_1_CLASS			GENMASK_ULL(41, 40)
> +#define EVTQ_1_TT_READ			(1UL << 44)
> +#define EVTQ_2_ADDR			GENMASK_ULL(63, 0)
> +#define EVTQ_3_IPA			GENMASK_ULL(51, 12)
>   /* PRI queue */
>   #define PRIQ_ENT_SZ_SHIFT		4
>   #define PRIQ_ENT_DWORDS			((1 << PRIQ_ENT_SZ_SHIFT) >> 3)
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
> index 3f557d1c4d..87342fdf69 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -85,6 +85,35 @@
>   #define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK, \
>                                       FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, x))
>   
> +/* event queue entry */
> +struct arm_smmu_evtq_ent {
> +    /* Common fields */
> +    uint8_t     opcode;
> +    uint32_t    sid;
> +
> +    /* Event-specific fields */
> +    union {
> +        struct {
> +            uint32_t ssid;
> +            bool ssv;
> +        } c_bad_ste_streamid;
> +
> +        struct {
> +            bool stall;
> +            uint16_t stag;
> +            uint32_t ssid;
> +            bool ssv;
> +            bool s2;
> +            uint64_t addr;
> +            bool rnw;
> +            bool pnu;
> +            bool ind;
> +            uint8_t class;
> +            uint64_t addr2;
> +        } f_translation;
> +    };
> +};
> +
>   /* stage-1 translation configuration */
>   struct arm_vsmmu_s1_trans_cfg {
>       paddr_t s1ctxptr;
> @@ -115,6 +144,7 @@ struct virt_smmu {
>       uint32_t    strtab_base_cfg;
>       uint64_t    strtab_base;
>       uint32_t    irq_ctrl;
> +    uint32_t    virq;
>       uint64_t    gerror_irq_cfg0;
>       uint64_t    evtq_irq_cfg0;
>       struct      arm_vsmmu_queue evtq, cmdq;
> @@ -160,9 +190,15 @@ static inline bool smmu_get_evtq_enabled(struct virt_smmu *smmu)
>       spin_unlock(&smmu->cr0_lock);
>   
>       return enabled;
> -};
> +}
>   
>   /* Queue manipulation functions */
> +static bool queue_full(struct arm_vsmmu_queue *q)
> +{
> +    return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
> +           Q_WRP(q, q->prod) != Q_WRP(q, q->cons);
> +}
> +
>   static bool queue_empty(struct arm_vsmmu_queue *q)
>   {
>       return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
> @@ -175,12 +211,133 @@ static void queue_inc_cons(struct arm_vsmmu_queue *q)
>       q->cons = Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
>   }
>   
> +static void queue_inc_prod(struct arm_vsmmu_queue *q)
> +{
> +    u32 prod = (Q_WRP(q, q->prod) | Q_IDX(q, q->prod)) + 1;
> +    q->prod = Q_OVF(q->prod) | Q_WRP(q, prod) | Q_IDX(q, prod);
> +}
> +
>   static void dump_smmu_command(uint64_t *command)
>   {
>       gprintk(XENLOG_ERR, "cmd 0x%02llx: %016"PRIx64" %016"PRIx64"\n",
>                smmu_cmd_get_command(command[0]), command[0], command[1]);
>   }
>   
> +static void arm_vsmmu_update_irq(struct virt_smmu *smmu)
> +{
> +    bool evt_pending = false;
> +    bool gerr_pending = false;
> +    uint32_t irq_ctrl;
> +
> +    spin_lock(&smmu->irq_cfg_lock);
> +    irq_ctrl = smmu->irq_ctrl;
> +    spin_unlock(&smmu->irq_cfg_lock);
> +
> +    spin_lock(&smmu->evt_queue_lock);
> +    evt_pending = !queue_empty(&smmu->evtq);
> +    spin_unlock(&smmu->evt_queue_lock);
> +
> +    spin_lock(&smmu->gerror_lock);
> +    gerr_pending = (smmu->gerror ^ smmu->gerrorn) != 0;
> +    spin_unlock(&smmu->gerror_lock);
> +
> +    vgic_inject_irq(smmu->d, NULL, smmu->virq,
> +                    ((irq_ctrl & IRQ_CTRL_EVTQ_IRQEN) && evt_pending) ||
> +                    ((irq_ctrl & IRQ_CTRL_GERROR_IRQEN) && gerr_pending));
> +}
> +
> +static void arm_vsmmu_set_gerror(struct virt_smmu *smmu, uint32_t gerror_err)
> +{
> +    uint32_t pending, new_gerrors;
> +
> +    spin_lock(&smmu->gerror_lock);
> +
> +    pending = smmu->gerror ^ smmu->gerrorn;
> +    new_gerrors = ~pending & gerror_err;
> +
> +    if ( new_gerrors )
> +        smmu->gerror ^= new_gerrors;
> +
> +    spin_unlock(&smmu->gerror_lock);
> +
> +    arm_vsmmu_update_irq(smmu);
> +}
> +
> +static int arm_vsmmu_write_evtq(struct virt_smmu *smmu, uint64_t *evt)
> +{
> +    struct arm_vsmmu_queue *q = &smmu->evtq;
> +    struct domain *d = smmu->d;
> +    paddr_t addr;
> +    int ret;
> +
> +    if ( !smmu_get_evtq_enabled(smmu) )
> +        return -EINVAL;

If the queue is disabled, the event is simply discarded and nothing is 
wrong. Why do we then raise GERROR.EVTQ_ABT_ERR via arm_vsmmu_set_gerror()?


> +
> +    spin_lock(&smmu->evt_queue_lock);
> +
> +    if ( queue_full(q) )
> +    {
> +        spin_unlock(&smmu->evt_queue_lock);
> +        return -EINVAL;

This does not look like a global error either. From what I got from the 
SMMU spec (ARM IHI 0070/H.a 7.4 Event queue overflow), when the queue is 
full the event should be discarded and the overflow flag should be set 
in EVTQ_PROD.

"The Event queue overflow condition is present when:
SMMU_EVENTQ_PROD.OVFLG != SMMU_EVENTQ_CONS.OVACKFLG
When an overflow occurs, the SMMU toggles the SMMU_EVENTQ_PROD.OVFLG 
flag if the overflow condition is not already present."

Otherwise the guest might show a misleading message (an event queue 
memory-write error instead of an overflow).

Or I really missed something?

> +    }
> +
> +    addr = Q_PROD_ENT(q);
> +
> +    ret = access_guest_memory_by_gpa(d, addr, evt,
> +                                     sizeof(*evt) * EVTQ_ENT_DWORDS, true);
> +    if ( ret )
> +    {
> +        spin_unlock(&smmu->evt_queue_lock);
> +        return ret;
> +    }
> +
> +    queue_inc_prod(q);
> +
> +    spin_unlock(&smmu->evt_queue_lock);
> +
> +    arm_vsmmu_update_irq(smmu);
> +
> +    return 0;
> +}
> +
> +static void arm_vsmmu_send_event(struct virt_smmu *smmu,
> +                                 struct arm_smmu_evtq_ent *ent)
> +{
> +    uint64_t evt[EVTQ_ENT_DWORDS];
> +    int ret;
> +
> +    memset(evt, 0, 1 << EVTQ_ENT_SZ_SHIFT);
> +
> +    if ( !smmu_get_evtq_enabled(smmu) )
> +        return;
> +
> +    evt[0] |= FIELD_PREP(EVTQ_0_ID, ent->opcode);
> +    evt[0] |= FIELD_PREP(EVTQ_0_SID, ent->sid);
> +
> +    switch ( ent->opcode )
> +    {
> +    case EVT_ID_BAD_STREAMID:
> +    case EVT_ID_BAD_STE:
> +        evt[0] |= FIELD_PREP(EVTQ_0_SSID, ent->c_bad_ste_streamid.ssid);
> +        evt[0] |= FIELD_PREP(EVTQ_0_SSV, ent->c_bad_ste_streamid.ssv);
> +        break;
> +    case EVT_ID_TRANSLATION_FAULT:
> +    case EVT_ID_ADDR_SIZE_FAULT:
> +    case EVT_ID_ACCESS_FAULT:
> +    case EVT_ID_PERMISSION_FAULT:
> +        break;
> +    default:
> +        gdprintk(XENLOG_WARNING, "vSMMUv3: event opcode is bad\n");
> +        break;
> +    }
> +
> +    ret = arm_vsmmu_write_evtq(smmu, evt);
> +    if ( ret )
> +        arm_vsmmu_set_gerror(smmu, GERROR_EVTQ_ABT_ERR);
> +
> +    return;
> +}
> +
>   static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
>                                 uint64_t *ste)
>   {
> @@ -189,6 +346,14 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
>       uint32_t log2size;
>       int strtab_size_shift;
>       int ret;
> +    struct arm_smmu_evtq_ent ent = {
> +        .opcode = EVT_ID_BAD_STREAMID,
> +        .sid = sid,
> +        .c_bad_ste_streamid = {
> +            .ssid = 0,
> +            .ssv = false,
> +        },
> +    };
>   
>       spin_lock(&smmu->strtab_cfg_lock);
>       log2size = MIN(FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->strtab_base_cfg),
> @@ -196,7 +361,10 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
>       spin_unlock(&smmu->strtab_cfg_lock);
>   
>       if ( sid >= (1U << log2size) )
> +    {
> +        arm_vsmmu_send_event(smmu, &ent);
>           return -EINVAL;
> +    }
>   
>       spin_lock(&smmu->strtab_cfg_lock);
>       if ( FIELD_GET(STRTAB_BASE_CFG_FMT, smmu->strtab_base_cfg) ==
> @@ -249,6 +417,7 @@ static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
>           {
>               gdprintk(XENLOG_ERR, "idx=%d > max_l2_ste=%d\n",
>                        idx, max_l2_ste);
> +            arm_vsmmu_send_event(smmu, &ent);
>               return -EINVAL;
>           }
>           addr = l2ptr + idx * sizeof(*ste) * STRTAB_STE_DWORDS;
> @@ -277,6 +446,14 @@ static int arm_vsmmu_decode_ste(struct virt_smmu *smmu, uint32_t sid,
>                                   uint64_t *ste)
>   {
>       uint64_t val = ste[0];
> +    struct arm_smmu_evtq_ent ent = {
> +        .opcode = EVT_ID_BAD_STE,
> +        .sid = sid,
> +        .c_bad_ste_streamid = {
> +            .ssid = 0,
> +            .ssv = false,
> +        },
> +    };
>   
>       if ( !(val & STRTAB_STE_0_V) )
>           return -EAGAIN;
> @@ -312,6 +489,7 @@ static int arm_vsmmu_decode_ste(struct virt_smmu *smmu, uint32_t sid,
>       return 0;
>   
>    bad_ste:
> +    arm_vsmmu_send_event(smmu, &ent);
>       return -EINVAL;
>   }
>   
> @@ -362,16 +540,19 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
>       if ( !smmu_get_cmdq_enabled(smmu) )
>           return 0;
>   
> -    while ( !queue_empty(q) )
> +    while ( !queue_empty(q) &&
> +          ((smmu->gerror ^ smmu->gerrorn) & (GERROR_CMDQ_ERR)) == 0 )
>       {
> -        int ret;
> -
>           addr = Q_CONS_ENT(q);
>           ret = access_guest_memory_by_gpa(d, addr, command,
>                                            sizeof(command), false);
> -        if ( ret ) {
> -            queue_inc_cons(q);
> -            return ret;
> +        if ( ret )
> +        {
> +            smmu->cmdq.cons &= ~CMDQ_CONS_ERR;
> +            smmu->cmdq.cons |= FIELD_PREP(CMDQ_CONS_ERR,
> +                                        CMDQ_ERR_CERROR_ABT_IDX);
> +            arm_vsmmu_set_gerror(smmu, GERROR_CMDQ_ERR);
> +            break;
>           }
>   
>           switch ( smmu_cmd_get_command(command[0]) )
> @@ -395,6 +576,10 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
>           default:
>               gdprintk(XENLOG_ERR, "vSMMUv3: unhandled command\n");
>               dump_smmu_command(command);
> +            smmu->cmdq.cons &= ~CMDQ_CONS_ERR;
> +            smmu->cmdq.cons |= FIELD_PREP(CMDQ_CONS_ERR,
> +                                          CMDQ_ERR_CERROR_ILL_IDX);
> +            arm_vsmmu_set_gerror(smmu, GERROR_CMDQ_ERR);
>               break;
>           }
>   
> @@ -405,6 +590,15 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
>                        ret);
>               dump_smmu_command(command);
>           }
> +
> +        /*
> +        * Stop consuming the command queue if a command error occurred.
> +        * CMDQ_CONS continues to point at the offending command until the
> +        * error is acknowledged.
> +        */
> +        if ( (smmu->gerror ^ smmu->gerrorn) & GERROR_CMDQ_ERR )
> +            break;
> +
>           queue_inc_cons(q);
>       }
>   
> @@ -443,6 +637,7 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>               vreg_reg32_update(&reg32, r, info);
>               smmu->evtq.cons = reg32;
>               spin_unlock(&smmu->evt_queue_lock);
> +            arm_vsmmu_update_irq(smmu);
>               break;
>           default:
>               printk(XENLOG_G_ERR
> @@ -573,6 +768,7 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>               vreg_reg32_update(&reg32, r, info);
>               smmu->irq_ctrl = reg32;
>               spin_unlock(&smmu->irq_cfg_lock);
> +            arm_vsmmu_update_irq(smmu);
>               break;
>   
>           case VREG64(ARM_SMMU_GERROR_IRQ_CFG0):
> @@ -602,6 +798,10 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>               vreg_reg32_update(&reg32, r, info);
>               smmu->gerrorn = reg32;
>               spin_unlock(&smmu->gerror_lock);
> +            arm_vsmmu_update_irq(smmu);
> +            spin_lock(&smmu->cmd_queue_lock);
> +            arm_vsmmu_handle_cmds(smmu);
> +            spin_unlock(&smmu->cmd_queue_lock);
>               break;
>   
>           default:
> @@ -905,9 +1105,10 @@ static const struct mmio_handler_ops vsmmuv3_mmio_handler = {
>       .write = vsmmuv3_mmio_write,
>   };
>   
> -static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size,
> -                               uint32_t features)
> +static int vsmmuv3_init_single(struct domain *d, paddr_t addr,
> +                               paddr_t size, uint32_t virq, uint32_t features)
>   {
> +    int ret;
>       struct virt_smmu *smmu;
>   
>       smmu = xzalloc(struct virt_smmu);
> @@ -916,6 +1117,7 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size,
>   
>       smmu->d = d;
>       smmu->features = features;
> +    smmu->virq = virq;
>       smmu->cmdq.ent_size = CMDQ_ENT_DWORDS * DWORDS_BYTES;
>       smmu->evtq.ent_size = EVTQ_ENT_DWORDS * DWORDS_BYTES;
>   
> @@ -928,6 +1130,15 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size,
>       spin_lock_init(&smmu->strtab_cfg_lock);
>       spin_lock_init(&smmu->irq_cfg_lock);
>   
> +    ret = vgic_reserve_virq(d, virq);
> +    if ( !ret )
> +    {
> +        printk(XENLOG_G_ERR
> +                 "vSMMUv3: Failed to reserve domain vIRQ %u\n", virq);
> +        xfree(smmu);
> +        return -EINVAL;
> +    }
> +
>       register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
>   
>       /* Register the vIOMMU to be able to clean it up later. */
> @@ -953,7 +1164,7 @@ static int domain_vsmmuv3_init(struct domain *d)
>           {
>               smmu = (const struct arm_smmu_device *) hw_iommu->iommu;
>               ret = vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size,
> -                                      smmu->features);
> +                                      hw_iommu->irq, smmu->features);
>               if ( ret )
>                   return ret;
>           }
> @@ -983,7 +1194,7 @@ static int domain_vsmmuv3_init(struct domain *d)
>           }
>   
>           ret = vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE,
> -                                  features);
> +                                  GUEST_VSMMU_SPI, features);
>           if ( ret )
>               return ret;
>       }
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 8863e2e457..c43b8b7b71 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -538,6 +538,8 @@ typedef uint64_t xen_callback_t;
>   #define GUEST_VIRTIO_MMIO_SPI_FIRST   33
>   #define GUEST_VIRTIO_MMIO_SPI_LAST    43
>   
> +#define GUEST_VSMMU_SPI         44

So this is the same emulated SPI as the one used for vPL011. You likely 
need to update d_cfg->arch.nr_spis if vSMMU is enabled for the domain, 
to ensure that we allocate enough SPIs for it (refer to 
arch_parse_dom0less_node(), when "nr_spis" is not explicitly specified
we update nr_spis if vPL011 is requested). Moreover, you already do this 
in libxl.


> +
>   /*
>    * SGI is the preferred delivery mechanism of FF-A pending notifications or
>    * schedule recveive interrupt. SGIs 8-15 are normally not used by a guest


