Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D7DC5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 03:30:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389420.1630138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuM8p-00042e-Fz; Thu, 13 Aug 2026 03:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389420.1630138; Thu, 13 Aug 2026 03:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuM8p-00041w-DB; Thu, 13 Aug 2026 03:30:03 +0000
Received: by outflank-mailman (input) for mailman id 1389420;
 Thu, 13 Aug 2026 03:30:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wuM8n-0003id-EH
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 03:30:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuM8m-004vYM-5v
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 05:30:00 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a7d3a37-bab6-0a2a0a5309dd-0a2a450ba816-0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 05:29:59 +0200
Received: from [52.101.228.89]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a7d3a34-b7e8-0a2a450b0019-3465e4595a32-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 05:29:58 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYCP286MB3775.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:38a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 03:29:53 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 03:29:53 +0000
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
 b=FJkNJmBS2FEbY+pOT1gsKau/IabBHdZhJCF9Jytq2xjrXWkJ8k0aSL+VlE52e6lamZ65Bw8VxlVOfRSYpR1uz+l8cieZcMz8492CWPU1WlrexlitVZwnC513iLx+Zr/u5TK/eQDoOOln/1RXrdtyEpy43/6yULtTW32X2DrWqRI23EQuZJ91ZoidZfJ3YnBqD6c817jKVNfLnRJtFNbimxSK25It6qTCiiK/3IBZ0E5X+lRc98m8pC4H5pdEXuG7iOdgD8rBImlS7SBxV5AJ56efzlXMdifr/mjuHd0o8Hgw6MxRlK46KoEZT7xzQr9UrDXOVHFExC4TXjeBwN101Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7WipkpWDrbE7BODlTk0euccFKA1zrmHMzqo5hICcRN0=;
 b=QdaCO/ARd3yvjx/Msg8KT4iMjmVEFHfmnWs8Ey4L/NJJqYgOdTHIc4bQILFQY9SCfqqIkP7cvHrpTSrVV1vzHc8J4dKs39iXSPzrAtyGzs/Q/QmGrXyxAybU86HZjIGUPjzPhkX9x1Rt2qCfRsBi7bNCozS44f9mvUetd00rVy1c2mm4iLn7rl6dLlNXlS9dBroX24IZY+i2U5v//jQEqLVlcqxfVz2OAlSXrgiWltcmudR9nI80vRJ7NQWcsZyT22QzWoeaIq16eHhuDiAcaeiz4My6eLmffSWH4aHJJfk401Kvqt02TtgGFffNJ6WW8K5Lb33ZdSymvzbWutUtrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7WipkpWDrbE7BODlTk0euccFKA1zrmHMzqo5hICcRN0=;
 b=dAllqf0dYdDs23K6o0wrogSnF9ErB8xlVSMBpdvU98F0fcpBIBbRwhLEdD0xs3y42KW4v9tdVruPY/YssdEfqPQXOZs+m3lbRZBPY2ihHenp1UpZTpNHRaTaOlR6zkdYgZUm178y3iGnn8QLY0LvFdGX6RqWg3ll4J5inSvXT7s=
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
Subject: [PATCH v2] xen/arm: Hide PMU registers from the guest, when the vPMU feature is disabled.
Date: Thu, 13 Aug 2026 12:29:38 +0900
Message-ID: <20260813032938.3946-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:405:379::9) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYCP286MB3775:EE_
X-MS-Office365-Filtering-Correlation-Id: b6463876-1a64-4697-6baa-08def8eb2379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10070799003|18002099003|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	cAjUeMAobtXQ7KO2zEbt7uXusQvKMSNmZK/kyjPEWE2sgg4wGHGx8MSkohB20H6fy0i6XYcR2YutGzB4OfRz0zrIu3r+rtlOCj0vnyj0OiXHto8lTFK0dBmcSH1n9gzxS99QBrPNjWpWXi9EKuN8b0K7XTT61Td/0kTchvpjsEtzpKt8ULYNXP7EhMbDCOS4FWP/GFwUsvui6pfCR5KltCkgy4WIDkTSb0t89wc4AwHJJPxjKhsBnFgTBwyV3zahQccV9vz9k0QjsusS4Fg/KiWmO13g5dtxuFm75CszyPkIXnFxShvaLiPRyjr9Ee7+kzncfpcsYeK/hjfYV7dZyX7MEAn1jg+kREhELb4BnS0UMmmOxXYZy+NeYJTJbEplIoLG5gtTbLS3uTJZWJlB4DW7UDbxz4pqset0C0hLMbnnswlgfkP14pJ9ucgUhDVk5ONuKX2iTO13Sv5/05BmKZ9ldumntVAjLcrNiHBXn+T22t8fn8/JLmIhuYBIbkUylcq3GApnDW0TS06LPBYzWCQY29IRUZSXB1SteqM/OqJ5dRUP5wu/fAgoq7cTZqDQW/D5UBSoumcdm9LFR2KhxHr2pnEowRuzc9456HRAu+CRBcV7J0MXuIOBCWLbar5Yda/T1fU7BE9sZFzFi/JObqS0Xl04OTGOWttKgrYvPLA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10070799003)(18002099003)(56012099006)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8zxqoIDSyXobM/DaTz8NjB8JLQ/6kptkp5vlNfTtmoJ071WJOJjq834TT+Gg?=
 =?us-ascii?Q?QOp+hX2ljVL4XERJw3Y0IWZh9WoIFncz/imFpePaZn/khufrELfOMBo72pFn?=
 =?us-ascii?Q?Cve30jxMfIBhWH+iJ9K1XQr2FR/KUTl13k22akcUGQC+lpV+GVdU6+MKSZLK?=
 =?us-ascii?Q?U6gCrZ8r5EzApM2cK5feiqe+H8FZbtpabL1qiyXMgRlL++Au97adtqFTEed4?=
 =?us-ascii?Q?PsdG9lPizxZRBU/jjHXnKxw5n8FkiCD834NoV4UXRxyE90rV049Uk//TQLee?=
 =?us-ascii?Q?ursOWSLa/18fCz5H3+GAksyaHN4CwsLKFGgF7MPHXEsKbQH09fRzXl7mybeX?=
 =?us-ascii?Q?jmlgQHG5y8pwA+Q2UhopEIypXVTx33rqMz60P6VkCMC+uBqwenhX23uqxL74?=
 =?us-ascii?Q?PqwK+6dP7LYTUZ6SYlbdtLbWbgwsWct6Khw3mfjY1oNrWcnuizZ/DeP7XvMq?=
 =?us-ascii?Q?+sPfk5p1xA0+50xfKfTLfs9YunghmdYHArUmkjhB2Q5PL3imzKhvCcBirKaJ?=
 =?us-ascii?Q?LIo4oAQrZDzXGTuzhsd7OiqxEb1iV1flDgRbzZxqh1KGSjzjX1dFKBkeMNx0?=
 =?us-ascii?Q?DaGVKmnxAZfDd6adShXgr70QeLJJrpYFbHEk6qsH+QQ4XPIECp1Twu9+YOLZ?=
 =?us-ascii?Q?WHRUb8FmIaS6J2SQdmk6502mZPR7sNPbG5kQXcCOo8FuOJ1uNAkzNNrZUjqR?=
 =?us-ascii?Q?YHE/JoYpqg8bJ6Icn8QeL6wf3S/TWCkHBb9av+aLubIXsUPkl5A1Svruq23u?=
 =?us-ascii?Q?24KMhqg6QxcKVfJ6JAEVrqup7UGk+AsXNTQoJwzD7ZsakDYcb+InOKXhJnCj?=
 =?us-ascii?Q?gD5ju4q/r8WH+OlXy/GiNR9ngVIMWdhdaregvs5naUI4f4N13ceorPmF8/zW?=
 =?us-ascii?Q?i7LWxyRFU5Ft6B8FAiM23McMG91izXORfxNA6T24ffRA9Y2b39p0kvHFDAzT?=
 =?us-ascii?Q?nVRWktWw+5/Zn369VeYwqLJl5tV+b/TVIB39mqRd95iz/FWasP2r0I4bxkhR?=
 =?us-ascii?Q?gosW5rITwPzIGDaWk0jt0muvGstiUHxNcjplkfxEe9chXRQV86ijVsu5yA69?=
 =?us-ascii?Q?XegVNpWJbZ+6tVxH14z3Eb1LlVdkR/alSb1vYqAwpmYgyczWBvH9npRi+32W?=
 =?us-ascii?Q?i03Luzg4alwyYLqD7NErBtET4HrfNfj4LZSdCRRPZsqeya79UkL6yJwj09f2?=
 =?us-ascii?Q?xF0BLMTttriJrF3P4pECEHFvSWn0ePGtTJVnPGeUYA7wS5vzzPOPuug77TrM?=
 =?us-ascii?Q?d4qj2beSd9kysAKXbRhQcpdqaJhm2IOaPz3xa/b0OxMT8fz0gOp3jdZG8UpU?=
 =?us-ascii?Q?t4MLFgR8fELjBRx3QdkcaEei83TuNuo22skoBlUWhpc7k5jlS/EWRbmRFxAD?=
 =?us-ascii?Q?gjJmyZVdY0bvzcnQxYDGrwT2KxGw5o6RIObve7mgKLeMa7EEN3Z8gR9UCGAG?=
 =?us-ascii?Q?A/BUPsZl9Jawrlb3pUHsrlMDjHaJfmGYRyGmXe47qwmsK1tM0h5B0NqscVb3?=
 =?us-ascii?Q?Wlx9+EhydZM5elfooXnqTVQDXBdyG7u8hUxtQAJMdAYfSVMN4I4wbSWXgMrE?=
 =?us-ascii?Q?ityP2ZIltHS32WqPNzFyKdVkPOMLId86rTk90UZqfW0KJXuW2SDo1DhgfMsA?=
 =?us-ascii?Q?WRjti6kB8slqWddAF4hYeYKlZVsxOVQFBG+vd3Hw8Aerp3tDNG8jnDjhOSu/?=
 =?us-ascii?Q?EGw8VqGGQ9Xmo58g6EeSFJ5n5s+hBbKXu0JCLYxAEF+hRyfiLnKw760VwfQr?=
 =?us-ascii?Q?AP2O4c4wcn1dpMJU/Cx6FmBub4q1DA+dM2Q+16pSCLZI2h/sFX8nid70t6UU?=
X-MS-Exchange-AntiSpam-MessageData-1: gAyiCeuZk45tcQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: b6463876-1a64-4697-6baa-08def8eb2379
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 03:29:53.0454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uX6uBw0NR2a6OkkmhjLSRMuNcQ87y0mHwbPnNlKWz7jE4jJ44ga30gzAbb3mSx12hejB8AiLEx5OIdJKGexA2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3775
X-purgate-ID: tlsNG-42698a/1786591799-1A4DB9EA-25C7BC07/0/0
X-purgate-type: clean
X-purgate-size: 7048

On ARMv8.4-A and newer platforms, booting Dom0 Linux with ACPI enabled
causes the domain to probe advanced PMU feature based on system ID
register ID_AA64DFR0_EL1.During this probe, Linux accesses PMMIR_EL1,
which causes unhandled register traps and crashes the domain.

To address this issue, I implement the following:

- Hide PMU registers from a guest domain when its vPMU feature is
  disabled.
- Proactively make SPE, TRBE, BRBE, and Trace Extensions inaccessible
  to guest domains, as they could potentially cause similar issues.
- Add emulation for PMMIR_EL1 register accesses performed by a guest
  domain when vPMU is enabled. However, similar to reads from other
  PMU registers, the read value returns zero (note that this is a
  temporary implementation).
- Emulation for PMSS (PMU Snapshot) register accesses is not yet
  implemented, because PMSS support is not available in
  qemu-system-aarch64 and could not be verified.

Fixes: 07b9acea116e "xen/arm: Add handler for ID registers on arm64"
Fixes: 3669a1cb9598 "xen/arm: create a cpuinfo structure for guest"
Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
Changes in v2:
 * Instead of unconditionally hiding the PMU feature from guests,
   we now determine whether to expose PMU to a guest domain based on
   its configuration.

 xen/arch/arm/arm64/vsysreg.c          | 31 +++++++++++++++++++++++++--
 xen/arch/arm/cpufeature.c             |  8 +++++++
 xen/arch/arm/include/asm/arm64/hsr.h  |  1 +
 xen/arch/arm/include/asm/cpufeature.h | 14 ++++++------
 4 files changed, 46 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index d14258290f..520faa02ca 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -229,6 +229,7 @@ void do_sysreg(struct cpu_user_regs *regs,
      */
     case HSR_SYSREG_PMINTENSET_EL1:
     case HSR_SYSREG_PMINTENCLR_EL1:
+    case HSR_SYSREG_PMMIR_EL1:
         /*
          * Accessible from EL1 only, but if EL0 trap happens handle as
          * undef.
@@ -306,7 +307,6 @@ void do_sysreg(struct cpu_user_regs *regs,
     GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
     GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
     GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
-    GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
     GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
     GENERATE_TID3_INFO(ID_AFR0_EL1, aux32, 0)
     GENERATE_TID3_INFO(ID_MMFR0_EL1, mm32, 0)
@@ -326,6 +326,18 @@ void do_sysreg(struct cpu_user_regs *regs,
     GENERATE_TID3_INFO(MVFR1_EL1, mvfr, 1)
     GENERATE_TID3_INFO(MVFR2_EL1, mvfr, 2)
 
+    case HSR_SYSREG_ID_DFR0_EL1:
+    {
+        struct domain *d = current->domain;
+        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
+
+        if ( !(d->options & XEN_DOMCTL_CDF_vpmu) )
+            info_dbg32.perfmon = 0;
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  info_dbg32.bits[0]);
+    }
+
     case HSR_SYSREG_ID_AA64PFR0_EL1:
     {
         register_t guest_reg_value = domain_cpuinfo.pfr64.bits[0];
@@ -348,7 +360,6 @@ void do_sysreg(struct cpu_user_regs *regs,
     }
 
     GENERATE_TID3_INFO(ID_AA64PFR1_EL1, pfr64, 1)
-    GENERATE_TID3_INFO(ID_AA64DFR0_EL1, dbg64, 0)
     GENERATE_TID3_INFO(ID_AA64DFR1_EL1, dbg64, 1)
     GENERATE_TID3_INFO(ID_AA64ISAR0_EL1, isa64, 0)
     GENERATE_TID3_INFO(ID_AA64ISAR1_EL1, isa64, 1)
@@ -358,6 +369,22 @@ void do_sysreg(struct cpu_user_regs *regs,
     GENERATE_TID3_INFO(ID_AA64AFR0_EL1, aux64, 0)
     GENERATE_TID3_INFO(ID_AA64AFR1_EL1, aux64, 1)
 
+    case HSR_SYSREG_ID_AA64DFR0_EL1:
+    {
+        struct domain *d = current->domain;
+        union cpuinfo_dbg64 info_dbg64 = domain_cpuinfo.dbg64;
+
+        if ( !(d->options & XEN_DOMCTL_CDF_vpmu) )
+        {
+            info_dbg64.pmu_ver = 0;
+            info_dbg64.mtpmu = 0;
+            info_dbg64.pmss = 0;
+        }
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  info_dbg64.bits[0]);
+    }
+
     case HSR_SYSREG_ID_AA64ZFR0_EL1:
     {
         /*
diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 94d14fb6a9..0e9bf15ca5 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -219,6 +219,14 @@ static int __init create_domain_cpuinfo(void)
     domain_cpuinfo.isa64.api = 0;
     domain_cpuinfo.isa64.gpa = 0;
     domain_cpuinfo.isa64.gpi = 0;
+
+    /* Hide SPE, TRBE, BRBE, and Trace Extensions */
+    domain_cpuinfo.dbg64.pms_ver = 0;
+    domain_cpuinfo.dbg64.trace_ver = 0;
+    domain_cpuinfo.dbg64.trace_filt = 0;
+    domain_cpuinfo.dbg64.trace_buffer = 0;
+    domain_cpuinfo.dbg64.ext_trc_buff = 0;
+    domain_cpuinfo.dbg64.brbe = 0;
 #endif
 
     /* Hide AMU support */
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
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index bf902a3970..ce8b58458f 100644
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
@@ -408,7 +410,7 @@ struct cpuinfo_arm {
         };
     } pfr32;
 
-    union {
+    union cpuinfo_dbg32 {
         register_t bits[2];
         struct {
             /* DFR0 */
-- 
2.43.0


