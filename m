Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3D7C61DD5
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 14:32:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400677.1636254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9Z-000572-5L; Thu, 27 Aug 2026 14:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400677.1636254; Thu, 27 Aug 2026 14:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9Y-00055O-Um; Thu, 27 Aug 2026 14:32:28 +0000
Received: by outflank-mailman (input) for mailman id 1400677;
 Thu, 27 Aug 2026 14:32:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wzb9X-0004k5-MC
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 14:32:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzb9X-000Qzn-2h
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:32:27 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a65-e002-0a2a0a5209dd-0a2a4504a44e-46
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:27 +0200
Received: from [40.107.130.87]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a7a-b57f-0a2a45040019-286b82575a96-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:26 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB6742.eurprd03.prod.outlook.com (2603:10a6:20b:295::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:32:25 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:32:25 +0000
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
 b=TYo+4RTFdMAc5wgviewGf7WS7RSeAMdOXbFM6YoW9j9K00/SfX8RzV3fE8hajHbPd8egREjJ3JUeZR1Y5o2dO8ttqLE4y8z8mzKsxYm3f1tjkTKCF2alKY/L6RQTgEByVeduwHDHCsqlf67FkzI7X/0oU1x302ONbmB8b1pXgKK0JhNsyUEaaEIC+S1HUpV0uHQ3qkxbZg7WqpZNncBNnVhnhl5FT4Ou3OJLCY+NFLr/DPRgq6MsMuLyIBezmdNns91PE7DVW8UoGpbrpqif9WltWjvSMezkt/Vj7VTVYQ4vWe8htskGl1oH7VuPtvn9me++kCnyMyLcm5JxoBaMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AybgVadg88br4oFv49MMcNnv89Nd8MDn3fBE6QRzNfk=;
 b=yk6Wfxhlj9Gp/roXV8/twiJJIJeZM7SO8SzpbMvw8KWO0ilcq74M6eqH76FdFXQCR0BCWW0USIx4pSNv0aAO8EC95rHSokMCHmEP5Z6EdF99ymuVbUq/3qc1qZDmkRvf81Iv07XO5bVcwtp7q1ii3OAz98JsBf2yFuTo5a2qhID5Zp4oR7mXnxxmJvuXjG32U2IQ4J7he0n3to7IATbeMjp5z3sdid1TmUDSzQF3tYZTfRvZbJEr59pmlNdfM6Jo6hjTAio9jUJMBCP0dZRKBbCWbykKFr13qYW2GKBTbmcvudOTAvh9bnEAHkR4aWv8/xxyruGBMfjZsKqiRVhQKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AybgVadg88br4oFv49MMcNnv89Nd8MDn3fBE6QRzNfk=;
 b=AUixo00z/ZRwoB1PETuaHeM7huBnuzfGNfB0OI/2BUnkaDSB2tfnaxDnpQkX+UQyNAOxyr8GbRbXuXTJzugTyt+dhh9WoLpeCpTrsRIHXLM3cvM7n1TZXBz18LxVnTD6LstM1AdstBK5/lZXZLNeAjUgSD/yE+gQXPTLraeaBlVOOIHpDsZViYdnAYjputfUdXcu7Acftea1H42AsDaD7Q0X75BQpS1QXkYtDJUAEPrp2Adx2s7F5xPAqirlhBVCTF/R8E94HkUqf9PQH/tYPZ0ewzWy71IMKKFP7tL3EtOqa8xXUdmuVwXaLT9Y5x/iReZJUIAOgkXSWVGkAzFGog==
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
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v12 04/13] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
Date: Thu, 27 Aug 2026 17:31:52 +0300
Message-ID: <1f311886ad3162f59749210c7dce26f9d089d010.1787838455.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 28aba7c4-2905-4562-27f8-08df04480361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|22082099003|18002099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	H8r6JjHxZRydPtXeREeK2/1eRMy4/Fd27nDwtvzFPWMv+4FC1F72EVNEb8yFbwu2v3v/9kk3AWaFZJcaYr47jybC6tnY8qXX+I8N6Nq4SaYyuPPT/tWLLhlbIypgieoVNb2LVWwcbDSUEFZA32R4i5MLzHLB+woYGWvzRolM9v18S2MblwludWsAz1h84vjn7AX8RxwlFqvXs2fU3Jn1GGtDYa5V40idDM/7YUE7NA5zBNXr+idONXvHY6ObOB77yuE+raWcvSo9Ivg4j2sTcmSLB7UXQUoGHOt01Yt4iTWu+SmYo5aItlaJDlOe2k2WXGJbIv+/63pislHGXjK/jGY85wfSLh+dvNSIDrU4toNRRjPEHpy9cJOf/04vVm3W64EzuctUdNQkwNHAw9MSTOEH/yjbCI6QhRSzMahGbOThl/UReeKLPbxhLB3Ir/3TDyMYkG+V9mL8fgUszF8wZr2KAMSPCwkG8yYNB2IOoRAzU3VIR7MNyCxW1xZBQOwOlPzZ184DMwixYWD8PUTGdR5nJZjfOQlPXcv9Gk7YN9mJrd4c2JV9kCCCQ/ibepjT3r/zjpcO7rY8+dlaEWV1VAc2Cx4PBOBb+slyigq6eJnYY17TWcqIjjOxPgnH7+fam1ZQT0/fpt0OI5bhU/WzCc3hLSlow36u9eyT8DR+KQI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kG28Knq4+yeIfQ5IDUeGFV4A80YEma6HumL/b1u9ovpTmGEq0PwYIq2RZHKY?=
 =?us-ascii?Q?We3nW7PdNcqMz1NGy00aR4IFD6WThQSvHR5qkO+l0/cRAS1f7BQ+Ty3ZtG9g?=
 =?us-ascii?Q?XyfWxscdU+W8tZ2Z1LfLuQiFmU4Wt41Hy3rvVEX2oEO0QxnIYlimc9zBB3UW?=
 =?us-ascii?Q?rSNHtwrvfvVweUZWEUd+0971aqB93pvlsaKaLYCoevoVvBUXimSPkB1X8m/p?=
 =?us-ascii?Q?CBpucKoaBkXP1/81IeAPx21FPfH9GB2ybnIqSVRKt6ZWj2b2XUgug3aAEIER?=
 =?us-ascii?Q?B1QJobvZwscUksOsD/uP+ZcdrB4gdhwx2kT0cdnGiASXrTOLI+ulbKCCK5Nz?=
 =?us-ascii?Q?uHud6kFN92mC0cjNeB2H5V91uyOIIkdF91seVRIZo1wHbitoEsOncN2w9W5f?=
 =?us-ascii?Q?NQQMTDScDDgP+3vpCU4PyKOwedhB0RrPR+RYau+JDKL1duAibNHc0Oi1ZoYt?=
 =?us-ascii?Q?AlU/CYjBqfWoSe2Enc/OoPKYWw9QV7Kf/skOIZbrS2aUjHJ3R/+ZeVSiv5x2?=
 =?us-ascii?Q?Wu01AW6OAOiqTQ1TveQ1neGT8pMV/dbm9XqF1KzXkn7ozklE9ilBj7iVQz03?=
 =?us-ascii?Q?93k2onzqu0c4cFSzC+7yA+VSLu9c6ckKxP19xuTW+aN8VIz05YZrz3VxnpBQ?=
 =?us-ascii?Q?5kRr3tr1oGHWR5axPFOTorR4ld3ZBqQpPKkXFYyCZBExNoD4PrsHvFEOMrAf?=
 =?us-ascii?Q?ePSkLE6j7xxmQab3SEjuuqb97AVF21lL7dzFGHiKgJ+fvH8qbM+ofbXLznQ1?=
 =?us-ascii?Q?+vX1/oW2zxEEXm06n1pAt2eiVZKIMNN97fL8GQ4qtvrsQLeImOGsUruaPpGK?=
 =?us-ascii?Q?b4Gi3MQ18f9VK4X4kvLt5sL/SUsqRu2/SjyZb+Y85viWogTbmw5rTlI8xTWs?=
 =?us-ascii?Q?65zEs57+nbEaDtA9I8tcimAq8TXU7MFqy4XlsnxPFw5MntQ3Vqo4rDsAZZPN?=
 =?us-ascii?Q?mCVl/JPKoD265u3ihok1BDKoSxyDxKFKIaPe5FvOU1B94tpooNQYFxFFInnI?=
 =?us-ascii?Q?FdmC4nLhfzxvWbdS85OPI5iWti8gAsZUvcqsdXvJ6UWi2rzJGVRtUBPBvoZy?=
 =?us-ascii?Q?TvgafFPj07RcOoFlDL0q7bww640/nWqwh4ZoroKQlCCihBP8t/mPqusVpi/m?=
 =?us-ascii?Q?X7EmJB2N6jVD2jskcClVCpsY1k4lU3MUy7fONfnGuNML7kmTiusrgcy54xmb?=
 =?us-ascii?Q?/tWEEBf6MPOkbCv2MSmoNREaG2XFdzB2IaWas/KVujbllcxhu3wd9Qw+79SK?=
 =?us-ascii?Q?bWrQVaNqH/8pr6MEErcjISALqSTJNXm3Wwdf77Ap6yJDlWJdX9DyDEoQPLi+?=
 =?us-ascii?Q?W55gcYAOvVhNk2cMva7RFZSKM5IQdWOd+xGQb7nNQr+u3E5t15nG6TPcre2q?=
 =?us-ascii?Q?cjETkaXyMNY8azqOOUAP9Vw9eCYPdWTgqkKbru8RuZMc5AZOYl1HTcTiZZ5n?=
 =?us-ascii?Q?tcdjKGtR7GueKfrBv1v4eZPepzW9Tzs9ZmrbJ7/lkV7qSGA+pPt8+G7zn0lv?=
 =?us-ascii?Q?GyadjAKQO1S86XFQ7ilWF3VT43F/51V2G+cK6Ge9yT18W+mtqfgM+OOv/pnY?=
 =?us-ascii?Q?jf6atB1oaJU8X5wFN2f9iAsf6ZHkxRMoFR1MtZAbWsnq5ot7ZqNUmCtbsgZg?=
 =?us-ascii?Q?dq3miwEh7ZImXriLo3MpoemsJB+qLZx9e3OOhReQtbWurJjyxw+KPwkmHexh?=
 =?us-ascii?Q?30JaKLfOoabGXT882xJv/u1yzND4KyRnfglMsBZXg5SR4isWZH064TFXkUer?=
 =?us-ascii?Q?3ss/9eWfMA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28aba7c4-2905-4562-27f8-08df04480361
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:32:25.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESz4E8+l7MLNKxZSLrqzGJC9x5sY/+ILZoKU9naLUjLIR6Bgok2uBu6GYFH1/gfWmwzG6juCpg4jNpKmAJG/Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6742
X-purgate-ID: tlsNG-ebf023/1787841147-50CDFB50-CF4C0D41/0/0
X-purgate-type: clean
X-purgate-size: 21035

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.

Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.

Before continuing suspend, also verify that the physical CPU interface
has no Group 1 active-priority state left. Use ICC_CTLR_EL1.PRIbits to
decide which ICC_AP1R<n>_EL1 registers are implemented, so Xen does not
read an unimplemented AP1R register.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in V10:
- abort suspend when the physical Group 1 active-priority state is still
  present, deriving accessible ICC_AP1R<n>_EL1 registers from
  ICC_CTLR_EL1.PRIbits;
- re-enable the redistributor before restoring CPU and virtual interface
  state on the suspend abort path;
- panic if the redistributor cannot be re-enabled on the suspend abort path;
- avoid saving/restoring reserved GICD_IPRIORITYR and GICD_IROUTER entries
  for a partially populated last SPI block;
- disable Distributor group forwarding while preserving affinity routing
  state before restoring Distributor configuration;
- disable SPI/eSPI forwarding and wait for RWP before restoring
  GICD_ICFGR<n>.Int_config.

Changes in V9:
- fix the suspend-context comment typo and split dist_ctx declarations;
- restore ICC_IGRPEN1_EL1 on the suspend error path;
- re-initialize GICD_IGROUPRnE during resume;
- restore GICD_IROUTER only after re-enabling ARE_NS during resume.

Changes in V8:
- use right rdist base for prop/pend baser and ctrl

Changes in V7:
- restore LPI regs on resume
- add timeout during redist disabling
- squash with suspend/resume handling for GICv3 eSPI registers
- drop ITS guard paths so suspend/resume always runs; switch missing ctx
  allocation to panic
- trim TODO comments; narrow redistributor storage to PPI icfgr
- keep distributor context allocation even without ITS; adjust resume
  to use GENMASK(31, 0) for clearing enables
- drop storage of the SGI configuration register, as SGIs are always
  edge-triggered
---
 xen/arch/arm/gic-v3-lpi.c                |   3 +
 xen/arch/arm/gic-v3.c                    | 458 ++++++++++++++++++++++-
 xen/arch/arm/include/asm/arm64/sysregs.h |   5 +
 xen/arch/arm/include/asm/gic_v3_defs.h   |   3 +
 4 files changed, 466 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 847da26ff7..a63c8c4979 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -467,6 +467,9 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
     switch ( action )
     {
     case CPU_UP_PREPARE:
+        if ( system_state == SYS_STATE_resume )
+            break;
+
         rc = gicv3_lpi_allocate_pendtable(cpu);
         if ( rc )
             printk(XENLOG_ERR "Unable to allocate the pendtable for CPU%lu\n",
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index b16888ad84..038bf41142 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1078,12 +1078,12 @@ out:
     return res;
 }
 
-static void gicv3_hyp_disable(void)
+static void gicv3_hyp_enable(bool enable)
 {
     register_t hcr;
 
     hcr = READ_SYSREG(ICH_HCR_EL2);
-    hcr &= ~GICH_HCR_EN;
+    hcr = enable ? (hcr | GICH_HCR_EN) : (hcr & ~GICH_HCR_EN);
     WRITE_SYSREG(hcr, ICH_HCR_EL2);
     isb();
 }
@@ -1190,7 +1190,7 @@ static void gicv3_disable_interface(void)
     spin_lock(&gicv3.lock);
 
     gicv3_cpu_disable();
-    gicv3_hyp_disable();
+    gicv3_hyp_enable(false);
 
     spin_unlock(&gicv3.lock);
 }
@@ -1926,6 +1926,450 @@ static bool gic_dist_supports_lpis(void)
     return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+/* This struct represents a block of 32 IRQs */
+struct dist_irq_block {
+    uint32_t icfgr[2];
+    uint32_t ipriorityr[8];
+    uint64_t irouter[32];
+    uint32_t isactiver;
+    uint32_t isenabler;
+};
+
+struct redist_ctx {
+    uint32_t ctlr;
+    uint32_t icfgr; /* only PPIs stored */
+    uint32_t igroupr;
+    uint32_t ipriorityr[8];
+    uint32_t isactiver;
+    uint32_t isenabler;
+
+    uint64_t pendbase;
+    uint64_t propbase;
+};
+
+/* GICv3 registers to be saved/restored on system suspend/resume */
+struct gicv3_ctx {
+    struct dist_ctx {
+        uint32_t ctlr;
+        struct dist_irq_block *irqs;
+        struct dist_irq_block *espi_irqs;
+    } dist;
+
+    /* have only one rdist structure for last running CPU during suspend */
+    struct redist_ctx rdist;
+
+    struct cpu_ctx {
+        uint32_t ctlr;
+        uint32_t pmr;
+        uint32_t bpr;
+        uint32_t sre_el2;
+        uint32_t grpen;
+    } cpu;
+};
+
+static struct gicv3_ctx gicv3_ctx;
+
+static void __init gicv3_alloc_context(void)
+{
+    uint32_t blocks = DIV_ROUND_UP(gicv3_info.nr_lines, 32);
+
+    /* The spec allows for systems without any SPIs */
+    if ( blocks > 1 )
+    {
+        gicv3_ctx.dist.irqs = xzalloc_array(struct dist_irq_block, blocks - 1);
+        if ( !gicv3_ctx.dist.irqs )
+            panic("Failed to allocate memory for GICv3 suspend context\n");
+    }
+
+#ifdef CONFIG_GICV3_ESPI
+    if ( !gic_number_espis() )
+        return;
+
+    blocks = gic_number_espis() / 32;
+    gicv3_ctx.dist.espi_irqs = xzalloc_array(struct dist_irq_block, blocks);
+    if ( !gicv3_ctx.dist.espi_irqs )
+        panic("Failed to allocate memory for GICv3 eSPI suspend context\n");
+#endif
+}
+
+static int gicv3_disable_redist(void)
+{
+    void __iomem *waker = GICD_RDIST_BASE + GICR_WAKER;
+    s_time_t deadline;
+
+    /*
+     * Avoid infinite loop if Non-secure does not have access to GICR_WAKER.
+     * See Arm IHI 0069H.b, 12.11.42 GICR_WAKER:
+     *     When GICD_CTLR.DS == 0 and an access is Non-secure accesses to this
+     *     register are RAZ/WI.
+     */
+    if ( !(readl_relaxed(GICD + GICD_CTLR) & GICD_CTLR_DS) )
+        return 0;
+
+    deadline = NOW() + MILLISECS(1000);
+
+    writel_relaxed(readl_relaxed(waker) | GICR_WAKER_ProcessorSleep, waker);
+    while ( (readl_relaxed(waker) & GICR_WAKER_ChildrenAsleep) == 0 )
+    {
+        if ( NOW() > deadline )
+        {
+            printk("GICv3: Timeout waiting for redistributor to sleep\n");
+            return -ETIMEDOUT;
+        }
+        cpu_relax();
+        udelay(10);
+    }
+
+    return 0;
+}
+
+#define GET_SPI_REG_OFFSET(name, is_espi) \
+    ((is_espi) ? GICD_##name##nE : GICD_##name)
+
+static void gicv3_store_spi_irq_block(struct dist_irq_block *irqs,
+                                      unsigned int i, unsigned int nr_irqs,
+                                      bool is_espi)
+{
+    void __iomem *base;
+    unsigned int irq, nr_priority_regs;
+
+    ASSERT(nr_irqs && nr_irqs <= 32);
+    nr_priority_regs = DIV_ROUND_UP(nr_irqs, 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + i * sizeof(irqs->icfgr);
+    irqs->icfgr[0] = readl_relaxed(base);
+    irqs->icfgr[1] = readl_relaxed(base + 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi);
+    base += i * sizeof(irqs->ipriorityr);
+    for ( irq = 0; irq < nr_priority_regs; irq++ )
+        irqs->ipriorityr[irq] = readl_relaxed(base + 4 * irq);
+
+    base = GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
+    base += i * sizeof(irqs->irouter);
+    for ( irq = 0; irq < nr_irqs; irq++ )
+        irqs->irouter[irq] = readq_relaxed_non_atomic(base + 8 * irq);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISACTIVER, is_espi);
+    base += i * sizeof(irqs->isactiver);
+    irqs->isactiver = readl_relaxed(base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISENABLER, is_espi);
+    base += i * sizeof(irqs->isenabler);
+    irqs->isenabler = readl_relaxed(base);
+}
+
+static void gicv3_restore_spi_irq_config(struct dist_irq_block *irqs,
+                                         unsigned int i, unsigned int nr_irqs,
+                                         bool is_espi)
+{
+    void __iomem *base;
+    unsigned int irq, nr_priority_regs;
+
+    ASSERT(nr_irqs && nr_irqs <= 32);
+    nr_priority_regs = DIV_ROUND_UP(nr_irqs, 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(ICFGR, is_espi) + i * sizeof(irqs->icfgr);
+    writel_relaxed(irqs->icfgr[0], base);
+    writel_relaxed(irqs->icfgr[1], base + 4);
+
+    base = GICD + GET_SPI_REG_OFFSET(IPRIORITYR, is_espi);
+    base += i * sizeof(irqs->ipriorityr);
+    for ( irq = 0; irq < nr_priority_regs; irq++ )
+        writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq);
+}
+
+static void gicv3_restore_spi_irq_routing(struct dist_irq_block *irqs,
+                                          unsigned int i, unsigned int nr_irqs,
+                                          bool is_espi)
+{
+    void __iomem *base;
+    unsigned int irq;
+
+    ASSERT(nr_irqs && nr_irqs <= 32);
+
+    base = GICD + GET_SPI_REG_OFFSET(IROUTER, is_espi);
+    base += i * sizeof(irqs->irouter);
+    for ( irq = 0; irq < nr_irqs; irq++ )
+        writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq);
+}
+
+static void gicv3_disable_spi_irq_block(unsigned int i, bool is_espi)
+{
+    void __iomem *base;
+
+    base = GICD + GET_SPI_REG_OFFSET(ICENABLER, is_espi) + i * 4;
+    writel_relaxed(GENMASK(31, 0), base);
+}
+
+static void gicv3_restore_spi_irq_state(struct dist_irq_block *irqs,
+                                        unsigned int i, bool is_espi)
+{
+    void __iomem *base;
+
+    base = GICD + GET_SPI_REG_OFFSET(ISENABLER, is_espi);
+    base += i * sizeof(irqs->isenabler);
+    writel_relaxed(irqs->isenabler, base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ICACTIVER, is_espi) + i * 4;
+    writel_relaxed(GENMASK(31, 0), base);
+
+    base = GICD + GET_SPI_REG_OFFSET(ISACTIVER, is_espi);
+    base += i * sizeof(irqs->isactiver);
+    writel_relaxed(irqs->isactiver, base);
+}
+
+static int gicv3_check_ap1r(unsigned int n, register_t apr)
+{
+    if ( !apr )
+        return 0;
+
+    printk(XENLOG_ERR "GICv3: suspend aborted: ICC_AP1R%u_EL1=%#"
+           PRIregister"\n", n, apr);
+
+    return -EBUSY;
+}
+
+static int gicv3_check_active_priorities(register_t ctlr)
+{
+    unsigned int pribits = MASK_EXTR(ctlr, ICC_CTLR_EL1_PRIBITS_MASK) + 1;
+    int ret;
+
+    /*
+     * Xen enables physical Group 1 interrupts through ICC_IGRPEN1_EL1,
+     * so only the physical Group 1 active-priority registers are relevant
+     * here. Use ICC_CTLR_EL1.PRIbits for the physical CPU interface, not
+     * ICH_VTR_EL2, which describes the virtual interface. ICC_AP1R1_EL1 is
+     * only implemented with at least 6 physical priority bits, and
+     * ICC_AP1R2_EL1/ICC_AP1R3_EL1 with at least 7.
+     */
+    switch ( pribits )
+    {
+    case 8:
+    case 7:
+        ret = gicv3_check_ap1r(3, READ_SYSREG(ICC_AP1R3_EL1));
+        if ( ret )
+            return ret;
+        ret = gicv3_check_ap1r(2, READ_SYSREG(ICC_AP1R2_EL1));
+        if ( ret )
+            return ret;
+        /* Fall through */
+    case 6:
+        ret = gicv3_check_ap1r(1, READ_SYSREG(ICC_AP1R1_EL1));
+        if ( ret )
+            return ret;
+        /* Fall through */
+    default:
+        return gicv3_check_ap1r(0, READ_SYSREG(ICC_AP1R0_EL1));
+    }
+}
+
+static int gicv3_suspend(void)
+{
+    unsigned int i, nr_irqs;
+    void __iomem *base;
+    int ret;
+    struct redist_ctx *rdist = &gicv3_ctx.rdist;
+
+    /* Save GICC configuration */
+    gicv3_ctx.cpu.ctlr     = READ_SYSREG(ICC_CTLR_EL1);
+    gicv3_ctx.cpu.pmr      = READ_SYSREG(ICC_PMR_EL1);
+    gicv3_ctx.cpu.bpr      = READ_SYSREG(ICC_BPR1_EL1);
+    gicv3_ctx.cpu.sre_el2  = READ_SYSREG(ICC_SRE_EL2);
+    gicv3_ctx.cpu.grpen    = READ_SYSREG(ICC_IGRPEN1_EL1);
+
+    gicv3_disable_interface();
+
+    ret = gicv3_check_active_priorities(gicv3_ctx.cpu.ctlr);
+    if ( ret )
+        goto out_enable_iface;
+
+    ret = gicv3_disable_redist();
+    if ( ret )
+        goto out_enable_iface;
+
+    /* Save GICR configuration */
+    gicv3_redist_wait_for_rwp();
+
+    base = GICD_RDIST_BASE;
+
+    rdist->ctlr = readl_relaxed(base + GICR_CTLR);
+
+    rdist->propbase = readq_relaxed(base + GICR_PROPBASER);
+    rdist->pendbase = readq_relaxed(base + GICR_PENDBASER);
+
+    base = GICD_RDIST_SGI_BASE;
+
+    /* Save priority on PPI and SGI interrupts */
+    for ( i = 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
+        rdist->ipriorityr[i] = readl_relaxed(base + GICR_IPRIORITYR0 + 4 * i);
+
+    rdist->isactiver = readl_relaxed(base + GICR_ISACTIVER0);
+    rdist->isenabler = readl_relaxed(base + GICR_ISENABLER0);
+    rdist->igroupr   = readl_relaxed(base + GICR_IGROUPR0);
+    rdist->icfgr     = readl_relaxed(base + GICR_ICFGR1);
+
+    /* Save GICD configuration */
+    gicv3_dist_wait_for_rwp();
+    gicv3_ctx.dist.ctlr = readl_relaxed(GICD + GICD_CTLR);
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+    {
+        nr_irqs = min(32U, gicv3_info.nr_lines - i * 32);
+        gicv3_store_spi_irq_block(gicv3_ctx.dist.irqs + i - 1, i, nr_irqs,
+                                  false);
+    }
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+        gicv3_store_spi_irq_block(gicv3_ctx.dist.espi_irqs + i, i, 32, true);
+#endif
+
+    return 0;
+
+ out_enable_iface:
+    if ( gicv3_enable_redist() )
+        panic("GICv3: Failed to re-enable redistributor after suspend abort\n");
+
+    gicv3_hyp_enable(true);
+    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
+    isb();
+
+    return ret;
+}
+
+static void gicv3_resume(void)
+{
+    int ret;
+    unsigned int i, nr_irqs;
+    uint32_t dist_ctlr;
+    void __iomem *base;
+    struct redist_ctx *rdist = &gicv3_ctx.rdist;
+
+    dist_ctlr = gicv3_ctx.dist.ctlr & GICD_CTLR_ARE_NS;
+
+    /* Disable group forwarding while preserving affinity routing state. */
+    writel_relaxed(dist_ctlr, GICD + GICD_CTLR);
+    gicv3_dist_wait_for_rwp();
+
+    /*
+     * IHI0069H.b 12.9.9 says changing GICD_ICFGR<n>.Int_config
+     * while the interrupt is individually enabled is UNPREDICTABLE.
+     * Disable SPIs first; 4.7.1 defines GICD_ICENABLER<n>, n > 0,
+     * as the per-SPI disable mechanism.
+     */
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+        gicv3_disable_spi_irq_block(i, false);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+        gicv3_disable_spi_irq_block(i, true);
+#endif
+
+    gicv3_dist_wait_for_rwp();
+
+    for ( i = NR_GIC_LOCAL_IRQS; i < gicv3_info.nr_lines; i += 32 )
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4);
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+    {
+        nr_irqs = min(32U, gicv3_info.nr_lines - i * 32);
+        gicv3_restore_spi_irq_config(gicv3_ctx.dist.irqs + i - 1, i, nr_irqs,
+                                     false);
+    }
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+    {
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPRnE + i * 4);
+        gicv3_restore_spi_irq_config(gicv3_ctx.dist.espi_irqs + i, i, 32,
+                                     true);
+    }
+#endif
+
+    if ( dist_ctlr )
+    {
+        for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+        {
+            nr_irqs = min(32U, gicv3_info.nr_lines - i * 32);
+            gicv3_restore_spi_irq_routing(gicv3_ctx.dist.irqs + i - 1, i,
+                                          nr_irqs, false);
+        }
+
+#ifdef CONFIG_GICV3_ESPI
+        for ( i = 0; i < gic_number_espis() / 32; i++ )
+            gicv3_restore_spi_irq_routing(gicv3_ctx.dist.espi_irqs + i, i,
+                                          32, true);
+#endif
+    }
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+        gicv3_restore_spi_irq_state(gicv3_ctx.dist.irqs + i - 1, i, false);
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i = 0; i < gic_number_espis() / 32; i++ )
+        gicv3_restore_spi_irq_state(gicv3_ctx.dist.espi_irqs + i, i, true);
+#endif
+
+    writel_relaxed(gicv3_ctx.dist.ctlr, GICD + GICD_CTLR);
+    gicv3_dist_wait_for_rwp();
+
+    ret = gicv3_lpi_init_rdist(GICD_RDIST_BASE);
+    /*
+     * If LPIs are already enabled, assume firmware or the still-powered
+     * redistributor has valid PROPBASER/PENDBASER and skip reprogramming.
+     * Return -EBUSY so callers can ignore this case.
+     */
+    if ( ret && ret != -ENODEV && ret != -EBUSY )
+        panic("GICv3: Failed to re-initialize LPIs during resume\n");
+    else if ( ret == -EBUSY ) /* extra checks, just to be sure */
+    {
+        base = GICD_RDIST_BASE;
+        if ( readq_relaxed(base + GICR_PROPBASER) != rdist->propbase ||
+             readq_relaxed(base + GICR_PENDBASER) != rdist->pendbase )
+            panic("GICv3: LPIs already enabled with unexpected PROPBASER/PENDBASER during resume\n");
+    }
+
+    /* Restore GICR (Redistributor) configuration */
+    if ( gicv3_enable_redist() )
+        panic("GICv3: Failed to re-enable redistributor during resume\n");
+
+    base = GICD_RDIST_SGI_BASE;
+
+    writel_relaxed(GENMASK(31, 0), base + GICR_ICENABLER0);
+    gicv3_redist_wait_for_rwp();
+
+    for ( i = 0; i < NR_GIC_LOCAL_IRQS / 4; i++ )
+        writel_relaxed(rdist->ipriorityr[i], base + GICR_IPRIORITYR0 + i * 4);
+
+    writel_relaxed(rdist->isactiver, base + GICR_ISACTIVER0);
+    writel_relaxed(rdist->igroupr,   base + GICR_IGROUPR0);
+    writel_relaxed(rdist->icfgr,     base + GICR_ICFGR1);
+
+    gicv3_redist_wait_for_rwp();
+
+    writel_relaxed(rdist->isenabler, base + GICR_ISENABLER0);
+    writel_relaxed(rdist->ctlr, GICD_RDIST_BASE + GICR_CTLR);
+
+    gicv3_redist_wait_for_rwp();
+
+    WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
+    isb();
+
+    /* Restore CPU interface (System registers) */
+    WRITE_SYSREG(gicv3_ctx.cpu.pmr,   ICC_PMR_EL1);
+    WRITE_SYSREG(gicv3_ctx.cpu.bpr,   ICC_BPR1_EL1);
+    WRITE_SYSREG(gicv3_ctx.cpu.ctlr,  ICC_CTLR_EL1);
+    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
+    isb();
+
+    gicv3_hyp_init();
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /* Set up the GIC */
 static int __init gicv3_init(void)
 {
@@ -2011,6 +2455,10 @@ static int __init gicv3_init(void)
 
     gicv3_hyp_init();
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    gicv3_alloc_context();
+#endif
+
 out:
     spin_unlock(&gicv3.lock);
 
@@ -2050,6 +2498,10 @@ static const struct gic_hw_operations gicv3_ops = {
 #endif
     .iomem_deny_access   = gicv3_iomem_deny_access,
     .do_LPI              = gicv3_do_LPI,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend             = gicv3_suspend,
+    .resume              = gicv3_resume,
+#endif
 };
 
 static int __init gicv3_dt_preinit(struct dt_device_node *node, const void *data)
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index f3c11d871e..2261620316 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -16,6 +16,11 @@
 #define ICC_SRE_EL1               S3_0_C12_C12_5
 #define ICC_IGRPEN1_EL1           S3_0_C12_C12_7
 
+#define ICC_AP1R0_EL1             S3_0_C12_C9_0
+#define ICC_AP1R1_EL1             S3_0_C12_C9_1
+#define ICC_AP1R2_EL1             S3_0_C12_C9_2
+#define ICC_AP1R3_EL1             S3_0_C12_C9_3
+
 #define ICH_VSEIR_EL2             S3_4_C12_C9_4
 #define ICC_SRE_EL2               S3_4_C12_C9_5
 #define ICH_HCR_EL2               S3_4_C12_C11_0
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index 3714cfeb7d..f741587322 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -94,12 +94,15 @@
 #define GICD_TYPE_LPIS               (1U << 17)
 
 #define GICD_CTLR_RWP                (1UL << 31)
+#define GICD_CTLR_DS                 (1U << 6)
 #define GICD_CTLR_ARE_NS             (1U << 4)
 #define GICD_CTLR_ENABLE_G1A         (1U << 1)
 #define GICD_CTLR_ENABLE_G1          (1U << 0)
 #define GICD_IROUTER_SPI_MODE_ANY    (1UL << 31)
 
 #define GICC_CTLR_EL1_EOImode_drop   (1U << 1)
+#define ICC_CTLR_EL1_PRIBITS_SHIFT   8
+#define ICC_CTLR_EL1_PRIBITS_MASK    (0x7U << ICC_CTLR_EL1_PRIBITS_SHIFT)
 
 #define GICR_WAKER_ProcessorSleep    (1U << 1)
 #define GICR_WAKER_ChildrenAsleep    (1U << 2)
-- 
2.43.0


