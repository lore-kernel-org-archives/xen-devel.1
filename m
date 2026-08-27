Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A73C61DD6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 14:32:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400673.1636223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9W-0004YA-MY; Thu, 27 Aug 2026 14:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400673.1636223; Thu, 27 Aug 2026 14:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9W-0004Y1-Jt; Thu, 27 Aug 2026 14:32:26 +0000
Received: by outflank-mailman (input) for mailman id 1400673;
 Thu, 27 Aug 2026 14:32:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wzb9V-0004Xi-Ch
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 14:32:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzb9U-00Bhds-3O
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:32:24 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a76-2eae-0a2a0a5409dd-0a2a450a9b26-6
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:24 +0200
Received: from [52.101.83.141]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a77-f2d2-0a2a450a0019-3465538d5b1d-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:23 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by GVXPR03MB10457.eurprd03.prod.outlook.com (2603:10a6:150:156::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:32:15 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:32:15 +0000
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
 b=M8x4jbEcwSwnlHSPoWLppWVHJTFNf09GDFKfjf3zWy+m3eBhKt7t3TJgoiF6/QBI555Be2x9DdQq0zohiW/RosdY1d+629+768eTmS/zRpXV3pXFXbyz7IRZgFrY/k75zy0SnBss+oWoDpCxGtHF9RhZyTTvRdvvdKaVn6F066KJCe+OeMBKX79tRkOl6AzeQ0Uf9fww+8p3RLE+povaAXd4d8K8LJYhZaZVeBt2Kekt1k9EOHq7wVOX7E0wBu4Oi2wHveaH707o7pigh6bwg6t1hywjA+jX8s9gWmGNWukSgYMLU0dwDlDjZa2V8XyVHTXPjs32GW4AQPz2knEXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cn8AOFfHK66mM6rV8XQzylPhaIZpE6GKNfQnG9WiURk=;
 b=rOQN75tCS3CaM2Fuscpr8Xo+VAYWpuBCozd+q9BCIsbVNM9rarjcxutlCqlmPo2GVy+IM6tAEEkdZe5hlEN1WP1lPlOLDH035gWqLVFNYqGfUXOjTfrg1e0AIXjBRcwFp2HG25hw34L+slGOcEG/2ydF9LhUgLrOzIgXn7dLixn1+XO2jR2DYnjA6Fea0PoaoTiumVyyHGo53ViGNqgAfzy7ARTlF0EFN+1u2lN/QPkni9TIySmoNvsfzn5xMFfJdoZuZgwm3oqVHsHEZmIXd/Yncanlejglmxk1fdRY7BjGNFY+XYwYF5FpC2wcVcRJ71wFL9CbLbephwXWKRIhkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cn8AOFfHK66mM6rV8XQzylPhaIZpE6GKNfQnG9WiURk=;
 b=MlAJK7xZArdaW6PyDbuM0owluH3adN/KDxX8gw8rptL4p2BfgGapcj9MZBFSfwTdmL7iYkJlxNzV2eQRu3NGaRSaLHD8Fo9wA/nh1PQNE1dLoVVYzZpGV7hMdI7xibyEp4lyGGX27oQMrT1oiNG9dqD5wXazbrPKEJNbsIa2pf5d29FWG+v3SJnYUTUgOGv4aSf0gicIQjtr1BVz8QEfry5eEazYqgV/sL8IVacORAX4wOXB0RIxs/Lu4PnwnXgq5nloPKr43AnRdDnMuEMhWWhLWCs02xgSFMPHprrBDd5rg2HFn7006vmPHcCzioJOOEnbuUuAaODzHfqMuC3SRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jens Wiklander <jenswi@kernel.org>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [PATCH v12 00/13] Add initial Xen Suspend-to-RAM support on ARM64
Date: Thu, 27 Aug 2026 17:31:48 +0300
Message-ID: <cover.1787838455.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0018.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::15) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|GVXPR03MB10457:EE_
X-MS-Office365-Filtering-Correlation-Id: 7872f4e1-ce2b-4874-edca-08df0447fd81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10067099003|6133799003|18002099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	JjqyA7GcF4rDhPOIdjUNTKlKgXZnJ4RaivGu/wmN+KOYUS0XIFJJ6v+Jx0FHl0t2vSmwWQzOLf6qQshHhhtVAtw+OZBczVjXbDbOeC6MX+M/pKYqfX7l1VBkFn5Y8Zqzv60MTlicKBxxzys/FhA+so+0WSK+c1JAjem4w8MTZfUAp31mMINxl4OdAghNFJ36cArG+fWE+7UsuDwvImXzZjp4DM+2ZHYS4DwbP4Yzwcn4XKJ4tfIf9aT1qifI5Ri2BAkwJVGLayiyjCJ1hXWd6UMKRbhCoXWFrgDmU/sF3yIQ9PsEDPIb761nRbuDiI6wORdqhMTqZ0jMwaYPykI/KgnE90EkINGqaiJi5Aeisx5CeGTSG6lKMLBeTJbTCbjw5VE3rsSqnEri1xld7QE2jC5Y7zIAhfaPshawZeE3BOv4Ynino1NNk0sPGsBpSA/INdT8Yd7gROU3Y71s8CGm/g+8JCJLh+d7T7dX4ZvdzdHAG01XLXqCvl41FY8o+etE+l/fm1WInw2kDIuAKRSZpRElvky+SjUfEHB6JJDUvLV0TrYstfiXagXM0AzU0sF4NFcXSOF5cfOcFHGebqPmZJF7KvdKlprfr6xfqftI7h1tUvpn3m95NB8wDbD+p8bOyuP8WkjeRiTFzGHmrVwv3cTZJi5G0ppjnJ56juqB7/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10067099003)(6133799003)(18002099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7q4yR93iPu1g3IY+DrBCgOwgCfZzw7Nd/EuLc2vjde8p2xN+Jc4r/mENMJVQ?=
 =?us-ascii?Q?ggx2mPbJH5kn6OZhUM4B8kumTG1sSWBNq6FpSRnucKodINIZ8QB61Zr1zUXn?=
 =?us-ascii?Q?1EuB/ncFrP2fbTazdYAuOBZ5+PuPwVVOlWcxBImWPoYdtjj/DAzj1IA93Y+A?=
 =?us-ascii?Q?fq0iNaySi20SI0mmorG2pHMeoSNP1t2E9DG6riw65HsT8mmWOfZg6HQERY9e?=
 =?us-ascii?Q?wuEEri556YS9tneAh7YHIwczFPBuURe2EJbp6DjsIVCEvlWvJJvfgUr4D5IR?=
 =?us-ascii?Q?qc8DuDe4XabXh/KJjUPsuall+HEaql1toWTb1AC+YqfHZVqJnBv0CX1O+Qnp?=
 =?us-ascii?Q?i+YnFuxe4oupn5HayhrRq7zrXYwXvRoUb4kriTZMVaUfmVcMm/+/pNfBNI1k?=
 =?us-ascii?Q?Er33zSNzDYusWBXOs9nFyzc9mJ9hd9xk0Bc1qnuU0MiqXEh9K394kXf9N0B0?=
 =?us-ascii?Q?EpiHjuDdTTvxzWVdrQ/mo0PqEuH5vo31Ggj4Pvp520BZpNwHKXbWjm+Qb0op?=
 =?us-ascii?Q?tmya0NLG2D/BkHcrt5JfOZPNJnlVwyTxh5IZkKL1QyaPhYbUZmhpr/23HUsI?=
 =?us-ascii?Q?rGdbfV4dInWexu7xYgJLYrZppW/Vr38egGNGuVjmc6jrRBqI3wSJYEzdlI5a?=
 =?us-ascii?Q?dMI0EaTCDFjD/HH0nvVGGBVYuJUmYUBD+aH8wC1HI+95L8tq0Mg3VccAzoIc?=
 =?us-ascii?Q?ry/F6z3IHUwqVSQS6Ad63HnShsDRAwUii7Rvu1mDuHA4xbHR1e3bQ1sYVll+?=
 =?us-ascii?Q?Yw4gX9eYL/AfDN/r/eYKlgj+8n7PYddJfmKk7+OzuTX9z8AuXrWLquyGGcKJ?=
 =?us-ascii?Q?t/Xpxu0Pm/vGtUIqqRe1ztrmfBvqmz4vZwhsNPXVB7gd5L0jw4z5BLqFc0+P?=
 =?us-ascii?Q?/nBDpHPhQ8CvxfG6FP0OEGCTCfr0d/JBK1oVXYqLG5hctbXuR3NUmL6veEmR?=
 =?us-ascii?Q?MYV6ML+CMknDdO86l6mMGFDhZ/g47rAT2o0T4zoxyR4ZvfyUb4fvoIlULc3P?=
 =?us-ascii?Q?p6PFZgH+W+BJ5H2AqJJNghNU+GjL+qEj4tX5mXcAbo37UHFfAKtBXIqxi99d?=
 =?us-ascii?Q?8QciU5y5knmn0UVwUvbTAElRxgreYeaqRD8yiyW1bqeCPD+NKnuz+6CuDd4f?=
 =?us-ascii?Q?dv0iDrMcUeAxkAyHJBygGqh8DT7b3ga04f1wk2+H8u8WarpE5TX5W3Xtz3bV?=
 =?us-ascii?Q?a1R14dNSrUHFsnCwxao8SZ0nhaPJeWqOC67UGU9r5FOZUUZhtF8Tz/ZKTKGx?=
 =?us-ascii?Q?o5/jL3xo+Pxm/hFlOwok61bWMFxZ6zapXmfmjiOPusUEjqA8cZK8e92UzW8e?=
 =?us-ascii?Q?5m12Mc1GvMYG9lpNAppd3sTlLOPWbXhumCmW/vqU7yUcfq6ckOEwk1bsvEWl?=
 =?us-ascii?Q?IhTwfRE/0VZnIvrYbkuY6mzKKjAw+zB197fkFPsNQ4ZzCfyHtopzU/0hP41C?=
 =?us-ascii?Q?QkCgBH5OsZkAF0fItBqHvDD2O9aAqBaJiyiYxsiBU8be8x4kbJYd0SYdxfw7?=
 =?us-ascii?Q?SWAiEkimISiQjj5Nw1xQ80NOGSp4F2EM7/gQHSZu5dN0inf6uzxxYHp4QZey?=
 =?us-ascii?Q?xVPzwxnU6UUKqCn8ZqdM6cT65lwrWk+lJ+TQRY4uU0yIwsuAX6v3LuoLBwZG?=
 =?us-ascii?Q?dMHTW0SJlYjipfRuwROyFhCd3A/dyEHYmbiQVBTOnsu2lenhcMXtkD/7fqzI?=
 =?us-ascii?Q?6kRAtrZVmo/I7Y9gh/kz3dbNrJ9NmiC/66aXvx9sCHtUn++jowpB/yT5CHte?=
 =?us-ascii?Q?+KbVovBwzQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7872f4e1-ce2b-4874-edca-08df0447fd81
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:32:15.3956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Kq0f0SK8EhNbSbbnC/NuppVtciaallDFtWSQ2Jf4FnffdqJfPb58x6ITsBkwjTH2YNEC7031SdtcG90Hhrzhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB10457
X-purgate-ID: tlsNG-4011c0/1787841144-504CFCFC-1854883D/0/0
X-purgate-type: clean
X-purgate-size: 8777

This is part 2 of the ARM Xen system suspend/resume patch series, based
on earlier work by Mirela Simonovic and Mykyta Poturai.

Part 1, covering guest suspend functionality, is already in mainline.

NOTE: Host-wide suspend/resume support is guarded by CONFIG_SYSTEM_SUSPEND,
which can currently only be selected when UNSUPPORTED is set, and thus the
host suspend backend is neither enabled by default nor built in supported
configurations. The separate HAS_HWDOM_SYSTEM_SUSPEND policy bit only changes
how ARM treats SHUTDOWN_suspend from the hardware domain; it does not enable
the host-wide suspend backend by itself.

This version is ported to Xen master and includes extensive improvements
based on reviewer feedback. The patch series restructures code to improve
robustness and maintainability, and implements initial ARM64 host-wide
Suspend-to-RAM support driven by control-domain PSCI SYSTEM_SUSPEND
requests. vPSCI also exposes SYSTEM_SUSPEND as a domain suspend operation
for all domains; attempt-time host-suspend policy failures are reported as
PSCI_DENIED rather than hidden through PSCI_FEATURES.

Key updates in this series:
 - Introduced architecture-specific suspend/resume infrastructure
 - Integrated GICv2/GICv3 suspend and resume, including memory-backed context
   save/restore with error handling
 - Added time and IRQ suspend/resume hooks, ensuring correct timer/interrupt
   state across suspend cycles
 - Implemented proper PSCI SYSTEM_SUSPEND invocation and version checks
 - Added vPSCI SYSTEM_SUSPEND policy for domain suspend and host-wide
   control-domain sequencing
 - Improved state management and recovery in error cases during suspend/resume
 - Added support for IPMMU-VMSA/SMMUv3 context save/restore
 - Added support for GICv3 eSPI registers context save/restore
 - Added support for ITS registers context save/restore
---

Link to CI: https://gitlab.com/xen-project/people/mykola_kvach/xen/-/pipelines/2796733872
---

TODOs:
 - Enable "xl suspend" support on ARM
 - Add suspend/resume CI test for ARM (QEMU if feasible)
 - PCI suspend ?
---

Detailed changelogs can be found in each patch.

Changes in v12:
- Rebase onto the latest master.
- Updated patch 12; all other patches are unchanged.
  No functional changes.

Changes in v11:
- Keep SMMUv3 reset helpers in init text when CONFIG_SYSTEM_SUSPEND is
  disabled.
- Update host suspend policy blockers after review: make the runtime gate
  __ro_after_init, log the SMMUv3 MSI blocker only once, and wrap the Arm
  IOMMU blocker in CONFIG_SYSTEM_SUSPEND.

Changes in v10:
- Clarify the vPSCI SYSTEM_SUSPEND policy summary: keep SYSTEM_SUSPEND
  advertised once implemented and return PSCI_DENIED, rather than
  PSCI_NOT_SUPPORTED, for attempt-time host-suspend policy failures.
- Tighten GICv2/GICv3 suspend/resume based on review feedback: avoid
  reserved interrupt register ranges, check visible active-priority state,
  restore configuration before enable state, and re-enable the redistributor
  before restoring CPU/virtual interface state on abort paths.
- Refine ITS resume so MAPC is replayed only for ITS-backed collections and
  clarify the collection-ID assumptions.
- Rework IPMMU and SMMUv3 resume/suspend handling, including root-before-cache
  IPMMU restore ordering and disabling SMMU interrupt generation before
  suspend.
- Save and restore CNTHCTL_EL2 in the arm64 CPU resume context and simplify
  the resume trampoline/context hand-off.
- Re-apply boot CPU errata/workaround handling after SYSTEM_SUSPEND and move
  set_init_ttbr() declaration to asm/mmu/mm.h.
- Update patch 12 details: shorten SYSTEM_SUSPEND blocker logs, use %pd for
  control-domain logging, mark serial_suspend_available as __ro_after_init,
  and mention the xen/suspend.h struct domain forward declaration.

Changes in v9:
- Split the control-domain SYSTEM_SUSPEND flow so host availability,
  runtime blockers and domain-readiness checks are handled separately from
  the host suspend backend.
- Gate vPSCI SYSTEM_SUSPEND on cached host PSCI support and Xen runtime
  suspend blockers, and log firmware support during initialization.
- Fold the arm64 resume trampoline into the CPU context save/restore patch
  and use asm-offsets-generated RESUME_CTX_* definitions for the assembly
  save/restore path.
- Tighten the GICv2/GICv3/ITS/IPMMU/SMMUv3 suspend/resume paths based on
  review feedback, including state-save/restore fixes and safer failure
  handling.
- Reorder the host suspend/resume phases so timer and GIC state are
  handled with local IRQs disabled and restored before console/IOMMU
  resume.

Changes in v8:
- Rebased to latest master and refreshed the series accordingly.
- Added a new GICv3 patch to tolerate retained redistributor LPI state
  across CPU_OFF/CPU_ON.
- GICv2 suspend now disables the CPU interface and distributor before
  saving state.
- GICv3 suspend/resume fixes the redistributor base used for LPI state.
- ITS and SMMUv3 suspend/resume paths were tightened, with safer
  restore/rollback handling and stricter fatal-error handling.
- System suspend now checks that all domains are already in
  SHUTDOWN_suspend before proceeding, and renames the hardware-domain
  suspend capability/helper for clearer semantics.
- Fixed alignment/cleanup issues in the low-level suspend/resume code.

Changes in v7:
- Timer helper renamed/clarified; virtual/hyper/phys handling documented.
- GICv2 uses one context block; restore saved CTLR; panic on alloc failure.
- GICv3/eSPI/ITS always suspend/resume; restore LPI/eSPI; rdist timeout.
- IPMMU suspend context allocated before PCI setup.
- System suspend: control domain drives host suspend.
- Dropped v6 IRQ descriptor restore patches; use setup_irq and re-register
  local IRQs on resume instead.

For earlier changelogs, please refer to the previous cover letters.

Mirela Simonovic (5):
  xen/arm: Add suspend and resume timer helpers
  xen/arm: gic-v2: Implement GIC suspend/resume functions
  xen/arm64: Save/restore CPU context across SYSTEM_SUSPEND
  xen/arm: Implement PSCI SYSTEM_SUSPEND call (host interface)
  xen/arm: Add host system suspend backend

Mykola Kvach (7):
  xen/arm: gic-v3: tolerate retained redistributor LPI state across
    CPU_OFF
  xen/arm: gic-v3: Implement GICv3 suspend/resume functions
  xen/arm: gic-v3: add ITS suspend/resume support
  xen/arm: tee: keep init_tee_secondary() for hotplug and resume
  xen/arm: ffa: fix notification SRI across CPU hotplug/suspend
  xen/arm: smmu-v3: add suspend/resume handlers
  xen/arm: Add vPSCI SYSTEM_SUSPEND policy

Oleksandr Tyshchenko (1):
  iommu/ipmmu-vmsa: Implement suspend/resume callbacks

 xen/arch/arm/Kconfig                     |   2 +
 xen/arch/arm/Makefile                    |   1 +
 xen/arch/arm/arm64/asm-offsets.c         |  21 +
 xen/arch/arm/arm64/head.S                | 122 ++++++
 xen/arch/arm/cpuerrata.c                 |   7 +-
 xen/arch/arm/gic-v2.c                    | 226 +++++++++++
 xen/arch/arm/gic-v3-its.c                | 146 ++++++-
 xen/arch/arm/gic-v3-lpi.c                |  80 +++-
 xen/arch/arm/gic-v3.c                    | 482 ++++++++++++++++++++++-
 xen/arch/arm/gic.c                       |  35 ++
 xen/arch/arm/include/asm/arm64/sysregs.h |   5 +
 xen/arch/arm/include/asm/cpuerrata.h     |   1 +
 xen/arch/arm/include/asm/gic.h           |  16 +
 xen/arch/arm/include/asm/gic_v3_defs.h   |   3 +
 xen/arch/arm/include/asm/gic_v3_its.h    |  28 ++
 xen/arch/arm/include/asm/mmu/mm.h        |   2 +
 xen/arch/arm/include/asm/psci.h          |   4 +
 xen/arch/arm/include/asm/suspend.h       |  37 ++
 xen/arch/arm/include/asm/time.h          |   5 +
 xen/arch/arm/mmu/smpboot.c               |   2 +-
 xen/arch/arm/psci.c                      |  38 +-
 xen/arch/arm/suspend.c                   | 210 ++++++++++
 xen/arch/arm/tee/ffa_notif.c             |  63 ++-
 xen/arch/arm/tee/tee.c                   |   2 +-
 xen/arch/arm/time.c                      |  44 ++-
 xen/arch/arm/vpsci.c                     | 120 +++++-
 xen/common/Kconfig                       |   3 +
 xen/common/domain.c                      |   7 +-
 xen/drivers/char/serial.c                |  12 +
 xen/drivers/passthrough/arm/iommu.c      |   6 +
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 323 ++++++++++++++-
 xen/drivers/passthrough/arm/smmu-v3.c    | 203 ++++++++--
 xen/include/xen/list.h                   |  14 +
 xen/include/xen/serial.h                 |   1 +
 xen/include/xen/suspend.h                |   2 +
 35 files changed, 2169 insertions(+), 104 deletions(-)
 create mode 100644 xen/arch/arm/suspend.c

-- 
2.43.0


