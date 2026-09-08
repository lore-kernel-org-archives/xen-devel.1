Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A706C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 15:14:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412181.1642695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3xWK-0007Jx-9i; Tue, 08 Sep 2026 15:14:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412181.1642695; Tue, 08 Sep 2026 15:14:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3xWK-0007Jq-6v; Tue, 08 Sep 2026 15:14:00 +0000
Received: by outflank-mailman (input) for mailman id 1412181;
 Tue, 08 Sep 2026 15:13:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x3xWI-0007Jk-C3
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:13:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3xWH-00007V-8r
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 17:13:57 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa0262f-e002-0a2a0a5209dd-0a2a4501c81a-18
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:13:53 +0200
Received: from [40.107.201.60]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa0262f-5984-0a2a45010019-286bc93cab53-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:13:52 +0200
Received: from MW4PR03CA0030.namprd03.prod.outlook.com (2603:10b6:303:8f::35)
 by CY1PR12MB9626.namprd12.prod.outlook.com (2603:10b6:930:106::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 15:13:43 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:303:8f:cafe::a5) by MW4PR03CA0030.outlook.office365.com
 (2603:10b6:303:8f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Tue, 8
 Sep 2026 15:13:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 15:13:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 10:13:41 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 10:13:41 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 10:13:39 -0500
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
 b=uVea7vsCiCXyNGoqBSO3Ybt1VOOyz97nD10TvRCCuLvfV0mgosqFuDRevEX2+PcFBqLIJzX3sDCbgdUgvtOQHE6N9GESnN3eL/sv4cKy3DN0pScmvuY/TZ05M2wjfavNnDwN9wP+PRAem83+HlCeO9YqftwcPZixs+i7kQuUUKYCihO4K4BlvqB4AXFynkPB0gM9Hhy+9PBfwwHeaMpVyNm1v1P6zFvK76qk2gibYN5qvxrEHysdxlSMDzmchEKDErdbyjc2RlkqLJC0GaOH8W0B7shv4yZAs5yNFXloGUawlYgV+DhNwobSfUCQec0WkmQhvuUm66CqeuKFVgYHpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymwuSxIc8L2A0aZh0nJQph6+TFrsfQpORWoS/czfQVw=;
 b=FOt5Mx5ciD2h/dva5eb57IVLY97erlUT18+ZpPEbMl1MoaTV4vHInCdyc8/cJy0Gr0z2NqKHhMkNqOZQHRn2893DpjzTPfcfasIYCSJjkGPGHv7zyEWi6dQz0VsSRdZQ5Y/OZ0uJHDhfVI9/q84BGd3e1uRK8n8BRs2Cs3Za16ySXTKu1lIMVxWzyjLbH3OBQ0Jbih5jJPaaqjnja9w6m8kSPD5tlqkrYJENx4j13sSxJ+SniyfBI0/lGISiuJ9rmlW1LN/ENzfUdUPbJQagOemcWM/fZwYuddPLuX4TX3ui6KsRNAWwEYBAC5qb8pwKwzR2VqIInviTHH7K97A64w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymwuSxIc8L2A0aZh0nJQph6+TFrsfQpORWoS/czfQVw=;
 b=Baul8iN/YbUQw9xvpxtRjJfT5Tz7UUJfotiKlzoemEhihcK1Z8uaFVetlta8DIkrkATGUUjUG+03RRX2x8KW0N4pDZWa3jPnHkqYIicpysW+VcW/1J9abdHmAsqqA6RbqwtTmayAFx6tUnP8vyI8DOb4HgU+jllVvgSGPNnLdfs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <47b25166-c689-4e31-a161-f68001ca777b@amd.com>
Date: Tue, 8 Sep 2026 17:13:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
To: Hirokazu Takahashi <taka@valinux.co.jp>, <xen-devel@lists.xenproject.org>
CC: <Mykyta_Poturai@epam.com>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <20260728050642.411240-1-taka@valinux.co.jp>
 <20260728050642.411240-2-taka@valinux.co.jp>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260728050642.411240-2-taka@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|CY1PR12MB9626:EE_
X-MS-Office365-Filtering-Correlation-Id: fd897239-4a0d-45db-c8e6-08df0dbbc4ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|23010399003|1800799024|6133799003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	sWW9iV/m2XOwf7rHjomEJpInUoxTEfXy+QesBvcxiNDXQefPCZBH+9T4CmECZZxa3kznyyu2cVC+ec8HMyXk9yS8FYWV15QPXakVN+PhPFF1cyvGwOR/DRDSP45Pt0ko+ntZlak3xlMlCgtni9gcP8Y+SOo5sGmFqI7GGX5Wa6mayFJ3Cbyf+pA8bqJszSX/I70XtE3s/HJt7vGoHyc1LxuNPhyfUKxPBaI2KHQGp3juZmPQHDZeshYoJFmXThVAiJp/e/mounOZO/4sLoY/NMhnhNPBQDv5SyeCXvH92TqSbc1rfSa9XDxxfToRnNCVzfQHrAbYJr0Cdfi8UMZTM+Grovc4LjWpR2Fx6JdDhbdqvfO80IednOQw7AeVFzcR+cZ4x/nVTGLZETDRHTlZ9t2pjrChFHu++OCrp2UWAqNnJiDa3OE0duEV2no1KgaaoqTd2MN+aisoV4ys/jwqCn5dDct3v6HmTS4GCiVB4u2iRlPt6l7l/ttYRAb5R3C7PvhwW4YCMk0mtaA1duE+vhUlnbhtK1gZb3jSW5Ofy7bdoePDhbAxUPACEFKGPI9o7rveMEtH1J/OdHeyN3/ti+lGhj8wuv/G70AuZU3IL4BVL5OgTVd6Md1Vvt0ch3TQPCxKGnarIARmKf/x0M7SvYrsIXi1T3iDZhzjTIe8szV+ssX6cP3hZCH5Ut89Ogi0/glnwvzDyw48feNdczQvVg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(23010399003)(1800799024)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Qd06SUolGVtV0epTA2+cwGkelf6kYR8fMqFwrJYEiAyqYtOKNwpJRxeCMIcl2wK9QXUuMpdNIuJJzllco53XHSvHs2cTzvDtt8Q7WjQxflOky0rqDUiMftJ8mSv7STIBY3VokY9nms28ggOHpfC9ymvFqA8GzvV8j5zpx4J5rG3koYf9LZQuFMlrI7YJxxaE4hZLhkN8l1EDWkD6sd11+DK17O7IBEy3p5X1d1wOn+cUhj8xg+97wfPX4tR970VnIMN+Tgkzlz0+uDWcOQeYknRHAmg56fugGFYyNeJhvxRgst97mP0WJU/rw0K1HaD+NxWtynM3sY2j/fxH+rctQ7YOHt1RL82R+U9X6afFCv9vrgxZkTi1IN1eHBVkG2zuy4jLdwmiXiJ/jOzAA+c1QFgMF4GgXBjl8fVbv8cw9mOGJIT63PfN9qVe2wS3dMOR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 15:13:42.2946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd897239-4a0d-45db-c8e6-08df0dbbc4ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9626
X-purgate-ID: tlsNG-d62444/1788880433-1D87F757-77D357BC/0/0
X-purgate-type: clean
X-purgate-size: 19457



On 28-Jul-26 07:06, Hirokazu Takahashi wrote:
> Parse the 'cpu-map' node in the Device Tree to extract CPU topology
> information. If the 'cpu-map' node is absent, fall back to
> generating the topology data from the NUMA information. This
> generation assumes exactly one socket per NUMA node and that SMT
> is unsupported.
This does not seem to reflect the implementation. If there is no `cpu-map` node,
you just return error and free the table.

> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
> Reviewed-by: Jan Beulich <jbeulich@suse.com> # common, acpi
> ---
>  xen/arch/arm/Kconfig                  |   1 +
>  xen/arch/arm/smpboot.c                |   7 +
>  xen/common/Kconfig                    |  22 ++
>  xen/common/Makefile                   |   1 +
>  xen/common/cpu-topology.c             |  62 +++++
>  xen/common/cpu.c                      |   5 +
>  xen/common/device-tree/Makefile       |   1 +
>  xen/common/device-tree/cpu-topology.c | 344 ++++++++++++++++++++++++++
>  xen/drivers/acpi/Makefile             |   1 +
>  xen/drivers/acpi/topology.c           |  41 +++
>  xen/include/xen/acpi.h                |  13 +
>  xen/include/xen/cpu-topology.h        |  34 +++
>  xen/include/xen/dt-cpu-topology.h     |  35 +++
>  13 files changed, 567 insertions(+)
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
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index ba5fd2dd52..d957553a44 100644
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
You should call this only after successful `arch_cpu_init()`.
>      }
>  
>      if ( !bootcpu_valid )
> @@ -280,6 +285,8 @@ void __init smp_init_cpus(void)
>      else
>          acpi_smp_init_cpus();
>  
> +    init_cpu_topology();
This is not a good placement. See below.

> +
>      if ( opt_hmp_unsafe )
>          warning_add("WARNING: HMP COMPUTING HAS BEEN ENABLED.\n"
>                      "It has implications on the security and stability of the system,\n"
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
> index 0000000000..52e31ef518
> --- /dev/null
> +++ b/xen/common/cpu-topology.c
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
The main license for Xen is GPLv2-only. Any reason for GPLv2+ in the new files?
I'm asking because if you don't care about the license and simply copied it from
other places, v2-only is a better fit for some organizations that cannot
contribute to v2+.

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
You call it from `smp_init_cpus()` at which point `nr_cpu_ids` is not yet set
and simply denotes `NR_CPUS`.

> +    if ( !cpu_topology )
> +        return;
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
> index 0000000000..9259be73bc
> --- /dev/null
> +++ b/xen/common/device-tree/cpu-topology.c
> @@ -0,0 +1,344 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
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
> +    unsigned int package_id;
> +};
> +
> +static struct cpu_map __initdata cpu_map[NR_CPUS] = {
> +    [0 ... NR_CPUS - 1] = {
> +        .thread_id = INVALID_TOPO_ID,
> +        .core_id = INVALID_TOPO_ID,
> +        .cluster_id = INVALID_TOPO_ID,
> +        .package_id = INVALID_TOPO_ID,
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
> +        if ( target_map->package_id != map->package_id )
> +            continue;
> +
> +        cpumask_set_cpu(target_cpu, cpu_topo->core_sibling);
> +        cpumask_set_cpu(cpu, target_topo->core_sibling);
> +
> +        if ( target_map->cluster_id != map->cluster_id )
> +            continue;
> +
> +        if ( target_map->cluster_id != INVALID_TOPO_ID )
> +        {
> +            cpumask_set_cpu(target_cpu, cpu_topo->cluster_sibling);
> +            cpumask_set_cpu(cpu, target_topo->cluster_sibling);
> +        }
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
> +static int __init parse_core(const struct dt_device_node *core,
> +                             unsigned int package_id,
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
> +            return -EINVAL;
> +        }
> +
> +        ASSERT(cpu_map[cpu].package_id == INVALID_TOPO_ID);
> +        ASSERT(cpu_map[cpu].cluster_id == INVALID_TOPO_ID);
> +        ASSERT(cpu_map[cpu].core_id == INVALID_TOPO_ID);
> +        ASSERT(cpu_map[cpu].thread_id == INVALID_TOPO_ID);
This ASSERT block and the identical one below validate DT data, not Xen internal
invariant. Return error instead.

> +
> +        cpu_map[cpu].package_id = package_id;
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
> +        ASSERT(cpu_map[cpu].package_id == INVALID_TOPO_ID);
> +        ASSERT(cpu_map[cpu].cluster_id == INVALID_TOPO_ID);
> +        ASSERT(cpu_map[cpu].core_id == INVALID_TOPO_ID);
> +        ASSERT(cpu_map[cpu].thread_id == INVALID_TOPO_ID);
> +
> +        cpu_map[cpu].package_id = package_id;
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
> +                                unsigned int package_id,
> +                                unsigned int cluster_id,
> +                                unsigned int depth)
> +{
> +    bool leaf = true;
> +    bool has_cores = false;
> +    unsigned int core_id;
> +    unsigned int child_cluster_id;
> +
> +    /*
> +     * First check for child clusters; we currently ignore any
> +     * information about the nesting of clusters and present the
> +     * scheduler with a flat list of them.
> +     */
> +    for ( child_cluster_id = 0; ; child_cluster_id++ )
> +    {
> +        const struct dt_device_node *child_cluster;
> +        char name[20];
> +        int ret;
> +
> +        snprintf(name, sizeof(name), "cluster%u", child_cluster_id);
> +        child_cluster = dt_find_child_node_by_name(cluster, name);
> +
> +        if ( !child_cluster )
> +            break;
> +
> +        leaf = false;
> +        ret = parse_cluster(child_cluster, package_id, child_cluster_id,
> +                            depth + 1);
> +        if ( depth > 0 )
> +            printk(XENLOG_WARNING
> +                   "WARNING: Topology for clusters of clusters not yet supported\n");
> +        if ( ret != 0 )
> +            return ret;
> +    }
> +
> +    /* Now check for cores */
> +    for ( core_id = 0; ; core_id++ )
> +    {
> +        const struct dt_device_node *core;
> +        char name[20];
> +        int ret;
> +
> +        snprintf(name, sizeof(name), "core%u", core_id);
> +        core = dt_find_child_node_by_name(cluster, name);
> +
> +        if ( !core )
> +            break;
> +
> +        has_cores = true;
> +
> +        if ( depth == 0 )
> +        {
> +            printk(XENLOG_ERR
> +                   "ERROR: %s: cpu-map children should be clusters\n",
> +                   dt_node_name(core));
> +            return -EINVAL;
> +        }
> +
> +        if ( leaf )
> +        {
> +            ret = parse_core(core, package_id, cluster_id, core_id);
> +            if ( ret != 0 )
> +                return ret;
> +        }
> +        else
> +        {
> +            printk(XENLOG_ERR "ERROR: %s: Non-leaf cluster with core %s\n",
> +                   dt_node_name(cluster), name);
> +            return -EINVAL;
> +        }
> +    }
> +
> +    if ( leaf && !has_cores )
> +        printk(XENLOG_WARNING "WARNING: %s: empty cluster\n",
> +               dt_node_name(cluster));
> +
> +    return 0;
> +}
> +
> +static int __init parse_socket(const struct dt_device_node *socket)
> +{
> +    bool has_socket = false;
> +    unsigned int package_id;
> +    int ret;
> +
> +    for ( package_id = 0; ; package_id++ )
> +    {
> +        const struct dt_device_node *cluster;
> +        char name[20];
> +
> +        snprintf(name, sizeof(name), "socket%u", package_id);
> +        cluster = dt_find_child_node_by_name(socket, name);
The names are one level off (I know you took it from Linux which suffers from
the same problem): the parameter is the cpu-map node, not a socket, and the
local is a socket node, not a cluster. parse_cluster() has the same problem.
Please name the parameters after what they actually receive,
e.g.parse_socket(cpu_map) with a local 'socket'. It makes it difficult to parse
the code and I'll wait with reviewing this file until this is fixed.

> +
> +        if ( !cluster )
> +            break;
> +
> +        has_socket = true;
> +        ret = parse_cluster(cluster, package_id, INVALID_TOPO_ID, 0);
> +        if ( ret != 0 )
> +            return ret;
> +    }
> +
> +    if ( !has_socket )
> +        ret = parse_cluster(socket, 0, INVALID_TOPO_ID, 0);
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
> +    return parse_socket(map);
> +}
> +
> +int __init dt_init_cpu_topology(void)
> +{
> +    unsigned int cpu;
> +    int ret;
> +
> +    BUG_ON(!acpi_disabled);
> +    BUG_ON(!cpu_topology);
ASSERTs are a better fit here, given that these are already validated by the
sole caller.

~Michal


