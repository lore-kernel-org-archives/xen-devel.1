Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BA7CC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 13:20:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449042.1664977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGytY-0003Bf-DP; Wed, 14 Oct 2026 13:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449042.1664977; Wed, 14 Oct 2026 13:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGytY-0003BY-9U; Wed, 14 Oct 2026 13:19:48 +0000
Received: by outflank-mailman (input) for mailman id 1449042;
 Wed, 14 Oct 2026 13:19:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGytX-0003BS-6J
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:19:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGytW-00DQfe-Bn
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:19:46 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6acf8163-e002-0a2a0a5209dd-0a2a45018b24-40
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:19:45 +0200
Received: from [52.101.193.33]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6acf816e-5984-0a2a45010019-3465c121ea9a-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:19:45 +0200
Received: from PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::9)
 by CY5PR12MB6059.namprd12.prod.outlook.com (2603:10b6:930:2c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.24; Wed, 14 Oct
 2026 13:19:36 +0000
Received: from CY4PEPF000392D8.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::96) by PH5P220CA0012.outlook.office365.com
 (2603:10b6:510:34a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 13:19:35 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF000392D8.mail.protection.outlook.com (10.167.247.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 13:19:35 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 08:19:28 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 14 Oct 2026 08:19:25 -0500
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
 b=nDvc6yct3ZyhiWrD4GBhC2d3gCuHAslkz/hcRb4FSgmr6WlXQGUyaxCEhRLE6WihWC4VgYcOqJloEoX4MbrdqgBUwnumlfgKoTteCwIHCGiHcUC6LXCuAoy/92VwecLZeZyeZE0vMOWqTdPGPEmS1OYJweDrdNEuoBEK5tHT8/QwsTXVzS4t/utzXfIA72JCu0AhIxFRPDcPAQhoTuzYbd4YHdbpVek2dJ4K39TBS9+s4dRu1fAsQzcaZviygIFTvaK4n7ahLyHq9Y9htFaWRbUClc8bq5boFWAnM6ypytAsZ8kE08xtod3P+U8q+tBcQ/NNaQ5C9tDS/YPXUavFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6JqJhXRW78SsZJTBP/YdbipCJKRMjtHmjWjEZeUgu0=;
 b=msCluKa1ryBVdSlCEkbeJ6z7Ohg4Y+44DDlPkpvLocc/jQFEWl0UgzI3wv1nB9MbJFUnKmXPAnJgajK0bxXXkg6hcysVFWh4DZToNhfK/DK2u57MCMgvMkFca6IQn6VaD5zGmvxOO5IGVe+sGbzkG1wLMb2TZ2g9G30BQB+mX4ZkRj93Ml774Fw4ujA/bEMP7Kui2hsS+eGbLHnliRKnh26HijNTT4zciuxuiiW2itLN0c/1EcLmAFAQufYsYUflESy53l3C+xsWnIey4e+0zhFW1WF4gMsJl9G3HDJu6TQq/mDXRGLrrrBnvjas+kovFAZnRoHFTaSDuGdEC1Vuug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6JqJhXRW78SsZJTBP/YdbipCJKRMjtHmjWjEZeUgu0=;
 b=gc9xkidNLFXV+W1HscPVaPyRmnOdkH9eCXzHRLeAbHa2D6rRzOA2PruFhdU3tNrHM7wBYSRc9fV+oSUtPjmE6wU3ENCNeK+2CtByIxo4bBiCgxg5nvQ9PTFB7q/mfJPg5HDYUpqySZ+KhIjNaOSFm2k7sRWGoLZ95vi06pto970=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <0d892635-2284-40bf-8b0b-3c067d49d465@amd.com>
Date: Wed, 14 Oct 2026 15:19:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/4] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>, <xen-devel@lists.xenproject.org>
CC: <Mykyta_Poturai@epam.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <20261013103616.121916-1-taka@valinux.co.jp>
 <20261013103616.121916-2-taka@valinux.co.jp>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261013103616.121916-2-taka@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF000392D8:EE_|CY5PR12MB6059:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6be8fd-1012-49bc-f6eb-08df29f5ca80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|7416014|376014|82310400026|56012099006|4143699003|11063799006|261009223027099003|260925021911599003|260925021311599003|260925022911599003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	dnR1mDnCBYnJDI/tciD0KZCOII7mFKuQ/U3K8rD3vUJSRS6J1oazpMqqRVMEL8ZW/yimYdwYVPtnavBq+JyjdfCka6IX7e4m/XX799gRt2hCmvv7LZav426dyhDp1S6v5pmlaQS2nlSCScXaVZPLFbISSdzwWKXKoVJnWoQCSEu6j2PP4nmSV/svZKj9MWL7H8wrWUoDoei7q72h6MDQoMnpiqE00B01NEvuhuUnwdMdwgZvwkJD+pGIfjlHWuIACsXNnuZ9q0/N9PClYcbXJjyOMuEWMg4DkHqE04uUSd/sJzdCMuz2O/feddDVMPZDc/y7poJX1xBZKqxVyM/Jc9Xs62tXowHOsTku9i+kfZ54oS582hNW+9lPGgCIHKCnNek7IOWDXtWWPwXlIyKzMGQVxiUIqSXM+mWhpLymi5VJNGilCNgaxNdhcE1ve2+Dl3YuriQeDqanWSCmany3jiTlGyd4Lh0oIO2jn03X84TdckUgiBviBq6WXTPuTW0i2xvogt1+1xeHq69hUI7xahYAbG/2MTH7IHvWNlvD1cCauT2iDpwCwx22WusNogLdh2X3DxJO9AarlaHjLEpZx79/RxC1A3hhrJz/brY6kj09d48UhHTrxYdpsWPYsf5dsmYe96NAkohG3hhgVLuLLX1kG6JTvr5YevQZq856EEotABkW6r7Cp8vNDkBzaT2mmUg59i0bRMEWiSa2MncyUA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(7416014)(376014)(82310400026)(56012099006)(4143699003)(11063799006)(261009223027099003)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ac1AS5P+8+9bZI+RZQCBzHipr8mhlSL6JkuL/qMkGmrjy0XD32rnoySIhVCIwjOlOTw3gF2JMrX4dQv4zeAgajtkzh1au91VFxVzk8iQkj8gClFzhKUb8DC14jAw8XMJVKBy81d+bcw6Mp/K8IlDAGMcdxAiFmFYwfdmyUA78lG6ZOF7EC07c0uo00fA8ZkIt9wIlFONSduLMtpjs4YJhBNVm5X1ft1czFk+pCKR8LfBTnEHVAtHkTxE/UUDIX+K60IqLUVffvcQnGnaHw02OH2PFTce+GTsMY9T1a46NGqpEs7OYFtKwtOP2hH8RsIAemvYBqbsZycSeR5L1t0NcHOrOOZYh95PsM+cQu3OCAWbTDfXZRa2uTKa+LBNja3R68Kvm6fwK+oQj+tzaghAFZnO0VW9CJx1DOmjBrCHb70hahGX2FhyHbLg/DOQxqeh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 13:19:35.0178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6be8fd-1012-49bc-f6eb-08df29f5ca80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF000392D8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6059
X-purgate-ID: tlsNG-d62444/1791983985-BD87F757-F7F9D34C/10/78276251493
X-purgate-type: spam
X-purgate-size: 16834



On 13-Oct-26 12:36, Hirokazu Takahashi wrote:
> Parse the 'cpu-map' node in the Device Tree to extract CPU topology
> information. If the 'cpu-map' node is absent, simply ignore it.
> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> Reviewed-by: Jan Beulich <jbeulich@suse.com> # common, acpi
> ---
> Changes in v11:
>  - When parsing the Device Tree, ignore CPU nodes if the corresponding
>    physical CPU failed to boot, rather than treating it as an error.
>  - Drop the dependency on UNSUPPORTED for CPU topology support.
>  - Print an error message if memory allocation fails in init_cpu_topology().
>  - Fix a compilation error involving cpumask_set_cpu().
>  - Call map_cpu_to_dt_node() to record the CPU ID to DT node mapping only
>    when arch_cpu_init() succeeds, or if the CPU is the boot CPU (treated
>    as successful since the boot CPU is already up and running).
>  - Use XENLOG_ERR as the log level for error messages emitted when DT CPU
>    topology parsing fails.
>  - Add ASSERT(cpu_topology) to acpi_init_cpu_topology() for consistency.
>  - Code cleanups:
>    * Use dt_node_name_is_equal() instead of dt_node_cmp().
>    * Drop redundant "ERROR:" and "WARNING:" prefixes from log messages.
>    * Move header file includes into #ifdef / #else blocks where they are
>      actually needed.
>    * Adjust spacing to comply with the Xen coding style.
> 
>  xen/arch/arm/Kconfig                  |   1 +
>  xen/arch/arm/setup.c                  |   3 +
>  xen/arch/arm/smpboot.c                |   6 +
>  xen/common/Kconfig                    |  22 ++
>  xen/common/Makefile                   |   1 +
>  xen/common/cpu-topology.c             |  69 +++++
>  xen/common/cpu.c                      |   5 +
>  xen/common/device-tree/Makefile       |   1 +
>  xen/common/device-tree/cpu-topology.c | 352 ++++++++++++++++++++++++++
>  xen/drivers/acpi/Makefile             |   1 +
>  xen/drivers/acpi/topology.c           |  43 ++++
>  xen/include/xen/acpi.h                |  13 +
>  xen/include/xen/cpu-topology.h        |  34 +++
>  xen/include/xen/dt-cpu-topology.h     |  35 +++
>  14 files changed, 586 insertions(+)
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
> index 8c9072f3c1..089c997f38 100644
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
> @@ -245,6 +247,10 @@ static void __init dt_smp_init_cpus(void)
>          }
>          else
>              tmp_map[i] = hwid;
> +
> +        if ( (rc >= 0) || (i == 0) )
Please add a comment explaining the second part i.e. boot CPU may lack enable
method.

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
> index 0000000000..ce50408858
> --- /dev/null
> +++ b/xen/common/cpu-topology.c
> @@ -0,0 +1,69 @@
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
> +    if ( num_possible_cpus() == 1 )
> +        return;
> +
> +    cpu_topology = xvzalloc_array(struct cpu_topology, nr_cpu_ids);
> +    if ( !cpu_topology )
> +    {
> +        printk(XENLOG_WARNING "CPU topology table allocation failed.\n");
> +        return;
> +    }
> +
> +    for ( cpu = 0; cpu < nr_cpu_ids; cpu++ )
> +    {
> +        if ( !zalloc_cpumask_var(&cpu_topology[cpu].thread_sibling) ||
> +             !zalloc_cpumask_var(&cpu_topology[cpu].core_sibling) ||
> +             !zalloc_cpumask_var(&cpu_topology[cpu].cluster_sibling) )
> +        {
> +            free_topology_table();
> +            printk(XENLOG_WARNING "CPU topology table allocation failed.\n");
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
In a previous revision I asked to print an error (except for expected errors
like -EOPNOTSUPP).

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
> index 0000000000..a62f65a41d
> --- /dev/null
> +++ b/xen/common/device-tree/cpu-topology.c
> @@ -0,0 +1,352 @@
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
get_cpu_for_node can return INVALID_TOPO_ID also on malformed DTs e.g. missing
phandle which you now accept. Shouldn't we return -EINVAL?

> +        {
> +            /*
> +             * Ignore this CPU node definition as the corresponding physical
> +             * CPU failed to boot.
> +             */
> +            printk(XENLOG_INFO
> +                   "%s: CPU for thread hasn't started\n", dt_node_name(thread));
CPU topology is initialized before bringing CPU up, so this message is incorrect
and there are more than one scenarios we may end up with here. Maybe just "CPU
not used by Xen: ignoring".

> +            return 0;
This stops parsing other threads which I don't think is the right way to do it.
We should just continue.

> +        }
> +
> +        if ( !is_cpu_map_empty(cpu) )
> +        {
> +            printk(XENLOG_ERR
> +                   "Duplicate CPU definition for CPU%u\n", cpu);
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
> +            printk(XENLOG_ERR "%s: Core has both threads and CPU\n",
> +                   dt_node_name(core));
> +            return -EINVAL;
> +        }
> +
> +        if ( !is_cpu_map_empty(cpu) )
> +        {
> +            printk(XENLOG_ERR "Duplicate CPU definition for CPU%u\n", cpu);
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
> +        /*
> +         * Ignore this CPU node definition as the corresponding physical
> +         * CPU failed to boot.
> +         */
> +        printk(XENLOG_INFO
> +               "%s: CPU for leaf core hasn't started\n", dt_node_name(core));
Same wording issue.

~Michal


