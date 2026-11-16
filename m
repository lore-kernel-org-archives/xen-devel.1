Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB2C606A323
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 12:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gf4dKugX
Received: from list by lists.xenproject.org with outflank-mailman.1490812.1691773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSvRr-00014e-LO; Mon, 16 Nov 2026 12:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490812.1691773; Mon, 16 Nov 2026 12:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSvRr-00014X-Go; Mon, 16 Nov 2026 12:04:35 +0000
Received: by outflank-mailman (input) for mailman id 1490812;
 Mon, 16 Nov 2026 12:04:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1xSvRq-00014R-Ef
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 12:04:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSvRp-000Z7I-RB
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 13:04:33 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6afaf136-2eae-0a2a0a5409dd-0a2a450a8238-40
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 13:04:33 +0100
Received: from [209.85.167.50] (helo=mail-lf1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <olekstysh@gmail.com>)
 id 6afaf151-f2d2-0a2a450a0019-d155a732d11d-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 13:04:33 +0100
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5be4b61fd3dso2984793e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 04:04:33 -0800 (PST)
Received: from [192.168.0.114] ([91.123.151.27])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5c171347f49sm3138122e87.55.2026.11.16.04.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 04:04:32 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794830673; x=1795435473; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iIyxe8G+7bT8MqvDzDfBpxfnwQ9BulaNZkz7bKwPSVo=;
        b=gf4dKugXDD/osBJTjknl5DFyLSxHViiomTlkLjAtPypB7ux/6i2hCXVvDvKCdmzljk
         Q/HntI8eq0E8Yh+hb/tOP1Lf8NoZF+7GBFECFNYiFdkYMqL8cvzfBro2aXb0PkfM+g9t
         2Fzr9rx5pszg04VNvQI8mGlAFlZUFk1OV/PZAh/qtqdqTcf+z1sF5vs9WR7POXsyxmUT
         qNG/H3UaTZ2GpoW18KgijXztyVvDqoZSPJAA6RpNp6If+gak8ARhqlAaxMipBIDCTTrq
         OzUMfp013nICj7qIT+De9B+Kt5Zkm+RWjIJVwh7PyiRLGTd1nSfR4T33L8Yu2JOIYeOW
         T9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830673; x=1795435473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIyxe8G+7bT8MqvDzDfBpxfnwQ9BulaNZkz7bKwPSVo=;
        b=Ani6JXy9JLwiQpCL+Kjvzzjggx3PIyQWaMxy9lyt/3P/NYr0vrwopIEEhsSqyFcXO/
         cxA1yPEPrqPvDHMoKQYuVN6jFTEDRKTwjPgBqsYiWDTVI9toJrtWkwOpXD1/zdGKnkET
         dJ3B3+Q48tP5diniaJYYPp5C2h8TQiAtlgRCq7pqKOqLYGANeBWra6OMAPoSOy3cYxFo
         d0GtD9SvfM/oRUrcLf7ZHMB2XlO6+1+zviFsx6uDH6tIgliPdQZk1iSE23tLHgnu/lyE
         sBqmlL714AG+hoSX3FzSMt/aMEHAlaIioyZreCuM3XRI5miS7Q4bzWZVbJKfYfjrg86D
         zaIQ==
X-Forwarded-Encrypted: i=1; AL+hErEc+5T1mRX2lnrVegT1b/9k5IqN2MFiQmu4sr8hLNF7nvz2wZd4N34LEZbUL1jfhBnwUzaz3/abblY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/W4YYTHDxUxgqi6rR4qzmwP+GKP/qAJUqTlZCtt5Ul9nAoTXjd
	Dw7QaYfZTAK4YdOtkzTzvTO82+tDM3inCdfOzGL/jab1JgDZ6V6y0V3p
X-Gm-Gg: AYBFou2d6fvNVp5lM6oPuxMeQE7L6I70oHRONpwbkbNBaMKvuvNxvnbCxjwR04droXN
	SzHG9BExwdhuyWgUyKKt230YClg9XumrtAElOH5iM3PZrMkZoMVwSU9tOhLxygTUGMAfi99vXpb
	i8r7psOYSFNSygNA9Q7+lWOE7rpwIl2Gpii4/rqBS1ISrInNfrZnaGmWwthwtwxYimBayWsr5g2
	z7lrOMWIHpkrzaXd+ST1E6KZ6Wb7DTnXbS8Ni7VQyhKLi5uefWEtYgnMt9OzT8bNuzv+ypxK1l1
	kz54g1qOAfMTG9dN5z2uUjIdihw26kX+F61ZoL4+DUb0zVFJmhCW5pcop2Vx+8gr84L0yckzJp4
	D0/tS8kLMNjw0wtF8k+1zYWzVQfjW8nRwwT/kGFlrn9bVyobwtWuCaS9UR5mOs2Y+4MBKJl9YjQ
	pyGmMAt+Hhevu26csDhs6Ora/kMfCVZPf1CdtCIUSzOwAAkJ/XfYCuAZhRnGa+x6ga92+bl1AsU
	cD6XqxEUwWz9kiP5wyipYtKm6kiLO3JOdyOCAWzIH4iVK0f5MzWUh+tKbY6FuRov/hfJL53E57y
	draBrqIW3srKbcc4g1XxvJ3Mst7BrTI=
X-Received: by 2002:a05:6512:12c3:b0:5c1:5bc7:83c with SMTP id 2adb3069b0e04-5c1707ac06bmr3387172e87.53.1794830672799;
        Mon, 16 Nov 2026 04:04:32 -0800 (PST)
Message-ID: <4039731c-bbf6-43dd-b7b6-e4470fac68c7@gmail.com>
Date: Mon, 16 Nov 2026 14:04:30 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pci/rcar: Add support for Gen5 PCI host
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1794817300.git.mykyta_poturai@epam.com>
 <2871b83d934f6254fd593ff9fc75de03728b69ac.1794817300.git.mykyta_poturai@epam.com>
Content-Language: ru
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <2871b83d934f6254fd593ff9fc75de03728b69ac.1794817300.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1794830673-530D9CFC-26E02C23/0/0
X-purgate-type: clean
X-purgate-size: 3958
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



16.11.2026 10:40, Mykyta Poturai пишет:


Hello Mykyta

> Add support for Renesas R-Car Gen5 PCI host controller. This includes
> updating the device tree match table to recognize the new compatible
> string "renesas,rcar-gen5-pcie6" and ensuring that the OSID registers
> are only initialized when they are supported by the hardware.


NIT: It is not entirely precise, the code only skips the app range 
lookup and ioremap on Gen5. Nothing guards OSID initialisation. That is 
harmless, because only the IPMMU driver uses it and Gen5 uses SMMUv3.


> 
> Gen5 hosts do not expose the "app" register range, so only look it up
> on Gen4.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   xen/arch/arm/pci/pci-host-rcar.c | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/pci/pci-host-rcar.c b/xen/arch/arm/pci/pci-host-rcar.c
> index 5f184d5ebc..87b3ccbc1c 100644
> --- a/xen/arch/arm/pci/pci-host-rcar.c
> +++ b/xen/arch/arm/pci/pci-host-rcar.c
> @@ -17,6 +17,9 @@
>   
>   #define RCAR_DWC_VERSION     0x520A
>   
> +#define RCAR_GEN4    4
> +#define RCAR_GEN5    5
> +
>   /* PCIE BDF-OSID assignment */
>   #define CNVID(n)             (0x700 + ((n) * 4))
>   #define CNVID_CNV_EN         (1U << 31)
> @@ -87,8 +90,9 @@ static const struct pci_ecam_ops rcar_pcie_child_ops = {
>   };
>   
>   static const struct dt_device_match __initconstrel rcar_pcie_dt_match[] = {
> -    { .compatible = "renesas,r8a779f0-pcie" },
> -    { .compatible = "renesas,r8a779g0-pcie" },
> +    { .compatible = "renesas,r8a779f0-pcie", .data = (void *)RCAR_GEN4 },
> +    { .compatible = "renesas,r8a779g0-pcie", .data = (void *)RCAR_GEN4 },
> +    { .compatible = "renesas,rcar-gen5-pcie6", .data = (void *)RCAR_GEN5 },
>       {},
>   };
>   
> @@ -182,6 +186,7 @@ void rcar4_pcie_bdf_msk_set(struct pci_host_bridge *bridge, unsigned int reg_id,
>   static int __init pci_host_rcar_probe(struct dt_device_node *dev,
>                                         const void *data)
>   {
> +    const struct dt_device_match *match;
>       struct pci_host_bridge *bridge;
>       paddr_t app_phys_addr;
>       paddr_t app_size;
> @@ -194,6 +199,11 @@ static int __init pci_host_rcar_probe(struct dt_device_node *dev,
>       bridge = dw_pcie_host_probe(dev, data, &rcar_pcie_ops,
>                                   &rcar_pcie_child_ops);

Remark: The result of dw_pcie_host_probe() is not checked. On failure it 
returns an ERR_PTR ...


>   
> +    match = dt_match_node(rcar_pcie_dt_match, dev);
> +    ASSERT(match);

NIT: To be honest, I am not entirely sure why this assert is here. I 
assume it was copied from existing code. As far as I understand, 
dt_match_node() cannot fail here, because the device was already matched 
to reach the probe...

> +    if ( match->data != (void *)RCAR_GEN4 )
> +        goto skip_app;
> +
>       app_idx = dt_property_match_string(dev, "reg-names", "app");
>       if ( app_idx < 0 )
>       {
> @@ -218,6 +228,7 @@ static int __init pci_host_rcar_probe(struct dt_device_node *dev,
>       printk("APP at [mem 0x%" PRIpaddr "-0x%" PRIpaddr "]\n", app_phys_addr,
>              app_phys_addr + app_size - 1);
>   
> +skip_app:
>       dw_pcie_set_priv(bridge, priv);

  ... which dw_pcie_set_priv() then dereferences. This is pre-existing, 
so maybe better to fix it in prereq commit.

As for the current commit:
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


>       dw_pcie_set_version(bridge, RCAR_DWC_VERSION);
>   
> @@ -227,7 +238,7 @@ err:
>       return ret;
>   }
>   
> -DT_DEVICE_START(pci_gen, "PCI HOST R-CAR GEN4", DEVICE_PCI_HOSTBRIDGE)
> +DT_DEVICE_START(pci_gen, "PCI HOST R-CAR GEN4/GEN5", DEVICE_PCI_HOSTBRIDGE)
>   .dt_match = rcar_pcie_dt_match,
>   .init = pci_host_rcar_probe,
>   DT_DEVICE_END


