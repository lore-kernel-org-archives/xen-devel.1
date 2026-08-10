Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA9CC5AD7B
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 21:13:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387884.1629113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtXJ3-0000Mg-B6; Mon, 10 Aug 2026 21:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387884.1629113; Mon, 10 Aug 2026 21:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtXJ3-0000MZ-88; Mon, 10 Aug 2026 21:13:13 +0000
Received: by outflank-mailman (input) for mailman id 1387884;
 Mon, 10 Aug 2026 21:13:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykola_Kvach@epam.com>) id 1wtXJ1-0000MT-Sp
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 21:13:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtXJ0-00FS0Z-A9
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 23:13:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a7a3ee6-2eae-0a2a0a5409dd-0a2a450ad456-0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 23:13:10 +0200
Received: from [40.107.162.140]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Mykola_Kvach@epam.com>)
 id 6a7a3ee5-f2d2-0a2a450a0019-286ba28cce99-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 23:13:10 +0200
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com (2603:10a6:20b:61d::18)
 by PA1PR03MB11087.eurprd03.prod.outlook.com (2603:10a6:102:4fb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 21:13:07 +0000
Received: from AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7]) by AS8PR03MB9746.eurprd03.prod.outlook.com
 ([fe80::cf11:309:1384:58f7%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 21:13:07 +0000
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
 b=reVNKDrSwnSwMLwBl3fvobBW/65233a1wXrmuGy0+N1S5cX9VBIfemPENrAyrWU7/hWqOZF+QkQXKeESpWza76Raq1/6ZTAnM+SOuqsVysuSVmHe4yo9WQId7nivsYgxHJZzOjX8oSqJEVRsGWtsFrlqB9Lexh+LUfv3V5g8246bXYbjgeEXRn8gNRoR4dbdCxNbM4s6B1bzNT6zBP/Vq7kF4AzD5swUl45XAlJHsZTFFj1fxM5giZO/LT79o39XOk8hjP9T5/i8/JR2y/GXALSlk/p69c2INaUDGkA2mNsAuwddv+beGAH3+s+utqLzG81sdtfuL0NUCy6itCYMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzWm+MoDAj5aNhJ4WndKnYf0eWSbIGtd8eby1BHS21I=;
 b=WjSichy0/m2ciksaS5zMcC79Qq6/DnjN+It3xoFOte8i8H49mQNJMlNrbuXlzNPeibpgUSpxLNxq8qfoAzJtJypiJMFui3kNEC2ZH7cn7iXnN8208P9Pvi01jmasj77We5FohMtAAjxL8egaoI3za7MprbxorhcPP782CmkEOs+j1PPGJveS6TgMnxfEMJtZjbDRkkFTjCfw336y/wckrLmZYYs8hXNuTnJop6o0OZhC/y+Ir+cy5eGVYj+lQ26MEsukM1HqhzbVwlq6k6+uutoLyGofGzbHfeYpxrCBo03/NRSXQRtBUt2f09XZFvK2SqSrAsidwC8R4sUlrNiBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzWm+MoDAj5aNhJ4WndKnYf0eWSbIGtd8eby1BHS21I=;
 b=uXKGhYajRPdJh6lzZTNhfqMxpDQKOGIQV32wZEfEAnkob9PFsOUhpmZq1Lrxo8FviMCC371gERvN9Sl+HvHW/X6D2reVm9raOLT5YaF/HP5yxr4FeSKT2uq4ToRJqRPsGRKFV6lJgyexXVRb+5E6PTX+JtYnjq3WVBIuGaJA6eYfIE3aS79GbBdr4q1V79asRscpKtsEVUwwuMIrQNmpU/s9av7DzZ7lx4d7qZ/pGmINhkwD/Jmo217ciUv9MdVeGEbo0BgF/qEtwoHTEp8ua+6vQJkbOV1DKBsVdiGLg2SHqizrI7fW6ygA+S+OqJbKyycUzYJQ4czHTx5Dq5uK4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
From: Mykola Kvach <mykola_kvach@epam.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: derive GIC CPU interface ID fields from the vGIC
Date: Tue, 11 Aug 2026 00:12:56 +0300
Message-ID: <f46f9e6ebb12d8402fa72b1641796f33e24c539f.1786395761.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: WA1PEPF00005B70.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::609) To AS8PR03MB9746.eurprd03.prod.outlook.com
 (2603:10a6:20b:61d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9746:EE_|PA1PR03MB11087:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ddbef3-ac06-4cbd-6d3a-08def7242c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|10067099003|5023799004|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AMF2SBunzSAL9fG9mIM3vy6oGsdXTEf9dAG4bVWUFKnVyYRH7B1GlZFK3Z7VZ5LGTERxtnvnLjJvf3WHXOHV0VY02829aCyHU3OSVaaSncD60nuxifRo5XtYHwe3Bv8fE85zfhFDd0kBxPxfCpctD0AUbZv4KS0Klg/RWL9mNfpSOarIfobxNfudrg9CVclt5RaeDqjBuIli77BL59R0vX8+qy/NNm6XCtfn5OdvBF4fmJ6RPYYwEuhwP9ywtKjX8JZxQ9dLoeholVoAAxZ3kARERM1wFRTUGI3B18Q0EdlHN6ql0oVXHZxWRiCEKchrle9S+0NlOtoHQDrt5ZtXLcD7//Gv/O2mRFgn3Yf0z5w7p560OZl7/mBgPqthG9UY9xmp49ONy8Hqd90FXLqoiaQ1CtrFqDwpKl8LNJQraMphIb+H4nHbOhFqybXciH/rM+SA00ozySI7hq7sn8SR0qB3XOLVFKvAB52Pf5HEz3Eyubgwf9Doyc08sFJOHAqZ86QVRfKLTXm4FO2O0tKHi6qBlOIis8nCyzIJzYK6zQVwY79R5AsEw6U9eUJg05GT5jSaq7Cyd8umvMFII0rp0zt3fv8a33Lfb53qXAp2A+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9746.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(10067099003)(5023799004)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vyebwNCxMJRZ9UMCSV7ZF0qA5Tga00bMVhakrl3xO574SVmkVLLJaDyxyCe6?=
 =?us-ascii?Q?ziKCpCMNWRG5yXJOmyyJ4svytKVn3gNzXCoX1IhEwYxDv65F1fY9rJy8pwxU?=
 =?us-ascii?Q?BEfdj8qN2nE6WTJS7L9IQzy+rwKG5vVE87o6CJW5tatk53s5JjWLTJ1K4TOS?=
 =?us-ascii?Q?oBeata5KNUsZ1teKcixRm8Z/F+u99+s+c8prjrgCJUZ1xiXbBFs3hEme8XUw?=
 =?us-ascii?Q?ejYi793Lv6aoYVSYnd6y6/0YHc8Fa9sLAyVl1Sj1rr4NouUCvPKkbtMq0RM1?=
 =?us-ascii?Q?CAbcAEGWfYniCb/qw1ARNCEAfiR9IKuSW6cm0Wby1gef3DqGhVi98ZeqAz7/?=
 =?us-ascii?Q?sSPtRichTo6Dz0ESjNYtHS05Fk+LUzGxh9m6ZUvZCeuzBCO/YZisyOZ/M+Cy?=
 =?us-ascii?Q?XQCPj0w9Sa7ZrYQOUaEFSsHhoUeE6Ek68kkF7ollzhoH3pRx1oAPy38Nmul1?=
 =?us-ascii?Q?QHq1lpV3x2lnuKoMQ+ANjcMtGlKO1wwm4g7qdruatnzvaHzkgZD8aBJMIzzT?=
 =?us-ascii?Q?v4ld4hlKeoe4W/owY2V7pPBRiT1oMptVWI0e83kBZcouTQketJCEZUneInY1?=
 =?us-ascii?Q?2SBq1eLpMxA6Ul+mpUKGQISGX9w79IxaOATClzRVS/sFmQpC2tfM8mSAjQkp?=
 =?us-ascii?Q?d/Uex7BRrPlBonF5QZH0sRWjGLjyvFzOhFmKFVHdkmyAYi2F/emnAkS7RE5g?=
 =?us-ascii?Q?vYOeUnleAazSXB3bam7hkUKIRGtvXRl06T298fnkB6h6y3zj8LnARpsRa/q9?=
 =?us-ascii?Q?KVariQc6OcJnvC4fm9Rf9DktAZsUBJhxeZ1ZitFcy4H67iOwETfkO7QAfB7B?=
 =?us-ascii?Q?VinJ6f2a9HkxEdS7TQUAS3x00GVUehUjdXauT5lOPTUaoBciG/k233vP/Chr?=
 =?us-ascii?Q?TOLz2dRVXQvVsKygMmD3O6xcK8xK/PJRHCFWoFTwn/owLwAidrvqzbh4fwOr?=
 =?us-ascii?Q?lifouFrkSul/q4NNbLcgJCo8qTYYU7axWH6lSjeGcy6jXKZMLbbGL8XNoEmS?=
 =?us-ascii?Q?MrkKXEPMPi2C6ydjt/05pQx+U7B3+xC4yR7mLo/fJBmIx+X5Y9Ik48fmEdSm?=
 =?us-ascii?Q?cXG748nLxXQkfQZTjiQiSt+LFgUaOFs6+q1qFlX2sSoe7jHlucw28y2d33bK?=
 =?us-ascii?Q?d2X/RiM3ZrZ0fxqzsWVtHpdBKSo0AqqS9+hKH2k9/tivD6GfEMWIbQz/Yvt2?=
 =?us-ascii?Q?FrX50WQK94BtITjO6a6g7zxNXXM2mooUZB0bcLZUC6TaZJZaCxXfgyrhhQdM?=
 =?us-ascii?Q?rkQRZOhjE+7693tWXMeR5olnXH39vHapKZhjTJQ+wS8LN5rIc5RCegoeSdbu?=
 =?us-ascii?Q?fr0cdUy/vAQVfTAYoobcLh7u89pGn5+l+wncavkK9N1Rk9tA4pStDOrr8x1B?=
 =?us-ascii?Q?8zNV5GVb29fOXyAVQ3GuSXoL2zYvslkz0zBwWfMCSU/5DqllOecsQWA5Guy4?=
 =?us-ascii?Q?fxJHmcNb84P/i3joX+p+wNswe4DdHoDdRTWXm+rBcs/g+8mgoG5R/6rBgN7v?=
 =?us-ascii?Q?vQhVvf4fZee8vEtE86ddsHhlnjKRvoxjct5AyyuyvWZ+yWdbgxEBKgoesbms?=
 =?us-ascii?Q?Mx1/WKG5xJoSjq+0mYN95VQYC/OoVdrTiDOJ0ra/werH6/4i1lEdpsaDbnPv?=
 =?us-ascii?Q?QE+2IAtrS+LYq8vRUasW0wOySYoRt83bA3xjw8zPi6K9JKkwfQzqKl4wjkr4?=
 =?us-ascii?Q?18wupMf0Kx8fBLK5I4bk77KmycpnMj7uZXyZl1NEKgKxx2z5e+WNfHw1Ijxv?=
 =?us-ascii?Q?NYI2RSE1yA=3D=3D?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ddbef3-ac06-4cbd-6d3a-08def7242c95
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9746.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 21:13:07.3404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cu7S+oKpRR980ev1+YmiMZR+NUBlJgvHfVTSvKn/i7L7/JMTaZY7pNIjJ/Pqu0ruugBVC05d929A4Wxwu4HG7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB11087
X-purgate-ID: tlsNG-4011c0/1786396390-51CC3CFC-DF4A89C5/0/0
X-purgate-type: clean
X-purgate-size: 6134

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
Changes in v2:
- Share the GIC ID field helpers between the AArch64 and AArch32 paths.
- Parenthesize the individual ASSERT conditions.
- Preserve ID_PFR1_EL1.GIC when AArch32 is unavailable.
- Target master instead of the 4.22 release.

v1: https://patchew.org/Xen/ba4f779d68c54efc80c4a566dca38ac2e6f9a073.1783675708.git.mykola._5Fkvach@epam.com/
---
 xen/arch/arm/arm64/vsysreg.c    | 18 +++++++++++++++++-
 xen/arch/arm/include/asm/vreg.h | 20 ++++++++++++++++++++
 xen/arch/arm/vcpreg.c           | 15 ++++++++++++++-
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index d14258290f..a02ad951f9 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -21,6 +21,7 @@
 #include <asm/arm64/cpufeature.h>
 #include <asm/arm64/sve.h>
 #include <asm/current.h>
+#include <asm/gic.h>
 #include <asm/regs.h>
 #include <asm/traps.h>
 #include <asm/vreg.h>
@@ -304,7 +305,18 @@ void do_sysreg(struct cpu_user_regs *regs,
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
@@ -343,6 +355,10 @@ void do_sysreg(struct cpu_user_regs *regs,
             guest_reg_value |= (sysval << ID_AA64PFR0_SVE_SHIFT) & mask;
         }
 
+        guest_reg_value = id_reg_set_gic_field(guest_reg_value,
+                                               ID_AA64PFR0_GIC_SHIFT,
+                                               v->domain);
+
         return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
                                   guest_reg_value);
     }
diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
index 387ce76e7e..24735aaea1 100644
--- a/xen/arch/arm/include/asm/vreg.h
+++ b/xen/arch/arm/include/asm/vreg.h
@@ -9,6 +9,26 @@ typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t *r,
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
+                                               unsigned int shift,
+                                               const struct domain *d)
+{
+    register_t mask = GENMASK(shift + ID_REG_GIC_WIDTH - 1, shift);
+
+    return (val & ~mask) |
+           ((register_t)vgic_id_gic_field(d) << shift);
+}
+
 static inline bool vreg_emulate_cp32(struct cpu_user_regs *regs, union hsr hsr,
                                      vreg_reg_fn_t fn)
 {
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index e7c484f2c1..d6f9326b71 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -12,6 +12,7 @@
 #include <asm/cpufeature.h>
 #include <asm/cpregs.h>
 #include <asm/current.h>
+#include <asm/gic.h>
 #include <asm/regs.h>
 #include <asm/traps.h>
 #include <asm/vreg.h>
@@ -173,6 +174,8 @@ TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
                                   domain_cpuinfo.field.bits[offset]);\
     }
 
+#define ID_PFR1_GIC_SHIFT 28
+
 /* helper to define cases for all registers for one CRm value */
 #define HSR_CPREG32_TID3_CASES(REG)     case HSR_CPREG32(p15,0,c0,REG,0): \
                                         case HSR_CPREG32(p15,0,c0,REG,1): \
@@ -321,7 +324,17 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
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


