Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E40C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 15:59:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429192.1652144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92ti-0005kD-KS; Tue, 22 Sep 2026 15:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429192.1652144; Tue, 22 Sep 2026 15:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x92ti-0005k1-Dy; Tue, 22 Sep 2026 15:59:10 +0000
Received: by outflank-mailman (input) for mailman id 1429192;
 Tue, 22 Sep 2026 15:59:09 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x92th-0005d7-QX
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:59:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x92th-00ATp7-7M
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 17:59:09 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab2a5ca-2eae-0a2a0a5409dd-0a2a4505d854-4
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:59:09 +0200
Received: from [52.101.66.99]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab2a5cc-4cb1-0a2a45050019-3465426338ac-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 17:59:09 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AMBPR03MB11360.eurprd03.prod.outlook.com (2603:10a6:20b:767::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 15:59:05 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 15:59:05 +0000
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
 b=oLgtyVh4ZP5JqViUaVZV3+F7q04fMyUlbh3lMICdp3WpBeDjWsuXCUvW+mDtme4orTB2PKMg20Db82MX4GW8PrkSbvlrBqviRDIsVeGl5NzoZgX44mb3UK4TwTCpyW2i5Ibo/Wt0m++6/0vF3XzwxBYoyRA0Mzi/BOULjXXUBYA6++MHCaYs5MEBNLc1eV+/n1PUcYHiRaAMesNEdeTAkMzaANvoLY8cHJJ+X2FQ/NaL5p/ot98CiMk5qDEGMQazeGXSQI+xzMx3eUs99pf6yBFE/WS3LRlqGMgreCabQoM1d+/xAR3DJ2rLr9GgbsCOtkgVrrALm0VdJbg/uVW+Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0CNFQ6w0OoFMTVo9GGVwFDr1Sg2IGBlLPPygPrJC/Y=;
 b=uG1/Gi81Z5n0fRfO65ju8ZQlAaCsNm3rkzStvRIfFBYM28L1+wkuV636ZEJV8zKZ+Be4K2zzWUBg+RchRTCAJetzGQUbxDUYZXso66YK6sQhVbB58bQAGeO02ogOhqFgxHf1AT/dRgZobPZE5r/2T0e/NPh4SV15Qkaef7ziU9mC7xAj9gokmjl13tF0zKk2bFIw2UamRFFB5LEJ4X1HK1Auzo7j2lhdzQitjKe87mi88OuehZfGXK/kdw30BAVUMVEYxos51Tj/k2Qxb0Bfb2NgQmJHcGxX502l6vVL67P4q7jX5dvmeSn4ulQhq+1W7LJKSFiD0mY64REgRbvqzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0CNFQ6w0OoFMTVo9GGVwFDr1Sg2IGBlLPPygPrJC/Y=;
 b=FvN2XmUJnqotIpgygOTFZEznxNrVky/ohLoZ4I9V03vDmmp+ghht0JWtRT4TcKSAm4Fdg8j4NuPpMq0R43AKZBIjo6usuGq2RHewG4SG+Eg5BQ5Oj9nKttHFuToji4cPTFg31JAbFW2RHdyKcrUac1DRFCpeNMCWgI/TuSb/olnwpQuaanf25Gq6oDdhyM28aSAgUO/E8YgZ0lJCRyT1ftPJa3lV4RkAIe+cSAnixM2BZhuGQqvn7NfglUgC32BknAJTck8Xlp2LuuoozZttTu6t7rZ4e/hXIiLRJWAzt9Nqort7MOEsOzjWm393pImeW4nw0CS2w0tmysESDpxObg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 3/4] xen/arm: its: refactor ITS quirk matching
Date: Tue, 22 Sep 2026 18:58:41 +0300
Message-ID: <a9bccc7d8054244cdbe754fd16b8d2faba01af3f.1790089161.git.mykola_kvach@epam.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AMBPR03MB11360:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b5a5be9-f1eb-4778-2666-08df18c26dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	nxKuU2JMZMreulMbq0ktOE2Z8ESLmB51S+vcv9n7FoXveEakbNFK76ZT42XZU2gbvcOezfwPHm2njKS6eUMohm0XKLgEKlBVyUCUztqDWYkk7U4+D26nKSES97RrRvklSdMhcvbTLopcGMmpUBb9bA6OechwZkQ4B1tOQ7KRFiLQU8qO0F32qU0vcy5OCNv6+JU7T/Iv4u96gL06bJCRD4pWmegU7gTQ4xMlasQmFhW64KCaio0LV7ZHPtq6V5UJswYsfazdSyIQh0kNc6MEf8LYyePCSH0UhxkXHmd3p3PbQtvBEp8BZri6IOX51jWLpNNp2EbHZ6tMtfZFAEIPaWwDkKAEcimRet21I1CyzZsUdDS+7OoWAa13mCUd3+PDR2QWE6PCSOUCyMAELGnau/LAb8PkuA1DpZulSpMDfOIEUtqVd++wvGHj3g9OepYDt7zuzDA5Z19HF/ao7gNm9gN7hkdfzCpSC1uWHVq36RjDJK+qBLMCrXJ78Ezz022/gj1jK3Zs49B9E46H6I8OC3KhqyI6p1kiGvnWMQnNeeFO45CNIBoBnStct5InyzQPn7qf9I4IzqE2vCOcgSND5vNNpTxyDPPlsIgB9HWuiB5yX4K0IDj+/urE61admJiCH9kIauwq+IUE2paLxlCP/ymbL/ks6uCtsdLuMW2lDGU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?On5pEzodTOQ9XD+mLSqc2VUuHTqi3njuR60lNFRPha8Gnd8nA73Diz3MMehO?=
 =?us-ascii?Q?O6dYVIHHCwhOMl1ufwgM/IrGuG4LNJoda+cA//6mir2WKsiglPWITkP1ZP4N?=
 =?us-ascii?Q?uRFNcxqkjRnDOiBaXwD9loDHggT74DX0ZiNrrUorPxW66SlOeUXqIcCwtzjO?=
 =?us-ascii?Q?FeYqxhW/sIw42SZP6LRyFWr17wtoy3pb94n7ApXxgjK3gD5m+gxUpv+HqLLL?=
 =?us-ascii?Q?OgrAQXFJ8NiFmT27fXKbDVwkuh2ExWBk168xEsuA9BbuKOC0LS6ZYGj26uqQ?=
 =?us-ascii?Q?6Gwb3erQmlbAHBZubTQL2UFVkwz6MTTssssi5o34fG4V27z98kz5MYMx45mH?=
 =?us-ascii?Q?8eTzSmQsUZmDOXPk6IM8H4tesg09MWWoZCTaRlN5Iu73xX65E5aUf6r33k6P?=
 =?us-ascii?Q?2oifM4fY3VHwaOD6Al74uFWwcKwet2VbKbn3c2ApkiG1IEX71OkcTAappWbe?=
 =?us-ascii?Q?Tmdoof8AjECEnSNUyMbnrhyWVhvjkm+lHpiPTv3061ObnO+zfAXV+RJ4Dl28?=
 =?us-ascii?Q?wgqsfyt6CYW6uT7GyoL/gx7geZ7mcPyGFcduFZIWC9BhZC3v2at6ozjGES4K?=
 =?us-ascii?Q?3UKfGcgYdJpZ9qKhZLAScudiIrG+f9lIK0fmAsqvqtgTBZu6Ef0EcHCJvC8H?=
 =?us-ascii?Q?3lurrtISKZrRFd3zE2hJU7ImF/398FWnPb3ZnLt35I0ay+9g00j/vj1h47tI?=
 =?us-ascii?Q?BMyeH6QTy6npVzkT+kFwCBwF+7b6mtUWhLGeDGsKfbm9Wugpqsd8C2KiZNPJ?=
 =?us-ascii?Q?91wWUegT7IuvqtbwKwvpfxWV3ioL0JTkqWsPwWqa+eDYlHbZLPzx631ACjZ7?=
 =?us-ascii?Q?S5sGVvTE2ew7cHPQ/MzgYK/HuN+y83q6saLPwpDYsxdNuGFIfjZKmtAa7Fda?=
 =?us-ascii?Q?mUeGdbvZ2svhVg55Gn6x2Hbd1wTYBbc0Xm4JQqcX1+GrO5J8+QzIUoP5QCUp?=
 =?us-ascii?Q?16PbR+EHQjUiGcEXHBdAOwygX5Nefssi/Jj2j/FSeuOdpQ3gQXDBGMSU/DR7?=
 =?us-ascii?Q?E93dqHXpW4IJPri611LlypuEYKCGHLB2pcceuIaBp0W0PdHBHy+WVtlnnZm/?=
 =?us-ascii?Q?eM1gINw1D/lDoQ80bVvUEtb2w9pvBWXWT6M2TPFWYnRQ+KqNUKUD9qUo1Fhu?=
 =?us-ascii?Q?q4e8j6XvaZmXZUMvBOvYOYE6ga1FAN57UvInbcMhSuftWqAAXMATechZU1AI?=
 =?us-ascii?Q?SyQK+y36/eRJiC89eJ8sP8z5Hy7iwNTg+KP3FAyv7bTsvILHTS+JjXVhMJ4N?=
 =?us-ascii?Q?js5XTgXt3PsoFtWtWpiRvVVh84aUPTwvQxzEAieX20KjxZdu9LlhE7efpxJI?=
 =?us-ascii?Q?0Lsxs+CfWKs8Q6kwU6ZjQ9stvZacGwpCwEcZD7LOpvSGWbd3fAVgjLmdgM1x?=
 =?us-ascii?Q?86wjnOP2Lj2aPBx9iInGdNIndzXHtfjeNtRSlYbVees5P0U0KCBtjMktF2ka?=
 =?us-ascii?Q?b7F4J9NTeaRQzqw4wStzab+wo+dfeKnUjNCorqbj38ln/AsBZ/GuK/hZjDBJ?=
 =?us-ascii?Q?E78gEF9YibcKkkr9lRjslL6o1IDA9wA3QUx+Twu7fo1jB6xEF8IecmLX3PF0?=
 =?us-ascii?Q?VdaYbnByeN39ZjqRAJz3/NMfCN3WV4UG6PZ3JyryjLGKIAr37qD77U+wO+0Q?=
 =?us-ascii?Q?+rf7cfM2JOiRwv0jbUh2p8M0pzE06BqBNl3Coa8+jf3nyZP4xhfGlCL9QmkA?=
 =?us-ascii?Q?iaWrGmPnFbhkdGNfkzMAjOpeRGABVNFcvyqYNMzpw2kXjgtPSaDdfAFb90j+?=
 =?us-ascii?Q?73TgE4QKrQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5a5be9-f1eb-4778-2666-08df18c26dfd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 15:59:05.9198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lH56Dn9s0pvSSlqXVk0WZ6bPEfWWMCdBeB+IgSsGO6dCreF4zFLrSxHlp1qcKYXT9etvOLw9wdTLlV1AV1/4qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR03MB11360
X-purgate-ID: tlsNG-c201ff/1790092749-F7CB82A1-959C4A81/0/0
X-purgate-type: clean
X-purgate-size: 5575

ITS quirks are matched only by IIDR and mask fields stored in each table
entry. That is too coarse when the same GIC IP block appears on several
platforms but a workaround is valid only for some of them.

Replace the fixed IIDR fields with a generic match(hw_its, data)
callback and an opaque data pointer. Add an IIDR matcher as a reusable
building block and use it from the R-Car Gen4 matcher after checking the
Renesas machine compatibles.

This intentionally narrows the R-Car Gen4 quirk. Previously every ITS
with IIDR 0x0201743b matched. Now it matches only a DT-discovered ITS on
an r8a779f0 or r8a779g0 machine. ACPI-discovered ITSes and the same IIDR
on other platforms no longer match.

Keep first-match semantics explicit. Assert that non-sentinel entries
provide a matcher and that IIDR matching receives match data. Retain
runtime guards so malformed entries cannot cause a NULL function call
or data dereference in non-debug builds. Place the matcher data and
table in init-only read-only sections.

The matched entry still supplies separate ITS and LPI flags; this patch
only changes how the entry is selected.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v3:
- Document the intentional narrowing of the R-Car Gen4 match.
- Add the non-debug NULL-data guard.
- Put the matcher data and table in init-only read-only sections.

Changes in v2:
- Replace v1's optional platform callback plus fixed IIDR/mask fields
  with a single generic match(hw_its, data) selector.
- Add a reusable IIDR matcher and use it after the R-Car Gen4
  machine-compatible checks.
- Document that the R-Car Gen4 quirk remains DT-only.
- Keep the split ITS and host LPI quirk scopes when applying the matched
  entry.
- Document first-match ordering in the lookup path and guard against
  entries without a match callback or IIDR match data.
---
 xen/arch/arm/gic-v3-its.c | 73 +++++++++++++++++++++++++++++++--------
 1 file changed, 58 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 454fd0e0ef..f52232ca40 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -54,8 +54,8 @@ struct its_device {
 
 struct its_quirk {
     const char *desc;
-    uint32_t iidr;
-    uint32_t mask;
+    bool (*match)(const struct host_its *hw_its, const void *data);
+    const void *data;
     uint32_t its_flags;
     /*
      * lpi_flags are ORed into the global host LPI policy and must only
@@ -65,11 +65,52 @@ struct its_quirk {
     uint32_t lpi_flags;
 };
 
-static const struct its_quirk its_quirks[] = {
+struct its_quirk_match_iidr {
+    uint32_t iidr;
+    uint32_t mask;
+};
+
+static bool __init gicv3_its_match_iidr(const struct host_its *hw_its,
+                                        const void *data)
+{
+    const struct its_quirk_match_iidr *match;
+    uint32_t iidr;
+
+    ASSERT(data);
+
+    if ( !data )
+        return false;
+
+    match = data;
+    iidr = readl_relaxed(hw_its->its_base + GITS_IIDR);
+
+    return (iidr & match->mask) == match->iidr;
+}
+
+static bool __init gicv3_its_match_quirk_gen4(const struct host_its *hw_its,
+                                              const void *data)
+{
+    if ( !hw_its->dt_node )
+        return false;
+
+    if ( !dt_machine_is_compatible("renesas,r8a779f0") &&
+         !dt_machine_is_compatible("renesas,r8a779g0") )
+        return false;
+
+    return gicv3_its_match_iidr(hw_its, data);
+}
+
+static const struct its_quirk_match_iidr rcar_gen4_iidr __initconst = {
+    /* Implementer 0x43b identifies Arm Ltd. */
+    .iidr = 0x0201743b,
+    .mask = 0xffffffffU,
+};
+
+static const struct its_quirk its_quirks[] __initconstrel = {
     {
-        .desc	= "R-Car Gen4",
-        .iidr	= 0x0201743b,
-        .mask	= 0xffffffffU,
+        .desc = "R-Car Gen4",
+        .match = gicv3_its_match_quirk_gen4,
+        .data = &rcar_gen4_iidr,
         .its_flags = GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADDR,
         .lpi_flags = GICV3_QUIRK_MEM_NC_NS | GICV3_QUIRK_MEM_32BIT_ADDR,
     },
@@ -78,18 +119,21 @@ static const struct its_quirk its_quirks[] = {
     }
 };
 
-static const struct its_quirk *__init gicv3_its_find_quirk(uint32_t iidr)
+static const struct its_quirk *__init gicv3_its_find_quirk(
+    const struct host_its *hw_its)
 {
-    const struct its_quirk *quirks = its_quirks;
+    const struct its_quirk *quirk;
 
     /*
-     * The first matching quirk wins. More specific quirks must be listed
-     * before broader IIDR-only entries.
+     * The first matching quirk wins. Entries that match a specific platform
+     * must be listed before broader IIDR-only entries.
      */
-    for ( ; quirks->desc; quirks++ )
+    for ( quirk = its_quirks; quirk->desc; quirk++ )
     {
-        if ( quirks->iidr == (quirks->mask & iidr) )
-            return quirks;
+        ASSERT(quirk->match);
+
+        if ( quirk->match && quirk->match(hw_its, quirk->data) )
+            return quirk;
     }
 
     return NULL;
@@ -97,8 +141,7 @@ static const struct its_quirk *__init gicv3_its_find_quirk(uint32_t iidr)
 
 static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
 {
-    uint32_t iidr = readl_relaxed(hw_its->its_base + GITS_IIDR);
-    const struct its_quirk *quirk = gicv3_its_find_quirk(iidr);
+    const struct its_quirk *quirk = gicv3_its_find_quirk(hw_its);
 
     if ( quirk )
     {
-- 
2.53.0


