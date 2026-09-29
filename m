Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E8ACA5FA7
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 16:54:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436603.1655280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBb6H-0003Md-2L; Tue, 29 Sep 2026 16:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436603.1655280; Tue, 29 Sep 2026 16:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBb6G-0003L8-Sq; Tue, 29 Sep 2026 16:54:40 +0000
Received: by outflank-mailman (input) for mailman id 1436603;
 Tue, 29 Sep 2026 16:54:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xBb6G-0003HP-8J
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 16:54:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBb6F-003jmL-LN
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 18:54:39 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abbed42-2eae-0a2a0a5409dd-0a2a4503d2f0-18
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:54:39 +0200
Received: from [52.101.83.101]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abbed4f-fae8-0a2a45030019-346553657984-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:54:39 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by DB4PR03MB8683.eurprd03.prod.outlook.com
 (2603:10a6:10:383::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 16:54:37 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 16:54:37 +0000
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
 b=P+I68sxROKNn+g0742alxp4KhJEwdhc3H7oa4M+O9jT2khSiiIUnAPpnUusgcUi+MkKj1PQOhRgqwTyGyEhQgT3Jfy74qiNJRWsJn5VT/EhdutlX06ao5c+Dn4ggBsOf2HE3fR8m4SqbyxsC+dD6NqIGWCnUq7We+xQlSOD7nphdY0kx8BCYj9cVEtNjRaWntB0sqFWiVXQLrigZVA7vwb0UisLXzi6ZIOaizY32hNXjnVCQOdUPaNEqAb+exTiSbghwqaj02FvKVf+v88YZZBfwdQVeJ+DwvvFCoeRVElLnfl5Gtue8PwxY9gOg1Hn2BO0/UWIe243gg/HKYxBNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IH3xPQ+L9yzS73QPVspMW+9Dout1AnvnKDszraMkDco=;
 b=CoeYPINpVZeD9C6oVfxFJCPZwSzoG+aosktiZubTD+oavdQgeEAsOJrF/sXDteQqafJhwx6xNN2WcIGlYFUTztci+/sKTkeJgAgtWLEOhEwivLlqpAhlnimK9aCD/Wa1PTbbhNAXp26V/4FGhTRH34nLrOcGIWzWqvma779QKqYHJPkHfsDOxJoV///ioSeWI/+ONF2+vHGhNcFjZOtSqwY2asCSHMfRYoptrdOXXAoytemzkS5e801okSd3b6pjd8XYo17SOE661o9/zfO+d8zAldcmXHtkUi4zv+rz9zIwPmT9g/PDuFd4KnP6acNwJBr0BYozvm3e5SJBjDnwXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IH3xPQ+L9yzS73QPVspMW+9Dout1AnvnKDszraMkDco=;
 b=YKp2HwBWc56mdFOJIkLqvn6PQr+4J+zLj1+kbfu0kJWu0VkHjvKgwv8qUdljznJRId06q1GFEe8rqP+9A4knrjyi50VGQF1/CqTOQ1rJ18eONYgGVtmC8kVKPvhH6EWUufUtt9sH1pOUncX5HUeOo1pJTINDYSkUpP/KRiCo/ukbPKXOcRFWPMf1bwtVg+3fbmIjJLIgqfy61atDluYk03RxfHpfNqyUGluaqsaSRlmFkgvYzP0n61bvPw54CdehAGoggpDPriSqh7w+15tbWBxR9hpFbNcxb0shDD2cA6GZjbS7X16pcki3xbMEI03ChFY1Dp+180IPsvLbxTAoSg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v6 2/4] xen/arm: make is_espi() a pure range predicate
Date: Tue, 29 Sep 2026 19:54:10 +0300
Message-ID: <caa88e5271f790982d7711fbdd2b676a43ff28ba.1790699282.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790699282.git.mykola_kvach@epam.com>
References: <cover.1790699282.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIUP296CA0096.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35c::10) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|DB4PR03MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: fb22d5a0-2a4a-4a64-2d88-08df1e4a5897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MSx2EKFLtpAbFy/ifNNYkuO+yG5GyYtI+J6r7GhbPTUpAgzy0UE1Axe0rsk/V8Wb8wvl2pLPnmer74fbapOUCEjKWgI+cVnEzTFCR3OF11m6wgS+yeoaAhdbsszAw7a1EPVbEbRGPXvOI2dcMJsHlQ1EYErUwEiF4bJqIJZ54xcuBgFbZ3nrbPNWlfJnRCtSJ68VVlgyoGJVRq1NZR+WQqkKjqQjEWqsJ5Dd1HF//q5MQNYCrXjR/EAFJCkPQXTQYaU4pEWuCFtfm9+d74cXXMtBGxrVVeB6nIdUnTBpneaxmdeoepln7SNwTx3FzOarqLpIgxILXerTO8owTngloY6TMS4DCE4KnY1uH6TqZbD6uM7cCjLzBq09RCgAVFOkenPnZBKTqWa4nni+E25k+sG0JbtaFDmQ3FTprcnBXBS049dK+QbmlQegqBep+pMjcE5EwCx2GiU7R6jPRVYA45RB4RH/9YVhxuFo2nJi1CRd647LWQAmdByvaDie2KxUmD3HEf4cUgBsaeeAHiXpoOpTT3PIcUsaAgVEyJZ5EH+h3D+4Vqmmw6VtUSFWHxmr1NLamtPdZ+VLu7hqAdVxx/UFqaygpXGji0knTdFZObA1qkZzpgfL4FMzvlpy4A4kj2PTjUS2eJiJLzQ18VVLcfo0dq3eDsVJPqv3XybNT2I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mmolv0hHdxklsfvjOBAY7+/GSOfCIEKu7TWhM8Ks4hgxZyGwQfR+UQivyrr7?=
 =?us-ascii?Q?Xab9NpDlsfMnphUdkDb68MctKzky8ZbOMaQ/Ii9Jj/xiDZsG1Jyd8+82LFjK?=
 =?us-ascii?Q?U5i0CfsMckfyJE+pWvoO22NoDnC2/W83jShCdB2yhlMNJ27/7evlrjfhs8ZN?=
 =?us-ascii?Q?hHkv3AsTaIsMhNpURh/gTLzVYpMr5FMtWcP13e0NeEOv/dswRPouLabqvT5X?=
 =?us-ascii?Q?6cfQcwEaodgM58AdhbOtTuwkM6kJ8CnrpkCpZ8+RJH1f4sclNnmqHJ4W7PuC?=
 =?us-ascii?Q?hcZ19ZVpcJxUOY5rt+piphJqDlMnPqEJzzm1yU2+zi4fZx+nizDYPJpC+YGM?=
 =?us-ascii?Q?d4jp1hdVU+FG3VumaB+znNcOPAxgc1dBEf2LxTNz4QoHYPgBg+7Yq6A6wOS+?=
 =?us-ascii?Q?JVzGgGPDDH6gug+FFLAbTwLQjWg6w9oQU0ArxTsvuh+PTNFvpMLVY5ErQ6Ni?=
 =?us-ascii?Q?wzP2SPvqRKkroi0pgllfsf3Miuyty4NssvEh7jlnN3j0E/hdnBGne1+xMqRC?=
 =?us-ascii?Q?jED8wYn2sKEt3EuWHaMrPXmRvN7VlsViZWXV5+uNTXU9wzjLOpudtFJVNmbA?=
 =?us-ascii?Q?oS9pX1LTTDO9NffeJFUNeFVAc0h1j1LeJLG6N9hpO28adzp1d+D2RlGV0Eo2?=
 =?us-ascii?Q?9/r+DaLHv5DLZY4NP+PWlBQC9bYEIXimaZ3spXjwH/WkeT5gRJ7Da8jus0sV?=
 =?us-ascii?Q?HO5o+wltlKJovbJQE1pyWi1HM3zJSZ7+UnBodbCW54MnGacHmrDRiy6jld2H?=
 =?us-ascii?Q?S7sWFyI24lQbQM5ES3DIBU4UtzHk3aNEKpTx9YX4gigMSoT0eKH3pru5qrtn?=
 =?us-ascii?Q?QKOw7q4a0XTBNb6OrqRlDgCSyZA5S5PNahBrXazyDDH6K9St1i3CYT0d8zj8?=
 =?us-ascii?Q?4V7BxLKcj87NUDjlyDrJSwHtZSlPlYipKwIuqs1FkbhgSesTPuQZhojrMUMW?=
 =?us-ascii?Q?+p8Uk6fhJ2s/mzmtZdG9eo+TFqjt/2JPu9TEeDSIXV/OdYsajEQdVzO8wzXJ?=
 =?us-ascii?Q?t/t3duC6eXCV+mm47jdyb5m/zzSb6kBIqDTQy4OchHpRMrnCx64x9o6o+Hc/?=
 =?us-ascii?Q?XrpZ/7C9NEXZoWYTrk2bQLjlSevrwn2rQ2mCYxV90m/fbw9ffTWdt91B1TqN?=
 =?us-ascii?Q?FoJ/ptpFiL4PXjPmCT6NIevtwV5z3d9XtpHS5y6dWbylDMruOrqi6WvcYNte?=
 =?us-ascii?Q?rEJBtHbXwEXsi9/D+E31B4K4w/nqZ85lFVLW5l48yUiyuQg6qwsICaDqx86K?=
 =?us-ascii?Q?0h+HQMUgILo0ppa7RX0+NMmdiWP7IbO9ubVwUu9q7l20fEPOPAmMXVsGvXLw?=
 =?us-ascii?Q?jK5HYHRsyM6GQ+e+Z3JisIOpqs6pWMI3AHauNv5SsRVSvOeyCcS3NeVVRJKn?=
 =?us-ascii?Q?tRUEwbD0s+rlwuhtCR6QCgh+8gy8gZplttf3AEr79xEDylv/S9lRRISGkw24?=
 =?us-ascii?Q?mH89CrqNZ/OUJTxbOY/774vkB/dHIJ5MuuAKKPzJKSWjLsemjC8PsGTofBQ+?=
 =?us-ascii?Q?XCwxUb8M/XQ3uAecGFdwikGx6u+YiSSdsDkk2hFseNcKohaV1tHY2Fw+n4hf?=
 =?us-ascii?Q?MTtjsFhGr/11rE08l4jgDr+GkCGSWldV7rciqwi1W6BJUHzzTbOi7YniT1Jj?=
 =?us-ascii?Q?OAUhAcDdPRCFcsag7R6yshaQaY0f1nMZ1QHed0kpp1tnY0qdGQC9Mui+A8KD?=
 =?us-ascii?Q?G1Xg5QwxoXnc4bNRFAS/Np8J3ugmnMp2/ggyXCdBWY3h5Umv2hwjiULMKb5N?=
 =?us-ascii?Q?ICRTrefAEA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb22d5a0-2a4a-4a64-2d88-08df1e4a5897
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:54:37.3762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZ+orUUSfakxwUh7tjvr3SkoQclPmEEw9mCNfTYjvGJMYacBgtAxiN8NJTv0XqTuIEtmX4qSU5iu0ZifKk9ymA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8683
X-purgate-ID: tlsNG-33051d/1790700879-6DED24E9-8F67298E/0/0
X-purgate-type: clean
X-purgate-size: 5418

is_espi() currently changes its result according to CONFIG_GICV3_ESPI.
Without eSPI support, it returns false, and its assertion fails if
an eSPI INTID is passed. Callers therefore use it both to identify
eSPIs and to exclude eSPI handling when support is disabled.

Make is_espi() report only whether an INTID is in the architectural
eSPI range. Check for eSPI support at the call sites.

Use BUG_ON() if the GIC reports an eSPI without compiled-in support,
matching the handling of unsupported LPIs. Treat virtual eSPI lookup
without support as unreachable, with a NULL return from the
espi_to_pending() stub.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v5:
- Explain why an eSPI cannot be handled without compiled-in support.
- Make both espi_to_pending() helpers static inline and constify d.
- Add ASSERT_UNREACHABLE() to the espi_to_pending() stub.
- Preserve the unmapped LPI comment and clarify that an eSPI lookup
  without support must not occur.

Changes in v4:
- Clarify the existing is_espi() behavior in the commit message.
- Drop the unrelated blank-line removal in vgic.c.
- Use BUG_ON() if the GIC reports an eSPI without eSPI support.
- Drop the redundant CONFIG_GICV3_ESPI check in IRQ dispatch.
- Return NULL for virtual eSPI lookup when eSPI support is disabled.

Changes in v3:
- New preparatory cleanup requested during review.
---
 xen/arch/arm/gic.c             |  6 ++++++
 xen/arch/arm/include/asm/irq.h | 11 -----------
 xen/arch/arm/vgic.c            | 30 ++++++++++++++++++------------
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 6a132c64e1..0e96def2d0 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -353,6 +353,12 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_fiq)
         /* Reading IRQ will ACK it */
         irq = gic_hw_ops->read_irq();
 
+        /*
+         * Without CONFIG_GICV3_ESPI, there is no IRQ descriptor or
+         * pending_irq storage for eSPIs, so we cannot handle them.
+         */
+        BUG_ON(!IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq));
+
         if ( likely(irq >= GIC_SGI_STATIC_MAX && irq < 1020) || is_espi(irq) )
         {
             isb();
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
index 09788dbfeb..c29f3d04a3 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -66,18 +66,7 @@ static inline bool is_lpi(unsigned int irq)
 
 static inline bool is_espi(unsigned int irq)
 {
-#ifdef CONFIG_GICV3_ESPI
     return irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID;
-#else
-    /*
-     * The function should not be called for eSPIs when CONFIG_GICV3_ESPI is
-     * disabled. Returning false allows the compiler to optimize the code
-     * when the config is disabled, while the assert ensures that out-of-range
-     * array resources are not accessed.
-     */
-    ASSERT(!(irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID));
-    return false;
-#endif
 }
 
 static inline unsigned int espi_intid_to_idx(unsigned int intid)
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index e5aca17dcb..0ba13e18da 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -62,6 +62,14 @@ static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
     return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)];
 }
 
+static inline struct pending_irq *espi_to_pending(const struct domain *d,
+                                                  unsigned int irq)
+{
+    unsigned int idx = espi_intid_to_idx(irq) + d->arch.vgic.nr_spis;
+
+    return &d->arch.vgic.pending_irqs[idx];
+}
+
 #else
 static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
 {
@@ -78,6 +86,13 @@ static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
     ASSERT_UNREACHABLE();
     return NULL;
 }
+
+static inline struct pending_irq *espi_to_pending(const struct domain *d,
+                                                  unsigned int irq)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
 #endif
 
 static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
@@ -698,6 +713,7 @@ bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmode,
  * interrupt.
  * This can return NULL if called for an LPI which has been unmapped
  * meanwhile.
+ * This must not be called for an eSPI when CONFIG_GICV3_ESPI is disabled.
  */
 struct pending_irq *irq_to_pending(struct vcpu *v, unsigned int irq)
 {
@@ -715,22 +731,12 @@ struct pending_irq *irq_to_pending(struct vcpu *v, unsigned int irq)
 
 struct pending_irq *spi_to_pending(struct domain *d, unsigned int irq)
 {
-    unsigned int idx;
-
     ASSERT(irq >= NR_LOCAL_IRQS);
 
     if ( is_espi(irq) )
-    {
-        unsigned int nr_spis = d->arch.vgic.nr_spis;
+        return espi_to_pending(d, irq);
 
-        idx = espi_intid_to_idx(irq) + nr_spis;
-    }
-    else
-    {
-        idx = irq - NR_LOCAL_IRQS;
-    }
-
-    return &d->arch.vgic.pending_irqs[idx];
+    return &d->arch.vgic.pending_irqs[irq - NR_LOCAL_IRQS];
 }
 
 void vgic_clear_pending_irqs(struct vcpu *v)
-- 
2.53.0


