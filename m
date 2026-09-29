Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4DACA5FB3
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 19:02:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436703.1655410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBd65-00026W-UE; Tue, 29 Sep 2026 19:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436703.1655410; Tue, 29 Sep 2026 19:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBd65-00026P-Qv; Tue, 29 Sep 2026 19:02:37 +0000
Received: by outflank-mailman (input) for mailman id 1436703;
 Tue, 29 Sep 2026 19:02:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xBd63-0001qj-LK
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 19:02:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBd62-002hid-MB
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 21:02:34 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abc0b35-8faa-0a2a0a5109dd-0a2a45099d7c-34
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 21:02:34 +0200
Received: from [52.101.69.77]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abc0b4a-be1a-0a2a45090019-3465454dbeec-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 21:02:34 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by AM9PR03MB8053.eurprd03.prod.outlook.com
 (2603:10a6:20b:3df::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 19:02:33 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 19:02:33 +0000
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
 b=wWNPuvRqssqeixHVj2TnHofzj+FUCUUwhGKH4XqKzaBP/4Y7xI0NOOAUrO6YJyYEb4lKuyB4Du5r+pBalQMlYCZPc9VN/PP4J93aABJqd+ID/Qj3xS+rKtxNliOVuY1ozalGQg7n35gG3SK53GY383mneMIxYQ76SQXSmXkDi+4U7D4T9RIcTWRb2vQNosszwoD1us4iOg8dYovykrdoB7xq+8iz/NJMT9DpxnymBHDJgnGHUE0k/KLSJXJTfv4iRcix4/1aINzS6L45s4UFe2uo8QGIhUnuBRytRvlABHP795ztirf1iPxpGQaSsN+7Ou5J3fRarxXOnO5IEl/AbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsBveE8Bv0KjNfbCdwRKt6DOsvt1Hq4z3nDvAhS+fRc=;
 b=CS1Dur1lqzE3z+dpUvAA43mpPu7A2MrI4ay3u7c3Eewz/PO/890SnMt3jTidXTtpLazQmvLPnyDyRAU1cICmc2Vhud6OyPOPm8kZuJAGtSNf15/5oHkAVU+AZQ+kEMft2dZ1ZCJ8b6aIKoNyRgJSePcF85UqUYzaLwTJbu01cJsQrWe3/asYWhvwxJgUaBkpMkowk/K9BS9rrXZNfFQPdB/goaJ8Ts4yKQf0EIq6aOMdUktObOFLBkW9av8aLo54ANRI8q+R6KCPQHxpnU9kobK/2PjwtoUPLtof+Bwtcatyar7WQ5Eh813T+Ns8aoTeCxHbd2sNO0dbvxXujU+ZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsBveE8Bv0KjNfbCdwRKt6DOsvt1Hq4z3nDvAhS+fRc=;
 b=mSGwkuOniyB76Gqx8mJRpgxG9/Syrc8x3F1UcfiaH0iAAFtunhxnlgURpDe2vRU02IahCN2sRkOO+bUinBTnwu6pSx2Y3caI17poPoQs/j0VnMOdxMp+qentVtB65YGWT/xos6+0pQ2UEpxhckTY+y4P5VSLVLlG0ntJ++UqzPaq8FHPc/1V4nZsi8UrFCj0tEVGB2IyChvr1gSfbm/lfDxGZIuKxjXMaQQr92sKsMvZBrBsGLfIYWhER5KzrgmMkPlI/i0Z7kPLOCkvgffNUjyw7mtIhIO4h1b3NtWkgR2oKQMLM/UWexv+HZulAQvzF7W5Xtc5+5egvCCGnFIHpA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 3/4] xen/arm: its: refactor ITS quirk matching
Date: Tue, 29 Sep 2026 22:02:12 +0300
Message-ID: <b29ddd0b36b5564c564c31f511ecddb1d681afeb.1790707009.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790707009.git.mykola_kvach@epam.com>
References: <cover.1790707009.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIVP296CA0004.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:357::11) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|AM9PR03MB8053:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7fd4d5-29f0-4f95-7e21-08df1e5c37c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dypoka521BC37IpblMSjh7XT4gQd2atbBSzG+bj1iehFXf3xzdlKCsbg5ABIBiuAWTDIC7TQBeKf7jjJlK+aQSfd0Z7+MRfceK09fWzOHgYWzpEePg+w+lHD0wZsJLI54K1YsS7KCPwGmCTrqT7gshnLORvpxfAZUR07IC4zUksr0WLAOTBWZmSvfmThe4kY7iTSeJoT62OstEF/WTZREH5cH3k/qbTqn+GovjSlcLhNiqq8hmg7DJI1h/ecgThzkpsbylOKzKQpUATyAO57M3zTec28Jp4bc/moQLANWLLZiO97B9Cxqh2KGcyl27YcJqwCiZSymn5oO+0UDP5VqxrW96z/oqHGYn8NdmqV7feVIN1uSfJCmmjbgQAIpby19cT0hMCSNy2zJtHfHK2G38D14AIryvKqRwws17n50Sl2U1gB45eoyBr9LvcSO1iVEooaCrvXTlpLAiEP+NWY/VGtyXMjO1RYK6Zc25XDxcGYObKuT5JdpkURcD4lmrCX5Lo7yc0ot5Gb8iVRJZbjWZ2t4mwBONp2LVXWimZuUGKp8Y88ABIyMEBzorBYa/E1Lx5oxH1tuIsp3M68RsRta6Ew4oTEOdarHVXcg8qYMvVm69dwWB3LQ0jP756iyvfETO8+Ks9dGKbVOpvA9idyBXaWyDFfyQxZ9CYL/Rbn6nw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?igVtFuwVo0o+0ulp2CJalnipmltLN5SoZeqPgb8tZFlHuM2JQbflwvX/gFOv?=
 =?us-ascii?Q?y92rybDeogcbjiIJDMDgCyhW4gEyu0jWEfxKWhTnOxaZfD4Y203uwPuCnfzJ?=
 =?us-ascii?Q?nzi5PVGesFpth9nDC9I/SnEfazhyBGPEmgOwEPMCitbuizX4ZnfLss+nH5Le?=
 =?us-ascii?Q?zLyaaNMWQ4HNvijgPPd43MN8Gy47R27qjx9SCP8agY3/ae4whVsaguNBlejN?=
 =?us-ascii?Q?AoXAZlB31AQY51LZKqSdoN52bkIi0YjT9a9QlYv/GlkAqLqSw8Kwg0X/2Prh?=
 =?us-ascii?Q?jQCLDgCu4ayVc7w3+fu2TQE6nspy7bCXsmR8JccZbw0KwvjmnQ0LVLnCYmje?=
 =?us-ascii?Q?Qg6eiA3U9wpOaMYsNtQKHBsJCzTVJ1JgDS4cJXwqgw9CVhgZusSKjRQwhTbb?=
 =?us-ascii?Q?WreqghikJOhoQ8/jNbQ+7vahBnmaUhO/zUng9s7kjp6GKUpRZu8V7fvj+eBc?=
 =?us-ascii?Q?E9osuhVG6j2aLyWZ7IOHuwTiVf5KjnXrA/8Ik5/I/6E7StOFfcZswnx1ZWZi?=
 =?us-ascii?Q?WnwqNDTENM24y+yF0W35ZJhIw7/NpOjfi4swYhtGTM1ZwoXnVX6jG+1Jg//R?=
 =?us-ascii?Q?vT31C+eFfoqbUVDMk+7J/W42lLG77jCC67GULYnr65qrKnK4v5rNGeABAaTP?=
 =?us-ascii?Q?zjJh/+wRM7tQum32B5qLMoqwrijTMvpcMCM6WSZIr8ZLaLxo2W7C6xAXHS3f?=
 =?us-ascii?Q?wZbOFzTC+X7TAS8bztLt69x4AXlq3bBOgrBi+m3sfNLlVju6O/R1OSYU4MuQ?=
 =?us-ascii?Q?Rz8vDBqWJx8+odhkMYUkHg8hOPJ7cLV5eunXsfFKBuLncm2dDUhebZgIuVO3?=
 =?us-ascii?Q?jDllU/jgXDMYF5K/xMb2QFMDoeC75uckPxATlxFHYBV/qyg+yNLMoakRLw9p?=
 =?us-ascii?Q?+av5ibJ2Rv1mGo2G+yTWsYq1Fatr9sSQDjKugBlHCxB+dZhW/VWeJAiwwhrf?=
 =?us-ascii?Q?bebTUVxYvad3/swrhoeo+xcDhK0GLjVO/CkUeFVph+TPFnNoapqaaqVolQoK?=
 =?us-ascii?Q?RjGLqD1CBGWINPZsXYph4fxp8a5kZ6vJUA8jZBGCYkma2cfw0GhGI9y323zx?=
 =?us-ascii?Q?hkTuuTNlLGKvOrMMHQcLrVlK4n4IhC/I29vSVNF0aUJVYbQEP+5shUTBtl9h?=
 =?us-ascii?Q?1IeJ4SeSSO6dmr1Tva+8P/Audm8nlOQgnLUJ3rPIGAtz7eeHC+M75zKhjCP+?=
 =?us-ascii?Q?XPOlCzKFXUphhGqvxD8U09B4vSnkNLI+oScaO+4dSBe4Z8JkFNpJhpgktmzz?=
 =?us-ascii?Q?5GojMHxkd/Qw/uOqfOUiqeQm6vQLuDuZpGDEXzjdIciTTDOfr4F8jbK7+Q7I?=
 =?us-ascii?Q?pV3sXgaUCtHv1Ey8W75T5M7Ha8OB/yGjAFB1bVfus5oDXVtW7Yh3pzCPx+1y?=
 =?us-ascii?Q?F4Zem/EkiW8r6h0A7XrnndoUVrEKvSh9A2R7EoGuE0DC6GsU5g8Cw16XTkKi?=
 =?us-ascii?Q?f6+5+AnQc1gkxual+s+Ege/2/qZh0mojYMoGok7lWLBD7PiAiT1e8ruC76bS?=
 =?us-ascii?Q?pRsKxjZWj3curzoLRjhFNZhvICla/ei5NEIrP7wZFpIfzm3yC2+JtbJ0okS1?=
 =?us-ascii?Q?1qca8RnKc5e/YYQ+9mj7mVsUBxF5AslGedMKIvTvXWFSkC/7uvgPDqfECvTQ?=
 =?us-ascii?Q?R5OR0am+W5SUX1ABoCy2d84HtRXEVXeI8dLcauJhAIQcMCMc66BpB+6GTO7A?=
 =?us-ascii?Q?h/9vWuOHem0Knw2+gTzrF/zIRUBvgKrKIEVRRV0ZCo875PLoe+SpFweEzQlo?=
 =?us-ascii?Q?1OX+rjmciA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7fd4d5-29f0-4f95-7e21-08df1e5c37c6
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:02:33.2354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmKuG2l5QKphhVa3RtL4AE+bTN6O/cfomq83MyaQpYiKD9PkOtdaenw/IJ/jWPVzdBIYlIL9zG6i/kn+aKQATg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8053
X-purgate-ID: tlsNG-bad1c0/1790708554-3A0C5034-E7D1FE14/0/0
X-purgate-type: clean
X-purgate-size: 5542

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

Keep first-match semantics explicit. Use BUG_ON() if a non-sentinel
entry has no matcher or the IIDR matcher receives no data. A broken
entry must stop Xen in both debug and release builds, as skipping a
required workaround could cause a failure later. Place the matcher data
and table in init-only read-only sections.

The matched entry still supplies separate ITS and LPI flags; this patch
only changes how the entry is selected.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v4:
- Use BUG_ON() for missing IIDR match data or a missing match callback.
- Keep the existing quirks variable name in gicv3_its_find_quirk().

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
 xen/arch/arm/gic-v3-its.c | 64 +++++++++++++++++++++++++++++++--------
 1 file changed, 52 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 280ace0577..43804a6c7a 100644
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
@@ -65,11 +65,49 @@ struct its_quirk {
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
+    BUG_ON(!data);
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
@@ -78,17 +116,20 @@ static const struct its_quirk its_quirks[] = {
     }
 };
 
-static const struct its_quirk *__init gicv3_its_find_quirk(uint32_t iidr)
+static const struct its_quirk *__init gicv3_its_find_quirk(
+    const struct host_its *hw_its)
 {
     const struct its_quirk *quirks = its_quirks;
 
     /*
-     * The first matching quirk wins. More specific quirks must be listed
-     * before broader IIDR-only entries.
+     * The first matching quirk wins. Entries that match a specific platform
+     * must be listed before broader IIDR-only entries.
      */
     for ( ; quirks->desc; quirks++ )
     {
-        if ( quirks->iidr == (quirks->mask & iidr) )
+        BUG_ON(!quirks->match);
+
+        if ( quirks->match(hw_its, quirks->data) )
             return quirks;
     }
 
@@ -97,8 +138,7 @@ static const struct its_quirk *__init gicv3_its_find_quirk(uint32_t iidr)
 
 static void __init gicv3_its_collect_quirks(struct host_its *hw_its)
 {
-    uint32_t iidr = readl_relaxed(hw_its->its_base + GITS_IIDR);
-    const struct its_quirk *quirk = gicv3_its_find_quirk(iidr);
+    const struct its_quirk *quirk = gicv3_its_find_quirk(hw_its);
 
     if ( quirk )
     {
-- 
2.53.0


