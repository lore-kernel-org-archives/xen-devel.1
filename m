Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492DFC5DF7D
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 11:33:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394003.1632840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwI4K-0007OM-EP; Tue, 18 Aug 2026 11:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394003.1632840; Tue, 18 Aug 2026 11:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwI4K-0007OB-BW; Tue, 18 Aug 2026 11:33:24 +0000
Received: by outflank-mailman (input) for mailman id 1394003;
 Tue, 18 Aug 2026 11:33:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wwI4I-00078R-8x
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:33:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwI4H-006e0V-Lc
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 13:33:21 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a8442e3-e002-0a2a0a5209dd-0a2a45048bae-48
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 13:33:21 +0200
Received: from [52.101.72.117]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a844301-b57f-0a2a45040019-34654875529a-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 13:33:21 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by PAVPR03MB9598.eurprd03.prod.outlook.com (2603:10a6:102:301::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 11:33:19 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0315.012; Tue, 18 Aug 2026
 11:33:19 +0000
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
 b=gIxIyrQaZPkg/pZz+bOTtsJxhhik1Wfs6H8R2Yr52JVjobIsWFQz3jhRuv/aeJM7N8XIdJjmIWEhS2o1QUQYoqxlF7WZyzFmYtk6GQcsgl7w6C//K3F3EEMSWzFPeq0/ZY/2SFsQDs2B7rdL2bxCcVtFiW884VAGnyo02V7c0Vu05XxxMXck2+oxkxMuXmCFA2UGujrK/MdAcF3NsIhti1pPAwBTtNwSexfKASBcakLISTK+7RtS9XeWYT2SXeJzKsXIK+FO+CY/eEfABcJbN1NAFTitQB/gr1hYv4/zqXnzpR8cP2HZE+9G/YQ/Mx3AOI9YnyQkJNamUIJqmSCNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HDe1xkWtdxGmtk4I8gFdOwYDocPhKfwfAK1ssSxjYs=;
 b=l0mG1Izx9VSvs7qkukMGnyAerQeTkW7JUrr1enJuGcI+CpUDESaCX1Qns0G/P+MlcwHtkCmhSBfGRb0dN9ViP/EVbei/ND7PS1cCnCSYHZP7LbI1xjRvgphiHhBWPz4Q3UjUDDwKCLAYANgZ8v1AMAs/JNtWVRPVpZYA2xaHw0Z2MAcm+FlzuqnWtUmzmvJrrDVoqfb6MWazNhVzOFFYYQkjPpW3jXkccn9pNW13b2AqQjpUrJLpot1fWQBdSXjyU7ewS/UYWy5E+z3enYuUKnsYS/3tMIWtnQvqLpT8H2Cr3tZI2zFZZy87DCVUJugeOOUEHQnZTUnynZm6MnInmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HDe1xkWtdxGmtk4I8gFdOwYDocPhKfwfAK1ssSxjYs=;
 b=rffEqluXHrkD8BkWH/gn6XQw3mwFk2cI1V8Nouu83YL+tbeqJL9Hdx8ouiatv0hpelD/Y9FhCQPTCvGT3QV6ub7Sc2iw1S3dnmYnCEPhQtkBP+Sm8MKglyOtZYSJTZAtV1UQccT2YlDU/eojcxnO/poZFllkwsgPYjSLzkdUCNcATJfNH9cWmTlzOwloB7wtlqJY6nugZopGsS95xZLmsMhdII1GlLP3pRtls7YUTQ/pEbcfStUPSc+uRDLNQoYBNGyahHTG1zVK1VRc79JP3WzF6CVF1PHq2FhwDSnnBpG0dcFNhyS4HV5be+wDCNtzRt6oUSIPzml6RYSHswJMeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jens Wiklander <jenswi@kernel.org>
Subject: [PATCH v3 4/4] xen/arm: handle irq_set_type() failures
Date: Tue, 18 Aug 2026 14:33:02 +0300
Message-ID: <a960bc4917d4673cd1920cada2cfdb7eb7475f23.1787050437.git.mykola_kvach@epam.com>
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
X-MS-Office365-Filtering-Correlation-Id: 04e34735-1d56-47f5-1049-08defd1c80a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|10067099003|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1ly0t2Wp8MzggSIWNxSQGDA0WLshz1OdxXdSgSVrON0Ma0SNeK0cybjLwEkYOQ3As+NimmrtS4SV7dGMLwjn0guWum2N5pOIjJxnTDnflmLJoSrkhWxKF1kykCf3kfBSja3Nn9+xSH39ubQIbvlN5bP6fJfgwKIGAYVjjLINW32oEjD5O9j7+/b3B43Uc2WpWadRrw1Clo7iEL9b+aR6St4Acn2n6vt8nZanDJ9FoSToUvZHcYGrihzdS2G0GwLF+7BZAUI7BA7kNoRObMCQNvBlyn5xlwirnQ+4geMdzItgieDFe4KrYVe6/r5aOdBS26HOU5qVy6oVC03HHcM5w/2Ba/ojL+h4cfu2h3ucVQjEV9ZmzJju/wzNsviVUzZ3qqA1UDSJdHJNQriIKEeHjZOqbBbZuUgbv4CjvqYPJjiJSfu0TijwYygQpULE+WmVmHgpdW8kUueNj5tOtVOpig+F6rIF/9Fhfm67Zm1uMTShQSTJfRV9GM4yDfdUTxSNoIS1zuKE1ehI8x+32HMx57lqCWzhQV+hpDr7tKeOTHjgnAyfIxBIurULDc0PMTCGwxCUNbahqCSftEQ9Mupq/xP6zdApdnVyTu0Qoa6hQi6HCV+uU30mTkT5iceZqtzE01CLgWtXeY8bkNzbsClgvnNWxDsltZESrY1S20saclI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ni5Kc5HWi0tZN2w3+KA0w8ocghgF0iegYt5hszSvRsPoj7N6N+4bsOCqsEiZ?=
 =?us-ascii?Q?J4AusptUgCRg30ucuA4hjz4ObPeAbAMHIAOq5nfbkvommZRN41+PQ+F5baTs?=
 =?us-ascii?Q?HAMynBvAeQF7+SgQpT+Cq4xpRbhTBbxUkGZi9n1+Dq2hF8clMm6GBqu1Nd3B?=
 =?us-ascii?Q?XQQMHgv9/1m7kTFyhyBQIitwkoOwx4UjjBCx9oNFMDFxrN0Ld6EdwqKCZ1UF?=
 =?us-ascii?Q?Tduzec5NYpRY/Q0yZzYgVq9G3W0RmtgMa1QB+FHVVtw34AsXhGxc1hj9zEsx?=
 =?us-ascii?Q?Apt9sygDtkAvCOnpACZTjnS1jmEG+sWpXw/h+GxyfNIUlt359fHAnMMzWt9G?=
 =?us-ascii?Q?MQwvjTl3yNplLfeaSnC8fSFd4h4VV0PFwy2Od9CtgFuUqwOm8jsMKvZsTnOK?=
 =?us-ascii?Q?ublVLXzSL3moNSdWf2cH0RFr+R23WgkTbjvgePdbJzTkVxrg489+CkRfmOvv?=
 =?us-ascii?Q?AXKmwOm1kETSkM+9wj6+Y0+vBd/bApSVaFrWAem30G1tOHle2uHsBi18+a34?=
 =?us-ascii?Q?Ewba8y6rNdU9v1gVIFNgggQkFNXR8UgNYla3axwDOSmFdftavVib9tF1iq0C?=
 =?us-ascii?Q?4j5MODf/MgT+/UEmOWpJJI5gWZKRhryX9IT6X3beSPC65c9JaIQfzEi2Np42?=
 =?us-ascii?Q?s3rICSFVvOIlnVQ5L0PORcM4dYyZA8887xnV0/Foqse6ZGx4OF1NF8PGqd8C?=
 =?us-ascii?Q?zdWPdvcIQ1SuEB537ezTiD+1wSXhP6ix7ZzjWgzxeKp3cdnHxf1Dsm52bXuJ?=
 =?us-ascii?Q?QsUumsvW7OZcpgqGD6OVDAN3sg7VMnVo0p4QxM7z0UYUVj7qfPn+f4pY8Tdr?=
 =?us-ascii?Q?FpPOER+jPeF7GTnxD2K6Fa0tSPfZrMSbe8PE6HGEu19Kt6xL61gUpRWuNpna?=
 =?us-ascii?Q?xuJ4eJ/DbDSxoMqEUXEWlnXgzr5KdboN4TaJnnV8vVKNyoJJ8b/vtI/rQHrr?=
 =?us-ascii?Q?2xIEAy9Y5RA0MsOrZpaLIPl1XeKv+jIWoWAeJc773nNxDWYSNbhdJYqmCAmI?=
 =?us-ascii?Q?XoDEe3yTxRBGXC1/pL57kxQClEwQ1q2nfeaPZOLeMnxLBDrG+cqEeRFXmxp/?=
 =?us-ascii?Q?+H/Sh7XaOyEy9XJfuRpmGEnrEXCBOWAti0KymKXO3cIucBquU5ilJt0PEY4L?=
 =?us-ascii?Q?4E+677OqbecvmD2tjOTWDxmk4VzwgNhVyzeUj/0GyKpZrztMazrest52lL/X?=
 =?us-ascii?Q?TMnzoivf6qQ4Fl8k3VP/GYkq1wOSjDIRzMHGCiPs20+TIGjDxinxlTlhIue7?=
 =?us-ascii?Q?o+vmyPTAgaIKmBXFjm/xv2UsyRKZQApmtKt64EviRzhLaZbcx9Gw5h84hR/M?=
 =?us-ascii?Q?VAM2ges1fTbXzDOzFZJcUi55k/Sd0uEBHYYKRdY1FSL5t2DOGftHgiRNNHPn?=
 =?us-ascii?Q?uR7G/c4N36Vf/8hLy2aPARCPhLQrWx41dK5E5OCZj2g1gJZva53AU4ipS1ml?=
 =?us-ascii?Q?EihaTZObYUglSS0UQrj61GXfsTCWaQWbdDS6CtRkrBjtVVxjp/KcXbZd7/ue?=
 =?us-ascii?Q?pP7gtBJUHRDcy0kNcL4rCns/0PROwdaxOT1ck4oYZPv5NbyUcuUbf+Iondwc?=
 =?us-ascii?Q?0lxC3/FmpK+CsO2XCj8/I858W2c4tUgUyf4EsVhGH2uQ8Kg7mClSbBhIdIQE?=
 =?us-ascii?Q?4y674+RRkHV8ZzQY7rTezuEtq6NwNWsPoc05tyb2ySixw1KheaePWF5qbeP8?=
 =?us-ascii?Q?uWhBiUPXj7NtNo+aQp/pPSw32IXBje5J955eAPUac+G8Zf+ZCDlYWIgrsHs7?=
 =?us-ascii?Q?kpiNf2NArA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e34735-1d56-47f5-1049-08defd1c80a3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 11:33:19.3671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05I/PAgTfSHYaUFLsSs2nZEH0SOvgMUSx6T2pJsTiKpvRbrwlEXDIp6AX+jI6jmB5ZO+Nt7fBeV7/KQFMrEntw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9598
X-purgate-ID: tlsNG-ebf023/1787052801-532CCB50-344BEABA/0/0
X-purgate-type: clean
X-purgate-size: 8017

Several Arm firmware initialization paths discard irq_set_type()'s return
value, violating MISRA C Rule 17.7. If trigger configuration fails,
initialization continues with an IRQ that was not configured as requested.

GTDT and MADT retain rejected timer and maintenance INTIDs.
check_timer_irq_cfg() and release_irq() later perform unconditional
descriptor lookups on those values. Xen has no backing descriptors for
INTIDs 1024 through 4095, so retaining one can cause an out-of-bounds
access.

Check the return value in the GTDT, MADT, SPCR, and FF-A paths. Store timer
INTIDs only after successful trigger configuration, make GTDT parsing
failure fatal, and stop UART or notification setup when trigger
configuration fails.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v3:
- Avoid partial state updates and simplify maintenance IRQ setup.

Changes in v2:
- New patch.
---
 xen/arch/arm/gic-v2.c        | 15 +++++++++------
 xen/arch/arm/gic-v3.c        | 15 +++++++++------
 xen/arch/arm/tee/ffa_notif.c | 11 ++++++++++-
 xen/arch/arm/time.c          | 18 ++++++++++++++----
 xen/drivers/char/ns16550.c   |  8 ++++++--
 xen/drivers/char/pl011.c     |  4 +++-
 6 files changed, 51 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 43a379fdda..a24d387e7d 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1166,17 +1166,20 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
     /* Read from APIC table and fill up the GIC variables */
     if ( cpu_base_assigned == 0 )
     {
+        int rc;
+
+        rc = irq_set_type(processor->vgic_interrupt,
+                          processor->flags & ACPI_MADT_VGIC_IRQ_MODE ?
+                          IRQ_TYPE_EDGE_BOTH : IRQ_TYPE_LEVEL_MASK);
+
+        if ( rc )
+            return rc;
+
         cbase = processor->base_address;
         csize = SZ_8K;
         hbase = processor->gich_base_address;
         vbase = processor->gicv_base_address;
         gicv2_info.maintenance_irq = processor->vgic_interrupt;
-
-        if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
-            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
-        else
-            irq_set_type(gicv2_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);
-
         cpu_base_assigned = 1;
     }
     else
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index acdac22953..b32a9b5009 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1743,15 +1743,18 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
     /* Read from APIC table and fill up the GIC variables */
     if ( !cpu_base_assigned )
     {
+        int rc;
+
+        rc = irq_set_type(processor->vgic_interrupt,
+                          processor->flags & ACPI_MADT_VGIC_IRQ_MODE ?
+                          IRQ_TYPE_EDGE_BOTH : IRQ_TYPE_LEVEL_MASK);
+
+        if ( rc )
+            return rc;
+
         cbase = processor->base_address;
         vbase = processor->gicv_base_address;
         gicv3_info.maintenance_irq = processor->vgic_interrupt;
-
-        if ( processor->flags & ACPI_MADT_VGIC_IRQ_MODE )
-            irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_EDGE_BOTH);
-        else
-            irq_set_type(gicv3_info.maintenance_irq, IRQ_TYPE_LEVEL_MASK);
-
         cpu_base_assigned = 1;
     }
     else
diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 186e726412..d08d0a3366 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -407,7 +407,16 @@ void ffa_notif_init(void)
         irq = resp.a2;
         notif_sri_irq = irq;
         if ( irq >= NR_GIC_SGI )
-            irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
+        {
+            ret = irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
+            if ( ret )
+            {
+                printk(XENLOG_ERR
+                       "ffa: irq_set_type irq %u failed: error %d\n",
+                       irq, ret);
+                return;
+            }
+        }
         ret = request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
         if ( ret )
         {
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index 6955b2788f..39b5eabe7c 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -60,20 +60,27 @@ static int __init arch_timer_acpi_init(struct acpi_table_header *header)
 {
     u32 irq_type;
     struct acpi_table_gtdt *gtdt;
+    int rc;
 
     gtdt = container_of(header, struct acpi_table_gtdt, header);
 
     /* Initialize all the generic timer IRQ variable from GTDT table */
     irq_type = acpi_get_timer_irq_type(gtdt->non_secure_el1_flags);
-    irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
+    rc = irq_set_type(gtdt->non_secure_el1_interrupt, irq_type);
+    if ( rc )
+        return rc;
     timer_irq[TIMER_PHYS_NONSECURE_PPI] = gtdt->non_secure_el1_interrupt;
 
     irq_type = acpi_get_timer_irq_type(gtdt->virtual_timer_flags);
-    irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
+    rc = irq_set_type(gtdt->virtual_timer_interrupt, irq_type);
+    if ( rc )
+        return rc;
     timer_irq[TIMER_VIRT_PPI] = gtdt->virtual_timer_interrupt;
 
     irq_type = acpi_get_timer_irq_type(gtdt->non_secure_el2_flags);
-    irq_set_type(gtdt->non_secure_el2_interrupt, irq_type);
+    rc = irq_set_type(gtdt->non_secure_el2_interrupt, irq_type);
+    if ( rc )
+        return rc;
     timer_irq[TIMER_HYP_PPI] = gtdt->non_secure_el2_interrupt;
 
     return 0;
@@ -81,7 +88,10 @@ static int __init arch_timer_acpi_init(struct acpi_table_header *header)
 
 static void __init preinit_acpi_xen_time(void)
 {
-    acpi_table_parse(ACPI_SIG_GTDT, arch_timer_acpi_init);
+    int rc = acpi_table_parse(ACPI_SIG_GTDT, arch_timer_acpi_init);
+
+    if ( rc )
+        panic("Timer: Failed to configure interrupts from GTDT: %d\n", rc);
 }
 #else
 static void __init preinit_acpi_xen_time(void) { }
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 120ac09d23..eb608ab8b4 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1928,6 +1928,7 @@ static int __init ns16550_acpi_uart_init(const void *data)
     struct acpi_table_header *table;
     struct acpi_table_spcr *spcr;
     acpi_status status;
+    int rc;
     /*
      * Same as the DT part.
      * Only support one UART on ARM which happen to be ns16550_com[0].
@@ -1959,6 +1960,11 @@ static int __init ns16550_acpi_uart_init(const void *data)
         return -EINVAL;
     }
 
+    /* The trigger/polarity information is not available in spcr. */
+    rc = irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
+    if ( rc )
+        return rc;
+
     ns16550_init_common(uart);
 
     /*
@@ -1975,8 +1981,6 @@ static int __init ns16550_acpi_uart_init(const void *data)
     uart->reg_shift = spcr->serial_port.bit_offset;
     uart->reg_width = spcr->serial_port.access_width;
 
-    /* The trigger/polarity information is not available in spcr. */
-    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
     uart->irq = spcr->interrupt;
 
     uart->vuart.base_addr = uart->io_base;
diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index a336241033..97c53c11e0 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -363,7 +363,9 @@ static int __init pl011_acpi_uart_init(const void *data)
             spcr->interface_type == ACPI_DBG2_SBSA_32);
 
     /* trigger/polarity information is not available in spcr */
-    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
+    res = irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
+    if ( res )
+        return res;
 
     /* TODO - mmio32 proper handling (for now set to true) */
     res = pl011_uart_init(spcr->interrupt, spcr->serial_port.address,
-- 
2.43.0


