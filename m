Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BF3CA600B
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 11:57:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443250.1660627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEmkY-0002nj-PE; Thu, 08 Oct 2026 11:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443250.1660627; Thu, 08 Oct 2026 11:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEmkY-0002nc-MX; Thu, 08 Oct 2026 11:57:26 +0000
Received: by outflank-mailman (input) for mailman id 1443250;
 Thu, 08 Oct 2026 11:57:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEmkX-0002nW-BE
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 11:57:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEmkW-00CPFC-L4
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 13:57:24 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac7850d-e002-0a2a0a5209dd-0a2a45038f42-44
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 13:57:24 +0200
Received: from [40.93.196.31]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac78520-fae8-0a2a45030019-285dc41f6d5a-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 13:57:23 +0200
Received: from PH8P221CA0060.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::9)
 by SJ0PR12MB5612.namprd12.prod.outlook.com (2603:10b6:a03:427::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 11:57:16 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:510:349:cafe::7e) by PH8P221CA0060.outlook.office365.com
 (2603:10b6:510:349::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 8
 Oct 2026 11:57:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 11:57:15 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 06:57:11 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 8 Oct 2026 06:57:09 -0500
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
 b=J2XKYqwZo6vRK8GmMovUaEEa10t5s2lNackhTUGUPajnnn/NoYarjE7zwciQwBrpRYi/HEb6N7fgjeOwvKOl2bO+8/i7rR3Z0Ds0M3hAJQFuLKxv67nfS7Mx+wDX/G6x7zDer6/azekVrajf5t1nAEYvrTqHf42tL/zu/PYgMz0g/wzFAt3S+OAgE1uEsPM7hPY3RguBRHQHTF1uIZ7U0Yr0FMxMF/MtDnGRPx7tkN/oo04At7kYuGSqDaF16PonwMU5o5KpAgcp2gje6Fn/iURxLVzDXSpy8AYEetV/LZ6vB4+7AmHTZyHSzOsMu6bSPeGuWCnw9eq/aqtUJFrdnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvUcOoxGa9GM4rKmJX/AvXT9lpP1bCoPA6uImLgNC5Q=;
 b=FWtgFBN+6polqRmdCstjKk4Jg4iIDqo5sl1rwFfQKgIoDvI9eOPWUQtwAudnA5JqOLV50M8MRlcjTgscEOQ21+Gx5dzASFSXR9jGuCzJS4A+Ewii3fB8dKoxfbiSHRU1APjh3m+AhLfgd6m5+E1NCDEx6ylMbxDxgrojlhH8Nrr/rbE0RIkLR2q3UQO/QZf/IR+2uTkH5OSydNMnaF2uSAQlWN6bFLHqz0lZy05uJAEvAjoFFppd7O2p/hzfmDC+K+NaI9FvUIpMCH5thatSyVObdH8jI3GIM/264qj8I0cnkq38JDEXThbtPxDxUObc3aflDuBWyrJOT/iPNYNuBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvUcOoxGa9GM4rKmJX/AvXT9lpP1bCoPA6uImLgNC5Q=;
 b=UW3qwsMg8AvWtTkz/U1h5SUpC9LKAQac4WXOYWguZwD2/htIWzDuUGgObWTkJUv3Hx5D6LCqqxq3xXtyu6NP6igdPp5CU+zvNP/W2GHuGyuwn5EpJ8m+TKTHGCCAImIL3ACkZQPWCvRH2nrYLsTbfOYpGJRDlDj2oKtahBwGuwM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e4f83aff-b140-48dc-8858-d60657568fa9@amd.com>
Date: Thu, 8 Oct 2026 13:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/device-tree: add a helper to dump an FDT in
 DTS-like format
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <20261001111630.112472-1-oleksii.kurochko@gmail.com>
 <20261001111630.112472-2-oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261001111630.112472-2-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|SJ0PR12MB5612:EE_
X-MS-Office365-Filtering-Correlation-Id: 4911ef6f-4459-4f78-be77-08df25334c12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|6133799003|11063799006|5023799004|56012099006|4143699003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	plWMpPiKYY8Np+5PdcKZ4VUs7oxFXvySykqxVSZN36qOhJGyS2RwIey0w6kftQnD2HCJWqohUE66/+kLtPW/tmBUUSgrXuC/+EDtTJ/LgJThM+o4T+3fTktXhXzPOKqtgB7rAgVw2FH5d12MCWH7BWdBKJjLIZrXYan6oFkDUHkgrniD/RhDnmKSL+3bxpFxt48p5k/sTKAjN4CEpd/Ltb+TW5OpA66eAFOggYDTMrT+u8ntrev676aIjkTIycyXgnutzhunLy5ZSIYQp/metbJUnTfa6usl1iMwqjNs/8I4bgTqxc5ZjXbj4qvNWz16E7YFO8835Yma4t8B2HZMYf6Z4pTPaN4oWmvOA0SXOfRqvc4VJ4LP7BN0b8aGL/IaVGP5/hraP+9SQZb7cEpqcBK1TSsXUA/zJH5f5R2DTZqF8Y405bXkqTFfV1tm+atiGk4dE4TsoTg8oD70NbUD8t0eyAor7ZsWP+ScgTuoxmh9tJFXT7hmlg0hImG7DdorBesFP26vAZp099kPLi+ah8Zrsp5h1pZ7z9dJpYQxErXOrfSNCiMQAxgoiESctRaGnJjhPkGOrH8HO03kEq6eyvlXjNzbm+S7kNN8mpoOWKHap7JlGE98EGcQ3c4NYr1h/YCpw/5TFs9g3meXi/WZbNqPZwzT7incOuLlAZuv/gZ3htQvCx7k5pbRQFEPSTEq3tDywHhWpmH1TZ+Et6eLSw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(6133799003)(11063799006)(5023799004)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pP1Oywsnu7GlM5JPUW+RhnzSIr8S2vlZCivVQ9UD/AAzzBN3KBl4PdZY2/RVL+iYOYFf1YqmtrLkzEi7KTqzHLY8ALJOb/835XhDbtGFjnZpMnZDa0f45vV0MUvGxjLMt8wpJKPxtx8msvQ6T1eWtPAHVAGeG9suJVDAMG/W9jVLy7arzLLbQWduSIk9nyk1E0Cyn2FGUaNdbjF0ylm/zQ+poa2sXgYIs7Zy8H1dgyHgke49eQ/2w4zVgkDNpt7zJG2IEuOwhICyq+FOKn7PmKdq1vLiRb2ddGYkL0NwYt679BD0inx8PItdT87n9QWR1W9rNOhE1IHKFPGrNvp2JVzawXat3vtRZe4E1ZZryGG3y5SWaoU1ZOSL7aUnNd+o5ooiBzB71gigDbuuTG81KdzcQ7XuUpBVNI2P5Y/2cY29rpiq/gS4gdxC1UjPjlEe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 11:57:15.9133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4911ef6f-4459-4f78-be77-08df25334c12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5612
X-purgate-ID: tlsNG-33051d/1791460644-754844E9-031CB6EB/10/73395122804
X-purgate-type: spam
X-purgate-size: 5531



On 01-Oct-26 13:16, Oleksii Kurochko wrote:
> The device tree Xen builds for a dom0less domain is only ever consumed
> by the guest, so a mistake in it surfaces as an obscure failure inside
> the domain, far away from the code which produced the tree.
> 
> Add device_tree_dump(). The output follows dtc's format so that a dump
> can be diffed against the source DTS or fed back to dtc; the value
> formatting heuristics are ported from dtc's utilfdt_print_data() for
> that reason. The walk itself goes through libfdt rather than decoding
> the tag stream by hand as dtc's fdtdump does.
> 
> Dumping a whole tree is only useful while debugging and costs both code
> size and a lot of console output, hence CONFIG_DEVICE_TREE_DEBUG. Mention
> the dump in the help text of the option.
We should also dump the DTB for dom0/hwdom in prepare_dtb_hwdom(). Please add
that to this patch.

> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/Kconfig.debug                       |   3 +-
>  xen/common/device-tree/Makefile         |   1 +
>  xen/common/device-tree/dom0less-build.c |   4 +
>  xen/common/device-tree/fdt-dump.c       | 180 ++++++++++++++++++++++++
>  xen/include/xen/bootfdt.h               |  13 ++
>  5 files changed, 200 insertions(+), 1 deletion(-)
>  create mode 100644 xen/common/device-tree/fdt-dump.c
> 
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index d900d926c555..664f50bf8a96 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -95,7 +95,8 @@ config DEVICE_TREE_DEBUG
>  	depends on DEVICE_TREE_PARSE
>  	help
>  	  Device tree parsing and DOM0 device tree building messages are
> -	  logged in the Xen ring buffer.
> +	  logged in the Xen ring buffer. The device tree generated for each
> +	  dom0less domU is dumped there as well, in a DTS-like format.
I think we could have a separate option DEVICE_TREE_DUMP that depends on
DEVICE_TREE_PARSE. Sometimes all we need is just to see how the generated DTB
look like without seeing thousands of other DT debug messages. Especially that
nothing in fdt-dump.c depends on DEVICE_TREE_DEBUG.

>  	  If unsure, say N here.
>  
>  config SCRUB_DEBUG
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 9036e455d66a..959dd2a9fd30 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
>  obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
>  obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-bindings.init.o
>  obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
> +obj-$(CONFIG_DEVICE_TREE_DEBUG) += fdt-dump.init.o
>  obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += intc.o
>  obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
>  obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index fcbeb8adbd73..182201384faf 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -1,5 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> +#include <xen/bootfdt.h>
>  #include <xen/bootinfo.h>
>  #include <xen/device_tree.h>
>  #include <xen/dom0less-build.h>
> @@ -587,6 +588,9 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      if ( ret < 0 )
>          goto err;
>  
> +    dt_dprintk("Device tree for %pd:\n", d);
Move this message to device_tree_dump.

> +    device_tree_dump(kinfo->fdt);
> +
>      return 0;
>  
>    err:
> diff --git a/xen/common/device-tree/fdt-dump.c b/xen/common/device-tree/fdt-dump.c
> new file mode 100644
> index 000000000000..fc3d9eca5891
> --- /dev/null
> +++ b/xen/common/device-tree/fdt-dump.c
> @@ -0,0 +1,180 @@
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
> +}
> +
> +static bool __init is_printable_string(const void *data, unsigned int len)
> +{
> +    const char *s = data;
> +    const char *se = s + len;
> +
> +    /* A zero length property, or one which isn't NUL terminated, isn't one. */
> +    if ( (len == 0) || (s[len - 1] != '\0') )
> +        return false;
> +
> +    while ( s < se )
> +    {
> +        const char *ss = s;
> +
> +        while ( (s < se) && *s && isprint(*s) )
Xen's is_print() behaves differently than what dtc uses. You need to combine it
with is_ascii. Otherwise 0xff would be marked as printable.

~Michal


