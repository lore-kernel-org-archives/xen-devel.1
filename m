Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37870C5DF94
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 04:46:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398680.1634827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyMZT-0001wm-5I; Mon, 24 Aug 2026 04:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398680.1634827; Mon, 24 Aug 2026 04:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyMZT-0001wb-1H; Mon, 24 Aug 2026 04:46:07 +0000
Received: by outflank-mailman (input) for mailman id 1398680;
 Mon, 24 Aug 2026 04:46:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wyMZR-0001wQ-A5
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 04:46:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyMZP-00FJ0b-19
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 06:46:03 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a8bcc6e-bab6-0a2a0a5309dd-0a2a4509e97a-22
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 06:46:00 +0200
Received: from [52.101.125.79]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a8bcc85-be1a-0a2a45090019-34657d4f4956-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 06:45:59 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYYP286MB4363.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:10f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 04:45:55 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 04:45:54 +0000
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
 b=yTbEvEUht2E71Uxt04MXZfX8O/7dbxKwoCRCQIrs8OzeUOaSDzhoDn16IFtjKiokWfpeWijji1JAV6zVVT+JbHYTSbJEwjwbptTqa1d4ufYBEqh3sF3o41yvS5wDNcnssnM3xRQ8zkNPUd77jFmj+dlu79nF8xiQ6xbKNloEhUl/os2Up+bs31duj7gMG6eIf5/ifvZBVGc/WkTKMsy0JERSqG4HjyUI4WZmnBAoRRgttn2kCCy4AQNh88EbjhSGqb/XMmLOe8eRAIrgujpIOX2nnsdviiouvfV4qa8NOCAXkULS2JDTAMqVp8wHMkExKMGRmaLuUkv1a8fpBhhN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNsV9Vmr5QU6JBhaP1i8d8InudzRJvIDKi80RWCWSnY=;
 b=evhg8rE1E0vaWURq/pIW7kE2lKGPiGiQq7nnOEZaEBIZ0QZq+uh9DyGpMtQuuDgJqsl0ZyED+/iRQ7H9i9c3pCSkihoB/ulnLSyCAAel0A3ZmlEHS+AEGeS3cVB1Pg/H66QhxPjdLxfNcLE+eJ5OzzdyaRVe7RaAobWQ0LZR1DizbUoS4yehg+UMitgXHxvj+hnrtHFbDw+wKULp6BFcALehXSuogmgc6FNeWV6MUBhnNl9hRg4F0C3iV3ruijEP0znsjHPTFovBs2YbjDlaJ5SIgq16jmjdhNtjZb9HkKDPWn+33TnqyMz8WaFjZBa/5U9BASDqZKbVLPN35Ba7VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNsV9Vmr5QU6JBhaP1i8d8InudzRJvIDKi80RWCWSnY=;
 b=jwxYQ4UpYRq5pdiAfr+0eQ1IVLkz5q94lpVIDffzZIdq9DJ4icPG68oMCtucVa8p0xXfvLeVbFZMRqQKjlSpMeTYvG1/6+bv0qdOpEt+OFAdWJApdbmP2TkpjHm8ajocYo7OXxxJyxCW6y7OEgHYIyMO7RdHf3ZCupvX3+sBn48=
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
Subject: [PATCH v3] xen/arm: Hide PMU registers from the guest, when the vPMU feature is disabled.
Date: Mon, 24 Aug 2026 13:45:30 +0900
Message-ID: <20260824044530.301938-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:405:379::14) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYYP286MB4363:EE_
X-MS-Office365-Filtering-Correlation-Id: 04305166-0107-4358-fbf3-08df019a94ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|10070799003|10067099003|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	o+Vu3UlKunGCi+fXinBBzjuSetdVZWyZtvZo9Q2qfWrtWCOma64XoQzJc7Ej7f2KsNGHXYMIx3KKsxcDQfR5qaPj3YvVm/GwNumrIxsyNfBvIHjs1I8olrs1dNsr3JVINTbP1H85q0QwawlSsirSoLLnnuMM6gW0j81ZjhQULR9JvkxYAKNPyvim4qhYL2zLoo4tAEw/CsD5+fFcE8pLb5odD0ZL02w2W2XXytHPWPxRJq4rZxfDIp49BaL+5oFtBn1g/h0lEb1apz4pNecKXsw6YkVECnqLSZQnXUh373TI1nSj/KxF+9nuFbTct5nrBMbiy/OnouAMjkoU31Wf1zcWpk01p1eQZUOKJ4wxvdOVDRNdFCneC3bjUvPjSRwUJyEUSSzzSznptcD8mmHEAn8Py4nmkzoNjxgBeUlBCJG2GBONnyf2mfsJCnb0Md3HUO/i2NxVfD4N8egwSx+7/Y4NYl1yB+Oq+LRVwO2bTlENfjnf0wn5z9eb1HKJo1xVBwRZnWg18R/fJqtvuLR9W4X/JdlnDI3zd0gZ+Y83vuagLwTueZCm0PpK05IeOjvRBLl5JjUiOasighvwbfgDTqwmdNDJMxeoHQDlkMQ6rRDrOf1LVMRnL/AUND4L1ywMFvdv9MqmmTF2O5YChlxBjVcqCpiU27EkTUhkwpJ4e+4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(10070799003)(10067099003)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D9lpxebitr0/0XeXrkQ8D3TW6nefWHkLpFjNvgR5nGRCVWsw2MZfWZ/E/Z1W?=
 =?us-ascii?Q?5QgZqH19zNbfdcdIrfOaNq3Zvjxo95O/8hw/71Q/HgVZnxA4fo+j0SMloUWJ?=
 =?us-ascii?Q?LSE1LKdce/awHo/o23VolxW64OkPS+k1LssorHasOgJnWzoHk77iA+qPOP6G?=
 =?us-ascii?Q?+nz8hCBIO52WIDgWrvb4xw/ef05hMMx3bkqQPAOjw9sYutV0YzPlE+qydY9E?=
 =?us-ascii?Q?mKBjTwBCo9GoDd09LFcLJURKH8Wk7Es2wwoze9GC722eVk+ETrHXWkHL8maR?=
 =?us-ascii?Q?pseYuWQCiJCkI//2R4qUb/8GY0gKFyqfx3BPC0Xb63s1GsP5KHhrJMww8yyp?=
 =?us-ascii?Q?CmQKUZzJidbo+ZNG5SxR70iobtUbWpgGhJfulyZH821C5nToS6zmxYrkrVz9?=
 =?us-ascii?Q?d1b0kfRB3LLjRgcg5yfIatHgy5bYPryoFzt5G7ATzedBp5wcucKtdcWgjB0V?=
 =?us-ascii?Q?sI8YLc2apm+A2IchYZbAQSjTJ+IE5fDPv3GJs2fQwttBsiCbThYOJ2KhXzo/?=
 =?us-ascii?Q?OofsnyZ6xxoDBub0SCWaf0JE7MyygyUE6lO4Aj4jkY70p798BLMEUWng+mTg?=
 =?us-ascii?Q?o/37iaflcI35lgHBk8gpmWaL1fyljfersp5H8i85dawBqHI2KpVGT8G53LQm?=
 =?us-ascii?Q?VG6Ujz2akDPguqeRloWboQOIvvnxqyJkrPfKdPmJLMS2sRQAkuayAN9ywD5h?=
 =?us-ascii?Q?bTA2cnbYQVaVHgeNaBwZ4dpCzqTs+BMKxpP8pwp/unYbR0ewFonYytWS4KSa?=
 =?us-ascii?Q?09LlFHYuWTyGEdAQAVoutdHR5RKk3H9CRFAykyfwP0nI3hPxPSfP5kNVaKu4?=
 =?us-ascii?Q?p6cmwid2f1fgkNMV3lH0yoPFpCt6WWxqot6HRpwqHzsBtRygcDDiQ2t8RmJ2?=
 =?us-ascii?Q?VFuTu+ZP7cGeKVdvK606mWjsjNtS4F/d4xvhZ9GDBi0oiRNbkkMmCZVoESlY?=
 =?us-ascii?Q?dSaGOuedT2zu00enXNELwjBRmD3uErsvjC8kb4CviNdyJvKT8EEgbB47ydh0?=
 =?us-ascii?Q?2VK3Uihz/iic7i/eVo/F/Vx5b0Oy91KH3fx3qnRrZUCXc+60DT2VIRsoRjZu?=
 =?us-ascii?Q?13SLYRMH3KhvEweyu+gaVSche8gCckSgwrmHhp3ZCkjFEc9XIG+iNetIDCx1?=
 =?us-ascii?Q?8jaWLPlN+hZfm4TgBj0LJ9VRFD76k46sZvr9k618zYHu1Ow28Cs6B4ikABA+?=
 =?us-ascii?Q?RIHHu0ev+aFziI2nrI5+YkVmVIp14xtxjQoKfc2RGGiEqv6n9D0Sfpv7JM/d?=
 =?us-ascii?Q?WTwsghLxWDarc73K9A394FBgoXh4ki3+Q+LzHRmDH2pDDveNOhzOU2n7uldi?=
 =?us-ascii?Q?YQGGLYn1mAv5ZTbkn0ffpHRJsuPhlkf80peVwfFdqu6UT4OFy1b1oa5B18qI?=
 =?us-ascii?Q?16QKTXPcxFiZrp6kW5t4u8oFKS8u0B2P/R8RgurKLUzW04pDYV/QUnX6pJGy?=
 =?us-ascii?Q?LsIleDRSeeCX7Brk4CrU6yScpTDcshFXmZjArKLhajhauP6nceHY+UyKtok9?=
 =?us-ascii?Q?4xXWGXQJ6LKrOCzip3uoaoE9QxVTfYjLfv3ok7czKNiRvWMZdcwy4TmmhItZ?=
 =?us-ascii?Q?BkrxQ+OfiBwlXMMXAa4QYg6xjfydKbsP8sjkSOvRbrCLByHPtxOrB2PeZM48?=
 =?us-ascii?Q?JP1UJ97xOy38C1NGUkDigKv1adevdJUiryeaZwb5w7quAVwG3/tVGG1tTJNn?=
 =?us-ascii?Q?0T9/IU214Xqt5hTFu29ZdGBgasmeVhuIYdhA8dAqAvuskzygbYv9F8xvXQOE?=
 =?us-ascii?Q?FibmCABz9tqMONhaNF8ccTxrc5lHqbX3HoG2xbR0w4XPfsmj89uae7iloLdN?=
X-MS-Exchange-AntiSpam-MessageData-1: Fet2HLd2qWD2jw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 04305166-0107-4358-fbf3-08df019a94ea
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 04:45:54.7298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOBEvTsCxCuL3DeUj2WspNYBRB099EQBiyz8OPNIxB2/9MnVXiNvRWqr3MqLGMbGiP/aJX17GJ/iWrijifbDlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4363
X-purgate-ID: tlsNG-bad1c0/1787546760-3BED6034-5F20EA84/0/0
X-purgate-type: clean
X-purgate-size: 12645

On ARMv8.4-A and newer platforms, booting Dom0 Linux with ACPI enabled
causes the domain to probe advanced PMU feature based on system ID
register ID_AA64DFR0_EL1. During this probe, Linux accesses PMMIR_EL1,
which causes unhandled register traps and crashes the domain.

To address this issue, implement the following:

- Add emulation for ID_AA64DFR{0,1}_EL1, ID_DFR{0,1}_EL1 and
  ID_DFR{0,1} register accesses for guest domains.
- Hide PMU registers from a guest domain when its vPMU feature is
  disabled.
- Proactively make SPE, TRBE, BRBE, Trace Extensions and ITE
  inaccessible to arm64 guest domains and hide TraceFilt, MMapTrc
  and CopTrc to arm32 guest domains, as they could potentially cause
  similar issues.

Fixes: dbb948110a0e ("xen: Expose the PMU to the guests")
Fixes: 07b9acea116e ("xen/arm: Add handler for ID registers on arm64")
Fixes: 3669a1cb9598 ("xen/arm: create a cpuinfo structure for guest")
Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
Changes in v3:
 * Mask PMU-related fields in ID_AA64DFR1_EL1 and ID_DFR1 when a guest
   domain lacks the vPMU feature.
 * Add emulation for AArch32 PMMIR register accesses performed by
   32-bit guest domains without the vPMU feature.
 * Code cleanups.

Note: The combination of AArch32 EL1 and PMUv3 could not be verified,
      as no real ARM CPU implements both while the Arm Architecture
      Reference Manual for A-profile architecture allows it.


 xen/arch/arm/arm64/vsysreg.c          | 74 +++++++++++++++++++++++++--
 xen/arch/arm/cpufeature.c             | 14 +++++
 xen/arch/arm/domain.c                 |  2 +-
 xen/arch/arm/include/asm/arm64/hsr.h  |  1 +
 xen/arch/arm/include/asm/cpregs.h     |  1 +
 xen/arch/arm/include/asm/cpufeature.h | 27 +++++++---
 xen/arch/arm/vcpreg.c                 | 33 +++++++++++-
 xen/include/xen/sched.h               |  5 ++
 8 files changed, 143 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index d9e3619dfb..1d1f7b0631 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -227,6 +227,11 @@ void do_sysreg(struct cpu_user_regs *regs,
      */
     case HSR_SYSREG_PMINTENSET_EL1:
     case HSR_SYSREG_PMINTENCLR_EL1:
+    case HSR_SYSREG_PMMIR_EL1:
+        /*
+         * Accessible from EL1 only, but if EL0 trap happens handle as
+         * undef.
+         */
         return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
     case HSR_SYSREG_PMUSERENR_EL0:
         /* RO at EL0. RAZ/WI at EL1 */
@@ -300,8 +305,36 @@ void do_sysreg(struct cpu_user_regs *regs,
     GENERATE_TID3_INFO(ID_PFR0_EL1, pfr32, 0)
     GENERATE_TID3_INFO(ID_PFR1_EL1, pfr32, 1)
     GENERATE_TID3_INFO(ID_PFR2_EL1, pfr32, 2)
-    GENERATE_TID3_INFO(ID_DFR0_EL1, dbg32, 0)
-    GENERATE_TID3_INFO(ID_DFR1_EL1, dbg32, 1)
+
+    case HSR_SYSREG_ID_DFR0_EL1:
+    {
+        struct domain *d = v->domain;
+        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
+
+        if ( !is_vpmu_domain(d) )
+        {
+            info_dbg32.perfmon = 0;
+        }
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  info_dbg32.bits[0]);
+    }
+
+    case HSR_SYSREG_ID_DFR1_EL1:
+    {
+        struct domain *d = v->domain;
+        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
+
+        if ( !is_vpmu_domain(d) )
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
@@ -342,8 +375,41 @@ void do_sysreg(struct cpu_user_regs *regs,
     }
 
     GENERATE_TID3_INFO(ID_AA64PFR1_EL1, pfr64, 1)
-    GENERATE_TID3_INFO(ID_AA64DFR0_EL1, dbg64, 0)
-    GENERATE_TID3_INFO(ID_AA64DFR1_EL1, dbg64, 1)
+
+    case HSR_SYSREG_ID_AA64DFR0_EL1:
+    {
+        struct domain *d = v->domain;
+        union cpuinfo_dbg64 info_dbg64 = domain_cpuinfo.dbg64;
+
+        if ( !is_vpmu_domain(d) )
+        {
+            info_dbg64.pmu_ver = 0;
+            info_dbg64.pmss = 0;
+            info_dbg64.mtpmu = 0;
+        }
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  info_dbg64.bits[0]);
+    }
+
+    case HSR_SYSREG_ID_AA64DFR1_EL1:
+    {
+        struct domain *d = v->domain;
+        union cpuinfo_dbg64 info_dbg64 = domain_cpuinfo.dbg64;
+
+        if ( !is_vpmu_domain(d) )
+        {
+            info_dbg64.syspmuid = 0;
+            info_dbg64.spmu = 0;
+            info_dbg64.pmicntr = 0;
+            info_dbg64.ebep = 0;
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
index 94d14fb6a9..05f4d0f5df 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -219,8 +219,22 @@ static int __init create_domain_cpuinfo(void)
     domain_cpuinfo.isa64.api = 0;
     domain_cpuinfo.isa64.gpa = 0;
     domain_cpuinfo.isa64.gpi = 0;
+
+    /* Hide SPE, TRBE, BRBE, Trace Extensions and ITE */
+    domain_cpuinfo.dbg64.trace_ver = 0;
+    domain_cpuinfo.dbg64.pms_ver = 0;
+    domain_cpuinfo.dbg64.trace_filt = 0;
+    domain_cpuinfo.dbg64.trace_buffer = 0;
+    domain_cpuinfo.dbg64.ext_trc_buff = 0;
+    domain_cpuinfo.dbg64.brbe = 0;
+    domain_cpuinfo.dbg64.ite = 0;
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
index a7503a190f..e03218b51e 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -246,6 +246,7 @@
 #define PMINTENSET      p15,0,c9,c14,1  /* Perf. Mon. Interrupt Enable Set Register */
 #define PMINTENCLR      p15,0,c9,c14,2  /* Perf. Mon. Interrupt Enable Clear Register */
 #define PMOVSSET        p15,0,c9,c14,3  /* Perf. Mon. Overflow Flag Status Set register */
+#define PMMIR           p15,0,c9,c14,6  /* Perf. Mon. Performance Monitors Machine Identification Register */
 
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
index 3205c7df46..a660cb0734 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -305,6 +305,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
     case HSR_CPREG32(PMXEVTYPER):
     case HSR_CPREG32(PMXEVCNTR):
     case HSR_CPREG32(PMOVSSET):
+    case HSR_CPREG32(PMMIR):
         /*
          * Accessible at EL0 only if PMUSERENR_EL0.EN is set. We
          * emulate that register as 0 above.
@@ -320,8 +321,36 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
     GENERATE_TID3_INFO(ID_PFR0, pfr32, 0)
     GENERATE_TID3_INFO(ID_PFR1, pfr32, 1)
     GENERATE_TID3_INFO(ID_PFR2, pfr32, 2)
-    GENERATE_TID3_INFO(ID_DFR0, dbg32, 0)
-    GENERATE_TID3_INFO(ID_DFR1, dbg32, 1)
+
+    case HSR_CPREG32(ID_DFR0):
+    {
+        struct domain *d = v->domain;
+        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
+
+        if ( !is_vpmu_domain(d) )
+        {
+            info_dbg32.perfmon = 0;
+        }
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
+                                  info_dbg32.bits[0]);
+    }
+
+    case HSR_CPREG32(ID_DFR1):
+    {
+        struct domain *d = v->domain;
+        union cpuinfo_dbg32 info_dbg32 = domain_cpuinfo.dbg32;
+
+        if ( !is_vpmu_domain(d) )
+        {
+            info_dbg32.mtpmu = 0;
+            info_dbg32.hpmn0 = 0;
+        }
+
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 1,
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


