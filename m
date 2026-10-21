Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896C0606A319
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 11:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gaA35V6M
Received: from list by lists.xenproject.org with outflank-mailman.1456919.1669981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJU6W-0001w1-M9; Wed, 21 Oct 2026 11:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456919.1669981; Wed, 21 Oct 2026 11:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJU6W-0001vu-Gh; Wed, 21 Oct 2026 11:03:32 +0000
Received: by outflank-mailman (input) for mailman id 1456919;
 Wed, 21 Oct 2026 11:03:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xJU6U-0001un-6E
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 11:03:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJU6T-007W0j-FR
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:03:29 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ad89bfa-bab6-0a2a0a5309dd-0a2a4503d640-46
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 13:03:28 +0200
Received: from [40.93.201.64]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ad89bff-fae8-0a2a45030019-285dc9406f0b-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 13:03:28 +0200
Received: from BN9PR03CA0322.namprd03.prod.outlook.com (2603:10b6:408:112::27)
 by LV9PR12MB9807.namprd12.prod.outlook.com (2603:10b6:408:2eb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 11:02:46 +0000
Received: from BN3PEPF00022BDA.namprd03.prod.outlook.com
 (2603:10b6:408:112:cafe::93) by BN9PR03CA0322.outlook.office365.com
 (2603:10b6:408:112::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 21 Oct 2026 11:02:46 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BDA.mail.protection.outlook.com (10.167.248.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 11:02:46 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 06:02:46 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 06:02:46 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 21 Oct 2026 06:02:44 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPsr/POziLBaie29wSDJsJ08zTQc6FVwl4nIONQ1Wqt4hvhiV6HUWz/pOvujx2Ia6VpE0mwM3QpcriQI9jHomn31TZEXIAMfA5cYGRw/3+RARWgU1Z8yZ90sp82w49K/ZQU0H8NXykbHcI3nBAcOec4l0xfQUsDvrqFfnYLTfBW68Uwr8iXWlki3Z6DYSOxOw/QKC25n2ycfnd3VFoKDt9RH/iJy9WVooA9tM4U5i5w56L3BLz89QL9q7+Afg8Ww99i1McZOKFQWuT8WdFLYaeM+RDniS3T19SyAKm1JWhnlYAha5aoGvbkaNZg6KcF7kuJ6vcIyYgcU/kAODRyYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8ZgG7fzQivswrw0NfdKa7l9bqdczz0fbxgSeRTh/Yc=;
 b=BXJuGDVYHtnpt0rvIHvEnvarRsXhs/ustoTp+p3sHI2gVtNeTXj26M5lPO+mIWr82zxSLqn6lyne2Ew7SqIFmAbF4RxgBSaX1By/NDy7BLLgSRweW+0/m6KnWCBr+vrXa6ZmeF2xDLArCSuvIF7eTgskeur+CO9YKiiNB+S6ZVZ7F7zKnrRkdewapATxqyliRE9yb1OX2IzCHNaOFrQ0AWwYsJNO0VTqpALcHjsk6xU47hylfoq4jyyPJJ9zqCEhcItBT1WbDZpuqPLqdhtZfCo1X1SAaS64JPVBqJuC82vbEFmrr6G3r1ZWp0vdAxWJ64TAuZKSp1OEX5P0IYf3Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8ZgG7fzQivswrw0NfdKa7l9bqdczz0fbxgSeRTh/Yc=;
 b=gaA35V6MSsk8VaVJolEa23b3rGSS52bwJ2VDPifqqwGTI9yID9HoTQEJfQqVCj922fpap197PtkNb+XKR7rodVuUpAp5W3Hx/oI/pcpTuNxaEeFlTkPblAo32drGRnOjWhThY0ZSlC0F+LFH3nyl0N4bYnBhMy1pYhTO9pLl5vA=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <22b3b21a-775e-4d82-b9bc-5fea1849294c@amd.com>
Date: Wed, 21 Oct 2026 13:02:43 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/4] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>, <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <20261019015749.48492-1-taka@valinux.co.jp>
 <20261019015749.48492-2-taka@valinux.co.jp>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261019015749.48492-2-taka@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BDA:EE_|LV9PR12MB9807:EE_
X-MS-Office365-Filtering-Correlation-Id: f17eb076-de5e-4933-872c-08df2f62d6cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|23010399003|1800799024|6133799003|22082099003|18002099003|10067099003|4143699003|260925021911599003|260925022911599003|260925021311599003|261009223027099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	QWyX1YqJcD2/3Pm24bLcaJ+cv/qo99ayDDItcx2wsbfeffnYVnDj/uEq1ygmDGkS4XIx6N5yrAEn11tfbotA7SEIlxYYUXJdGUVoGGFv/4/KMJ50Fq66+IsL51Mgmyz29xvTjw9ahTv/mV3fDG4f9DT89I5vimdk7/JuVX569uX+xVQn1ZINNGorXvoXB0L162AlY5zYMAnHxSOtfbcKqreAWYd+PnRwK5VlcFfrc3kAR+4qGLt6xY3LeTbLt23vC6KbnGP1zBK7CY+evJcUc7PrvKx8DCrVoKaeMamwaYe0Jq+8Pq+i9dt+VmM82Ecaset8G+8R8WkqdzIF4VEsYSWLiIZFc8hTpmaGuSPnO9js/AR8w3yva5+vqp5RsaPUuYg0omE7S+UYrSaPDKa7lbm5RAPQQ9uUv0EljR8Je0okR7DZUr8J/4la10fXfaW5z6niWKtiFVHWhE7rBarpjCc9tfAU5Ui4WUt1n1Xe7VNAUVmV0I9VCrZ+l7W/12/aWgPjpzGA/8p0Q22MeLYkMgHquBjFCWkkZM5oiOVFzHlj/donF/PqfbmYVrkQ/vYt5YL2w8VmQcvSAAZhKdEVogYOtM7pR2POvNocQGe9XlhZYwcYgnS05dkpdBdv+KafSEh76ZEdaRwAZufQHhqyl8MKbomA/UlBKOE1gnBvObOeFZsiqvIunnzfKZYA68pKhjqFzkb9FFLJyjFztqzC7w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(260925021911599003)(260925022911599003)(260925021311599003)(261009223027099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EefgJ+29yp7833OIV0/OyOiiG46PITJWmyaMt6vF0MfnSZSyq2R9w2PieCjKaIQt+Qg79avxtmJ63np5pidqA8krZLa10ha6OKIUdmsUAzAwBmn/Uc/XdH0xKeq4lFkkm58LyDLCcQPAOO7O9IT/GEZ2WqiHfctjRsxiDqlNIVXkjCc7NHjPinUGG9P5yYGzYzNwlDVgm4pDz+C3xBpAIyoMf9+4H0l/VeDYZDtjJHoBVlSh+BCPukGv7wIDWgwS/QVd8Daw+tTowzpXUjZSBG0lKwW9jiPmsNYreQ4IU9bzBeUsh4UGYU01B3OfH5SwwitoyAHflsGwyrvFMcscinhPHiYhs1Swm/UfKitgcGfmzqW4jJO2mnGy4WS9KdhTO1Vpkz8RyJXsBiUb8yTOX3Zuy13bHyQ7Ov4r0W9CluaFOBAllPXUcWI2LLBM94t8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 11:02:46.6464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f17eb076-de5e-4933-872c-08df2f62d6cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BDA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9807
X-purgate-ID: tlsNG-33051d/1792580608-778C54E9-6FCBE5CE/0/0
X-purgate-type: clean
X-purgate-size: 15800
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 19-Oct-26 03:57, Hirokazu Takahashi wrote:
> Parse the 'cpu-map' node in the Device Tree to extract CPU topology
> information. If the 'cpu-map' node is absent, simply ignore it.
> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> ---
> Changes in v12:
>  - Error reporting for memory allocation failures in init_cpu_topology()
>    into a single error path.
>  - Emit an error message from init_cpu_topology() when
>    dt_init_cpu_topology() or acpi_init_cpu_topology() returns an error,
>    explicitly indicating that CPU topology initialization has failed.
>  - Drop the Reviewed-by tag from patch 0001 due to changes in
>    common/cpu-topology.c.
>  - In dt_smp_init_cpus(), add a comment explaining that the boot core
>    remains valid even if arch_cpu_init() fails.
>  - dt_init_cpu_topology() returns -EINVAL if a leaf node lacks the cpu
>    phandle property or if the target node is not a valid CPU node.
>  - dt_init_cpu_topology() continues parsing subsequent threads instead
>    of returning early when a referenced CPU is not tracked by Xen.
>  - Update the log message when skipping an unmapped CPU to reflect
>    that secondary CPUs have not yet been brought up at this stage.
>  - Remove trailing periods from log messages.
>  - Drop the Reviewed-by tag from patch 0001 due to changes in
>    common/cpu-topology.c.
> 
>  xen/arch/arm/Kconfig                  |   1 +
>  xen/arch/arm/setup.c                  |   3 +
>  xen/arch/arm/smpboot.c                |  10 +
>  xen/common/Kconfig                    |  22 ++
>  xen/common/Makefile                   |   1 +
>  xen/common/cpu-topology.c             |  73 +++++
>  xen/common/cpu.c                      |   5 +
>  xen/common/device-tree/Makefile       |   1 +
>  xen/common/device-tree/cpu-topology.c | 370 ++++++++++++++++++++++++++
>  xen/drivers/acpi/Makefile             |   1 +
>  xen/drivers/acpi/topology.c           |  43 +++
Shouldn't this file be called cpu-topology like the DT equivalent?

>  xen/include/xen/acpi.h                |  13 +
>  xen/include/xen/cpu-topology.h        |  34 +++
>  xen/include/xen/dt-cpu-topology.h     |  35 +++
>  14 files changed, 612 insertions(+)
>  create mode 100644 xen/common/cpu-topology.c
>  create mode 100644 xen/common/device-tree/cpu-topology.c
>  create mode 100644 xen/drivers/acpi/topology.c
>  create mode 100644 xen/include/xen/cpu-topology.h
>  create mode 100644 xen/include/xen/dt-cpu-topology.h
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index b9c5c40678..3d0f689220 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -19,6 +19,7 @@ config ARM
>  	select HAS_ALTERNATIVE if HAS_VMAP
>  	select HAS_DEVICE_TREE_DISCOVERY
>  	select HAS_DOM0LESS
> +	select HAS_GENERIC_CPU_TOPOLOGY
>  	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
>  	select HAS_SHARED_INFO
>  	select HAS_STACK_PROTECTOR
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 2cd1c021b5..c1aa06bd31 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -10,6 +10,7 @@
>  
>  #include <xen/bootinfo.h>
>  #include <xen/compile.h>
> +#include <xen/cpu-topology.h>
>  #include <xen/device_tree.h>
>  #include <xen/dom0less-build.h>
>  #include <xen/domain_page.h>
> @@ -375,6 +376,8 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
>      nr_cpu_ids = smp_get_max_cpus();
>      printk(XENLOG_INFO "SMP: Allowing %u CPUs\n", nr_cpu_ids);
>  
> +    init_cpu_topology();
> +
>      /*
>       * Some errata relies on SMCCC version which is detected by psci_init()
>       * (called from smp_init_cpus()).
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 8c9072f3c1..d34396f9b1 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -9,10 +9,12 @@
>  
>  #include <xen/acpi.h>
>  #include <xen/cpu.h>
> +#include <xen/cpu-topology.h>
>  #include <xen/cpumask.h>
>  #include <xen/delay.h>
>  #include <xen/device_tree.h>
>  #include <xen/domain_page.h>
> +#include <xen/dt-cpu-topology.h>
Nothing in this file seems to use this header

>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/mm.h>
> @@ -245,6 +247,14 @@ static void __init dt_smp_init_cpus(void)
>          }
>          else
>              tmp_map[i] = hwid;
> +
> +        /*
> +         * Because the boot CPU (i == 0) is already running, treat it as valid
> +         * even if arch_cpu_init() fails (e.g. due to a missing enable-method).
> +         */
> +        if ( (rc >= 0) || (i == 0) )
> +            /* Pass the info to dt_init_cpu_topology() */
> +            map_cpu_to_dt_node(i, cpu);
>      }
>  
>      if ( !bootcpu_valid )
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 5b289e444f..fb42f0aa8b 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -140,6 +140,9 @@ config HAS_EX_TABLE
>  config HAS_FAST_MULTIPLY
>  	bool
>  
> +config HAS_GENERIC_CPU_TOPOLOGY
> +	bool
> +
>  config HAS_IOPORTS
>  	bool
>  
> @@ -194,6 +197,25 @@ config VM_EVENT
>  config NEEDS_LIBELF
>  	bool
>  
> +config GENERIC_CPU_TOPOLOGY
> +	bool
> +
> +config DT_CPU_TOPOLOGY
> +	bool "Device tree based CPU topology support"
> +	depends on HAS_GENERIC_CPU_TOPOLOGY && DEVICE_TREE_PARSE
> +	select GENERIC_CPU_TOPOLOGY
> +	help
> +	  Retrieve CPU topology information from the device tree to optimize
> +	  vCPU scheduling.
> +
> +config ACPI_CPU_TOPOLOGY
> +	bool "ACPI based CPU topology support"
> +	depends on HAS_GENERIC_CPU_TOPOLOGY && ACPI
> +	select GENERIC_CPU_TOPOLOGY
> +	help
> +	  Retrieve CPU topology information from the ACPI PPTT to optimize
> +	  vCPU scheduling.
> +
>  config NUMA
>  	bool
>  
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index f69d47d189..d0eb39a633 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -5,6 +5,7 @@ obj-$(CONFIG_GENERIC_BUG_FRAME) += bug.o
>  obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>  obj-$(CONFIG_CORE_PARKING) += core_parking.o
>  obj-y += cpu.o
> +obj-$(CONFIG_GENERIC_CPU_TOPOLOGY) += cpu-topology.init.o
>  obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
>  obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += device.o
>  obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
> diff --git a/xen/common/cpu-topology.c b/xen/common/cpu-topology.c
> new file mode 100644
> index 0000000000..8c64532e28
> --- /dev/null
> +++ b/xen/common/cpu-topology.c
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/acpi.h>
> +#include <xen/cpu-topology.h>
> +#include <xen/cpumask.h>
> +#include <xen/dt-cpu-topology.h>
> +#include <xen/init.h>
> +#include <xen/xvmalloc.h>
> +
> +static void __init free_topology_table(void)
> +{
> +    unsigned int cpu;
> +
> +    if ( !cpu_topology )
> +        return;
> +
> +    for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
> +    {
> +        free_cpumask_var(cpu_topology[cpu].thread_sibling);
> +        free_cpumask_var(cpu_topology[cpu].core_sibling);
> +        free_cpumask_var(cpu_topology[cpu].cluster_sibling);
> +    }
> +
> +    XVFREE(cpu_topology);
> +}
> +
> +void __init init_cpu_topology(void)
> +{
> +    unsigned int cpu;
> +    int ret = 0;
> +
> +    if ( num_possible_cpus() == 1 )
> +        return;
> +
> +    cpu_topology = xvzalloc_array(struct cpu_topology, nr_cpu_ids);
> +
> +    if ( cpu_topology )
> +    {
> +        for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
> +        {
> +            if ( !zalloc_cpumask_var(&cpu_topology[cpu].thread_sibling) ||
> +                 !zalloc_cpumask_var(&cpu_topology[cpu].core_sibling) ||
> +                 !zalloc_cpumask_var(&cpu_topology[cpu].cluster_sibling) )
> +                ret = -ENOMEM;
The loop continues allocating after the first error which is incorrect.

> +        }
> +    }
> +    else
> +        ret = -ENOMEM;
> +
> +    if ( ret != 0 )
> +        printk(XENLOG_WARNING "CPU topology table allocation failed\n");
After printing this one we will also print the "Failed to initialize..." one.
Please goto the error.

> +    else if ( acpi_disabled )
> +        ret = dt_init_cpu_topology();
> +    else
> +        ret = acpi_init_cpu_topology();
> +
> +    /* Free the CPU topology table if initialization fails. */
> +    if ( ret != 0 )
In v11 I asked you to print error on real failure, not all the time e.g. on -
EOPNOTSUPP or ENOENT as a result of not finding cpu-map.

> +    {
> +        printk("Failed to initialize cpu topology (error %d)\n", ret);
XENLOG_ERR/WARNING?

> +        free_topology_table();
> +    }
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/common/cpu.c b/xen/common/cpu.c
> index f09af0444b..9591ada60a 100644
> --- a/xen/common/cpu.c
> +++ b/xen/common/cpu.c
> @@ -1,5 +1,6 @@
>  #include <xen/cpumask.h>
>  #include <xen/cpu.h>
> +#include <xen/cpu-topology.h>
>  #include <xen/event.h>
>  #include <xen/init.h>
>  #include <xen/sched.h>
> @@ -46,6 +47,10 @@ const unsigned long cpu_bit_bitmap[BITS_PER_LONG+1][BITS_TO_LONGS(NR_CPUS)] = {
>  #undef MASK_DECLARE_2
>  #undef MASK_DECLARE_1
>  
> +#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
> +struct cpu_topology *__ro_after_init cpu_topology;
> +#endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
> +
>  static DEFINE_RWLOCK(cpu_add_remove_lock);
>  
>  bool get_cpu_maps(void)
> diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
> index 730d202349..b15b3382d2 100644
> --- a/xen/common/device-tree/Makefile
> +++ b/xen/common/device-tree/Makefile
> @@ -1,6 +1,7 @@
>  obj-y += bootfdt.init.o
>  obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo-fdt.init.o
>  obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo.init.o
> +obj-$(CONFIG_DT_CPU_TOPOLOGY) += cpu-topology.init.o
>  obj-y += device-tree.o
>  obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
>  obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
> diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
> new file mode 100644
> index 0000000000..bfcf153cc4
> --- /dev/null
> +++ b/xen/common/device-tree/cpu-topology.c
> @@ -0,0 +1,370 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Derived from Linux kernel 7.0's $drivers/base/arch_topology.c
> + * Parse cpu topology information.
> + */
> +
> +#include <xen/acpi.h>
> +#include <xen/cpu-topology.h>
> +#include <xen/cpumask.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +
> +#define INVALID_TOPO_ID (~0U)
> +
> +struct cpu_map {
> +    unsigned int thread_id;
> +    unsigned int core_id;
> +    unsigned int cluster_id;
> +    unsigned int socket_id;
> +};
> +
> +static struct cpu_map __initdata cpu_map[NR_CPUS] = {
> +    [0 ... NR_CPUS - 1] = {
> +        .thread_id = INVALID_TOPO_ID,
> +        .core_id = INVALID_TOPO_ID,
> +        .cluster_id = INVALID_TOPO_ID,
> +        .socket_id = INVALID_TOPO_ID,
> +    },
> +};
> +static struct dt_device_node *__initdata dt_cpu_table[NR_CPUS];
> +
> +static void __init setup_siblings_masks(unsigned int target_cpu)
> +{
> +    struct cpu_topology *target_topo = &cpu_topology[target_cpu];
> +    const struct cpu_map *target_map = &cpu_map[target_cpu];
> +    unsigned int cpu;
> +
> +    /* Update cluster, core and thread sibling masks */
> +    for_each_possible_cpu(cpu)
> +    {
> +        struct cpu_topology *cpu_topo = &cpu_topology[cpu];
> +        const struct cpu_map *map = &cpu_map[cpu];
> +
> +        if ( target_cpu > cpu )
> +            continue;
> +
> +        if ( target_map->socket_id != map->socket_id )
> +            continue;
> +
> +        cpumask_set_cpu(target_cpu, cpu_topo->core_sibling);
> +        cpumask_set_cpu(cpu, target_topo->core_sibling);
> +
> +        if ( target_map->cluster_id != map->cluster_id )
> +            continue;
> +
> +        cpumask_set_cpu(target_cpu, cpu_topo->cluster_sibling);
> +        cpumask_set_cpu(cpu, target_topo->cluster_sibling);
> +
> +        if ( target_map->core_id != map->core_id )
> +            continue;
> +
> +        cpumask_set_cpu(target_cpu, cpu_topo->thread_sibling);
> +        cpumask_set_cpu(cpu, target_topo->thread_sibling);
> +    }
> +}
> +
> +static const struct dt_device_node *__init dt_find_child_node_by_name(
> +    const struct dt_device_node *dt,
> +    const char *name)
> +{
> +    const struct dt_device_node *np;
> +
> +    dt_for_each_child_node(dt, np)
> +        if ( np->name && dt_node_name_is_equal(np, name) )
> +            return np;
> +
> +    return NULL;
> +}
> +
> +void __init map_cpu_to_dt_node(unsigned int cpu,
> +                               struct dt_device_node *cpu_node)
> +{
> +    if ( cpu < ARRAY_SIZE(dt_cpu_table) )
> +        dt_cpu_table[cpu] = cpu_node;
> +    else
> +        printk(XENLOG_WARNING
> +               "cpu %u exceeds the max cpus %zu\n",
> +               cpu, ARRAY_SIZE(dt_cpu_table));
> +}
> +
> +static unsigned int __init cpu_node_to_id(
> +    const struct dt_device_node *cpu_node)
> +{
> +    unsigned int cpu;
> +
> +    for_each_possible_cpu(cpu)
> +        if ( cpu_node == dt_cpu_table[cpu] )
> +            return cpu;
> +
> +    return INVALID_TOPO_ID;
> +}
> +
> +/*
> + * This function returns the Xen cpu number of the DT node.
> + */
> +static int __init get_cpu_for_node(
> +    const struct dt_device_node *dt_node, unsigned int *cpu)
> +{
> +    const struct dt_device_node *cpu_node =
> +        dt_parse_phandle(dt_node, "cpu", 0);
> +
> +    if ( !cpu_node || !dt_device_type_is_equal(cpu_node, "cpu") )
> +    {
> +        *cpu = INVALID_TOPO_ID;
> +        return -EINVAL;
> +    }
> +
> +    *cpu = cpu_node_to_id(cpu_node);
> +
> +    return 0;
> +}
> +
> +static bool __init is_cpu_map_empty(unsigned int cpu)
> +{
> +    return (cpu_map[cpu].socket_id == INVALID_TOPO_ID) &&
> +           (cpu_map[cpu].cluster_id == INVALID_TOPO_ID) &&
> +           (cpu_map[cpu].core_id == INVALID_TOPO_ID) &&
> +           (cpu_map[cpu].thread_id == INVALID_TOPO_ID);
> +}
> +
> +static int __init parse_core(const struct dt_device_node *core,
> +                             unsigned int socket_id,
> +                             unsigned int cluster_id,
> +                             unsigned int core_id)
> +{
> +    bool leaf = true;
> +    unsigned int thread_id;
> +    unsigned int cpu;
> +    int ret;
> +
> +    for ( thread_id = 0; ; thread_id++ )
> +    {
> +        const struct dt_device_node *thread;
> +        char name[20];
> +
> +        snprintf(name, sizeof(name), "thread%u", thread_id);
> +        thread = dt_find_child_node_by_name(core, name);
> +
> +        if ( !thread )
> +            break;
> +
> +        leaf = false;
> +        ret = get_cpu_for_node(thread, &cpu);
> +        if ( ret )
> +        {
> +            printk(XENLOG_ERR
> +                   "%s: No CPU found for thread\n", dt_node_name(thread));
Use dt_node_full_name(). Otherwise the printed name can be ambiguous.

> +            return ret;
> +        }
> +
> +        if ( cpu == INVALID_TOPO_ID )
> +        {
> +            /*
> +             * Ignore this CPU node definition as the corresponding physical
> +             * CPU failed to boot.
You updated the printk message but not the comment. Please fix.

~Michal


