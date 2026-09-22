Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E023C982FE
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 06:40:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428174.1650897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uAW-00041B-Ld; Tue, 22 Sep 2026 06:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428174.1650897; Tue, 22 Sep 2026 06:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uAW-00040y-Ij; Tue, 22 Sep 2026 06:39:56 +0000
Received: by outflank-mailman (input) for mailman id 1428174;
 Tue, 22 Sep 2026 06:39:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x8uAV-0003uo-Ja
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 06:39:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8uAU-00G1WI-ID
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:39:54 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab222af-2eae-0a2a0a5409dd-0a2a450c8692-32
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:39:54 +0200
Received: from [52.101.69.102]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab222ba-f479-0a2a450c0019-346545668e0c-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:39:54 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by DBAPR03MB6565.eurprd03.prod.outlook.com (2603:10a6:10:195::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 06:39:53 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 06:39:52 +0000
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
 b=sXQPhxKfaxX68aY78DehFyCla3z7hSC3x0AupTj2AiVa1ABSaNIGhEJxCFuVpfqID6K4m0Sfr23jTS6Q2eK/igWY8qTAC5rbSl+D3BREP83CvOTvWGmwNgzoVYfM2NuotvHL+7vUlfCVKhLaXvEZDPqT0nYjgUdEId/Ln/1FppYknc5E/CMPmU2Qzr4P98Dn5hGb6hNwv+y9TPtzVWNpkeXfaX+kL/sr47ViB8R39r4+hOGcJ9tkEeQS7tjH8JADEOlxBqOVoyh8jMFn4k5dUbD/hpw9XyaCAslGyohg5UG+2KmUoGM3FDj6fRMhBEf09kmWrbGY1ZcqJTOYuoaLZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSVOOjM+X1r+ZDTIJgdpekSUFlEb6s9XKd+BtJCbN6Y=;
 b=SLpjTvpg0x3ov1BJ6e1IyXiLTRxYYfmB5fMwLfbQYel2tquRDatZd2vK6GpOlFEzfVWpTfbOSmUSblFBpjicKjuZtWWS7L5NhZWb9Ld1j27UvTUfVtE7aUETHh+KI+ss6yKWTn/CijBBRXSH/gkRRfJS8NRWYu3FR4syQz5uwmod5gQK6RRxgStAVl3rg9dZeRgmiOzcDDQ/PxXB2gXNdTivjF19UHGi3/wYWexHAkriPAnIJbtlwSyNg3G/3wkPzzgeZ7EHbdzqcgWdG9Cd1N9xT8VhniplJQ17i8B7pW+EVUT0zGA+lfhJeDGg6PBkLK8LGEnsxXVwRjE5BRCCuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSVOOjM+X1r+ZDTIJgdpekSUFlEb6s9XKd+BtJCbN6Y=;
 b=vKMVn0HN5LveEbt2TP+s2EwwxohynsluIt+wdimFcravUlmFNOvAY7yAl/yXLFsmTcaZ6xNARsxMxnTv9/ajb7P3IKlASBzCurjF/VksSrWff1rPVtdg2Xt1oyV4B0d4uec9zpV8PXYdwqM6d5MfIcic+/NB2ggCfViLBzNE6P26tSXr3Ow2kknB+4JoNr3xjlT0EztcZkGs1FZlrIbfjL+pWt4vcTDYq0zLv98HjQxfDKOl7EUfrfvMCffQ+7Vp9r5M334ufwoWPo5WI0EZh8Tz8N82i66abgEauoPOG71QVD1NJ8He8TXqugnzueSbY8gJvza6xABJnSBdGswBpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 2/4] xen/arm: validate IRQs before descriptor lookup
Date: Tue, 22 Sep 2026 09:39:30 +0300
Message-ID: <6a94111e53249fc449b3df7700f37e026d522fc6.1790056623.git.mykola_kvach@epam.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|DBAPR03MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ea5197-4c87-4fc6-7529-08df18744ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+Gm/5nfZJkYONp5u88yj6CoFXJL7zevoQtbXe7chaOOotOSRZIT9q3zrAlY6sNPdq2eFEoJD/N0qOwcMqIIBWXSG92s9zOF5dDZo8FxUaSgESALv+6yh6lEcslxyUXg8l+GkAgMAQktYIOVuYiUzDm3gtdNCzlAyAw/mjRZni3+Urqb1ITym9ryj/ms+C0NodK3L4jUsz5DeA9hi+eoMdbkV/rNQa6sEk/Kr+GAq3AkvF3VR/ECQbjEClojUCvKo1ixL2AovMuNO3/scgEYpFQyHCeAhL/by3Djz2cfoUj/OVZQjmyBVs0SmjwN3ljtbdFt3WV5OsqvVhl3/i5OFuv12UeW7Mnj9o2OafMSHY5LnklIv+6lOHmABCMHHEAeUACSVSHZDacJ5ERsEyjawkQOKyrdHG6SPf004lMk1oKv1Ae4XExh/6gY5VFbBMXpZiqNSSqx5MJ8b06mCj0dodYrkh4vVFdqYYoNdgK8anNRGp+uwTQduC8JDcG8v8IZUiJlI5pWJHJABRreog8SXLG3LmvawgU+iIaRXf7iZiZeLZXYHQdOQwH3SFohwPwJAs4vzgNWKBRZxu5+K/r+DLeKwihCUepnUa39j2XgrpzT9dTk8VJHtzbGT2HSWI9qv7823iOYapHBL9nlal8HR6YoIWnOKZnjM1i93igDrzX4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X+5MD5DROwpSrTwLlMZ30xUW/o5P9NiYfgAYY95tRg7I6cVejiorryZoVDns?=
 =?us-ascii?Q?xkUVx6kOM86ToACvIOBKqj3gjs+Z/JeyjRKYZVgVXjzZFtOwqeUvzgZzZ15f?=
 =?us-ascii?Q?sfUo9fwVjqVYNvsgvaEcByG8c6tfFGrmbSIhpGb3mzcNXe/SKPTRPkUuKeRE?=
 =?us-ascii?Q?Bxd0bP8MDYUjtmt7Ww/3pXcT6HWNNCm3WDBfCrxD+Ky0TKni0GS9VJa/2ZkO?=
 =?us-ascii?Q?q9c16ytynHr+u+rjJFAkkQy/JtncFgENQd3LLp35J32sckPx4OX1kHOZozFj?=
 =?us-ascii?Q?52oBndgAG8Bf804RpyGziFQxifmw1PYljJYY+669RyrgR8yceTMPwAam79r1?=
 =?us-ascii?Q?ASYes1gKzD940ZCvrmhpllPbs77QUle7JDArzHwMrOivPW7XGvNnaw6teJTp?=
 =?us-ascii?Q?TpH2fEcaEWHgAqBo7a5FYJK+gYhz2dlN/eKd44K2+y/tDdVyQ3vfDXorw4ba?=
 =?us-ascii?Q?MpEwAnxkCgi7h0sDzrW6T2zOD2JxJ4fOsvpjo0JYv1Tnw9YUf0tK4+0eeA3J?=
 =?us-ascii?Q?R5ntjBXLwiY7RP522JW638uBeFGypePp8nhS+CqVM5utrXk4TYjnnlPNmqzo?=
 =?us-ascii?Q?oS6VDZeJbMBEo5W3Cc4vW61FqCVogwj0BMQyKDkfW+QrXmQqtz8yG25P802S?=
 =?us-ascii?Q?ko8BWezUlH5vpIQgoMSmE4VpUxv4VR5YmcqHL6LsvsAvKII7jnYOxyv+TTt+?=
 =?us-ascii?Q?1a9Vvyf2tnWcCprXh8551n23RyZ7Va3IWc4qLoQzXZkL4WLIZvE2Qd7/yi9o?=
 =?us-ascii?Q?/Ef643YzUdof47j035u/O66T3eghePuXdAh2UOW6Zbwc6bjG6kz5iFysuv/R?=
 =?us-ascii?Q?Mfmkhp8I45571RXzT/orgrZsl5WrplXTOwO2KTvG6vxO1ErXil7mZ22vUf3n?=
 =?us-ascii?Q?42DuxVF0hqfrHQ+2kGrk1vLRbJN6J7PIN3O2OSsDypJXrEky6VDbJBzxJhtL?=
 =?us-ascii?Q?eP5U9rBXfwYq9Qx6amihOwA5D5wcVxJnK2PHHhoZzD4w3FMYgWp6/yXR7SJv?=
 =?us-ascii?Q?mtaWHyM4DEevTQZsQs8ULy5aL4peB/961udjiiZm0NVvv11b1TZbacNzHa/n?=
 =?us-ascii?Q?kmlNixZ5nVnXRK3mA4GWEjabI6J/UBvX9xIaMQM38CqNMauuoC3fpLDA8h13?=
 =?us-ascii?Q?6zcXocDGZCBR4k0UxNHvAVfauC3Maz86ZvKOKehmnaCk4LliFwb4P9kFC45l?=
 =?us-ascii?Q?h9Ns5DVF9OXQ8KSV7g+B+1J3zeKY9AdEkk+FmzgUNGSSw/id8uSYIISy8ewr?=
 =?us-ascii?Q?lM+cwHi6ZY61fq/e7buNEPP2lkneci0OHO6c3ez/AjeByqRVHbTf8QDyV8zm?=
 =?us-ascii?Q?l6eHhxFu+CWEbbOTw9ZDscJ5CWl9ms2Bj4Oueaz6zILE8+FhV7XVhlNrK3Yc?=
 =?us-ascii?Q?M/4rpGNaK1UcTt18wwz6wK9oZBkCLzaA2ZqqQOhnrPlyCYcfgPQY8087dHV4?=
 =?us-ascii?Q?CPflmDbUxGJo1cC3qdK45aftBy4jnNq9ELkZc2kEigMe5WernCKbJPZmBuOf?=
 =?us-ascii?Q?RbOlFLW0K/eUANpQVY+kbN1qghvZtTo9zG6jyMeSEUABhKl0CB2aObg8fNfI?=
 =?us-ascii?Q?MWSLgQBGF+bSsya3iyH9Fg8NemTueuBgmnSfsLOYOEwxLvAjrMZY36Wla51D?=
 =?us-ascii?Q?g6vGbCVzRyzfT7UB4P7yXDvcNg239zk9xGZSz3bHBc4AIrNIWaQBwveuEIfx?=
 =?us-ascii?Q?SRU5owGSR0Bb6WxrSk4TdfoJKxtdVfj3G67lxaQ4mrXDpDxuWe3ASZt0AVBn?=
 =?us-ascii?Q?73PnrpHYvg=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ea5197-4c87-4fc6-7529-08df18744ea1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:39:52.8106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4gri+UUYSA2SmkehAEb3cfk9oE1uGiVllFkHE5ey95wDkbSQGv9T/RS4VQ3GNAqEreA6hynfsPlYqaJNVaXzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6565
X-purgate-ID: tlsNG-d25034/1790059194-76EDAA5B-109ED293/0/0
X-purgate-type: clean
X-purgate-size: 3643

GICv3 eSPI support makes nr_irqs span the architectural INTID namespace
through ESPI_MAX_INTID, but descriptor storage is sparse. local_irq_desc[]
and irq_desc[] cover INTIDs below NR_IRQS, while espi_desc[] covers eSPIs.
INTIDs 1024 through 4095 have no backing descriptors.

Validation based only on nr_irqs accepts an INTID in this gap.
__irq_to_desc() then indexes beyond irq_desc[], and callers may lock or
update unrelated Xen memory.

Reject INTIDs that the GIC reports as unimplemented in setup_irq() before
looking up a descriptor. irq_set_spi_type() can run before the implemented
GIC line counts are available, so validate descriptor-backed ranges there
before looking up a descriptor.

Use the same descriptor range check in irq_set_spi_type() and the
assertion in __irq_to_desc() to keep them in sync. Log the IRQ number
when setup_irq() rejects an invalid line.

Fixes: 98f7060b9ed5 ("xen/arm/irq: add handling for IRQs in the eSPI range")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v4:
- Share irq_has_desc() with the assertion in __irq_to_desc().
- Log invalid IRQs rejected by setup_irq().
- Drop the unrelated blank line removal.

Changes in v3:
- Add the requested bound assertion and retain the SPI-only comment.

Changes in v2:
- Validate descriptor-backed ranges in irq_set_spi_type().
- Validate implemented GIC lines in setup_irq().
- Preserve is_espi() validation with CONFIG_GICV3_ESPI disabled.
---
 xen/arch/arm/irq.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 73e58a5108..8d3517e761 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -85,6 +85,12 @@ static int __init init_espi_data(void)
 
 static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
 
+static bool irq_has_desc(unsigned int irq)
+{
+    return irq < NR_IRQS ||
+           (IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq));
+}
+
 struct irq_desc *__irq_to_desc(unsigned int irq)
 {
     if ( irq < NR_LOCAL_IRQS )
@@ -95,6 +101,8 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
         return espi_to_desc(irq);
 #endif
 
+    ASSERT(irq_has_desc(irq));
+
     return &irq_desc[irq-NR_LOCAL_IRQS];
 }
 
@@ -416,6 +424,12 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
     struct irq_desc *desc;
     bool disabled;
 
+    if ( !gic_is_valid_line(irq) )
+    {
+        printk(XENLOG_ERR "Cannot set up IRQ %u: invalid GIC interrupt\n", irq);
+        return -EINVAL;
+    }
+
     desc = irq_to_desc(irq);
 
     spin_lock_irqsave(&desc->lock, flags);
@@ -647,13 +661,21 @@ static bool irq_validate_new_type(unsigned int curr, unsigned int new)
 int irq_set_spi_type(unsigned int spi, unsigned int type)
 {
     unsigned long flags;
-    struct irq_desc *desc = irq_to_desc(spi);
+    struct irq_desc *desc;
     int ret = -EBUSY;
 
-    /* This function should not be used for other than SPIs */
-    if ( spi < NR_LOCAL_IRQS )
+    /*
+     * This function should not be used for other than SPIs.
+     *
+     * The implemented GIC line counts are not available when early
+     * callers configure IRQ types. Check descriptor storage here; setup_irq()
+     * validates the implemented line before the interrupt is used.
+     */
+    if ( spi < NR_LOCAL_IRQS || !irq_has_desc(spi) )
         return -EINVAL;
 
+    desc = irq_to_desc(spi);
+
     spin_lock_irqsave(&desc->lock, flags);
 
     if ( !irq_validate_new_type(desc->arch.type, type) )
-- 
2.53.0


