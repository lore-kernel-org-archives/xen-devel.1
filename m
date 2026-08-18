Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89333C5DF80
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 11:33:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394002.1632831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwI4J-0007A5-77; Tue, 18 Aug 2026 11:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394002.1632831; Tue, 18 Aug 2026 11:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwI4J-00079s-4L; Tue, 18 Aug 2026 11:33:23 +0000
Received: by outflank-mailman (input) for mailman id 1394002;
 Tue, 18 Aug 2026 11:33:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wwI4H-0006me-1C
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:33:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwI4G-0061ee-C5
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 13:33:20 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a8442f4-bab6-0a2a0a5309dd-0a2a4505b038-40
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 13:33:20 +0200
Received: from [52.101.72.140]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a8442ff-4cb1-0a2a45050019-3465488c380a-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 13:33:19 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by PAVPR03MB9598.eurprd03.prod.outlook.com (2603:10a6:102:301::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 11:33:17 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0315.012; Tue, 18 Aug 2026
 11:33:17 +0000
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
 b=tbclOfyK5EuhcYz/OaT4WR/LYKGNuslTGb8fQ4fYFBIlmd3Nt24odPZabanRmnigCYJI79rQdH8fBRZ1XXLZCWHx/n9wMrDdMTnw2TGODKyV4r5CR8dkTpnrkirWdwNnHIsiqds4GdI/RJX+KJvqQJFMlTtwQqcjWBmezZ+wTlgLCo8QYsHFGT7OLK0sRbnnLcvHaqAOtBbEJCTWYtuYd6gmj6LULvs4gCtJvfqwF3avRXvs8y0XCRXq0I2zLdHdWCOpHl/tzMGe7Hk3KSCFEcQjo4dkTWfdXQR0JKrAQYf1Fbhqz8Yul9Vf5kXS+8QTi+SosfIdgbElc9dsMhNitA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xUZUPUEChfEb02JjA/GupRaagI2/1BMV5nqyehtpb4=;
 b=SgP16vqrgoHEGYIEZlkT1usXOJxK1rU5sIpuZFG5IxZdD5TS7193eO5rafc1eghnQ9Xg1ON0dOcGb/khp8AVyJzybi+xUxFFERxvZFrg5DAUpKjGrOYM9TUfFF++UHm15M/KIqmcpwTeRJg5G8788rfoce82eVze/HDS2lzGyiy5u+/j2sv4qkgnB6jZPO5nVBmAkofbIATx5XKPCp2SWKfIr/xGcd/UwZDkCeF3P2pDPn/Rp2IivYScHJd5PmnAa/MWj22eW+rVoPRTY/X4LpcMD1DTG24ubEPX+lgQfhpQZjCP9Z0DccZ1LH+9FyFKjPJTmZXtk9eYLr/o1MT0Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xUZUPUEChfEb02JjA/GupRaagI2/1BMV5nqyehtpb4=;
 b=CVQ2jr6T1RGvXXBwY9yl8sy4R7Zyi6TWIOFg4MbsKOXVeJXb7ZovKhxuXmWs28RSFd4gPTlteBLfOFXvGqkO2l3sgeTfkUKMRRtHMeV1t0XA0UuDTvn6836VBhwRMFZvfQK/u01E35wiUt4klTF2ATJdUw//rEPp9aH37DWd8qpGGZidH/R7y86Nexqo9NFWWnPrurdEMNuw9oVLoLR1FVIRoWlLoaOQ+X8KIB520nX+G5hhzPc3aA0El6FCPn5TAGS8fB0Eea/zirKV6xMMt9XtKIvUT70eQaLVtopqhQvmxXySSr92zML2++HGmCG4tFepPyBrbe1QxQjsS4XEhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 3/4] xen/arm: vgic: free eSPIs using the bitmap index
Date: Tue, 18 Aug 2026 14:33:01 +0300
Message-ID: <d359777c9fe4c4e1a53b93dea14e36adc4f39e00.1787050437.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787050437.git.mykola_kvach@epam.com>
References: <cover.1787050437.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B92.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::63a) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|PAVPR03MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d8c10c-5afa-45c9-9ef3-08defd1c7f95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1guIF8JLqgK5bnhLQaCJ+bpmn/R9UB9Eqj6ZvhMWevg2ARY2BCWk7UPIWQb33HcFMfJsgQT1vVDuzbeFjF8FhuqwUHkA8+uFCElE/WOFL42ftFaXiHzYaRGIdBetdtE8c057hd6lAHdJGRdN7d+KJTDc/SiNl3fXDuRdInvopjxX/TdI+7ZSlCWjqWTCDvrrMG+kefRDDzVfjxmMlevRS2dyKe8ZWnyzCmENVi13AgW7j3mdp4eMN38JizktSKv88FeCM/XyS5oC1XBmIYgBAfl8JW1hLMnAYQjR8XCZ4al4oMCBncF7EqScfeKNrLrjhfG6kdzWy03iTf6WEwR4uVAaidZ/JeW1/BjBdpR42Rw3Ek1FIyg6x3mtMWJo1MKU/vVBb1VRlb/fU+2zuD8AVh+pEHbv7rDXrPkAgYvqCswqJ8YLFQHBfE9OqkUC9pr9r0pj4iDhUVdtakwYfIjEtHpto/pJJ7JwdgzzeHt9xUybnObGgunFQNU1zfuH2Dk35UVCeFKOX4h8sl3EVmlMRcUiHGgAE6xYVg1yrPx8gJJmnM4FBB87xLgV25FTQrxty+MrXfH/Or2NVa28qlWmc4vFq3KljFEGuTG8NfCr0DIbjr9kU1rGy0XWLxIJjOgOP2Q0grk2iIPbRuqH28SbSRP0tD8HE0pka/o6O1QQjO4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+QUkgr5pSuwR/HNuZMqg5zSnc7P3bRmoR6LE1VJMPKz07KkdIsZyIFytEYjM?=
 =?us-ascii?Q?luDWQj3JH/5qEjmPGu4602K5JzpEnqS2349tdfqEgmL7g1JMnIGtyc25cesA?=
 =?us-ascii?Q?Tw4hVJsp+Au01uP7h/Fm68b3xZNBtocHbqeZSSgC6MOzd1xGmNEnwvKDUcOL?=
 =?us-ascii?Q?7Nb+nE/5itOCQf+cxYyRcz9LHbgcD1/e9CBBsHFNmiYW9OjEW9olQ8hLDSSF?=
 =?us-ascii?Q?yWXPXhOPOsT5pOYbt6mM7MvcL527CR3ZRiPlDHGxcuhFz/vqdvO0J+A644X4?=
 =?us-ascii?Q?HQ83hQIyvODB5D/RI0l1Rbs1uXBZIQh7UvFhFnJSP9UkOz2znayqsW20JMz9?=
 =?us-ascii?Q?1nf4TgwhIFBvsJYJUQqsooGq4hcQ0kc21ek3Bx/U85JLEpQD3zhydW4L1Hyh?=
 =?us-ascii?Q?tj69PmPqH048tzS5BZ29MMzSX361A/q/G3JAKyjEXVLK5QxTNM/2iW3x73hn?=
 =?us-ascii?Q?daOm+wlGIZ1OyrtQlQPK2G1ED3L0b79RkE7nxeZvuJ+0Ln5zCd82ZZGcAHJC?=
 =?us-ascii?Q?xUGpKDKBenNdFK7tVbx/tUYI1LoC/4dBDH0Fc4Cqk+gXIJ50Io17iNPSKky2?=
 =?us-ascii?Q?4pSgnQlsTImxX6zUtkPFSDKZC9COv0q0Ra67N7Wu9le0HpaVuSiyYfaKJjOY?=
 =?us-ascii?Q?pqU2SOZd+9WKaoDzSi6ATrSX1AXEUUHp159BD1WYPNYxomqBgIkKXvKQtzYM?=
 =?us-ascii?Q?aX63oaQ9AH3UicJQmgFyuchWN+I7mWcH/ZOmaMdoBvNODcoazRP6i68T9kZQ?=
 =?us-ascii?Q?O3q8fBTR5L/6BtDJ/dmttKI/QRWUaxmwsfD/17fTgjMxotwmH9pL0UyWUKCb?=
 =?us-ascii?Q?LjAX0Z75l3goS0bIJPRg1L6KXXsgMaD0wijL+gP74ay5kPyqEznorhwg6fm7?=
 =?us-ascii?Q?SD+q9grR6w2NCozn5K/rrEN+lx8PO/mHgR6jzBeneoXcnRihursuYcmVKrjT?=
 =?us-ascii?Q?kc2XSyDHgXS4iYwlnmTUYkfB4Sb+HZrd226JuZ6NK/CmV+FwoIKDCAb+SGNh?=
 =?us-ascii?Q?W3cgEhLgg5HfeOvP2XouPmsYP/ZNVSQpfmFsKDcxEaLdhle/Y3xuCOl0NYsu?=
 =?us-ascii?Q?5lEzRLFVMF1QrxjEu4OArWo8dF4ihYzbLK3jqe2p0IVF2bDmTf2l+KaGa2nK?=
 =?us-ascii?Q?NEPYDfXJB6KyusOfkpxPlsh/rsTqQCDber6KpiwRvGmGI5Z4LROLBn9l84B9?=
 =?us-ascii?Q?ss9ykXb+CwqUYVpEJF35dL/luetTp5eWGUjFCr/1xrY3lGDex9i+bKuoHtTT?=
 =?us-ascii?Q?ZTijhdUbaiDJIVtEMeLw0R+eCUpmo1pvNdYXtdnkoGovQopIg/QVbIHpFx/K?=
 =?us-ascii?Q?3zw1vDMjt7B/bxJE6OYNab48MJee+Lx0KNPboXsSEZOEg8daa7JmGabk8oJv?=
 =?us-ascii?Q?fc4+olTeqjP5emcLCGL1NUTG1/2yP6xNAvjmVr44kG9JVDRYmx+pBQH8/+et?=
 =?us-ascii?Q?Z2fj2xsIf7htUuSu1B45NGypq1Qu315mA7tXlhxfr9iKCWTTFyOMBoLignHY?=
 =?us-ascii?Q?zM1Jjjn4cVwjhaJpMUNTZQoRbkPehJ14X/NZt+ZEK6g/JIPi6vpdwbVzgHYl?=
 =?us-ascii?Q?p5WXZzOu3y2Ci1QqLAytYxMmJP7deU+6KLnFLLpBTs44rhwHkjZyu7kRN4vh?=
 =?us-ascii?Q?Cf6cif8fHlPrX5OWEBW5o+B4Dsn8QanmKMQEkFX/OXoXqwFHWPEuuif/a5C4?=
 =?us-ascii?Q?VfKxAf808Ft/X9gCQqPfirpd0o0QzQFltHONUvfFCei5CygUwY2oHDYneWXq?=
 =?us-ascii?Q?jkqZV3ycpg=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d8c10c-5afa-45c9-9ef3-08defd1c7f95
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 11:33:17.6083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrXAvHs5QcHtM28hbHunu+h+Zjz1Ea6kkbIiDIOfJ/fqkAReipDzgS0WWykn+b538Ho2Rb6d0SDDcteMEB/xeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9598
X-purgate-ID: tlsNG-c201ff/1787052799-F76BD2A1-539AE163/0/0
X-purgate-type: clean
X-purgate-size: 2800

The allocated_irqs bitmap in the existing vGIC implementation stores eSPI
allocation bits immediately after the regular vIRQ bits.
vgic_reserve_virq() converts an eSPI INTID to this compressed bitmap index,
but vgic_free_virq() used the raw INTID.

Freeing INTID 4096 therefore clears bit 4096 instead of the first eSPI bit.
This writes beyond allocated_irqs and leaves the intended eSPI bit set.
Valid eSPIs reach this path during DOMCTL bind failure cleanup and unbind,
and during vPL011 teardown.

Add virq_to_idx(), the inverse of idx_to_virq(), and use it when reserving
and freeing vIRQs. Validate a vIRQ before clearing its allocation bit.

Fixes: bdde400c6e1b ("xen/arm: vgic: add resource management for extended SPIs")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v3:
- Adapt virq_to_idx() to the configuration-neutral is_espi() helper.

Changes in v2:
- Call is_espi() without a configuration guard.
---
 xen/arch/arm/vgic.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index e14123a30a..e541348a5c 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -33,6 +33,16 @@ static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
     return idx;
 }
 
+static inline unsigned int virq_to_idx(struct domain *d, unsigned int virq)
+{
+    ASSERT(IS_ENABLED(CONFIG_GICV3_ESPI) || !is_espi(virq));
+
+    if ( IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(virq) )
+        return espi_intid_to_idx(virq) + vgic_num_irqs(d);
+
+    return virq;
+}
+
 bool vgic_is_valid_line(struct domain *d, unsigned int virq)
 {
 #ifdef CONFIG_GICV3_ESPI
@@ -849,19 +859,11 @@ bool vgic_emulate(struct cpu_user_regs *regs, union hsr hsr)
 
 bool vgic_reserve_virq(struct domain *d, unsigned int virq)
 {
-    unsigned int idx = virq;
-
     if ( !vgic_is_valid_line(d, virq) )
         return false;
 
-    if ( is_espi(virq) )
-    {
-        unsigned int num_regular_irqs = vgic_num_irqs(d);
-
-        idx = espi_intid_to_idx(virq) + num_regular_irqs;
-    }
-
-    return !test_and_set_bit(idx, d->arch.vgic.allocated_irqs);
+    return !test_and_set_bit(virq_to_idx(d, virq),
+                             d->arch.vgic.allocated_irqs);
 }
 
 int vgic_allocate_virq(struct domain *d, bool spi)
@@ -898,7 +900,10 @@ int vgic_allocate_virq(struct domain *d, bool spi)
 
 void vgic_free_virq(struct domain *d, unsigned int virq)
 {
-    clear_bit(virq, d->arch.vgic.allocated_irqs);
+    if ( !vgic_is_valid_line(d, virq) )
+        return;
+
+    clear_bit(virq_to_idx(d, virq), d->arch.vgic.allocated_irqs);
 }
 
 unsigned int vgic_max_vcpus(unsigned int domctl_vgic_version)
-- 
2.43.0


