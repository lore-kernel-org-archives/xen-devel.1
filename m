Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B42C55174
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 00:44:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381047.1624628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqgmM-0003qU-V6; Mon, 03 Aug 2026 00:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381047.1624628; Mon, 03 Aug 2026 00:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqgmM-0003qN-SH; Mon, 03 Aug 2026 00:43:42 +0000
Received: by outflank-mailman (input) for mailman id 1381047;
 Mon, 03 Aug 2026 00:43:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wqgmJ-0003ot-Ob
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 00:43:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqgmI-005yV6-J9
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 02:43:38 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6fe3ef-5cb7-0a2a0a5109dd-0a2a4503c442-20
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 02:43:37 +0200
Received: from [52.101.229.77]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a6fe435-fae8-0a2a45030019-3465e54d30cb-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 02:43:36 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB6832.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 00:43:30 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 00:43:30 +0000
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
 b=rA9hT+sa4szRgERS2SV9xt8KlQK4HrAtCc12HvBmBsd+xR1ziyBGdy5+juifdkwoC/rn8d7sNz3sLiePjoC+mDo+gDhr6sLeL3mqRhYuv0c8+KwtUbFV5vD8LW41ZbOpXAsIo1yO8x35X2m4kcKUiMzEfuaFixET8hivp0+G9AGsZXVHUbiCCXQwrpVzFkg0t9BrVfKxxXoolggyBzbeNILXtMGw3l+b9MT5uh7fVs8xkC+OgS+Ytx7xtUN1Ku1mDW217AcBF2quRhZRAlZGrH8yExXDpXcRyS8ml/3grW6o6COno6jmo51YrHSDhShEHDItuUrlv7XkIo2opa/JWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvw2bZDRO4ch9uDZj3X9HF2N3NA+5bsuvObC4KDg1bg=;
 b=OyaU3Idm/mIEq8WjM7GGtuFtkSqMx38BRcMowGSYXY71wp0yOmA8+dWXgHKkiv3FYF71WalwGslaWYhMx+EZ56wVM5pPZ5wHVKa3pN2JxLWD7nIe/SabsZeCrAr9CJO2df7c4gEiIW9MxKlVifu3xDRKRyFtb9MsAoCuuqBIzVB0gvl5kA5NEbXIP1z7/JjJp2tdGOKust5FwZoZbz0Fun1dPXKzOe7LcAy01+IjWG3IGBI73ht8we5O4Rp7vuXxgf5GctFVB3RPWgGaafuvLEjkfGpy5z8YOh0mzP2nFBm+Tlv3YpeRyanjBr9V+yEzi/DtmGeW+3g5AWWvOpKdLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvw2bZDRO4ch9uDZj3X9HF2N3NA+5bsuvObC4KDg1bg=;
 b=fMOdVn+7tR9FGFOg918I/2afUpjc9XopkmsicTAgSnw1sh6dZQrgjvR9q3aU8jfDGrUNLS5eiDu8re6SmO4a25XKGGZaytopZjJ58Z64zxOixq8bOxqSs5Mz+KjHZYQQ2xLqONyxHz7IhiT7fz3AzeiyR9w7eo9TjuOUjoi39io=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Hide PMU feature
Date: Mon,  3 Aug 2026 09:42:45 +0900
Message-ID: <20260803004245.693844-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0088.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::16) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY4P286MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb177a8-fa86-4813-bddb-08def0f83ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10070799003|6133799003|56012099006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	T1GUEAOioOQ92ui6AMagEoTbboKNSNDbtEH8F/93oLwArBS8b4hicyNl/yizmOHyekSn/cuSJCQ+RMmhjS6RiZmxuFobYIED3P0sGzXyvobOsrSiCt+mgLYfGOQ0PE+90nEWNrTAAF1eS6SGfjKWvAUKF+RnBUvZAQG7uT9sIG8uuDNi7yY8dTdhVfVITzVU8EE3ka2pPcan1YeCuB1Ndy2D08uughljFtNUPCQwmtiSWlElv+siU/AwpnUyiwh2Nz8P7vklVHzY5mGXfJS2f0wZx5YNZZcxkWjCbnbT1u6GY/2wteWfR2oKc57NwwIj66sJafnW5PE8SA1h7colV/AMTBX3de2jZ+1n+6Fdd20BIP4+pZE9Enq/pIaCLTglpv58Qhv2v0LDWBQZGkoEugOMmQhSUiuZj+PPPJIoY0MV8S00LbHWI2BjEZa9WAL8XyfDfBHTxK9gVAv0I28WHOdGeUe5RWE6unOkXaZ7NTrAxacEKNzWX6CEVL4IgqhYcKtj6D6kTCLjk3L7KyzMUjPirh0F/YKZaokuO/Zq5vG/fWzdEn+pkibesCt7XRpJ2zX2vDt8n2svBiDJPzbVk8GSf6W9vKPx66OkRgIdkBWqlMXsKwJT+Emr+a3qGwJz7f7dhNGiT8r9kpfnxrtN7i0j7tg0WSMknrv95iM/sQk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10070799003)(6133799003)(56012099006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UhLnIU58IMMx34DuAEHo6WrkDvlLgpd30l0emMyayayhCx6u9O+BbHlbB4KU?=
 =?us-ascii?Q?WqYxxr73TU3HKhGdXXdjFtasOkGZ2pYGQRusUWatgwBkwWjE7lG9Xo/mpdnX?=
 =?us-ascii?Q?kBXpQ22mdTfKdrrg6Go0xRsUDs3QYWSE8Pgtc0Zny+tHznnqiuYwLPXC/Tgr?=
 =?us-ascii?Q?2vM4GkM19xX7tO3Xo9nllXq9yn0++EN0taLWikliwetVg76aRj5UIZTNV2tq?=
 =?us-ascii?Q?ysPCa9EATIkQ8T5e//2Hn+zo3QnhsHaSpxF/tML0mpTLsicM+bcdIzEu8HuA?=
 =?us-ascii?Q?aiB3O9xCCEhZNg3LkgemmcoqXGaGHkh8wxurlmsgvaNkrAa5QOSyde3YE/p0?=
 =?us-ascii?Q?mu2kH/gJcWgV2eiWFoPi+fIOEsUEHV6FGNSxx+aPuoubaqQGBT6MXcPtlOOB?=
 =?us-ascii?Q?7TpP1dFygU1Ndgbgv/6zfhJsOfLDqjrqiayu3vFktvaMvWsW1/ZCk6Wyd7SO?=
 =?us-ascii?Q?QWrtr3Zl5cHjq7HrERBvlvE97xyv/quZH5FxJSGWRStexkMI3bBSSWtQALmy?=
 =?us-ascii?Q?nq61COAKDqnOYyBK1Ga1lmHnizmGOCM2QhDwZlPDIk7sw8nai9mTmXWxy+zF?=
 =?us-ascii?Q?Qt+64WGRuUrHw9xk7Nh09KgYQDoC1LV+H0XUWmNDPy+hbsRA5+yj1KGPJ90j?=
 =?us-ascii?Q?CWn6JUCy7HTq7weMcWkGh5JzuyuQHLn1P/5Xm233qe2tBWtKXmklH424UFPt?=
 =?us-ascii?Q?1talkQyfqWSrwSQFwOLraBI1ugS0WYZt6AD5X0SlAtpUK8hFNsDu1rJWLRmf?=
 =?us-ascii?Q?D4HC27U3r5RLDZHTGulXX9I2BpvS8e/x0QGeorwa71WO6DX+V8ZyrwXMudPY?=
 =?us-ascii?Q?AcZo0M6RnvcVJrv7L+w/C9zAJx7Rh7CtejnLxJIHg9DJWVVVmb8u2FAcmAyp?=
 =?us-ascii?Q?T05C2WWNTxx5y1mpWTtlvyJ2zw+IIsIZjTlOq61Hh1YAWRNPggn16yZQnN4O?=
 =?us-ascii?Q?RlQu1nsYPnsIVVTcj0DuXV7qBL8NX6G9jDGUIYqpjyGdjts9/UgFV+Y5Fq1K?=
 =?us-ascii?Q?UBQJzDk+0JQw+/ZO329gb5Uc6hSAml2hsAVAIfbYEdWssLx/HCCshMMft8GL?=
 =?us-ascii?Q?Ek0MN31bw6exGx3/hFxfsq1JKpkzMo9T99Xuq5DZSA9VcZRN0xg0YhE3HGOp?=
 =?us-ascii?Q?urtbCztm5P9+qxZbwx86L/9daBvqTeQwPaiSJwn3gXxiaJ2ykIlrQcQpYaOS?=
 =?us-ascii?Q?biCEgpluiIlk70OrdXWUOpkdVYk3q9ggU2D3EfXt/H2Uf+5QgAR6rgfeNC0S?=
 =?us-ascii?Q?kdCQAIN0gKwCxkctA+7yDxfN77QxrUDIZjVThsMMrmrYu2GCMWAD+vX1BS4Q?=
 =?us-ascii?Q?AkD/hgY+XkgvwzXA07Pp9hd9ipbNPceGQIXkkGWW4Bz57eIhac6neBT5gVe+?=
 =?us-ascii?Q?Msm/wLv5t2jgO/uyE20lMfgTLF+iLFqHhj+SajhTTwyUYpr6AclIX/vs3FAQ?=
 =?us-ascii?Q?OIHKX2pTXt68QNgBe7oW/nAWI0aVv/KTr5WDQjF9xt6SIPSUVM8IM2xMQ7AH?=
 =?us-ascii?Q?fUBJIF11G70MtgAANSMUL+JtTPdA4KUHuegJ49I9KOAWrFcB2XtddrnBdYSe?=
 =?us-ascii?Q?LPe9GOuExarVrZQPrEsiathAWUAO+Amvk8y2LHxePi1ud005mzjhsKauesug?=
 =?us-ascii?Q?58E1xueE4jNv4aQwfxrSyZpN0zvKfSrfyg0CgR0dfVuqRivGijwykdqnKAae?=
 =?us-ascii?Q?4fKARNmzCGtXsi0xFtagQj9uEq9sLMxcetEdpcvv5/yWsEcLo9Ehlp5FdAIW?=
 =?us-ascii?Q?hHOYEvC5jMdBgeA1YufaiPFIf7jq8LlJogUPG9iSPuArBXpVpyEwc3ABib2h?=
X-MS-Exchange-AntiSpam-MessageData-1: b2bE5gGc3lAy5A==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb177a8-fa86-4813-bddb-08def0f83ce4
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 00:43:30.0171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOdmSPcxDyK0PnSaP+QFHQPocYBGPNVA6OVABotbqZlWQNI/KVED28E4U4sWbuwegml4kw2+bY4AzswB+flOfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6832
X-purgate-ID: tlsNG-33051d/1785717817-762FD4E9-C3C8A53F/0/0
X-purgate-type: clean
X-purgate-size: 3049

On ARMv8.4-A and newer platforms, booting Dom0 Linux with ACPI enabled
causes the domain to probe advanced PMU feature based on system ID
register ID_AA64DFR0_EL1.

During this probe, Linux accesses PMMIR_EL1, which causes unhandled
register traps and crashes the domain. Merely adding emulation code
for PMMIR_EL1 in Xen is insufficient to fix the issue, as the guest
PMU driver subsequently stalls during its initialization sequence.

Fix this by explicitly masking PMU capability fields in
create_domain_cpuinfo(). Additionally, preemptively mask other
capability fields to prevent similar potential issues.

Fixes: 3669a1cb9598 "xen/arm: create a cpuinfo structure for guest"
Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/cpufeature.c             | 16 ++++++++++++++++
 xen/arch/arm/include/asm/cpufeature.h | 10 ++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 94d14fb6a9..71d745d3cb 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -219,8 +219,24 @@ static int __init create_domain_cpuinfo(void)
     domain_cpuinfo.isa64.api = 0;
     domain_cpuinfo.isa64.gpa = 0;
     domain_cpuinfo.isa64.gpi = 0;
+
+    /* Hide PMUv3 support as Xen does not support it */
+    domain_cpuinfo.dbg64.pmu_ver = 0;
+    domain_cpuinfo.dbg64.mtpmu = 0;
+    domain_cpuinfo.dbg64.pmss = 0;
+
+    /* Hide SPE, TRBE, BRBE, and Trace Extensions */
+    domain_cpuinfo.dbg64.pms_ver = 0;
+    domain_cpuinfo.dbg64.trace_ver = 0;
+    domain_cpuinfo.dbg64.trace_filt = 0;
+    domain_cpuinfo.dbg64.trace_buffer = 0;
+    domain_cpuinfo.dbg64.ext_trc_buff = 0;
+    domain_cpuinfo.dbg64.brbe = 0;
 #endif
 
+    /* Hide PMUv1,v2 support as Xen does not support it */
+    domain_cpuinfo.dbg32.perfmon = 0;
+
     /* Hide AMU support */
 #ifdef CONFIG_ARM_64
     domain_cpuinfo.pfr64.amu = 0;
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index bf902a3970..c92b2651c7 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -216,16 +216,18 @@ struct cpuinfo_arm {
             unsigned long trace_ver:4;
             unsigned long pmu_ver:4;
             unsigned long brps:4;
-            unsigned long __res0:4;
+            unsigned long pmss:4;
             unsigned long wrps:4;
-            unsigned long __res1:4;
+            unsigned long sebep:4;
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
             unsigned long __res4:64;
-- 
2.43.0


