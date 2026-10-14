Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A5DCC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 11:14:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448785.1664805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGwvq-0004DV-0P; Wed, 14 Oct 2026 11:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448785.1664805; Wed, 14 Oct 2026 11:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGwvp-0004DO-U9; Wed, 14 Oct 2026 11:14:01 +0000
Received: by outflank-mailman (input) for mailman id 1448785;
 Wed, 14 Oct 2026 11:14:01 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGwvp-0004DI-12
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 11:14:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGwvo-00D0Ei-E4
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:14:00 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6acf63f7-e002-0a2a0a5209dd-0a2a4508e2a0-0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 13:13:59 +0200
Received: from [40.93.194.63]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6acf63f6-f659-0a2a45080019-285dc23f18ef-4
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 13:13:59 +0200
Received: from BN9PR03CA0596.namprd03.prod.outlook.com (2603:10b6:408:10d::31)
 by SA0PR12MB7090.namprd12.prod.outlook.com (2603:10b6:806:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 14 Oct
 2026 11:13:52 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::62) by BN9PR03CA0596.outlook.office365.com
 (2603:10b6:408:10d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 11:13:49 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 11:13:49 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 06:13:43 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 06:13:43 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 14 Oct 2026 06:13:42 -0500
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
 b=VW/aXjU7g/zxSGYE/AnkqvAZYfia8taqqHRFIUZCuAR4jXRGD9zm9P0GpyDTgAjORthsMEZzQVGLlGLTHkdvqF7ityJwxBwIcB+6H+hYcepCbRFGbAEC4lB+QpZ+U5VQkwvFriaq8XdvBseivrIoWvknpI667p8vGrFHEdrwB2dWbucYv8Cc1uvTlDrV/XwXiZI+vny3aqAXF8A7YHvZv0gP93VzhuJ7+cauDIBXGaBXmF+eb7FiJBbgI3zFyxuDX+jCLPzyznoW/89cVz0GQ+iz2YLFBKj4lTEaSPVkK7jw3+euU4YmA8purUkoSxrEoiM10MsGi9uw9vqCd0xK1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QG0iiK5AHSkN91Yj6j7J15cv20E7oo64Eit3FfQ24K8=;
 b=E9i8k3dkuFdJpu4zKiiCcXIUKSpyUWO//RCQwbicSrMU62qKgFig2z670CaRS+ZAjdY4xPAqhDUGG6NzIBy2lbNUvaQL9CkwDrg/8tp2eYk6zCsTflIYyCP4/PLwxPaKrX7edm1+0kHzt7kJOuZN3yoUpgE2NaRdvLlB7QMZ4GdHpuuSv2cXhSRhOurBXeCTPlP1TOJnwUudGAq1cpt9fV1zfMufT3aSQmQ9MplEF9uy9a/1M/VnZqtzmW2NiZS2eA9PA+73dsz8TB1rAfEnbNH1mWfffH0bdsaRQRaCmsvzp6Fn9gfaqZZg/scBWMYsjwnADe05+BFaszxIpQvXTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QG0iiK5AHSkN91Yj6j7J15cv20E7oo64Eit3FfQ24K8=;
 b=ghl9oZ9BFJJ3HVP1oZVSe5nbO0WncJaBEMsD8h94eQWGQ5PAlqS5W6UIDvH3J3hOUr5gki1FgDOMFLI7oeN2J2yONt7hgl8/M1uyIBHnxTvsRD5wcFQexCippMI33h8C4YC6iN0Xi6cwx7Wr081f8Pwe1vtcrTWYUSPP7oLKe6E=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <4e820fd2-6ed3-49bc-a41b-58af36790f62@amd.com>
Date: Wed, 14 Oct 2026 13:13:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/device-tree: add a helper to dump an FDT in
 DTS-like format
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
References: <20261012073442.15819-1-oleksii.kurochko@gmail.com>
 <20261012073442.15819-3-oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261012073442.15819-3-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|SA0PR12MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0a0124-b48b-44d7-b42d-08df29e43930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|18002099003|6133799003|22082099003|10067099003|261009223027099003|3023799007|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	13Yb2yyFousUQH6Fq+X9bMjKkoO8/DKD+XrVlUWYPlQKAoiAXQexEEdSbvGygHgiDUQF3iGe7ZhuEVlmCeRNSnZysSJRIcv3byJT/woNeRcTssPqrwUu6gYfxXsQIrAd2qiW56WA4/fvsNXcdJFT/MJLP4VZlmMfrptoGdm9xNHHGpnuY07WDjhiOHWstaH4G6j4qZQQH63OB1+gXtY2bkgjqzgUV11EindTuPOWkhmdIygccrSDfNU47sJTI913fPEvnv6dZqg1Pi8FSNiYhztjkbjNhrvdvCbdba+wOXfMKkNj1rqNdJHsDAYYJp1Lv3GesoZ33EYN/9yeha7+r8Exh+G6K0buApX4/h2CiwB/0YFPzTL0g5H0zjm75jUWUNRuDwJn5BAAxrZMtcBk/dEi8N97wiWZTRhw/KWltDxSVOgjkdJFJKoRoqhVWdHl7JIjhnIdIqz1Y1C22qDuGfLsLrJAcxkDCj1L1UT425ue7317TVE6gHE5m42AuQDsnOlWpn/RgIuhoV94pzVGDklG+xfiYTi6WJ8Q4vXS+oEj6Ts0Krn75Gy/kEYtYguifUYkiKjrdkYJL+8btyU00uDYVrSbOczbUA4ReCKOFo4HGYvPCUTwgs0BiRRsF5NvDG06yYN2yYEHnCuSmZZKzzT0w8Fx/3Q7y2pqr/Uw8qQB9JinnTp41sAUI5ND7SCFCElL+oh7UVFVJoBtD33sWw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(6133799003)(22082099003)(10067099003)(261009223027099003)(3023799007)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2E5eNqQMKbjVEinhkeLDBa2qVEXTZI3D+R5sFV9EJda4JqFg54y3qBo/RRwt+qlXt1BnHl720RdUlSN+7qhVqzg4j7ZvcTYIfQOex+GsLkNchrF8VJukX3vzu4VL1+FGI6BQaEOQ89rnL6ktxmXXwV1MydtBP+74EjSV9kmvHQLvFfMXMCLB5iqqluVxCmwVzI4EWL4Vtnu91gj6Ffml47fLsa3C1JohQ1J7Qr1eQ3LzNFs8ic8/w+wIzXD4/pUcQvAY/aHQUyPeUX+2pWizgnLIliiwgAlGFozu63oLwQKqqac9IsVf8nkhv6PX4EfkOx8uri0PFMkXSUwDMgRptahUtR9jC1dGoSDa6tGGQ+XcsqtXtRtxYh3dzXVPTWAHRB3OS27eOd7gPm3pLWeMD8v7roIrU55nBn79iF0/wxI4n3PVLjjQp/t1W2ZXX8tP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 11:13:49.8253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0a0124-b48b-44d7-b42d-08df29e43930
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7090
X-purgate-ID: tlsNG-c1860d/1791976439-CF35D87B-E8468E7F/10/73395122804
X-purgate-type: spam
X-purgate-size: 6190



On 12-Oct-26 09:34, Oleksii Kurochko wrote:
> The device tree Xen builds for dom0/hwdom or for a dom0less domain is
> only ever consumed by the guest, so a mistake in it surfaces as an
> obscure failure inside the domain, far away from the code which
> produced the tree.
> 
> Add device_tree_dump(). The output follows dtc's format so that a dump
> can be diffed against the source DTS or fed back to dtc; the value
> formatting heuristics are ported from dtc's utilfdt_print_data() for
> that reason. The walk itself goes through libfdt rather than decoding
> the tag stream by hand as dtc's fdtdump does.
> 
> Dumping a whole tree is only useful while debugging and costs both code
> size and a lot of console output, so it is put under its own option,
> CONFIG_DEVICE_TREE_DUMP. It is separate from CONFIG_DEVICE_TREE_DEBUG
> because the generated tree is often all that is needed, without the rest
> of the device tree debug messages.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>  - Dump the device tree generated for dom0/hwdom as well.
>  - Put the dump under its own CONFIG_DEVICE_TREE_DUMP instead of
>    CONFIG_DEVICE_TREE_DEBUG.
>  - Pass the domain to device_tree_dump() and print the "Device tree for"
>    header from it.
>  - Combine isprint() with isascii(), as Xen's isprint() also accepts
>    the characters 0xa0-0xff, unlike the one dtc uses.
>  - Update the commit message.
> ---
> ---
>  xen/Kconfig.debug                       |  10 ++
>  xen/arch/arm/domain_build.c             |   2 +
>  xen/common/device-tree/Makefile         |   1 +
>  xen/common/device-tree/dom0less-build.c |   3 +
>  xen/common/device-tree/fdt-dump.c       | 185 ++++++++++++++++++++++++
>  xen/include/xen/bootfdt.h               |  16 ++
>  6 files changed, 217 insertions(+)
>  create mode 100644 xen/common/device-tree/fdt-dump.c
> 
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index d900d926c555..45cff9dbc467 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -98,6 +98,16 @@ config DEVICE_TREE_DEBUG
>  	  logged in the Xen ring buffer.
>  	  If unsure, say N here.
>  
> +config DEVICE_TREE_DUMP
> +	bool "Dump generated device trees"
> +	depends on DEVICE_TREE_PARSE
> +	help
> +	  The device tree Xen generates for dom0/hwdom and for each dom0less
> +	  domain is printed on the Xen console in a DTS-like format.
> +	  The dump is logged at debug level, so on a non-debug build it is
> +	  only shown with "loglvl=all".
That's not correct. loglvl="debug" is enough. That said, I don't find it
particularly necessary for the second part of the sentence to be part of the
help message. If you want to keep it, fix the loglvl.

> +	  If unsure, say N here.
> +
>  config SCRUB_DEBUG
>  	bool "Page scrubbing test"
>  	default DEBUG
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 72d531618045..6a20af23e1bb 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1705,6 +1705,8 @@ static int __init prepare_dtb_hwdom(struct domain *d, struct kernel_info *kinfo)
>      if ( ret < 0 )
>          goto err;
>  
> +    device_tree_dump(d, kinfo->fdt);
> +
>      return 0;
>  
>    err:
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 9036e455d66a..730d202349eb 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
>  obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
>  obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-bindings.init.o
>  obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
> +obj-$(CONFIG_DEVICE_TREE_DUMP) += fdt-dump.init.o
>  obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += intc.o
>  obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
>  obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index fcbeb8adbd73..24a9c6b1e3e1 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> +#include <xen/bootfdt.h>
>  #include <xen/bootinfo.h>
>  #include <xen/device_tree.h>
>  #include <xen/dom0less-build.h>
> @@ -587,6 +588,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      if ( ret < 0 )
>          goto err;
>  
> +    device_tree_dump(d, kinfo->fdt);
> +
>      return 0;
>  
>    err:
> diff --git a/xen/common/device-tree/fdt-dump.c b/xen/common/device-tree/fdt-dump.c
> new file mode 100644
> index 000000000000..296ae0d90d12
> --- /dev/null
> +++ b/xen/common/device-tree/fdt-dump.c
> @@ -0,0 +1,185 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Dump a flattened device tree blob in a DTS-like format.
> + *
> + * is_printable_string() and print_value() are derived from
> + * util_is_printable_string() and utilfdt_print_data() in the device tree
> + * compiler (dtc).
> + *
> + * Copyright 2011 The Chromium Authors, All Rights Reserved.
> + * Copyright 2008 Jon Loeliger, Freescale Semiconductor, Inc.
> + * util_is_printable_string contributed by
> + *      Pantelis Antoniou <pantelis.antoniou AT gmail.com>
> + */
> +
> +#include <xen/bootfdt.h>
> +#include <xen/ctype.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/types.h>
> +
> +/* Deeper nodes are still printed, but not indented any further. */
> +#define DUMP_MAX_INDENT_DEPTH 32
> +
> +/* Indentation, in characters, of a node at depth @depth. */
> +static int __init indent_of(int depth)
> +{
> +    return 2 * min(depth, DUMP_MAX_INDENT_DEPTH);
Can we use 4 spaces instead of 2 here and in print_properties() call. It does
look more readable IMO and matches the indentation (1 tab = 4 spaces) of dtc
when converting dtb to dts.

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


