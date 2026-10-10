Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A9ECA9EC1
	for <xen-devel@archiver.kernel.org>; Sat, 10 Oct 2026 16:14:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445238.1661605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFZiD-0006Mg-0f; Sat, 10 Oct 2026 16:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445238.1661605; Sat, 10 Oct 2026 16:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFZiC-0006MZ-Tf; Sat, 10 Oct 2026 16:14:16 +0000
Received: by outflank-mailman (input) for mailman id 1445238;
 Sat, 10 Oct 2026 16:14:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xFZiA-0006MN-Us
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 16:14:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFZi9-004fC0-UD
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2026 18:14:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6aca6407-2eae-0a2a0a5409dd-0a2a4504d3ec-34
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 18:14:13 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6aca6455-b57f-0a2a45040019-d155802ebd0a-3
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 18:14:13 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a02718da81so5041335e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 10 Oct 2026 09:14:13 -0700 (PDT)
Received: from [192.168.0.114] ([91.123.150.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf31b83sm146824735e9.12.2026.10.10.09.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2026 09:14:12 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791648853; x=1792253653; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QFp0ewMEzIch4eJ6rQSol9C79n5M8aePUwxgayz468=;
        b=ClIaGA/AMCRHRomkb1iu/gC66M2ySUbB9BatleAI9HyPM9DX6kWJ/ahJ/3nS1R/TO5
         o7MaGquYPOh0P1Omp6F0/VLt71GKcA/B8iJvhHH+mRX//foZdHLBGoxGc/s6ZBc2KrXZ
         I/5zm6NQBAUbzbAen0TSXkIYCDHFhhu2Qkg7nmIPT2sRHD7ICUV/xgW8sze7T9d7SnTK
         gzZjqLTrycl/pL+/7+Hl/ypv9+oM4dNyhbXa0pLp8KHUpiTAaMglNuhs95tBPCtp9H3v
         7zr8EbeWRBtgA70O2bxYIg/mBR/XqMXFJ68KNcJOlSv0mccepRR7OzkeCPHLVmmghQhC
         aJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648853; x=1792253653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0QFp0ewMEzIch4eJ6rQSol9C79n5M8aePUwxgayz468=;
        b=f72YONMvbZQ73Kox9hf92uDB55kgANMyHmBiN3FOxyHwFjz9hRLqdbZTc2a1P6y46B
         V/UFqVZd1iqKgIJnnlco+n+G/4O+9wodM0tyWzxup5P1W4ignIN1EzeQR8dcKV+7vz0C
         qki7inYpLs5i1AmyqcRfSdOUjDQYQ/IQfS2Psw//cf2x6akbsC4/yQhdocU0fn8AV4gO
         BoqX+4pNKezXp4/oryXDU5fRsuJsSQJ7BTo6Rrid5tDKmB4+N6CXIkOXZqlc31on1eT6
         fFSTEuOzowLFjlLcB4O0EMowrLBU7nomA3v5XYDdv1Qz0IZOzmxzGT1evtzkK84sBMT2
         bX9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxwALkwhwzQu/zHgkjDtf+kW8Hgq7WspA/fi6/YHi7oWd/tUmSPayhpvieF66CgJVPZDe3Lnnwa/lc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJARdBVNymEfc41RErtnyIFrHqa0CvYkQpyEzVX3Rcy/h/5heAl
	Ksmh1/TpGeD5Ivo5wqtrlx059DxCpfxF+k2TW6+PtBtP9T/iWntEjF43
X-Gm-Gg: AYBFou1ThUCbR8uykK2p+mL4NB363DJib0xlEsB/HnYr+IBxqbUyQgGHLwxgTjEC6WL
	K1FMY8fMnlbKzRjNZL6nT2tbl0Lem3/u+/D9B4J9HHAgci+m9qQOBFmmt69NQtPY9skOdmY6XXP
	LmxVmtHQun3YL6zwaf5wtt9E7dMCsMZ/f7Y45oHsSbeQTttgDjf1BwWiuBUzY5dr9KCexyrP9li
	PrWc5wEJtPzRotqaJZ8pUTUZ10dX5eNM4CJSWw4QSJAHFAwt+QdZk59vvnTcVvXDpSxDsT06xja
	W4jIg7nyEQhc09h3PGRQBtUIimpDeHUOzy1gWRYtZD+MCc06Px0t/X1YrjKP0HKC7C+qgjndmNl
	EkEf2hIsdna6wOd05R+Y6L/64cwgXb9f7E66AlObn3TDdlx+E8CiVndwmUtSCCsDg7N+A7bhUer
	RAROogg7XPcRTepr7WriSZjT+NplHi9uPwUF9ho/EjD7Axo05uPt30bj63+Qn34b5aXG1Um2Ug5
	Mc9+GcfHQvP2Aw=
X-Received: by 2002:a05:600c:3b0a:b0:4a1:779c:dc8e with SMTP id 5b1f17b1804b1-4a18e4a01b7mr100792775e9.10.1791648853208;
        Sat, 10 Oct 2026 09:14:13 -0700 (PDT)
Message-ID: <d85d5cd1-e426-41d9-a3af-dfb09413ca27@gmail.com>
Date: Sat, 10 Oct 2026 19:14:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/22] xen/arm: vsmmuv3: Add support for command
 CMD_CFGI_STE
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
 <de962fe524d632a9bcb8a07bf07e1dc6e041edaa.1791328190.git.milan_djokic@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <de962fe524d632a9bcb8a07bf07e1dc6e041edaa.1791328190.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1791648853-51CD7B50-667F1062/0/0
X-purgate-type: clean
X-purgate-size: 8033



On 10/7/26 03:06, Milan Djokic wrote:

Hello Milan

> From: Rahul Singh <rahul.singh@arm.com>
> 
> CMD_CFGI_STE is used to invalidate/validate the STE. Emulated vSMMUv3
> driver in XEN will read the STE from the guest memory space and capture
> the Stage-1 configuration required to support nested translation.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/drivers/passthrough/arm/vsmmu-v3.c | 169 +++++++++++++++++++++++++
>   1 file changed, 169 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
> index 10143927e7..25ba734fa7 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -78,6 +78,21 @@
>   
>   /* Helper Macros */
>   #define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
> +#define smmu_cmd_get_sid(x)         FIELD_GET(CMDQ_CFGI_0_SID, x)
> +#define smmu_get_ste_s1cdmax(x)     FIELD_GET(STRTAB_STE_0_S1CDMAX, x)
> +#define smmu_get_ste_s1fmt(x)       FIELD_GET(STRTAB_STE_0_S1FMT, x)
> +#define smmu_get_ste_s1stalld(x)    FIELD_GET(STRTAB_STE_1_S1STALLD, x)
> +#define smmu_get_ste_s1ctxptr(x)    FIELD_PREP(STRTAB_STE_0_S1CTXPTR_MASK, \
> +                                    FIELD_GET(STRTAB_STE_0_S1CTXPTR_MASK, x))
> +
> +/* stage-1 translation configuration */
> +struct arm_vsmmu_s1_trans_cfg {
> +    paddr_t s1ctxptr;
> +    uint8_t s1fmt;
> +    uint8_t s1cdmax;
> +    bool    bypassed;             /* translation is bypassed */
> +    bool    aborted;              /* translation is aborted */
> +};
>   
>   /* virtual smmu queue */
>   struct arm_vsmmu_queue {
> @@ -165,6 +180,159 @@ static void dump_smmu_command(uint64_t *command)
>       gprintk(XENLOG_ERR, "cmd 0x%02llx: %016"PRIx64" %016"PRIx64"\n",
>                smmu_cmd_get_command(command[0]), command[0], command[1]);
>   }
> +
> +static int arm_vsmmu_find_ste(struct virt_smmu *smmu, uint32_t sid,
> +                              uint64_t *ste)
> +{
> +    paddr_t addr, strtab_base;
> +    struct domain *d = smmu->d;
> +    uint32_t log2size;
> +    int strtab_size_shift;
> +    int ret;
> +
> +    spin_lock(&smmu->strtab_cfg_lock);
> +    log2size = MIN(FIELD_GET(STRTAB_BASE_CFG_LOG2SIZE, smmu->strtab_base_cfg),
> +                SMMU_IDR1_SIDSIZE);
> +    spin_unlock(&smmu->strtab_cfg_lock);
> +
> +    if ( sid >= (1U << log2size) )
> +        return -EINVAL;
> +
> +    spin_lock(&smmu->strtab_cfg_lock);
> +    if ( FIELD_GET(STRTAB_BASE_CFG_FMT, smmu->strtab_base_cfg) ==
> +         STRTAB_BASE_CFG_FMT_2LVL )
> +    {
> +        int idx, max_l2_ste, span;
> +        paddr_t l1ptr, l2ptr;
> +        uint64_t l1std;
> +        uint8_t sid_split = FIELD_GET(STRTAB_BASE_CFG_SPLIT,
> +                              smmu->strtab_base_cfg);
> +
> +        /*
> +        * Reserved SPLIT values behave as 6 according to the architecture.
> +        */
> +        if ( sid_split != 0x6 && sid_split != 0x8 && sid_split != 0xA )
> +        {
> +            sid_split = 0x6;
> +        }
> +
> +        strtab_size_shift = MAX(5, (int)log2size - sid_split - 1 + 3);
> +        strtab_base = smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
> +                        ~GENMASK_ULL(strtab_size_shift, 0);
> +        spin_unlock(&smmu->strtab_cfg_lock);
> +        idx = (sid >> sid_split) * STRTAB_L1_DESC_DWORDS;
> +        l1ptr = (paddr_t)(strtab_base + idx * sizeof(l1std));
> +
> +        ret = access_guest_memory_by_gpa(d, l1ptr, &l1std,
> +                                         sizeof(l1std), false);
> +        if ( ret )
> +        {
> +            gdprintk(XENLOG_ERR,
> +                     "Could not read L1PTR at 0X%"PRIx64"\n", l1ptr);
> +            return ret;
> +        }
> +
> +        span = FIELD_GET(STRTAB_L1_DESC_SPAN, l1std);
> +
> +        /* Validate SPAN against the architecturally defined range and SPLIT. */
> +        if ( !span || span > 0xB || span > sid_split + 1 )
> +        {
> +            /* L2Ptr is invalid; this descriptor matches no valid STEs. */
> +            return -EINVAL;
> +        }
> +
> +        max_l2_ste = (1U << (span - 1)) - 1;
> +        l2ptr = FIELD_PREP(STRTAB_L1_DESC_L2PTR_MASK,
> +                    FIELD_GET(STRTAB_L1_DESC_L2PTR_MASK, l1std));
> +        idx = sid & ((1 << sid_split) - 1);
> +        if ( idx > max_l2_ste )
> +        {
> +            gdprintk(XENLOG_ERR, "idx=%d > max_l2_ste=%d\n",
> +                     idx, max_l2_ste);
> +            return -EINVAL;
> +        }
> +        addr = l2ptr + idx * sizeof(*ste) * STRTAB_STE_DWORDS;
> +    }
> +    else
> +    {
> +        strtab_size_shift = log2size + 5;
> +        strtab_base = smmu->strtab_base & STRTAB_BASE_ADDR_MASK &
> +                      ~GENMASK_ULL(strtab_size_shift, 0);
> +        spin_unlock(&smmu->strtab_cfg_lock);
> +        addr = strtab_base + sid * sizeof(*ste) * STRTAB_STE_DWORDS;
> +    }
> +    ret = access_guest_memory_by_gpa(d, addr, ste, sizeof(*ste), false);
> +    if ( ret )
> +    {
> +        gdprintk(XENLOG_ERR,
> +                "Cannot fetch pte at address=0x%"PRIx64"\n", addr);
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +static int arm_vsmmu_decode_ste(struct virt_smmu *smmu, uint32_t sid,
> +                                struct arm_vsmmu_s1_trans_cfg *cfg,
> +                                uint64_t *ste)
> +{
> +    uint64_t val = ste[0];
> +
> +    if ( !(val & STRTAB_STE_0_V) )
> +        return -EAGAIN;

I am sorry, but I do not follow why invalid entry ...


> +
> +    switch ( FIELD_GET(STRTAB_STE_0_CFG, val) )
> +    {
> +    case STRTAB_STE_0_CFG_BYPASS:
> +        cfg->bypassed = true;
> +        return 0;
> +    case STRTAB_STE_0_CFG_ABORT:
> +        cfg->aborted = true;
> +        return 0;
> +    case STRTAB_STE_0_CFG_S1_TRANS:
> +        break;
> +    case STRTAB_STE_0_CFG_S2_TRANS:
> +        gdprintk(XENLOG_ERR, "vSMMUv3 does not support stage 2 yet\n");
> +        goto bad_ste;
> +    default:
> +        gdprintk(XENLOG_ERR, "Invalid STE config type\n");
> +        goto bad_ste;
> +    }
> +
> +    cfg->s1ctxptr = smmu_get_ste_s1ctxptr(val);
> +    cfg->s1fmt = smmu_get_ste_s1fmt(val);
> +    cfg->s1cdmax = smmu_get_ste_s1cdmax(val);
> +    if ( cfg->s1cdmax != 0 )
> +    {
> +        gdprintk(XENLOG_ERR,
> +                 "vSMMUv3 does not support multiple context descriptors\n");
> +        goto bad_ste;
> +    }
> +
> +    return 0;
> +
> + bad_ste:
> +    return -EINVAL;
> +}
> +
> +static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
> +{
> +    int ret;
> +    uint64_t ste[STRTAB_STE_DWORDS];

NIT: Looks like ste[0] is only used today (first 8 bytes), the rest is 
uninitialised.

> +    struct arm_vsmmu_s1_trans_cfg s1_cfg = {0};
> +    uint32_t sid = smmu_cmd_get_sid(cmdptr[0]);
> +
> +    ret = arm_vsmmu_find_ste(smmu, sid, ste);
> +    if ( ret )
> +        return ret;
> +
> +    ret = arm_vsmmu_decode_ste(smmu, sid, &s1_cfg, ste);
> +    if ( ret )
> +        return (ret == -EAGAIN ) ? 0 : ret;

  ... is treated as success an no-op. The physical STE keeps its old 
guest_cfg (added by subsequent commit) after the guest invalidates it. 
Could you please clarify why this is ok. Should not it become abort?

> +
> +    return 0;
> +}
> +
>   static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
>   {
>       struct arm_vsmmu_queue *q = &smmu->cmdq;
> @@ -191,6 +359,7 @@ static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
>           switch ( smmu_cmd_get_command(command[0]) )
>           {
>           case CMDQ_OP_CFGI_STE:
> +            ret = arm_vsmmu_handle_cfgi_ste(smmu, command);
>               break;
>           case CMDQ_OP_PREFETCH_CFG:
>           case CMDQ_OP_CFGI_CD:


