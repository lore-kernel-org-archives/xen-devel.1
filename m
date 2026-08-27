Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B920C61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 14:32:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400692.1636338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9n-0007be-JF; Thu, 27 Aug 2026 14:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400692.1636338; Thu, 27 Aug 2026 14:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9n-0007av-8S; Thu, 27 Aug 2026 14:32:43 +0000
Received: by outflank-mailman (input) for mailman id 1400692;
 Thu, 27 Aug 2026 14:32:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wzb9l-0007R7-8N
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 14:32:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzb9k-009cUS-LG
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:32:40 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a78-bab6-0a2a0a5309dd-0a2a450ca9d8-44
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:40 +0200
Received: from [52.101.69.140]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a88-f479-0a2a450c0019-3465458c71ef-4
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:40 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB6742.eurprd03.prod.outlook.com (2603:10a6:20b:295::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:32:39 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:32:38 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8kVmw4b3XnOTTSq1x6XVEEJufmxxPuap7gf+AJ701tDbyv63zYAIMSyFQx5MyumfgdM2/txpn0MECXNCDskZLeJu6y5QJpTDfyVC1eArodnM4YuwSt0AxYm9gl455FVkL4mkRFiQbLK4WaN6oO/ZNFMmcgvl6mI8ggFOQP0f6WJ0+fahjjbx3EAXVhZvHLlkabVh2ifGMzMbkfGM0vkcyaKD5LHVZGG1owumtZzz7lJDORZBHVUHMminHIuW+u+XBJZdwim5Oyu9bPEavVy18UDCWE89RbggWLj2GUvp/3ksnYuurdYGvlXP8DHOj+MO7gsWndcqPKoCwZtXpBAWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysoieNwLBuP61lAhmYXVgWNFPxkgEMgRS+eiqfsijP0=;
 b=p8u8auMHcmtHsHTChFgl9NSy1xw9/ZZiuS/qoIRPFC/Q/jNQNomRoZWLFSfeFgbENdA7OIuZl5+7nnA7CiPKE0gB20ltEKSUGHGH0NQrdZcvkQVE3VSHhI5i9qmyZfJSlmcA43qvGULgY405B86/B+BB5gxw42gwQAwYkGFWCvm0C8719kT2NFV3kQxsUDC7ogEbTzBEoF87h2HsxcQeMPpaZIwLWJpnyruBvu4Cy9fV7ytu1gi3PYLjKtFbnHtZIdG6WAxzZU/mLHKSWoWUJ2M/LDz60vX+AjcCPHBUQd+TV57rzttCTXvTQMwgXEQiBNIujzwCv1qd8opJiZEfyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysoieNwLBuP61lAhmYXVgWNFPxkgEMgRS+eiqfsijP0=;
 b=XUV4tACvUjDkmStJ7lO7cf6evOrd0tURVMNnf5zr2f9Ati0SETPl9xVySNB3rh1KN3C+4OFg/fIgPizBh/xPVd7NfVKUm+nVzAhMG8QOPhvFANAhVtCj8wpvGtOHUyypsFSPhfQFUjnyAyszeGELqoDbOBRPYbJHtnz72MjiklhsMcSqvlp4aIwq6eV3nfYl0zvMp/Xuw7olVX+XD+1I58QYpT8xLhsWD7pB8ty7qwHMy+FfCIlkLcpXKfEomzxJs2U5huiyzOcjC5y0MbUFEnQXURA5lLEwM5AklhUYLkpgq0L3Dq6UE8H7ONGYQBvDhcDmnpHvKlSXbZNwlnFqyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v12 13/13] xen/arm: Add host system suspend backend
Date: Thu, 27 Aug 2026 17:32:01 +0300
Message-ID: <9d3cf11530edf478ae7a597f1c0934f4b7b1a270.1787838455.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787838455.git.mykola_kvach@epam.com>
References: <cover.1787838455.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AS8PR03MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: cb991339-216a-465b-d7c2-08df04480b6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|3023799007|22082099003|18002099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	6+lvntYOdSlRwPe1GqKL4v8MK7H/AqkBADk6rk6/d6jWfX9TvyDe0Zdn5AtulpXEhrNL/xTKyIdh+6wWHl2kuvksyEnOJcpEfphCQU4F2LeAxiPoksfQfu1jIO5czuaQrsI1OlIkTPo5zvjEsgMP5g/BYs28VqwDSjcZdADgt1Kpx87QfoX7u9KpkgoYfIKoGjBmObkZ1WHceg88SKy4N2TFwlUBJrZKx5J78YYBVwD4Hx0yICEL90roXzHndeqsV4RY30Oi6uSHGzLVgnaSEsVtB4LojyvGVnj+AsnQnWoSgJEBPKpDgkq1ejAHSj9Ajjbs/9m49NSsaCMOx1SC0j7qcvWkUQJJe/yfERoBLdD7SUCNRZQsPRHDD0dYcY2b2MdkU636DsvcuPq6xb54wQGNA6cXIgm49wJ+24Ccq9Wc4mhUiZy/21+Nsabp5R0Zsm76LH70WwYz94zLcwqZrE6iyCxN3WaX+0qBo4hCtPyvMeI88YkDQAnhh4rLgTJIepCj4ioGivSu8qyoWa+eB7hTs7vM3SAmT24SozWLIHLhloL3uhnmI4ne0njBN9SIwUNJ50HKDbAExswNxKbmKJrss1t9J4Xl8BLayYZ+qVGiSQzuNVdtyqSMUO94p/MXmXepG2Y5N7Yo07JbRaP38xWbSpy4E6VZQNzw710F/cQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?52g2ttpuEgIDwdKf5+FOMe3op1dwgDLQy0sKyhNZY8c92baL5XsAz1vaVS3b?=
 =?us-ascii?Q?3YqdIpva8lTuYClF4CzcKB10oT1xauIrIfFGU5F9NNwz0xwrcSQBFWtIrh/H?=
 =?us-ascii?Q?YFb7nRT9NnB9ybcadHDiPHxbn9tnIjbhGCL7tS9WBCWXk82oHHqNcyN93e1n?=
 =?us-ascii?Q?lUmeCT6vnVgrjfxV2dnvoYuGBFfy7aQGsFzerc3rHZkCqBvNyS+yYYRXi65F?=
 =?us-ascii?Q?t6wIXPjJyEJ5ASomOAYOTzVDnXa/zbIuSAqWgHFKVNcBJwAZY/mB7j1iwD69?=
 =?us-ascii?Q?CUjjP4e+88dSCXrmh7Cj2K7q//UPZeanvQ1j85LUjivoNNq9e+qhwkd+m7Fq?=
 =?us-ascii?Q?Jw09EONSNA/umK9DT/2w1CbQPf84PYjRVS/0T+CiaOOvxu7iQ/JI4tmFAeLG?=
 =?us-ascii?Q?60umPLx1AFnz+5vjVghj1hEDOjMK+SwbOCicfbUZopgVcXwCp77hwIC4PeRR?=
 =?us-ascii?Q?mrjX46JE+QDoLvFIB3vPpvkx5X85kJhSdUNvsUV71hWmb1GOh4q/J+uIk+10?=
 =?us-ascii?Q?8JgsYRtDc08Bx+SMJUiZFjipB9sk7u72aofXyTXeBBUnQNou0iDwnWSt3kNT?=
 =?us-ascii?Q?R/UQr7hxQDosLi6Zn3WHKF2UkKnO6g1jA7QQxPBuV3SK8kw1YKkEgHbxWlLd?=
 =?us-ascii?Q?Dz5LPTjPZJeEACNQdfB4+GRKgB+KCJsf6nK+77RJ945paEu3cB5YG2Ufnmdo?=
 =?us-ascii?Q?twjyq91sVRCRwjgFvCilda7K2NnrgPGvBGD5KONBL8QOnxhqu4GPhGl3yY85?=
 =?us-ascii?Q?zZXPEjRKywX5ksLD4Uap2d748gk/+/U9XYcdoIorUXdxBDVG3d8wJlbn5v3L?=
 =?us-ascii?Q?pd11vULDLrXwnUhG4hpWiq2REAu0RFERX0EPQEkrfAskpKUjit/3EPYjWEjy?=
 =?us-ascii?Q?rG4m98zUPanc6hStyJmvZFBYeMgA8zuYoBukyUyEfK1oXNlPNw0yL0UaiH0h?=
 =?us-ascii?Q?Zmam0kFXW9DdESj3/1yompmLop2GL4ztdkIV/KLO8pweiYUB9f3Riy0GN4Ru?=
 =?us-ascii?Q?qDfKUdjtPbrhI6NHSu4vsQaeN0dPc1xNfM/lQpJP1VTb3/6adsxpDgP5yMw7?=
 =?us-ascii?Q?xuloZcFoXc4SnObkDz52ao6xZ7FCpjckGCcsLHaXRFjizEHTR40ZyQKa9AY7?=
 =?us-ascii?Q?XGCO/izxXAEbex07xvA8bh9VE0M3/yA9By0k7vKCa1GjEwtxg4Yill6QKnHJ?=
 =?us-ascii?Q?0zpjQQoSYp3Y3XIhGKVjV4qTL6I1pLeez+icwGKQltZyh86ILSBEQEu32D4+?=
 =?us-ascii?Q?v2+Pp0YTHOmlWvpXbvQ9UdxTU5OehhNC3dOuJm2k8csm+biPzHuRl1Q5lWBv?=
 =?us-ascii?Q?G6POD3BD0Uu5IyRPzx32NhuSRnHUdHjlRuovAL1Ywclx7JW0BTTkKm/BxzvG?=
 =?us-ascii?Q?zQEqFqfQWM7bDGam2bW9IH06I+lRxN8iz0zHz07M8HEdyXHEVWYXtsfXDg/e?=
 =?us-ascii?Q?TVtVbMW2EPsn0V/MKI3ZDl0GFxctDgyeMiqZx0sygUX+28gbOlC/HB/Bpvol?=
 =?us-ascii?Q?CyWRuueQo4qC+AtD4hFViABnYZbf8nAAFIOUX21WpN81x0O4ni5JmeJjT4JX?=
 =?us-ascii?Q?SOuzvCbYJB/i/E4OyjhJQPIzeI9chOBs3R2IhUVCboBGl/v1Rq091VkjPKDt?=
 =?us-ascii?Q?3QWP2xd0QEVpZE6YwrZwsOCknzfqIshEFvOL3Gf5Qjh8xap/UsOym7KKu6vb?=
 =?us-ascii?Q?LpnUnQlemziHEiypeI7hQKysAabBEq7rwQ5hvdmCgxYNI+wfs9kbEcecNYdl?=
 =?us-ascii?Q?2yg08PE5OQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb991339-216a-465b-d7c2-08df04480b6a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:32:38.7177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itrksI7d7A1dJR61Uo5+4ayonXZaw0TKIInO1v4fBbHKYRslJ2g6S2+HpoCr5oegQDnJ5IBcJeH9Z1RakutPZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6742
X-purgate-ID: tlsNG-d25034/1787841160-77AD4A5B-11064161/0/0
X-purgate-type: clean
X-purgate-size: 13927

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Add the Xen-wide suspend/resume backend used after a control-domain
vPSCI SYSTEM_SUSPEND request has been accepted. The vPSCI policy,
runtime driver blockers and control-domain sequencing checks are handled
by the preceding commit; this change adds the code that actually drives
the host suspend attempt.

The backend runs from a tasklet scheduled on pCPU0, because non-boot CPUs
are disabled during suspend. It freezes domains, disables the scheduler
and then disables non-boot CPUs.

Host-side suspend participants are handled in phases. IOMMU and console
state are suspended first. Local IRQs are then disabled before suspending
timer and GIC state. On resume or failure, the completed suspend phases
are unwound in reverse: GIC and timer state are restored while IRQs are
still disabled, local IRQs are restored, and then console and IOMMU state
are restored.

On boot, init_ttbr is normally initialized during secondary CPU hotplug.
On uniprocessor systems this can leave init_ttbr uninitialized, so set it
from the boot CPU before entering suspend.

Note: the code is behind CONFIG_HAS_SYSTEM_SUSPEND, which is currently
only selected when UNSUPPORTED is set and MPU is not set.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V10:
- Re-apply boot CPU local errata/workaround handling after SYSTEM_SUSPEND,
  before resuming the rest of the host suspend path.
- Move set_init_ttbr() declaration to asm/mmu/mm.h, since it is
  MMU-specific.

Changes in V9:
- Split vPSCI availability policy, runtime host-suspend blockers and the
  domain-readiness precheck into the preceding commit.
- Trigger the host suspend backend from the control-domain SYSTEM_SUSPEND
  path.
- Reorder the host suspend/resume phases so the timer is suspended with
  local IRQs disabled and local IRQs are restored after the GIC and timer
  resume paths, before the console and IOMMU resume paths.
- Move HAS_HWDOM_SYSTEM_SUSPEND and related logic to policy patch.

Changes in V8:
- Add a pre-suspend check in system_suspend() after scheduler_disable() to
  require all domains to be in the shut down state with SHUTDOWN_suspend
  before proceeding with the global suspend flow.
- Drop the common-level depends on !ARM_64 || !SYSTEM_SUSPEND from
  CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND and model the ARM64 suspend case
  with an arch-selected capability instead.
- Rename CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND to
  CONFIG_HAS_HWDOM_SYSTEM_SUSPEND.
- Rename need_hwdom_shutdown() to want_hwdom_shutdown().

Changes in V7:
- Control domain is responsible for host suspend.
- Add an empty inline host_system_suspend() function when SYSTEM_SUSPEND
  config is disabled.
- Use IS_ENABLED() for config checking instead of #ifdef.
- Replace #ifdef checks in domain_shutdown() with IS_ENABLED() to simplify
  control flow.
- Factor hardware domain shutdown condition into a helper
  (need_hwdom_shutdown()) to avoid preprocessor directives inside the
  function.
- Squash with iommu suspend/resume commit.
---
 xen/arch/arm/Kconfig                 |   1 +
 xen/arch/arm/cpuerrata.c             |   7 +-
 xen/arch/arm/include/asm/cpuerrata.h |   1 +
 xen/arch/arm/include/asm/mmu/mm.h    |   2 +
 xen/arch/arm/include/asm/suspend.h   |   2 +
 xen/arch/arm/mmu/smpboot.c           |   2 +-
 xen/arch/arm/suspend.c               | 156 +++++++++++++++++++++++++++
 xen/arch/arm/vpsci.c                 |  10 +-
 8 files changed, 177 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 9027aa17eb..da1585ec50 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -9,6 +9,7 @@ config ARM_64
 	select 64BIT
 	select HAS_DOMAIN_TYPE
 	select HAS_FAST_MULTIPLY
+	select HAS_SYSTEM_SUSPEND if !MPU && UNSUPPORTED
 	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
 
 config ARM
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 3a32183618..e6499aaab3 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -782,6 +782,11 @@ void check_local_cpu_errata(void)
     update_cpu_capabilities(arm_errata, "enabled workaround for");
 }
 
+int enable_local_cpu_errata_workarounds(void)
+{
+    return enable_nonboot_cpu_caps(arm_errata);
+}
+
 void __init enable_errata_workarounds(void)
 {
     enable_cpu_capabilities(arm_errata);
@@ -818,7 +823,7 @@ static int cpu_errata_callback(struct notifier_block *nfb,
          * fixed to expect an error at CPU_STARTING phase.
          */
         ASSERT(system_state != SYS_STATE_boot);
-        rc = enable_nonboot_cpu_caps(arm_errata);
+        rc = enable_local_cpu_errata_workarounds();
         break;
     default:
         break;
diff --git a/xen/arch/arm/include/asm/cpuerrata.h b/xen/arch/arm/include/asm/cpuerrata.h
index 1799a16d7e..b93521326f 100644
--- a/xen/arch/arm/include/asm/cpuerrata.h
+++ b/xen/arch/arm/include/asm/cpuerrata.h
@@ -5,6 +5,7 @@
 #include <asm/alternative.h>
 
 void check_local_cpu_errata(void);
+int enable_local_cpu_errata_workarounds(void);
 void enable_errata_workarounds(void);
 
 #define CHECK_WORKAROUND_HELPER(erratum, feature, arch)         \
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index 7f4d59137d..ee73a77777 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -110,6 +110,8 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 extern void switch_ttbr(uint64_t ttbr);
 extern void relocate_and_switch_ttbr(uint64_t ttbr);
 
+void set_init_ttbr(lpae_t *root);
+
 #endif /* __ARM_MMU_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index 50dc6e9fdf..889a6509d9 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -41,11 +41,13 @@ int prepare_resume_ctx(void);
 void hyp_resume(void);
 bool host_system_suspend_allowed(void);
 void host_system_suspend_disable(const char *reason);
+void host_system_suspend(struct domain *d);
 
 #else /* !CONFIG_SYSTEM_SUSPEND */
 
 static inline bool host_system_suspend_allowed(void) { return false; }
 static inline void host_system_suspend_disable(const char *reason) {}
+static inline void host_system_suspend(struct domain *d) {}
 
 #endif
 
diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index 37e91d72b7..ff508ecf40 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -72,7 +72,7 @@ static void clear_boot_pagetables(void)
     clear_table(boot_third);
 }
 
-static void set_init_ttbr(lpae_t *root)
+void set_init_ttbr(lpae_t *root)
 {
     /*
      * init_ttbr is part of the identity mapping which is read-only. So
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index c7c26bcf03..3fe2ffa4fb 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,10 +1,18 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <asm/cpuerrata.h>
+#include <asm/cpufeature.h>
+#include <asm/gic.h>
 #include <asm/psci.h>
 #include <asm/suspend.h>
 
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/iommu.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <xen/serial.h>
+#include <xen/tasklet.h>
 
 struct resume_cpu_context resume_cpu_context;
 
@@ -44,6 +52,154 @@ void host_system_suspend_disable(const char *reason)
            reason ? reason : "unsupported suspend/resume path");
 }
 
+/* Xen suspend. data identifies the domain that initiated suspend. */
+static void system_suspend(void *data)
+{
+    int status;
+    unsigned long flags;
+    struct domain *d = (struct domain *)data;
+
+    BUG_ON(system_state != SYS_STATE_active);
+
+    system_state = SYS_STATE_suspend;
+
+    printk("Xen suspending...\n");
+
+    freeze_domains();
+    scheduler_disable();
+
+    /*
+     * Non-boot CPUs have to be disabled on suspend and enabled on resume
+     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to PSCI
+     * CPU_OFF to be called by each non-boot CPU. Depending on the underlying
+     * platform capabilities, this may lead to the physical powering down of
+     * CPUs.
+     */
+    status = disable_nonboot_cpus();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_nonboot_cpus;
+    }
+
+    console_start_sync();
+    status = iommu_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_end_sync;
+    }
+
+    status = console_suspend();
+    if ( status )
+    {
+        dprintk(XENLOG_ERR, "Failed to suspend the console, err=%d\n", status);
+        system_state = SYS_STATE_resume;
+        goto resume_iommu;
+    }
+
+    local_irq_save(flags);
+
+    time_suspend();
+
+    status = gic_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_time;
+    }
+
+    set_init_ttbr(xen_pgtable);
+
+    /*
+     * Enable identity mapping before entering suspend to simplify
+     * the resume path
+     */
+    update_boot_mapping(true);
+
+    if ( prepare_resume_ctx() )
+    {
+        status = call_psci_system_suspend();
+        /*
+         * If suspend is finalized properly by above system suspend PSCI call,
+         * the code below in this 'if' branch will never execute. Execution
+         * will continue from hyp_resume which is the hypervisor's resume point.
+         * In hyp_resume CPU context will be restored and since link-register is
+         * restored as well, it will appear to return from prepare_resume_ctx.
+         * The difference in returning from prepare_resume_ctx on system suspend
+         * versus resume is in function's return value: on suspend, the return
+         * value is a non-zero value, on resume it is zero. That is why the
+         * control flow will not re-enter this 'if' branch on resume.
+         */
+        if ( status )
+            dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=%d\n",
+                    status);
+
+        system_state = SYS_STATE_resume;
+    }
+    else
+    {
+        system_state = SYS_STATE_resume;
+
+        /*
+         * CPU0 resumes directly from hyp_resume(), bypassing the CPU hotplug
+         * path that re-checks and re-enables errata workarounds for secondary
+         * CPUs.
+         */
+        check_local_cpu_errata();
+        check_local_cpu_features();
+        BUG_ON(enable_local_cpu_errata_workarounds());
+    }
+
+    update_boot_mapping(false);
+
+    gic_resume();
+
+ resume_time:
+    time_resume();
+
+    local_irq_restore(flags);
+
+    console_resume();
+
+ resume_iommu:
+    iommu_resume();
+
+ resume_end_sync:
+    console_end_sync();
+
+ resume_nonboot_cpus:
+    /*
+     * The rcu_barrier() has to be added to ensure that the per cpu area is
+     * freed before a non-boot CPU tries to initialize it (_free_percpu_area()
+     * has to be called before the init_percpu_area()). This scenario occurs
+     * when non-boot CPUs are hot-unplugged on suspend and hotplugged on resume.
+     */
+    rcu_barrier();
+    enable_nonboot_cpus();
+
+    scheduler_enable();
+    thaw_domains();
+
+    system_state = SYS_STATE_active;
+
+    printk("Resume (status %d)\n", status);
+
+    domain_resume(d);
+}
+
+static DECLARE_TASKLET(system_suspend_tasklet, system_suspend, NULL);
+
+void host_system_suspend(struct domain *d)
+{
+    system_suspend_tasklet.data = (void *)d;
+    /*
+     * The suspend procedure has to be finalized by the pCPU#0 (non-boot pCPUs
+     * will be disabled during the suspend).
+     */
+    tasklet_schedule_on_cpu(&system_suspend_tasklet, 0);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index a41355d75d..5134e75c24 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -237,7 +237,8 @@ static bool domain_in_suspend_state(struct domain *d)
     return suspended;
 }
 
-static int32_t domain_psci_system_suspend_policy(struct domain *d)
+static int32_t domain_psci_system_suspend_policy(struct domain *d,
+                                                 bool *host_suspend)
 {
     struct domain *other;
     bool last_awake_control_domain = true;
@@ -300,6 +301,7 @@ static int32_t domain_psci_system_suspend_policy(struct domain *d)
     if ( !host_system_suspend_allowed() )
         return PSCI_DENIED;
 
+    *host_suspend = true;
     return 0;
 }
 
@@ -310,6 +312,7 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     struct vcpu *v;
     struct domain *d = current->domain;
     bool is_thumb = epoint & 1;
+    bool host_suspend = false;
     struct resume_info *rctx = &d->arch.resume_ctx;
 
     /* THUMB set is not allowed with 64-bit domain */
@@ -334,7 +337,7 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
 
     spin_lock(&vpsci_system_suspend_lock);
 
-    rc = domain_psci_system_suspend_policy(d);
+    rc = domain_psci_system_suspend_policy(d, &host_suspend);
     if ( !rc )
     {
         rc = domain_shutdown(d, SHUTDOWN_suspend);
@@ -359,6 +362,9 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
             "SYSTEM_SUSPEND requested, epoint=%#"PRIregister", cid=%#"PRIregister"\n",
             epoint, cid);
 
+    if ( host_suspend )
+        host_system_suspend(d);
+
     return rc;
 }
 
-- 
2.43.0


