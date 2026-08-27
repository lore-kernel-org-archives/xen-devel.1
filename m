Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5EFC61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 14:32:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400674.1636233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9X-0004kd-VW; Thu, 27 Aug 2026 14:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400674.1636233; Thu, 27 Aug 2026 14:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzb9X-0004kU-Qz; Thu, 27 Aug 2026 14:32:27 +0000
Received: by outflank-mailman (input) for mailman id 1400674;
 Thu, 27 Aug 2026 14:32:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wzb9V-0004Xj-O0
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 14:32:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzb9U-000Qzn-Nl
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 16:32:24 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a65-e002-0a2a0a5209dd-0a2a4504a44e-36
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:24 +0200
Received: from [52.101.66.83]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a904a78-b57f-0a2a45040019-34654253f636-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 16:32:24 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AS8PR03MB6742.eurprd03.prod.outlook.com (2603:10a6:20b:295::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 14:32:20 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 14:32:20 +0000
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
 b=iYxQHlnJyjKKzdnSVq67W1dwMPg2h0rJxjh7tyeKrDQ3g1DPjJHoj7hR+FHj4HN7UCZuKHTDVidPbbzSizzj1Krk15V8XBWWCb2dWalKBe0on1kIaI92/PcmonR9a0+xWqy1YKC23jV/+H4Pa1/4juX68Gq6OxEnSxpZDaXG26EpxhtpijbK5A0NAthfDF3KKFtrdXgSpgwUrMFJVMDcW+dQ5T7UeEuVPTS8tB6egfk6NbtGPgLgD/23uvuQRAE+ExoOTCbhyHX7yggIn3lCfIF/tybyknSG5epH73wz+KHTRJXJBKQW6Gau50H9LbBGoYxpdXtIzH4dlKMEqPkctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jO7EUGeyoQEGGunXwzy8J/17wNQG1UNxL9yQPMYMpUM=;
 b=FECQXFU5DcD27dGpjREAaUfIkK+S/GhaC9AcOh5+sTvb/dhWsLMx36SlEeBM9ii7aBiDehkX/SGsjvzG63LOd/NF4vWniU7lxGFScRZNN2uAE3cVcnfx/8+KzWkpxTRUap2dcqSYsVPp+kRQNZF222IA8PqcK/CUcIwPL+dJK0ZJPLX/y1IG9Ff2zZol2ZMam3oe4ZLWg0OjfE5O5RDXYnNNYzhWDZtup4YT3E5GVvrIstK+StEvS2u4w7ZLO9kxFC11CRtrO6Fen0wxedCxePOJcezDY9xIvT+iWjRoMLlhk0FkpJF5J2DYYhCcCKeeHIw6TdtSc1bWL6wSWgy30w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jO7EUGeyoQEGGunXwzy8J/17wNQG1UNxL9yQPMYMpUM=;
 b=Dg1NGSTQKu7nn8YMgjzm/m0+VnKVg2ON2TfcCEc7BySrm/E7M2mN36KEWQdu/ltBG+ohrnhgJbR+yCOhJtqGlmIYqdwd09QO8VelCEyQLPguX/utnRbF6y4JpC/srA6jVv/rw0NYMrD8X7Fyx9kGsB/U5AEyskUukNoL5tYmwPZk1Ibioi6LjUAol8GSxRL3G2QuSAgNVyV6fjI4bzS1c49BpU3+dGwB3CxhhqZe3E8eIqYT0bkn8vw++kIZm9yE810vYPhGuYJWH80pnFHvuvEiup6H6SGjlz716tV8wfhG6ABwCKgu42FapUJSMzkgMEfCBJX5y4hslchjplb7Fw==
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
Subject: [PATCH v12 02/13] xen/arm: gic-v2: Implement GIC suspend/resume functions
Date: Thu, 27 Aug 2026 17:31:50 +0300
Message-ID: <dbdba04cd531cf2f3ccfc0b7e8dbcb4925b25055.1787838455.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: c123b811-6289-4549-c1f4-08df04480071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|6133799003|20046099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	EmrXMXhfj4/P4YvmOLEYQWu5greyJ5ehdEhsdGDAP4xwkBOg+PxAtj2KMhyGTxHspKkffc7Pszamzu6otGAnWneT7Ha+SA08y9taGjzUV/puWvxG8cZoHlNG/McywrXqD4DsS6qhPh+vqxSpyZV6+xhIh55GiMIdl6z0/H4aRnFfWr9GN9xvCAzhHwuVL5MTPToafN8pN+eRaGzPfIxqb8HWggae3dz5uNszQ2FQVkK0FH16ZafI4dIsZ/RjrN+FhmgcYaMTMp+Bga+2MRxtRwQ4aHl1AdMJabqVQO++b9cShi9GVynpfzlvgr7Ve96XjRb0HsYXBprC22zY8oBMV9GDWw4qPKbEAz2wdKgZvh6jJXqZvKOT3FW04AKqNb0lJPWA0b9lVI+ZTnBC3f/z/f0JRnQM8B66qhWVJD5P0qWalji1A0AIX+GdFLuhMZb81VXThxZsJVwanS1mTkWx771CsMU2k3m8VyWhi0UysY4QPZvtah3e3vku5+0IbfOOaXaEZ7D8BnLhR7n7iIcd4U1MpTtjNlaNFpVnDvRbg2xXGyT755oIhAzLvKr01V8hBE7tbBltlMHLZcSPmNzOOo1Mx6JoG91TFIH/VVMm8VIjDkWPOs85qcUC8My3qK1VtKBsELbVxJBMKn+lCXp6Z7/Wmso2ZsCFOcW8Da9PjKg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(6133799003)(20046099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uNrEU7rER3V4KaWm21YaeHq9bkIdZfihcn1R7uE4anS3a2W3Ts08O1jomVd+?=
 =?us-ascii?Q?FlJALKLpnY4lkd2ESwGspBRQePOo487H1MBgey8BloDtDc4kA4Qi1EMCa2+1?=
 =?us-ascii?Q?gu5aSIAPhTy4o4T4zbPUyqApZ0z6GZcLY15XBR+pwkBSJJrUfsB92gZFyS7V?=
 =?us-ascii?Q?KM526Y1L3TwjvKPgkDtNgbF4jA0ytXf+aCn2dOcvrxWYDSSowJXlo6hvvkZs?=
 =?us-ascii?Q?a1ulH4+ZO4LVSqUxwleF+/kepmhAPrcDElcqJ+SSjiiemBHgooA+PPaBqdaj?=
 =?us-ascii?Q?yEzruv4ROmaoDgS8vQZpWkxwtik3pqfy7g1Pccrlg/MZUR5TFmkss+AepZwr?=
 =?us-ascii?Q?v+isupxu6rzhcS0CWGxnAbhxQrtp2CFaX4JDNeR3WkE0wE+Bb5oJhmrbDd2E?=
 =?us-ascii?Q?EYgIt2vyUKqYsDbwBCoVBz66f8Cc9kAR1p8wNvZ7cNI1Vuf5UglGfWrCXDlf?=
 =?us-ascii?Q?DzjMNfy0rSh8SDvzz+EPW/eI1s80+cXd8kcXkN8Nx6lY5YsC74UmnEzRYj9d?=
 =?us-ascii?Q?7woBHsA29FvtLeTHuC8qsHsC6XEndm0smJxI/hZprN3A7H9Z/LPSesF4eRpS?=
 =?us-ascii?Q?T/L2GAyNSv/Ap17fmg9fhsyQ1iJguQxvZA94wtC7ha+4kxLLTQ+MD/zzbnNq?=
 =?us-ascii?Q?ZmOKh0ON0J3FKPENCnzzJvYgkjCPpQo1s6ZdQh0DavBPH3OfgigCQa3MSlqF?=
 =?us-ascii?Q?z7NPtv70mH5OUy/s6m2cHENWp4milrU1/hJdjIygoyvaM7amdkvOeHH2recj?=
 =?us-ascii?Q?XaieRTkMjF3WlSGL3cWz6lyHngfPyPWNWxKraFEy0yf015sw74J0VVBrBf/k?=
 =?us-ascii?Q?z7sEE8UH5KXVbxByPCastSUOkBGMafharWH0cVrlzxA4fJCw7xdpDgIaFp50?=
 =?us-ascii?Q?q81ec+3GQnyFq1IjfgynCZr2+E0pln2eivcv1+PGSrLutlj/7vNEa7rKODCY?=
 =?us-ascii?Q?drvbl8odirOdBlqZPUgpcuXavNeJyxcNt42YhWw9x7WET8iQx1pNsk8eZpzR?=
 =?us-ascii?Q?kkGlvgPdiQc97iY6qJncpqu9DbmJoki5z2QNCcMkFYfiXeo8O6fA+i/LIqdp?=
 =?us-ascii?Q?SH68SM/nl0/zed8JkUlLml+BQE6JaMVZONe4txjF42m47yY0G3J8afSZT/Kr?=
 =?us-ascii?Q?gy58fG/07+XdoiceT3JlPgrkVGFyRhdJ6tSwVRAPPqTi2Ada9HOr0jY35wEd?=
 =?us-ascii?Q?rzY8sxRVLHErhZmrbSiRIUAPFmevAjygxtd9upy+vHfnwwv5Z9p2lYYk+P2b?=
 =?us-ascii?Q?wCAVqW0UGd1aEJjSqlDwIx8ZRHFfTqeueEG9r8/JhT0D3jz+4n7SJdhy5Fk1?=
 =?us-ascii?Q?HjBRIKF8scWUJ4yunZjY/f7pKXRzX3giJBwU2HohhUj2ytlUgBaejGahkmTp?=
 =?us-ascii?Q?KLSAMr29kyGjZjs6v18RaEljN5ahFBp+/Pzpia6uUdyGyiNjy9rK6VXjeDwQ?=
 =?us-ascii?Q?bneaKIFmZMERr9kshv3mm6WXiA3YJ0HtR9vYevz9RYjvMim+ybaV1fu+t1Lb?=
 =?us-ascii?Q?pE6AQanwwojZ4955C5wPHRrFRzzXhDEn8OPRKkYUt2JE/c6bg7GCwfQwIjg7?=
 =?us-ascii?Q?DwvE0GPuxT5eJPqtp2fgP4XmgZRnC0S+mk0AQCCmWtDw5oZKopUMo/AoxV8O?=
 =?us-ascii?Q?EovrLb56e5A666bqp2FNoRexA67npqyhGyLXQC+d61yeAgeyCsRejkm889R1?=
 =?us-ascii?Q?nl6g6nVXbDmVG7IjmrpqJiSQ/BRxg5mHCNhdpJtDLAhF5PGsO12zZFwemCeY?=
 =?us-ascii?Q?bKct9cBY6g=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c123b811-6289-4549-c1f4-08df04480071
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 14:32:20.2975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhfOi/q1aHvvO1+baLhxV7V9yeiPN3594GCFsUarsFPUDtoZBtOz+lnKEhZujEwM4bHO2ETLmAmt4/b3ywyIkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6742
X-purgate-ID: tlsNG-ebf023/1787841144-C20D5B50-D8DA8AA3/0/0
X-purgate-type: clean
X-purgate-size: 13573

From: Mirela Simonovic <mirela.simonovic@aggios.com>

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.

Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.

Transient physical SGI pending state (GICD_CPENDSGIRn/GICD_SPENDSGIRn)
is intentionally excluded. CPU-interface active-priority state is also
not restored across suspend/resume. Xen reaches the final suspend path
at a quiescent point, so there is no active-priority execution context
to replay after resume. Enforce this with a runtime check after
disabling the CPU interface: if any implemented GICC_APRn word is still
non-zero, restore GICC_CTLR and abort suspend with -EBUSY.

This does not apply to distributor active state. With GICv2 EOImode==1,
EOIR only drops the interrupt priority; final deactivation is a separate
step. For guest-routed interrupts, Xen can have already EOIed the physical
IRQ while deactivation is still pending on the vGIC/GICV path. Therefore
GICD_ISACTIVER is preserved as architectural in-flight interrupt state.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in V10:
- Limit GICC_APR<n> active-priority checks to APR bits visible from
  the Xen CPU-interface view.
- Avoid touching reserved GICD_IPRIORITYR/GICD_ITARGETSR words when the
  last implemented interrupt block is partial.
- Restore distributor configuration before restoring interrupt enable
  state, so GICD_ICFGR is written while the corresponding interrupts are
  disabled.

Changes in V9:
- Skip saving/restoring GICD_ITARGETSR0..7 because SGI/PPI target
  registers hold no state (read-only on MP, RAZ/WI on UP).
- Add a runtime GICC_APRn quiescence check after disabling the CPU
  interface, and restore GICC_CTLR before returning -EBUSY.

Changes in V8:
- disable cpu interface + distributor before suspend
- change 0xffffffff to GENMASK;
- cosmetic changes;

Changes in V7:
- Allocate one contiguous memory block for the GICv2 dist suspend context.
- gicv2_resume() no longer unconditionally re-enables the distributor/CPU
  interface; it now writes back the saved CTLR values as-is.
- gicv2_alloc_context() now returns 0 on success and panics on failure,
  since suspend context allocation is not recoverable.
---
 xen/arch/arm/gic-v2.c          | 226 +++++++++++++++++++++++++++++++++
 xen/arch/arm/gic.c             |  29 +++++
 xen/arch/arm/include/asm/gic.h |  12 ++
 3 files changed, 267 insertions(+)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 43a379fdda..a0ef6ffc7f 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1108,6 +1108,223 @@ static int gicv2_iomem_deny_access(struct domain *d)
     return iomem_deny_access(d, mfn, mfn + nr - 1);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+/* This struct represents block of 32 IRQs */
+struct irq_block {
+    uint32_t icfgr[2]; /* 2 registers of 16 IRQs each */
+    uint32_t ipriorityr[8];
+    uint32_t isenabler;
+    uint32_t isactiver;
+    uint32_t itargetsr[8];
+};
+
+/* GICv2 registers to be saved/restored on system suspend/resume */
+struct gicv2_context {
+    /* GICC context */
+    struct cpu_ctx {
+        uint32_t ctlr;
+        uint32_t pmr;
+        uint32_t bpr;
+    } cpu;
+
+    /* GICD context */
+    struct dist_ctx {
+        uint32_t ctlr;
+        /* Includes banked SGI/PPI state for the boot CPU. */
+        struct irq_block *irqs;
+    } dist;
+};
+
+static struct gicv2_context gic_ctx;
+
+#define GICV2_NR_APRS          4
+#define GICV2_APR_BITS_PER_REG 32U
+
+static int gicv2_check_active_priorities(uint32_t bpr)
+{
+    unsigned int i, apr_bits, nr_aprs;
+
+    /*
+     * Xen writes GICC_BPR to 0 during CPU init and does not change it. Per
+     * IHI0048B.b, a write below the implementation minimum reads back as the
+     * minimum supported BPR value. Table 4-47 maps that Xen-visible BPR value
+     * to the visible GICC_APR<n> bits. Avoid reading APR registers outside
+     * that visible range.
+     *
+     * This covers both GICv2 with and without Security Extensions.
+     */
+    apr_bits = 1U << (7 - (bpr & 0x7));
+    nr_aprs = DIV_ROUND_UP(apr_bits, GICV2_APR_BITS_PER_REG);
+
+    ASSERT(nr_aprs <= GICV2_NR_APRS);
+
+    for ( i = 0; i < nr_aprs; i++ )
+    {
+        unsigned int bits = min(GICV2_APR_BITS_PER_REG,
+                                apr_bits - i * GICV2_APR_BITS_PER_REG);
+        uint32_t mask = GENMASK(bits - 1, 0);
+        uint32_t apr = readl_gicc(GICC_APR + i * 4) & mask;
+
+        if ( !apr )
+            continue;
+
+        printk(XENLOG_ERR "GICv2: suspend aborted: GICC_APR%u=%#08x\n",
+               i, apr);
+        return -EBUSY;
+    }
+
+    return 0;
+}
+
+static int gicv2_suspend(void)
+{
+    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+    int ret;
+
+    /* Save GICC_CTLR configuration. */
+    gic_ctx.cpu.ctlr = readl_gicc(GICC_CTLR);
+
+    /* Quiesce the GIC CPU interface before suspend. */
+    gicv2_cpu_disable();
+
+    gic_ctx.cpu.bpr = readl_gicc(GICC_BPR);
+
+    /*
+     * Check the active-priority state for the group Xen drives through the
+     * CPU interface. GICC_CTL_ENABLE enables Group 0 without SecurityExtn and
+     * Group 1 in Xen's Non-secure view with SecurityExtn, and in both cases
+     * the relevant state is visible through GICC_APRn. The APR layout is
+     * implementation-defined, so only test the bits visible from Xen's CPU
+     * interface view instead of reading every possible APR register.
+     */
+    ret = gicv2_check_active_priorities(gic_ctx.cpu.bpr);
+    if ( ret )
+    {
+        writel_gicc(gic_ctx.cpu.ctlr, GICC_CTLR);
+        return ret;
+    }
+
+    gic_ctx.cpu.pmr = readl_gicc(GICC_PMR);
+
+    /* Save GICD configuration */
+    gic_ctx.dist.ctlr = readl_gicd(GICD_CTLR);
+    writel_gicd(0, GICD_CTLR);
+
+    for ( i = 0; i < blocks; i++ )
+    {
+        struct irq_block *irqs = gic_ctx.dist.irqs + i;
+        size_t j, off = i * sizeof(irqs->isenabler);
+        size_t nr_regs = ARRAY_SIZE(irqs->ipriorityr);
+
+        if ( i == blocks - 1 )
+            nr_regs = DIV_ROUND_UP(gicv2_info.nr_lines - i * 32, 4);
+
+        irqs->isenabler = readl_gicd(GICD_ISENABLER + off);
+
+        /*
+         * Save distributor active state as part of the hypervisor-owned
+         * physical interrupt state. In GICv2 EOImode==1, EOIR only drops the
+         * priority; final deactivation is separate. For guest-routed
+         * interrupts, Xen may have EOIed the physical IRQ while the guest/vGIC
+         * side still owns the deactivate step. Therefore GICD_ISACTIVER can
+         * legitimately remain set even though transient SGI pending state and
+         * CPU-interface active-priority state are expected to be quiesced here.
+         */
+        irqs->isactiver = readl_gicd(GICD_ISACTIVER + off);
+
+        off = i * sizeof(irqs->ipriorityr);
+        for ( j = 0; j < nr_regs; j++ )
+            irqs->ipriorityr[j] = readl_gicd(GICD_IPRIORITYR + off + j * 4);
+
+        /*
+         * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to save:
+         * they are read-only on multiprocessor implementations and RAZ/WI
+         * on uniprocessor implementations.
+         */
+        if ( i )
+        {
+            off = i * sizeof(irqs->itargetsr);
+            for ( j = 0; j < nr_regs; j++ )
+                irqs->itargetsr[j] = readl_gicd(GICD_ITARGETSR + off + j * 4);
+        }
+
+        off = i * sizeof(irqs->icfgr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
+            irqs->icfgr[j] = readl_gicd(GICD_ICFGR + off + j * 4);
+    }
+
+    return 0;
+}
+
+static void gicv2_resume(void)
+{
+    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+
+    gicv2_cpu_disable();
+    /* Disable distributor */
+    writel_gicd(0, GICD_CTLR);
+
+    for ( i = 0; i < blocks; i++ )
+    {
+        struct irq_block *irqs = gic_ctx.dist.irqs + i;
+        size_t j, off = i * sizeof(irqs->isenabler);
+        size_t nr_regs = ARRAY_SIZE(irqs->ipriorityr);
+
+        if ( i == blocks - 1 )
+            nr_regs = DIV_ROUND_UP(gicv2_info.nr_lines - i * 32, 4);
+
+        writel_gicd(GENMASK(31, 0), GICD_ICENABLER + off);
+
+        off = i * sizeof(irqs->icfgr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
+            writel_gicd(irqs->icfgr[j], GICD_ICFGR + off + j * 4);
+
+        off = i * sizeof(irqs->ipriorityr);
+        for ( j = 0; j < nr_regs; j++ )
+            writel_gicd(irqs->ipriorityr[j], GICD_IPRIORITYR + off + j * 4);
+
+        /*
+         * GICD_ITARGETSR0..7 cover SGIs/PPIs and hold no state to save:
+         * they are read-only on multiprocessor implementations and RAZ/WI
+         * on uniprocessor implementations.
+         */
+        if ( i )
+        {
+            off = i * sizeof(irqs->itargetsr);
+            for ( j = 0; j < nr_regs; j++ )
+                writel_gicd(irqs->itargetsr[j], GICD_ITARGETSR + off + j * 4);
+        }
+
+        off = i * sizeof(irqs->isenabler);
+        writel_gicd(irqs->isenabler, GICD_ISENABLER + off);
+
+        writel_gicd(GENMASK(31, 0), GICD_ICACTIVER + off);
+        writel_gicd(irqs->isactiver, GICD_ISACTIVER + off);
+    }
+
+    /* Restore distributor control state. */
+    writel_gicd(gic_ctx.dist.ctlr, GICD_CTLR);
+
+    /* Restore GIC CPU interface configuration */
+    writel_gicc(gic_ctx.cpu.pmr, GICC_PMR);
+    writel_gicc(gic_ctx.cpu.bpr, GICC_BPR);
+
+    /* Enable GIC CPU interface */
+    writel_gicc(gic_ctx.cpu.ctlr, GICC_CTLR);
+}
+
+static void __init gicv2_alloc_context(void)
+{
+    uint32_t blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+
+    gic_ctx.dist.irqs = xzalloc_array(struct irq_block, blocks);
+    if ( !gic_ctx.dist.irqs )
+        panic("Failed to allocate memory for GICv2 suspend context\n");
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #ifdef CONFIG_ACPI
 static unsigned long gicv2_get_hwdom_extra_madt_size(const struct domain *d)
 {
@@ -1312,6 +1529,11 @@ static int __init gicv2_init(void)
 
     spin_unlock(&gicv2.lock);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /* Allocate memory to be used for saving GIC context during the suspend */
+    gicv2_alloc_context();
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
     return 0;
 }
 
@@ -1355,6 +1577,10 @@ static const struct gic_hw_operations gicv2_ops = {
     .map_hwdom_extra_mappings = gicv2_map_hwdom_extra_mappings,
     .iomem_deny_access   = gicv2_iomem_deny_access,
     .do_LPI              = gicv2_do_LPI,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend             = gicv2_suspend,
+    .resume              = gicv2_resume,
+#endif /* CONFIG_SYSTEM_SUSPEND */
 };
 
 /* Set up the GIC */
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 078049e741..ffc11f36a1 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -438,6 +438,35 @@ int gic_iomem_deny_access(struct domain *d)
     return gic_hw_ops->iomem_deny_access(d);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+int gic_suspend(void)
+{
+    /* Must be called by boot CPU#0 with interrupts disabled */
+    ASSERT(!local_irq_is_enabled());
+    ASSERT(!smp_processor_id());
+
+    if ( !gic_hw_ops->suspend || !gic_hw_ops->resume )
+        return -ENOSYS;
+
+    return gic_hw_ops->suspend();
+}
+
+void gic_resume(void)
+{
+    /*
+     * Must be called by boot CPU#0 with interrupts disabled after gic_suspend
+     * has returned successfully.
+     */
+    ASSERT(!local_irq_is_enabled());
+    ASSERT(!smp_processor_id());
+    ASSERT(gic_hw_ops->resume);
+
+    gic_hw_ops->resume();
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int cpu_gic_callback(struct notifier_block *nfb,
                             unsigned long action,
                             void *hcpu)
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index ee2c26adb4..29bb9a89a4 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -301,6 +301,12 @@ extern int gicv_setup(struct domain *d);
 extern void gic_save_state(struct vcpu *v);
 extern void gic_restore_state(struct vcpu *v);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+/* Suspend/resume */
+extern int gic_suspend(void);
+extern void gic_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /* SGI (AKA IPIs) */
 enum gic_sgi {
     GIC_SGI_EVENT_CHECK,
@@ -444,6 +450,12 @@ struct gic_hw_operations {
     int (*iomem_deny_access)(struct domain *d);
     /* Handle LPIs, which require special handling */
     void (*do_LPI)(unsigned int lpi);
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /* Save GIC configuration due to the system suspend */
+    int (*suspend)(void);
+    /* Restore GIC configuration due to the system resume */
+    void (*resume)(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
 };
 
 extern const struct gic_hw_operations *gic_hw_ops;
-- 
2.43.0


