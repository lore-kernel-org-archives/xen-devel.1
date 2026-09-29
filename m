Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4161CA5FA7
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 16:55:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436602.1655275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBb6G-0003Hi-Lw; Tue, 29 Sep 2026 16:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436602.1655275; Tue, 29 Sep 2026 16:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBb6G-0003Hb-IK; Tue, 29 Sep 2026 16:54:40 +0000
Received: by outflank-mailman (input) for mailman id 1436602;
 Tue, 29 Sep 2026 16:54:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1xBb6E-0003H8-Bu
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 16:54:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBb6D-009iEa-OB
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 18:54:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abbed3b-bab6-0a2a0a5309dd-0a2a4508a5ee-38
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:54:37 +0200
Received: from [52.101.84.131]
 (helo=DB3PR0202CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6abbed4d-f659-0a2a45080019-34655483fa90-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 18:54:37 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by DB4PR03MB8683.eurprd03.prod.outlook.com
 (2603:10a6:10:383::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 16:54:35 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 16:54:35 +0000
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
 b=cKC2oVtiqoXMhOv5nJlCN53tNNOdhLXqkZ+XLRSgWzJ9FkNoeP55kT3a/pcTDpCz7aEWPKUMpK210bxPR14iqvA3Qg9lrAMeRl1c8hWOVzZrPucfeheyHF6ZxZ6ihZcuPFzvviL73FyYYjmj/bwFs0FjP95bbq2kDFtrOpgXJ0qlVVymF4kVSrVjHA/1K5HN59THTnNsksoef0ZwB9rgh4Feqse/xwkM+N/fFIbzil+wmdqxSFibB/UJosfA8zasL2fmULHzC95Wb+1r1g2i59kVXtFm8i993wRP+JsXTe07zf+QMwoz97MK8yP62MhEsNDuFLx6HOaV8te+/69Bqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLdQDWzey5Si+LCyZsTMGd8of0JSHwVS0YkbSNWhJI8=;
 b=uCyJBnji916yiO/PKqAwvYljEqNQnqjhmCrVYSiAfS1e55HgXNbNAU+BzQfydqGVXjMUamEu8WH5PI58BhUPhnHSAcrrOvgGpmFS3BI40uQ6OlVqPMrm1zlXIou0sg3hSnKgBm800/74YngnTMKOx0h3VSNqQE35UDfc0UpYMT7ZBQaoCCD+8RNfx5jx8sviZdfsdsfMH9j0Kuhk9e2Q8OWhk1NAWmQNEw1tBtdIpsbWzfT7TmeHQ3RYFl/wT1p8hIlCECxGGQTtSKSwaQUbgIi7J+jxlfoVNSUGZvYCuhm82MHIvI8XNzXMLP+bT/IWF/0stdDLHYFXynWdF3z1EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLdQDWzey5Si+LCyZsTMGd8of0JSHwVS0YkbSNWhJI8=;
 b=JGQdtThuUSE1Pd2zdO6iPY7XTaalz78VD+jh1USg1DJsrvgpswodpFuHug+gf5JZkUWNscVKKjlAEiL5+T06+2P8+PUSzQvvtsHe9sTBNIqHCgaFuDxFYXdIeNeUc08pMKqW2li8TuC3+uH+N9LSkqudvTYAmSUR8aTuplFoimYJbAx7oAfOVM8mVqSzKj9GwcSbgm62kSZExGGkHApa5r8camaH1H7mO7Iu/0C2AUXUdR0uhNldNLJ2PopdvdyUnQbe+nsdvNq8eNBgNXcCuXJWFMOUxBhBrTXFqb6MRwicutOwGB105TocTWNwSM+LrcLfr65uJ6ZAT/0etMF2FQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
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
Subject: [PATCH v6 1/4] xen/arm: handle irq_set_type() failures
Date: Tue, 29 Sep 2026 19:54:09 +0300
Message-ID: <1cc5a52b61d3ed8176b2a12f23f284a44a8a72d8.1790699282.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790699282.git.mykola_kvach@epam.com>
References: <cover.1790699282.git.mykola_kvach@epam.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VIUP296CA0096.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35c::10) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|DB4PR03MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 793123ff-2732-45c5-130e-08df1e4a5773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZhgXER+V2IvqmDhnNXBvquJQnHLgyLxOBfXBwgUPOB0eqEOHWKMwUuorBHOffSMPZu1M3q61RQZVuCagzqknMQOrOkOpqLqzGp9vmI/cumAD1vE5txKpOj5ye/si9CjkKIac9NvOXpRBtPlKo2J2XNIixOYnld9k8m4lxF+/63w4WZMnj+zpNwSJfBwQt7GY3VAMBuZf4u4CyvVuBOeLT4fABi2XE/E9BOjQuWYYWgB8lP/NStQ/1+A/4NTklgDUqYV5P4IQhUL6+6OaLYbsP9fU1/Nx/b/b/6AEfx1kdBzO3u7+FQTBDtXcdYpadRh8e7YqnSdntJRFZc5XP+WN1cBNvnaDVLMRjA+CHsYpr/7qK55GkqYR+8gcRzCUS5+jV+ycqodB5n/hixjjHizbdCAkGJ95tBKu81QgBWwTWQPae1VpA0LTwy1s5jl5RPUhQdRucwqjS5TGj6MiXddibPawh9GC7H7DBxM8br9WeSxaRasRTZvC1AYVmI7V4in+VDDfgPWmJGeWiM+zCrBShyTTp/wFdrPnAfNZeH9GW2Oaed3DOL24ActiiJsb8mNKXLlsh4ZXpC+Fm2nxN1Fkpx1/j2eipM6O00PY82OtW+0J/5RHXi/oypFV7nuhetFmo7YUw0i6EdrtxBl3CImUAEE8PKSUZN8TU7tbE1c1Ysg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzcYb55sJsnLbSwl2SHybDVucz4yHdiiosjd9EQuR3qIRE55WGhlKrC08MJq?=
 =?us-ascii?Q?dseNMsSaKT6Pg9DaL/1rxUAKCbcsUdBDob40fpGS+s3GjkKgSDQuYuzWX4sq?=
 =?us-ascii?Q?DUo5RoGCYJQia0HZl1/4cKEpimCpJ+dlQbHkFCcXyc9HOhaB0gqgf0MRO4Yq?=
 =?us-ascii?Q?pqqrMCUGmrYVoD8e6AOwPmc+jimBV5l2b2jyEU9h3j3S0Hpk6zfW4N+HurP1?=
 =?us-ascii?Q?czSoqZ1tQiRJuzx6WqQH8Zk/S7tXOmzG2o8vc/GHLHXUlvc+vQL5W07jNLN4?=
 =?us-ascii?Q?rOxBHifTUeYgqeVGBkS7ykDIHW0NT1cHWV63ooxpzMpMaVSlaxJRGhjoHcY5?=
 =?us-ascii?Q?JfDwXlMik1JHFIpXbSepHR3HIArCiwcTcAnF2UzhRFa6VDAi/vZaTX5dLAT5?=
 =?us-ascii?Q?ayw0jvAqqMtjbJ4FUD2hmu2jJ+w9xKgUe6A++HytpFZQf2X8DXR6pF0reGon?=
 =?us-ascii?Q?DVU1oV4zcwPBIQqLb7W4CzLG/5WkL1d5bUO7VUCmY1TOSyjRjZep/4X2Fvpl?=
 =?us-ascii?Q?oPwqosiZfT3hszHygzklnRe2tXL6fFCG1FSS5jhzBnxf5Gcv+83Bq/rPmN/G?=
 =?us-ascii?Q?kGhGZYSQSAmY8tac+lUiuDo2OeZikeFKeHpM53GB6Ux9uCNwcYMQ/61FRcAV?=
 =?us-ascii?Q?Akgg9aLVgd6YUfPOU0/IrOrdP/YhYd4NZR/mcmwRM6s13UBFPKxtPlPhPUYj?=
 =?us-ascii?Q?5b6sgjLSLJto4BkRinDUJft4Vg6NyD7y6/Vhz+B4QL/JGjBkZMAy1OyZ45D6?=
 =?us-ascii?Q?I0JJ7sR99mS2w2Cp7kVg7R3l7JL6xLR2X+3mxmaxh9yjq1NbHT8nsiG0Mvy9?=
 =?us-ascii?Q?NZet/62S0SLgb3sHwmdJhFesInVsa1jOuWFcEsuY6avGKnRE52YwAzXAcuv6?=
 =?us-ascii?Q?vhpo0cDG4o4P/rQ+2MSq1g2XD41oHjl/DysLd1qktYvkLtW24ZKyo3mb1gH+?=
 =?us-ascii?Q?cssTwEfIyRmSHkdBpVDBtm6nlb8ZO7ztfJ8tV8E/CxZyOI6LAQf/DBZezcX8?=
 =?us-ascii?Q?Bn/N56D3CxZcYLdi/jkEdWJxs+ZV7UrOETybFI2JoErTRnJ4yY6Ohf/lkXHf?=
 =?us-ascii?Q?0YeDQhiUR0c5QESFOZWDhIDu+YyyO9yMV16U7KpvNS61LsI8/ybqqfhptk5D?=
 =?us-ascii?Q?T97z3UQXTQea72kI7QhxH7jpgdoFkYdH7n/eE81SWNI7EXpTwbYQ2+wU9V3l?=
 =?us-ascii?Q?czVf48zaB34XjmiC654n9U2BDoV6J7r/AUGomCf+Vn7VP1hmWCkDm0+23j5/?=
 =?us-ascii?Q?j54hYGOi+USF+wPHzandYetFchgiEqpQ1Et6Srf0HMP05bOVKTlCDdGYgU7f?=
 =?us-ascii?Q?LL8RQNTlkoPTDc9nHUF88lPtcWtDQs51wD9yWNsqLYLv/cQGeEjHL7ilYW0L?=
 =?us-ascii?Q?iYOi/TH5htrxB4UpejkkypK9Sl4Ocad6FkgZDigSr5rUraCxYma23TQJKsg1?=
 =?us-ascii?Q?5D6fCIL4HkdktUrJEDJzvZDjhlz+fMJqMyHFc9/uRfCkidprgVcYduIkn8zk?=
 =?us-ascii?Q?FabI22Y92paOcXemZOcqx+HwQlKORZPQt0HTmpOG2wQxpS6cyd6CWkLB4e/d?=
 =?us-ascii?Q?SCUSKgTQEs0XP7yJn6K3bn0NBF3+O5lba4N4J7ilvpUf9AkUVNgotCBnJVnr?=
 =?us-ascii?Q?4l7N12CfRhe5cwZOlEk9PIq2QCaIg6YY8Z1kX7qAJPwMtOYoliMRJDVBuSp0?=
 =?us-ascii?Q?7jPIJ0K9ikeg0cF70+Ynw3ApsRKOhq9/tWzvCvJVsGNHmMvLiN8qxIkaGCCK?=
 =?us-ascii?Q?cE5xFl36nA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793123ff-2732-45c5-130e-08df1e4a5773
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:54:35.4603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjHTnKvAhg7CHviTpguhSaLOBkUYyHQSXKmixnU3VUS+eI5V0ZeYyO3Uf64Jl3atA81lf5E9iA+CMy30DpAH/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB8683
X-purgate-ID: tlsNG-c1860d/1790700877-CE14687B-FEABA991/0/0
X-purgate-type: clean
X-purgate-size: 8390

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
failure fatal, and stop notification setup when trigger configuration
fails. Keep the NS16550 and PL011 consoles available by falling back to
polling, with a warning, if their IRQ trigger configuration fails.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v6:
- Fall back to polling with a warning when ACPI IRQ configuration fails
  for NS16550 or PL011, preserving the console.

Changes in v3:
- Avoid partial state updates and simplify maintenance IRQ setup.

Changes in v2:
- New patch.
---
 xen/arch/arm/gic-v2.c        | 15 +++++++++------
 xen/arch/arm/gic-v3.c        | 15 +++++++++------
 xen/arch/arm/tee/ffa_notif.c | 10 +++++++++-
 xen/arch/arm/time.c          | 18 ++++++++++++++----
 xen/drivers/char/ns16550.c   |  8 +++++++-
 xen/drivers/char/pl011.c     | 12 ++++++++++--
 6 files changed, 58 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index d05c574d88..87eda9d322 100644
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
index 186e726412..c64bc39f03 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -407,7 +407,15 @@ void ffa_notif_init(void)
         irq = resp.a2;
         notif_sri_irq = irq;
         if ( irq >= NR_GIC_SGI )
-            irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
+        {
+            ret = irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
+            if ( ret )
+            {
+                printk(XENLOG_ERR "ffa: irq_set_type irq %u failed: error %d\n",
+                       irq, ret);
+                return;
+            }
+        }
         ret = request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
         if ( ret )
         {
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index be54b87438..ccfb76e20f 100644
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
index 593d208483..cdda28879e 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1990,8 +1990,14 @@ static int __init ns16550_acpi_uart_init(const void *data)
     uart->reg_width = spcr->serial_port.access_width;
 
     /* The trigger/polarity information is not available in spcr. */
-    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
     uart->irq = spcr->interrupt;
+    if ( irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH) )
+    {
+        printk(XENLOG_WARNING
+               "ns16550: unable to configure IRQ %u, using polling\n",
+               spcr->interrupt);
+        uart->irq = 0;
+    }
 
     uart->vuart.base_addr = uart->io_base;
     uart->vuart.size = uart->io_size;
diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index a336241033..612d457fe0 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -347,6 +347,7 @@ static int __init pl011_acpi_uart_init(const void *data)
 {
     acpi_status status;
     struct acpi_table_spcr *spcr = NULL;
+    unsigned int irq;
     int res;
     bool sbsa;
 
@@ -363,10 +364,17 @@ static int __init pl011_acpi_uart_init(const void *data)
             spcr->interface_type == ACPI_DBG2_SBSA_32);
 
     /* trigger/polarity information is not available in spcr */
-    irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
+    irq = spcr->interrupt;
+    if ( irq_set_type(irq, IRQ_TYPE_LEVEL_HIGH) )
+    {
+        printk(XENLOG_WARNING
+               "pl011: unable to configure IRQ %u, using polling\n",
+               irq);
+        irq = 0;
+    }
 
     /* TODO - mmio32 proper handling (for now set to true) */
-    res = pl011_uart_init(spcr->interrupt, spcr->serial_port.address,
+    res = pl011_uart_init(irq, spcr->serial_port.address,
                           PAGE_SIZE, sbsa, true);
     if ( res < 0 )
     {
-- 
2.53.0


