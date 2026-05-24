Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DE8CD5BB1
	for <xen-devel@archiver.kernel.org>; Sun, 24 May 2026 11:17:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1318628.1586756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wR6pB-0006Jc-1p; Sun, 24 May 2026 11:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318628.1586756; Sun, 24 May 2026 11:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wR6pA-0006JV-Uo; Sun, 24 May 2026 11:16:52 +0000
Received: by outflank-mailman (input) for mailman id 1318628;
 Sun, 24 May 2026 11:16:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wR6p9-0006JP-6l
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 11:16:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wR6p8-003ziy-2K;
 Sun, 24 May 2026 11:16:50 +0000
Received: from [2a02:8012:3a1:0:94ee:8228:5d9d:4ee8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wR6p8-005QDS-1O;
 Sun, 24 May 2026 11:16:50 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=DpCjZi3SL0X921Oss3oqgK+DJOyDoHLLjH65p7XLZKo=; b=u8/gNR6zrOeRb5J+4G+ZjjCVbk
	MCetsK9hflHoiUFhe3tVU9ClF/EdSIES2hhndQccA1uAZNEj9LflLIS2LmWTI13oeoqphvQ1+Usz6
	sEfFCl318UOgXvyjRK8CzxgFoqSrVD1XpE30pwujAEcz6nc15GvAfV6dg4rYwVTlqivE=;
Message-ID: <ffb1e917-857f-470b-8d52-36812e4c9492@xen.org>
Date: Sun, 24 May 2026 12:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/23] xen/arm: vsmmuv3: Add dummy support for virtual
 SMMUv3 for guests
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <97aa20fdcec324bb58c6869ddcba5fcf29bf75b3.1774918270.git.milan_djokic@epam.com>
 <1dcec397-a265-4972-8f2c-fd10c6e0b6ad@xen.org>
 <c8d683f1-eba2-4ec9-beca-84e6b5e80914@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c8d683f1-eba2-4ec9-beca-84e6b5e80914@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Milan,

On 03/05/2026 19:38, Milan Djokic wrote:
> On 4/14/26 09:09, Julien Grall wrote:
>>> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/ 
>>> include/asm/viommu.h
>>> index 4598f543b8..2a6742de73 100644
>>> --- a/xen/arch/arm/include/asm/viommu.h
>>> +++ b/xen/arch/arm/include/asm/viommu.h
>>> @@ -5,9 +5,21 @@
>>>    #ifdef CONFIG_ARM_VIRTUAL_IOMMU
>>>    #include <xen/lib.h>
>>> +#include <xen/list.h>
>>>    #include <xen/types.h>
>>>    #include <public/xen.h>
>>> +extern struct list_head host_iommu_list;
>>> +
>>> +/* data structure for each hardware IOMMU */
>>> +struct host_iommu {
>>> +    struct list_head entry;
>>> +    const struct dt_device_node *dt_node;
>>> +    paddr_t addr;
>>> +    paddr_t size;
>>> +    uint32_t irq;
>>
>> You don't seem to use ``irq`` in this patch. What is this meant to be
>> used for?
>>
> 
> This field will be used for vIOMMU event queue creation for the hardware 
> domain in a later patch (xen/arm: vsmmuv3: Add support for event queue 
> and global error). The emulated IRQ and MMIO region for the hardware 
> domain vIOMMU will match those of the host IOMMU.

I would prefer if this is introduced when you need it.

[..]

>>> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/ 
>>> passthrough/arm/viommu.c
>>> index 7ab6061e34..53ae46349a 100644
>>> --- a/xen/drivers/passthrough/arm/viommu.c
>>> +++ b/xen/drivers/passthrough/arm/viommu.c
>>> @@ -2,12 +2,42 @@
>>>    #include <xen/errno.h>
>>>    #include <xen/init.h>
>>> +#include <xen/irq.h>
>>>    #include <xen/types.h>
>>>    #include <asm/viommu.h>
>>> +/* List of all host IOMMUs */
>>> +LIST_HEAD(host_iommu_list);
>>
>> I don't quite follow why this is part of the common code. That said, why
>> do we need to register the host IOMMU? Wouldn't it be simpler to go
>> through the list of pIOMMU in the vSMMU v3 implementation?
>>
> 
> ``host_iommu_list`` is part of the generic code to allow reuse for other 
> IOMMU types in the future. For example, it can be reused for Renesas 
> IPMMU, rather than duplicating it.
> As for why we need to register IOMMUs, it seems more suitable to create 
> this list at initialization and add IOMMUs with the necessary properties 
> when the pIOMMU is probed.
> We can't reuse the same list from the SMMU driver because vIOMMU needs 
> raw DT properties (address, size), which I don't think we can extract 
> from the host driver list.

The IOMMU ABI is not fixed in Xen. It can be modified to fit the vIOMMU 
work. My main concern with the current approach is the list of 
information we may need will differ between IOMMUs and the information 
will need to be duplicated. So I am still not convinced this is the 
right way to have generic code.

It would be better if we have callback to prepare the firmware table 
(and maybe mapping/irq) for a given SMMU.

That said, it might be preferable to avoid any genericity until we 
actually know how this will be used by other virtual IOMMUs.

>>>    const struct viommu_desc __read_mostly *cur_viommu;
>>> +/* Common function for adding to host_iommu_list */
>>> +void add_to_host_iommu_list(paddr_t addr, paddr_t size,
>>> +                            const struct dt_device_node *node)
>>
>> Is this supposed to only be called during __init? If so, this will help
>> to justify the ...
>>
>>> +{
>>> +    struct host_iommu *iommu_data;
>>> +
>>> +    iommu_data = xzalloc(struct host_iommu);
>>> +    if ( !iommu_data )
>>> +        panic("vIOMMU: Cannot allocate memory for host IOMMU data\n");
>>
>> ... panic(). If not, then this function needs to return an error.
>>
> 
> Yes, this is called during init, on pIOMMU driver probe 
> (arm_smmu_device_probe())
> 
>>> +
>>> +    iommu_data->addr = addr;
>>> +    iommu_data->size = size;
>>> +    iommu_data->dt_node = node;
>>> +    iommu_data->irq = platform_get_irq(node, 0);
>>> +    if ( iommu_data->irq < 0 )
>>> +    {
>>> +        gdprintk(XENLOG_ERR,
>>> +                 "vIOMMU: Cannot find a valid IOMMU irq\n");
>>
>> Shouldn't you free the allocated memory? That said, why is it ok to
>> ignore the vIOMMU in this case?
>>
> 
> Yes, this is missing. We ignore the host IOMMU with an invalid IRQ 
> because event queue emulation won't work in this case.

What you are telling me is that the vIOMMU emulation doesn't support the 
event queue. However, if the OS is able to probe/use an SMMU without the 
IRQ then we should support it.

Cheers,

-- 
Julien Grall


