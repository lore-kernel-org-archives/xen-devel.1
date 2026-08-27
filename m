Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB068C61DCD
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 14:32:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400682.1636300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9g-0006SA-0D; Thu, 27 Aug 2026 14:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400682.1636300; Thu, 27 Aug 2026 14:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9f-0006R8-PI; Thu, 27 Aug 2026 14:32:35 +0000
Received: by outflank-mailman (input) for mailman id 1400682;
 Thu, 27 Aug 2026 14:32:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wzb9e-0006D8-Iy
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 14:32:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzb9d-000Qzn-Vt
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:32:34 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a7e-e002-0a2a0a5209dd-0a2a450b8194-14
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:33 +0200
Received: from [52.101.84.125]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a81-b7e8-0a2a450b0019-3465547d8cc2-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:33 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB6742.eurprd03.prod.outlook.com (2603:10a6:20b:295::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:32:32 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:32:32 +0000
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
 b=Tg73x7On4MakVVR3vXUCenc720XoGuALxaNsGPwhs/p+6EUlV+gfT8VLrqyCYyL0w3C+mz7TFffsk1+qb3fMgmC+yPtrX16up8HsddwtKYALpA8b2cY/F/FzweeYK4a+ZGjbGwpTEAjrzWosVKgd3F9Qkxrr937Dbylm1oIGPECxSq1aUcNyMfQbw9cJm+99U8XV3CPs5COS3bbtMfgBzkcEqa7pEFqhFudIBae392mMjt+267qoVKiw9QGUIWY6Tqm1F/UYcs6Y2aVtDBFNDHHWx3dsLhAn5n6sZqwiroJbYHL/u4wyd7NSdzjIitDdK/8LwgpQn2Y86KuscNhg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuU9qIia0v/KlFmfmQr2PfYUlwI141FZNiLujMqRB9A=;
 b=WLOvlcsnYEZIcrT2HpE0VZ6rfZXSjocAus4d2OdfnJQ8vexYLcM/m1hLxfzguJezCHrPuO6G1l4PrzqkHOh7ckvTARbdnuRhrRaMFFBfrgh3wxJziEh9nlUlmrqJtD/gP4z6WjiLK6f3tAhgxaKustmT8JC3Ku7uLlNyXXVfcnRxDiFpxaTOxDnMpEwnZ9eH0hpTygU3c01hKCBz88Y0nKWl3sGPk3TPIfV/H6WnE21YucQML1dhMKrW/4txNncyITdCXuhsQ5AsDIkRXCIDVPFQ9Lni6iop0/AeflkdErQAxMkyV1cyyavBB8CdZmnJJF1j4UtZWDjrQH2bR9n7yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zuU9qIia0v/KlFmfmQr2PfYUlwI141FZNiLujMqRB9A=;
 b=B4XJR4yon2vJ9zqHsHms1XZ4NeRSXo61PPfs44CwER3bb1CqCoU+WzEPsiLZPJAq8fxoo5M7u8HUGVLUXa39cBAJrlA5odgLrdPXRzLul5tcJO0W4qhDflGOOIgiELfvXzdjvailsXNR2QIKnJNJCh+4ug/3DffyaqYvstld0FPv+izecYApEbVZSS6XElDHSOnBjGGzOINMyBtcOKWyZ0vjJrity5K/FJ76nDY7Se3BBNKIFras+BOWl0vVadqYwg4eSpeBYoNkse6LOCmWToX6DTy7PTUDu1FvU9aq08JVrowsqSFGMbv7IhjGIuS7srgTO+kSW0BPWapIcQry9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Pranjal Shrivastava <praan@google.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v12 09/13] xen/arm: smmu-v3: add suspend/resume handlers
Date: Thu, 27 Aug 2026 17:31:57 +0300
Message-ID: <388056532b9d11c1db1631c1b8385b317ec46e02.1787838455.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 623f5751-dad1-426e-dc6c-08df0448079d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|3023799007|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	XhAB9+8CRvop6gFxzQHjh/39JWxKqUMbN8Gb+1VhhD1SZZSgjKIutyy+tYvTyCmpg+rcXnrlObiBNsxb2OfJgXWKGelg6ttw6JhPONTiJ5+Rfs2RgrVm4Y1jysIerDrUM7jso09HXjIgH3yrMVpwvh0JIsgBw6gTmhvgBe892eX2htD7zzFVKXqSW4dUfQqaACL6AmoLcnRQsBmBr8Ib1a3kjKUCKw+EF7x/EnQK2Vj31fieqrgsLHTIWhZP5Er1d8CAehd6V8wgND2VRZLXBAUInNeXqY+iLhkRnG3ytr2iRARNqGRB+Zw0sHR+LFnEE9b+63p7BeHdDkecBtTaf9b4gkjct+Ncsro0HaKzy9eIvrNhjsGD5Rt+JYZMovu2TtxY7fsi90MY4W71MehlAnbFPMwd9ldLmBzZ1rougGVENPrI/gUVgUHkOFXaX2rFtKeqtAj/Xf5PgED44qUCX2usifUGgUTC5X5PITaIDiEFWl9IZoHh4hZ2MBhKki8e9fyNp4cczILsfZQuwhW++AFiKKIIqjvAi/pl971N3iByxGlzIb8oaV0yKFaoUDrrVIt9XTPO0kVm2BRTRuDwtGRWoQt9uzlsRuRkSrisUSDBV8gNRa2nizgcUGwMVq72
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z3CuWTzOviG1hcj8hc7zr3QMf4df4+TenEV1OK/4mRhJe60y+uX/TTdwLWvB?=
 =?us-ascii?Q?Bm7v59WSkGLQaEc4Sn6qa43z9Q69fDJ1VUZY2aLgYM1SSNZYpir7KEare0Zb?=
 =?us-ascii?Q?4MGwRb0JqnEPC/GLyi4xvvnrrRvJZlcDkfhTSHDQDxCMqHHv6QlW0oBKJANW?=
 =?us-ascii?Q?tDZ6HDuwUZuXS6FXyVa3YQZi+UYcGdaptHsC1GIRZ0C12T6I+uWKGHJI/fyA?=
 =?us-ascii?Q?3YDMGE8fNxWCsTgpFHUqEAchL5bjH8t47wvm3HAE2CU8s3TXOpW9LMCFkYOm?=
 =?us-ascii?Q?96rq3+pjujobDzlcRlyr1jK9H1dGjANcNzBJ+I59GU5dWH13IHPH+Lg7Srhw?=
 =?us-ascii?Q?mG5fCY3jukts04juoTHCrCt9/2RNcldx4LzwC0JlkNKwxRl0b6dwN53kCDhu?=
 =?us-ascii?Q?oTt0TN/0Mutc/SoyeLA9ZfTLS5Y9+T55C6gBf/I/7nQEZu7FWNyOGcSiE7Xa?=
 =?us-ascii?Q?D7+fZ0dIFBjtTiN5UlS9XpH9E1Vjsj6W9nStZ7nQwqxnGZ0H9lyYxyVgDbBR?=
 =?us-ascii?Q?uBcKKe5Gx+/AoRRfDrNnaVcKQSrUBgPGT952113+ACKTNqmjL3hZGy3Ix99B?=
 =?us-ascii?Q?cv5aEc2pLdJSHd7kOxhwClmWnkU1IQuBLWGGdQkFjXHCzTO0cm/3POtvKWkB?=
 =?us-ascii?Q?MEEYFBo7f8I1OFq8Ys2ENa2aAW9ufq/bdoxUm/HfSIFr6XIF3GxRfnLFDaIV?=
 =?us-ascii?Q?FWr7dWNu5c9JTNL92sOq3VdALkGyboWkF5Dk4AI0TlwR3HFy+oogXxJVie9L?=
 =?us-ascii?Q?JVYdOFMEm61nVIOAl1kOi8IffDspFh78P1nxwnn/nRhm9YmbBLzgY/tY+DCf?=
 =?us-ascii?Q?dJAyzSo25kA1Q6AsP79MQbWEBz5G/3pgGF62RXPCDH9pezCH4Moe16DyIV9s?=
 =?us-ascii?Q?kBxHifQxfroD8vDU0YZzhZLSqUR6pOtl0IUVKlkWZ0hTtF8aVpBC5B1+X7Vp?=
 =?us-ascii?Q?U+LA2XzlPYWo8LbPXIKI4OvUPzgMuAdhU/Ccz4gtIlBrdgRkODykPRHliC5z?=
 =?us-ascii?Q?ngXLIeIGCOwx7/I+ON0WUu3UBq7GWY8mZXtYVba6SvNoet5Yu/PrPuwC2PJ2?=
 =?us-ascii?Q?jHhs1525JKEkNBuNG8AjAVzNDQUc3FbL8KrOuReMfuPce5c4mNx06v3pj50C?=
 =?us-ascii?Q?6u/5DMfvQKUpGPPbXVK13etv05wYpRhZ4ttvlXLYZ6qVAujXed3MRZS8yLij?=
 =?us-ascii?Q?sGriPTNKsFV2JU+p0dTbppNY0Q6DMk+2j2laUvgHPxkGmLoRq/8TmnVs28jx?=
 =?us-ascii?Q?AuBNsXg6SAPz/DbLSHUC45i9lDLzoDuafRwuR00EdZiwdnQEpeNFsDiXm9Ok?=
 =?us-ascii?Q?97HPEhF0fMU4TTJbvdnD9r6Z6sr8EdM4kejp2JS3vYq35GOmmLjZEp0zOVDJ?=
 =?us-ascii?Q?jbW/hmw9TOx0NH4yg0BFVw5bF8iFBkvLbWV2EcTbp5pWTkSSD9II5zfCRz5D?=
 =?us-ascii?Q?ok0yNwoQFi//hRwuT3wPlm8PsjxQBm6hMlkFKZ6fek1tQqOX7FD8akOurL4r?=
 =?us-ascii?Q?Z+i1LgrUfq9yk8t0GJ6nFnu05qDovRMdauLPgDPka8ZZO8J/aHoWzQp6Q6in?=
 =?us-ascii?Q?kF3Qj3PFdiSYG5Yd6RcOYaSrP9Hc26+dZr4f6KHvxjNpBskbXF7ctoDrSomt?=
 =?us-ascii?Q?YLscEMUcO3vke0tzGpMLs8BtsPljEfVHbz7EBn4KSq3SfnkgPyFQXaqurkEr?=
 =?us-ascii?Q?6BPVtIvOLndgtrucKAw6MiZJPgV9+DrZiYRfg0hmwAzDDapf16QLBhTNepkv?=
 =?us-ascii?Q?UJqL9o9f6g=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 623f5751-dad1-426e-dc6c-08df0448079d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:32:32.3414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92hAOWtWTSrQsgs+nRPAdixXDYNR9/UJgMI4YUNKPOxuYG0+NJ53VBVxZQXoyaOpteiUmosePk7kYOYd0sqwUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6742
X-purgate-ID: tlsNG-42698a/1787841153-AAAD89EA-2DE3372E/0/0
X-purgate-type: clean
X-purgate-size: 11069

Add system suspend/resume callbacks for the Arm SMMUv3 driver.

During suspend, configure GBPA to abort incoming transactions, disable the
translation interface while keeping CMDQ enabled, issue CMD_SYNC to ensure
all previously issued commands have completed, then disable the SMMU IRQs
and SMMU.

Resume uses arm_smmu_device_reset() to reprogram the SMMU and re-enable
translation and interrupt generation.

The IRQ setup split follows the approach from Pranjal Shrivastava's Linux
arm-smmu-v3 runtime/system sleep series: IRQ handlers are requested once
during probe, while reset/resume only restores SMMU hardware state and
re-enables IRQ_CTRL.

Only the pieces relevant to Xen's currently supported SMMUv3 path are
ported here. Xen documents SMMUv3 MSI and PCI ATS as unsupported and not
compiled/tested, so this patch does not restore SMMU MSI IRQ_CFGn registers
nor reinitialize ATS/PRI endpoints. If those paths become usable,
suspend/resume will need corresponding MSI restore and ATS/PRI
quiesce/reinit steps.

Link: https://lore.kernel.org/r/20260414194702.1229094-1-praan@google.com/
Based-on-patch-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in V11:
- Keep arm_smmu_update_gbpa() and arm_smmu_device_reset() in init text when
  CONFIG_SYSTEM_SUSPEND is disabled.

Changes in V10:
- Disable SMMU interrupt generation during suspend before disabling the
  SMMU interface, matching the resume/reset path which re-enables IRQ_CTRL.

Changes in V9:
- Use CMD_SYNC in suspend instead of polling CMDQ_CONS, so the suspend
  path waits for command completion rather than only command consumption.
- Document that arm_smmu_setup_irqs() is probe-only and that future Xen
  SMMUv3 MSI support will need to restore SMMU IRQ_CFGn registers on
  resume.
- Restore the reference to Pranjal's Linux runtime/system sleep series and
  clarify that MSI/ATS/PRI resume handling is outside the supported Xen
  path.
- Prefix the subject with xen/arm for consistency with the rest of the
  Arm suspend/resume series.

Changes in V8:
- Honor ARM_SMMU_FEAT_SEV when draining the CMDQ during suspend, matching
  the existing runtime CMD_SYNC path.
- Fold the suspend rollback reset path into a helper and rename the error
  reporting to describe suspend rollback rather than resume.
- Treat SMMU reset failure during resume as fatal instead of logging and
  continuing with a potentially unusable IOMMU.
- cosmetic changes
---
 xen/drivers/passthrough/arm/smmu-v3.c | 194 +++++++++++++++++++++-----
 1 file changed, 158 insertions(+), 36 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index bf153227db..7f1d00fb81 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -94,6 +94,12 @@
 
 #include "smmu-v3.h"
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+#define __init_or_smmu_suspend
+#else
+#define __init_or_smmu_suspend __init
+#endif
+
 #define ARM_SMMU_VTCR_SH_IS		3
 #define ARM_SMMU_VTCR_RGN_WBWA		1
 #define ARM_SMMU_VTCR_TG0_4K		0
@@ -1814,8 +1820,8 @@ static int arm_smmu_write_reg_sync(struct arm_smmu_device *smmu, u32 val,
 }
 
 /* GBPA is "special" */
-static int __init arm_smmu_update_gbpa(struct arm_smmu_device *smmu,
-                                       u32 set, u32 clr)
+static int __init_or_smmu_suspend
+arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
 {
 	int ret;
 	u32 reg, __iomem *gbpa = smmu->base + ARM_SMMU_GBPA;
@@ -1995,10 +2001,35 @@ err_free_evtq_irq:
 	return ret;
 }
 
+static int arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
+{
+	int ret;
+	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
+
+	if ( smmu->features & ARM_SMMU_FEAT_PRI )
+		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
+
+	/* Enable interrupt generation on the SMMU */
+	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
+				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
+	if ( ret )
+	{
+		dev_warn(smmu->dev, "failed to enable irqs\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * Probe-time only: request host IRQs and, when available, program the SMMU's
+ * MSI doorbells. Resume does not restore the SMMU *_IRQ_CFGn MSI registers,
+ * so any host suspend support must treat the active MSI IRQ path as
+ * unsupported until that restore path exists.
+ */
 static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 {
 	int ret, irq;
-	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
 
 	/* Disable IRQs first */
 	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
@@ -2028,22 +2059,7 @@ static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 		}
 	}
 
-	if (smmu->features & ARM_SMMU_FEAT_PRI)
-		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
-
-	/* Enable interrupt generation on the SMMU */
-	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
-				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
-	if (ret) {
-		dev_warn(smmu->dev, "failed to enable irqs\n");
-		goto err_free_irqs;
-	}
-
 	return 0;
-
-err_free_irqs:
-	arm_smmu_free_irqs(smmu);
-	return ret;
 }
 
 static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
@@ -2057,7 +2073,8 @@ static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
 	return ret;
 }
 
-static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
+static int __init_or_smmu_suspend
+arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
 	u32 reg, enables;
@@ -2163,17 +2180,9 @@ static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		}
 	}
 
-	ret = arm_smmu_setup_irqs(smmu);
-	if (ret) {
-		dev_err(smmu->dev, "failed to setup irqs\n");
+	ret = arm_smmu_enable_irqs(smmu);
+	if ( ret )
 		return ret;
-	}
-
-	/* Initialize tasklets for threaded IRQs*/
-	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
-	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
-	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet,
-				 smmu);
 
 	/* Enable the SMMU interface, or ensure bypass */
 	if (disable_bypass) {
@@ -2181,20 +2190,16 @@ static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	} else {
 		ret = arm_smmu_update_gbpa(smmu, 0, GBPA_ABORT);
 		if (ret)
-			goto err_free_irqs;
+			return ret;
 	}
 	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
 				      ARM_SMMU_CR0ACK);
 	if (ret) {
 		dev_err(smmu->dev, "failed to enable SMMU interface\n");
-		goto err_free_irqs;
+		return ret;
 	}
 
 	return 0;
-
-err_free_irqs:
-	arm_smmu_free_irqs(smmu);
-	return ret;
 }
 
 static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
@@ -2558,10 +2563,23 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_free;
 
+	ret = arm_smmu_setup_irqs(smmu);
+	if ( ret )
+	{
+		dev_err(smmu->dev, "failed to setup irqs\n");
+		goto out_free;
+	}
+
+	/* Initialize tasklets for threaded IRQs*/
+	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
+	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
+	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet,
+				smmu);
+
 	/* Reset the device */
 	ret = arm_smmu_device_reset(smmu);
 	if (ret)
-		goto out_free;
+		goto out_free_irqs;
 
 	/*
 	 * Keep a list of all probed devices. This will be used to query
@@ -2575,6 +2593,8 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
 
 	return 0;
 
+out_free_irqs:
+	arm_smmu_free_irqs(smmu);
 
 out_free:
 	arm_smmu_free_structures(smmu);
@@ -2855,6 +2875,104 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
 	xfree(xen_domain);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+static void arm_smmu_reset_for_suspend_rollback(struct arm_smmu_device *smmu)
+{
+	int ret = arm_smmu_device_reset(smmu);
+
+	if ( ret )
+		dev_err(smmu->dev, "Failed to reset during suspend rollback: %d\n",
+				ret);
+}
+
+static int arm_smmu_suspend(void)
+{
+	struct arm_smmu_device *smmu;
+	int ret = 0;
+
+	list_for_each_entry(smmu, &arm_smmu_devices, devices)
+	{
+		/* Abort all transactions before disable to avoid spurious bypass */
+		ret = arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
+		if ( ret )
+			goto fail;
+
+		ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
+					ARM_SMMU_IRQ_CTRLACK);
+		if ( ret )
+		{
+			dev_err(smmu->dev, "Timed-out while disabling SMMU irqs\n");
+			goto fail;
+		}
+
+		/* Disable the SMMU via CR0.EN and all queues except CMDQ */
+		ret = arm_smmu_write_reg_sync(smmu, CR0_CMDQEN, ARM_SMMU_CR0,
+					ARM_SMMU_CR0ACK);
+		if ( ret )
+		{
+			dev_err(smmu->dev, "Timed-out while disabling smmu\n");
+			goto fail;
+		}
+
+		/*
+		 * At this point the translation interface is disabled and the
+		 * SMMU won't access translation/config structures, even
+		 * speculatively, as per the IHI0070 spec (section 6.3.9.6).
+		 * CMDQ is still enabled so that a CMD_SYNC can complete any
+		 * previously issued commands.
+		 */
+
+		/* Ensure all previously issued commands have completed. */
+		ret = arm_smmu_cmdq_issue_sync(smmu);
+		if ( ret )
+		{
+			dev_err(smmu->dev, "Timed-out waiting for pending commands\n");
+			goto fail;
+		}
+
+		/* Disable everything */
+		ret = arm_smmu_device_disable(smmu);
+		if ( ret )
+			goto fail;
+
+		dev_dbg(smmu->dev, "Suspended smmu\n");
+	}
+
+	return 0;
+
+ fail:
+	/* Reset the device that failed as well as any already-suspended ones. */
+	arm_smmu_reset_for_suspend_rollback(smmu);
+
+	list_for_each_entry_continue_reverse(smmu, &arm_smmu_devices, devices)
+		arm_smmu_reset_for_suspend_rollback(smmu);
+
+	return ret;
+}
+
+static void arm_smmu_resume(void)
+{
+	int ret;
+	struct arm_smmu_device *smmu;
+
+	list_for_each_entry(smmu, &arm_smmu_devices, devices)
+	{
+		dev_dbg(smmu->dev, "Resuming device\n");
+
+		/*
+		 * The reset will re-initialize all the base addresses, queues,
+		 * prod and cons maintained within struct arm_smmu_device as well as
+		 * re-enable the interrupts.
+		 */
+		ret = arm_smmu_device_reset(smmu);
+		if ( ret )
+			panic("SMMUv3: %s: Failed to reset during resume: %d\n",
+			      dev_name(smmu->dev), ret);
+	}
+}
+#endif
+
 static const struct iommu_ops arm_smmu_iommu_ops = {
 	.page_sizes		= PAGE_SIZE_4K,
 	.init			= arm_smmu_iommu_xen_domain_init,
@@ -2867,6 +2985,10 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
 	.unmap_page		= arm_iommu_unmap_page,
 	.dt_xlate		= arm_smmu_dt_xlate,
 	.add_device		= arm_smmu_add_device,
+#ifdef CONFIG_SYSTEM_SUSPEND
+	.suspend		= arm_smmu_suspend,
+	.resume			= arm_smmu_resume,
+#endif
 };
 
 static __init int arm_smmu_dt_init(struct dt_device_node *dev,
-- 
2.43.0


