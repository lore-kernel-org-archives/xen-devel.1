Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F4DCA5FAD
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 19:02:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436702.1655401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBd64-0001sE-Jq; Tue, 29 Sep 2026 19:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436702.1655401; Tue, 29 Sep 2026 19:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBd64-0001s7-Gp; Tue, 29 Sep 2026 19:02:36 +0000
Received: by outflank-mailman (input) for mailman id 1436702;
 Tue, 29 Sep 2026 19:02:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xBd62-0001qP-TU
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 19:02:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBd61-00EjhB-Vm
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 21:02:33 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abc0b39-2eae-0a2a0a5409dd-0a2a45078172-22
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 21:02:33 +0200
Received: from [52.101.65.74]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abc0b49-b4ea-0a2a45070019-3465414a5db0-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 21:02:33 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by AM9PR03MB8053.eurprd03.prod.outlook.com
 (2603:10a6:20b:3df::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 19:02:31 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 19:02:31 +0000
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
 b=Uf9EbISP1pmmoMKGLJgQUQ28BFze+rc9T8l/lPEfvL7QBwRiPhToo4Kr4nqSI3zzAiTyzpudZ6/RrLejhNTc3TVp4/gT/2orZlbBhuyCk215NpJ8Dsn/n6b4PHOGFSsMT8GHa8Ox9UQ0579HT0/zU4fsKuJCZnlUmr8wOuTIp8xh3VCpX9wPT+XnQ21QdNb0PntJ2W6F1FevqMNCPM0FFobJLEMI15OnYL6gAGjFYAiEXostWSmt04vFMvJftcLLVOyyCKzu093EtmrsTXbfe3cWXtb7XSuHTYekcO733o8z4mOVnHbjZVK4f5skvdFLXtIGIRpl8+CJOyXXIgLlBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSgjhBBCrLvg+n57wO6S0h6VDJsQ8wMjCisaktnE5To=;
 b=MATGdLWhThkZGLp9jP+C5FhJS2HY1kkv3C6hRqtuKQXsaOHwW5xi3hEoeHCBbnFhEwsKrvf4XtUfWEFGqfkQ2Zddx3PWruilNJLCgoUQ7A6miXdg2SwWbPsEFX9dYfLse72I4eeAQmWlF15WogaAP7Op0uo6HgwMElQVIL5RjlFThgBPkkM2JngL9leRnMrRtb3+A7BkzTj5WODq2Fok9/YzlNt5Djtgh53F23w8x6sliiXx2fHg1X6KJPLB5TcfpjX2cLRoe97hsBkgyLCjhF7g/kPSLCx20KAbF4qORrr/F4nSARgYaAltVjGzFZ1hK82Z+zJh/whP3cdmFNtHpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSgjhBBCrLvg+n57wO6S0h6VDJsQ8wMjCisaktnE5To=;
 b=Z6STbk2Al1MvW4RsqqdotTz6MEoCjCQ16bgDzHlGfPuRPnGap/S7ay4RykPYqs0wQI+zkt6woYDeLZ1kbJcpvh4PrFO+7BJtUumBMxDZEFYp61L77Vkp3KYrcgTIG68HAeat1DXFvWFKarKvRV2gbTOcR+5wvjLW75CaVfeRYAlqbaE05cR/3ZY1vm61AK4uaxPN6lysqm6B2L+F+VNhja7l3U4v0MoCDaBvgOLTarYnP3zc1JnnnRNwvzUL11NOWfwJIZkfhrnHeLFQW5pW9pCWPvC741UnpdDam8qfzpDC0lBgf9F6zsG59vkZ+ygL4eUqyTcvsg38n2YU+rdGig==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 2/4] xen/arm: its: separate ITS and host LPI quirk scopes
Date: Tue, 29 Sep 2026 22:02:11 +0300
Message-ID: <8f586eb079dc00fb2f4612349bf55d84bf52d105.1790707009.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8f975d10-82a0-41a4-b54b-08df1e5c36d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|3023799007|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4GUD1JkeooJWNEqvhuW3Q93I/aGC8jm/IFpm0D75cYN5AzfXzfhcOLdggW5xzV16rFt3LwcVbLWlQjXDnJY2UNCKaQOHs9p3+Yyqne6FvFfTn/bK0VCVcznxP6w8iHTxodj20sbsJJgRR/QQvdNrBMoKrDSJumcVAAiX6l41pk4M5u4cAiskzA6vg3p9zpOOp9Plo5jh6Vr0sgudZKT1qnySxS3gCpqQ2Rq7q2gr7iDst5NzLbtO+3l79eJdrQ6W2ysd8hWSKzLB/Y5PIwDaN/6oQvvz6v49TYb3nT0dKcpdL577Bnb5o2rTZ37ne0gZmGPu0yCXy96BleGP2cPIt6pVuHPZwEfXQIsc6X6hjio7Ztb0DCvNbjfmkAyOFHsAwztxicOZdC4kYmN2augx0ERUh0vkz46hvUHkIyfkCi5l5QU85ZtawbZsMeFzEx1yLKn4JHBxxjXYicllw3cijMHXVo0aznrtDXzIHEinPZ2TiHU0jiNeuC299bzZ0tgPOugYXoJjypWxU/zbzJpwxqqoYMIYFv1GKQtWir4sGBkIsd2OIDmf5ENrzwQKKU/asOx3eXm/TuIVdOOpEuld2K49CvLRYHdnM9k+voEvhsMm6w4sVo7HyzVPxG5WtYNjUlKShheWrQbXnmjx8qUjxjowVItX+gkqQ7PgrH68af0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t7vUAFgTUp4iJGkZT0ZJ0ONodK1RXBH++Xr4KhK8uEKUfa6m7NX9HJHB9MZG?=
 =?us-ascii?Q?D/+yr/gdkW2T/CkxVE6tJMwQSQUMok3QTs6ThJtWDFXIr4gOIla2jqjOwCMZ?=
 =?us-ascii?Q?axUaccL/yXJ8L0x+kYLL+lXUbmrPuhNLOWLfcuEtHtPrDd3YsGSIG9vVd8nW?=
 =?us-ascii?Q?Tupmc1F3+Q9DE1PURhOc+f8YgjANwLbjUStz1GpsFvlUVOuFZVH8OA7uMp2p?=
 =?us-ascii?Q?1QBqYQm254qa1POIi/QIkPaWoTiqphysqaTguDeyuwXa8BI5QiJVI77w/7rD?=
 =?us-ascii?Q?EWoWHMNCzLHYvl62/KX92AEUctgvChbJ/khkeBY2Z+hV3Gz2Bju6aAj46moO?=
 =?us-ascii?Q?FNjrUShqJ0suogLMPAEFbfVZix5bG/QWKQwBoP9R/4kv5zBvP07OB2ww+OVP?=
 =?us-ascii?Q?A6pcdG3Av55XJwcxaiwtNOOBejFg5l5Ual4qf3mrM78bakwB1khjhUYs24pz?=
 =?us-ascii?Q?tOmY53++LItSKfy0U1q5Y/9rCfWjX/7BQWgikEsy+64D+vq1waTZdVpiSXhQ?=
 =?us-ascii?Q?5UxBVrkzbt6utqH9nRUW1JH2eYKvm8hu1E9UWveReeH2zttCkj5kTcKjnj4N?=
 =?us-ascii?Q?ii+ZEpPFZca+OT/YOljxx0W7xmYBxfFUY2eUUjM6mBgAp1mmo32NcWYznvV4?=
 =?us-ascii?Q?UHNhqp/SInH76S1YE6Iu/hpEuyxyAfextqvD1WZkxFiQU3ADaxT2Plu1LKHY?=
 =?us-ascii?Q?kzx8KOGfHtlcaNt7gDQnJgugSl4R/L/NZ8XBlLnYpZWQRrTn09ZRUIPQhtoF?=
 =?us-ascii?Q?05jDcKu1ZAMB8BV57Dgia2dQmOFRwbVqgpMDZqj7rgxGsKVFG2qFTdgiuHDA?=
 =?us-ascii?Q?VRYYbSZBy8ts7WACNhHP9glRz4Vwt35GD8f/3MXjfnVaDCEp46ZV+gFSge/2?=
 =?us-ascii?Q?4ZDJEAIuVKKI44pxKesVdmGHVrO4EjKX0eNFb8IzurAgUV4g/vpATXbe3ZFg?=
 =?us-ascii?Q?ndcU4XP/IOlbUVW4IgA82uNcxCk0JMkOj/OJrja1pDJb5HIFDL+H5Mb5ZTgO?=
 =?us-ascii?Q?6fiMBDFNC9zeu6B0DXtKzPox8POBwWKXLZOiyl9t5wvpLpFnLNZjmI2JBgMA?=
 =?us-ascii?Q?zE7qzIkGd8wzVmgZgoHY99rEbT4kquIESiuDdDAY0YLXDVppBvonlfqs3UR9?=
 =?us-ascii?Q?dla311TU/4mIitMpmSjxrPd07lhKYU+tS1eoIktij6xXbYNBStmipUfKGxau?=
 =?us-ascii?Q?9DWi5aNZQIaYv8xXYQ2vksNCtUXGAigsUJfqWMI92ClekhM3V8QlNWi26g7N?=
 =?us-ascii?Q?0wpQm4W8XACo8Lt+xNEyxQtNjM3SzHp9GpEtV+6ZPBRK4y96QVvPdW7in57q?=
 =?us-ascii?Q?QXB/Xn0mlKRdHNxuquvLEfLfESwZDhWgP0sIn536setVWN8d0czbzCqfm7At?=
 =?us-ascii?Q?EsaOsUfhnfLWVHdSffZGs+TlWz3ktWMsBWGqVEu8eGqH6Kul/ATXtfoKG2Zz?=
 =?us-ascii?Q?0dA90yAYOo+kv/GPVqwYCMuRi0f0f8CwlrKlRDGa5oMPunZnjigjE50XYa0P?=
 =?us-ascii?Q?zRef/HAIAXK4BmopmGWVJP6Y9RTu+Ib03HXsPj2ZOdIxjntJOw8XbzxqPm+x?=
 =?us-ascii?Q?UYotTQej9P4Zu/ze4u8B/KuwhJV97nv1fbze4LKyt04tpC3AUszEqi1c7n5s?=
 =?us-ascii?Q?MWw+NLth6/t4ULFPQX5mIo29CnZKyznDanMV4m3sPmvEYqGAQIhdEXTLRjoi?=
 =?us-ascii?Q?wwkvF7V9HbXvkNKqi1UBAzAAeSmloQ3vtYqJE8bfxWtR1htmhUO0DbXshmMq?=
 =?us-ascii?Q?oy2dTme15w=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f975d10-82a0-41a4-b54b-08df1e5c36d8
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:02:31.7229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmTPBSLz077GQ8575k+zSJuGHYKtFPYzyH1bdcQcKr+iAm7aY+usURAC6XSCQJnx5yFzDJi2A3czMnKky8K91A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8053
X-purgate-ID: tlsNG-ef75cf/1790708553-A76D2AE4-A321E718/0/0
X-purgate-type: clean
X-purgate-size: 19967

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
Changes in v4:
- Calculate the table entry count in its_map_baser() instead of passing
  it as an argument, and move the table type selection into the helper.
- Keep the ITS/LPI quirks handling comment above the shared helpers.

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
 xen/arch/arm/gic-v3-its.c             | 150 ++++++++++++--------------
 xen/arch/arm/gic-v3-lpi.c             |  45 ++++++--
 xen/arch/arm/include/asm/gic_v3_its.h |  19 ++--
 3 files changed, 118 insertions(+), 96 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index 511e49a116..280ace0577 100644
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
 
@@ -438,19 +424,41 @@ static void *its_map_cbaser(struct host_its *its)
 /* The ITS BASE registers work with page sizes of 4K, 16K or 64K. */
 #define BASER_PAGE_BITS(sz) ((sz) * 2 + 12)
 
-static int its_map_baser(void __iomem *basereg, uint64_t regc,
-                         unsigned int nr_items)
+static int its_map_baser(const struct host_its *its, void __iomem *basereg,
+                        uint64_t regc)
 {
     uint64_t attr, reg;
     unsigned int entry_size = GITS_BASER_ENTRY_SIZE(regc);
     unsigned int pagesz = 2;    /* try 64K pages first, then go down. */
+    unsigned int nr_items;
     unsigned int table_size;
     unsigned int order;
     void *buffer;
+    uint64_t cacheability = gicv3_mem_get_cacheability(its->quirk_flags);
+    uint64_t shareability = gicv3_mem_get_shareability(its->quirk_flags);
+    unsigned int memflags = gicv3_mem_get_alloc_flags(its->quirk_flags);
 
-    attr  = gicv3_its_get_shareability() << GITS_BASER_SHAREABILITY_SHIFT;
-    attr |= GIC_BASER_CACHE_SameAsInner << GITS_BASER_OUTER_CACHEABILITY_SHIFT;
-    attr |= gicv3_its_get_cacheability() << GITS_BASER_INNER_CACHEABILITY_SHIFT;
+    switch ( MASK_EXTR(regc, GITS_BASER_TYPE_MASK) )
+    {
+    case GITS_BASER_TYPE_DEVICE:
+        nr_items = BIT(its->devid_bits, UL);
+        break;
+    case GITS_BASER_TYPE_COLLECTION:
+        nr_items = num_possible_cpus();
+        break;
+    /* In case this is a GICv4, provide a (dummy) vPE table as well. */
+    case GITS_BASER_TYPE_VCPU:
+        nr_items = 1;
+        break;
+    default:
+        /* Ignore unimplemented and unsupported table types. */
+        return 0;
+    }
+
+    attr  = MASK_INSR(shareability, GITS_BASER_SHAREABILITY_MASK);
+    attr |= MASK_INSR(GIC_BASER_CACHE_SameAsInner,
+                      GITS_BASER_OUTER_CACHEABILITY_MASK);
+    attr |= MASK_INSR(cacheability, GITS_BASER_INNER_CACHEABILITY_MASK);
 
     /*
      * Setup the BASE register with the attributes that we like. Then read
@@ -464,7 +472,7 @@ retry:
     table_size = min(table_size, 256U << BASER_PAGE_BITS(pagesz));
 
     order = get_order_from_bytes(max(table_size, BIT(BASER_PAGE_BITS(pagesz), U)));
-    buffer = alloc_xenheap_pages(order, gicv3_its_get_memflags());
+    buffer = alloc_xenheap_pages(order, memflags);
     if ( !buffer )
         return -ENOMEM;
 
@@ -562,7 +570,7 @@ static int __init gicv3_its_prepare_single_its(struct host_its *hw_its)
     if ( ret )
         return ret;
 
-    gicv3_its_enable_quirks(hw_its);
+    gicv3_its_collect_quirks(hw_its);
 
     return 0;
 }
@@ -583,33 +591,11 @@ static int __init gicv3_its_init_single_its(struct host_its *hw_its)
     for ( i = 0; i < GITS_BASER_NR_REGS; i++ )
     {
         void __iomem *basereg = hw_its->its_base + GITS_BASER0 + i * 8;
-        unsigned int type;
 
         reg = readq_relaxed(basereg);
-        type = (reg & GITS_BASER_TYPE_MASK) >> GITS_BASER_TYPE_SHIFT;
-        switch ( type )
-        {
-        case GITS_BASER_TYPE_NONE:
-            continue;
-        case GITS_BASER_TYPE_DEVICE:
-            ret = its_map_baser(basereg, reg, BIT(hw_its->devid_bits, UL));
-            if ( ret )
-                return ret;
-            break;
-        case GITS_BASER_TYPE_COLLECTION:
-            ret = its_map_baser(basereg, reg, num_possible_cpus());
-            if ( ret )
-                return ret;
-            break;
-        /* In case this is a GICv4, provide a (dummy) vPE table as well. */
-        case GITS_BASER_TYPE_VCPU:
-            ret = its_map_baser(basereg, reg, 1);
-            if ( ret )
-                return ret;
-            break;
-        default:
-            continue;
-        }
+        ret = its_map_baser(hw_its, basereg, reg);
+        if ( ret )
+            return ret;
     }
 
     hw_its->cmd_buf = its_map_cbaser(hw_its);
@@ -738,6 +724,7 @@ int gicv3_its_map_guest_device(struct domain *d,
     struct its_device *dev = NULL;
     struct rb_node **new = &d->arch.vgic.its_devices.rb_node, *parent = NULL;
     int i, ret = -ENOENT;      /* "i" must be signed to check for >= 0 below. */
+    unsigned int memflags;
     unsigned int order;
 
     hw_its = gicv3_its_find_by_doorbell(host_doorbell);
@@ -801,8 +788,9 @@ int gicv3_its_map_guest_device(struct domain *d,
     ret = -ENOMEM;
 
     /* An Interrupt Translation Table needs to be 256-byte aligned. */
+    memflags = gicv3_mem_get_alloc_flags(hw_its->quirk_flags);
     order = get_order_from_bytes(max(nr_events * hw_its->itte_size, 256UL));
-    itt_addr = alloc_xenheap_pages(order, gicv3_its_get_memflags());
+    itt_addr = alloc_xenheap_pages(order, memflags);
     if ( !itt_addr )
         goto out_unlock;
 
@@ -1217,8 +1205,6 @@ int __init gicv3_its_init(unsigned int host_lpi_bits)
             return ret;
     }
 
-    gicv3_its_validate_quirks();
-
     ret = gicv3_lpi_init_host_lpis(host_lpi_bits);
     if ( ret )
         return ret;
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
index e1322b94f8..2a8233df54 100644
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
@@ -199,10 +206,10 @@ struct pending_irq *gicv3_assign_guest_event(struct domain *d,
 void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
                                  uint32_t virt_lpi);
 
-/* ITS quirks handling. */
-uint64_t gicv3_its_get_cacheability(void);
-uint64_t gicv3_its_get_shareability(void);
-unsigned int gicv3_its_get_memflags(void);
+/* ITS/LPI quirks handling. */
+uint64_t gicv3_mem_get_cacheability(uint32_t flags);
+uint64_t gicv3_mem_get_shareability(uint32_t flags);
+unsigned int gicv3_mem_get_alloc_flags(uint32_t flags);
 
 #else
 
-- 
2.53.0


