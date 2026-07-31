Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB17C5516D
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 08:40:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378887.1623911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpimu-00051d-Qz; Fri, 31 Jul 2026 08:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378887.1623911; Fri, 31 Jul 2026 08:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpimu-00051W-OS; Fri, 31 Jul 2026 08:40:16 +0000
Received: by outflank-mailman (input) for mailman id 1378887;
 Fri, 31 Jul 2026 08:40:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wpims-00051Q-VB
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 08:40:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpimr-002Wrt-SI
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 10:40:13 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a6c5f62-bab6-0a2a0a5309dd-0a2a4505c9fa-34
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 10:40:13 +0200
Received: from [52.101.48.68]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a6c5f6b-4cb1-0a2a45050019-34653044827f-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 10:40:13 +0200
Received: from SJ0PR05CA0163.namprd05.prod.outlook.com (2603:10b6:a03:339::18)
 by IA0PR12MB8423.namprd12.prod.outlook.com (2603:10b6:208:3dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 08:40:07 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::94) by SJ0PR05CA0163.outlook.office365.com
 (2603:10b6:a03:339::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Fri,
 31 Jul 2026 08:40:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 08:40:06 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 03:40:01 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 03:40:00 -0500
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
 b=fuh8Ak8BJCwfiLIx2Vv4A9UXKroz2GCUc1UDvwnagGQFNTsVQ3s2fdDLP0QLALkQQgdsGlA3Bpj7dEfEm/yErmGK5Z1R4ZBNp+Qnkj04ADwNOZltvjjUuISMLidMzNEL1SGg3k6RcF2XMryr4hOd3B0ubG9gHQDOCk8KXipEk/T5drjg7hWGBa2Vf1ABoFJvIvp6YZgCAzSSbP1e7ZrFUCAABb5hz7dvMs+HWyNlL4tTe18j30fsir1bpdAoPO0nUwUOnkrXcjyhwVPV31shx0WlwpadiFvypgwqfeeepPVlHQcseywU1WARLoTjhpmy7rmf4uEPEQIDBsbypm6HIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=850BLaAl8HIHcz6rQwACDgjxSTriiWSoRTuhKmWTpPI=;
 b=lfIDuZvyyUIW2VRYP5zhYdvRogRyQhZl2VPxCCHBLVfyMHj+BpxolQefhMCoR9BXXB0ouIBVPUHlLuThP19mRyzPicnF3HmSNtlpYP0uVjXsV+p/6+oNcbW6euAe4y/+OlyEni+a3K8bwyWPzCepFlspZoKqGLmFcIeHecmdLzAgvBrxdkzVE6kWsHMxFwtZ0xIW3b+Nncr5A9zXD6DPyFuXcm4LWUsvQom7aN4N8SyYInyVwx8kvN42ChPeDo8eLV0QtDAzAyCzgQROl6eeGlJKHaB/cC74pfVaST2Gdd8HwX8EbIXUj05s/Kpyt8pYqUZN4x1BhVTlB2BUGWf1GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=850BLaAl8HIHcz6rQwACDgjxSTriiWSoRTuhKmWTpPI=;
 b=P+uISDBqBpKXCOffwuL97uegpC8oimi5kiq4gnqNowGIXKw6XiBI9DEpuYCRP2Ugmy0UeiQrKL068Z1ZAA57ELjhy/m/kOs6V7s1YTMi18An04kyy7X+58pX6JX06lNipC8I1FX2pxyAk7DWV2bULa5fDQKGyfCN92VlKJq3olY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <af30caf6-b740-4c03-a429-d8e2f39ef4b3@amd.com>
Date: Fri, 31 Jul 2026 10:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/arm: its: handle dma-noncoherent on GIC and
 ITS nodes
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1779922874.git.mykola_kvach@epam.com>
 <43b0e8f6b25588ba1cfc22d367e5ed6b303a4978.1779922874.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <43b0e8f6b25588ba1cfc22d367e5ed6b303a4978.1779922874.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|IA0PR12MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: 96650e81-49bf-4ac3-c48a-08deeedf52a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|10067099003|5023799004|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	o3+ebPEZy7Sonq5awl0/MfP1X50MMlqMTJdaCICvykIvSTzSaiK4YyZtDneTi/oyq7KWt/cXCOaAN79o2EYc7p8rExttOzlqqtgsK4tBuNXKgdghdEpiKPOtbPKJ7m7+yTpOeDA68kKfF9ZVOf7nnJOnHGsr8GP8Cx5p0mz/662alhvWydtxcyqcSGg+EI5aTp/UifPNHB/8XVMfEKdFSuBy5Tw8vY6R+Dk8hARQHSVxELY3Elh/b8RZPXXPfJA/0aRyb/deJkffQ2FnY1Jfs0oKMrOGvCqv30Sy9VwKQAEV5YXDQnrTeeu4oEXle18Zl0Zd2Cp/WQyYGT9gMWpCNF+TkIiTa6UzZ6byS0HATe+zPA8uP9O8cC9p0lFLP4yQmMjm9IsjD14e+m1REUxT5IxgX5ty0/1lYyne5OEpOWYhk6nohkJKZFGPPJzl7nddnJiEjfBgWoILPF1+/TsrLkQK8jRcGj3TR5zhieexs5IjIa01u6GuxA4n2m9UzDmPbdM9LuYVxZJZzLD9zrvAgeqtkNgwDL4b/qYwrBb463qc1+xbi+yQKaFskb6rZypvp630emgs/Pac1Z6vzblym+M9lJ/hOn9+CPriRUsw+9Xt1J2P9vS6AFiyyyRmcjciCYHo2Te5UJnCTNDW0dg2gh1cbYUZC/aK0F2VLUlKHuhgkOzvD+325Eu5s5iDn1z5gscAXoyvCO+jlJtG8WTHGw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(10067099003)(5023799004)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aJ1CijMy1GKR7iLZAVM9ob5PNL97B+NQiff1KafYRGO8+kDGAsT+dEb8YelC1cPisgmsMGhrZ29riHGz93GRhsJ0Q2m9JKlG2UJ8OJemXRlPcwiNpTbVfBP5tn401ERlZE1pG+ejBZCNX4jzrmTtRN+l5XHk76pk6YN01i7s4o9yvCPloIw3HdcDBvXw/UfMTA2fSvgeYuzV0r+4xXqYNWRK6YTpEyB+8ctWU26tiCbcw1inh1WcmAt6mB5lqN6bbK08v+vKBjiRvRMCEsmrTJ+2aYyye+mbQmASxzgFLn4cuhDfGOKoyL0WbRqtFp0t+mutHFDLYyVgo/9LzKCccyBrD/VxzD4q1wCMh3WhqF11wDiztJBjwq0RcFAZALoz+z4AoJ/w7kCH8srrmQbJb1huoPMOfyAAw0twtNTv++Ct4n8Bn1Ndx03LVVs01VQJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 08:40:06.3271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96650e81-49bf-4ac3-c48a-08deeedf52a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8423
X-purgate-ID: tlsNG-c201ff/1785487213-F70B22A1-C318D03D/0/0
X-purgate-type: clean
X-purgate-size: 5570



On 28-May-26 02:25, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> The DT dma-noncoherent property describes the bus coherency of the device
> represented by the node. On an ITS subnode, that is memory accessed by that
> ITS, so add GICV3_QUIRK_MEM_NC_NS to the corresponding host_its before
> programming GITS tables and allocating ITTs.
> 
> When the property is present on the top-level GIC node, it describes the
> Redistributor side of the LPI path. Collect it in
> gicv3_lpi_init_host_lpis() and apply it only to the host LPI policy used
> for GICR_PROPBASER and GICR_PENDBASER setup.
> 
> Do not inherit the property between parent and child nodes: ITS-node
> non-coherency does not change the global host LPI policy, and GIC-node
> non-coherency does not change per-ITS quirk_flags.
> 
> ACPI is left unchanged; this patch only consumes the DT dma-noncoherent
> property.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v2:
> - Split v1's dma-noncoherent handling into explicit ITS-node and GIC-node
>   scopes.
> - Apply an ITS subnode property only to the matching host_its quirk_flags.
> - Collect the top-level GIC property from gic-v3-lpi.c before host LPI
>   allocations use host_lpi_flags.
> ---
>  xen/arch/arm/gic-v3-its.c | 21 +++++++++++++++++++--
>  xen/arch/arm/gic-v3-lpi.c | 22 +++++++++++++++++++++-
>  2 files changed, 40 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
> index e055914763..606b127487 100644
> --- a/xen/arch/arm/gic-v3-its.c
> +++ b/xen/arch/arm/gic-v3-its.c
> @@ -134,6 +134,21 @@ static const struct its_quirk *__init gicv3_its_find_quirk(
>      return NULL;
>  }
>  
> +static void __init gicv3_its_collect_fw_attrs(struct host_its *hw_its)
> +{
> +    /*
> +     * An ITS subnode property describes memory transactions made by that ITS.
> +     * Do not inherit it into the global host LPI/Redistributor policy.
> +     */
> +    if ( !hw_its->dt_node ||
> +         !dt_property_read_bool(hw_its->dt_node, "dma-noncoherent") )
> +        return;
> +
> +    hw_its->quirk_flags |= GICV3_QUIRK_MEM_NC_NS;
> +    printk("GICv3: ITS @%#"PRIpaddr" marked dma-noncoherent\n",
> +           hw_its->addr);
> +}
> +
>  static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
>  {
>      const struct its_quirk *quirk = gicv3_its_find_quirk(hw_its);
> @@ -144,6 +159,8 @@ static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
>          gicv3_lpi_update_host_flags(quirk->lpi_flags);
>          printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
>      }
> +
> +    gicv3_its_collect_fw_attrs(hw_its);
>  }
>  
>  uint64_t gicv3_mem_get_cacheability(uint32_t flags)
> @@ -578,7 +595,7 @@ static int gicv3_disable_its(struct host_its *hw_its)
>      return -ETIMEDOUT;
>  }
>  
> -static int gicv3_its_init_single_its(struct host_its *hw_its)
> +static int __init gicv3_its_init_single_its(struct host_its *hw_its)
These __init additions have nothing to do with dma-noncoherent and
are not mentioned in the commit message. They belong with patch 2/4,
which is where the callees became __init.

>  {
>      uint64_t reg;
>      int i, ret;
> @@ -1221,7 +1238,7 @@ static void gicv3_its_acpi_init(void)
>  
>  #endif
>  
> -int gicv3_its_init(void)
> +int __init gicv3_its_init(void)
>  {
>      struct host_its *hw_its;
>      int ret;
> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> index 35f93e4756..c6f17b9b2d 100644
> --- a/xen/arch/arm/gic-v3-lpi.c
> +++ b/xen/arch/arm/gic-v3-lpi.c
> @@ -7,7 +7,9 @@
>   * Copyright (C) 2016,2017 - ARM Ltd
>   */
>  
> +#include <xen/acpi.h>
>  #include <xen/cpu.h>
> +#include <xen/device_tree.h>
>  #include <xen/lib.h>
>  #include <xen/mm.h>
>  #include <xen/param.h>
> @@ -101,6 +103,20 @@ void __init gicv3_lpi_update_host_flags(uint32_t flags)
>      host_lpi_flags |= flags;
>  }
>  
> +static void __init gicv3_lpi_collect_fw_attrs(void)
> +{
> +    /*
> +     * A top-level GIC node property describes the Redistributor side of the
> +     * LPI path. Do not inherit it into per-ITS policy.
> +     */
> +    if ( !acpi_disabled ||
> +         !dt_property_read_bool(dt_interrupt_controller, "dma-noncoherent") )
> +        return;
> +
> +    gicv3_lpi_update_host_flags(GICV3_QUIRK_MEM_NC_NS);
> +    printk("GICv3: GIC node marked dma-noncoherent for host LPI tables\n");
> +}
> +
>  static union host_lpi *gic_get_host_lpi(uint32_t plpi)
>  {
>      union host_lpi *block;
> @@ -442,7 +458,7 @@ integer_param("max_lpi_bits", max_lpi_bits);
>   * to the page with the actual "union host_lpi" entries. Our LPI limit
>   * avoids excessive memory usage.
>   */
> -int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
> +int __init gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
>  {
>      unsigned int nr_lpi_ptrs;
>      int rc;
> @@ -450,6 +466,10 @@ int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits)
>      /* We rely on the data structure being atomically accessible. */
>      BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsigned long));
>  
> +    gicv3_lpi_collect_fw_attrs();
> +    if ( host_lpi_flags )
> +        printk("GICv3: host LPI workaround flags: %#x\n", host_lpi_flags);
Every contributor to host_lpi_flags already prints its own line -
"enabling workaround for ITS: %s" from the quirk path. Please drop this one.

~Michal


