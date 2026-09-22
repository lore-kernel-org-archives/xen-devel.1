Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946E3C982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 06:40:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428176.1650906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uAc-0004Mg-1H; Tue, 22 Sep 2026 06:40:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428176.1650906; Tue, 22 Sep 2026 06:40:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uAb-0004M6-UI; Tue, 22 Sep 2026 06:40:01 +0000
Received: by outflank-mailman (input) for mailman id 1428176;
 Tue, 22 Sep 2026 06:40:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x8uAa-0004JV-Bz
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 06:40:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8uAZ-008iOm-P6
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:39:59 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab222b0-bab6-0a2a0a5309dd-0a2a4502801c-42
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:39:59 +0200
Received: from [40.107.162.74]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab222bf-6ca4-0a2a45020019-286ba24a3324-4
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:39:59 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by FRZPR03MB11709.eurprd03.prod.outlook.com (2603:10a6:d10:1cc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 06:39:56 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 06:39:56 +0000
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
 b=Xjx2TLcvDjS5EE0l43sBO3t1m8Q9B3yd7dPTcr43HpaGe/iwp6GDHyL9pPy2DiOb6F1ERu5NuFw0IMDyfxULYnyOJVqgEnZ0iWgvMSQ+w3AjouQBgl3shaKICV309de51hSUu1YKL0itHrLyN2F3hUkzXpi/X9OZUxkWr/zlftyYLPbTrrGqeDscWCiUQC0vZdhXdsZ7EbTZkloC6I2D6i93NjpUCYqbLcZvTzZP8ZNw0zXc4owQRBvbJvoKD8BqxfU1E5C41WEqX3ySA2lY7+NaX1W8+6p2msCFdUfiAFBiwSVAkPjaskkf18e187AXvh33vmyQR7wg8HdH6boDfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQ+q+RYL0t82mCteCYDjy8hoTMUCSmEYX+bs4IRR+vg=;
 b=RH0BRtYJY5SZCT5rb8uY5SKTZYYCvHJ8ZvPF9v4YanYuqTirKTVtI63XfV54KiBHnsjDhT1VWj3I6E/8jyivydXlEq91bMeMe0zuNdZqS/8mcFY3eHDAZUSqHCb8pmCFh+9BfKdNypVv3SdIYg6oPhrbxNJIRFQqMavdmkyTKkV1qmaqcNY8kKkV0avLKoH/xBsfSJZIsBbmZrmatGtCSmJp90MDLiUC7MyWKdxSEMc/tWhrwdj3ndLT4JqfZU/2QC9jnuvkGPsD51fyBp/itff5BQKdQVklCJt+jLbS96bSdksLNCtYkh0YOBO7na04ZzMvWXNVo1nDYLm37gQtiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ+q+RYL0t82mCteCYDjy8hoTMUCSmEYX+bs4IRR+vg=;
 b=oKeam5CvwKszz+c541EUTJHq/f/AGVjudsCJUibDoe48w070La+XgjnlEmIUHjxPgZF37YRW0NsgitNMPSk6lMaYbGp21lluXnGuqOZlLy/6KzqTC4y0CSNJbercOsnZ7YUqvM7mnlf6h+S8fHW7HATeOkhnMyh84hP7yIPPeYw1xtDXJtd+I3/fwiSpEEsnYeWC+P20w1PFkNNCHEnKQXhuFTrOQz0Hv7wsI14eZMX1iQpzggwruLUpvnfX7RyeFV3mcHrT++TDY2Iyybi6Npf29BVCaEITn9lQzmaxbz3sXOBAgyIZXqfN9LAj/otvRN7SrxaYlOmcLjOE+LiQ3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 3/4] xen/arm: vgic: free eSPIs using the bitmap index
Date: Tue, 22 Sep 2026 09:39:31 +0300
Message-ID: <eb8e52ee6c227f0fd7d059d1ddfd0de6eec45fe4.1790056623.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790056623.git.mykola_kvach@epam.com>
References: <cover.1790056623.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B7B.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::613) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|FRZPR03MB11709:EE_
X-MS-Office365-Filtering-Correlation-Id: edef451b-d97f-472d-b56d-08df18745016
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3YG9CV5RKJPMbu9y9vn/uLvH8Tacw1wRbzgVTTbewg2vcPm9QkLZUuPDn9xDtSr8ieeIcsY3Jrfe80Ei46Ht9FdFnS8EnG9wEWF8bYcLKiEnAP7/jXTSQfwpR56qFCXSBaBYutUsTKzTKNsmlttAKHhw0W+naDXiqA3H1vrTwMYk2EPIQ0ZlqwndzSmAUNoalHUGKBWkBeBi3RDFHOP47J80Ir/YgHtouv0g8YHietP74B3sRXGGAEzCn7zlS7h+u+8sbglZCs1366HKok25HtBSOpzc6UBXXJAhu4eWEpza6MxN39ElSIE9fCTbQpYBuJnbhU1yIGZccIxR62uixe+jcqE0fEKPxq3MnApWsr4N14t+Nn7C7LMlpuDiUa/1svGnoXLD7RiZ4cyegt3W9eIli6DRpF7R6sCI9nhc7f1DK0zOx5RFWMPRIV3pLdztlHCei+KowpSRkHtlLNgv9UYOfAtLH2afH2CUUmrBO4rEmABqtk2V+B5t2z5lP8eEW1J0dqtx+U2A4ATvozKmLpNWE6onnZnP5/3venLy5UNGNZMu7QTFlM4iD6GtTomdDoH7Y8f8NKq5TUmduwWuNPOodzh7j9pOryUodh/l9gDL4JfupUZ3shkzlJcYgarrOBjCUpHtzbt721AowRxsCHkp0fSgOesujHCzHq1mcd0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yvfjHRSKJZXolZGXmocPgJvoWkJYW09lkLbgT1fud3h6qOPX/Tld/YTf4miT?=
 =?us-ascii?Q?gckeys7CFfNDJwxWs2i+2P1ZaMJ7ju5SYtoCDSQp4lfZ56U5E4IbTepv7hUM?=
 =?us-ascii?Q?mQEQF3iJDXtw4DyxgbtZ9RdiV3Y75R+jw+V3A09HGSvQAN4mshNJMKjuda76?=
 =?us-ascii?Q?IVpu92zJjJaExOLBq4SpFYQ1j+8Cea6hanbabTDNtOEtSCIbHTcsFO9BZtSM?=
 =?us-ascii?Q?5cVJbs+PlfsjdWQlKDB2314wYRFLFilNlukZEpyU2Jgo0oHXC9HM0UZFVZOc?=
 =?us-ascii?Q?TTkekwba14njNE9+dI+HtRjenACswkSuAssgdwkabBkSm3JS8C4wL+5vqWf6?=
 =?us-ascii?Q?738JywFQLMFBDlKZ+NxFB9XqP1l0ifyIgIKxXnFew4L7cekDJDPU28xMDtGo?=
 =?us-ascii?Q?1bA1X2t7Cm/8+wWvM/RqV6iwcqqP5Yn5Z8NaqN9yr43koKe1PlUdanlDT/Gu?=
 =?us-ascii?Q?nebpR0wtVuGnBwRqY69hiIJebCs/EqMxHQMdIwxWDZa9WMZ6dRIpSGzREkqg?=
 =?us-ascii?Q?sfem5nYjQPV00uye7n+LYDx4q41ZUxJBysCZp6wyCbR20cI+x67/YL6OM4WW?=
 =?us-ascii?Q?xsp/EYqmkTlZwq6o2zZkLAxkv6x7HavAKNx2MjmvL6EBAzaMSYFAGMztGjzB?=
 =?us-ascii?Q?3aPrFiIeMYc2z5pFRLi8q4/tTlQcTcox6nPZr+7KwtCR6JzH8Cvlf5CAP9yX?=
 =?us-ascii?Q?xBtnfP0xxjdgR7Jv91NjdMUm/kYK0auXdtL/P9ckuLFm4LAhrJraKIyxcP/L?=
 =?us-ascii?Q?rh61oqBJQapSUaEw4jfh0SLVc5B9eUWsbDsQ9e3m3l7NpA6xQHRrv1vJbbgS?=
 =?us-ascii?Q?C+Ww1yIxQqX7amgOuFbSfsv0Z6FHI1EvUszey2rOU7QZ6YDjs5esSL8Wkzi2?=
 =?us-ascii?Q?RxbHiSBL4ttAuU3v47QFNalRBmOZ3plxLNIyR+NfnfqcQlprxzIGFWyduM5z?=
 =?us-ascii?Q?xpfjZwmw4x0aeMc4jAwdnnf8jq4ZC4+Ov/HmBC/Qt3J4Wr461NcLt9u7MpuR?=
 =?us-ascii?Q?3xcFXWtIunDZxBnV0/f4h12VPay17cJLHafd6R60iW8+hYhThkLDchUQZDmA?=
 =?us-ascii?Q?7yZ7HJAYoSs+gJ+8BC72wkiHkZ4Yg8/T3Q4ZXStNE+YsvDx8DNwAf33R4cRw?=
 =?us-ascii?Q?Ct4si8uzgX8gCU0ouKMiFY+oKpjgASeOwyJSERjwQ4ab2xkORQVfN27styOu?=
 =?us-ascii?Q?mz8WZ8h94inQyMdCx/Mc0VXjHJnIqo7h1uIbxjkAK3cnDpeY6uli9miqwZpw?=
 =?us-ascii?Q?wuN819OVAjdsdMvvgLr83rUpicpcRkao9djaAHYl5fUAiul8o/XncpP+pcVp?=
 =?us-ascii?Q?/gre3pksBemAAKAvcXjnlSBtF14ezWYavB/HlqlQsohToO52YX9vL7Eo25Lz?=
 =?us-ascii?Q?o0QKUtMjy7sueB8xSVD1j3gYvXpuS8ilPzUKEBS4s43liEYui916q/Yyyjps?=
 =?us-ascii?Q?P/KBAqOjjU7THlmVU+bxk/iBfU2/Em749B6qjdmp0hnMKZ4HIVg51bh9Gfbo?=
 =?us-ascii?Q?EjdEHW2yMjQ+FQtOVJGG81KeK/7QYlk4vijbTB/e5YhHu9P1RvhPS9KpP4e/?=
 =?us-ascii?Q?disjaAk5j8hIz5o0Xapy/ijcVqRiAbrxRh0p9buwD4gQHNMC5o5jCUeUXcB6?=
 =?us-ascii?Q?5fBvdDYGdzwjtR6fMgh5Q7ZdeYXHNdJ70VFkyNsiG6/ibc8Wsb7ChN/l/M9J?=
 =?us-ascii?Q?8F8MoWNBLgdy2DvcE/7/pPHgGVaUpmw37LhBN3DgYS3K0v4uB/dc1EG93QNe?=
 =?us-ascii?Q?ZJnI4Sjlhw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edef451b-d97f-472d-b56d-08df18745016
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:39:55.8854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2p7KhD0iUAoLDc3bbll4ZTUaTabtoCz1NOnkiJIUk592/v8JUOjyFbmFAiZDDDws+LgkfW53i0RUVGCw1X6hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR03MB11709
X-purgate-ID: tlsNG-720697/1790059199-303C42AC-7AC7D563/0/0
X-purgate-type: clean
X-purgate-size: 3872

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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v4:
- Document the compressed bitmap layout with an ASCII diagram above the
  conversion helpers and refer to struct vgic_dist for the full layout.

Changes in v3:
- Adapt virq_to_idx() to the configuration-neutral is_espi() helper.

Changes in v2:
- Call is_espi() without a configuration guard.
---
 xen/arch/arm/vgic.c | 42 +++++++++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index e04678f134..5b15b98ac3 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -25,6 +25,21 @@
 #include <asm/vgic.h>
 
 
+/*
+ * The allocated_irqs bitmap is compressed: eSPI bits immediately follow
+ * regular IRQ bits, skipping the gap in the INTID space.
+ *
+ *   +-----------+-----------+-------------------+-------------------+
+ *   |   SGIs    |   PPIs    |       SPIs        |       eSPIs       |
+ *   +-----------+-----------+-------------------+-------------------+
+ *   0           16          32                  vgic_num_irqs(d)
+ *
+ * INTID ESPI_BASE_INTID maps to bitmap index vgic_num_irqs(d).
+ * The following idx_to_virq() and virq_to_idx() convert between INTIDs
+ * and bitmap indexes.
+ *
+ * See also the allocated_irqs comment in struct vgic_dist.
+ */
 static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
 {
     if ( idx >= vgic_num_irqs(d) )
@@ -33,6 +48,16 @@ static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
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
@@ -850,19 +875,11 @@ bool vgic_emulate(struct cpu_user_regs *regs, union hsr hsr)
 
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
@@ -899,7 +916,10 @@ int vgic_allocate_virq(struct domain *d, bool spi)
 
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
2.53.0


