Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128A7F9EDC9
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2026 13:24:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1290553.1570118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXYU-0000zd-S7; Wed, 22 Apr 2026 13:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290553.1570118; Wed, 22 Apr 2026 13:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXYU-0000zT-OZ; Wed, 22 Apr 2026 13:23:50 +0000
Received: by outflank-mailman (input) for mailman id 1290553;
 Wed, 22 Apr 2026 13:23:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wFXYS-0000z2-Uo
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:23:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFXYS-00EvsZ-Ba
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:23:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 69e8cbd9-bab6-0a2a0a5309dd-0a2a4501a3da-28
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:23:48 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <olekstysh@gmail.com>)
 id 69e8cbe4-c1f2-0a2a45010019-d1558034e8e5-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:23:48 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so43640625e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 06:23:48 -0700 (PDT)
Received: from [192.168.0.112] ([91.123.151.42])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48919f54572sm100493985e9.26.2026.04.22.06.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 06:23:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776864228; x=1777469028; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0CSJXqi+NNpnhRUP92imoxfIAnz+2xe96byWgVzB3gA=;
        b=pPzt/zXLeVyChbIhLNz1sShHQSrOuyIJuVxmbpfn5E49/dn9fNtNYidC/P5JKIfqTH
         nmt4C4nzFO5bjaxA0Xqw5b/mUtYrpVHI4lCGOrZL1O9yjLEPvWISNeIQjQ1tHBz9Bfbg
         W9RJSJbXW3LOXN1lrHGKr4AmEt5Hg/+bx3IEhk+dUnVo0blZWSSvZ2/emFlA/ejbLV46
         XlgG+5xtvc3aqD+4xHY3xwZzI+ut3EwaEJFob46z2CWkYPrSq81j3HvMH9V/aWt7ZaYF
         RCJhnnPQPyFFl53KWspt2DOgOQlP82x/n9d30dV8RwlqurOspeqe779DNvekQIn8dici
         GTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776864228; x=1777469028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CSJXqi+NNpnhRUP92imoxfIAnz+2xe96byWgVzB3gA=;
        b=qGTZtvwpyiBXonrzVEd2xDMS6+B9/c9r1NEnGy0VuFtrNGD1CXJutDITJhvL4E3txC
         lqldhp+34+lsJ9aQGTA9641kClsZXF0l33dB2HflGiD2yUrmWT8B23s/ppEpMccphgUi
         XG1kJ1qpGbN6ikvZ8WFKOI+v4oLQZITexfNunHF18D+7bbn69crX22Ouy3H8axx0Pt/q
         N+ct3kq3oZsTEZpxPIWIqBgtsXXezTWY8fkjztBOiQ2yn1AYqaOT8EfESVLHzq2A6VTy
         K52Vg1DL77/a7ny70HtVg9s/eQB/5iV0SAt4Ob6gxKYJgwqjUJrelWoHXJ2PDdUafOpr
         4mMw==
X-Forwarded-Encrypted: i=1; AFNElJ/fiGlRwTruF2WcyqEQ1VW7hCIyr5Tw0F6CFRsmTonGvf5r7Qn1z/PXs7fBpEqvXHgWatkvE945zLo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZ/H5Cw9db5l7lVN1AmuomvBFAS2XnPQn6ZwY7Wy9pLu4UoPvy
	GdvuInE0AFgOH4id+qwxXS+j6VY7RJcWqCWv4q2cpRNMSe92VxO7oQ8O
X-Gm-Gg: AeBDievGgD3qJbN2aR/NrjcScKNRDiFDkEPjrBCDMXSNvj15OpnR/62d3s6wbuM4rcS
	0uy5UKU4PJAt0KY9rw/ArXlDbdcIlzIivxmG43KJniVW2b9tf1oT5QQrnvluLAXUZKOwyWXBpV/
	TD5GSMUsgZK5izT7L2MRd6HlcuMgRy3eCJ6vSS6E3Mtp/+V1HGMLzDLRdKtXaYmv9YpPVohHZx2
	3q0/mZlt7bYKslMG0E90er78qeEvaamemT7AwJH7CwLPOzBgHdeXSlvv+9dIiAGZEYcQQw7Oj1g
	KHxmDgmyikEroEgGgJ5B51Ix3xnxI3CfM7qy5gVS1d9e0ohWMnZ1/R7DUnCTy01BkLTuJoc86aq
	FA1pX7BuOTi4ClkaskCbRAUOQJtB8+tfLi4LGRTyt1wjM4VfgurNKj3hAJ4Iy8gEIy+kCzfwCi3
	ZlhlEdmVLIpxCroaiTZMl88gfOG1kfwoUhsbHYJqypZZfu6Jw=
X-Received: by 2002:a05:600c:4f0c:b0:489:1c1f:35e6 with SMTP id 5b1f17b1804b1-4891c1f38c8mr203621665e9.6.1776864227400;
        Wed, 22 Apr 2026 06:23:47 -0700 (PDT)
Message-ID: <f28e9fa5-66fb-4c80-b616-2a9b3226d8be@gmail.com>
Date: Wed, 22 Apr 2026 16:23:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] plat/rcar: Add region id support for PCI
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1776756291.git.mykyta_poturai@epam.com>
 <ad5caa92e36b0e0f104a14b46396037505080f4f.1776756291.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <ad5caa92e36b0e0f104a14b46396037505080f4f.1776756291.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1776864228-BFE7BFF4-D12484CF/0/0
X-purgate-type: clean
X-purgate-size: 5774



On 4/21/26 10:57, Mykyta Poturai wrote:

Hello Mykyta

> With Region ID enabled, all CPU memory accesses need to have rgid bits
> set in the physical address. This creates a problem for PCI BAR
> accesses, as it would require all BARs to be 64bit. Implement fixup_bar
> callback to add rgid bits to the address before mapping it to the
> guests.

For context. When Region ID support is enabled, the RGID value is 
encoded in the upper bits of physical addresses for both RAM and device 
MMIO in host device tree. From Xen's perspective, these are just regular 
physical addresses, and ideally Xen should not need to be RGID-aware at 
all. But I understand what this series is trying to solve.

It is worth mentioning that when Region ID support is enabled, there 
will be no 32-bit addresses in the host device tree anymore, since 
encoding the RGID effectively moves every address beyond the 4GB 
boundary (unless the RGID is 0). This might break any code in Xen that 
relies on 32-bit address space for some reason, e.g. 
HOST_ITS_WORKAROUND_32BIT_ADDR which requires 32-bit addresses for 
in-memory data structures (refer gicv3_its_enable_quirk_gen4()).


> 
> Add Kconfig options to enable region id support and set the rgid value
> and physical address space size.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   xen/arch/arm/pci/pci-host-rcar4.c | 15 +++++++++++++++
>   xen/arch/arm/platforms/Kconfig    | 21 +++++++++++++++++++++
>   2 files changed, 36 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-rcar4.c
> index e1e8eb0ee1..50400c04c4 100644
> --- a/xen/arch/arm/pci/pci-host-rcar4.c
> +++ b/xen/arch/arm/pci/pci-host-rcar4.c
> @@ -43,6 +43,12 @@ struct rcar4_pcie_priv {
>       DECLARE_BITMAP(osid_regs, NUM_OSID_REGS);
>   };
>   
> +#define ULL(X) _AC(X, ULL)
> +#define MADDR_RGID(a)    (ULL(a) << CONFIG_RCAR_PA_BITS)
> +#define MADDR_PA_MASK    ((1ULL << CONFIG_RCAR_PA_BITS) - 1)

NIT: MADDR_PA_MASK is defined but never used ...

> +
> +#define MADDR_ENCODE_RGID(a)    (MADDR_RGID(CONFIG_RCAR_RGID) | (a))
> +
>   /*
>    * PCI host bridges often have different ways to access the root and child
>    * bus config spaces:
> @@ -61,6 +67,14 @@ static int __init rcar4_child_cfg_reg_index(struct dt_device_node *np)
>       return dt_property_match_string(np, "reg-names", "config");
>   }
>   
> +static void rcar4_pcie_fixup_bar(struct pci_host_bridge *bridge,
> +                                 unsigned int bar_num,
> +                                 paddr_t *addr)
> +{
> +    if ( IS_ENABLED(CONFIG_RCAR_REGION_ID_SUPPORT) )
> +        *addr = MADDR_ENCODE_RGID(*addr);
> +}
> +
>   /* ECAM ops */
>   static const struct pci_ecam_ops rcar4_pcie_ops = {
>       .bus_shift  = 20,
> @@ -71,6 +85,7 @@ static const struct pci_ecam_ops rcar4_pcie_ops = {
>           .write                  = pci_generic_config_write,
>           .need_p2m_hwdom_mapping = pci_ecam_need_p2m_hwdom_mapping,
>           .init_bus_range         = pci_generic_init_bus_range,
> +        .fixup_bar              = rcar4_pcie_fixup_bar,
>       }
>   };
>   
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index 888d0b85d5..db096952c8 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -64,6 +64,27 @@ config NO_PLAT
>   
>   endchoice
>   
> +menu "RCar Region ID Support"
> +    visible if RCAR4
> +
> +config RCAR_REGION_ID_SUPPORT
> +	bool "Renesas Region ID support for R-Car Gen4 platforms" if EXPERT
> +	depends on RCAR4
> +	help
> +	  Enable experimental Region ID support for R-Car Gen4 platforms
> +
> +config RCAR_RGID
> +	int "Region ID encoded in physical address"
> +	depends on RCAR_REGION_ID_SUPPORT
> +	default 0
> +
> +config RCAR_PA_BITS
> +	int "Physical address space size"
> +	depends on RCAR_REGION_ID_SUPPORT
> +	default 36

Options RCAR_RGID and RCAR_PA_BITS lack range constraints. A 
misconfigured options might cause undefined shift behavior at compile 
time. However, I see a valid request in a separate email to consider 
using a firmware table to pass these values, so just ignore this comment.

*****

I was wondering whether the RGID could be extracted at runtime from an
address that already carries it. Do addresses in the host device tree 
(e.g., device MMIO ranges, host bridge windows, etc) already contain 
RGID bits? If so, then in rcar4_pcie_fixup_bar() you could obtain the 
RGID from the bridge instance that is already passed as a parameter.

Something like below:

#define MADDR_GET_RGID(addr)  ((addr) >> CONFIG_RCAR_PA_BITS)

paddr_t rgid = 
MADDR_GET_RGID(bridge->some_hw_addr_as_it_is_specified_in_dt);
*addr = (rgid << CONFIG_RCAR_PA_BITS) | (*addr & MADDR_PA_MASK);

This would eliminate CONFIG_RCAR_RGID entirely by deducing it from
existing platform data rather than requiring it to be passed explicitly
via the device tree.

As for CONFIG_RCAR_PA_BITS, I think it could remain as-is since it is
constant across an SoC generation, unless I am mistaken. As far as I am 
aware, on Gen4 the RGID occupies 4 bits (0–15) starting at bit 36, and 
on Gen5 it occupies 5 bits (0–31) starting at bit 43.
Since Xen can identify the hardware it is running on (thanks to the 
compatible string), the appropriate #define-s could be applied.

Would the above approach work, or is it better to pass all these values 
explicitly?

Please note, I am not 100% sure whether this is the right and reliable 
approach, but it should be considered.



> +
> +endmenu
> +
>   config ALL64_PLAT
>   	bool
>   	default (ALL_PLAT && ARM_64)


