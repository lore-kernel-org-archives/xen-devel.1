Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9981AC5CFDB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 09:42:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389666.1630307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRxC-0000oO-NO; Thu, 13 Aug 2026 09:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389666.1630307; Thu, 13 Aug 2026 09:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRxC-0000oH-KY; Thu, 13 Aug 2026 09:42:26 +0000
Received: by outflank-mailman (input) for mailman id 1389666;
 Thu, 13 Aug 2026 09:42:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuRxB-0000nY-8U
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 09:42:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuRx9-0065eb-2M
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:42:23 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7d916b-e002-0a2a0a5209dd-0a2a450a95c0-34
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:42:22 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7d917e-f2d2-0a2a450a0019-d155dd2edda7-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:42:22 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47f7854678cso1316647f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 02:42:22 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a5b6f94sm4817483f8f.32.2026.08.13.02.42.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 02:42:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786614142; x=1787218942; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyOYrhfgrxIpzOCV2xKFjexz7vJ6XUTd9Ie2cmJb4Qc=;
        b=h+8kysbS11LOmCO2WY5JF37PeSu7ZuMdbmdbwQg1bBMf5XFOIXwEsmTh3psOVBuFjq
         yybbSDezbwSRHCIVYdTGkiKW2zwt2qji1k5nbg7IHeYWT7dtgcECZKeCcogDoLlrUn+i
         SqNCrBETfpXgYgXvAf2g78t2/84NCnlccAIvJu2CgQtRi2YtXk2e63sYItGv1JFEyZUu
         FDQFwrX1hCAfR3femH3pWuUpMvBpg2BgO5lc/+iEXVPrQzubK8JBcQlRnTznoJZjtlx3
         51gO40pWDkM4moxFA6wwCtZfVsls3eOYPzhrye8BWlPwyARDJImWp2szdjlC+e8cVhBi
         w33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786614142; x=1787218942;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CyOYrhfgrxIpzOCV2xKFjexz7vJ6XUTd9Ie2cmJb4Qc=;
        b=MisFoQ5gPDBfViqvRepVkXL/ylAaiEQgv+BluAlV4af3OflFQw4WgYMup2EvNKXsTy
         Zfb7qLT/Ef19ce2U6WbbIxcIWe0AsYEgsvQRDWF5XyHuEfDmngVwCJXUzoZsATSpilFG
         Ht/r12z0N04t+kOqmj7LpC3VMVVi+zo0BEwE9nlZq8cswvfsPDgXTaZSAhs5hXjYbY5H
         HfJBm2YO+Ff9BVAMoLUsXADMMrd9j8aSY0hhzOBwMG4BgjonjlMmOpjpOeSP85HqpXYd
         EpoP1bcIf542UEa7MDVH18bvQW5yw3dOKi7jV2vqGowHzpvIW0JYx03XpP3P3BqxzCLC
         yVEw==
X-Gm-Message-State: AOJu0YwRQMw4+ku2hytaH/pP4nzDea05zR2YU12Jw6r2NIL5DZYAOCHO
	b6HeaV0Bygnwbf8pigYBymCXqd/Rus2HzXwWTI5k93JeHCaZNZLy/oEqq2oNQw==
X-Gm-Gg: AR+sD121ygVoEF+7WQ5CT57hcLywm+3InrIW1SE/ZeicHRYoxYmKX+KILiGX/WDDC+P
	lsYl1F22G/PzT/U85SR0a/anRX5vTGD5TPkm0ZWwRf7XsYfVlHUGZyrQi8j5v86L4jOz6xS8g9j
	tFSHGEyDCQX8qJF0AvE6VhVP/Zj3thihWtSSNxj1nA6NRy0MPn4oY8WA2+LxwtRTqVDrbs/gUrt
	qKwwWxyI3eOMLUFINupIw8qz3J+OpfCVN5dl6Kc70onKC9XMncrSwTU0BH200bHYAg4bLl823cC
	CN3bDcDY5Pzut9VTmJOGtI7Ow03tpoBGBIvZtKwHm9ODftymjglaxPyJxEoCH/PNoxSSwkqkgUC
	bYvOKjsXwhwz6GcmxX784DT2kdHGurcImhIqx+tuMyhsJi0RLeGHd3GNcYwzm5lkGkxXwn+5f19
	caVO8uM3pGbbY/EOYTsM9C0E26P6doXfi//Q7x9qhjGYxmKT4X5a0La/PXTnua+dZcfvkNTh8T5
	kmiFctmrvrpG1juvhkNVZqm54L/3sgn+M22rKRQ6sM=
X-Received: by 2002:a05:6000:25fa:b0:47f:8810:cc64 with SMTP id ffacd0b85a97d-48159fe3f70mr6788744f8f.19.1786614141465;
        Thu, 13 Aug 2026 02:42:21 -0700 (PDT)
Message-ID: <5ea1202d-7635-46f7-8238-e3d54b588afd@gmail.com>
Date: Thu, 13 Aug 2026 11:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/17] xen/riscv: map IMSIC interrupt file for vCPUs
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <254f470ae2e2b2a4affa7c405be8c07a7d8b300e.1784560663.git.oleksii.kurochko@gmail.com>
 <1786612004.8631fc262581453bbf619ec5b2062170.19ffa5fb46a000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1786612004.8631fc262581453bbf619ec5b2062170.19ffa5fb46a000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1786614142-524DFCFC-DF2C9FC8/10/73395122804
X-purgate-type: spam
X-purgate-size: 4972



On 8/13/26 11:06 AM, Baptiste Le Duc wrote:
>> A guest running in VS-mode expects its own IMSIC S-file at offset 0 of its
>> guest-physical IMSIC block. Physically, the guest-file (G-file) assigned to
>> this vCPU lives at a hart-relative offset given by guest_file_id (assigned
>> via the vGEIN allocator). Therefore, imsic_map_guest_file() uses stage-2
>> translation to redirect the guest's fixed per-vCPU GPA page (offset 0) to
>> the specific physical guest-file page.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> 
>>
>> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
>> index ffce77209c..c5ae74e456 100644
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -25,7 +25,9 @@
>>   #include <xen/spinlock.h>
>>   #include <xen/xvmalloc.h>
>>   
>> +#include <asm/aia.h>
>>   #include <asm/imsic.h>
>> +#include <asm/p2m.h>
>>   
>>   #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
>>   
>> @@ -342,6 +344,67 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
>>       return 0;
>>   }
>>   
>> +/*
>> + * Map the physical IMSIC guest interrupt file (G-file) assigned to vCPU v
> Nit: What is this `v`?

A function argument. But I will just drop v from the comment.

>> + * into the domain's stage-2 guest-physical address space.
>> + *
>> + * In the machine's physical address space (SPA), each hart's IMSIC
>> + * supervisor-level file (S-file) is located at offset 0 of its address block,
>> + * followed contiguously by GEILEN guest files at offsets of 1, 2, ..., N pages.
>> + *
>> + * Because a guest OS running in VS-mode expects its own supervisor-level
>> + * interrupt file to be at offset 0 of its guest-physical IMSIC block, the
>> + * hypervisor must use stage-2 address translation to map the vCPU's
>> + * guest-physical "supervisor" page (GPA offset 0) to the specific
>> + * physical guest file page (SPA offset guest_file_id) on the physical hart.
>> + *
>> + * Xen pins each vCPU to a pCPU (v->processor) and assigns it a physical
> 
> 
>> + * guest file index (guest_file_id) from the vGEIN allocator. A guest_file_id
>> + * of 0 indicates that no hardware guest file is selected (matching the
>> + * architectural behavior where vGEIN = 0 in the hstatus CSR selects no
>> + * guest external interrupt source), requiring the VS-file to be emulated
>> + * in software.
>> + *
>> + * The base guest-physical address advertised to the guest in the device
>> + * tree matches offset 0 of the vCPU's virtual IMSIC block. Stage-2
>> + * translation ensures that guest supervisor accesses to this page are
>> + * transparently routed to the real hardware VS-file granted to it on
>> + * the current pCPU.
>> + */
>> +int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
>> +{
>> +    int res = 0;
>> +    struct domain *d = v->domain;
>> +    unsigned int cpu = v->processor;
>> +    vaddr_t gaddr = imsic_cfg.base_addr + (IMSIC_MMIO_PAGE_SZ * v->vcpu_id);
> 
> The variable holds a guest-physical address, so vaddr_t is the wrong
> type should be either paddr_t or gaddr_t.

Agree, paddr_t will be better what was mentioned in thread with Jan B.

> 
>> +    paddr_t paddr;
>> +    unsigned long guest_stride;
>> +
>> +    /* Nothing to map in the case of sw interrupt file. */
> 
> There is no software interrupt file implementation in this series, patch 11
> turns the non-MSI path into a BUG_ON(). So "vsfile_id == 0" today means "this
> vCPU gets no external interrupts at all and nothing tells anybody". Worth
> saying so plainly here rather than implying a fallback exists.

I would ask then different question will this function change when IMSIC 
interrupt file support will be added? I think - no as in the case of 
IMSIC interrupt file we don't need any stage-2 mapping. So here it is 
just a check that nothing should be mapped for non-hw-assisted interrupt 
files.

> 
>> +    if ( !vsfile_id )
>> +        return res;
>> +
>> +    guest_stride = vsfile_id * IMSIC_MMIO_PAGE_SZ;
> 
> 
>> +
>> +    paddr = imsic_cfg.msi[cpu].base_addr + imsic_cfg.msi[cpu].offset +
>> +            guest_stride;
> 
> 
>> +
>> +#ifdef IMSIC_DEBUG
> 
>> +    printk("%s: %pv: ga(%#lx) -> pa(%#lx), cpu(%#x), guest_file_id(%d) "
>> +           "base_addr(%#lx) offset(%#lx)\n", __func__, v, gaddr, paddr, cpu,
>> +           vsfile_id, imsic_cfg.msi[cpu].base_addr, imsic_cfg.msi[cpu].offset);
>> +#endif
>> +
>> +    res = map_regions_p2mt(d, gaddr_to_gfn(gaddr),
>> +                           PFN_DOWN(IMSIC_MMIO_PAGE_SZ), maddr_to_mfn(paddr),
>> +                           arch_dt_passthrough_p2m_type());
>> +    if ( res )
>> +        printk("%s: Failed to map %#lx to the guest at %#lx\n",
> 
> Maybe a use of dprintk() would be more appropriate?
> 
Agree, dprintk() will be better.

Thanks.

~ Oleksii


