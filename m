Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8E5C9830E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 21:02:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433077.1653918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9qZc-0000Xx-P4; Thu, 24 Sep 2026 21:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433077.1653918; Thu, 24 Sep 2026 21:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9qZc-0000Xq-MC; Thu, 24 Sep 2026 21:01:44 +0000
Received: by outflank-mailman (input) for mailman id 1433077;
 Thu, 24 Sep 2026 21:01:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1x9qZa-0000Xj-BG
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 21:01:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9qZZ-000iG7-BZ
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 23:01:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab58fa7-8faa-0a2a0a5109dd-0a2a4509b6b4-26
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 23:01:41 +0200
Received: from [52.101.83.77]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6ab58fb4-be1a-0a2a45090019-3465534d28ba-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 23:01:41 +0200
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13) by AMCPR03MB11903.eurprd03.prod.outlook.com
 (2603:10a6:20b:76f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Thu, 24 Sep
 2026 21:01:38 +0000
Received: from DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28]) by DB3PR0302MB9208.eurprd03.prod.outlook.com
 ([fe80::f257:38e:c0af:df28%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 21:01:38 +0000
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
 b=K6jgf7HiY8hh2FLU4Y2+G8WSynCroKfT0T2npJB5vTjCzs0dA6f53dezVRG11EyEJQ7/GtYGtcxhxNEwKEPFvMyYCMO/4bkpvLB74iaYXTQ8olYT5LJyBb+CilQXcYJVA5/FHCS++gH22/juSjaIORbSJ2Nx9x0FxTrE69M7JbC3FFdwafA7BrrcfFGFcsciA+5sebrYPAuXOmAtcyBpDNz58YRehce4FiatUb48qP3dI89MVcns2kZ5Q8V8lIsBDC7ywX/KL4tA0yK435+v5jgzLtTE4CYNbkFyVQv0QoVelGKr3b+hghUzU7MhzNABEruMty97tO438jsWAlM5MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DynQrCIYzpoukoQqiq/sboDfmzo/Zj/QuvlwnQu+MVQ=;
 b=cNNQK2Bn6Y9+245vz2hJ1cZtrQXVmbZtry0xWbCcDMsXZTpYUD/c2kbrULvSvZUepwUh+6AxvQfgyoXuT9K3eIV3VeBa3y9usTFS9liJ/C8TihP+J8aZKDxlVMH24WVxVymYLvIZARkZPq7PYIG0Yz0cOg/naaykSxwGNawr2+JRnbUpoWv7iUj1Uvd7JjxTNqioKZER/quoC8/STensoYkt8nIQNpr5jdaVXu9X9yoqwz21jqjPzKzZLWjxizXlqK7PGach3LOjxUIcfoWvgklfMxA9FkPfRj558qYQk8aNFqvwRG8TTW3cMeUuJHl75levfoBJbn+Y9eoc7BbLpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DynQrCIYzpoukoQqiq/sboDfmzo/Zj/QuvlwnQu+MVQ=;
 b=fQ0RqZw1rMixvzJgU6xw1ynAaHcTV7HxjE9MwQdNZTn++5723k2LhtO+CaV62GuUYd4D9Wwa2bzm/IB4cHhIMFxSGbrR1AMmoghQLgSNrMRaYJWr/vxToMlz+GOmgvUmhlvIjrt0cA+naJN5d0x47bztnLOCys6XiLluAQ3V8ipQDP0VKtvRDaKqnDm/cg90PlrVV/BUyQi8UGWnqLExFAL3FxfiCUtzq6U4NtphypzwMb7aDP6RQMqrjNVOuymLmiswk2tCj8j6H79YluilCDEJGLWBUMBJQB9qDeTpaNdOV+C8Esqu7CEx9RmfADYA5ws+pcLsTwgXaygZhdgaQA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5] xen/arm: derive GIC CPU interface ID fields from the vGIC
Date: Fri, 25 Sep 2026 00:01:29 +0300
Message-ID: <4f24dd8cd9fc76e8c3f93bca44bb58056cbcc51a.1790147101.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B8B.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::63c) To DB3PR0302MB9208.eurprd03.prod.outlook.com
 (2603:10a6:10:430::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0302MB9208:EE_|AMCPR03MB11903:EE_
X-MS-Office365-Filtering-Correlation-Id: 247959e7-2ec7-480d-48c5-08df1a7f0670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|5023799004|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SkA0tAFaixTP+fUqlT4V3hOfuIFFCwoDhUYVLddk53mDlPD/6bsyoZsVijoYsEPDPQYtqaKRPmBEj6oWPF4509CecUK+aa7FrQ7JVVR6ZMoWK5M5exZ4iWu/jetq1Lbi8x5GXQrFJVsqxr8JFE0MFMiHRo6lC8Hgv5+LN2S7FL83pdmwysOHKIRJT9+5FLAlWstMVszniKhFHvqSILuKBxfRy7/MVp2U0kKUr4E4RppUHBgQlK4J5XSs0Y+ZwgEyRg7W5Yu6B1qfeL1NitA+cwRk+eCq20C3ewCFqU3cl/81ypd0WpiKX5qBMlIclfkL0A56J16q4WAXs60nkEUY0q+/bflG4/LSyFKmCyXg7x7YukQnCXPbTiRLghYOEdAt7Aa2Ce7L0sm+MmCQZnofXUged36pVqsIdz9LSmwY2CEEOe0vm/LP/YTWsOEKhOoP4605KOXjc2i4TIMtZ3YWssrUIv7U2pD9Ucfdo2/8+0oEcmayv+KlT5w0nDPxc5LJQOs69gAAodDz3cPREHQOJV0O1ceS1jxMjO1LMq1Vmpz3wP+stFh9YB2GUrwOPzahcCzYzv4WI1hAK2GyKE+ggNzABapA6XFEpN6Q48Ki+No2VGecrRl7yfu8W2/wjRy+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB9208.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(5023799004)(11063799006)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aJvmpt8k80aMBZtP5X2q29v+qxbTWEoflW8TVUYdc1QUb9yIlmrftZX2cTyc?=
 =?us-ascii?Q?BMHnKNyDn4qU72a2ffkzUgbJ5SBq350jfWl3vz0ustilIYZB9+CvkP9fhVh3?=
 =?us-ascii?Q?0tK4IHxcJsq+TyeNJpyxUES0adtJvZiL0iWL/sfylkcn4U5DCQcTZ50zq54x?=
 =?us-ascii?Q?kLgH8caIrzlEeCrqVVRZmQk8uJlYQGfKc6qSumZV3eunmC5yFcNbsJgwKHyr?=
 =?us-ascii?Q?N5NiDl5NmCyweDjrCQuXaoj1b9S3SE4TCX5wN6r2KCVXIr6S+CP355G4+oFQ?=
 =?us-ascii?Q?PJYNLn5Il+9df4xQY4wuqhExIc6DIg7gcvTtFiIFgZo8h+XOfbJeMxJ24NBb?=
 =?us-ascii?Q?BXj0YUh8hdQlTvzNyvrrywRk+hzNhwrnKSOAfrJ4Nb8NoU0seHqcYQFfRGTr?=
 =?us-ascii?Q?sw4L1Q1zCamL0TwHZxpStiSyO/dj4u9UjaRl8fJ1ZXKJuFJxQNDWf/6Fx0k/?=
 =?us-ascii?Q?nW4STrgVq3uvMujaJ1zLBZ8JtrZAxw4FWSl8T2r4PXFy/FP8/Xu5fNZSFmx+?=
 =?us-ascii?Q?DfCtTLCkdmp6QJSn5P2mtogxNKMUUBnp0z0Z+RvUMIF9pdXbCjHjglQn+MUG?=
 =?us-ascii?Q?cKAQmKQelX1MYfVR6fuzosVX0aged0cNIQ+3MV+C0uMC78eOZHX9b9plgTxr?=
 =?us-ascii?Q?M6c0TaigzSk/vO7YhA1z+nUbQb0zw0THaKXtugdMm1CG6BGzjM+OsRTAQZi4?=
 =?us-ascii?Q?ae06hMQKiBLdiceMMQW8BBmUXSWA42qUpSTbrTcUATkrSUZ4J3+bsRC+I/Xg?=
 =?us-ascii?Q?g97QCEIfIwDYT8NwbXAGBdYdvzu3hEB6o4EvJmX0qwCw2/UEH3n8u8R4nf7C?=
 =?us-ascii?Q?JBD1fLVbpDX1nLErFmSU2bcJMW6KgeIr1VbFRYhY4E0ZFqzEk1AP0xIpzMYg?=
 =?us-ascii?Q?0yf6omMgJKky+agnbZTrXm6z/mFGMEnAZpf1acJOwBEvAP5cRDcgL6PYMrzP?=
 =?us-ascii?Q?chw64zaegbAyR8Nh/+eiCZx2vGW29vr9fGkfXn9lGJJJrn6zftAswWALl9cQ?=
 =?us-ascii?Q?arCLQzxOBxglDSRNzPtdp+8AruBfw224eTu/Zf+dK7rOsF+rizhSkZdmFyJn?=
 =?us-ascii?Q?oK0UkjijLPLUNnaXw61nLXPH4WZcOK0m7RdKpOcuFqvp5rMeHho4Mk3UmkKm?=
 =?us-ascii?Q?hqxJfOECtFQZBCMk8u0hl/h9CAgxWzBtzAFcs6I7PfXo33wNvoMi2GVots+E?=
 =?us-ascii?Q?6VOuoJjnVW1Z3oiKX2L4CrSPpuTbYjaZvHXpUAHPUYK6iIuLLp/QG1/Zkshc?=
 =?us-ascii?Q?IoLyxG/72di/0afJlHH0g8Llt4CmMMfj/GGPVh07LRbUcsS+QPBUBoSnQQB6?=
 =?us-ascii?Q?2KjAFPzNujSYrDNhChWst87jkSA7e5gdonYb+CX009x0A8YX7K/B3YSduFmF?=
 =?us-ascii?Q?Fi11ol0OIAX/lj0ziKTUMVoL+wz1cJlqBkL49wLPvrCvM8Bebccj9JmgsH12?=
 =?us-ascii?Q?7iKagtk2BSoX48rOBkLykEGSa1pfOXSforqb4L2cDbgdii8oscfjLtwSZboP?=
 =?us-ascii?Q?j9lwlI+PFmj0R8/+AafHRnce5VjdmmenJ45h7px3F0I9GIdt6vXsv3o3DNIl?=
 =?us-ascii?Q?LNSdv+s/WpPmjs8drAbEncr7i2WnaeKn4DYJjNXTAfdL2EZJ6DhVwFCElj2v?=
 =?us-ascii?Q?wO8RyBfS+69ZNRKS2WWn0Oq5htMh/msskbxW2TNzp1TpXb40lFQVnFa19h08?=
 =?us-ascii?Q?zpctR0CeIW1yY2GgtkdHLkcYk/Y/sWOATemtchkqfzsHKRXtq+xNoeVHoYkn?=
 =?us-ascii?Q?bZqVUWXzQA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 247959e7-2ec7-480d-48c5-08df1a7f0670
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB9208.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 21:01:38.2569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+fZsWg/c3pA7I7TlTNQV8BXRLWPcFxyyKavoUySHR3bYc80QttJgcWm+c/ceCEW+E5VP8eDlAIebtQEbdVo3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR03MB11903
X-purgate-ID: tlsNG-bad1c0/1790283701-BECDF034-3AAEF001/0/0
X-purgate-type: clean
X-purgate-size: 7826

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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v5:
- Fold the vGIC version mapping into the shared ID register helper.
- Use the vreg_ and VREG_ prefixes for the helper and field width.
- Cosmetic changes after review

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
 xen/arch/arm/arm64/vsysreg.c             | 21 ++++++++++++++++++++-
 xen/arch/arm/include/asm/arm64/sysregs.h |  9 ---------
 xen/arch/arm/include/asm/sysregs.h       |  9 +++++++++
 xen/arch/arm/include/asm/vreg.h          | 20 ++++++++++++++++++++
 xen/arch/arm/vcpreg.c                    | 12 +++++++++++-
 5 files changed, 60 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index 66f4f23bb3..d8f380ccb7 100644
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
+            guest_reg_value = vreg_id_reg_set_gic_field(guest_reg_value,
+                                                        ID_PFR1_GIC_SHIFT,
+                                                        v->domain);
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  guest_reg_value);
+    }
     GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
 
     case HSR_SYSREG_ID_DFR0_EL1:
@@ -362,6 +377,10 @@ void do_sysreg(struct cpu_user_regs *regs,
             guest_reg_value |= (sysval << ID_AA64PFR0_SVE_SHIFT) & mask;
         }
 
+        guest_reg_value = vreg_id_reg_set_gic_field(guest_reg_value,
+                                                    ID_AA64PFR0_GIC_SHIFT,
+                                                    v->domain);
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
index 387ce76e7e..a85fefcc3e 100644
--- a/xen/arch/arm/include/asm/vreg.h
+++ b/xen/arch/arm/include/asm/vreg.h
@@ -4,11 +4,31 @@
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
 
+#define VREG_ID_REG_GIC_WIDTH 4
+
+static inline register_t vreg_id_reg_set_gic_field(register_t val,
+                                                   unsigned int shift,
+                                                   const struct domain *d)
+{
+    register_t mask = GENMASK(shift + VREG_ID_REG_GIC_WIDTH - 1, shift);
+    enum gic_version vgic_ver = d->arch.vgic.version;
+
+    ASSERT((vgic_ver == GIC_V2) || (vgic_ver == GIC_V3));
+
+    return (val & ~mask) | ((vgic_ver == GIC_V3 ? 1U : 0U) << shift);
+}
+
 static inline bool vreg_emulate_cp32(struct cpu_user_regs *regs, union hsr hsr,
                                      vreg_reg_fn_t fn)
 {
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 3c315be9fd..15ccde71da 100644
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
+        guest_reg_value = vreg_id_reg_set_gic_field(guest_reg_value,
+                                                    ID_PFR1_GIC_SHIFT,
+                                                    v->domain);
+
+        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1,
+                                  guest_reg_value);
+    }
     GENERATE_TID3_INFO(ID_PFR2, pfr32, 2)
 
     case HSR_CPREG32(ID_DFR0):
-- 
2.53.0


