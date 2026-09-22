Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF39C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 15:59:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429191.1652133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92th-0005WC-5B; Tue, 22 Sep 2026 15:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429191.1652133; Tue, 22 Sep 2026 15:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92th-0005Vv-21; Tue, 22 Sep 2026 15:59:09 +0000
Received: by outflank-mailman (input) for mailman id 1429191;
 Tue, 22 Sep 2026 15:59:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x92tf-0005Td-IA
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:59:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x92te-00ATp7-VF
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:59:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab2a5ba-2eae-0a2a0a5409dd-0a2a450ac088-26
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:59:06 +0200
Received: from [52.101.84.73]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab2a5ca-f2d2-0a2a450a0019-346554496212-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:59:06 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by PA4PR03MB7184.eurprd03.prod.outlook.com (2603:10a6:102:106::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 15:59:04 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 15:59:04 +0000
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
 b=YcestljPpgEzMGIdiNF/yvGFMHoi8ed5WmYfIkjO3W3PXBiIz56ao/q+C8IAYUTWdY49dbyD9Vb92azCc4KCML7HfLld/5XIP1Qr5/OISAuF8a23x37Lv6g9U17z8RhDfwt7wbIvFeVCK/UwTAFlKQhpp4ewguO0J9N1oF5QwEq97CdBh63C244t0ua6nfYZ5SzNQfzvjBOueWTGN1JHNIu+PMYZjFnTJtJ9vOWpBBFCGQprWHrps5vihL02rYxgAX9LDVZrbpGU2Vo0t7AkegnOPLJUb+mQ27qfEd9IBtmvdZ18AAQ4huIZQEkIKIgzVNJwKs4vK+HRCSupNywu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FVQkX0S+iPV6n7069bjHG6csiHA3mhUKGAwXPjaq78=;
 b=V29qp4t4n7+WGutb1lHpzHd9UfyFfe6W0gsDmc5nyMU/u0mEeljLxd/7nt5nRB6XKlMap0EEbvwTWzIsTZge+8S0wlvION5cXiu0g3kU0BlOBX+ERhOvwOws6yAU7NWpFkV5GczaeXTiNLYpDvXvIDHAlCOFE1m/tFSUXvJa+iIng+C7GH+TZJJSO7wZ88O3W2itpnrn1It7+OgCSqgI1jhcRbwCxyymueMZpYYrtcMilLiidhnDpMlH6+17FB9prGIFKMRzIXlH5MAb0M5p7KQadcJx/ZDc4/jQSvrpwhRtZXUrhTq6Jq3XcRg4Qh4C9iIaZvSFvD2Tt8ovBVOXWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FVQkX0S+iPV6n7069bjHG6csiHA3mhUKGAwXPjaq78=;
 b=fmidiczxwYKaz8ocMKIF/mxaTI9kHbDbxP28LxO2C3GcbEzjLV3z6BG+d0Uu6py2FKNrzqZdQg/dCKosWrIZeDT1xV0UMHSB/XOt6a2HIdDO65P3nJG4cEEA++7ngvMD8imSCcArUI2sptpqkOi7g4qofH6Ghb89XvXUrj4GY4d+gDwzfbYO39rlpZU1c/PI3E6jy2ZjVFGVQLgWaU7TupswDalr+cUBlgK9znLlezl7jWwq/QD+uxBGkqbaHEpRdmbrs9bQyoylAMI6aR3t20vG8d0G4X+TLy/Iltem9gHJewgdxybUKG7Z6rm5MK3dFE5QUuzNkDly1oa/c4nYIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 2/4] xen/arm: its: separate ITS and host LPI quirk scopes
Date: Tue, 22 Sep 2026 18:58:40 +0300
Message-ID: <9de733816d356161c8bfa45171e0ddbba68021f2.1790089161.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790089161.git.mykola_kvach@epam.com>
References: <cover.1790089161.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|PA4PR03MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2744c9-88ae-471b-1ed8-08df18c26d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|18002099003|22082099003|3023799007|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ZbykrZeKmt3v5c/I8zkajwY2zVt920jBsgj5gvKofAlsOunoqUrw3zzSvO6cFjMDe4AvLWirz/udIRFXOd4DImKIDReA5Zp+wNXl703/aXdMfgmLdqzQGh1m6W9ZIqQ6PpYXO9bp0zgkUZydZmEGt52euEgb3nINE0nOIrH17+kRODB8M2/kFQtgTRyDIjGQImlqJOhOUNxeeEcSo8SCpmziVyzomO1sppsT04VENfYDpkMXml5vfAwSHHnMqsHjMI6kNuc290IG3NMbCP65jZbeMgfFglgRfcUOJtt0x4/UIz5fglj/lUSc5ciWCCJSK/uP8TVBTdeHp7ob2iMOOEwdvGqCeyadWQWf+kI455q5IfDzQ90CkIoibJChc9neusIDX41W4O2ENydzYhlvhxZ0TQZTFZE87fjk1Xd9Lvt1LLDp/a1O++cj43DdfpCJu0tHna39WETlVVShEY7O7qDVommSsMusLDOS0ZY4APOzkKhdM9EWoMNILAK9jqrEoWLlxg3L57GTQBRHDkTyQmMRrIHZMOBlaFdxAPjQXoafA0jelTYWLzOTQBL1mOiuGHkyNFHVwUkdaZonxB+tKrnsp3thCrIViWqRAjiIuKvp6w8paT7V66IzfZFurahPkCjTVnMN9BPQBtAnsdJEmh5GKuF3Rwm/m0y/ViEx+uk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XYJUlYxlVFx6S7QxN8gkNct/MZ79LJpR3jaVySHJY78TlYRMOEUQO9jBLBQz?=
 =?us-ascii?Q?8sdM99rgu9otK/2gY/UbUO6Qt/sOMEKZeViDoCNmTXsZ4P6cEGkwCYrLKU7o?=
 =?us-ascii?Q?xYjGuoFCyRVZKeuaBddm4j6QktmmtwfoR0dTVIP0AoNIzSDoRCaD2qP4qwBq?=
 =?us-ascii?Q?knovUQU4+AVX0mYE8wGoFvOzQE0eRJgHIU447zai3KX/RFT6oQypfZEH4NAl?=
 =?us-ascii?Q?5u7Za+ZgS6AIpfNPJPPzXO7YtrPmMxCb9IZSClUydkZVMuNVbBBT9N7Cusc/?=
 =?us-ascii?Q?vRlsnN0vdX4qG/xzv6fYu+1WAjBdSE3Hf+mJAc5ccoZZY0oYe2aMiUkmxuHg?=
 =?us-ascii?Q?oji8zSGuIxvqjS+Vo2s5DxYCzF+N7VV3R+sjH9RsVSc+YIjjhiKpw8F2rc4C?=
 =?us-ascii?Q?4SeEdanyiPPclVqMqqKlUZZhE4NUaSpx8kSMrwnXStfvuCKKQF0aM/RyXC/+?=
 =?us-ascii?Q?XGqznlHJLC/fd87iN8ciz5rEUgJ8m9Atejso7neC21nGta99IvVVShBQOxRX?=
 =?us-ascii?Q?wAPN1YpdNPgilK2VIdMToLYUXV1bT8cmbbHHPhGdEfpRQGtKR+S2yCGLf5q2?=
 =?us-ascii?Q?+VxfNE7sBQi7EL/JZ1O7qtLyu6f+Z43huXoG5DDxxUZo/dUc3SBwvn9iN4CZ?=
 =?us-ascii?Q?VK+hdF027RvuFMmOW9oTD3w+b7sCvw3ViMfj1HKSZu9Ou1P/P4XKC7Z2oZ4M?=
 =?us-ascii?Q?JIV9gCGAQaQ2ZAHMFwiHJxOraG3BQPhu4MQ1yRaqSQG2Se2OQqWXehqSPo3X?=
 =?us-ascii?Q?PADSiP1XHoib93Hy26vbR5ar9bxRFVJpeRNr2zN69o8si8vNqyh2DyrvbNtq?=
 =?us-ascii?Q?iYOVeFd2hvUjH7Uq1ZlJK+3xTNyY8FN+1rT47olsBdie4Vdk6Ivf2jelH4FB?=
 =?us-ascii?Q?SMpIdwIJlsi4GPpL2Hhyie/cJaNrYCRpAAcW7HhiAs1GodxNIamY1jif6r21?=
 =?us-ascii?Q?AVqXzNEryXtXPl2bOfbb2466eYz3P7TL9+Qk28OpOMvs/UzRaRgMYigrOFrR?=
 =?us-ascii?Q?XAUEvLgFCWnuL/jsH2D5ndRM6M5e9zWUz7DYL7Vc/cfl3+EfYp0SY8qI0YIj?=
 =?us-ascii?Q?xLJzg08dI1uFvt9PlC/2kXMMG4o5/7lxLsuamPcypH3MWP4uurw+dkb5Cpzr?=
 =?us-ascii?Q?Sk3UIjy6JWiRWT2kVjy+/u4ynFznYStMzE1bVWPqr0UalWnugntzM/xThWLq?=
 =?us-ascii?Q?0R2SBTTafZwk50l33087CvCUZNRkGCRafPzRcmU6YsiFFWhrkUpL0kAK6gqB?=
 =?us-ascii?Q?iJ0wWVfdQcH1RYE53VMUaBnwudX4QLoswZVAQR4RDjvUGXhQW70+FPhZ5dDQ?=
 =?us-ascii?Q?P/JVsSZ0MT9iWxi08sujeqyjuD6L/UpN6zZKpHwkOpN7cltBv4Cj3+4Eq+2j?=
 =?us-ascii?Q?S4mHJD18YV30qgGCeWn0QJDWlTY21nt2sKiF6ur4k3IuwREOSGE1Zmn6Ksic?=
 =?us-ascii?Q?+qjpIrEEyWAPWSgvwd46zGk9rZDI20shWDtXDindXDHyZjlsZwoSaf/ZPOsz?=
 =?us-ascii?Q?te6/GIYSyF90f6g7onHOU9KmFVClDFeFfYkfn4fHI/gPusqZ6UwAh14olXhg?=
 =?us-ascii?Q?cfCVrPidKhuTl203RfwLd3mmvz4vjJW/GIfGLpDm1BhzOB+tj3CiruTLbRk/?=
 =?us-ascii?Q?Hyh0aPrNklpWE8RoroUOoW2Lv29UW6EU9gLnD7pNCmSJs6B52QYYlCzNzDNu?=
 =?us-ascii?Q?7KIGYadTL/eM16jwKFl5mzK6KiEU+0mheYRl6zoL/euTnh5w0NfikR1eZrGp?=
 =?us-ascii?Q?ea8+C4iTNQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2744c9-88ae-471b-1ed8-08df18c26d2b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 15:59:04.5485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pY7M8V8AgqUf55T9QhyJQRTKUmoIvdYYvdMHPi5R+g5x39m/AGPLI5fX5b0Es9Y8CxWHDTKNQCBF4cN9FlAl7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7184
X-purgate-ID: tlsNG-4011c0/1790092746-504CFCFC-E368911F/0/0
X-purgate-type: clean
X-purgate-size: 18883

ITS quirks can impose restrictions on memory accessed by the ITS itself
and on shared host LPI/Redistributor state. These scopes are not
identical, so a single global ITS quirk state makes the host LPI policy
depend implicitly on the quirks seen while initializing host ITSes.

Add per-ITS quirk_flags to struct host_its and keep a separate
host_lpi_flags state in the LPI code. The quirk table now records the
ITS-private and host LPI scopes explicitly through its_flags and
lpi_flags. The R-Car Gen4 quirk applies the same memory restrictions to
both scopes, preserving the existing R-Car memory policy without relying
on an implicit aggregation step.

This also removes the assumption that all host ITSes must expose the
same quirk state. ITS-derived host LPI restrictions are accumulated only
from quirk entries that explicitly set lpi_flags.

Use per-ITS quirk_flags for GITS_CBASER, GITS_BASER<n>, and ITT
allocations. Use host_lpi_flags when allocating the property and pending
tables and when programming GICR_PROPBASER and GICR_PENDBASER.
Memory-related quirk bits are named GICV3_QUIRK_MEM_* and are translated
by shared gicv3_mem_get_*() helpers.

Collect both scopes during the ITS preparation pass, before host LPI
state is allocated. Keep init-only annotations and includes in the
implementation files rather than the public header.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v3:
- Collect quirk flags during the ITS preparation pass added earlier.
- Keep init-only annotations and includes in implementation files.

Changes in v2:
- Replace v1's single global ITS quirk flags and same-quirk validation
  with explicit per-ITS and host LPI quirk scopes.
- Drop the v1 ITS pre-initialization approach from this patch. In v2,
  host LPI allocation was moved after ITS initialization by a separate
  patch.
- Drop DT dma-noncoherent handling from this patch; firmware-provided
  non-coherency is handled separately with explicit ITS-node and
  GIC-node scopes.
- Keep host_lpi_flags owned by gic-v3-lpi.c and update it only with quirk
  flags that explicitly apply to host LPI/Redistributor state.
- Rename the current memory-related bits to GICV3_QUIRK_MEM_* and use
  shared gicv3_mem_get_*() helpers for register attributes and allocation
  flags.
---
 xen/arch/arm/gic-v3-its.c             | 111 ++++++++++++--------------
 xen/arch/arm/gic-v3-lpi.c             |  45 +++++++++--
 xen/arch/arm/include/asm/gic_v3_its.h |  18 +++--
 3 files changed, 100 insertions(+), 74 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 972825bf06..454fd0e0ef 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -52,43 +52,40 @@ struct its_device {
     struct pending_irq *pend_irqs;      /* One struct per event */
 };
 
-/*
- * It is unlikely that a platform implements ITSes with different quirks,
- * so assume they all share the same.
- */
 struct its_quirk {
     const char *desc;
-    bool (*init)(struct host_its *hw_its);
     uint32_t iidr;
     uint32_t mask;
+    uint32_t its_flags;
+    /*
+     * lpi_flags are ORed into the global host LPI policy and must only
+     * contain additive restrictions. Non-additive LPI quirks need explicit
+     * handling.
+     */
+    uint32_t lpi_flags;
 };
 
-static uint32_t __ro_after_init its_quirk_flags;
-
-static bool gicv3_its_enable_quirk_gen4(struct host_its *hw_its)
-{
-    its_quirk_flags |= HOST_ITS_WORKAROUND_NC_NS |
-        HOST_ITS_WORKAROUND_32BIT_ADDR;
-
-    return true;
-}
-
 static const struct its_quirk its_quirks[] = {
     {
         .desc	= "R-Car Gen4",
         .iidr	= 0x0201743b,
         .mask	= 0xffffffffU,
-        .init	= gicv3_its_enable_quirk_gen4,
+        .its_flags = GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADDR,
+        .lpi_flags = GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADDR,
     },
     {
         /* Sentinel. */
     }
 };
 
-static const struct its_quirk *gicv3_its_find_quirk(uint32_t iidr)
+static const struct its_quirk *__init gicv3_its_find_quirk(uint32_t iidr)
 {
     const struct its_quirk *quirks = its_quirks;
 
+    /*
+     * The first matching quirk wins. More specific quirks must be listed
+     * before broader IIDR-only entries.
+     */
     for ( ; quirks->desc; quirks++ )
     {
         if ( quirks->iidr == (quirks->mask & iidr) )
@@ -98,53 +95,38 @@ static const struct its_quirk *gicv3_its_find_quirk(uint32_t iidr)
     return NULL;
 }
 
-static void gicv3_its_enable_quirks(struct host_its *hw_its)
+static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
 {
     uint32_t iidr = readl_relaxed(hw_its->its_base + GITS_IIDR);
     const struct its_quirk *quirk = gicv3_its_find_quirk(iidr);
 
-    if ( quirk && quirk->init(hw_its) )
-        printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
-}
-
-static void gicv3_its_validate_quirks(void)
-{
-    const struct its_quirk *quirk = NULL, *prev = NULL;
-    const struct host_its *hw_its;
-
-    if ( list_empty(&host_its_list) )
-        return;
-
-    hw_its = list_first_entry(&host_its_list, struct host_its, entry);
-    prev = gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GITS_IIDR));
-
-    list_for_each_entry(hw_its, &host_its_list, entry)
+    if ( quirk )
     {
-        quirk = gicv3_its_find_quirk(readl_relaxed(hw_its->its_base + GITS_IIDR));
-        BUG_ON(quirk != prev);
-        prev = quirk;
+        hw_its->quirk_flags |= quirk->its_flags;
+        gicv3_lpi_update_host_flags(quirk->lpi_flags);
+        printk("GICv3: enabling workaround for ITS: %s\n", quirk->desc);
     }
 }
 
-uint64_t gicv3_its_get_cacheability(void)
+uint64_t gicv3_mem_get_cacheability(uint32_t flags)
 {
-    if ( its_quirk_flags & HOST_ITS_WORKAROUND_NC_NS )
+    if ( flags & GICV3_QUIRK_MEM_NC_NS )
         return GIC_BASER_CACHE_nC;
 
     return GIC_BASER_CACHE_RaWaWb;
 }
 
-uint64_t gicv3_its_get_shareability(void)
+uint64_t gicv3_mem_get_shareability(uint32_t flags)
 {
-    if ( its_quirk_flags & HOST_ITS_WORKAROUND_NC_NS )
+    if ( flags & GICV3_QUIRK_MEM_NC_NS )
         return GIC_BASER_NonShareable;
 
     return GIC_BASER_InnerShareable;
 }
 
-unsigned int gicv3_its_get_memflags(void)
+unsigned int gicv3_mem_get_alloc_flags(uint32_t flags)
 {
-    if ( its_quirk_flags & HOST_ITS_WORKAROUND_32BIT_ADDR )
+    if ( flags & GICV3_QUIRK_MEM_32BIT_ADDR )
         return MEMF_bits(32);
 
     return 0;
@@ -391,13 +373,17 @@ static void *its_map_cbaser(struct host_its *its)
     uint64_t reg;
     unsigned int order;
     void *buffer;
+    uint64_t cacheability = gicv3_mem_get_cacheability(its->quirk_flags);
+    uint64_t shareability = gicv3_mem_get_shareability(its->quirk_flags);
+    unsigned int memflags = gicv3_mem_get_alloc_flags(its->quirk_flags);
 
-    reg  = gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHIFT;
-    reg |= GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILITY_SHIFT;
-    reg |= gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILITY_SHIFT;
+    reg  = MASK_INSR(shareability, GITS_BASER_SHAREABILITY_MASK);
+    reg |= MASK_INSR(GIC_BASER_CACHE_SameAsInner,
+                     GITS_BASER_OUTER_CACHEABILITY_MASK);
+    reg |= MASK_INSR(cacheability, GITS_BASER_INNER_CACHEABILITY_MASK);
 
     order = get_order_from_bytes(max(ITS_CMD_QUEUE_SZ, SZ_64K));
-    buffer = alloc_xenheap_pages(order, gicv3_its_get_memflags());
+    buffer = alloc_xenheap_pages(order, memflags);
     if ( !buffer )
         return NULL;
 
@@ -438,8 +424,8 @@ static void *its_map_cbaser(struct host_its *its)
 /* The ITS BASE registers work with page sizes of 4K, 16K or 64K. */
 #define BASER_PAGE_BITS(sz) ((sz) * 2 + 12)
 
-static int its_map_baser(void __iomem *basereg, uint64_t regc,
-                         unsigned int nr_items)
+static int its_map_baser(struct host_its *its, void __iomem *basereg,
+                         uint64_t regc, unsigned int nr_items)
 {
     uint64_t attr, reg;
     unsigned int entry_size = GITS_BASER_ENTRY_SIZE(regc);
@@ -447,10 +433,14 @@ static int its_map_baser(void __iomem *basereg, uint64_t regc,
     unsigned int table_size;
     unsigned int order;
     void *buffer;
+    uint64_t cacheability = gicv3_mem_get_cacheability(its->quirk_flags);
+    uint64_t shareability = gicv3_mem_get_shareability(its->quirk_flags);
+    unsigned int memflags = gicv3_mem_get_alloc_flags(its->quirk_flags);
 
-    attr  = gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHIFT;
-    attr |= GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILITY_SHIFT;
-    attr |= gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILITY_SHIFT;
+    attr  = MASK_INSR(shareability, GITS_BASER_SHAREABILITY_MASK);
+    attr |= MASK_INSR(GIC_BASER_CACHE_SameAsInner,
+                      GITS_BASER_OUTER_CACHEABILITY_MASK);
+    attr |= MASK_INSR(cacheability, GITS_BASER_INNER_CACHEABILITY_MASK);
 
     /*
      * Setup the BASE register with the attributes that we like. Then read
@@ -464,7 +454,7 @@ retry:
     table_size = min(table_size, 256U << BASER_PAGE_BITS(pagesz));
 
     order = get_order_from_bytes(max(table_size, BIT(BASER_PAGE_BITS(pagesz), U)));
-    buffer = alloc_xenheap_pages(order, gicv3_its_get_memflags());
+    buffer = alloc_xenheap_pages(order, memflags);
     if ( !buffer )
         return -ENOMEM;
 
@@ -562,7 +552,7 @@ static int __init gicv3_its_prepare_single_its(struct host_its *hw_its)
     if ( ret )
         return ret;
 
-    gicv3_its_enable_quirks(hw_its);
+    gicv3_its_collect_quirks(hw_its);
 
     return 0;
 }
@@ -592,18 +582,19 @@ static int __init gicv3_its_init_single_its(struct host_its *hw_its)
         case GITS_BASER_TYPE_NONE:
             continue;
         case GITS_BASER_TYPE_DEVICE:
-            ret = its_map_baser(basereg, reg, BIT(hw_its->devid_bits, UL));
+            ret = its_map_baser(hw_its, basereg, reg,
+                                BIT(hw_its->devid_bits, UL));
             if ( ret )
                 return ret;
             break;
         case GITS_BASER_TYPE_COLLECTION:
-            ret = its_map_baser(basereg, reg, num_possible_cpus());
+            ret = its_map_baser(hw_its, basereg, reg, num_possible_cpus());
             if ( ret )
                 return ret;
             break;
         /* In case this is a GICv4, provide a (dummy) vPE table as well. */
         case GITS_BASER_TYPE_VCPU:
-            ret = its_map_baser(basereg, reg, 1);
+            ret = its_map_baser(hw_its, basereg, reg, 1);
             if ( ret )
                 return ret;
             break;
@@ -738,6 +729,7 @@ int gicv3_its_map_guest_device(struct domain *d,
     struct its_device *dev = NULL;
     struct rb_node **new = &d->arch.vgic.its_devices.rb_node, *parent = NULL;
     int i, ret = -ENOENT;      /* "i" must be signed to check for >= 0 below. */
+    unsigned int memflags;
     unsigned int order;
 
     hw_its = gicv3_its_find_by_doorbell(host_doorbell);
@@ -801,8 +793,9 @@ int gicv3_its_map_guest_device(struct domain *d,
     ret = -ENOMEM;
 
     /* An Interrupt Translation Table needs to be 256-byte aligned. */
+    memflags = gicv3_mem_get_alloc_flags(hw_its->quirk_flags);
     order = get_order_from_bytes(max(nr_events * hw_its->itte_size, 256UL));
-    itt_addr = alloc_xenheap_pages(order, gicv3_its_get_memflags());
+    itt_addr = alloc_xenheap_pages(order, memflags);
     if ( !itt_addr )
         goto out_unlock;
 
@@ -1214,8 +1207,6 @@ int __init gicv3_its_init(unsigned int host_lpi_bits)
             return ret;
     }
 
-    gicv3_its_validate_quirks();
-
     if ( list_empty(&host_its_list) )
         return 0;
 
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 9ee338edc2..accfd48a74 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -8,6 +8,7 @@
  */
 
 #include <xen/cpu.h>
+#include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
 #include <xen/param.h>
@@ -78,9 +79,29 @@ struct lpi_redist_data {
 
 static DEFINE_PER_CPU(struct lpi_redist_data, lpi_redist);
 
+/*
+ * Host LPI flags are scoped to shared LPI/Redistributor state, not to an
+ * ITS instance. Arm IHI 0069H.b section 5.1.1 says "LPI configuration is
+ * global". Section 12.11.33 (GICR_PROPBASER) makes mismatched values
+ * UNPREDICTABLE for Redistributors that share an LPI Configuration table
+ * while GICR_CTLR.EnableLPIs == 1. Section 12.11.32 (GICR_PENDBASER)
+ * similarly makes mismatched OuterCache, Shareability or InnerCache values
+ * across Redistributors UNPREDICTABLE while GICR_CTLR.EnableLPIs == 1.
+ *
+ * Keep this policy in the LPI code and accumulate only explicit LPI/RD
+ * restrictions into it. Per-ITS restrictions stay in host_its::quirk_flags
+ * for GITS_CBASER, GITS_BASER<n> and ITT memory.
+ */
+static uint32_t __ro_after_init host_lpi_flags;
+
 #define MAX_NR_HOST_LPIS   (lpi_data.max_host_lpi_ids - LPI_OFFSET)
 #define HOST_LPIS_PER_PAGE      (PAGE_SIZE / sizeof(union host_lpi))
 
+void __init gicv3_lpi_update_host_flags(uint32_t flags)
+{
+    host_lpi_flags |= flags;
+}
+
 static union host_lpi *gic_get_host_lpi(uint32_t plpi)
 {
     union host_lpi *block;
@@ -228,6 +249,7 @@ static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
 {
     void *pendtable;
     unsigned int order;
+    unsigned int memflags = gicv3_mem_get_alloc_flags(host_lpi_flags);
 
     if ( per_cpu(lpi_redist, cpu).pending_table )
         return -EBUSY;
@@ -239,7 +261,7 @@ static int gicv3_lpi_allocate_pendtable(unsigned int cpu)
      * physically contiguous memory.
      */
     order = get_order_from_bytes(max(lpi_data.max_host_lpi_ids / 8, (unsigned long)SZ_64K));
-    pendtable = alloc_xenheap_pages(order, gicv3_its_get_memflags());
+    pendtable = alloc_xenheap_pages(order, memflags);
     if ( !pendtable )
         return -ENOMEM;
 
@@ -262,6 +284,8 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
 {
     const void *pendtable = this_cpu(lpi_redist).pending_table;
     uint64_t val;
+    uint64_t cacheability = gicv3_mem_get_cacheability(host_lpi_flags);
+    uint64_t shareability = gicv3_mem_get_shareability(host_lpi_flags);
 
     /*
      * The memory should have been allocated while preparing the CPU (or
@@ -275,9 +299,10 @@ static int gicv3_lpi_set_pendtable(void __iomem *rdist_base)
 
     ASSERT(!(virt_to_maddr(pendtable) & ~GENMASK(51, 16)));
 
-    val  = gicv3_its_get_cacheability() << GICR_PENDBASER_INNER_CACHEABILITY_SHIFT;
-    val |= GIC_BASER_CACHE_SameAsInner << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT;
-    val |= gicv3_its_get_shareability() << GICR_PENDBASER_SHAREABILITY_SHIFT;
+    val  = MASK_INSR(cacheability, GICR_PENDBASER_INNER_CACHEABILITY_MASK);
+    val |= MASK_INSR(GIC_BASER_CACHE_SameAsInner,
+                     GICR_PENDBASER_OUTER_CACHEABILITY_MASK);
+    val |= MASK_INSR(shareability, GICR_PENDBASER_SHAREABILITY_MASK);
     val |= GICR_PENDBASER_PTZ;
     val |= virt_to_maddr(pendtable);
 
@@ -304,10 +329,13 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
 {
     uint64_t reg;
     unsigned int order;
+    uint64_t cacheability = gicv3_mem_get_cacheability(host_lpi_flags);
+    uint64_t shareability = gicv3_mem_get_shareability(host_lpi_flags);
 
-    reg  = gicv3_its_get_cacheability() << GICR_PROPBASER_INNER_CACHEABILITY_SHIFT;
-    reg |= GIC_BASER_CACHE_SameAsInner << GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT;
-    reg |= gicv3_its_get_shareability() << GICR_PROPBASER_SHAREABILITY_SHIFT;
+    reg  = MASK_INSR(cacheability, GICR_PROPBASER_INNER_CACHEABILITY_MASK);
+    reg |= MASK_INSR(GIC_BASER_CACHE_SameAsInner,
+                     GICR_PROPBASER_OUTER_CACHEABILITY_MASK);
+    reg |= MASK_INSR(shareability, GICR_PROPBASER_SHAREABILITY_MASK);
 
     /*
      * The property table is shared across all redistributors, so allocate
@@ -317,9 +345,10 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
     {
         /* The property table holds one byte per LPI. */
         void *table;
+        unsigned int memflags = gicv3_mem_get_alloc_flags(host_lpi_flags);
 
         order = get_order_from_bytes(max(lpi_data.max_host_lpi_ids, (unsigned long)SZ_4K));
-        table = alloc_xenheap_pages(order, gicv3_its_get_memflags());
+        table = alloc_xenheap_pages(order, memflags);
 
         if ( !table )
             return -ENOMEM;
diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
index e1322b94f8..9230705181 100644
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -110,8 +110,9 @@
 #define HOST_ITS_FLUSH_CMD_QUEUE        (1U << 0)
 #define HOST_ITS_USES_PTA               (1U << 1)
 
-#define HOST_ITS_WORKAROUND_NC_NS       (1U << 0)
-#define HOST_ITS_WORKAROUND_32BIT_ADDR  (1U << 1)
+/* GICv3 memory-related quirk flags. */
+#define GICV3_QUIRK_MEM_NC_NS           (1U << 0)
+#define GICV3_QUIRK_MEM_32BIT_ADDR      (1U << 1)
 
 /* We allocate LPIs on the hosts in chunks of 32 to reduce handling overhead. */
 #define LPI_BLOCK                       32U
@@ -128,6 +129,11 @@ struct host_its {
     unsigned int itte_size;
     spinlock_t cmd_lock;
     void *cmd_buf;
+    /*
+     * Workaround flags scoped to this ITS instance, including memory
+     * accessed through GITS_CBASER, GITS_BASER<n> and ITT memory.
+     */
+    uint32_t quirk_flags;
     unsigned int flags;
 };
 
@@ -157,6 +163,7 @@ int gicv3_lpi_init_rdist(void __iomem * rdist_base);
 /* Initialize the host structures for LPIs and the host ITSes. */
 int gicv3_lpi_init_host_lpis(unsigned int host_lpi_bits);
 int gicv3_its_init(unsigned int host_lpi_bits);
+void gicv3_lpi_update_host_flags(uint32_t flags);
 
 /* Store the physical address and ID for each redistributor as read from DT. */
 void gicv3_set_redist_address(paddr_t address, unsigned int redist_id);
@@ -199,10 +206,9 @@ struct pending_irq *gicv3_assign_guest_event(struct domain *d,
 void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
                                  uint32_t virt_lpi);
 
-/* ITS quirks handling. */
-uint64_t gicv3_its_get_cacheability(void);
-uint64_t gicv3_its_get_shareability(void);
-unsigned int gicv3_its_get_memflags(void);
+uint64_t gicv3_mem_get_cacheability(uint32_t flags);
+uint64_t gicv3_mem_get_shareability(uint32_t flags);
+unsigned int gicv3_mem_get_alloc_flags(uint32_t flags);
 
 #else
 
-- 
2.53.0


