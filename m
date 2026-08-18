Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6110BC5DF67
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 06:29:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393431.1632234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDJa-0006aF-8B; Tue, 18 Aug 2026 06:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393431.1632234; Tue, 18 Aug 2026 06:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDJa-0006a8-4z; Tue, 18 Aug 2026 06:28:50 +0000
Received: by outflank-mailman (input) for mailman id 1393431;
 Tue, 18 Aug 2026 06:28:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wwDJY-0006a2-Lu
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 06:28:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwDJX-005eW6-1l
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:28:47 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a83fb9e-8faa-0a2a0a5109dd-0a2a4508cb2a-0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:28:46 +0200
Received: from [40.107.208.70]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a83fb9d-f659-0a2a45080019-286bd046dc8f-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:28:46 +0200
Received: from BL1PR13CA0338.namprd13.prod.outlook.com (2603:10b6:208:2c6::13)
 by CY1PR12MB9627.namprd12.prod.outlook.com (2603:10b6:930:104::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 06:28:41 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:2c6:cafe::d) by BL1PR13CA0338.outlook.office365.com
 (2603:10b6:208:2c6::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 06:28:41 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 06:28:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 01:28:39 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 01:28:39 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 01:28:38 -0500
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
 b=h6lYdSQ+9WiTrzhtcGrqy7JDdXLt6bBpM/SEtFV88YE/p8LQf9SP697gzeOlv5Fez2+HFbG2wyqh9SIZmUc6hMI6iVuiEjHSlGwK4TgkB5OybBebb6LRm6Nmr5/mdvtzdTlLfw01/8k4wtI19twIFa88CnIgVxVW7AGK/3B19nsRi15QYoO9TUgaS3a86fq9znyUA943iMljH1V6uIAByvRDLIcalAihdUlUSyO+BAEUzLgCNxuqpkyiXt0DuH86BZMyMd56NE36FPyzuqd8NkUufVqjj6JhP4I3SvNLSF/8CxMYFP0TxF2+nilCCqhsImqzsCX3P+lvVa8PcxaZFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArIBkWypTrCrcUcT7JGOxsY7XolsZfaVO9t9RQk02vU=;
 b=cK1iQr/P2kEyjPOxrUoNsc8ewZv0K/SEz71IC9ju3aCf980sR6t1ISkNli24DtjFId5SuW6yk/kWn7lhxIntID0s2sgTQakhIgQuOu+xj52M18IHb7nFvhcfjH2JV+fNMZ/mgJXi7zQqiyRdex2bDq9we36wQfSzvkeAwhfCUG+lfr5m7hnnVCAOlwgH0plFImhR1J2ilWmh0cUhhoMBhlxmEA04GM695GpJKmwOpsYv2BwA++h4+9dGP+5QAwJgFBJbgiuQARGiirzhZFkZeGNbOD9X5VLz/iOdOXDBc7wku5/MoF7jusC9NJIa70CZ2latkSVR06orzbe3LCv9Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArIBkWypTrCrcUcT7JGOxsY7XolsZfaVO9t9RQk02vU=;
 b=hsl44DSdPQNC6o/1Ayg+upM8dpedh2TJVs6J5jbNFxtT/r0sDbp2hE1vA+6UDrC/nrdBgWlHV415/CEDfksXdsBY6AznK7l+WV/VrPUqFvqFE0mj0Gvbevl26raxWptRnr5tVjjCMS8EQewlJ5UcUvIyo+Sg0oKP6s/MGPnBi54=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <26c0b60f-053a-4b01-8b74-2cec0d72b389@amd.com>
Date: Tue, 18 Aug 2026 08:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] xen/arm: add i.MX8M platform and UART support
To: Wig Cheng <onlywig@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>
References: <20260818025224.4165503-1-onlywig@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260818025224.4165503-1-onlywig@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|CY1PR12MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 0956c3ef-934c-4cd8-707d-08defcf1f1f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Xd/NjSqneSM/lzQfnMQoihupzX4qMwsEqwL/3gmlPrwf684aQpr9CQ+v8mlQZ6lT23W6h446JIxVvlxGXF6i3u4SJI1cqqOahOPbOEgPzfm626WJ/TX5R33xg8HQLrbLWirTOTC6E1DmlHzuygN7hlv8UdGsQ8Q89N+UMMtdmXPwBSAVWXXyEXaURw/OT0bqjMUG8nQ0vH6G3gE5qbcAAU8XiyiSInhBN0Tw4GGGtFMVLz5nc8+me8qfXsB4voP6F4oHEnx9qY8933IQypkLclylB4+fb/WBj7bto3lFNXNAIn0RZR42b0kz4w6/FdRRGOAoUyJNlx2uxQr1mh782/eUdjVoekZPI6vZ/UP8qNpjUi4abjssEovR8tD7T8iMRknIb/x2/oUAFzmW3BoTC3ziLPcy9GtP/OJIMoFjQ/q4GuNIGWD5tO1SgAML+1ravPrR11Ng4z15eLWyoIfPKiEv+450Yhpg04Bei+llhHt8olaEqlRXgJQOpFdk9NqhRwCJhFIM87ZUW3u+B4bqFPIRZ2v+Zd2NMDw1tV8LXvOtodUiah3Eg4YEAabPCzP+xdVbix/5rXG4ylxKQA6vDpUKQlD96FXNGldomp69OrrtgZZWxCpHVAm4mv7q5hBxw3CrgciFQxJheH4h0oCToENWo1q+qB7gXfLw9A9pK7GkxmUqiQvnP0L9ooglCCa/5cyoMUw0UrmBJtzfE+qUqw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pybFiMBvV0g4pktASm8KXdXid2c3Jo2O+z3WisaKF1ci0YdPpg+tdx0oMCmRRtEWbXnHI8bNeGUM391YbNXiLaSriatYC4Y3Y9snan3YmFGREc/Pl+HlPmRdbFWWkhZ26PyueK/lgGjYQm4fXBdfR7ux02MUXj73Wc889g/DrVVMVcFQUFd40O5gH6jE0ECSM8HitU/oIfRhx3gi12wm37lbj5zKTJNZT30TCXV6NxQzVBghN4QZ6ZQETjUq0BZi3gJcw51LXudPPUxHsrukhX3f8w2Wfo6xPp3jPKISAU0zdeHbMl0OXEiqHDaIKsjJITpW+fPcSgSF94YT6gLgpDxTrdZtml2y136Rxr4YxdNeY1pOT7ZJOSWqr1DgcBsGtuX6S7bmVKHgETDCjXkfF7lq5Ib2NlvTmH5d+dYM95QeyfaGO47jVL/RWg8Kx94U
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 06:28:40.9209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0956c3ef-934c-4cd8-707d-08defcf1f1f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9627
X-purgate-ID: tlsNG-c1860d/1787034526-D6B4187B-52DE3A5A/0/0
X-purgate-type: clean
X-purgate-size: 3457



On 18-Aug-26 04:52, Wig Cheng wrote:
> Following Michal Orzel's review of v1, this series adds Xen support for
> the NXP i.MX8M family (i.MX8MP / MQ / MM / MN).  It provides the console
> UART driver, its early printk, the platform glue (SiP SMC whitelist for
> the calls the dom0 kernel issues to TF-A), and a MAINTAINERS entry.
> 
> Tested on i.MX8MP (4x Cortex-A53, GICv3) with the vendor kernel 6.18:
> dom0 boots to login on the hypervisor console, and a domU starts with a
> PV disk and virtio devices running a full Wayland distro.
> 
> Notes for reviewers:
> 
> - Unlike i.MX8MQ, the i.MX8MP device tree uses the GIC as the root
>   interrupt controller (interrupt-parent = <&gic>), so no device-tree
>   workaround is needed and power domains keep working.
> 
> - The i.MX8M family has no SMMU, so device passthrough relies on the
>   1:1 direct-mapped hardware domain.
> 
> - The SiP SMC whitelist forwards only the specific subfunctions the
>   dom0 kernel issues, extracted from the vendor kernel call sites.
>   DDR DVFS is left at service level because its reg1 is a frequency
>   setpoint rather than a fixed subfunction id.  No call was denied at
>   runtime.
> 
> Changes since v1:
> 
> Patch 1 (UART driver):
> - Documentation narrowed to the i.MX8M family (dropped i.MX6/7).
> - Relicensed the new files as GPL-2.0-only.
> - Dropped the stale file-path lines from the file headers.
> - Renamed the header guard to ASM_IMX_UART_H.
> - Removed unused register/bit macros; header is now asm-safe (BIT(n, U)).
> - Also clear UCR1_TXMPTYEN on init; documented that the console is
>   driven entirely through UCR1.
For the future, please include the changeset in the individual patches. This way
it's easier for us to review without having to switch between e-mails.

~Michal

> 
> Patch 2 (early printk):
> - bne -> b.ne.
> 
> Patch 3 (platform):
> - Build the SiP function IDs with ARM_SMCCC_CALL_VAL (IMX_SIP_FID),
>   matching the i.MX8QM platform.
> - Whitelist per subfunction (GPC, SRC, NoC) instead of whole services;
>   DDR DVFS and SoC info kept at service level with a comment on why.
> - Dropped the BBSM call, which is not issued on i.MX8M.
> - Fixed the misleading "secure RTC" comment and a stray space.
> 
> Patch 4 (new):
> - MAINTAINERS entry, as a separate patch.
> 
> v1: https://lore.kernel.org/xen-devel/20260814162535.331459-1-onlywig@gmail.com/
> 
> 
> Wig Cheng (4):
>   xen/char: add classic i.MX UART driver
>   xen/arm64: add early printk for the classic i.MX UART
>   xen/arm: add i.MX8M platform support
>   MAINTAINERS: add myself as reviewer of i.MX8M related patches
> 
>  MAINTAINERS                           |   7 +
>  xen/arch/arm/Kconfig.debug            |  12 ++
>  xen/arch/arm/arm64/debug-imx-uart.inc |  37 +++++
>  xen/arch/arm/include/asm/imx-uart.h   |  57 +++++++
>  xen/arch/arm/platforms/Makefile       |   1 +
>  xen/arch/arm/platforms/imx8m.c        | 152 +++++++++++++++++
>  xen/drivers/char/Kconfig              |   8 +
>  xen/drivers/char/Makefile             |   1 +
>  xen/drivers/char/imx-uart.c           | 226 ++++++++++++++++++++++++++
>  9 files changed, 501 insertions(+)
>  create mode 100644 xen/arch/arm/arm64/debug-imx-uart.inc
>  create mode 100644 xen/arch/arm/include/asm/imx-uart.h
>  create mode 100644 xen/arch/arm/platforms/imx8m.c
>  create mode 100644 xen/drivers/char/imx-uart.c
> 


