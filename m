Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E94C982FA
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 07:21:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428247.1650968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uop-0006qi-GK; Tue, 22 Sep 2026 07:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428247.1650968; Tue, 22 Sep 2026 07:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uop-0006qb-Dh; Tue, 22 Sep 2026 07:21:35 +0000
Received: by outflank-mailman (input) for mailman id 1428247;
 Tue, 22 Sep 2026 07:21:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x8uoo-0006qV-Ae
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 07:21:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8uom-00EmXl-6v
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 09:21:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab22c74-2eae-0a2a0a5409dd-0a2a4502b74e-32
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 09:21:32 +0200
Received: from [52.101.84.116]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab22c7b-6ca4-0a2a45020019-34655474e0a3-4
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 09:21:32 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by AMDPR03MB911350.eurprd03.prod.outlook.com (2603:10a6:20b:70a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 07:21:29 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 07:21:29 +0000
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
 b=pYmXLfc2GdMvAGHPiwhlb9ULxTuTwppB1W360L8jodIees0GU1JThtsG/qGMqWUfs87Wh1MtoHfFT1b7qVKlbYW6rGSyGAZat4ZPX31l9ctlc2E3sNDcpDZsNUvnqR0xIaM++62RnwC1wFcI4rmKMDbwUm0PcI5BCxL8V0TT4edS8PeUwv9mEOmdR8/BYinJoKjUlEX+DrD88QAhmf4g9EnDU2Cp+gPDyIb8chtZojOObP3Q+HtZGNWWzdu0yl2G1sW+Av/ddkmBwYriE35TCyn9hY5Ewx4RCW/gphAGuzPDjvnF9RsSH/hR1nKDK/dDs/jU74bfyyj2nLJ+svQ7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5X82O2FYdGtqPgQok93ByL/AQH724MAEtocmniCunyg=;
 b=jpA4fO+2upAGlB79Eiz9SyuyVBP5xGc+JnU0mII8IQMPrl6n5xAHriz8SzWS7t6Y45QWdjNJwca73H86+CSIKzwFzTZ/RAh3il6epvzIXuj4shmAOkElTcet94F662MAJfjDX2Z9ogyGo7a2l9Hvs4kSFdaoi5Wd5GXMMotPAUjfd+cpQm+dHCQp5gHUcSimlPBQ8EAxEpscBfAF0sp2RRoOgFl4A5l2QeHmiLKApLV1faHxXH1nSUw/g/kfMU4Hj9x7h75r6EiliJ0ULqMIUtJSy2R1R99jzeVDyEqayVac+yyWALYRTF3HxhOQ2Wc/z3xXlqyeO1Hyu9TpZ9TRxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5X82O2FYdGtqPgQok93ByL/AQH724MAEtocmniCunyg=;
 b=JDnDF5FrKzdaIcDTL6Dp0z57qlfpResO8aN3LxmziBHOvfXkY1U/BrcGffwDfv8NT9cSQt4z1sHEiBwWPaRbTsPV/GD4vcPsJbbbxiDPWWZDnOcmaN9kbLec5yobQ/b5FdL8oJt5Eclef6fx3YwOLgSdaXHm/V4dv84oJEoCfPOlTB+/QdkGms8N+TOkt+5nzBgni694IXcsiiNyHOUqLOOPYFxW/JHW6yDPoKyH8kRwzDeJlspUa0gsDU2AwjMwGA1J+DB6ybBaEtFRknZxB75Y2GZGF08NV3+DMdhTcMTGV+8Q8iOuG3E549lqzM8bchjr4P0kaNMEw1gJ9q6tSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4] xen/arm: derive GIC CPU interface ID fields from the vGIC
Date: Tue, 22 Sep 2026 10:21:20 +0300
Message-ID: <1101ee75414ec2e6bec05d34118c4fa7f8b60bcf.1790060180.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2PEPF000008A2.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::658) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|AMDPR03MB911350:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da05b48-576b-44d0-e7c7-08df187a1ef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|5023799004|11063799006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	aRTGr1hi4R27TN428QtO30CCgFB3CsxtyMfoDRy/Xan8BZ+TYOq6FQYlMpb0VBuTyhX8vdVZ+XzEKg1FY/AoIYMFUx2E8JfYQvEJBwxjqM8pOocCCcdsvBQeOTwUw/dH8fppWb/mWaRHM1LbDRG/dH2oYFJmPxpxfaLLkNC/TFurtXiYU5+jpdMVD58O7rOwrtvELIVIfTcpQVi79zGyzCvO/lbu+HWNSqGbmgLxR2tZba97etdO5hhHYOVjDfryK0Ln+qcDKrdG1bByP6mUEzg6OrsFAyy/dnafVMP+4HrG83MAj3RUeLGsrHwmUA7AaJAHXQukFwfaRuC0/K3mvk/ayLcRMIIARSkkUYEIh5H77UKZbYBxZLMQrzXXMQQv7gbO2ts1x1YGW/ZYqWBwCUfgMtKbCvjLV6lSGpr7vCTl7flUYTfpr9HWIZJjFcVCwAIL4toWciEV5837GVBiX0BQRXwJkFIp/86/U6KTlpYMKPRQBnzECdWCe7hrSWtkMI6ZVPhlix+3jbq1MrmoJuA77v6ckLrnrWSOI8aNTD1NzmpB1W6ftWVAixBCk0rap+w2Wb7JoY3ttKzUWMnnauVShevagd9rFywIwvZ00vDKP+TIiSnqufgKN2IOF/0W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(5023799004)(11063799006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ro3YUHyKUHlnAip0TfqtfRTIDLMysyFBjdysWIKwRaPCJrxLHwza8hCsXu5n?=
 =?us-ascii?Q?SO5FiXdPOM+dMcnqNs7Y71ywjZIXKEVWLjHgXmO7Ekq5Wpnp8Kxm9Xdp9P/R?=
 =?us-ascii?Q?3/t+doi7bL4flyAk7V4q6KmtqCvaeYRakZN2Zurzlzrg1Q2Tb7LJvsVq66H1?=
 =?us-ascii?Q?xpcSwXY+jF4n+UUs/VqOzP5Ih1E3fu2fuiFynZAoifG1isfpJ76C+T8Yy0fm?=
 =?us-ascii?Q?DeV+6pf+YA2NpyZWhHnUklCLjQKb7awyOufN13UeRV4ayqTA6053aI4rFrYb?=
 =?us-ascii?Q?da3UQbDl9bHh8qCBrCTUltOIRgiUzVMMrUwCOB+39EC2oiKiwWlMxFYtL97G?=
 =?us-ascii?Q?1sodFjnzNAuXH2iCo7XD0nLuxf14JpGYjUewx5rlGiEudz2NabeTW3SijvhU?=
 =?us-ascii?Q?3B7F//GBdid3DtZiM3GTUinPJT4LM3ndOLbWNRpJqauiQUp6Yy1NV6eRtbFD?=
 =?us-ascii?Q?vHB4AlxWjo2DzWSz7G1YXSq0JebgM/kNdYo04pfKP/7TpZ4nP6H2sz/CObPV?=
 =?us-ascii?Q?4/GxRWnyInOkxBqF6qPHCszbqoJ0oYYlqpjAHKrYu7P7QBZ5LTOiEhK8eS7T?=
 =?us-ascii?Q?WaV/jTToAZl0O6QKYejhFlvzKbWXqMajcqi5eBhFRwNEBJ4NwyVGcFQ0Mn6Z?=
 =?us-ascii?Q?i4QSFi7tqsJwKIfuqMBcv8N6WwGmeZgLjbHGVymIWlhv7Cp8MihmzIauD8dl?=
 =?us-ascii?Q?ScweOe+JPZy16AAqLfrpTeosLCsG7PRKDau8BV5mKYNJ3qEftPigGUZB1lTR?=
 =?us-ascii?Q?F2EvWgsh/VmRC3S/l4cXnqoLnm8e+PzRJDO2YQhAQzpbWoO7dIVhVgVTAV9y?=
 =?us-ascii?Q?eZzuk4G/GsSrIfv6vqe8J/isJF6NSmWcIeNCnnY2wSsDsZNn3mv3D1H7SjDf?=
 =?us-ascii?Q?Mm/BlrdsfzOLbiI/WEc/NfwXUYT5nZ4J4V8tFqOoIINLuHagQtXtHoaJ4Opo?=
 =?us-ascii?Q?a63vPRgUnuT90KpJQLTaZGNIpSPJRY8wbjyTWhNrb6rCDNG/XhjO4sLNuaBm?=
 =?us-ascii?Q?KFMNMsP4qBntvh4Ph1+1GBhiInFg1Q7BPf6y6iJKaT1bXUshqAnJIJ8Mso1q?=
 =?us-ascii?Q?xEnSBm9D9ye22TiVytaQSrCzMj5e+aumXd3M65vtpIFlt/CM18/USP5bzQhC?=
 =?us-ascii?Q?z57t7lSJ5iw49HW+G9AG5NjqIfDI953DBz9rj8NquqRODTdsxUol+9HQ7IWf?=
 =?us-ascii?Q?8GNs1JHGf3/hnC9jxyUBz0vACRqWYz5w6xK78KZ4+xED7cGfkuw/B405fIjY?=
 =?us-ascii?Q?QTbTD5POfb1it55fD7j7hgAxF9Ox26BFhrXFzkcRjvM4ezoLGcScQMfI3SOO?=
 =?us-ascii?Q?uQCLE6F+Xx0JhK56vA+KPynBGj3f6f3EOcMNfXwVT9/MTVLfrQ1JYVrcMwk8?=
 =?us-ascii?Q?o6AVmfQf7F0JdP4z73ko67O2ZhBhw/CXq897JUz+QbX1EeKq7Nq7BfgY527/?=
 =?us-ascii?Q?9UhZTFNZALs72a7gmJjM3r59WRCGy4E0UaftrFF6lgHeYCn2WULHK8sIW5vp?=
 =?us-ascii?Q?FKCFk/S8/d0NFPECAjlDByiQ/EjZZprxptAfYpvdnr1G1Gkl1Q6/rQEV91nF?=
 =?us-ascii?Q?wbFYz0MgGDQ/G5L4aBewE4XIKh+qzReN49fPb9hP/x6m9MTNbanp5NYQo3vR?=
 =?us-ascii?Q?23ZtArqxnLNkJuExIZ8+66LbWrninE6K4x9Sk3LsMjCCony+HcUpczxmcNDQ?=
 =?us-ascii?Q?RZXsPFrwMlUZ2rvlHq8/NA0Br8eUz2JYq5d5kPz0znnyDL7nYvwgN4W0L7a2?=
 =?us-ascii?Q?R0hb26tZBw=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da05b48-576b-44d0-e7c7-08df187a1ef5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 07:21:29.7281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBrMkF9/ybQSb+ojwFiRb6bZOVYZiQq9TC6kPYuWRRDp2lv07OUuC4TWUVjnOFubXgpvA2CEAc+UCY5p3V0mdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR03MB911350
X-purgate-ID: tlsNG-720697/1790061692-66EB32AC-0E37B018/0/0
X-purgate-type: clean
X-purgate-size: 7651

Xen exposes ID_AA64PFR0_EL1.GIC and ID_PFR1.GIC from domain_cpuinfo,
which is initialized from the sanitized host CPU feature state. This
does not necessarily match the virtual interrupt controller configured
for a domain.

A vGICv2 domain can therefore observe a nonzero GIC field when the host
supports the GIC system register interface, even though Xen disables that
interface for the domain. On a GICv4.1-capable host, a vGICv3 domain can
observe encoding 0b0011, although Xen exposes only its vGICv3 model.

Derive the fields from the domain's vGIC version instead. Expose 0b0000
for vGICv2 and 0b0001 for vGICv3. This covers ID_AA64PFR0_EL1 and the
ID_PFR1_EL1 alias in AArch64 state, as well as ID_PFR1 accessed through
CP15 in AArch32 state. Leave the alias unchanged when AArch32 is
unavailable.

Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
Fixes: 8f81064a07c6 ("xen/arm: Add handler for cp15 ID registers")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v4:
- Explain why ID_PFR1_EL1 is left unchanged without AArch32 EL0 support.
- Move all ID_PFR1_*_SHIFT definitions to the common asm/sysregs.h and
  remove the unused cpregs.h includes from the ARM64 files.
- Return explicit unsigned GIC field values to avoid MISRA C Rule 10.3.

Changes in v3:
- Add direct dependencies for the shared ID register helpers.
- Move ID_PFR1_GIC_SHIFT to the common CP15 register header.
- Apply cosmetic fixes from review.

Changes in v2:
- Share the GIC ID field helpers between the AArch64 and AArch32 paths.
- Parenthesize the individual ASSERT conditions.
- Preserve ID_PFR1_EL1.GIC when AArch32 is unavailable.
- Target master instead of the 4.22 release.

v1: https://patchew.org/Xen/ba4f779d68c54efc80c4a566dca38ac2e6f9a073.1783675708.git.mykola._5Fkvach@epam.com/
---
 xen/arch/arm/arm64/vsysreg.c             | 21 ++++++++++++++++++-
 xen/arch/arm/include/asm/arm64/sysregs.h |  9 --------
 xen/arch/arm/include/asm/sysregs.h       |  9 ++++++++
 xen/arch/arm/include/asm/vreg.h          | 26 ++++++++++++++++++++++++
 xen/arch/arm/vcpreg.c                    | 12 ++++++++++-
 5 files changed, 66 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index 66f4f23bb3..2912445301 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -299,7 +299,22 @@ void do_sysreg(struct cpu_user_regs *regs,
      * to identify the processor features
      */
     GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
-    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
+    case HSR_SYSREG_ID_PFR1_EL1:
+    {
+        register_t guest_reg_value = domain_cpuinfo.pfr32.bits[1];
+
+        /*
+         * Preserve the sanitized ID_PFR1_EL1 value when AArch32 EL0
+         * is not supported, as for the other AArch32 ID registers.
+         */
+        if ( cpu_feature64_has_el0_32(&domain_cpuinfo) )
+            guest_reg_value = id_reg_set_gic_field(guest_reg_value,
+                                                   ID_PFR1_GIC_SHIFT,
+                                                   v->domain);
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  guest_reg_value);
+    }
     GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
 
     case HSR_SYSREG_ID_DFR0_EL1:
@@ -362,6 +377,10 @@ void do_sysreg(struct cpu_user_regs *regs,
             guest_reg_value |= (sysval << ID_AA64PFR0_SVE_SHIFT) & mask;
         }
 
+        guest_reg_value = id_reg_set_gic_field(guest_reg_value,
+                                               ID_AA64PFR0_GIC_SHIFT,
+                                               v->domain);
+
         return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
                                   guest_reg_value);
     }
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index f3c11d871e..f6ece8f972 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -438,15 +438,6 @@
 #define MVFR1_FPDNAN_SHIFT           4
 #define MVFR1_FPFTZ_SHIFT            0
 
-#define ID_PFR1_GIC_SHIFT            28
-#define ID_PFR1_VIRT_FRAC_SHIFT      24
-#define ID_PFR1_SEC_FRAC_SHIFT       20
-#define ID_PFR1_GENTIMER_SHIFT       16
-#define ID_PFR1_VIRTUALIZATION_SHIFT 12
-#define ID_PFR1_MPROGMOD_SHIFT       8
-#define ID_PFR1_SECURITY_SHIFT       4
-#define ID_PFR1_PROGMOD_SHIFT        0
-
 #define MVFR2_FPMISC_SHIFT           4
 #define MVFR2_SIMDMISC_SHIFT         0
 
diff --git a/xen/arch/arm/include/asm/sysregs.h b/xen/arch/arm/include/asm/sysregs.h
index f6af987ef5..8dcf82a694 100644
--- a/xen/arch/arm/include/asm/sysregs.h
+++ b/xen/arch/arm/include/asm/sysregs.h
@@ -9,6 +9,15 @@
 # error "unknown ARM variant"
 #endif
 
+#define ID_PFR1_GIC_SHIFT            28
+#define ID_PFR1_VIRT_FRAC_SHIFT      24
+#define ID_PFR1_SEC_FRAC_SHIFT       20
+#define ID_PFR1_GENTIMER_SHIFT       16
+#define ID_PFR1_VIRTUALIZATION_SHIFT 12
+#define ID_PFR1_MPROGMOD_SHIFT       8
+#define ID_PFR1_SECURITY_SHIFT       4
+#define ID_PFR1_PROGMOD_SHIFT        0
+
 #ifndef __ASSEMBLER__
 
 #include <asm/alternative.h>
diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
index 387ce76e7e..96de1c4916 100644
--- a/xen/arch/arm/include/asm/vreg.h
+++ b/xen/arch/arm/include/asm/vreg.h
@@ -4,11 +4,37 @@
 #ifndef __ASM_ARM_VREG__
 #define __ASM_ARM_VREG__
 
+#include <xen/bitops.h>
+#include <xen/bug.h>
+#include <xen/sched.h>
+
+#include <asm/gic.h>
+
 typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t *r,
                                    bool read);
 typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs, register_t *r,
                                    bool read);
 
+#define ID_REG_GIC_WIDTH 4
+
+static inline unsigned int vgic_id_gic_field(const struct domain *d)
+{
+    ASSERT((d->arch.vgic.version == GIC_V2) ||
+           (d->arch.vgic.version == GIC_V3));
+
+    return d->arch.vgic.version == GIC_V3 ? 1U : 0U;
+}
+
+static inline register_t id_reg_set_gic_field(register_t val,
+                                              unsigned int shift,
+                                              const struct domain *d)
+{
+    register_t mask = GENMASK(shift + ID_REG_GIC_WIDTH - 1, shift);
+
+    return (val & ~mask) |
+            ((register_t)vgic_id_gic_field(d) << shift);
+}
+
 static inline bool vreg_emulate_cp32(struct cpu_user_regs *regs, union hsr hsr,
                                      vreg_reg_fn_t fn)
 {
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 3c315be9fd..9811902684 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -316,7 +316,17 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
      * to identify the processor features
      */
     GENERATE_TID3_INFO(ID_PFR0, pfr32, 0)
-    GENERATE_TID3_INFO(ID_PFR1, pfr32, 1)
+    case HSR_CPREG32(ID_PFR1):
+    {
+        register_t guest_reg_value = domain_cpuinfo.pfr32.bits[1];
+
+        guest_reg_value = id_reg_set_gic_field(guest_reg_value,
+                                               ID_PFR1_GIC_SHIFT,
+                                               v->domain);
+
+        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1,
+                                  guest_reg_value);
+    }
     GENERATE_TID3_INFO(ID_PFR2, pfr32, 2)
 
     case HSR_CPREG32(ID_DFR0):
-- 
2.53.0


