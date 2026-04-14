Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74724F9D0F1
	for <xen-devel@archiver.kernel.org>; Tue, 14 Apr 2026 20:24:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1282082.1564766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJK-0005T7-5J; Tue, 14 Apr 2026 20:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282082.1564766; Tue, 14 Apr 2026 20:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJK-0005Sy-2E; Tue, 14 Apr 2026 20:24:38 +0000
Received: by outflank-mailman (input) for mailman id 1282082;
 Tue, 14 Apr 2026 20:24:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wCkJJ-0005SC-9G
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 20:24:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJI-001nTE-26;
 Tue, 14 Apr 2026 20:24:36 +0000
Received: from [2a02:8012:3a1:0:6452:fdce:8dbd:9a39]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJI-0036wi-1c;
 Tue, 14 Apr 2026 20:24:36 +0000
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
	bh=AHmYUvmIYyfh5dRdTCNsTASPX/XO0DclUvr2J8d1xqM=; b=lThJrqOcegsEXtTr6iPEIVDwSl
	AIg2Z01fKfPv9R6h+0nvE+Cj/4hW0RxrG3E1JeP947CLaXQlWpdNAX5hGFNY4VxRAvG6XhxGF4w+f
	W2zSDQI3bZq6zlaNb6f87neV/GjdgB2IGr/J7yRCdAIOVrQ93yVnwsuh/zqL5b1eHn+I=;
Message-ID: <cfe13725-971c-4a25-9d47-f3f80b4cf318@xen.org>
Date: Tue, 14 Apr 2026 15:19:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/23] xen/arm: vIOMMU: add generic vIOMMU framework
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Milan Djokic <milan_djokic@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <c12f84b9306a2b74a555c710f21f5362120205ed.1774918270.git.milan_djokic@epam.com>
 <93490E9C-4D22-4EAB-965E-B20DA8189C60@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <93490E9C-4D22-4EAB-965E-B20DA8189C60@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/04/2026 19:41, Luca Fancellu wrote:
> Hi Milan,
> 
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 94b9858ad2..241f87386b 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -28,6 +28,7 @@
>> #include <asm/tee/tee.h>
>> #include <asm/vfp.h>
>> #include <asm/vgic.h>
>> +#include <asm/viommu.h>
>> #include <asm/vtimer.h>
>>
>> #include "vpci.h"
>> @@ -550,6 +551,14 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>          return -EINVAL;
>>      }
>>
>> +    /* Check config structure padding */
>> +    if ( config->arch.pad )
>> +    {
>> +        dprintk(XENLOG_INFO,
>> +            "Invalid input config, padding must be zero\n");
>> +        return -EINVAL;
>> +    }
>> +
> 
> This feels ok but unrelated to the patch

In general, we want to have padding explictly define and zeroed. I 
wouldn't mind if this is kept in this patch but this would need to be 
mentioned in the commit message.

> , but also the text maybe should be something like “Invalid domain configuration during domain creation\n”.
> 
>>      /* Check feature flags */
>>      if ( sve_vl_bits > 0 )
>>      {
>> @@ -626,6 +635,21 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>          return -EINVAL;
>>      }
>>
>> +    if ( !(config->flags & XEN_DOMCTL_CDF_iommu) &&
>> +         config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +    {
>> +        dprintk(XENLOG_INFO,
>> +                "vIOMMU requested while iommu not enabled for domain\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
>> +    {
>> +        dprintk(XENLOG_INFO,
>> +                "vIOMMU type requested not supported by the platform or Xen\n");
>> +        return -EINVAL;
>> +    }
>> +
>>      return sci_domain_sanitise_config(config);
>> }
>>
>> @@ -721,6 +745,9 @@ int arch_domain_create(struct domain *d,
>>      if ( (rc = sci_domain_init(d, config)) != 0 )
>>          goto fail;
>>
>> +    if ( (rc = domain_viommu_init(d, config->arch.viommu_type)) != 0 )
>> +        goto fail;
>> +
>>      return 0;
>>
>> fail:
>> @@ -965,6 +992,7 @@ enum {
>>      PROG_pci = 1,
>>      PROG_sci,
>>      PROG_tee,
>> +    PROG_viommu,
>>      PROG_xen,
>>      PROG_page,
>>      PROG_mapping,
>> @@ -1021,6 +1049,11 @@ int domain_relinquish_resources(struct domain *d)
>>          if (ret )
>>              return ret;
>>
>> +    PROGRESS(viommu):
>> +        ret = viommu_relinquish_resources(d);
>> +        if (ret )
>> +            return ret;
>> +
>>      PROGRESS(xen):
>>          ret = relinquish_memory(d, &d->xenpage_list);
>>          if ( ret )
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index e8795745dd..a51563ee3d 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -35,6 +35,7 @@
>> #include <asm/arm64/sve.h>
>> #include <asm/cpufeature.h>
>> #include <asm/domain_build.h>
>> +#include <asm/viommu.h>
> 
> NIT: In my local branch I’ve rebased this on top of new staging
> 
>>
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>> index cd563cf706..d4953d40fd 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -330,6 +330,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>> #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
>> #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
>>
>> +#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
>> +
>> struct xen_arch_domainconfig {
>>      /* IN/OUT */
>>      uint8_t gic_version;
>> @@ -355,6 +357,9 @@ struct xen_arch_domainconfig {
>>      uint32_t clock_frequency;
>>      /* IN */
>>      uint8_t arm_sci_type;
>> +    /* IN */
>> +    uint8_t viommu_type;
>> +    uint16_t pad;
> 
> Having the padding explicit feels ok to me, but I would rely on maintainer
> choice.

See above. To expand what I wrote, if we don't define the padding 
explicitly and then check against zero, then we can't re-use them 
without breaking the ABI. So...

> 
>> };
>> #endif /* __XEN__ || __XEN_TOOLS__ */
>>
>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>> index 8f6708c0a7..23124547f3 100644
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -30,9 +30,9 @@
>>   * fields) don't require a change of the version.
>>   * Stable ops are NOT covered by XEN_DOMCTL_INTERFACE_VERSION!
>>   *
>> - * Last version bump: Xen 4.19
>> + * Last version bump: Xen 4.22
>>   */
>> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
>> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000018
> 
> I don’t think the changes in this patch are breaking the ABI, so this should not be bumped;
> said so, I would rely on @Andrew or another maintainer for this

... this is needed because older toolstack may not zero the field.

Cheers,

-- 
Julien Grall


