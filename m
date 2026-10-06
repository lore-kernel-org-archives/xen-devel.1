Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4A0CA5FFC
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 11:47:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441444.1659047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE3dB-0002ox-IA; Tue, 06 Oct 2026 11:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441444.1659047; Tue, 06 Oct 2026 11:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE3dB-0002oq-FS; Tue, 06 Oct 2026 11:46:49 +0000
Received: by outflank-mailman (input) for mailman id 1441444;
 Tue, 06 Oct 2026 11:46:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xE3dA-0002ok-02
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 11:46:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE3d8-004ieN-P2
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 13:46:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac4dfa5-2eae-0a2a0a5409dd-0a2a4501c6b2-2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 13:46:46 +0200
Received: from [52.101.46.40]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac4dfa1-5984-0a2a45010019-34652e289af9-4
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 13:46:43 +0200
Received: from CH5P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::16)
 by DS2PR12MB101350.namprd12.prod.outlook.com (2603:10b6:8:70c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 6 Oct
 2026 11:44:56 +0000
Received: from CH01EPF000BE942.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::14) by CH5P222CA0005.outlook.office365.com
 (2603:10b6:610:1ee::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 11:44:56 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH01EPF000BE942.mail.protection.outlook.com (10.167.244.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 6 Oct 2026 11:44:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 06:44:54 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 06:44:54 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 6 Oct 2026 06:44:52 -0500
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
 b=nO1Y/Hdx4UpOybCEnuO6PrJ3GgR1nrOn8elbz7utEV+qOgk0c8PAcS9ngncIr+qClCqGRAsFzOjaRb4R80b6fH+Nj3fZXRZMj2xjH2+TvoTIB2BwZz5iLxHOOI0qEJcys2nCop1HwzPN+P4Ymk91lihQ4KA7Xk8J6F+M7vsN9Oob87Oy9vxpntcB7XaYotEhLBrKwciET3CUYXYr5anEVi4uLdLHHQvV7dxiPukRPjy2X1mhwf9ZmqtipkNNbNv/cqBLU+Z1bsZHKLq8SjGdwB34r+q4KCauW2SAhJ9TYIypX/hqhjg0dzEpfbemPyWqO+vqG74tb1M6wzQKlQ8JFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoIyXDHzmHyxkVK7AU6CkW5eKjdahmgD6PSzYSvP+zA=;
 b=pxtAIpjUoc7S1/cncWZtucJOgk0FXG5FlvPnWolhWyZJOTFQ1mZcgqqd58oBUZ4VfPJvLN551DWCu/Gr72L9UM1smp7S54ZaZauNP7yt3oTDzKFx+UMdN1gs/6gj84p2agDbE0QhTeoP1bjLSv/c+gxccoLQFMSQHt9xu18T13x0NQDDIjzQ5XQZJXNakTs6GIJa6y3dSrGCRod3QoMacg0AI0jhCkWem4C1J0Vb9m0lSxgO1hIP2arbbby7/v8XtWvcDJzNJ+LEw3g3/ylcT2PaDdFevIZKhqhtgfPiwmEwXjky4DshD6LtAwZyRaaZ4Dz88uEOSOJ0NHibSepZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoIyXDHzmHyxkVK7AU6CkW5eKjdahmgD6PSzYSvP+zA=;
 b=h0ScYJdTaIzAhJklVvrbEyq3JhMlcu6sWdkF/smy99AxCDB9r13pwuEs+q3bSFfd7rOVDNK7rmu3W/CcbHJqgZDiJFdip09pdaeKzkf7j4z0dOPO/9Ph8qooM6Cy6DejaDMiqIuHET/b6iyPuQw2sGurl57zo0j5tErBV2nWrlE=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <3aa383cb-5850-4975-8054-cade5afd38ea@amd.com>
Date: Tue, 6 Oct 2026 13:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Teddy Astie <teddy.astie@vates.tech>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <41d073a1c07e10f0d86da4a31e7a91b7ffadd8d3.1790947567.git.oleksii_moisieiev@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <41d073a1c07e10f0d86da4a31e7a91b7ffadd8d3.1790947567.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE942:EE_|DS2PR12MB101350:EE_
X-MS-Office365-Filtering-Correlation-Id: 230a51f4-81ed-4cae-5193-08df239f3e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|23010399003|1800799024|18002099003|22082099003|11063799006|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	VUaHVD45Nhdg8P+xspFc6am7rVgxgmExcRR7eR5NTRdLnM9ID8lmunW0Fa189h7VEqI4Yb1q+N838uuTGoxWtgDJItdsG4Emzo76Uc5VVF+8Ki03iZLrcBPwBk1kgfdVukJxIagD3it7sozCkh0iA6izsF3Xe8Y/bPyGjgbhW/n9CXJUJYUwGfNK2nfxkeoGMKV9pXsi+vIEPurCv1Y/V4cn+1w68h8amqScMXImkPzYz+NjtEOggRk/qWLrZkQNsOjMM1phQo5wMlj3aPcGXLybtd7+iF2EOSmQB34VjJrRlNH1t32bHUjCFYZjoZ7uIoa/9XHJdAoLLS6tmtHgQIjrMi2YRR32p22leDMb4xAnk96CMnZNS48aI/Qi6cuVwQ2bBpC9Ui0d/ZPctHCb55T7cW3j9FozQn7dGVKgTxqZXt+zzq5o0IdGFcc0ur0+LJpTSyC2KvxmPBoUzZEEaRJA9SlMox4STNNV3C0CJ+M3enWx5Fy0CK0GJmkQ7AiQLk51I0GTJvzZDbHbXBiAtfDuI0xYZ3mJW4fT+nkKX8gYL7er+v2I8kSlJwf5mgKkjY3p1IPSVa1EgFrFGvxv0uYCNVgf0AJqMfbqI4/TIzLlXrg0e1v7U2FiX/btd7TBYuGWSiKOI3oo8mhp3i88EkMdBTVXL/q1HhvmUMMbd/tThtai41Xlpui+Wzoy0Xq/mnYmxu9uexi/bcBIaTdSmQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e8VlQVuumN09BJus78YsRwP92Z/s3MJfE0QcgzNnV6WJk6DFTz/LHravl8w00PXO4mSYpqmnmZ/D7pl5PSLNIpvpcYxzujZXjT0mpBTPy2cl7gZkndzUHtr4Ov9Xr1azaVheC0TMGb+B1JshYJegCK8yfr2idebWBLhjBdFm7esYlIOinMIs39NE/1y/zevhiwAYe8k9mOVk3LL3U1inRGF4GVwsbuOPjqZmavFP0jZG+0wd+ZZrGxHSw/OIfCTuyNTVCEJDoa7m0z3RsyLHcBKNr3aiFsSabSWXoKDU8LP2DdWPSs5BPn935aUqIIABpgmUUkaN6txxHixFvpP895R/B24uz8M1Aa+lEvzrgMv2XTYyGr2Au3aLIW0YHPs7h+d7Rp7F0V76LmM6uMlhnCxuXZQ7J0wPueyleeHhb9XK422uAxBQSzoWHuhAKO9d
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 11:44:55.9370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 230a51f4-81ed-4cae-5193-08df239f3e2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE942.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB101350
X-purgate-ID: tlsNG-d62444/1791287203-C5540757-905ACC69/10/78276251493
X-purgate-type: spam
X-purgate-size: 7425



On 02-Oct-26 15:26, Oleksii Moisieiev wrote:
> This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
> allow for building Xen without support for booting a regular domain (Dom0).
> This functionality is primarily intended for the ARM architecture.
> 
> A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
> default for ARM and X86 architecture. This symbol signifies that an
> architecture has the capability to support a Dom0.
> 
> The `DOM0_BOOT` option depends on `HAS_DOM0` and defaults to 'y'. For
> expert users, this option can be disabled (`CONFIG_EXPERT=y` and no
> `CONFIG_DOM0_BOOT` in the config), which will compile out the Dom0
> creation code on ARM. This is useful for embedded or dom0less-only
> scenarios to reduce binary size and complexity.
> 
> The ARM boot path has been updated to panic if it detects a non-dom0less
> configuration while `CONFIG_DOM0_BOOT` is disabled, preventing an invalid
> boot.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> ---
> 
> Changes in v5:
> - rebased on top of the latest staging.
> - add Ack
> 
> Changes in v4:
> - change Misra rule to 2.1 from 2.2 in description
> - remove extra dependencies for ARM architecture from DOM0_BOOT
> - rephrase DOM0_BOOT help by adding hyperlaunch
> - DOM0_BOOT is mandatory for x86 architecture
> 
> Changes in v3:
> - rephrase error message when dom0less mode wasn't detected while dom0
> is disabled.
> - rephrase help message for DOM0_BOOT config option
> - update DOM0_BOOT dependencies for X86
> 
> Changes in v2:
> - decided not to rename HAS_DOM0 (HAS_OPTIONAL_DOM0 was another option
> suggested in ML) because in this case HAS_DOM0LESS should be renamed
> either.
> - fix order of HAS_DOM0 config parameter
> - add HAS_DOM0 option to x86 architecture.
> 
> CONFIG_DOM0_BOOT Kconfig option was introduced to make the Dom0
> regular (legacy) domain an optional feature that can be compiled out
> from the Xen hypervisor build.
> 
> The primary motivation for this change is to enhance modularity and
> produce a cleaner, more specialized hypervisor binary when a control
> domain is not needed. In many embedded or dedicated systems, Xen is
> used in a "dom0less" configuration where guests are pre-configured and
> launched directly by the hypervisor. In these scenarios, the entire
> subsystem for booting and managing Dom0 is unnecessary.
> 
> This approach aligns with software quality standards like MISRA C,
> which advocate for the removal of unreachable or unnecessary code to
> improve safety and maintainability. Specifically, this change helps adhere to:
> 
> MISRA C:2012  Rule 2.1: "A project shall not contain unreachable code"
But with this patch you will introduce a lot of unreachable code anyway.

> 
> In a build configured for a dom0less environment, the code responsible
> for creating Dom0 would be considered "dead code" as it would never be
> executed. By using the preprocessor to remove it before compilation,
> we ensure that the final executable is free from this unreachable
> code. This simplifies static analysis, reduces the attack surface,
> and makes the codebase easier to verify, which is critical for
> systems requiring high levels of safety and security.
> 
> ---
>  xen/arch/arm/Kconfig        |  1 +
>  xen/arch/arm/domain_build.c |  8 ++++++++
>  xen/arch/arm/setup.c        | 13 ++++++++++---
>  xen/arch/x86/Kconfig        |  1 +
>  xen/common/Kconfig          | 12 ++++++++++++
>  5 files changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 06289005f4..6d0936b353 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -18,6 +18,7 @@ config ARM
>  	select GENERIC_UART_INIT
>  	select HAS_ALTERNATIVE if HAS_VMAP
>  	select HAS_DEVICE_TREE_DISCOVERY
> +	select HAS_DOM0
>  	select HAS_DOM0LESS
>  	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
>  	select HAS_SHARED_INFO
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 72d5316180..cc932d7686 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -43,8 +43,10 @@
>  #include <asm/grant_table.h>
>  #include <xen/serial.h>
>  
> +#ifdef CONFIG_DOM0_BOOT
>  static unsigned int __initdata opt_dom0_max_vcpus;
>  integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
> +#endif
What about the other dom0-only options: dom0_mem (and CONFIG_DOM0_MEM),
dom0-llc-colors and dom0=sve?

>  
>  /*
>   * If true, the extended regions support is enabled for dom0 and
> @@ -123,6 +125,7 @@ paddr_t __init hwdom_get_fdt_alloc_size(void)
>      return ACPI_DOM0_FDT_MIN_SIZE;
>  }
>  
> +#ifdef CONFIG_DOM0_BOOT
>  unsigned int __init dom0_max_vcpus(void)
>  {
>      if ( opt_dom0_max_vcpus == 0 )
> @@ -135,6 +138,7 @@ unsigned int __init dom0_max_vcpus(void)
>  
>      return opt_dom0_max_vcpus;
>  }
> +#endif
>  
>  /*
>   * Insert the given pages into a memory bank, banks are ordered by address.
> @@ -1862,6 +1866,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>      return 0;
>  }
>  
> +#ifdef CONFIG_DOM0_BOOT
>  static int __init construct_dom0(struct domain *d)
This makes dom0_set_llc_colors() unreachable. The same goes for
prepare_acpi() with ACPI=y, as dom0less is DT only. ACPI should be prevented
when DOM0_BOOT=n.

>  {
>      struct kernel_info kinfo = KERNEL_INFO_INIT;
> @@ -1893,6 +1898,7 @@ static int __init construct_dom0(struct domain *d)
>  
>      return construct_hwdom(&kinfo, NULL);
>  }
> +#endif
>  
>  int __init construct_hwdom(struct kernel_info *kinfo,
>                             const struct dt_device_node *node)
> @@ -1944,6 +1950,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
>      return construct_domain(d, kinfo);
>  }
>  
> +#ifdef CONFIG_DOM0_BOOT
>  void __init create_dom0(void)
>  {
>      struct domain *dom0;
> @@ -2001,6 +2008,7 @@ void __init create_dom0(void)
>  
>      set_xs_domain(dom0);
>  }
> +#endif /* CONFIG_DOM0_BOOT */
>  
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 16f899dff5..ea9c037fba 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -491,11 +491,18 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
>  
>      do_init_boottests();
>  
> -    /* Create initial domain 0. */
> -    if ( !is_dom0less_mode() )
> +    if ( IS_ENABLED(CONFIG_DOM0_BOOT) && !is_dom0less_mode() )
> +    {
> +        /* Create initial domain 0. */
>          create_dom0();
> +    }
>      else
> -        printk(XENLOG_INFO "Xen dom0less mode detected\n");
> +    {
> +        if ( is_dom0less_mode())
Missing space after () and before )

> +            printk(XENLOG_INFO "Xen dom0less mode detected\n");
> +        else
> +            panic("Neither dom0 nor dom0less mode was detected, aborting\n");
> +    }
To avoid calling is_dom0less_mode() twice, how about:

    if ( is_dom0less_mode() )
        printk(XENLOG_INFO "Xen dom0less mode detected\n");
    else if ( IS_ENABLED(CONFIG_DOM0_BOOT) )
        create_dom0();
    else
        panic("Neither dom0 nor dom0less mode was detected, aborting\n");

~Michal


