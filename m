Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10363C5DF80
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 09:20:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393800.1632622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFzG-0002KA-La; Tue, 18 Aug 2026 09:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393800.1632622; Tue, 18 Aug 2026 09:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFzG-0002JZ-H7; Tue, 18 Aug 2026 09:20:02 +0000
Received: by outflank-mailman (input) for mailman id 1393800;
 Tue, 18 Aug 2026 09:20:01 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wwFzF-00022A-8f
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:20:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFzE-0026XI-LM
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 11:20:00 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a8423b8-8faa-0a2a0a5109dd-0a2a450cb062-34
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:20:00 +0200
Received: from [52.101.83.105]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a8423c0-f479-0a2a450c0019-3465536943d3-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 11:20:00 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by BESPR03MB11771.eurprd03.prod.outlook.com (2603:10a6:b10:fe::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 09:19:58 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0315.012; Tue, 18 Aug 2026
 09:19:58 +0000
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
 b=A5/IiBp9a+diqt1ip1NlPb8nrvFkySO3DGRYeHKkBPEDzJiBUHaAPe9Ii5nd3fKHJvUMuUQ+xxZ7XeyyXy96m8O+rnTltsRBhpQ2He/32jFMSIytHbqoOjit61y5nl2Ulpzvyia8xDItQIP7p0GRSVOJCdnw/zA0WFmYZUXq243WVye3FA2O4Wvzjx1luhbp+aNAyavbdRd2Quq4hHsEQTsW+J00VIjtdAPl1+s+4WI6PD1P25C6l+Yo1js8FgqvMdptNvZRkUrT9JnK3FMlsZqCrL54TS/M1XiGlnkKxdS3s5vPO9o0V1KDOITunbCYWW+zaUX1O3X4YsVAsYONRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZJW6+PpwTOAkHi4zyqBOVwy7B7owB2mnA+s6Q0GOYk=;
 b=uML0fT2jX2GZbHKozaGUtH/GpvgTVQcPkJjARyDf7kC1zBXF6Ih1OUDR6F7/Ld2X6oZDM0ql1Ur4JPei0M2XIr1nj00nXzISFL3NxDjdILL/opOqDvK13u/jVIk8iMeYaVcwqCLM0vmtwNC/U981z7ZCq4Q601+TbHuEulaz/q/9vZ4Jc2498z5vpT3OC97ljys4HaDqfu6ZrWJPnjzqLrhka4S2R+PJoOLKpNmAdirfyeRMKzJQUNk8/lcL05bL5zWbtmKIG2mc/o+zROP+nHehKfoQCq1pP7sIQavhOmvq0gMCHTIG2I3UWY3PMd4PSm+YDAqydT9eVkSyQ07jsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZJW6+PpwTOAkHi4zyqBOVwy7B7owB2mnA+s6Q0GOYk=;
 b=XFWT598exDOX1BfgbFMDeUJ+eo578wTEEBEmLfdr3c6VIj7k+vKwXHrjXEAbOs/AutDxbT0yu6pwPlzeZ0fuXuUcr/ZHS52J6xXJzJ/3yO6liLRLRCyBnVJUv7A93UICHRYQXH0q1cIJjlty7wUzszUofZtL7fn4lrc3O7MMIKrsqT4KrBvaYQREEd/lr8AqwwbGlM7wB5/v4rgGe2ElNsvwULUDoj9JJtIZx6Wp0eypC3lomWfHmlyyAn0qe75R/15hFBeQhFke3VThRyyvijjCbe1Tk4SLUk7BiUg+PKMReoaYc2Qc7por1Bq56rMPjS35y9QjP33USYMCNb22GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3] xen/arm: derive GIC CPU interface ID fields from the vGIC
Date: Tue, 18 Aug 2026 12:19:49 +0300
Message-ID: <e8841a943eb7f6a64348b7316032084fb848bc2b.1787040666.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA2P291CA0037.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::17) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|BESPR03MB11771:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d9c60e-7758-4582-3f0b-08defd09dfbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|56012099006|6133799003|11063799006|10067099003|5023799004;
X-Microsoft-Antispam-Message-Info:
	hBNE/7XyHxeH4Qxx4lF6KZjxCjIixopRDIG9hgiwYlhnpZTO4EBQpBg8KX8B0lBx8h0mXf8kGhpgkU96WGVYt8bmI3wAm3R8peATobnRao/odzVzkDCra85sqnU4runFhoA9eGHryjqYi5kala/sHY4Z4RdNPv0EmAN9JfjqWoMagsnih/0rWKEgBYHSAR/ZeqSKvr9n+prbrgN7LHIsAL2SAE3V4Cy1bLNwtHXWuu485xUybRQBuJGEarkCfC1kjA1hIEpUgwUM0B8FywAxhzrs6isqUIyb5jRyKmts8+f0WE3+BW5/C1X9f/eZj8HyZto8XEQxXoU/W3w0yuSmlJqyOCc0Ixa8PcB54nxWWud5T5vmhbpaMPVGx7cmJIzzcI1I3kcZYXTrPUI+SpqbLsN+ngh/8AnAea276Sk54xEYAoroxE04tNLgG5AGxZfN6HG94PIECRlwrk48q4JCuy8rA2l3fm4StwHeyqYY8OmEW5V3QQPRlvXXpic8L0hajmQlDhu2POv/g/52Frb4EjnBZnUpCIZ0Ye1ZhqhSHwFusB/RS4rNo1BEJx5zrXNvdfGtBAb6KPhpwi2FhcOu7K7cSjEpP+6xKd5WWiNfAK8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(56012099006)(6133799003)(11063799006)(10067099003)(5023799004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZUlzGMIpvPRO/9P53z4BFfOKBTVHrfHr2TX1nRXmuta6TFTFxMmd/5wc6390?=
 =?us-ascii?Q?dNH7N5fmX+1LC3WLWJeMpBPZbEFoPO+bCl3qieqvQwDaIDedGtHWW4HZjA4t?=
 =?us-ascii?Q?7sT44MwC7qUq3Naq31frez9VuQncJDnp8wWpp4emoe5Z+fD1V842uz+okua6?=
 =?us-ascii?Q?KPFqkU5ySixUTcgBwccVB2Bgvk7X9yP6UrdyrSYJQORm9nzJ2yK0uhdHDxK0?=
 =?us-ascii?Q?pK7vSiAovYHaZIaYUpfwMHsdKHQeF0c923d3v2U6Z4XJwMRGFi8NwZtdu6/X?=
 =?us-ascii?Q?m+5kfWEWn8jIzwZlgHRqwLu/w/HfO30Mt+CgSKJHrvSRD8+lVZBQXc5AVaMp?=
 =?us-ascii?Q?MdAMAnrETajNoOMmK8hJo8S8STqcMkXoh9sOMfFbXV3Kep4NN14XlcXl5lKt?=
 =?us-ascii?Q?nH9FR32vjHZG13NarnqO5Tf+BNWvLKcqpCyzN9RoCz0ArTFmHnE5TC/LtwON?=
 =?us-ascii?Q?fpVI5cyevj2o5ihVoZCzTJSZrxEVIn4sCcBgDOI6+8aUOJJ/7Rwp6YSugWkX?=
 =?us-ascii?Q?QpbWQdJVAy6nEPJtg5HON8dYORR+zKMwQ7737jlFhbPpgjDWpSXCi6XOJsA7?=
 =?us-ascii?Q?XTLmVsS9r7yE5tGYmkOqoBKVN8wQtMzKopqXqTtQya6DMXURD6yOD7raG7Io?=
 =?us-ascii?Q?wA3FTuNwcH05b1+9RMlsU1LMeE2+9KHudiwPYmNBNn1UyRBbFmtLo5gvUh1M?=
 =?us-ascii?Q?LmCwXpyJGLjBahBanj/x0tCIhjxf9i39u4MLq5FHUoS+0vQDbeYXAWirJdwJ?=
 =?us-ascii?Q?IQQiOPQi/86cbeOUjoBgs5Tg84Mxc//gPwg1NwTloeS554UT7UZd6EOLY01y?=
 =?us-ascii?Q?t1BD79Y+sxtdBbDJv6DCPZ0/63iidOdHxC2t1q5spDc1C6ADPuAlJ+spgFNa?=
 =?us-ascii?Q?Q+ryF9nlnbtVj6Nz1eO2n30kUtut3nsQHpbyctdvzZxdMTojeO4+frhuKe3D?=
 =?us-ascii?Q?irzd5IRmQH7ZspeacBRHrvJfgBP5iGac09k0uI4f9uXH+t0axisx5SA2jrRy?=
 =?us-ascii?Q?gDnB6mGGYUTSztbFj11oZnTzck1gMVmdRDHqb4Wrz9sdPJtTpCS3IuYFMA4X?=
 =?us-ascii?Q?QRFpk38iap8Uy7NaWHOH32TJ0cwHkCaeIjJkSyXEW3XvMs/76zZDkZVvPhl+?=
 =?us-ascii?Q?XuSyzJp3TU2ojr401um3ECmDcijTcQuW6YnaFtLbtYLHN4zxqmvggEaY53Bq?=
 =?us-ascii?Q?tu8OD3S/EuFy0lqGHeLfLOGe3QhmsHyF0NIXgQUN1a7bcGeVYTvaH8iNZkOd?=
 =?us-ascii?Q?Q40G/VyaAQsmW5aEI93KS0kVDgbzhnoN40yF7souDkjZ9aNldHuodFOEA1c/?=
 =?us-ascii?Q?Al6znAHf/sexVqJFZxJnErifUQ1OzvLCdotibFqoAOkaaJVrZlWaozosGEkp?=
 =?us-ascii?Q?U0d/v5pF4LOTP9Tg3YcmHw6xy/WfzNE0QLjrAqMipjaIRAaf8MnEPvGANNAf?=
 =?us-ascii?Q?UcN0JGPaA7vW7zYBaH1XCfBqlXHdOelg/0Vhe9UdsDOMSEQtx+fpyqXe6Oac?=
 =?us-ascii?Q?PAo+1XRSTitcuzRBGQAIbv+6PqxnyUd3StNIeIkLaqPoTQOn8ncdHeMjx9hv?=
 =?us-ascii?Q?1wuVQMyKpowoYdDIB9vU1lJuUrakmLoUV7Eo09fg/OcHABaFuV9SHk6NbBvV?=
 =?us-ascii?Q?GvLxGR85FPQIpD+JomNNbS8F+3dILyRv793ZjjYtLZvr6h+H4Yu6K26VV0bo?=
 =?us-ascii?Q?3Ns8VEVe6CkDR4ZKBnaglOw2dNVmi2r/vDk+fIOCg/AmALtH7OXmR652uQNL?=
 =?us-ascii?Q?m1E7coju+w=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d9c60e-7758-4582-3f0b-08defd09dfbd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 09:19:58.6046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HvcMRhwdZVelW8Ok2nbAk78/YpbWHOYGPE4L+aRxDNZOtSStegEImFBGy9O+1AdD3UwnXPWpersczwH3wxmBKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR03MB11771
X-purgate-ID: tlsNG-d25034/1787044800-024DFA5B-5254EC1A/0/0
X-purgate-type: clean
X-purgate-size: 7709

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
 xen/arch/arm/arm64/cpufeature.c          |  1 +
 xen/arch/arm/arm64/vsysreg.c             | 18 +++++++++++++++-
 xen/arch/arm/include/asm/arm64/sysregs.h |  1 -
 xen/arch/arm/include/asm/cpregs.h        |  1 +
 xen/arch/arm/include/asm/vreg.h          | 26 ++++++++++++++++++++++++
 xen/arch/arm/vcpreg.c                    | 12 ++++++++++-
 6 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
index 6fb8974ade..8bae8915e8 100644
--- a/xen/arch/arm/arm64/cpufeature.c
+++ b/xen/arch/arm/arm64/cpufeature.c
@@ -72,6 +72,7 @@
 #include <xen/bug.h>
 #include <xen/types.h>
 #include <xen/kernel.h>
+#include <asm/cpregs.h>
 #include <asm/sysregs.h>
 #include <asm/cpufeature.h>
 #include <asm/arm64/cpufeature.h>
diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index d9e3619dfb..4fb50b6972 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -20,6 +20,7 @@
 
 #include <asm/arm64/cpufeature.h>
 #include <asm/arm64/sve.h>
+#include <asm/cpregs.h>
 #include <asm/current.h>
 #include <asm/regs.h>
 #include <asm/traps.h>
@@ -298,7 +299,18 @@ void do_sysreg(struct cpu_user_regs *regs,
      * to identify the processor features
      */
     GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
-    GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
+    case HSR_SYSREG_ID_PFR1_EL1:
+    {
+        register_t guest_reg_value = domain_cpuinfo.pfr32.bits[1];
+
+        if ( cpu_feature64_has_el0_32(&domain_cpuinfo) )
+            guest_reg_value = id_reg_set_gic_field(guest_reg_value,
+                                                   ID_PFR1_GIC_SHIFT,
+                                                   v->domain);
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  guest_reg_value);
+    }
     GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
     GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
     GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
@@ -337,6 +349,10 @@ void do_sysreg(struct cpu_user_regs *regs,
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
index f3c11d871e..c0a6827b08 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -438,7 +438,6 @@
 #define MVFR1_FPDNAN_SHIFT           4
 #define MVFR1_FPFTZ_SHIFT            0
 
-#define ID_PFR1_GIC_SHIFT            28
 #define ID_PFR1_VIRT_FRAC_SHIFT      24
 #define ID_PFR1_SEC_FRAC_SHIFT       20
 #define ID_PFR1_GENTIMER_SHIFT       16
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index a7503a190f..79203324fa 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -114,6 +114,7 @@
 #define MPIDR           p15,0,c0,c0,5   /* Multiprocessor Affinity Register */
 #define ID_PFR0         p15,0,c0,c1,0   /* Processor Feature Register 0 */
 #define ID_PFR1         p15,0,c0,c1,1   /* Processor Feature Register 1 */
+#define ID_PFR1_GIC_SHIFT 28
 #define ID_PFR2         p15,0,c0,c3,4   /* Processor Feature Register 2 */
 #define ID_DFR0         p15,0,c0,c1,2   /* Debug Feature Register 0 */
 #define ID_DFR1         p15,0,c0,c3,5   /* Debug Feature Register 1 */
diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
index 387ce76e7e..bb6c904f2e 100644
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
+    return d->arch.vgic.version == GIC_V3;
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
index 3205c7df46..31ef6df838 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -318,7 +318,17 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
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
     GENERATE_TID3_INFO(ID_DFR0, dbg32, 0)
     GENERATE_TID3_INFO(ID_DFR1, dbg32, 1)
-- 
2.43.0


