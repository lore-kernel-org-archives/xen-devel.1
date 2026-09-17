Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC529C982CF
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 12:16:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423989.1648791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7B25-00067Z-Lv; Thu, 17 Sep 2026 12:16:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423989.1648791; Thu, 17 Sep 2026 12:16:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x7B25-00067Q-JA; Thu, 17 Sep 2026 12:16:05 +0000
Received: by outflank-mailman (input) for mailman id 1423989;
 Thu, 17 Sep 2026 12:16:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x7B23-000675-6v
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 12:16:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x7B22-002sPn-Jd
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 14:16:02 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aabd9fe-bab6-0a2a0a5309dd-0a2a4509ce2a-6
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 14:16:02 +0200
Received: from [52.101.85.11]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aabda00-be1a-0a2a45090019-3465550b08f9-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 14:16:01 +0200
Received: from BN9PR03CA0579.namprd03.prod.outlook.com (2603:10b6:408:10d::14)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 12:15:57 +0000
Received: from BN3PEPF00022BC4.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::6) by BN9PR03CA0579.outlook.office365.com
 (2603:10b6:408:10d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 17 Sep 2026 12:15:57 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BC4.mail.protection.outlook.com (10.167.248.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 12:15:55 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 07:15:54 -0500
Received: from [10.59.21.158] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 17 Sep 2026 07:15:52 -0500
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
 b=IGlDCTHqdiaYCJ1zHnb7i+/Q36sp4C/NZLAJxmkvaIoGHB9aiOS2cAPSZQm9r4WNBdcvSW59mQa47z9acCkCaTiDze5P5qfMpTgu3/V6pcT0AGrBZULN4+qD9hx+r3FPTWb4A6/iUjb4YTZeEcUFDA3teRL7w4ba/FqsmMnzjfnq9vGGVKXHVSAsc/SMx2CItl6ovQUr5uN5ziofvJ/wlXI/ZmW1En2isGeLtHUKancV9PwKIlL8F5IYW7UJ+gPTHXzOviSqFGH0q8EmFbyRANvH5Iy4El0bI557GFXljDKMjyKt7kcG/UXzR6u3EdIOtf3FLdyGG9mOtvCqBjaPGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8O8o+6GognuIehsqoEsV+kIhBgi+XgprtCO7CZ1tAg=;
 b=jS2ZrkrK46djc8R9aN/uKnMlvengEb6eiRHIFxOon9Gf6jhEBwCD9ALMW4ZUQfiVIkjSUseV8nwxDdfIqZWY3iOimLSm+ky3zu/FAb4MPsfoK626pNDY7GFz2n6pSLcPY3h5MnTi/jesZnmCmG2lqo6hyWP36//sncGtBsaZyPSH7ZIoBt+W2a12ZVcEFd7ku+nznhLh736/pnWMztinM73dN3CaBoFZMlztx5ontk9AYydSY1FNuXrl2vhLz41AWnDYXTIW6QG7fQRhggnt6Txtmew1Y/39P6wKMA+U2Dz+hKggsCpNVhdvsZsura7LWm/Dvvu29nKZj3mS1ZpOJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8O8o+6GognuIehsqoEsV+kIhBgi+XgprtCO7CZ1tAg=;
 b=IJ1mQDj88/f7al/91wE1tg6uoN8mAnv4JQPyk+kzK6lUMYDOmiaCHn+6fDlV2OP6M9uuPZhSn245730UYsnOoP+vL3Pp2ntU+5BpZW1+CQu/WCMqdv8QkmaUojSsz7OrTG729F5vHwdgab8F2hx/xLhWmNRpYvPtRhG1EMDCUBA=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Message-ID: <78d6b1a6-5a59-409a-9d44-64314a4db106@amd.com>
Date: Thu, 17 Sep 2026 14:15:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>, <xen-devel@lists.xenproject.org>
CC: <Mykyta_Poturai@epam.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <20260911094213.79936-1-taka@valinux.co.jp>
 <20260911094213.79936-2-taka@valinux.co.jp>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260911094213.79936-2-taka@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC4:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d13a5c0-faef-437d-e89d-08df14b56c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|6133799003|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Lree6iDbUR143qXShvxW3pbmYusne725lb0yu7GYEulkudOlHwZyMfZL1MTC/31OixzHfO6B5ra58wezsuvdnu+8gPqRkuydee3WV2Tt5TYOvxcbFhjRjEAJO911h6chdmYQe5segusQGvlUJlNUuPnhacJ2AiJEaqNOkMd56uU9wBnqG1Q5YLOrUnOP0LKrTVjsa9clKglfQVSaX75IG1M/1UfytvXUVijT2WnzhcrUYgtgZY1DD6F//EfTt5JnrQAKv1l1UbOeLCSpghJjJCi9MiIGerQ+VjaARgigJWKQ9M/EfiixWiagL/Xoi/tMzW9XuMpcu+g2uS9gRsvLdHAIlMs2XDoHm8tXkCiEUJwXQi8QlNTF5oPhr1RkH8o9g1iBYr+2lsRa1EaciVGNoQY9HQ/sII+ix2MLWk+lKpjeToWj4hVtq0E9FxEShoNCE6XrH4ZZbeQno+uzIyYz0YpqzrYakBRLAdWN5nBfFcZ7vNbexJ+oDKpsfdAC1jwtezhM2MVaYjeI6BhtlGMONGeshz3cAm+ib3R5iglJz2t8kRJSDhpeDxM2OnaUMQiEekNNlOhydvapqHUmeWM2B4IA1cOFTU3+drCbs+ksmyQYzMF+BZ6LuOIzkL44QCKQlW+aR1WvxN6mc/ZuKB49ma2xsTIQX1q5Krdn8mu3PDtt3l7I6Hj/lVs0J1iG/Qcs0XmUtgtB9Rqg9g1Ud1Lzdg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(6133799003)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IHmqKweDyW6EK8QwYPGD/mNE+fV7wtLGaGf5Q6czGU30tUW9R6LhNH2m+MWntzFVQMLY8rq3bIbpbJz+PrZARFn+mzDyWx+qd15d6dn6e/vsKj1Te4j+lsSpMGFvEcVZSczrIq6lejDdhVvCpMFhfD5glwh3v9/Y8IlWaEMd5EXTPimjICZANX9JkVoKZlei/xIZjZuvD2BQUK1awxtXqPgsiFILqYnZIgFQ8yNV+xtsY6XU3ZAOsO25rP2V/5pdxxGcCIj5PlGbwHS72lJHVdiOmyzTlnyqioiTv4GpOJ0GjBvLfi/G+C3kQe5chZAORWlMBChFIbVXUkVLlKOaL51IZ4/WZyR7c8T0hg7612J8kp9Qfu5kweEI5URGh8JT7XR0ROWJ49ndWoHpFNGFLIP2ndfUdLpkz6qxpsFKtGKJSwVPXA1uB4B1ZzggXsPf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 12:15:55.2717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d13a5c0-faef-437d-e89d-08df14b56c92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373
X-purgate-ID: tlsNG-bad1c0/1789647362-BC2F4034-8C84BCAA/0/0
X-purgate-type: clean
X-purgate-size: 24780



On 11-Sep-26 11:42, Hirokazu Takahashi wrote:
> Parse the 'cpu-map' node in the Device Tree to extract CPU topology
> information. If the 'cpu-map' node is absent, simply ignore it.
> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> Reviewed-by: Jan Beulich <jbeulich@suse.com> # common, acpi
> ---
> Changes in v10:
>  - Postpone the invocation of init_cpu_topology() until after nr_cpu_ids
>    is finalized.
>  - Improve the Device Tree cpu-map node parsing logic:
>    * Rename functions and variables to accurately reflect the DT nodes
>      being processed.
>    * Simplify the parsing algorithm by eliminating recursive calls and
>      avoiding passing INVALID_TOPO_ID as an argument.
>  - Unify all license headers to GPL-2.0-only.
>  - Return an error instead of triggering an ASSERT() when duplicate CPU
>    definitions are detected.
>  - Replace BUG_ON() with ASSERT() for condition checks in
>    dt_init_cpu_topology().
>  - Update commit messages to remove details that no longer match the
>    current implementation.
> 
>  xen/arch/arm/Kconfig                  |   1 +
>  xen/arch/arm/setup.c                  |   3 +
>  xen/arch/arm/smpboot.c                |   5 +
>  xen/common/Kconfig                    |  22 ++
>  xen/common/Makefile                   |   1 +
>  xen/common/cpu-topology.c             |  62 +++++
>  xen/common/cpu.c                      |   5 +
>  xen/common/device-tree/Makefile       |   1 +
>  xen/common/device-tree/cpu-topology.c | 347 ++++++++++++++++++++++++++
>  xen/drivers/acpi/Makefile             |   1 +
>  xen/drivers/acpi/topology.c           |  41 +++
>  xen/include/xen/acpi.h                |  13 +
>  xen/include/xen/cpu-topology.h        |  34 +++
>  xen/include/xen/dt-cpu-topology.h     |  35 +++
>  14 files changed, 571 insertions(+)
>  create mode 100644 xen/common/cpu-topology.c
>  create mode 100644 xen/common/device-tree/cpu-topology.c
>  create mode 100644 xen/drivers/acpi/topology.c
>  create mode 100644 xen/include/xen/cpu-topology.h
>  create mode 100644 xen/include/xen/dt-cpu-topology.h
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 843a43897e..1e0fd4957e 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -19,6 +19,7 @@ config ARM
>  	select HAS_ALTERNATIVE if HAS_VMAP
>  	select HAS_DEVICE_TREE_DISCOVERY
>  	select HAS_DOM0LESS
> +	select HAS_GENERIC_CPU_TOPOLOGY
>  	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
>  	select HAS_STACK_PROTECTOR
>  	select HAS_STATIC_MEMORY
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 86532d0a35..108f1c703e 100644
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
> @@ -387,6 +388,8 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
>      nr_cpu_ids = smp_get_max_cpus();
>      printk(XENLOG_INFO "SMP: Allowing %u CPUs\n", nr_cpu_ids);
>  
> +    init_cpu_topology();
> +
>      /*
>       * Some errata relies on SMCCC version which is detected by psci_init()
>       * (called from smp_init_cpus()).
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 1806c47a08..904130efdf 100644
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
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/mm.h>
> @@ -244,6 +246,9 @@ static void __init dt_smp_init_cpus(void)
>          }
>          else
>              tmp_map[i] = hwid;
> +
> +        /* Pass the info to dt_init_cpu_topology() */
> +        map_cpu_to_dt_node(i, cpu);
This should be moved to the above else branch which is taken on a success only.

>      }
>  
>      if ( !bootcpu_valid )
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index da80fdba84..29879a9131 100644
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
> @@ -191,6 +194,25 @@ config VM_EVENT
>  config NEEDS_LIBELF
>  	bool
>  
> +config GENERIC_CPU_TOPOLOGY
> +	bool
> +
> +config DT_CPU_TOPOLOGY
> +	bool "Device tree based CPU topology support (UNSUPPORTED)"
Can you please explain why unsupported?

> +	depends on HAS_GENERIC_CPU_TOPOLOGY && DEVICE_TREE_PARSE && UNSUPPORTED
> +	select GENERIC_CPU_TOPOLOGY
> +	help
> +	  Retrieve CPU topology information from the device tree to optimize
> +	  vCPU scheduling.
> +
> +config ACPI_CPU_TOPOLOGY
> +	bool "ACPI based CPU topology support (UNSUPPORTED)"
> +	depends on HAS_GENERIC_CPU_TOPOLOGY && ACPI && UNSUPPORTED
> +	select GENERIC_CPU_TOPOLOGY
> +	help
> +	  Retrieve CPU topology information from the ACPI PPTT to optimize
> +	  vCPU scheduling.
> +
>  config NUMA
>  	bool
>  
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 6018e25614..901bb37925 100644
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
> index 0000000000..f784afbd3d
> --- /dev/null
> +++ b/xen/common/cpu-topology.c
> @@ -0,0 +1,62 @@
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
> +    int ret;
> +
> +    cpu_topology = xvzalloc_array(struct cpu_topology, nr_cpu_ids);
> +    if ( !cpu_topology )
> +        return;
I don't think this is ok for this function not to let the caller about the
error. That's especially important for failures from actual DT/ACPI topology
initialization. You don't even print anything.

> +
> +    for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
> +    {
> +        if ( !zalloc_cpumask_var(&cpu_topology[cpu].thread_sibling) ||
> +             !zalloc_cpumask_var(&cpu_topology[cpu].core_sibling) ||
> +             !zalloc_cpumask_var(&cpu_topology[cpu].cluster_sibling) )
> +        {
> +            free_topology_table();
> +            return;
> +        }
> +    }
> +
> +    if ( acpi_disabled )
> +        ret = dt_init_cpu_topology();
> +    else
> +        ret = acpi_init_cpu_topology();
> +
> +    /* Free the CPU topology table if initialization fails. */
> +    if ( ret != 0 )
> +        free_topology_table();
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
> index 9036e455d6..6ee670b5f4 100644
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
> index 0000000000..ce9da0bb36
> --- /dev/null
> +++ b/xen/common/device-tree/cpu-topology.c
> @@ -0,0 +1,347 @@
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
> +    const struct cpu_topology *target_topo = &cpu_topology[target_cpu];
> +    const struct cpu_map *target_map = &cpu_map[target_cpu];
> +    unsigned int cpu;
> +
> +    /* Update cluster, core and thread sibling masks */
> +    for_each_possible_cpu(cpu)
> +    {
> +        const struct cpu_topology *cpu_topo = &cpu_topology[cpu];
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
This does not compile.

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
> +        if ( np->name && (dt_node_cmp(np->name, name) == 0) )
> +            return np;
Please use dt_node_name_is_equal() here.

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
> +static unsigned int __init get_cpu_for_node(
> +    const struct dt_device_node *dt_node)
> +{
> +    const struct dt_device_node *cpu_node =
> +        dt_parse_phandle(dt_node, "cpu", 0);
> +
> +    if ( !cpu_node )
> +        return INVALID_TOPO_ID;
> +
> +    return cpu_node_to_id(cpu_node);
> +}
> +
> +static bool __init is_cpu_map_empty( unsigned int cpu )
Stray space at the end "cpu )"

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
> +        cpu = get_cpu_for_node(thread);
> +
> +        if ( cpu == INVALID_TOPO_ID )
> +        {
> +            printk(XENLOG_ERR
> +                   "ERROR: %s: Can't get CPU for thread\n", dt_node_name(thread));
No need for the ERROR/WARNING prefixes. You already use correct xenlog levels.

> +            return -EINVAL;
> +        }
> +
> +        if ( !is_cpu_map_empty(cpu) )
> +        {
> +            printk(XENLOG_ERR
> +                   "ERROR: Duplicate CPU definition for CPU%u\n", cpu);
> +            return -EINVAL;
> +        }
> +
> +        cpu_map[cpu].socket_id = socket_id;
> +        cpu_map[cpu].cluster_id = cluster_id;
> +        cpu_map[cpu].core_id = core_id;
> +        cpu_map[cpu].thread_id = thread_id;
> +    }
> +
> +    cpu = get_cpu_for_node(core);
> +
> +    if ( cpu != INVALID_TOPO_ID )
> +    {
> +        if ( !leaf )
> +        {
> +            printk(XENLOG_ERR "ERROR: %s: Core has both threads and CPU\n",
> +                   dt_node_name(core));
> +            return -EINVAL;
> +        }
> +
> +        if ( !is_cpu_map_empty(cpu) )
> +        {
> +            printk(XENLOG_ERR
> +                   "ERROR: Duplicate CPU definition for CPU%u\n", cpu);
> +            return -EINVAL;
> +        }
> +
> +        cpu_map[cpu].socket_id = socket_id;
> +        cpu_map[cpu].cluster_id = cluster_id;
> +        cpu_map[cpu].core_id = core_id;
> +        cpu_map[cpu].thread_id = 0;
> +    }
> +    else if ( leaf )
> +    {
> +        printk(XENLOG_ERR
> +               "ERROR: %s: Can't get CPU for leaf core\n", dt_node_name(core));
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +static int __init parse_cluster(const struct dt_device_node *cluster,
> +                                unsigned int socket_id,
> +                                unsigned int cluster_id)
> +{
> +    bool has_cores = false;
> +    int ret = 0;
> +
> +    if ( dt_find_child_node_by_name(cluster, "cluster0") )
> +    {
> +        printk(XENLOG_WARNING
XENLOG_ERROR?

> +               "WARNING: Topology for clusters of clusters not yet supported\n");
> +        return -EINVAL;
> +    }
> +
> +    for ( unsigned int core_id = 0; ; core_id++ )
> +    {
> +        const struct dt_device_node *core;
> +        char name[20];
> +
> +        snprintf(name, sizeof(name), "core%u", core_id);
> +        core = dt_find_child_node_by_name(cluster, name);
> +
> +        if ( !core )
> +            break;
> +
> +        has_cores = true;
> +
> +        ret = parse_core(core, socket_id, cluster_id, core_id);
> +        if ( ret != 0 )
> +            return ret;
> +    }
> +
> +    if ( !has_cores )
> +        printk(XENLOG_WARNING "WARNING: %s: empty cluster\n",
> +               dt_node_name(cluster));
> +
> +    return ret;
> +}
> +
> +static int __init parse_socket(const struct dt_device_node *socket,
> +                               unsigned int socket_id)
> +{
> +    bool has_cluster = false;
> +    int ret = 0;
> +
> +    for ( unsigned int cluster_id = 0; ; cluster_id++ )
> +    {
> +        const struct dt_device_node *cluster;
> +        char name[20];
> +
> +        snprintf(name, sizeof(name), "cluster%u", cluster_id);
> +        cluster = dt_find_child_node_by_name(socket, name);
> +
> +        if ( !cluster )
> +            break;
> +
> +        has_cluster = true;
> +        ret = parse_cluster(cluster, socket_id, cluster_id);
> +        if ( ret != 0 )
> +            return ret;
> +    }
> +
> +    /*
> +     * If no cluster node is defined, assume the socket has
> +     * a single cluster.
> +     */
> +    if ( !has_cluster )
> +        ret = parse_cluster(socket, socket_id, 0);
> +
> +    return ret;
> +}
> +
> +static int __init parse_package(const struct dt_device_node *package)
> +{
> +    bool has_socket = false;
> +    int ret = 0;
> +
> +    for ( unsigned int socket_id = 0; ; socket_id++ )
> +    {
> +        const struct dt_device_node *socket;
> +        char name[20];
> +
> +        snprintf(name, sizeof(name), "socket%u", socket_id);
> +        socket = dt_find_child_node_by_name(package, name);
> +
> +        if ( !socket )
> +            break;
> +
> +        has_socket = true;
> +        ret = parse_socket(socket, socket_id);
> +        if ( ret != 0 )
> +            return ret;
> +    }
> +
> +    /*
> +     * If no socket node is defined, assume all clusters reside under
> +     * a single socket.
> +     */
> +    if ( !has_socket )
> +        ret = parse_socket(package, 0);
> +
> +    return ret;
> +}
> +
> +static int __init parse_dt_topology(void)
> +{
> +    const struct dt_device_node *cpus;
> +    const struct dt_device_node *map;
> +
> +    cpus = dt_find_node_by_path("/cpus");
> +    if ( !cpus )
> +        return -ENOENT;
> +
> +    map = dt_find_child_node_by_name(cpus, "cpu-map");
> +    if ( !map )
> +        return -ENOENT;
> +
> +    return parse_package(map);
Linux ends this function with for_each_possible_cpu(). What's the reason for
dropping it for our case?

> +}
> +
> +int __init dt_init_cpu_topology(void)
> +{
> +    unsigned int cpu;
> +    int ret;
> +
> +    ASSERT(acpi_disabled);
> +    ASSERT(cpu_topology);
> +
> +    ret = parse_dt_topology();
> +    if ( ret == 0 )
> +        for_each_possible_cpu(cpu)
> +            setup_siblings_masks(cpu);
> +
> +    return ret;
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
> diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
> index 477408afbe..6d676e91d4 100644
> --- a/xen/drivers/acpi/Makefile
> +++ b/xen/drivers/acpi/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_ACPI_NUMA) += numa.o
>  obj-y += osl.o
>  obj-$(CONFIG_PM_STATS) += pmstat.o
>  obj-$(CONFIG_PM_OP) += pm-op.o
> +obj-$(CONFIG_ACPI_CPU_TOPOLOGY) += topology.init.o
>  
>  obj-$(CONFIG_X86) += hwregs.o
>  obj-$(CONFIG_X86) += reboot.o
> diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
> new file mode 100644
> index 0000000000..090c793f33
> --- /dev/null
> +++ b/xen/drivers/acpi/topology.c
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/acpi.h>
> +#include <xen/cpu-topology.h>
> +#include <xen/cpumask.h>
> +#include <xen/init.h>
> +
> +/*
> + * TODO: Populate the topology information by scanning the ACPI
> + *       PPTT (Processor Properties Topology Table).
> + */
> +int __init acpi_init_cpu_topology(void)
> +{
> +    unsigned int cpu;
The correspondong DT function has two ASSERTs. Why the divergence here? At least
the one for cpu_topology existing is a good one (I don't consider the first
ASSERT very useful).

> +
> +    /*
> +     * Generate temporary cpu topology information for now.
> +     * It assumes that the cpu doesn't have SMT and all CPUs
> +     * belong to the same socket.
> +     */
> +    for_each_possible_cpu(cpu)
> +    {
> +        struct cpu_topology *topo = &cpu_topology[cpu];
> +
> +        cpumask_set_cpu(cpu, topo->thread_sibling);
> +        cpumask_copy(topo->core_sibling, &cpu_possible_map);
> +        cpumask_copy(topo->cluster_sibling, &cpu_possible_map);
> +    }
> +
> +    return 0;
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
> diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
> index 2fdf38cf74..cbb02e0f35 100644
> --- a/xen/include/xen/acpi.h
> +++ b/xen/include/xen/acpi.h
> @@ -135,6 +135,19 @@ static inline int acpi_boot_table_init(void)
>  
>  #endif 	/*!CONFIG_ACPI*/
>  
> +#ifdef CONFIG_ACPI_CPU_TOPOLOGY
> +
> +int acpi_init_cpu_topology(void);
> +
> +#else /* CONFIG_ACPI_CPU_TOPOLOGY */
> +
> +static inline int acpi_init_cpu_topology(void)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +#endif /* CONFIG_ACPI_CPU_TOPOLOGY */
> +
>  int get_cpu_id(u32 acpi_id);
>  
>  unsigned int acpi_register_gsi (u32 gsi, int edge_level, int active_high_low);
> diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
> new file mode 100644
> index 0000000000..7cfe3752cd
> --- /dev/null
> +++ b/xen/include/xen/cpu-topology.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN_CPU_TOPOLOGY_H
> +#define XEN_CPU_TOPOLOGY_H
> +
> +#include <xen/cpumask.h>
You can move it under #ifdef where you actually use these types.

> +
> +#ifdef CONFIG_GENERIC_CPU_TOPOLOGY
> +
> +struct cpu_topology {
> +    cpumask_var_t thread_sibling;
> +    cpumask_var_t core_sibling;
> +    cpumask_var_t cluster_sibling;
> +};
> +
> +extern struct cpu_topology *cpu_topology;
> +void init_cpu_topology(void);
> +
> +#else /* CONFIG_GENERIC_CPU_TOPOLOGY */
> +
> +static inline void init_cpu_topology(void) {}
> +
> +#endif /* CONFIG_GENERIC_CPU_TOPOLOGY */
> +
> +#endif /* XEN_CPU_TOPOLOGY_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/include/xen/dt-cpu-topology.h b/xen/include/xen/dt-cpu-topology.h
> new file mode 100644
> index 0000000000..72b35b3cf2
> --- /dev/null
> +++ b/xen/include/xen/dt-cpu-topology.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef XEN_DT_CPU_TOPOLOGY_H
> +#define XEN_DT_CPU_TOPOLOGY_H
> +
> +#include <xen/errno.h>
You can move it under #else which is where you actually use the errno code.

> +
> +struct dt_device_node;
> +
> +#ifdef CONFIG_DT_CPU_TOPOLOGY
> +
> +void map_cpu_to_dt_node(unsigned int cpu, struct dt_device_node *cpu_node);
> +int dt_init_cpu_topology(void);
> +
> +#else /* CONFIG_DT_CPU_TOPOLOGY */
> +
> +static inline void map_cpu_to_dt_node(unsigned int cpu,
> +                                      struct dt_device_node *cpu_node) {}
> +static inline int dt_init_cpu_topology(void)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
> +#endif /* CONFIG_DT_CPU_TOPOLOGY */
> +
> +#endif /* XEN_DT_CPU_TOPOLOGY_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

~Michal


