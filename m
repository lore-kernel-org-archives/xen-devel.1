Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6804C5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 11:33:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394001.1632819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwI4G-0006l4-SE; Tue, 18 Aug 2026 11:33:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394001.1632819; Tue, 18 Aug 2026 11:33:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwI4G-0006kw-Ld; Tue, 18 Aug 2026 11:33:20 +0000
Received: by outflank-mailman (input) for mailman id 1394001;
 Tue, 18 Aug 2026 11:33:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wwI4F-0006Vd-B4
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:33:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwI4E-00BTlp-Np
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 13:33:18 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a8442f4-2eae-0a2a0a5409dd-0a2a4503e17c-32
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 13:33:18 +0200
Received: from [40.107.130.130]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a8442fd-fae8-0a2a45030019-286b8282bd98-5
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 13:33:18 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by PAVPR03MB9598.eurprd03.prod.outlook.com (2603:10a6:102:301::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 11:33:16 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0315.012; Tue, 18 Aug 2026
 11:33:16 +0000
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
 b=PmuUxKl4mAHx2fh1kbIG7whTmNtoBJgzrNLFSRevSfu6mA3s2GhXHkB6xH4axyquLq06R69hzyV8cdQas+HKFoOFzL++Hnb0wskQnwL9oJ5kD2rJ8yCLdCTsXZckFpH1Cx1sgBimYqeNmcNR5AGnV54N+opXRKTyyJKUXMhpvojiLGKNxf4sSVnFlgnTDuI8CmMCiPn/f0M3AVDK4gui2t5X7S/WHqAfd7DS6er3ybZZ8eAVnEP8hCUZXKxU43s0mcuIRNo5JJx6it/BImVmPoGFiXjvpgPgJepwopCvpV0P+t50fJaBXPHd4/4Rf/a1WWpT0acmRTSB8X+/mbyL+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3h0aDabB4S3N+q+n0dwzdXfsKs/jsW96yHUTuqm6Mk=;
 b=e7SxnYfW/bsU5HvTqX98o8MeNhq7dMwAitR48kpZ2s9cuJHaSqsZgC1XpRC3qvttU1IE+H7KuSe9Nl1o+AK0NSIfnb5BvZxBR2ZYDRsbwbJij8Dz1tn5DT+ngpDT5n8ps3mbHOgAB8Ydvypm4A1Z2VYviaKWgbIicC9DzHkr4VdZnkocivPEriQEidEXRboCRj6FGyUSGY3YuhSajUSU4G+428wXRD3gRISDBNQO73TMVtcEhsGAi6FxASngd/ATVI+20xoEXL5AqHimxscJsacEKKCAYa4LEJRjdHbJRJvG2qsjH99dh6Gvf+V4E7g+C6f5v6TdhdS8bcaiGo8Ejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3h0aDabB4S3N+q+n0dwzdXfsKs/jsW96yHUTuqm6Mk=;
 b=vHpOKMJA8g2t81NJnmVrnt6jNZNFGX0hOQjTSTWVKqit8ERE7bhp5rrX0TN3LgXGFzKLpR+CGjpS6DYQQ+tAPfnazESOS4lJwNH4IMNAXSPJljjAfUBetnzuDffdYDzCm2T++d/EDsZvG+8XmsGUltbHyL2VX4wSAunssMVn5+Qgk7smSkGbfYu3K+/p4iUJOrzdLWqWuyYFaVn4KKRTNLDBjcHeWeRUALXU7zrTDowCBnKK7awzDflj+6M3FuN65Wrv6pcU35oPfnf/lQHjgkOnywYFJpQ702vK0pRDldFe86rHSL0WKLMYxaeh0OZuhGB+DiIiQiq3nb+/H3kdbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 2/4] xen/arm: validate IRQs before descriptor lookup
Date: Tue, 18 Aug 2026 14:33:00 +0300
Message-ID: <355ff5a0aab671894a527ccb7b5999db6b168de3.1787050437.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0485857c-6228-4148-890d-08defd1c7ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Ux1Aeh6oeDy3SUHp1wziUsVtVbyFjXlAZ61JOX4V69qECUiPyaMBaZuv0EDhW90dZsFFyF9HarI30Z2bn79zma48/z+AbEfqrit7mO5mGNYEvEKicAUlpfJg3ws+gnKNJ9pCfRKBOPLrvfVoo0rI1ET+zNQPw2zIJsoCOYuS3BrNSVrBwOqqBYPQQQjzTHbIQ4Q6IXaYWXTGCD6UD6RaWw/+2K8ZuL3Kh9oL28QC/4vjbtMA1RXvIDgPlpd53yn8ArS6Vps0JhuGfZz2pWnkSZYDU8zA78ub5XW0eVi6cQXviEgsXO8M/lY7NxgSJpIqtOa7rh0FuB4nuU20DJ3qGyEDBbYw+dVCLuAH+YJnuCwGsHYLaZfUSxkSMRFUVnVi3p7WV3014jbyDQ415Kb+B5WzQzNPR9paH5xN+kyLAN+YPRSLnUADzZuv6QO9nxSIzgZYhkhixCH228Xo6zn7wM01j/U/BJMD4AK/XfPgaDQN1Ck/xi1N95ZgvUm/+9tEgYzbQ3+NKCaYoozpY/vxCcY6m2IU/xFX+gvjZ84o5+qwCPJfyJl9/6sEleZQbDiBMvjW5Ctf8xe/jWFQ0J5O79OJQVC69Fz8lWW62w+S3oitRMX3c4GJPKA7ndtwhHK+UW+RZxlsE69wyNPQvGdiecxVfXIVwEFAhZTeKvAuqKo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pnr95fPRlfcRG7xmT5WHoMYgtsDkwnk0MzoKRWibp+oYrJ8qI4qQEB3mj+ka?=
 =?us-ascii?Q?EWS4KZFf4aivM1WiL8YwOIMZVj7Xe43ic7xb8vmEnmhv+VeQ5ctjacR7m2Jl?=
 =?us-ascii?Q?icEqv+UjHi5c0p89Rg9G8n/6l9vCMNRicOBWopSBVZxlpDBPVYeTm/BPmaXZ?=
 =?us-ascii?Q?6NbOIiv7k6f+s3qWPFUIvOegAhHJvvwpA7fCtlVp8nCAhOywHR65uv+DbwC3?=
 =?us-ascii?Q?x/XKF0OUJvI4JM9J/tu0lWcM6DsdlasiMDcebldxzpKsiTdGn5dwrB+9eKSw?=
 =?us-ascii?Q?ZLTC7NkWifWKSGuqN9T6ZWRsL5eljIIlxIgIhJJRUw7aO3lfov2ILIfxN6bi?=
 =?us-ascii?Q?uvljWEfcCT5rYx46W1+gcJL+z1gHCJ3ZeM0kKSmY9DJO8Z1LN6KeVSi2ueqa?=
 =?us-ascii?Q?wHhckIRpTEAw6A+vMUCZPr/iTUWnQZ05wF271hDWH74G3JginHRH9mVz63VD?=
 =?us-ascii?Q?Su/o1C/LhrCIX0YOyYYkkfDp8srUYG4pX+228sqRWpM5JqadenlTWUaRygoU?=
 =?us-ascii?Q?IQzqkmEyMSyMgsNED2otLQr4ZzFhpgvNrDpyrPA7uJgc3JRRYOV1bj4CVISg?=
 =?us-ascii?Q?txab/ZUJPm8QwYKEty8gJ2BNkoF9/cruJvE/AgwclXzf+dq5hjqUGt9J/UcO?=
 =?us-ascii?Q?8/Ld/Ed7WTzwNlAkzYgjq9hHFZPH38hRuC1ujd/qMwArRHNagpXdx0enhvp3?=
 =?us-ascii?Q?aJOjX+dsMHNb6igDIlMXBGSL3IRe77qsWg4fnmWOHzGS3D/emVqpYVPYToNc?=
 =?us-ascii?Q?JBF7dmdT7xl0hLz3UPNbkVb/AOGilJQPR7q/z4zq5orssrTDSF8RWub/s9pN?=
 =?us-ascii?Q?ndoBPfemozUfPSxJgcmhOyZ6Mkntkp+v+TGc2UYt8tKNjCtJhOouQNLdRQJ+?=
 =?us-ascii?Q?A+b7W9gWf5hD/9ePl2qAyzRJbfXDoz45QFVO9GSRnFXHd/qHUWFMJfiN+PAi?=
 =?us-ascii?Q?sEHLzgupFXKp9WeZtLvJnsfRNe5Ych04ZC//hO6FG0iCaTcj+w/D1ONeaDO3?=
 =?us-ascii?Q?6m525WaGO6BrPZViEMxzzFP+gum/sjOCDJXRJvu4+mh7c0d8cyVZR3M/6mxU?=
 =?us-ascii?Q?Gm8eaXbFE3i6E78MXfScq7MDpXI6CzPK17WD7Ie9jGEiuFbBPyFHT/uVaNEG?=
 =?us-ascii?Q?w4jOhmRGeO+PDVDU7ajmQeytBqocTg16U5SbJvJvUXH9tDdzKFHEbQ7HqjrJ?=
 =?us-ascii?Q?kjKGO00XHpQ3RoSVojgFlK9NqCALwBbxFr7Dn5D8Ocii/78uezT7mrvdpoZY?=
 =?us-ascii?Q?F9N4EGKINvXxQctvTNg5+NLxKfJzHhZ0f4lvOA7h2G+A+z5GDx9JsuKZJrrD?=
 =?us-ascii?Q?DlWSibgSYh42pBdjbj8r2b5y3QdiMubXjIogytYZ3IeS+EFYDyClUAWSxEcV?=
 =?us-ascii?Q?MOqYJ2eBFuvd3zpaJlaLMmKyQb3F0t9SfIdEysRZLbVfSpLmnI2B2FkDkc4y?=
 =?us-ascii?Q?GbHun/dTqAABEUsQuU+K9ww6xEgU0p5/aYeqmqMIE2g003cuUMSDF0kWbE9+?=
 =?us-ascii?Q?GRkEIVoJXv6Be73dwP9shY22b0QT3NRzJ/AARzmUxjgui2mrc8Jl8mcbKlPj?=
 =?us-ascii?Q?zs+4BwhGCpGpxFCYfK8nmZ+YYvtyRvupO7YBsxabBjexIVov2nm2tbvb5Vrl?=
 =?us-ascii?Q?ITWmt2RxipsI0cGyRvReq1dwfIWqOqQkxccOQDi2tKLva6Hybb6/rqbh9iK9?=
 =?us-ascii?Q?Z+XRK5ie9TA5yRrfhYS+F/eFILyXscZR0rP4aEUIl7pPLlikOGAupUPiGqVk?=
 =?us-ascii?Q?6cXvzvohIQ=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0485857c-6228-4148-890d-08defd1c7ead
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 11:33:16.1089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evTp44mnkgcd3k46kp8Fd7634sLwB7jq3AgWIHcMUycuq2keEurFnKkQM1WXxVVcS+JhwWtTj7Clqfhsro+6FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9598
X-purgate-ID: tlsNG-33051d/1787052798-772F54E9-C83F8BB5/0/0
X-purgate-type: clean
X-purgate-size: 3551

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

Assert the regular descriptor bound in __irq_to_desc() so direct callers
cannot silently index the sparse gap in debug builds.

Fixes: 98f7060b9ed5 ("xen/arm/irq: add handling for IRQs in the eSPI range")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v3:
- Add the requested bound assertion and retain the SPI-only comment.

Changes in v2:
- Validate descriptor-backed ranges in irq_set_spi_type().
- Validate implemented GIC lines in setup_irq().
- Preserve is_espi() validation with CONFIG_GICV3_ESPI disabled.
---
 xen/arch/arm/irq.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 73e58a5108..bf14180f97 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -23,6 +23,12 @@ const unsigned int nr_irqs = IS_ENABLED(CONFIG_GICV3_ESPI) ?
                                         (ESPI_MAX_INTID + 1) :
                                         NR_IRQS;
 
+static bool irq_has_desc(unsigned int irq)
+{
+    return irq < NR_IRQS ||
+           (IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq));
+}
+
 static unsigned int local_irqs_type[NR_LOCAL_IRQS];
 static DEFINE_SPINLOCK(local_irqs_type_lock);
 
@@ -76,7 +82,6 @@ static int __init init_espi_data(void)
     return 0;
 }
 #else
-
 static int __init init_espi_data(void)
 {
     return 0;
@@ -95,6 +100,8 @@ struct irq_desc *__irq_to_desc(unsigned int irq)
         return espi_to_desc(irq);
 #endif
 
+    ASSERT(irq < NR_IRQS);
+
     return &irq_desc[irq-NR_LOCAL_IRQS];
 }
 
@@ -416,6 +423,9 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
     struct irq_desc *desc;
     bool disabled;
 
+    if ( !gic_is_valid_line(irq) )
+        return -EINVAL;
+
     desc = irq_to_desc(irq);
 
     spin_lock_irqsave(&desc->lock, flags);
@@ -647,13 +657,21 @@ static bool irq_validate_new_type(unsigned int curr, unsigned int new)
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
2.43.0


