Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A77F36C51
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 08:04:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1285487.1566498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEjbg-0004JB-C6; Mon, 20 Apr 2026 08:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285487.1566498; Mon, 20 Apr 2026 08:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEjbg-0004J4-70; Mon, 20 Apr 2026 08:03:48 +0000
Received: by outflank-mailman (input) for mailman id 1285487;
 Mon, 20 Apr 2026 08:03:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wEjbf-0004Iy-Cm
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 08:03:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEjbd-0076Et-36
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 10:03:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e5ddd8-5cb7-0a2a0a5109dd-0a2a450ca966-30
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 10:03:46 +0200
Received: from [52.101.53.17]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69e5dde1-62f1-0a2a450c0019-346535116b68-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 10:03:46 +0200
Received: from CH0P223CA0013.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::30)
 by MN2PR12MB4373.namprd12.prod.outlook.com (2603:10b6:208:261::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Mon, 20 Apr
 2026 08:03:40 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::b5) by CH0P223CA0013.outlook.office365.com
 (2603:10b6:610:116::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Mon,
 20 Apr 2026 08:03:33 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Mon, 20 Apr 2026 08:03:33 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 03:03:33 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 20 Apr
 2026 01:03:33 -0700
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 20 Apr 2026 03:03:31 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OocauKv/iPxHzbRdC6BWGcvf4UtgayRi+fw/Cs7/DG+G3fX61ZFPU9ePXTpU/LLLCx0BC2hqb+h1b9NllU59wzGTSE80C9waCbQpMj/8zHbOoSzxeRWqu80DnxpZrmSY8JoOxCVk0hc+7WkfiX/69JMyJ8L2//KRH69RI1EW70d/FURIMHHU32G6t04GcwxiMiWU+cQ/jmEpYLFXnfWiJCI/w4yDEZHzof1EdOTM106fy7Zls+olJNaeg7eLIi5w/rur9K5YTbN6vQRzHo38z7mLPOr3Hyi604LeB8E+pn1l/hlsBm8Dgjp+pe9BpsBZTbdxgBu0yacURqLiLsJ48A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWvzZOX0hDO+ITJIMv2XGIAaFknfMcrBwxN2uVX5dy0=;
 b=mrfNtEViCDJ1EaSlnnK3V8lyBSdTq2VJkGT2RscPUMjOKL6Rr067wQdN7Zj7/MzV3LTkBUY0gLux3c+pGkv/mYrUY1ENvlT7VIg+ldUnyRZ57Ty0LMWAQ+MB7bUO4AoaULuA9jFoWsmdLRJnn6XvK2YS/22SEMVIrHfm8//xEPCYo0+0rxA/Ee4dc1Hons5fBuGc6dmQBwKgFPuHrK1D0Q+GVIsySx/y9AqXqYj1cgT39zffX9L0mEtt3RF+wqocZH3iDI2EBOPnO3wxJiPTkvtN+o64gtHTlXNsLwaL50hmQNnRXX233gnhYXqztm/I7x29vZvV6lgjVEYUe7P6Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWvzZOX0hDO+ITJIMv2XGIAaFknfMcrBwxN2uVX5dy0=;
 b=5JEu8I/BzTubSfWtKluNU/Q3MwNsI8rBSRGUSYaGDZWhBxNMd/R5UFNT2W8MBlmCdVatYv2SfGl+A4SjFx5WlAwtLd2Eqg7AC2IyYHWhpys8bh6VKPKIXxDUoNuxb3+7FyvlXMTupI21rXM/Px592G1S6SQ7gnAeX9H1IctELkY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <c5003b0c-04e1-4081-b931-bfcb9ab1b739@amd.com>
Date: Mon, 20 Apr 2026 10:03:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1776340422.git.oleksii.kurochko@gmail.com>
 <e5ffcdecb0ca3c87b46965449601ff20116fecc0.1776340422.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <e5ffcdecb0ca3c87b46965449601ff20116fecc0.1776340422.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|MN2PR12MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d14d4b-91f7-4e0c-e619-08de9eb351aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	IQnBV7ABC6c9rdhJJGhVmAMoeX0Ra1iqEp/bawHvRtSW8xoZIJae9rZiqesCyfGSNj07jq2H+2GFzVM1EWi92hBPL3Ia5sQ6zZa0ui1HImTifIsHmYcWran+S49aOFKOeWaiDiiLEPVUNAQlgZVbtmPxtQ7nCMTAVEN5Zcv83lBYZlC+gPVnfAnb95oGQoJKqe5GtMxnyDzBFPLIEph5YVvm2Ar/I+kussna0bOUek1GOi3frISwTYPJjFranbml45PYAGknvAAPgqSfyDj4BBMuL5HNPlVnv4Aj0FYhT+T9dxoF6kDOTDBB7Stv1vft1DPIUGYR6OIQUQjEYlLGLzKNgDDR3uT+n1aPxWNu/B0wYlwkReL2vQ7Uj4w1S6RfGaZtUdPKV6YGbU17kxZGlDDRUbFPwsXAUAhWkRMB7Zgs+wsJUEC7zq93ft0cyAjxFMuymYi9cKKx12gGEHVEy0FrIlNX9uiqgaLxJ/W6Ohj9PBTbO2u7w02SdSnPLhrEWa6dGW7ZRHcgCy1eUAnIoiNtsYp9hwfDd3PC/OVCdKYXAr4qShCb626a+nzWaDrNvV5jChG3zkzNbCGiT2Ped2p7VgN56vpg2zTnbArFN1oYeE9Av81vmzQ/VPP4+WbBtIy1nzxTBBnhG8nSrpyFQ3vqP2mmNrn1Lp+eMY6pMnARyw6sygAagI7B6i6bslE4jD9AkhBmQBNMPzDNYuimTHZjx1UQHGeqIDXoH3YyBjxvYr9D2YfbWsTgsdc/L5HUUVwcpakICyAQeR6yXhZHfA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Lde9OLG+sI3dwkXERktZb775qX2h0x/fojbvNbfFMbBko9ZL1Nxm+/2AqNJRLor9W8rH2ngE9Hh69mDE3NA3jIAafzxxSlRQjYKnQVsSWr1uRmDUwcSLiDD4qE8c4PvyN1UMGA4Ibi/iPKDZlsCWmKbu850MvQo0hJG32gDmPHEOe3vYeV6XgTPnIvsXhx/HsQItfTCe1aa+zMdqNRD4orrF8WZSLyeoQvOz2gonfM89z2AufXX/qZkL/1JBL2ZUN+fgA5ecISKwmVCPo8T5quvW08bVBaPldhXTL/kkUwPzI7kP/2z2iak8KsR2GMbfI2mrvNJefaM0SnPlbnVWQW8+TjZzOk/ZwjRbsJFGxZ+NYICtvsx6O2k4esLvr2xSO9u+stlls+DKqB01bm9x+fVgXq2pCR6AKUoZJrck/dDNdUH4wB7MtJecGcL7haMj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 08:03:33.9149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d14d4b-91f7-4e0c-e619-08de9eb351aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4373
X-purgate-ID: tlsNG-d25034/1776672226-6E776CF5-E6B9C4FC/10/73395122804
X-purgate-type: spam
X-purgate-size: 4711



On 16/04/2026 16:21, Oleksii Kurochko wrote:
> As domain type is part of common code now there is no any reason
> to have architecture-specific set_domain_type() functions so
> it is dropped.
> 
> The CONFIG_ARM_64 guard in xen/arch/arm/domain_build.c is intentionally
> left unchanged: it is ARM-specific code, and ARM_64 selects
> HAS_DOMAIN_TYPE, so the semantics are identical.
> 
> x86 with CONFIG_64BIT=y shouldn't use is_{32,64}bit_domain() as
> x86 doesn't have support of CONFIG_HAS_DOMAIN_TYPE. For x86_32
> it is fine to follow generic is_{32,64}_bit_domain() implementations.
I thought x86_32 Xen no longer builds. This means the fallback is only for arm32.

> 
> Generally it probably would be better to introduce CONFIG_32BIT
> and use it to define is_{32,64}bit_domain() as if one day
> CONFIG_128BIT will be introduced is_{32,64}bit_domain() will be
> defined incorrectly but considering that CONFIG_64BIT is maximum
> supported bitness it is fine to define in this way.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/Kconfig                        |  3 +++
>  xen/arch/arm/Kconfig                    |  1 +
>  xen/arch/arm/arm64/domctl.c             |  4 ++--
>  xen/arch/arm/dom0less-build.c           | 14 --------------
>  xen/arch/arm/domain_build.c             |  8 ++++----
>  xen/arch/arm/include/asm/domain.h       | 12 ------------
>  xen/arch/arm/include/asm/kernel.h       |  4 ----
>  xen/arch/arm/kernel.c                   | 10 +++++-----
>  xen/common/device-tree/dom0less-build.c |  5 ++++-
>  xen/include/xen/dom0less-build.h        |  2 --
>  xen/include/xen/domain.h                | 13 +++++++++++++
>  xen/include/xen/fdt-kernel.h            |  5 +++++
>  xen/include/xen/sched.h                 |  4 ++++
>  13 files changed, 41 insertions(+), 44 deletions(-)
> 
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index f9230bfaf872..6c53149f7ee1 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -1,6 +1,9 @@
>  config 64BIT
>  	bool
>  
> +config HAS_DOMAIN_TYPE
> +	bool
> +
>  config PHYS_ADDR_T_32
>  	bool
>  
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 2f2b501fdac4..79622b46a10d 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -7,6 +7,7 @@ config ARM_64
>  	def_bool y
>  	depends on !ARM_32
>  	select 64BIT
> +	select HAS_DOMAIN_TYPE
>  	select HAS_FAST_MULTIPLY
>  	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
>  
> diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
> index 8720d126c97d..9e9a29eb1e78 100644
> --- a/xen/arch/arm/arm64/domctl.c
> +++ b/xen/arch/arm/arm64/domctl.c
> @@ -21,10 +21,10 @@ static long switch_mode(struct domain *d, enum domain_type type)
>          return -EINVAL;
>      if ( domain_tot_pages(d) != 0 )
>          return -EBUSY;
> -    if ( d->arch.type == type )
> +    if ( d->type == type )
>          return 0;
>  
> -    d->arch.type = type;
> +    d->type = type;
>  
>      if ( is_64bit_domain(d) )
>          for_each_vcpu(d, v)
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 4181c105389a..6f73c65e5151 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -237,20 +237,6 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
>      return 0;
>  }
>  
> -/* TODO: make arch.type generic ? */
> -#ifdef CONFIG_ARM_64
> -void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
> -{
> -    /* type must be set before allocate memory */
> -    d->arch.type = kinfo->arch.type;
> -}
> -#else
> -void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
> -{
> -    /* Nothing to do */
> -}
> -#endif
> -
>  int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
>                        const struct dt_device_node *node)
>  {
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6740da3d324b..2fd89b3a1345 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1178,7 +1178,7 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
>      /* Keep the compiler happy with -Og */
>      bool clock_valid = false;
>      uint64_t mpidr_aff;
> -    void *fdt = kinfo;
> +    void *fdt = kinfo->fdt;
Here you are fixing a regression introduced in patch 2/3.

I'm ok with this patch. but since you touch common code too you need to wait for
other's opinion. For now, provided you fix the commit msg and regression remark:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


