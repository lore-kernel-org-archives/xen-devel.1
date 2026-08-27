Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B182DC61DC4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 18:10:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401344.1637053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzeY8-00061z-OG; Thu, 27 Aug 2026 18:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401344.1637053; Thu, 27 Aug 2026 18:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzeY8-00061H-Jg; Thu, 27 Aug 2026 18:10:04 +0000
Received: by outflank-mailman (input) for mailman id 1401344;
 Thu, 27 Aug 2026 18:10:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wzeY7-0005iw-4w
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 18:10:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzeY6-00CBKN-Hw
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 20:10:02 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a907d40-e002-0a2a0a5209dd-0a2a4509da8c-42
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 20:10:02 +0200
Received: from [165.173.182.51] (helo=sender5-of-o51.zoho.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a907d78-be1a-0a2a45090019-a5adb6339121-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 20:10:01 +0200
Received: by mx.zohomail.com with SMTPS id 1787854193486239.0961610665347;
 Thu, 27 Aug 2026 11:09:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=zoho header.d=apertussolutions.com header.i="dpsmith@apertussolutions.com" header.h="Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:Content-Type:Content-Transfer-Encoding"
ARC-Seal: i=1; a=rsa-sha256; t=1787854195; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gaUi/noafF/XHyT/0unlRfX2UzfFK1aS5zyUDS/dUERlZPWMz/SHXuPUt+l607Ddb7Lbw4vo2aODBrDS1MDuSRqSi7Oqt7CymE1BKN5yVO/JBBKklhiw3BwbVUQ0dYiC0msmfUsm59J29v5o3JupZpxVXkhLewQcqMBBWMHAp7o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787854195; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=s/MMjONvpKuV7PnAc6VJr6YSsk2zhvpqMRKavBhEDD0=; 
	b=oMFxqqj7A2Rt06m3zPuq5hVVCcpOMG9UlCBvu/XHU4xOyPnDMayrHHaLPKVcynLpnh6GBlxGxpl6audV5jimBqams1+AMngCtXgAW1IfJ3y+HyOs4mE25QIS/QkmB1AM+p+apaca0Cb/bVpcy33DBPezwk/770vw1PlGInZOxho=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787854195;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=s/MMjONvpKuV7PnAc6VJr6YSsk2zhvpqMRKavBhEDD0=;
	b=LeHJKKQanCci1jXOaV2mMIAP2gnfSBuEkWTohOyBTe3hmr9RrU0lnkBeur9BF88E
	FAeuvea/8C7cSd4lI+lvc5thkjPkSXu7a3Siy2vKE4KG6DC/lrF8diPetHuYeLsdk/C
	369Jl15QM0ducu2uxLutWc5bAPl/F4O5SdPJec1g=
Message-ID: <35391c92-c01d-43d5-b89a-7eb086a292a5@apertussolutions.com>
Date: Thu, 27 Aug 2026 14:09:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] common: dom0less-bindings: introduce XSM labels
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1787821757.git.Sergiy_Kibrik@epam.com>
 <e97ab666be0d667dc823c3d881ac9ed76267a7a5.1787821757.git.Sergiy_Kibrik@epam.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <e97ab666be0d667dc823c3d881ac9ed76267a7a5.1787821757.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-bad1c0/1787854202-BC4CB034-61C33FA1/0/0
X-purgate-type: clean
X-purgate-size: 3970

On 8/27/26 5:38 AM, Sergiy Kibrik wrote:
> Add "seclabel" property to be able to specify security label for a domain
> when XSM Flask is enabled, similar to xl configuration files.
> 
> Currently guest domain can't be created by Xen in dom0less configuration when
> Flask is enabled, as domain is assigned "system_u:system_r:unlabeled_t" label
> by default, which Flask denies to create according to current policy.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>   docs/misc/arm/device-tree/booting.txt      |  8 ++++++++
>   xen/common/device-tree/Makefile            |  2 ++
>   xen/common/device-tree/dom0less-bindings.c | 11 +++++++++++
>   3 files changed, 21 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index bcb06bc796..fcc7be0ffb 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -345,6 +345,12 @@ with the following properties:
>       not passed. This configuration requires static allocation (xen,static-mem)
>       and direct mapping (direct-map).
>   
> +- seclabel
> +
> +    A string property specifying an XSM security label to this domain. Effective
> +    only when FLASK is enabled. Domains will be classified “unlabeled” if
> +    this property not specified.
> +
>   Under the "xen,domain" compatible node, one or more sub-nodes are present
>   for the DomU kernel and ramdisk.
>   
> @@ -422,6 +428,7 @@ chosen {
>           memory = <0 131072>;
>           cpus = <2>;
>           vpl011;
> +        seclabel = "system_u:system_r:domU_t";
>   
>           vcpu0 {
>               compatible = "xen,vcpu";
> @@ -453,6 +460,7 @@ chosen {
>           #size-cells = <0x1>;
>           memory = <0 65536>;
>           cpus = <1>;
> +        seclabel = "system_u:system_r:domU_t";
>   
>           module@0x4c000000 {
>               compatible = "multiboot,kernel", "multiboot,module";
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 9036e455d6..e4de292533 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -11,3 +11,5 @@ obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
>   obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
>   obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
>   obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
> +
> +CFLAGS-y += -I$(srctree)/xsm/flask/include
> diff --git a/xen/common/device-tree/dom0less-bindings.c b/xen/common/device-tree/dom0less-bindings.c
> index 41d72d0d58..bffd2ec65d 100644
> --- a/xen/common/device-tree/dom0less-bindings.c
> +++ b/xen/common/device-tree/dom0less-bindings.c
> @@ -11,6 +11,8 @@
>   #include <public/bootfdt.h>
>   #include <public/domctl.h>
>   
> +#include <security.h>
> +
>   int __init parse_dom0less_node(struct dt_device_node *node,
>                                  struct boot_domain *bd)
>   {
> @@ -21,6 +23,7 @@ int __init parse_dom0less_node(struct dt_device_node *node,
>       bool has_dtb = false;
>       bool iommu = false;
>       const char *dom0less_iommu = NULL;
> +    const char *xsm_seclabel = NULL;
>   
>       if ( !dt_device_is_compatible(node, "xen,domain") )
>           return -ENOENT;
> @@ -141,5 +144,13 @@ int __init parse_dom0less_node(struct dt_device_node *node,
>           panic("'llc-colors' found, but LLC coloring is disabled\n");
>   #endif
>   
> +    if ( IS_ENABLED(CONFIG_XSM_FLASK) &&
> +         !dt_property_read_string(node, "seclabel", &xsm_seclabel) )
> +    {
> +        if ( security_context_to_sid(xsm_seclabel, strlen(xsm_seclabel),
> +                                     &d_cfg->ssidref) )
> +            panic("Invalid security context for domain: %s\n", xsm_seclabel);
> +    }
> +
>       return arch_parse_dom0less_node(node, bd);
>   }

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

