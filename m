Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1A0C88E75
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 09:59:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421587.1647363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6PwQ-0003sX-CL; Tue, 15 Sep 2026 09:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421587.1647363; Tue, 15 Sep 2026 09:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6PwQ-0003sQ-9R; Tue, 15 Sep 2026 09:59:06 +0000
Received: by outflank-mailman (input) for mailman id 1421587;
 Tue, 15 Sep 2026 09:59:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x6PwO-0003sD-Sg
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 09:59:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6PwN-00GA70-9Q
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 11:59:03 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa916e0-e002-0a2a0a5209dd-0a2a45089b1e-20
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 11:59:02 +0200
Received: from [52.101.46.31]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa916e4-f659-0a2a45080019-34652e1f5631-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 11:59:02 +0200
Received: from BN0PR02CA0046.namprd02.prod.outlook.com (2603:10b6:408:e5::21)
 by MN0PR12MB6055.namprd12.prod.outlook.com (2603:10b6:208:3cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 15 Sep
 2026 09:58:57 +0000
Received: from BN2PEPF0000A895.namprd04.prod.outlook.com
 (2603:10b6:408:e5:cafe::88) by BN0PR02CA0046.outlook.office365.com
 (2603:10b6:408:e5::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 09:58:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A895.mail.protection.outlook.com (10.167.248.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 09:58:57 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 04:58:56 -0500
Received: from [10.59.21.158] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 15 Sep 2026 04:58:55 -0500
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
 b=E8S5vOr8cHMiuAULtSVo0sFWZdMD/yKZcBtdrazuFptTpkPsaS1vyisi6Bjbz3ivxVAcjhavFyyAYpK5Cuyj2ojAzNizjHbOf44hdqEw2jAixPFMdH32kcQIzLAyxjnggOzUZY3N9BsOFCBQ+sTpHorNr6b7DXC+LPv06tzuZj9mzA9B6hpYxebDo3Y8oiLz1/aGeAxnT67RBB/zvjYxLCF6ofSENRlt6qV823SHBts7R2R3NKsp7xuL/ykbK6mJ2uTGc35qCTLzPMiEHPNubkUUqUEIOXGD7ltoHy8jw2pUgaGBibeaZ8ULrzr7GgZ4SSqrd0cYYiijIR9cuVeDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KywGxKMrh44b9K61tCSeBZhvRqdD6BlG94XY3KfEqaA=;
 b=kzfo8Ki+AKbJbGqhkzDtQTzuNCueEQLcUd5TjuaXXR7KHIzcaqmnSj+Y3prE+RRi7LG3u/iY//DYVn2O7lFacwoIat110cOh/jzFsNpFEAw0RMK8qxGNC1f6l9RcCBhuuNIa4JSmn+bAp8lg1c5D2bELp5e+HCqRUmaYrOXhGKQIGfA6orea/bzKEu5UqoPo+3ocelkIH3DeaXBjZsxaH6SbezNK1CjihzT9dRh5aLXd9ES3JmflpzMjiPyxhrVpY9PfgTZKBCBGj4ry79Tw5i/aeLrQV2zi2Ddw//SSNDymT0+daHyBSMJnbjmKWNj39LCxVhBnmPylD49foFI4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ti.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KywGxKMrh44b9K61tCSeBZhvRqdD6BlG94XY3KfEqaA=;
 b=EOoURSt2FLbw1CHMKFmRHzEJLjYcKKmqAJvZmTf4oRbSiyWt0JHk5UeZNXe6NorYrH0zmkxO+Uf7XTL+H6O7oN0HazLlQaVXDc3dH36ATQEd8xxDNwrHyJv94xXHeB9c1Jf2KtugtOmHd2km+PAHDI2Ou9tER7bMS7HRKuwSyAw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <cd1be7dd-5262-42d8-a935-a8461d18e18c@amd.com>
Date: Tue, 15 Sep 2026 11:58:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Add support to passthrough reserved memory carveouts
 to DomU
To: Beleswar Padhi <b-padhi@ti.com>, <sstabellini@kernel.org>,
	<julien@xen.org>, <bertrand.marquis@arm.com>
CC: <u-kumar1@ti.com>, <detheridge@ti.com>, <jbergsagel@ti.com>,
	<xen-devel@lists.xenproject.org>
References: <20260915082824.2180692-1-b-padhi@ti.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260915082824.2180692-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A895:EE_|MN0PR12MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 569f70ff-5e98-41ce-82f7-08df130ff559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|10067099003|22082099003|11063799006|56012099006|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	6yZKmSayIT6bLcor3Dhi6U6M0Ng3ocUT2QMasuS7JFrCESOeaykA17ETt+rOkvI5LCoUYcH8/oqXNHE/zkK/GAZNBR6Z1bQUjuE4ufcqSHDYZLPVxVWD0AqSBnIRSx9yqdzYY2xhcRGaSOiykqXQXHGWr4KVJ53U/wCFUd94S8sFBBW+xa7yJnT5LfT1QSeIvDMMKRJ3H2J9lDCFtOxiY5MxIxryul0TnMGJM9Hq6eElZUVz4NiWv2IvH6BxwnDgnQm5cVnVcPY1gYBgmB446zsbonGTZxOBQmVfL9OF/v8vTyc2ycEDEG9cOiRX21PMIAlh0JzFV27YhwCJ+nN7AjSdAWMifXqy04nCSA5QDjCdcrGLpPvEUWo5RCRtlVyMV8hwmspV4sPP3dnDMUIh/yZLTi5/v9Z5/BUAgf8+hixu/JL6M35wCvGXAeHOr2mHj5qq4wVWhT7PNmx5XukJnj1xkwga8BRcewMjO74VUpl2ANTlaTRz5LqVMkQTLZuHj26CwLJ99AieeJOtXuTzL3/YU64mxBNkncoeAVrt8L+jiLXLNaNI+xpmcCyb8vT+uxa8qla64fnOK5N9btDLvJQuqv93kb2Fg6rUNg5cYlgnOzs6q9U5gCth5JEvW3RMaQFzeEVMGtZ6L9cS+Nkozw5wFE2YQ/OIeIdOz9L62phmwEhG5WW0qnQom3yj4AjCCWN40T+3Wlq5FF3PfWPjrA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(10067099003)(22082099003)(11063799006)(56012099006)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Jv65bECHlpovCzGvZEXD2+0iYGsSfQZ4pOXp58dOE7MxdESB1zG28Ho4kcXyOJ58a8XRIZR6wpgFepKRCGXNzaDcpkDZP1TFp39lp+PM4b26vjKzFyPAmFSUhnt0LvYkd90QCVkQ1pWJ2fKvWAKRXVTSQmWK4qB/Bb79/gwtejsZFIHKpvW9UaHYxhBDxtlxih6E+1OkaGjaWZ5sA6yYDyHCxN1U/BqCj9kdJgR8pKWp89eeF5jR9ChaZcuVRO8QG/JAMKRRJxS1l7zuafl+UrAQKgAq0LZt7qbwn+Ai6WnOXhN6qv1tCdA/4vof+m+s4HDEJRC02rGn4UxwxJ32PmxjU6tZkBjZxOlY9HRO3GoApYxW//9ezXDIjmpaFAQpVpEMIwkHYAkaiBS3u5CE+wv15shA5g7xShe18H0HVX6polNfhpynTnnjSSo3eS2e
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:58:57.1199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 569f70ff-5e98-41ce-82f7-08df130ff559
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A895.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6055
X-purgate-ID: tlsNG-c1860d/1789466342-D554C87B-ECCCA531/0/0
X-purgate-type: clean
X-purgate-size: 7901

Hi,

On 15-Sep-26 10:28, Beleswar Padhi wrote:
> Currently Xen only looks for /passthrough and /aliases nodes. Add
> support to parse the /reserved-memory node and pass it through as
> requested to DomUs. This is useful to enable many usecases in DomUs
> like Remoteproc firmware carveouts, CMA carveouts etc.
> 
> If Xen's static shared memory carveout is found, it is placed as child
> nodes under the top level /reserved-memory node as also done in commit
> 51a2b3f10918 ("xen/arm: fix duplicate /reserved-memory node in Dom0").
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
I'm afraid adding support for passthroughing /reserved-memory nodes like this
patch does is unfortunately not enough to help with the common use cases these
days. /reserved-memory nodes got complex from Xen PoV mainly because of the
"reusable" property that lets OS (say Linux) use such memory for whatever it
wants until device asks for it. The common use case is "shared-dma-pool" and CMA
buffers. They specify "reusable" (hence no "no-map"). This causes a few issues:
1) Xen maps memory for passthroughed regions for domUs as device memory (keep in
mind the rules from Arm ARM for joining stage 1 and stage 2 memory attributes -
device type is the most stringent one and wins) but for shared memory it should
be normal memory.

2) Linux can use such reserved memory region as normal RAM and hence use it for
Xen shared buffers (e.g. hypercall buffers, shared memory, etc.). As per
arch-arm.h any memory shared between guest and Xen needs to be of normal type.

3) Xen does not give reserved memory to the allocators and does not have backing
page_info structs for such pages. If such memory ends up being used with Xen
(e.g. to map foreign pages) such access will fail because Xen will not be able
to get pages for such region.

Problem 3) exists today also for hwdom. Problems 1) and 2) are gone because Xen
maps memory of passthroughed nodes for hwdom in a more relaxed way so guest
attributes win.

This is high on my TODO list because there is a real need from customers to add
a proper support but I don't have any bandwidth this year to do any work.

I guess your solution would only work for the simplest use case which is for
/reserved-memory nodes with only "no-map" property present. We could limit the
support for only such nodes (check if it contains "reusable" property and if so,
bail out) as a temporary solution if this helps.

~Michal
 > ---
> Hello all,
> 
> Sending this patch as discussed in:
> https://lore.kernel.org/all/0e556bb5-269d-47d7-9ae8-68f06eee9fc0@ti.com/
> 
> Test Configurations & Logs:
> https://gist.github.com/3V3RYONE/bef3bb51459f8b823605261b35494a7e
> 
> Thanks,
> Beleswar
> 
>  xen/common/device-tree/dom0less-build.c | 45 +++++++++++++++++++------
>  1 file changed, 34 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index fcbeb8adbd..e9581327ee 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -334,7 +334,7 @@ static int __init handle_prop_pfdt(struct kernel_info *kinfo,
>  static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>                                   int nodeoff,
>                                   uint32_t address_cells, uint32_t size_cells,
> -                                 bool scan_passthrough_prop)
> +                                 bool scan_passthrough_prop, bool resv_mem_node)
>  {
>      int rc = 0;
>      void *fdt = kinfo->fdt;
> @@ -358,13 +358,20 @@ static int __init scan_pfdt_node(struct kernel_info *kinfo, const void *pfdt,
>      while ( node_next > 0 )
>      {
>          rc = scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells,
> -                            scan_passthrough_prop);
> +                            scan_passthrough_prop, false);
>          if ( rc )
>              return rc;
>  
>          node_next = fdt_next_subnode(pfdt, node_next);
>      }
>  
> +    if ( resv_mem_node )
> +    {
> +        rc = make_shm_resv_memory_node(kinfo, address_cells, size_cells);
> +        if ( rc )
> +            return rc;
> +    }
> +
>      return fdt_end_node(fdt);
>  }
>  
> @@ -389,7 +396,8 @@ static int __init check_partial_fdt(void *pfdt, size_t size)
>  }
>  
>  static int __init domain_handle_dtb_boot_module(struct domain *d,
> -                                                struct kernel_info *kinfo)
> +                                                struct kernel_info *kinfo,
> +                                                bool *found_reserved_mem_node)
>  {
>      void *pfdt;
>      int res, node_next;
> @@ -430,8 +438,8 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>              continue;
>  
>          /*
> -         * Only scan /$(interrupt_controller) /aliases /passthrough,
> -         * ignore the rest.
> +         * Only scan /$(interrupt_controller) /aliases /passthrough
> +         * /reserved-memory, ignore the rest.
>           * They don't have to be parsed in order.
>           *
>           * Take the interrupt controller phandle value from the special
> @@ -445,7 +453,7 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>              res = scan_pfdt_node(kinfo, pfdt, node_next,
>                                   DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>                                   DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
> -                                 false);
> +                                 false, false);
>              if ( res )
>                  goto out;
>              continue;
> @@ -455,11 +463,22 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>              res = scan_pfdt_node(kinfo, pfdt, node_next,
>                                   DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
>                                   DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
> -                                 true);
> +                                 true, false);
>              if ( res )
>                  goto out;
>              continue;
>          }
> +        if ( dt_node_cmp(name, "reserved-memory") == 0 )
> +        {
> +            res = scan_pfdt_node(kinfo, pfdt, node_next,
> +                                 DT_ROOT_NODE_ADDR_CELLS_DEFAULT,
> +                                 DT_ROOT_NODE_SIZE_CELLS_DEFAULT,
> +                                 false, true);
> +            if ( res )
> +                goto out;
> +            *found_reserved_mem_node = true;
> +            continue;
> +        }
>      }
>  
>   out:
> @@ -486,6 +505,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>  {
>      int addrcells, sizecells;
>      int ret, fdt_size = DOMU_DTB_SIZE;
> +    bool found_reserved_mem_node = false;
>  
>      BUILD_BUG_ON(DOMU_DTB_SIZE > SZ_2M);
>  
> @@ -538,7 +558,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>       */
>      if ( kinfo->dtb )
>      {
> -        ret = domain_handle_dtb_boot_module(d, kinfo);
> +        ret = domain_handle_dtb_boot_module(d, kinfo, &found_reserved_mem_node);
>          if ( ret )
>              goto err;
>      }
> @@ -556,9 +576,12 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>      if ( ret )
>          goto err;
>  
> -    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
> -    if ( ret )
> -        goto err;
> +    if ( !found_reserved_mem_node )
> +    {
> +        ret = make_resv_memory_node(kinfo, addrcells, sizecells);
> +        if ( ret )
> +            goto err;
> +    }
>  
>      ret = make_intc_domU_node(kinfo);
>      if ( ret )


