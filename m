Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B0EC624A5
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 15:49:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404222.1638046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x14Fq-0004Us-Rc; Mon, 31 Aug 2026 15:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404222.1638046; Mon, 31 Aug 2026 15:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x14Fq-0004Uj-NY; Mon, 31 Aug 2026 15:49:02 +0000
Received: by outflank-mailman (input) for mailman id 1404222;
 Mon, 31 Aug 2026 15:49:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x14Fo-0004UV-MX
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 15:49:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x14Fn-005Nvf-HQ
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 17:48:59 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a95a244-2eae-0a2a0a5409dd-0a2a450be100-40
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 17:48:59 +0200
Received: from [40.93.195.60]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a95a269-b7e8-0a2a450b0019-285dc33ce0a3-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 17:48:58 +0200
Received: from PH7P220CA0123.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::26)
 by IA1PR12MB7664.namprd12.prod.outlook.com (2603:10b6:208:423::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:48:51 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:327:cafe::9) by PH7P220CA0123.outlook.office365.com
 (2603:10b6:510:327::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 15:48:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 15:48:48 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 10:48:47 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Mon, 31 Aug 2026 10:48:44 -0500
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
 b=MhAWVU6yo/zBMNQbT1vhx4FQ5Y3AI5fggDjQxmOvWhaunV0nQyVM6cm74rwnHxb3JOnIBzrwyQWIdzQjWc78voDBqKY6UcHe3W5JagLNCMx49+4GjnRSVaYJ4EM5U7Y5W9R+3K3MbmZugNmY+jIYbT+nYC/nuONtlByMMX8NKFfZhC2GeXgSAPzbJ68hm7rbKXABKOIgjInnv1jcFaVDtl4pm94/KDI06zx5tJGEuau3Us5QQkqcziDAgiNlHZ0B6s1pE3PZkUGeB0AplFxYQh96XpsUDvUX6lgL+1KgMtTRR579hdsGp4homI3RbVxWVQgXp3+2yI7ywOtOoQ5ZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osTvsVhTWtmBmIq3KzqWnv9M3d8c/+5re+vhRnScSg0=;
 b=SN85irWuHS3uZRMRIQLj9PgoBP6qjVUa/FU37poO97+mC+dVS9zOL5TuC2umgZm0KuxJWh45xIDq4KgN3Fsy+E6e6cy/39Gz8IMjREkQNPsjn7TSZ5B+eftsOIC3sjW8e0wpDgNvylJqC4HRwtq1F3wkAPgFL7uXRwN3msZ89xajBowAgSiGoh7MUYwresj/8y28Ob2i3nbgmIzDf6ZwgGOnaYmkKcw2/GfenXiMjW/06BigW+d88bkXvbsdRVRIfOiHu4sSl7zTEas/q0SbKndYXOGB4SXM+ZAAuqs6PjEKiK+EtyDB0VdbOj39lWWx+bbIhCNwGV6Wv6qtE/A/bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osTvsVhTWtmBmIq3KzqWnv9M3d8c/+5re+vhRnScSg0=;
 b=JD8aqiICj/+aDCgkM2aqWd6AX0OssNXra4HqgVZMwFL9Yx47/k3LmHjk7oRxMRBi6lyXAG7M2jkw3CUC1XqYagRHITZlucZfwdaCO8Uz4Ng3D5oA3GuvI35UTXrZmyRuQTr+E+MghrRqClLiKdJcBUGQlnXd59+C3VdevjRgVsI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <b65fcc50-b249-4505-a212-b2f60c55f86d@amd.com>
Date: Mon, 31 Aug 2026 17:48:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/20] xen/dom0less: turn max_init_domid into a common
 variable
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Baptiste Le Duc
	<baptiste.le-duc@vates.tech>, Zheng Zhang <zhangzheng@iscas.ac.cn>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Teddy Astie
	<teddy.astie@vates.tech>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
 <5a74a964b763e8444579a3c0d455e23160be8893.1787836900.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <5a74a964b763e8444579a3c0d455e23160be8893.1787836900.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|IA1PR12MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee5365e-1273-4b33-0b1c-08df077758eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|376014|1800799024|56012099006|10067099003|4143699003|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VxDpg6SA175mFY2YlvzT33HX8cf2FqT9U0rG3JCgeVXUoSrqHsu9kH5++t6kj7/DCRU8XktpqpHZpwZ7x1hZfHYcNNn4D2sBGpBlcTZAeTlGdXgcvfGxzUhCMbZc4tm9USlQFMIfAKoY17heDUESRYPBFJvxZXI83werSOV4w0/YPtd9sG41RAeu4e3Zs7/CIdKZwYj80L6HDx0JYwa+bIcvrzNRP0+I6b8XoZ6v9wEUEhw5SIQH3ERVlbxMSTJF6xBD4dGSeigq4DYJLGAAlyFEsOv7Fx2em/9keg7Sr3pODGF8AOvlvUIEAlzm0S+P7bO2Hl5352E/ykXZpLmQerIASM7aS62WTy2moogYrtYgQ2tAzvpe8vnrWaj+y5/5gF09WgD8S+r3lS32cnZ11DzvbY/dxGcY3b/jbO1t6Yb1eQcL5UGxSC9vDNEntSmgJmQs8faAJlVGUf8rNpz9PjxllXEC3w9Y+Yg7lwJt0fXEdNQBGJ2KRJjGyiKcAz+Gtzh3NRxRng4okGxOAOxsw+ZzDCd48shz8JBQo8l6Lx11q9VOiUDmco2LcyOpm3u2ipQiApUWq4KrMKe4MjRAFEEFIpg/hM1yhPf66S2rs0dAcomyN0vU7QftxnT4M9Fexut4QkqLTX+IkiWpW8MCABvVEOA5F1eanYpzN96pwY0G5koW85oDYxhfgnWf498PbPS2AIRurH49vhAJTt6ecQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(56012099006)(10067099003)(4143699003)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bf+0R0MeWt1R0Mps3pWXBuVzvgc4hqj4VLa2bqK6w5KaabZMJjidr1hpUXaIohng3GGv4hjdGtEIuJllKoi+QY5tK3trNxAby05C11LJTXhOSf67Csww9DnyZZYwGO4dMStjGdLJBRiMjRShWGgqVAKqdijkiGiqZQ1oCTvDOkZtZHWs2DVOioiEsv1QWHeSKHBLv98uHgftRXoYNoraSCciMN0Z5qx5djqPm1DGDp5iD1eU/FNA/AdfwTI6O8qJKhUSqvnqNrq9I0CrXjHmMSzekNqxXl+GwuafVjUu7KEgbPO5C45jXrTkXbgs1eeXKZadlpp5mPAEfQFkQW1AP8b7LIk58vRZ+ae1gHtlQ3e2RviRPri5tb3AgBDjFGJugr/TORlO9DNFr0lWBVfdUjxs4Nkaxu4U8/Wow/SPP8UDr3UN24+MEKw4qlf4OP0r
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:48:48.3336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee5365e-1273-4b33-0b1c-08df077758eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7664
X-purgate-ID: tlsNG-42698a/1788191339-A8AC89EA-B7A3D020/10/73395122804
X-purgate-type: spam
X-purgate-size: 5453



On 27-Aug-26 17:18, Oleksii Kurochko wrote:
> Until now every architecture carried its own notion of max_init_domid:
> Arm defined a real variable (declared in asm/setup.h, defined in
> setup.c), while ppc, riscv and x86 each provided a "#define
> max_init_domid (0)" stub in their asm/setup.h. This duplicated the same
> declaration across all arches and placed a purely dom0less concept in
> arch setup headers.
> 
> Now that the dom0less build code lives in common (xen/common/
> device-tree/dom0less-build.c sets max_init_domid, and the console
> serial-input switcher reads it), there is no reason for the symbol to be
> per-arch. Provide a single declaration in <xen/dom0less-build.h>, with
> the !CONFIG_DOM0LESS_BOOT stub kept there as well, so there is one source
> of truth and the arch headers no longer need to mention it. Update
> console.c to include <xen/dom0less-build.h> for the declaration instead
> of relying on asm/setup.h.
> 
> Place the definition in xen/common/domid.c rather than in dom0less-
> build.c. The latter is built as dom0less-build.init.o, i.e. the whole
> object is relocated into the .init.* sections and freed after boot,
> whereas max_init_domid must outlive boot because it is read at runtime
> by the console serial-input switcher. domid.c is always linked (obj-y)
> and resides in regular (non-init) sections, so it is a correct home for
> the variable. It is marked __ro_after_init since it is only updated
> while creating boot-time domains and read-only afterwards, and guarded
> by CONFIG_DOM0LESS_BOOT as domid.c itself is unconditional.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in v6-8:
>  - Nothing changed. Only rebase.
> ---
> Changes in v5:
>  - Add Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in v4:
>  - New patch.
> ---
> ---
>  xen/arch/arm/include/asm/setup.h   | 2 --
>  xen/arch/arm/setup.c               | 2 --
>  xen/arch/ppc/include/asm/setup.h   | 2 --
>  xen/arch/riscv/include/asm/setup.h | 2 --
>  xen/arch/x86/include/asm/setup.h   | 2 --
>  xen/common/domid.c                 | 5 +++++
>  xen/drivers/char/console.c         | 1 +
>  xen/include/xen/dom0less-build.h   | 7 +++++++
>  8 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 0adfa4993a8f..2af780512540 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -25,8 +25,6 @@ struct map_range_data
>      struct rangeset *irq_ranges;
>  };
>  
> -extern domid_t max_init_domid;
> -
>  void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
>  
>  size_t estimate_efi_size(unsigned int mem_nr_banks);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 6310a47d68b6..86532d0a35b6 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -62,8 +62,6 @@ struct cpuinfo_arm __read_mostly system_cpuinfo;
>  bool __read_mostly acpi_disabled;
>  #endif
>  
> -domid_t __read_mostly max_init_domid;
> -
>  static __used void noreturn init_done(void)
>  {
>      /* Must be done past setting system_state. */
> diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/setup.h
> index e4f64879b68c..956fa6985adb 100644
> --- a/xen/arch/ppc/include/asm/setup.h
> +++ b/xen/arch/ppc/include/asm/setup.h
> @@ -1,6 +1,4 @@
>  #ifndef __ASM_PPC_SETUP_H__
>  #define __ASM_PPC_SETUP_H__
>  
> -#define max_init_domid (0)
> -
>  #endif /* __ASM_PPC_SETUP_H__ */
> diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
> index 2215894cfbb1..73ce2f293348 100644
> --- a/xen/arch/riscv/include/asm/setup.h
> +++ b/xen/arch/riscv/include/asm/setup.h
> @@ -5,8 +5,6 @@
>  
>  #include <xen/types.h>
>  
> -#define max_init_domid (0)
> -
>  void setup_mm(void);
>  
>  void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
> diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
> index b01e83a8ed9f..5925c5f39cff 100644
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -68,6 +68,4 @@ extern bool opt_dom0_verbose;
>  extern bool opt_dom0_cpuid_faulting;
>  extern bool opt_dom0_msr_relaxed;
>  
> -#define max_init_domid (0)
> -
>  #endif
> diff --git a/xen/common/domid.c b/xen/common/domid.c
> index b0258e477c1a..cd46cf952be6 100644
> --- a/xen/common/domid.c
> +++ b/xen/common/domid.c
> @@ -9,6 +9,11 @@
>   */
>  
>  #include <xen/domain.h>
> +#include <xen/dom0less-build.h>
NIT: "dom0less" comes before "domain" when it comes to alphabetical order I think.

> +
> +#ifdef CONFIG_DOM0LESS_BOOT
> +domid_t __ro_after_init max_init_domid;
> +#endif
>  
>  static DEFINE_SPINLOCK(domid_lock);
>  static DECLARE_BITMAP(domid_bitmap, DOMID_FIRST_RESERVED);
> diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> index fcacf37c52f0..61e92491e40a 100644
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -31,6 +31,7 @@
>  #include <xen/warning.h>
>  #include <xen/pv_console.h>
>  #include <asm/setup.h>
NIT: This can be dropped - I don't see anything relying on it in this file.

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


