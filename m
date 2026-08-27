Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7578AC61DD4
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 14:32:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400686.1636315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9i-0006so-7s; Thu, 27 Aug 2026 14:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400686.1636315; Thu, 27 Aug 2026 14:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9i-0006sT-2d; Thu, 27 Aug 2026 14:32:38 +0000
Received: by outflank-mailman (input) for mailman id 1400686;
 Thu, 27 Aug 2026 14:32:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wzb9g-0006WR-Cb
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 14:32:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzb9f-009cRM-Oy
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:32:35 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a6a-bab6-0a2a0a5309dd-0a2a450890e0-28
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:35 +0200
Received: from [52.101.66.112]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a83-f659-0a2a45080019-346542705d55-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:35 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB6742.eurprd03.prod.outlook.com (2603:10a6:20b:295::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:32:34 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:32:34 +0000
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
 b=uKUbVAsI+pp+cJw1KRRY8rZ2r83cgsgJF7tlNRgtdaWp0MLqquLc24lF89eKfjz49HJsuHHiFc1ODDz7+sfnt+40EWK6fLYUD1Zw2XMo6VPhIKE8++O0wkVrH07F3zew7ClY2HW6AbfTOmxma3VW5aSvGRsqLJR/nqlDfUwi0rWm1ISAy6ENknr/Y9sItAEYokTQHtlqV7gUc4FR943J7sYzGB/ds8uBKNMSUfgTHLWa30vu0DJcwsN5uPEEYTLvFhAgdAn91MIOuIPFW5wMXpfkNht5qLgiDr5yzU9OZA0BCbDigUjwzIrCboxkv3eiE6voGC2H8QBADaE7xAjEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30Z8gX2uWqFKyBD7HEL7wO9Upezxb+zNkuX2zZMH2DA=;
 b=gL24C46MH4r/mupIAM9etesSQMCZxKKBOOVqG2W33/6cKAq+BdvcOdXh/tzPxl+3He9WWLRh8n2FnD7jGmV2tcIlBkHfKe0pibhCG5ZA3SbBI2EhpHRNfj1Od9Lcs8JkwkALrcleHB97jSTxdBQ+OUlRaH4ALfst/tB51AzYDyBVoLqNtjI9fxHxVXZxaOYwlCK7kug/dXGnMm1X0WKdfTqFPp71XTSnusodvuD0uihmwS2JJ1Odr+aak6a/YFoTWCiWpl+Lm9MtSrW4tFYDFeemRWGe/R9Vg0WE+TxN+Z7PMRR70FeTnUAvPBxPSFB6oE46Qb1BHyIMTZsyDkH5hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30Z8gX2uWqFKyBD7HEL7wO9Upezxb+zNkuX2zZMH2DA=;
 b=BnGaKST6rSyr4zRO+ZTF1+9TYAgntnNt4x5DVmi46ApACstkoIZ/dIfyU5/p5mknJosUVPxmGiiOH7ziTUAKj22DDTPYDuettpHjv+ibw5pGm6ikWbjmJes8x2dY0N8Apb5oMelc8iCZKn0tsKFekr/wRtBZVj/zUltfVluFes77qYCqhqmDtyuPOE2fgjxTVQlJ5HydT1QY/eJo8OFHC/fUaD6fyezSipkG6uXDm26F/tzNtgvX55TyB8NwPHUZ3foydsO0RicAkkID9+f9p3Vji2IW7g6DBav2uOTks+4j1Hc2LFD9hc0z3PSq/UcRxZBzds3pdEv0N/XQNeL2Vg==
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
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v12 10/13] xen/arm64: Save/restore CPU context across SYSTEM_SUSPEND
Date: Thu, 27 Aug 2026 17:31:58 +0300
Message-ID: <552b979775f1f67d49f7ac303c1a1d4feafe820a.1787838455.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: d9f1c2b0-7552-4783-e711-08df044808a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|22082099003|18002099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	OzzraU+pu513h3OJK3TCYl6uGvH28dwysVxBegrvJeUhICR6zUL7Zwduudm6n1+7Krvfht+Lx6TGwWoIm2c5dS2yOGICMNvDxMMMmuN7txYpDUc5/jzUkZ+1dWJIuqC1OzTiwqvHU+hXbGpcBP+EUQElIF0fm14H7R+zywSqsaM0Xtm5feSSCtqYaQvf6ViniInECWPwBbZL6eYjMUulELzAbbKzuJ+pxPIJ1yNIb0jCnEIZNMBl3RfO5zwWdUwmtnQQT/JINa7BF5/FKD6U3hOCS5WivZgusU2/sLPz/fmUKRKYFw9krtjMbg1I+lyEFE6ymz6y3qFdgeHiDr/ooNO0m+0TpdgBAkaPVWPB65X2bq/kpGNbPZXatcd5DqIFD4vTfjFqJPycGgO6yzOdoNDwEJ0X1+XWitj+PyqVeVsiG4rUQlpA3TuUa+KA4ynmWzucl6LQ2Q6L1CzYxVeaswhjJQCdqHBAqnWXX8SeYhkGE/xOj/3UotAs5rxL3n44R0HKkrYeD8hzMniW4d9LMPada4a+RDrY9FW4qVAKi3/O0lVqSE6kiLO3CraxvRxCPR9xB5k3+239CdCGyFuVMjTxfupmF+5ZtDgGkWIkmw2vZoHBUyldqq0ZXdo/IIP003SqODPigtvgeD8qrxxCXUJ/l2qIj7Y9LEJcT/BrlRg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MVc8I/MStLmJHVjur218Y9e+vyrND97K61245kob7TNWcOidkqV/wsDMDEZr?=
 =?us-ascii?Q?VJvTAIDQHjB+kFsTDluffGcOvqjNY5uokeyGxDoRgsOY70OZAYifpXHekg8j?=
 =?us-ascii?Q?UO6O7/7ZlLq4Onh9Ts5xKVTpFSxNYkA+/GmoRU59iwcZzm01MaYa/VC2Qllg?=
 =?us-ascii?Q?s3+Nx6CPPoQ6qeK+y44NCpGurYJ3pM6aTIqn/55MbuM6ThjxhaYxVyYkvmyj?=
 =?us-ascii?Q?wna4EbyyMTYUZ+S2MnUQJVYwYHN9XMu44NXFnAJYT9ms9qhdye4BqTdbpyZD?=
 =?us-ascii?Q?FIePXB/+eHrdQcthrirG4NPP8BFCPfCP+5rsh+RZRWfknHXbCwwLmcKcrqqf?=
 =?us-ascii?Q?yvmvhdx0aim1o6mfPJmnJrm4HX+wJlu+Cz7J88rWnxNZ6QCO3LABPKWpzV1h?=
 =?us-ascii?Q?v38oOH96Oui3N6RTwurtAHOgIkFf4LbB+K3xK7YLHzfLD/9XkLXOvqj8B/kG?=
 =?us-ascii?Q?ejByB3QT+/5alwQ3ZrrZO0GAyWPxmQ04iUWyBIthIkdrKADlt5lUC3ZQJv8N?=
 =?us-ascii?Q?O7mjn83AE0Cnc5Ffd8inbB+aXaPX4psEk44Sro3giFaea1OQTKMOKNAj0Q5T?=
 =?us-ascii?Q?u+GJMDQutUnXGzVJGppp0WIH+P7RrVrb+9XsV0rfdezL96nYjHPFAgCplZoF?=
 =?us-ascii?Q?yz5JTlhhlZ1rf4ye5/EBZMJUIwLZQfQPuizsCTAKR6oH7fTwg24xKG3L2WET?=
 =?us-ascii?Q?+Sw0fG5NpD23GxDlz26pq6ROZYfCj+4J1E/VFmsUDA6k4Rkn/gX7PGqx5gJq?=
 =?us-ascii?Q?9cxdFH2JdLS96WbEuO9N6D0FRoGrw3D/kfWC3V71FyAtQVdIr5AWHe3eLE6p?=
 =?us-ascii?Q?vcIc6qxfNUIunlyZNbtdh2LMYXyKK6InJw1mbShCiyPzMjRwlORwzR+lspYj?=
 =?us-ascii?Q?Nm9IKyqBJfv5mjPTf2wSKN2gj8de0SeXfA+lnwVf4WTxrwtr4836KwTLeqKf?=
 =?us-ascii?Q?9wyrtV23zz8P7N3KmZmCe09jdr57qre9UrA4/xCRiEawjR4BHsR+vvj/xtUN?=
 =?us-ascii?Q?uuiepU5eQ7rMQmFW+L6P6bTDFgjGaHoWKyxqd/avIC0eo5BQ26Num+SP0fK5?=
 =?us-ascii?Q?SSCSVskv6BCUrQEFompzBmUa2CYIkAMxDfMAZ9gY07+miUFKMEHPMaPdUQYN?=
 =?us-ascii?Q?gaOc/OMXad3e9LeOIiJlTTUJ5NCaoDn86xrMxe2RMbw0VFMtPpW65G+aOF2J?=
 =?us-ascii?Q?ufRK+g/n1Zm9x6u2ItYRSUbdBVkdkxvFaT6P215dnfx/vT+wRJJiS9xT1QCO?=
 =?us-ascii?Q?2DCnkNjIBjqq8TGcYaUPiM68dLwd5KAeU0KImlYu/TiYepp6rDiTPmuBpQ0n?=
 =?us-ascii?Q?k2HL6bWkxw9yUFLpJi8zoMqrYmitA+XiT4WiOcssESooU4SNXGNnfK20QuQ5?=
 =?us-ascii?Q?x1TlhhwqNNVKBk/Aj35PiYOx9Uth0FoFMeFrtpfsruM6+1QId4O9Q2nA5JDG?=
 =?us-ascii?Q?dmbKrUTkwyzBhSNQuaoovenfCwbLYICsRbdA/YRtTwobbcAQqWeKjbSD5Ae5?=
 =?us-ascii?Q?RLJ2iH5o3n7nOBteWWASluw/DkTHzM/OR+3mg2pvbwtwWNRnfvbPScDGU1ft?=
 =?us-ascii?Q?9Lp0tF8dx02HIy6YOXxhf/b/R7Ewejdxw4uxPaC2MJw+Wp1l/XWXo4pMGLZQ?=
 =?us-ascii?Q?9ElPh1Kh4b4OImVctYKVKiP78RpPRI+V5Qmu3BfyshFZEtXoYuBn3EypUXsw?=
 =?us-ascii?Q?Pp7ilyz6fha5GA0RakVOAqA29Sk/GgnkN6GhCGiWA4EY1iwdCc9gSZbn1oum?=
 =?us-ascii?Q?e/iZCqg+oA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f1c2b0-7552-4783-e711-08df044808a6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:32:34.0371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bhOObLyN9e8artsc02k44fY7FXzkq4GYjDSYOrAx1pJzDlKrNrxCkfVKtPGrXr/jsHIkgDztZ9TklPhkE5roQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6742
X-purgate-ID: tlsNG-c1860d/1787841155-D775B87B-B93F3847/0/0
X-purgate-type: clean
X-purgate-size: 11487

From: Mirela Simonovic <mirela.simonovic@aggios.com>

On wakeup from PSCI SYSTEM_SUSPEND, Xen re-enters EL2 with the MMU and
data cache disabled. The resume path must first switch back to Xen's
runtime page tables before it can access the saved CPU context using
virtual addresses.

Add an arm64 hyp_resume trampoline that reuses enable_secondary_cpu_mm()
to enable the data cache and MMU, switch to init_ttbr, and resume in the
runtime virtual mapping. The trampoline then restores the saved CPU
general-purpose and system-control register context.

prepare_resume_ctx() must be invoked just before the PSCI system suspend
call is issued to the platform firmware. It saves the current CPU context
and returns a non-zero value so that the caller enters the physical
SYSTEM_SUSPEND call.

On resume, hyp_resume restores the saved context, including the saved link
register. Control therefore returns to the place where prepare_resume_ctx()
was called. To avoid re-entering the suspend path, the restored path sees
prepare_resume_ctx() return zero.

The assembly save/restore code uses offsets generated by asm-offsets.c
from struct resume_cpu_context, keeping the assembly memory accesses in
sync with the C structure layout.

Support for ARM32 is not implemented. Instead, compilation fails with a
build-time error if suspend is enabled for ARM32.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v10:
- Save and restore CNTHCTL_EL2 across SYSTEM_SUSPEND

Changes in v9:
- Drop the misleading prepare_resume_ctx() pointer argument and make both
  save/restore paths use the global resume_cpu_context.
- Squash the arm64 resume trampoline into the context save/restore patch.
- Document in code that hyp_resume relies on PSCI initial-state rules.
- Use generic platform firmware wording instead of ATF-specific wording.
- Rename the saved context type/storage to resume_cpu_context and rely on
  implicit zero-initialization for the file-scope object.
- Use asm-offsets.c-generated RESUME_CTX_* offsets to keep the assembly
  save/restore code in sync with struct resume_cpu_context.

Changes in v8:
- Fix alignments in code.

Changes in v7:
- No functional changes, just moved commit.
---
 xen/arch/arm/Makefile              |   1 +
 xen/arch/arm/arm64/asm-offsets.c   |  21 +++++
 xen/arch/arm/arm64/head.S          | 122 +++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/suspend.h |  27 +++++++
 xen/arch/arm/suspend.c             |  14 ++++
 5 files changed, 185 insertions(+)
 create mode 100644 xen/arch/arm/suspend.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index b7afd3e58c..788db83ba9 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,6 +51,7 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
+obj-$(CONFIG_SYSTEM_SUSPEND) += suspend.o
 obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps.o
diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
index 38a3894a3b..5d60406e9c 100644
--- a/xen/arch/arm/arm64/asm-offsets.c
+++ b/xen/arch/arm/arm64/asm-offsets.c
@@ -13,6 +13,7 @@
 #include <asm/mm.h>
 #include <asm/setup.h>
 #include <asm/smccc.h>
+#include <asm/suspend.h>
 
 #define DEFINE(_sym, _val)                                                 \
     asm volatile ( "\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\""\
@@ -57,6 +58,26 @@ void __dummy__(void)
    OFFSET(INITINFO_stack, struct init_info, stack);
    BLANK();
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+   OFFSET(RESUME_CTX_X19, struct resume_cpu_context, callee_regs[0]);
+   OFFSET(RESUME_CTX_X21, struct resume_cpu_context, callee_regs[2]);
+   OFFSET(RESUME_CTX_X23, struct resume_cpu_context, callee_regs[4]);
+   OFFSET(RESUME_CTX_X25, struct resume_cpu_context, callee_regs[6]);
+   OFFSET(RESUME_CTX_X27, struct resume_cpu_context, callee_regs[8]);
+   OFFSET(RESUME_CTX_X29, struct resume_cpu_context, callee_regs[10]);
+   OFFSET(RESUME_CTX_SP, struct resume_cpu_context, sp);
+   OFFSET(RESUME_CTX_VBAR_EL2, struct resume_cpu_context, vbar_el2);
+   OFFSET(RESUME_CTX_VTCR_EL2, struct resume_cpu_context, vtcr_el2);
+   OFFSET(RESUME_CTX_VTTBR_EL2, struct resume_cpu_context, vttbr_el2);
+   OFFSET(RESUME_CTX_TPIDR_EL2, struct resume_cpu_context, tpidr_el2);
+   OFFSET(RESUME_CTX_MDCR_EL2, struct resume_cpu_context, mdcr_el2);
+   OFFSET(RESUME_CTX_HSTR_EL2, struct resume_cpu_context, hstr_el2);
+   OFFSET(RESUME_CTX_CPTR_EL2, struct resume_cpu_context, cptr_el2);
+   OFFSET(RESUME_CTX_HCR_EL2, struct resume_cpu_context, hcr_el2);
+   OFFSET(RESUME_CTX_CNTHCTL_EL2, struct resume_cpu_context, cnthctl_el2);
+   BLANK();
+#endif
+
    OFFSET(SMCCC_RES_a0, struct arm_smccc_res, a0);
    OFFSET(SMCCC_RES_a2, struct arm_smccc_res, a2);
    OFFSET(ARM_SMCCC_1_2_REGS_X0_OFFS, struct arm_smccc_1_2_regs, a0);
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 72c7b24498..962be716ae 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -561,6 +561,128 @@ END(efi_xen_start)
 
 #endif /* CONFIG_ARM_EFI */
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+/*
+ * int prepare_resume_ctx(void)
+ *
+ * CPU context saved here will be restored on resume in hyp_resume function.
+ * prepare_resume_ctx shall return a non-zero value. Upon restoring context
+ * hyp_resume shall return value zero instead. From C code that invokes
+ * prepare_resume_ctx, the return value is interpreted to determine whether
+ * the context is saved (prepare_resume_ctx) or restored (hyp_resume).
+ */
+FUNC(prepare_resume_ctx)
+        ldr   x0, =resume_cpu_context
+
+        /* Store callee-saved registers */
+        stp   x19, x20, [x0, #RESUME_CTX_X19]
+        stp   x21, x22, [x0, #RESUME_CTX_X21]
+        stp   x23, x24, [x0, #RESUME_CTX_X23]
+        stp   x25, x26, [x0, #RESUME_CTX_X25]
+        stp   x27, x28, [x0, #RESUME_CTX_X27]
+        stp   x29, lr, [x0, #RESUME_CTX_X29]
+
+        /* Store stack-pointer */
+        mov   x2, sp
+        str   x2, [x0, #RESUME_CTX_SP]
+
+        /* Store system control registers */
+        mrs   x2, VBAR_EL2
+        str   x2, [x0, #RESUME_CTX_VBAR_EL2]
+        mrs   x2, VTCR_EL2
+        str   x2, [x0, #RESUME_CTX_VTCR_EL2]
+        mrs   x2, VTTBR_EL2
+        str   x2, [x0, #RESUME_CTX_VTTBR_EL2]
+        mrs   x2, TPIDR_EL2
+        str   x2, [x0, #RESUME_CTX_TPIDR_EL2]
+        mrs   x2, MDCR_EL2
+        str   x2, [x0, #RESUME_CTX_MDCR_EL2]
+        mrs   x2, HSTR_EL2
+        str   x2, [x0, #RESUME_CTX_HSTR_EL2]
+        mrs   x2, CPTR_EL2
+        str   x2, [x0, #RESUME_CTX_CPTR_EL2]
+        mrs   x2, HCR_EL2
+        str   x2, [x0, #RESUME_CTX_HCR_EL2]
+        mrs   x2, CNTHCTL_EL2
+        str   x2, [x0, #RESUME_CTX_CNTHCTL_EL2]
+
+        /* prepare_resume_ctx must return a non-zero value */
+        mov   x0, #1
+        ret
+END(prepare_resume_ctx)
+
+FUNC(hyp_resume)
+        /*
+         * PSCI states that SYSTEM_SUSPEND follows the CPU_SUSPEND initial
+         * state rules, so PSCI-compliant firmware must enter the return
+         * exception level with DAIF masked.
+         */
+
+        /* Initialize the UART if earlyprintk has been enabled. */
+#ifdef CONFIG_EARLY_PRINTK
+        bl    init_uart
+#endif
+        PRINT_ID("- Xen resuming -\r\n")
+
+        bl    check_cpu_mode
+        bl    cpu_init
+
+        ldr   x0, =start
+        adr   x20, start             /* x20 := paddr (start) */
+        sub   x20, x20, x0           /* x20 := phys-offset */
+        ldr   lr, =mmu_resumed
+        b     enable_secondary_cpu_mm
+
+mmu_resumed:
+        /* Now we can access the saved context, so restore it here. */
+        ldr   x0, =resume_cpu_context
+
+        /* Restore callee-saved registers */
+        ldp   x19, x20, [x0, #RESUME_CTX_X19]
+        ldp   x21, x22, [x0, #RESUME_CTX_X21]
+        ldp   x23, x24, [x0, #RESUME_CTX_X23]
+        ldp   x25, x26, [x0, #RESUME_CTX_X25]
+        ldp   x27, x28, [x0, #RESUME_CTX_X27]
+        ldp   x29, lr, [x0, #RESUME_CTX_X29]
+
+        /* Restore stack pointer */
+        ldr   x2, [x0, #RESUME_CTX_SP]
+        mov   sp, x2
+
+        /* Restore system control registers */
+        ldr   x2, [x0, #RESUME_CTX_VBAR_EL2]
+        msr   VBAR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_VTCR_EL2]
+        msr   VTCR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_VTTBR_EL2]
+        msr   VTTBR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_TPIDR_EL2]
+        msr   TPIDR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_MDCR_EL2]
+        msr   MDCR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_HSTR_EL2]
+        msr   HSTR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_CPTR_EL2]
+        msr   CPTR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_HCR_EL2]
+        msr   HCR_EL2, x2
+        ldr   x2, [x0, #RESUME_CTX_CNTHCTL_EL2]
+        msr   CNTHCTL_EL2, x2
+        isb
+
+        /*
+         * Since context is restored return from this function will appear
+         * as return from prepare_resume_ctx. To distinguish a return from
+         * prepare_resume_ctx which is called upon finalizing the suspend,
+         * as opposed to return from this function which executes on resume,
+         * we need to return zero value here.
+         */
+        mov   x0, #0
+        ret
+END(hyp_resume)
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index 31a98a1f1b..c848fc6340 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -3,6 +3,8 @@
 #ifndef ARM_SUSPEND_H
 #define ARM_SUSPEND_H
 
+#include <xen/types.h>
+
 struct domain;
 struct vcpu;
 struct vcpu_guest_context;
@@ -14,6 +16,31 @@ struct resume_info {
 
 void arch_domain_resume(struct domain *d);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+#ifdef CONFIG_ARM_64
+struct resume_cpu_context {
+    register_t callee_regs[12];
+    register_t sp;
+    register_t vbar_el2;
+    register_t vtcr_el2;
+    register_t vttbr_el2;
+    register_t tpidr_el2;
+    register_t mdcr_el2;
+    register_t hstr_el2;
+    register_t cptr_el2;
+    register_t hcr_el2;
+    register_t cnthctl_el2;
+} __aligned(16);
+#else
+#error "Define resume_cpu_context structure for arm32"
+#endif
+
+extern struct resume_cpu_context resume_cpu_context;
+
+int prepare_resume_ctx(void);
+void hyp_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #endif /* ARM_SUSPEND_H */
 
 /*
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
new file mode 100644
index 0000000000..6ea4a0f9cc
--- /dev/null
+++ b/xen/arch/arm/suspend.c
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <asm/suspend.h>
+
+struct resume_cpu_context resume_cpu_context;
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


