Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B336CCA9EBE
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 16:59:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445261.1661615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFaPG-0004J1-4Y; Sat, 10 Oct 2026 16:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445261.1661615; Sat, 10 Oct 2026 16:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFaPG-0004Iu-1L; Sat, 10 Oct 2026 16:58:46 +0000
Received: by outflank-mailman (input) for mailman id 1445261;
 Sat, 10 Oct 2026 16:58:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xFaPE-0004Io-Rf
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 16:58:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFaPD-007LPG-JT
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 18:58:43 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6aca6ec0-bab6-0a2a0a5309dd-0a2a450cb87c-8
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 18:58:43 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6aca6ec3-f479-0a2a450c0019-d155802dbc6a-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 18:58:43 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a171b677d2so4612045e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 09:58:43 -0700 (PDT)
Received: from [192.168.0.114] ([91.123.150.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a192d3efb6sm69286695e9.1.2026.10.10.09.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2026 09:58:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791651523; x=1792256323; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2wLM0oRL98F2dE8DMArrd/THEFPncK/SZtO4L4llatE=;
        b=W1PfPoU8TqtJfEJtBuFOUbV6aOyab7DzyHImA64xqENUFTKbfJ1yqx9sBatye/Qp0a
         kOLY/cLynXkLq+Gx/ukZgpuqta9yJT0S2ZTLSPrlLZE+ZFp5PmO27VWdOIoA1xiobXB+
         9il3KvzTwdXxG34KnPdsw8obM37EINucwY3qhdFPAFU8ntekUXgXe8YZr3ulscbkwYv6
         NNg3Hv8EgApcQ5mfWgkrrnuJG2zZwSqewO+Dkvev/p3kimxrGr4WEjKJeua96PA3ukcu
         CSuSuCmPtxkbF4puXNGp0+zDBAgz5i7SYsNJkypBpZ+ip/FWlRNGmizD2TPQLmlsFzEI
         V6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791651523; x=1792256323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wLM0oRL98F2dE8DMArrd/THEFPncK/SZtO4L4llatE=;
        b=JlQHe7V65bGWiPCq2omWNtVJ+ksCjOF39a7WqXtj90weSalG9B4Hpd/TLKF2g+fdU0
         FnnPPm5WXP0HvBGQEZ9xs430xiZZzpvmYo1ZpRPBpaGPBZlapngoS5fKvtRclUZeQ6f8
         mfED4KG2TxzpTZv8/KurrMT5u/h/jllpmpKwN9++j5EfBB/jppeFD44RiIXIxo/vanxU
         pXQhv8h0GLqcGMIsNEjp/zyzDX9/7p+ysDE3JJ4MSlc/xzuq+cAKF4x/ALC2JjCpq7Qg
         JA6nwESwu+GxTQ1A5flEB94DtuHqI10qSdHyrUCsi93iiw6suWlyhyyIJC9x3JGVespS
         8jAA==
X-Forwarded-Encrypted: i=1; AKwUvBxxXSTch63YT4auUq2AFcBa7CJ9MDzt/+xDqaxK66a4bQghaDdLWMkSN9o5gvC19G1EzQOfq8zxL38=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKPPsc38jKTpT45brGbyTqiBwg7OZp1KLc31nVIyQONcVmBha0f
	ARQ0kbVqEj4AeVZSaCL+ZqKbDM43SeTqc2MJtjEMbo8N7WB8haLi2FTk
X-Gm-Gg: AYBFou0t3KqkzkTDOc6vlY8uUKj2j/4qFouePWruYta/CjLBV3NjmBCIvKoAjV74eXi
	JF+wdqyy6zvcuFBf5UY+GeTN1aHU56E7lSOeEAKVvR898HbCGS+xPcdVwDPHRU0+2cbn9sxziXZ
	um6f46Q1nO2FwIfpuLWpnLf2NNx+ycuM3awq0CR61AWSpSCEMMt67d2ngOg1GYkRLqAfYXOK8NZ
	dlCI+sK8i039BiphFnL8eBzOy4Pg1Z3cIYdWs7a+F5QwvXgp2KHYNkh7DL93h+7AO1Cqn4yZu6L
	1LbMsql4bUtaMbl1x5+o2Pg0KWFLfa7sWB8Vt4XDAmJP2Zl5pd1bVyK84aNy46vIX1yGzqbG6qx
	V2b+ocNv0iftCJZHj0kHa8VPsg7vUgdCTS7KPO1gcZ+ThFzJBojpygl/NEomnzcJGVngRffcXok
	zEjLbz9wGmN2071KIn1SDRlZRpvaQvejitHl/mXpFaGGvZBjWXf69kEMMpQNop/ehEddL2NPxjE
	2BfCDglBeXjgw==
X-Received: by 2002:a05:600c:4ec9:b0:4a1:8961:78dd with SMTP id 5b1f17b1804b1-4a18e4c9e46mr101813185e9.27.1791651522725;
        Sat, 10 Oct 2026 09:58:42 -0700 (PDT)
Message-ID: <60e304f6-6c65-40cb-8b4b-1584e5c47272@gmail.com>
Date: Sat, 10 Oct 2026 19:58:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/22] xen/arm: vsmmuv3: Add support for cmdqueue
 handling
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <b7fcd3cdbe97ae2f23a5797f8c9c51ddba63fcc6.1791328190.git.milan_djokic@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <b7fcd3cdbe97ae2f23a5797f8c9c51ddba63fcc6.1791328190.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1791651523-03AD4A5B-E0D77712/0/0
X-purgate-type: clean
X-purgate-size: 6409



On 10/7/26 03:06, Milan Djokic wrote:

Hello Milan

> From: Rahul Singh <rahul.singh@arm.com>
> 
> Add support for virtual cmdqueue handling for guests
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/drivers/passthrough/arm/vsmmu-v3.c | 127 +++++++++++++++++++++++++
>   1 file changed, 127 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
> index c4fef6e8bd..10143927e7 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -8,6 +8,7 @@
>    * This needs to be fully handled in the future.
>    */
>   
> +#include <xen/guest_access.h>
>   #include <xen/param.h>
>   #include <xen/sched.h>
>   #include <asm/mmio.h>
> @@ -33,6 +34,51 @@
>   #define SMMU_EVTQS          19
>   #define DWORDS_BYTES        8
>   
> +/*
> + * SMMUv3 command definitions
> + * Some commands are fully handled by the emulation layer, while others are
> + * currently treated as architectural no-ops because the required behavior
> + * is either implicitly guaranteed by Xen or not yet modeled explicitly.
> + *
> + * Emulation handled commands:
> + *
> + * - CMD_CFGI_STE
> + * - CMD_TLBI_NH_ASID
> + * - CMD_TLBI_NSNH_ALL
> + * - CMD_TLBI_NH_VA
> + *
> + * No-op/Implicitly handled commands:
> + *
> + * - CMD_SYNC
> + * - CMD_PREFETCH_CFG
> + * - CMD_CFGI_CD
> + * - CMD_CFGI_CD_ALL
> + * - CMD_CFGI_ALL
> + *
> + * TODO: Remaining architecture-defined commands are not supported (error
> + * produced), due to lack of support in SMMUv3 driver / emulation layer
> + * TODO: Range / per-device invalidation not supported atm
> + * TODO: Long-running command queue handling is not implemented (command
> + * consumption should be budgeted with asynchronous resumption).
> + */
> +#define CMDQ_OP_PREFETCH_CFG    0x1
> +#define CMDQ_OP_CFGI_STE        0x3
> +#define CMDQ_OP_CFGI_ALL        0x4
> +#define CMDQ_OP_CFGI_CD         0x5
> +#define CMDQ_OP_CFGI_CD_ALL     0x6
> +#define CMDQ_OP_TLBI_NH_ASID    0x11
> +#define CMDQ_OP_TLBI_NH_VA      0x12
> +#define CMDQ_OP_TLBI_NSNH_ALL   0x30
> +#define CMDQ_OP_CMD_SYNC        0x46
> +
> +/* Queue Handling */
> +#define Q_BASE(q)       ((q)->q_base & Q_BASE_ADDR_MASK)
> +#define Q_CONS_ENT(q)   (Q_BASE(q) + Q_IDX(q, (q)->cons) * (q)->ent_size)
> +#define Q_PROD_ENT(q)   (Q_BASE(q) + Q_IDX(q, (q)->prod) * (q)->ent_size)
> +
> +/* Helper Macros */
> +#define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
> +
>   /* virtual smmu queue */
>   struct arm_vsmmu_queue {
>       uint64_t    q_base; /* base register */
> @@ -99,6 +145,83 @@ static inline bool smmu_get_evtq_enabled(struct virt_smmu *smmu)
>       spin_unlock(&smmu->cr0_lock);
>   
>       return enabled;
> +};
> +
> +/* Queue manipulation functions */
> +static bool queue_empty(struct arm_vsmmu_queue *q)
> +{
> +    return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
> +           Q_WRP(q, q->prod) == Q_WRP(q, q->cons);
> +}
> +
> +static void queue_inc_cons(struct arm_vsmmu_queue *q)
> +{
> +    uint32_t cons = (Q_WRP(q, q->cons) | Q_IDX(q, q->cons)) + 1;
> +    q->cons = Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
> +}
> +
> +static void dump_smmu_command(uint64_t *command)
> +{
> +    gprintk(XENLOG_ERR, "cmd 0x%02llx: %016"PRIx64" %016"PRIx64"\n",
> +             smmu_cmd_get_command(command[0]), command[0], command[1]);
> +}
> +static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
> +{
> +    struct arm_vsmmu_queue *q = &smmu->cmdq;
> +    struct domain *d = smmu->d;
> +    uint64_t command[CMDQ_ENT_DWORDS];
> +    paddr_t addr;
> +    int ret = 0;
> +
> +    if ( !smmu_get_cmdq_enabled(smmu) )
> +        return 0;
> +
> +    while ( !queue_empty(q) )
> +    {

This is unbounded loop, guest controls PROD and the advertised queue 
size is big enough. Below ...

> +        int ret;
> +
> +        addr = Q_CONS_ENT(q);
> +        ret = access_guest_memory_by_gpa(d, addr, command,
> +                                         sizeof(command), false);
> +        if ( ret ) {
> +            queue_inc_cons(q);
> +            return ret;
> +        }
> +
> +        switch ( smmu_cmd_get_command(command[0]) )
> +        {
> +        case CMDQ_OP_CFGI_STE:
> +            break;
> +        case CMDQ_OP_PREFETCH_CFG:
> +        case CMDQ_OP_CFGI_CD:
> +        case CMDQ_OP_CFGI_CD_ALL:
> +        case CMDQ_OP_CFGI_ALL:
> +        case CMDQ_OP_CMD_SYNC:
> +            break;
> +        case CMDQ_OP_TLBI_NH_ASID:
> +        case CMDQ_OP_TLBI_NSNH_ALL:
> +        case CMDQ_OP_TLBI_NH_VA:
> +            ret = iommu_iotlb_flush_all(smmu->d, 1);

  ... TLBI does full-VMID flush and waits for the hardware. All of this 
runs inside one MMIO trap with cmd_queue_lock held, so CPU could stall.
Yes, this is honestly mentioned in the design doc (Security 
Considerations, Observation ...) and doc calls it future work. Yes, this 
should be sorted out before driver can be treated as supported feature.

So please treat my comment as a remark. For now, I would put a TODO 
(e.g., above the while loop so it does not get forgotten.


> +            if ( !ret )
> +                break;
> +            fallthrough;
> +        default:
> +            gdprintk(XENLOG_ERR, "vSMMUv3: unhandled command\n");
> +            dump_smmu_command(command);
> +            break;
> +        }
> +
> +        if ( ret )
> +        {
> +            gdprintk(XENLOG_ERR,
> +                     "vSMMUv3: command error %d while handling command\n",
> +                     ret);
> +            dump_smmu_command(command);
> +        }
> +        queue_inc_cons(q);
> +    }
> +
> +    return ret;
>   }
>   
>   static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
> @@ -221,6 +344,10 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>               reg32 = smmu->cmdq.prod;
>               vreg_reg32_update(&reg32, r, info);
>               smmu->cmdq.prod = reg32;
> +
> +            if ( arm_vsmmu_handle_cmds(smmu) )
> +                gdprintk(XENLOG_ERR, "error handling vSMMUv3 commands\n");
> +
>               spin_unlock(&smmu->cmd_queue_lock);
>               break;
>   


