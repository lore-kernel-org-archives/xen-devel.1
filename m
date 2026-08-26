Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C408C61DBE
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 10:56:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399794.1635770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzBIy-000160-8E; Wed, 26 Aug 2026 10:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399794.1635770; Wed, 26 Aug 2026 10:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzBIy-00015t-4u; Wed, 26 Aug 2026 10:56:28 +0000
Received: by outflank-mailman (input) for mailman id 1399794;
 Wed, 26 Aug 2026 10:56:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wzBIv-00015n-Le
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 10:56:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzBIt-00E9xk-QL
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 12:56:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a8ec656-8faa-0a2a0a5109dd-0a2a4505de3a-6
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 12:56:23 +0200
Received: from [40.107.74.133]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a8ec650-4cb1-0a2a45050019-286b4a85c5f0-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 12:56:18 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB6502.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:416::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 10:56:13 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 10:56:13 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9Ub0eSr9T/nqdh+FlatfnzSA6lEG8w/vWrEZVaZL9RUNOhpCF3D6W3KMe3NH3zo3SnRtpOAp5acTZ2WlpaaBymM2O6IiJ/nX87nNsWmMMac+AuP3ZIOU10123EyqaY/wVYq5vm5egln3554FOkbCEGmSsip9i5aMkt2X9jRj5+OaajMywOhw3WmuFxEyozGy4YSOIyBsoDlKcpFNyPi3i1PDbP6m2rWDB+76LRN3EBMyzZV2RL5DYt0X0g4/4HaBOJInmY31wwwjINP50vxOhpZEmPvcTPrB3oEtdsBmH3HBjYlA1yveorWLpIdy9H1lrV4ojpegKJkCxbKptgdog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BV5ymcB0KmD5GHTclbU2cH18oLhvNxYW2OZLODsz5Y=;
 b=czZOjEul0XTDWW6846wQN4eY2gNBJ/soamIMUTSl3VnCFFoAbiLbJ2Ujn+6P4NxWFZrSnm7YVzO/1nCnv4LAnjZ8xWyEgkku/QaEnlX1F3Fl4WRpNxW27IEkEH5FezNipGoQypADfQV2dsB69rkb+pxxcl6/eJ8BwOIo4i3/15nz6Im8E4owc2J0SZiqeB0iAVD3kFWr1/OoXF1L/A+mjTNnKNu/i3IyqFL3DeTtgB2V6+M6mFpaOE61nbC9srnttjkqdcRwwJPqtWQAiAyGcQwTziNiCeiwbQQU1XMCCFKRNwmezPd0CJMTi1XVm+d2uCGArKSu8crTP1S/L0rd6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BV5ymcB0KmD5GHTclbU2cH18oLhvNxYW2OZLODsz5Y=;
 b=shf+YPwBIBLjpex6DDXbbsOcdZezIei9oDnTAPHVCnxSTk91WstCVcDL42AO+ooO9mRDJziB4u3kamwM5xZD2XrAe2R6YlZKivOevJ3kjW51wQ0e/4G1iACXqH8fGpwywRskBs6x8cLN7sh6mIYNAIKq+Opi6q1/+4qVZh9wYzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH v4] xen/arm: Hide PMU registers from the guest, when the vPMU feature is disabled.
Date: Wed, 26 Aug 2026 19:55:28 +0900
Message-ID: <20260826105529.364192-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0344.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::16) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB6502:EE_
X-MS-Office365-Filtering-Correlation-Id: d6fb0f6a-9687-496f-cce7-08df0360a52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|23010399003|18002099003|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	tM6OixdhPstTFNaWVggkdKSjwnoc8wXWYqlISjP4qMjqRECw0JVfLm3DoE9DrGWJrO5q/izLRc6j6x2+doDWNpxTUb6uvI0XMmq3yUYdVCZmfqiqvMkXYTYCvLnyVay/3teTl4L4/rIdcrA3PnfEWHnlHv+yxr5sAqqjwRPpHaiYegUPKzRvfiBLJmcLuy91tDTPdCD9DzGNGpffNSnmKzKJAg0+8dlfawCOsPTkudhdHVhpPhOzRlUigb3JXGlFqtiAK5lKOT4dDhbiL7OPP+hThwvi21YygTdFtBXV/ddPSYg/nGptFwx5xNw5GRIrpI7W29z+RhIaBEmtQs24l3dqHUseVIlKgv+7afJVIeQ8hNcE0P7w4pFHkpJmzJltoYKCJKVvyhvKFwxqC4pyYwWIAyn1C6FxMwrCaI+2L2sKYASsTbdOyLFqGhOUD2ZUuEaQTFEjg63RkvyJ1pUKOE6UCTBvCkExOqM85B9LOLGf7z+d8SMbG4rtlUY1RYneXvihQVw6lHlMqM/i7xW7T6LMCXU9Ar9+eZY9nl99Q+R/uYdt6oLYv8ekOqZB8y5yraDa8Cby7wgd/srX5e1emLDVO75d+lKV5jo3zpIJJsbN+uGZWIHF5I9HY1MczsV8SR9StdQtBAA2sVz3oe14QbxSufIIjxa80v3A9PwmKyU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(23010399003)(18002099003)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JZABnMVykzTke4uSWzutuV6KuP+teO84Oqm7HheqYu5477q9K8bN9YUk9Qwo?=
 =?us-ascii?Q?mTzsMfJIo0SQcQffkLZEU51DAEadrUbnqO2CknBQkPdqiGLhQDLWYF5juptr?=
 =?us-ascii?Q?KkOXIDKIVh2KOPGkQnPNlWc9dAigKZjQr128zihmKO8SP05eyieGwwBCE/ls?=
 =?us-ascii?Q?BY1JVulz7s7EE6RoWJbFB3c9G6yI19bueZFkTvVTNNnLp7x6duhKXyejUL4E?=
 =?us-ascii?Q?lTq6L/WOqQ7eO8h4Wh2/GtdhX+n6XBoVsHfFgd5ouPLs9qcCSNIKUU0QttyT?=
 =?us-ascii?Q?fNySXoDIYvHMh19tv5udsLEMJJpnpE7MqFaIT60MaxrIcU1HT/yN2UYpxXiC?=
 =?us-ascii?Q?myaXznvDlxqWXeWhRBitagPPR0ocgcWN/8kvLjNjaZ2laW7VIyT6YP3sbqXo?=
 =?us-ascii?Q?YWDSUTm12bYopmlr+qkbb+KaYsTVgK5+xL7bboCDlCMX0VX/Sv4d3ETr0UdO?=
 =?us-ascii?Q?Nvv6o/hlHHuVu0YfYWL9gdhhu/zNcOCebK8H9hMrnu1WbXHG1yJmqdm9GZrr?=
 =?us-ascii?Q?SXto8BTm64Hmt7omSO28J3Ko8XNxe5+VyWGhnNKxAqzHGSgwXJT30vN6RcD2?=
 =?us-ascii?Q?0ahOuiCewApuOY6blCI2FCyt0u6BEQL9YYPM3NyIENYDhVTxhVRvu/VqfHVL?=
 =?us-ascii?Q?KUJU+8LGHR2UIF1wvj34Stivs+2HzkAjIgy0yLxLSKpbVjBltNKAOCUVHTWi?=
 =?us-ascii?Q?gbM/ZwDlBn547DsAbEEwSYzxsl5+tv1fW7eep9qnTi0A0/GyBqIaFLu8kLqS?=
 =?us-ascii?Q?thIQlvTcq36IMcfVoB3todkZQknRALIDa7tAHtGa+94mJMtbhyuzbmSkZKtM?=
 =?us-ascii?Q?2PGaY9HRk6LodSqzOYVqLnMMKy6k97JjSnJ8SrBasSIFkHhzSHP5fVD19seH?=
 =?us-ascii?Q?LAnSbD62vqw11KijqxCQ51p4fUa6UOloH7o0r4ncBEF0xic09ZMUdfyhQ43g?=
 =?us-ascii?Q?m8ZTSPhIdlL3DJa81U0b5aJuME6MiOjlytamcL4htIXuxBfyetoTqkoNiuGz?=
 =?us-ascii?Q?8SsItAJ3yYWTEPI4z4xLjZRWK1tl8q1cpA8uXC7d+o33FxvbcZxdAuuIm6Lm?=
 =?us-ascii?Q?qexa4jsUZTgOrKirwrrJFrnEqEydMt2aO9j+5ooYLZmc3A4tIJ+Z3hy+d5M8?=
 =?us-ascii?Q?dH3KBaQFjqv/pNN9g1pjGSUBHkhDMGoQStsCA3mhNqS1pRhUwtu/V+/Ywnrz?=
 =?us-ascii?Q?1F9COy+fXlfGcxOmJft01UXyuhQ2+CijSub41aJ8aGzPsYjhZWeJ/V8pxuAA?=
 =?us-ascii?Q?gCGdGu27IjLpWvl+hID1ION+IBWE+baydIK6R301l2/IqWTwEwLUIsVhZSLr?=
 =?us-ascii?Q?sxDtUTMSNyo3whKw+noAaZNo7Y5xjDIGBA29X4OQoOWM0Gz7mOaK4uGCTTfh?=
 =?us-ascii?Q?hWoXcfg1or2RfHoTjUOLTrQKWY3JWeucThY5/YQ/fg0xMgwO6y/xtqgMH/UV?=
 =?us-ascii?Q?KhiyEziMU82I5FQJPBQaZKZFQbm9HB6JPRMiuHTIHBRZNSlkZTEauRb+4gR3?=
 =?us-ascii?Q?aJrv/7zyvUe2VE+0UwvWvTI6s1Th8/2HkKL7xkMNNh2SfU/dh3yucvoqfGkl?=
 =?us-ascii?Q?j5MLO+9/dh/hX+xEVLorJTfe0FjvFSaTH+9Xk2MRpm3GuRIJEJ+ZW72M4SVc?=
 =?us-ascii?Q?zhsRVozbev3yqX8eu3uXbktPaVXKVZbeapWe/TGbWF/lOrRNCDgl8fwK+ILu?=
 =?us-ascii?Q?PsI3faEt+FboiN/PBA8tZCS4APwi+YmN7/Q4dmJOiFSoz0AOMKXPG41kLDcw?=
 =?us-ascii?Q?asSEskkyQ0+tACA1D5Jnq4wtX1ls2yjh0u/9myQs1TEejvIrrehS973I/LLa?=
X-MS-Exchange-AntiSpam-MessageData-1: 5bOK/sQ7V2TvvA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fb0f6a-9687-496f-cce7-08df0360a52b
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 10:56:13.4200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9qJ9UC5UdKYfgwPj5i8xjG2+A43464u5Aim6eZpTCBVuwHGSIargOBV5gbhCVrJCFG9xSiNfhHbYMnTLsWbOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6502
X-purgate-ID: tlsNG-c201ff/1787741783-72AB72A1-08187B02/0/0
X-purgate-type: clean
X-purgate-size: 12152

On ARMv8.4-A and newer platforms, booting Dom0 Linux with ACPI enabled
causes the domain to probe advanced PMU feature based on system ID
register ID_AA64DFR0_EL1. During this probe, Linux accesses PMMIR_EL1,
which causes unhandled register traps and crashes the domain.

To address this issue, implement the following:

- Add emulation for ID_AA64DFR{0,1}_EL1, ID_DFR{0,1}_EL1 and
  ID_DFR{0,1} register accesses for guest domains.
- Hide PMU registers from a guest domain when its vPMU feature is
  disabled.
- Proactively make SPE, TRBE, BRBE, Trace Extensions, SPMU, ITE and
  EBEP inaccessible to arm64 guest domains and hide TraceFilt,
  MMapTrc and CopTrc to arm32 guest domains, as they could
  potentially cause similar issues.

Fixes: dbb948110a0e ("xen: Expose the PMU to the guests")
Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
Fixes: 3669a1cb9598 ("xen/arm: create a cpuinfo structure for guest")
Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
Changes in v4:
 * Hide FEAT_HPMN0 from guests when the vPMU feature is disabled.
 * Unconditionally hide FEAT_SPMU and FEAT_EBEP from guest domains.
 * Fix arm32 build failure in vcpreg.c.
 * Perform code cleanups and address coding style feedback.

 xen/arch/arm/arm64/vsysreg.c          | 62 +++++++++++++++++++++++++--
 xen/arch/arm/cpufeature.c             | 17 ++++++++
 xen/arch/arm/domain.c                 |  2 +-
 xen/arch/arm/include/asm/arm64/hsr.h  |  1 +
 xen/arch/arm/include/asm/cpregs.h     |  1 +
 xen/arch/arm/include/asm/cpufeature.h | 27 +++++++++---
 xen/arch/arm/vcpreg.c                 | 29 ++++++++++++-
 xen/include/xen/sched.h               |  5 +++
 8 files changed, 130 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index d9e3619dfb..bf612a133d 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -227,6 +227,7 @@ void do_sysreg(struct cpu_user_regs *regs,
      */
     case HSR_SYSREG_PMINTENSET_EL1:
     case HSR_SYSREG_PMINTENCLR_EL1:
+    case HSR_SYSREG_PMMIR_EL1:
         return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
     case HSR_SYSREG_PMUSERENR_EL0:
         /* RO at EL0. RAZ/WI at EL1 */
@@ -300,8 +301,32 @@ void do_sysreg(struct cpu_user_regs *regs,
     GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
     GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
     GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
-    GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
-    GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
+
+    case HSR_SYSREG_ID_DFR0_EL1:
+    {
+        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
+
+        if ( !is_vpmu_domain(v->domain) )
+            info_dbg32.perfmon = 0;
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  info_dbg32.bits[0]);
+    }
+
+    case HSR_SYSREG_ID_DFR1_EL1:
+    {
+        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
+
+        if ( !is_vpmu_domain(v->domain) )
+        {
+            info_dbg32.mtpmu = 0;
+            info_dbg32.hpmn0 = 0;
+        }
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  info_dbg32.bits[1]);
+    }
+
     GENERATE_TID3_INFO(ID_AFR0_EL1, aux32, 0)
     GENERATE_TID3_INFO(ID_MMFR0_EL1, mm32, 0)
     GENERATE_TID3_INFO(ID_MMFR1_EL1, mm32, 1)
@@ -342,8 +367,37 @@ void do_sysreg(struct cpu_user_regs *regs,
     }
 
     GENERATE_TID3_INFO(ID_AA64PFR1_EL1, pfr64, 1)
-    GENERATE_TID3_INFO(ID_AA64DFR0_EL1, dbg64, 0)
-    GENERATE_TID3_INFO(ID_AA64DFR1_EL1, dbg64, 1)
+
+    case HSR_SYSREG_ID_AA64DFR0_EL1:
+    {
+        union cpuinfo_dbg64 info_dbg64 = domain_cpuinfo.dbg64;
+
+        if ( !is_vpmu_domain(v->domain) )
+        {
+            info_dbg64.pmu_ver = 0;
+            info_dbg64.pmss = 0;
+            info_dbg64.mtpmu = 0;
+            info_dbg64.hpmn0 = 0;
+        }
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  info_dbg64.bits[0]);
+    }
+
+    case HSR_SYSREG_ID_AA64DFR1_EL1:
+    {
+        union cpuinfo_dbg64 info_dbg64 = domain_cpuinfo.dbg64;
+
+        if ( !is_vpmu_domain(v->domain) )
+        {
+            info_dbg64.pmicntr = 0;
+            info_dbg64.dpfzs = 0;
+        }
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  info_dbg64.bits[1]);
+    }
+
     GENERATE_TID3_INFO(ID_AA64ISAR0_EL1, isa64, 0)
     GENERATE_TID3_INFO(ID_AA64ISAR1_EL1, isa64, 1)
     GENERATE_TID3_INFO(ID_AA64MMFR0_EL1, mm64, 0)
diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 94d14fb6a9..88478fea46 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -219,8 +219,25 @@ static int __init create_domain_cpuinfo(void)
     domain_cpuinfo.isa64.api = 0;
     domain_cpuinfo.isa64.gpa = 0;
     domain_cpuinfo.isa64.gpi = 0;
+
+    /* Hide SPE, TRBE, BRBE, Trace Extensions, SPMU, ITE and EBEP */
+    domain_cpuinfo.dbg64.trace_ver = 0;
+    domain_cpuinfo.dbg64.pms_ver = 0;
+    domain_cpuinfo.dbg64.trace_filt = 0;
+    domain_cpuinfo.dbg64.trace_buffer = 0;
+    domain_cpuinfo.dbg64.ext_trc_buff = 0;
+    domain_cpuinfo.dbg64.brbe = 0;
+    domain_cpuinfo.dbg64.syspmuid = 0;
+    domain_cpuinfo.dbg64.spmu = 0;
+    domain_cpuinfo.dbg64.ite = 0;
+    domain_cpuinfo.dbg64.ebep = 0;
 #endif
 
+    /* Hide Trace Extensions for AArch32 domain */
+    domain_cpuinfo.dbg32.coptrc = 0;
+    domain_cpuinfo.dbg32.mmaptrc = 0;
+    domain_cpuinfo.dbg32.tracefilt = 0;
+
     /* Hide AMU support */
 #ifdef CONFIG_ARM_64
     domain_cpuinfo.pfr64.amu = 0;
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index baa3a5d708..a739dd157e 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -501,7 +501,7 @@ int arch_vcpu_create(struct vcpu *v)
     v->arch.hcr_el2 = get_default_hcr_flags();
 
     v->arch.mdcr_el2 = HDCR_TDRA | HDCR_TDOSA | HDCR_TDA;
-    if ( !(v->domain->options & XEN_DOMCTL_CDF_vpmu) )
+    if ( !is_vpmu_domain(v->domain) )
         v->arch.mdcr_el2 |= HDCR_TPM | HDCR_TPMCR;
 
     if ( (rc = vcpu_vgic_init(v)) != 0 )
diff --git a/xen/arch/arm/include/asm/arm64/hsr.h b/xen/arch/arm/include/asm/arm64/hsr.h
index 1495ccddea..ed18184cc7 100644
--- a/xen/arch/arm/include/asm/arm64/hsr.h
+++ b/xen/arch/arm/include/asm/arm64/hsr.h
@@ -84,6 +84,7 @@
 #define HSR_SYSREG_FAR_EL1        HSR_SYSREG(3,0,c6, c0,0)
 #define HSR_SYSREG_PMINTENSET_EL1 HSR_SYSREG(3,0,c9,c14,1)
 #define HSR_SYSREG_PMINTENCLR_EL1 HSR_SYSREG(3,0,c9,c14,2)
+#define HSR_SYSREG_PMMIR_EL1      HSR_SYSREG(3,0,c9,c14,6)
 #define HSR_SYSREG_MAIR_EL1       HSR_SYSREG(3,0,c10,c2,0)
 #define HSR_SYSREG_AMAIR_EL1      HSR_SYSREG(3,0,c10,c3,0)
 #define HSR_SYSREG_ICC_SGI1R_EL1  HSR_SYSREG(3,0,c12,c11,5)
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index a7503a190f..3f62b38dc0 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -246,6 +246,7 @@
 #define PMINTENSET      p15,0,c9,c14,1  /* Perf. Mon. Interrupt Enable Set Register */
 #define PMINTENCLR      p15,0,c9,c14,2  /* Perf. Mon. Interrupt Enable Clear Register */
 #define PMOVSSET        p15,0,c9,c14,3  /* Perf. Mon. Overflow Flag Status Set register */
+#define PMMIR           p15,0,c9,c14,6  /* Perf. Mon. Machine Identification Register */
 
 /* CP15 CR10: */
 #define MAIR0           p15,0,c10,c2,0  /* Memory Attribute Indirection Register 0 AKA PRRR */
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index bf902a3970..c554686415 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -208,7 +208,7 @@ struct cpuinfo_arm {
         };
     } pfr64;
 
-    union {
+    union cpuinfo_dbg64 {
         register_t bits[2];
         struct {
             /* DFR0 */
@@ -216,19 +216,31 @@ struct cpuinfo_arm {
             unsigned long trace_ver:4;
             unsigned long pmu_ver:4;
             unsigned long brps:4;
-            unsigned long __res0:4;
+            unsigned long pmss:4;
             unsigned long wrps:4;
             unsigned long __res1:4;
             unsigned long ctx_cmps:4;
             unsigned long pms_ver:4;
             unsigned long double_lock:4;
             unsigned long trace_filt:4;
-            unsigned long __res2:4;
+            unsigned long trace_buffer:4;
             unsigned long mtpmu:4;
-            unsigned long __res3:12;
+            unsigned long brbe:4;
+            unsigned long ext_trc_buff:4;
+            unsigned long hpmn0:4;
 
             /* DFR1 */
-            unsigned long __res4:64;
+            unsigned long syspmuid:8;
+            unsigned long brps1:8;
+            unsigned long wrps1:8;
+            unsigned long ctx_cmps1:8;
+            unsigned long spmu:4;
+            unsigned long pmicntr:4;
+            unsigned long able:4;
+            unsigned long ite:4;
+            unsigned long ebep:4;
+            unsigned long dpfzs:4;
+            unsigned long abl_cmps:8;
         };
     } dbg64;
 
@@ -408,7 +420,7 @@ struct cpuinfo_arm {
         };
     } pfr32;
 
-    union {
+    union cpuinfo_dbg32 {
         register_t bits[2];
         struct {
             /* DFR0 */
@@ -426,7 +438,8 @@ struct cpuinfo_arm {
 
             /* DFR1 */
             unsigned long mtpmu:4;
-            unsigned long __res1:28;
+            unsigned long hpmn0:4;
+            unsigned long __res1:24;
 #ifdef CONFIG_ARM_64
             unsigned long __res2:32;
 #endif
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 3205c7df46..db8909d96e 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -292,6 +292,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
             return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
     case HSR_CPREG32(PMINTENSET):
     case HSR_CPREG32(PMINTENCLR):
+    case HSR_CPREG32(PMMIR):
         return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
     case HSR_CPREG32(PMCR):
     case HSR_CPREG32(PMCNTENSET):
@@ -320,8 +321,32 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
     GENERATE_TID3_INFO(ID_PFR0, pfr32, 0)
     GENERATE_TID3_INFO(ID_PFR1, pfr32, 1)
     GENERATE_TID3_INFO(ID_PFR2, pfr32, 2)
-    GENERATE_TID3_INFO(ID_DFR0, dbg32, 0)
-    GENERATE_TID3_INFO(ID_DFR1, dbg32, 1)
+
+    case HSR_CPREG32(ID_DFR0):
+    {
+        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
+
+        if ( !is_vpmu_domain(v->domain) )
+            info_dbg32.perfmon = 0;
+
+        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1,
+                                  info_dbg32.bits[0]);
+    }
+
+    case HSR_CPREG32(ID_DFR1):
+    {
+        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
+
+        if ( !is_vpmu_domain(v->domain) )
+        {
+            info_dbg32.mtpmu = 0;
+            info_dbg32.hpmn0 = 0;
+        }
+
+        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1,
+                                  info_dbg32.bits[1]);
+    }
+
     GENERATE_TID3_INFO(ID_AFR0, aux32, 0)
     GENERATE_TID3_INFO(ID_MMFR0, mm32, 0)
     GENERATE_TID3_INFO(ID_MMFR1, mm32, 1)
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index eef10c2ea2..e352e2b38e 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1269,6 +1269,11 @@ static always_inline bool is_iommu_enabled(const struct domain *d)
     return evaluate_nospec(d->options & XEN_DOMCTL_CDF_iommu);
 }
 
+static inline bool is_vpmu_domain(const struct domain *d)
+{
+    return d->options & XEN_DOMCTL_CDF_vpmu;
+}
+
 #ifdef CONFIG_MEM_PAGING
 # define mem_paging_enabled(d) vm_event_check_ring((d)->vm_event_paging)
 #else
-- 
2.43.0


