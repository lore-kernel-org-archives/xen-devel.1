Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8094ECA6019
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 11:42:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444284.1661229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF8yu-0004O6-37; Fri, 09 Oct 2026 11:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444284.1661229; Fri, 09 Oct 2026 11:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF8yu-0004Nz-0P; Fri, 09 Oct 2026 11:41:44 +0000
Received: by outflank-mailman (input) for mailman id 1444284;
 Fri, 09 Oct 2026 11:41:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xF8ys-0004Ns-GQ
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 11:41:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xF8yr-001Ytt-Pp
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 13:41:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6ac8d2e4-e002-0a2a0a5209dd-0a2a45099a38-48
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 13:41:41 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6ac8d2f5-be1a-0a2a45090019-d155802cb0b6-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 13:41:41 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a0213948d3so24995415e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 04:41:41 -0700 (PDT)
Received: from [192.168.0.114] ([91.123.150.146])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf135fasm46955185e9.5.2026.10.09.04.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 04:41:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791546101; x=1792150901; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1vtJyHxi9TImrGC6xqZu5sra+7jmxwQQAbeO8lJtZQ=;
        b=tFf8k9v0eJGF5YRmb7PBtDVL7hG1dF10kJq82NKToBPb7gLQ/iRJi2mNN+TSDEOzJI
         BjUs4PosCYIgIn4JP0tOs4ygoEuLfSplKGtwcBn8xbVIgZm98xYb4SHCE5yPZZbMI526
         HmBWVLSGo1TvKvn4u+/utq8Ceo9NEZAQp1XX9HWLg7MAHucYO6jroz2SqGnxqa3WujJn
         OhOSEvlY5t0oiK8j+Hlk33YLZLwMCMgRFsUoSb22hwydrIqE8yIrgPkBHuMKtxSoYvGB
         apa3zDzNYXmnOLSoRM/72wOng2iRtFt9K1GBVehuLBumko5aGbpU1hTWl4ms5pzaBg1I
         Vevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791546101; x=1792150901;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1vtJyHxi9TImrGC6xqZu5sra+7jmxwQQAbeO8lJtZQ=;
        b=2eoQxCD/SbdHn+X95ljZNWQkptZWCPUsudMDOS/+T+sncc2pCLjAcXeOHWIkeffxYS
         pii0FCckAMEOjqnhWxQhIGbsY1//nF2zCyi//vDKEhTFXFUjPyeVxwA8YPtT9BqtpCUj
         P+WtXskLrt2/y5+Pzd8Ukpo+h9KRjp/KrXRyo5ghB+Azx+YzMa7np5OWcZuzTsYx/Q38
         U2xCriY90k+goRpszUAkQoBQqR/9zHuO0TtcXF+UyW0Ci/0sAdzBUWX96x7q+oXI5uu7
         yuK/C9uwoZtJSPF4ITqxKboEAFHkFmK1hsyrGNTt9ul0x4bob1tNjiz06f51AkBY41kU
         HLQA==
X-Forwarded-Encrypted: i=1; AKwUvBxpFndD1tA15L/Vwa426mKb+yOYvAOFLR3KbqGhXhLlI97mkbKIYgMKYoGMgwwKQt7wC4d0Y7+nnDE=@lists.xenproject.org
X-Gm-Message-State: AFuF++kcZzXGJLWAt4urtnYaICKISY9M3tHVrlOT3IKf69TtjrUMKHQ3
	ihopbmA2dvPJ3vCBV+9vOeDP5I/JN72cWxRmVjf4Of86WD/yDtTDrabj
X-Gm-Gg: AYBFou0UyIE38eAyU8ipxL+ha/5O3O/NpnpisWqD8hihq/l2R6PW7fJ7jX4Aed+Ba1H
	xC4uR1ASuU+McDjTZASpKW+70t542aCQjrIw5Hoa9N8rKA9JjYTq6fO7WLgoqtBNMy+aeaxRrb3
	Ux4Miwktg4gft09Kg8ghfZjHxaTkmUvKfARSx4PCWxVDlVeQtXMOk9Rw8RhDeyYGlZm1sCWePz+
	5g7BnJ3nv6GUroy7dcvzN23x7XNhESi+N9GMsZ9FJuYljljKPc/EQmnBOTocBHdtyFr8nk2FeOW
	3iWgSLJup1ZZKH+h4xdv5+EEd0Ng7om4EFFTEv7dk7xaK8L7MlxgwRGYpl61C+Gvcd9E0+kRvD6
	QcqnCTP8ExHgBp3wpS+jYqKplc2wBhaS5OShBISzfOWi1LfUELp/K2sB3WRkQwfJKeWZqdSlovF
	f4TgHaIX7DykUr10AIdsbFXzLDwJQmH6s8wylsDCC2Q1VLTw+Ho0XcN+a5JHP2LNDh5LHQSTSh5
	Tg=
X-Received: by 2002:a05:600c:3ba5:b0:4a1:70d4:c69 with SMTP id 5b1f17b1804b1-4a18e4c03bbmr33938215e9.28.1791546101013;
        Fri, 09 Oct 2026 04:41:41 -0700 (PDT)
Message-ID: <144fe444-39ef-456b-9fd4-747c0abc02c5@gmail.com>
Date: Fri, 9 Oct 2026 14:41:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/22] xen/arm: vIOMMU: add generic vIOMMU framework
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
 <6c7570f50af7ebaae8aa709db86959dbd09e1f82.1791328190.git.milan_djokic@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <6c7570f50af7ebaae8aa709db86959dbd09e1f82.1791328190.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1791546101-BF8D1034-FDDD29F8/0/0
X-purgate-type: clean
X-purgate-size: 10715



On 10/7/26 03:06, Milan Djokic wrote:

Hello Milan


> From: Rahul Singh <rahul.singh@arm.com>
> 
> This patch adds basic framework for vIOMMU.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/arch/arm/dom0less-build.c        |  2 +
>   xen/arch/arm/domain.c                | 31 +++++++++++-
>   xen/arch/arm/domain_build.c          |  2 +
>   xen/arch/arm/include/asm/viommu.h    | 70 ++++++++++++++++++++++++++++
>   xen/drivers/passthrough/Kconfig      |  5 ++
>   xen/drivers/passthrough/arm/Makefile |  1 +
>   xen/drivers/passthrough/arm/viommu.c | 49 +++++++++++++++++++
>   xen/include/public/arch-arm.h        |  6 ++-
>   8 files changed, 164 insertions(+), 2 deletions(-)
>   create mode 100644 xen/arch/arm/include/asm/viommu.h
>   create mode 100644 xen/drivers/passthrough/arm/viommu.c
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 3f48f74226..f87437915e 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -23,6 +23,7 @@
>   #include <asm/arm64/sve.h>
>   #include <asm/domain_build.h>
>   #include <asm/firmware/sci.h>
> +#include <asm/viommu.h>
>   #include <asm/grant_table.h>
>   #include <asm/setup.h>
>   
> @@ -369,6 +370,7 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>       uint32_t val;
>   
>       d_cfg->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
> +    d_cfg->arch.viommu_type = viommu_get_type();
>       d_cfg->flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
>   
>       if ( domu_dt_sci_parse(node, d_cfg) )
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index a739dd157e..5c411a2310 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -33,6 +33,7 @@
>   #include <asm/vgic.h>
>   #include <asm/vpci.h>
>   #include <asm/vpsci.h>
> +#include <asm/viommu.h>
>   #include <asm/vtimer.h>
>   
>   #include "vuart.h"
> @@ -663,6 +664,21 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>           return -EINVAL;
>       }
>   
> +    if ( !(config->flags & XEN_DOMCTL_CDF_iommu) &&
> +         config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "vIOMMU requested while iommu not enabled for domain\n");
> +        return -EINVAL;
> +    }


I might miss something, but if CONFIG_ARM_VIRTUAL_IOMMU=y and we have 
SMMUv3 the dom0less domains "without passthrough" will fail to build.

arch_parse_dom0less_node() sets viommu_type for every guest. But 
CDF_iommu is only set when passthrough = "enabled" or the node has a 
multiboot DTB. So a plain guest without passthrough is therefore 
rejected here.



> +
> +    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "vIOMMU type requested not supported by the platform or Xen\n");
> +        return -EINVAL;
> +    }
> +
>       return sci_domain_sanitise_config(config);
>   }
>   
> @@ -762,6 +778,9 @@ int arch_domain_create(struct domain *d,
>       if ( (rc = sci_domain_init(d, config)) != 0 )
>           goto fail;
>   
> +    if ( (rc = domain_viommu_init(d, config->arch.viommu_type)) != 0 )
> +        goto fail;
> +
>       return 0;
>   
>   fail:
> @@ -822,7 +841,8 @@ static void resume_ctx_reset(struct resume_info *ctx)
>   void arch_domain_destroy(struct domain *d)
>   {
>       resume_ctx_reset(&d->arch.resume_ctx);
> -
> +    if ( viommu_relinquish_resources(d) )
> +        printk(XENLOG_INFO "%pd: Domain vIOMMU teardown failed\n", d);
>       tee_free_domain_ctx(d);
>       /* IOMMU page table is shared with P2M, always call
>        * iommu_domain_destroy() before p2m_final_teardown().
> @@ -1058,6 +1078,7 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
>    */
>   enum {
>       PROG_pci = 1,
> +    PROG_viommu,
>       PROG_sci,
>       PROG_tee,
>       PROG_xen,
> @@ -1105,6 +1126,14 @@ int domain_relinquish_resources(struct domain *d)
>           if ( ret )
>               return ret;
>   #endif
> +    /*
> +     * PCI devices may rely on the vIOMMU, so its resources
> +     * should be relinquished only after the PCI devices are released.
> +     */
> +    PROGRESS(viommu):
> +        ret = viommu_relinquish_resources(d);
> +        if (ret )
> +            return ret;
>   
>       PROGRESS(sci):
>           ret = sci_relinquish_resources(d);
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 72d5316180..cd2e09f005 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -36,6 +36,7 @@
>   #include <asm/arm64/sve.h>
>   #include <asm/cpufeature.h>
>   #include <asm/domain_build.h>
> +#include <asm/viommu.h>
>   #include <xen/event.h>
>   
>   #include <xen/irq.h>
> @@ -1964,6 +1965,7 @@ void __init create_dom0(void)
>       dom0_cfg.arch.nr_spis = vgic_def_nr_spis();
>       dom0_cfg.arch.tee_type = tee_get_type();
>       dom0_cfg.max_vcpus = dom0_max_vcpus();
> +    dom0_cfg.arch.viommu_type = viommu_get_type();
>   
>       if ( iommu_enabled )
>           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
> new file mode 100644
> index 0000000000..95f82d9cf5
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/viommu.h
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +#ifndef __ARCH_ARM_VIOMMU_H__
> +#define __ARCH_ARM_VIOMMU_H__
> +
> +#include <xen/lib.h>
> +#include <xen/types.h>
> +#include <public/xen.h>
> +
> +struct viommu_ops {
> +    /*
> +     * Called during domain construction if toolstack requests to enable
> +     * vIOMMU support.
> +     */
> +    int (*domain_init)(struct domain *d);
> +
> +    /*
> +     * Called during domain destruction to free resources used by vIOMMU.
> +     */
> +    int (*relinquish_resources)(struct domain *d);
> +};
> +
> +struct viommu_desc {
> +    /* vIOMMU domains init/free operations described above. */
> +    const struct viommu_ops *ops;
> +
> +    /*
> +     * ID of vIOMMU. Corresponds to xen_arch_domainconfig.viommu_type.
> +     * Should be one of XEN_DOMCTL_CONFIG_VIOMMU_xxx
> +     */
> +    uint8_t viommu_type;
> +};
> +
> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
> +
> +int domain_viommu_init(struct domain *d, uint8_t viommu_type);
> +int viommu_relinquish_resources(struct domain *d);
> +uint8_t viommu_get_type(void);
> +
> +#else
> +
> +static inline uint8_t viommu_get_type(void)
> +{
> +    return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
> +}
> +
> +static inline int domain_viommu_init(struct domain *d, uint8_t viommu_type)
> +{
> +    if ( likely(viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE) )
> +        return 0;
> +
> +    return -ENODEV;
> +}
> +
> +static inline int viommu_relinquish_resources(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +#endif /* CONFIG_ARM_VIRTUAL_IOMMU */
> +
> +#endif /* __ARCH_ARM_VIOMMU_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index b413c33a4c..a92cfbea98 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -35,6 +35,11 @@ config IPMMU_VMSA
>   	  (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage 2
>   	  translation table format and is able to use CPU's P2M table as is.
>   
> +config ARM_VIRTUAL_IOMMU
> +	bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
> +	help
> +	  Support virtual IOMMU infrastructure to implement vIOMMU.
> +
>   endif
>   
>   config AMD_IOMMU
> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough/arm/Makefile
> index c5fb3b58a5..c3783188e3 100644
> --- a/xen/drivers/passthrough/arm/Makefile
> +++ b/xen/drivers/passthrough/arm/Makefile
> @@ -2,3 +2,4 @@ obj-y += iommu.o iommu_helpers.o iommu_fwspec.o
>   obj-$(CONFIG_ARM_SMMU) += smmu.o
>   obj-$(CONFIG_IPMMU_VMSA) += ipmmu-vmsa.o
>   obj-$(CONFIG_ARM_SMMU_V3) += smmu-v3.o
> +obj-$(CONFIG_ARM_VIRTUAL_IOMMU) += viommu.o
> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
> new file mode 100644
> index 0000000000..0c0efd668e
> --- /dev/null
> +++ b/xen/drivers/passthrough/arm/viommu.c
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/types.h>
> +
> +#include <asm/viommu.h>
> +
> +/* Struct to hold the vIOMMU ops and vIOMMU type */
> +static const struct viommu_desc __ro_after_init *cur_viommu;
> +
> +int domain_viommu_init(struct domain *d, uint8_t viommu_type)
> +{
> +    if ( viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> +        return 0;
> +
> +    if ( !cur_viommu )
> +        return -ENODEV;
> +
> +    if ( cur_viommu->viommu_type != viommu_type )
> +        return -EINVAL;
> +
> +    return cur_viommu->ops->domain_init(d);
> +}
> +
> +int viommu_relinquish_resources(struct domain *d)
> +{
> +    if ( !cur_viommu )
> +        return 0;
> +
> +    return cur_viommu->ops->relinquish_resources(d);
> +}
> +
> +uint8_t viommu_get_type(void)
> +{
> +    if ( !cur_viommu )
> +        return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
> +
> +    return cur_viommu->viommu_type;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 00de30b896..a1491f9cf7 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -334,6 +334,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>   #define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA    1
>   #define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA    2
>   
> +#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
> +
>   struct xen_arch_domainconfig {
>       /* IN/OUT */
>       uint8_t gic_version;
> @@ -361,7 +363,9 @@ struct xen_arch_domainconfig {
>       uint8_t arm_sci_type;
>       /* IN */
>       uint8_t v8r_el1_msa;
> -    uint16_t pad;
> +    /* IN */
> +    uint8_t viommu_type;
> +    uint8_t pad;
>   };
>   #endif /* __XEN__ || __XEN_TOOLS__ */
>   


