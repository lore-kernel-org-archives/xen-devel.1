Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065A360A263A
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 05:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=sfBMvj9H
Received: from list by lists.xenproject.org with outflank-mailman.1480652.1684432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQeUq-0001qU-IW; Tue, 10 Nov 2026 05:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480652.1684432; Tue, 10 Nov 2026 05:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQeUq-0001qL-FS; Tue, 10 Nov 2026 05:34:16 +0000
Received: by outflank-mailman (input) for mailman id 1480652;
 Tue, 10 Nov 2026 05:34:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <nishimura@valinux.co.jp>) id 1xQeUp-0001pb-ER
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 05:34:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQeUo-004jDx-RY
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 06:34:14 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6af2acae-e002-0a2a0a5209dd-0a2a45088a08-48
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 06:34:14 +0100
Received: from [40.107.74.134]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <nishimura@valinux.co.jp>)
 id 6af2acd4-f659-0a2a45080019-286b4a86a733-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 06:34:14 +0100
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:15b::9)
 by OSZP286MB1798.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:34:11 +0000
Received: from TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147]) by TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 ([fe80::1150:c5cb:d781:8147%5]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:34:11 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwiTp7UUAobgDgg1JzKbMAFlFNIwYlRX2+MLrcupKrFjcIGVU7juwRPRboBXS0EL0ubHRPP3Ec25s0A3FXZKnGKXjXtgK0+nozVOfLFWxJtxKWq+ZqM4nbRurwv9Zve/FgSkCUVzX2pMjnL5dOFlbbHH+ruZkk1BukTQat2UVgYExGBVt+Sv8wlaa9hC1GAvPI/NB7dagAcm0l2tHWZVUShJUD6LXfuz4gylua71ECsR6fvwwXTmze/Br4+oI3GJunZyhTCtdQZu0aFhedlvQRimjR5Ag2xylWV1m1y69cTdk5ovfejOSL7//RdlLCsoQEX+wYD8bfvvT6ZqBHtNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3V8l/mNWRz2YJFIRXoVS8SRruajOHQneJcfEo6dcAM=;
 b=PKa121g/OteZJL5Cl9wsvwccSHiYu+I0uwdl20XHytDGF/5Hezeqgs2UPW6W+75xtKpphR2ZBA55mooXtM+0qIPbpPlgMYIKhuPOAvqp3U82RDgj3AKNHZrmf+9keT17f78pKwNXfKwof14s5EtHuF/OScNddTBsRt/XUq/zS1QVZiGdnEbG1YsWaaNG/gbbIuhZeiPK4FKkBF2+Tgnm7ICVokjee8aJlU8vbYWZB6NrlkGMRnsAkYbrTeIMnnmnCia5gHVxrg/oPQT/KREMDEqyjU7ed7G9vB77n47cyDgAn4FSWrqIuRpqDkKSlPyQ9Nj2c1Kszj+h1JZxLpXtYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3V8l/mNWRz2YJFIRXoVS8SRruajOHQneJcfEo6dcAM=;
 b=sfBMvj9HoGE+ecY0gAggq9juKGXGyxYWGCyYxaysCeUH9Ldp4KEgSeR94E6nHGhCSm9iwotRP6KDi4Yz793Jv86XOiNKrFxdSDSTYQHm+MJDHPSmBgMf9Gd7SYcuxTeCRe5Gkn9JXiMKjxxwVCF6UsPQE0sQZJ77+2A+oS13Emo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Tue, 10 Nov 2026 14:30:39 +0900
From: Daisuke Nishimura <nishimura@valinux.co.jp>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Subject: [PATCH 1/2] xen/arm: Track the minimum number of PMU counters
 across CPUs
Message-ID: <20261110143039.00003cd4@valinux.co.jp>
In-Reply-To: <20261110140828.00001529@valinux.co.jp>
References: <20261110140828.00001529@valinux.co.jp>
Organization: VA Linux Systems Japan K.K.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::11) To TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:15b::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2019:EE_|OSZP286MB1798:EE_
X-MS-Office365-Filtering-Correlation-Id: c175897d-af8e-4ba1-9a4e-08df3eec3f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261028144727099003|261022075727099003|261026140227099003|56012099006|261026121527099003|261102123227099003|22082099003|18002099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ctW6Lpm9y6YuW+Gb65VxG4ODuikAlKddeBv8BGrh3f8tl6anttR4WOzPcYzPSsByEkf6XoQuOMlnz2BoAY72vwCPBoXV1pWgXeuW77ZOIGx6ZRg3CPwajJaPeHl2H7m5QGkPhFwd+FdSelDUqBqkeZ/AwrA8fIVbv8GQZN0HsUQI8vMCK9X1+dBarpJnBqJbOpaFNMbreBtKl2OlktnFev48YYVeV09/rm3bSzG5fO8vbYomayU6QAAqVzJACUxxwtka0S0l3u5mdCGE8ubcXUOG3PmK0hAQ0rMRmRLzout2/FjG3Oj44IYLx50ZnKQc+epDNEhttqqRLJVIvWZE5NnMecE3HvoUux3ly60NNBaFWMBQ5ydSofyGtDe9bxWgWZmwVBDOddwDq2bfN4mrHG3/yUz13TVZOoSj7yd2U3OV8q82LcaARvgXSyJdX0UvglGOE9i8M1WoYcEOzhZ90y6/eyYN61xX2I9QLl6iLKygbVRqQ73hccXfj/AA9+Z5t5GjHoKodi5fyL/xaDaIHGPGx7iaT71C5wiWT+rXVq7wlZVe/UatqtKa1wbRW5/bm/kCh8HdtVQbCWWxIlvR16vY34XUhbAgatBOptxlTWXSpPvL5wUh3cnzONK5Cx0izKWhF/TUV/VNFd6uCaSZYbNpcD0OQ4CfFTzi7eoMYvs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261028144727099003)(261022075727099003)(261026140227099003)(56012099006)(261026121527099003)(261102123227099003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jNUmhpNW7eafsxPbDCxMjrsU4t9Ja8bqULlIIVXIi/vkxz3a7zFrunNA0MrO?=
 =?us-ascii?Q?mROnlpjbqjzVfgrWbSlVSevy6QQ/kDG9GXDlYzgN+9y1wxZC8zVUSM8KEifu?=
 =?us-ascii?Q?bZa6/fI/y53YdtpbRUQuwpB4XRZ/6t5zcDORSmvL0krgSMHtjmcmDh3RUqe4?=
 =?us-ascii?Q?h0UWJupr5Z8UR3P6x65+29CwkCshWKrUKTsjXjI+Cwq9Q4hVdjbiu9uJm7v5?=
 =?us-ascii?Q?UocC9wNkvQ+ed4sH0FmkoF5ISiac2GDIXvY3ABk0GpOj2ZD4r4VvsoFG3nxl?=
 =?us-ascii?Q?jhMsDPYLNShSNrT99rvhVSnMB8Vqk5aa9Mxac1CBciHxwxkIYQXzKJD+htV/?=
 =?us-ascii?Q?bjANHP+ytVNewLc7DR00mOkeMFDf6vgCmKGsN/HlOYrww3Xor6UYuW0TNOT8?=
 =?us-ascii?Q?lnlr9sTzkINVbr4wDZzakcbjGcw+gq7WMYOx5awnWXbj/COnzWJ2YVXmLn3a?=
 =?us-ascii?Q?JvvdApTozWYsZ2IBPvnIHckbLRi+Wmk7g4rSRrBvF3R5w7T9qvOJBKbVyDHd?=
 =?us-ascii?Q?57hTHI3yf+UgVtVCI/yFTZ8wzCa15WTIL4WEPnr/vhi0Z0CqKKHB/CqFrgN4?=
 =?us-ascii?Q?/oG74a5vpTKTApv6Dnee8m5O1a1Ku/mgqeKtnJvA2nxi4Y9n2OyilecIipeD?=
 =?us-ascii?Q?SJspgXncMcn+68PoDW9N6B6FftC9+Lkm3DK6Z5k6uP69OwAAVXd2kAmeEXLR?=
 =?us-ascii?Q?TgYx4eKSQfQsk59gom14cVkjqcpNuS3FmzaZmvjtjD38voao/dggMem6nVMg?=
 =?us-ascii?Q?Hm93yadypXn+GfFuzZQQF5EAAbedb07Ah9zp4OeN3E4ECrEO4UzIQgYQWCSV?=
 =?us-ascii?Q?nzqKAxhzscueRJb3YBWszGkgOz4pNNrrCfuTYRk2DN1DsEiQWmHQViKNCOgs?=
 =?us-ascii?Q?RvrbiTRPNdMCQDv7OX32FKD0yoxbq1bYZ1t7ViW2UmVLmKJPPp5iismGx3pc?=
 =?us-ascii?Q?ZIiBVv5Y/F2t/oBiEl/WisyjbDsHyEUJUiXNUG1MLn0ss8hJjMz3HjOGQa+G?=
 =?us-ascii?Q?/AOv6xDbdXZFXzHaR3dlO3t/jR6aOl+F8W0YGp2DzHUGiaL/5s9U6ws8hQ0A?=
 =?us-ascii?Q?Ywa3qAyPF1L8GwaASW+pYhtVxF4CTrWaB6rju1UEwBGK8a8aznsDZVeIL5aj?=
 =?us-ascii?Q?FGD4UQtnnlxQDuB3aLX6YuVWLGu6mwVDhigHeWk9KvS2kgOqUD0w6N7BThFS?=
 =?us-ascii?Q?7iDVWXaNINoDUed6ig26BR2B66vDtRFIiLUew5zJdWwKy1WAbNR2SC9o8IFw?=
 =?us-ascii?Q?QNcLG9meWpLZm01Xk82iNOhFGQ78AKrUBeUX2/d7HEz5Bub3jTE8UqJRjMxE?=
 =?us-ascii?Q?PN1PGLsA7OuyQO6jcYPAUmP0KwERPgyn7suNB+mwQgpfA4NzbYhJ4Bi9ZwaD?=
 =?us-ascii?Q?7+WM+uFnPHn8Z2X3fQ+kmw/rL8u2NBWVmfWHZ0oMelqRnuBYGXkrkS+ZWWlI?=
 =?us-ascii?Q?dD4PnQJWIzFW4mQzlPgoJoxtbkl5YzkUups03na0hy6WTewh4JZElLqWO3n5?=
 =?us-ascii?Q?qZvpcmoz1q6g4P/NZap60UCK3f07986T8gpcT6FBfj+kbLTDFy9W6YwI82xi?=
 =?us-ascii?Q?powSrtMOEMUM3fuVPsZReerdYAWnYu2QM6jAp6Zhj5HsS3+h3MHNJUNOjdv6?=
 =?us-ascii?Q?zhUqzbEeUzRwPSN5BamdCVGgH4Y9woxUWXOHx/sPxW40ipzgG2LUHm+kdk/q?=
 =?us-ascii?Q?eTHCbIuIfn+n9BvS9qsTnDBQK7u3fb6gORp7/RoQz+6I5yq38GOwCfmYx6jb?=
 =?us-ascii?Q?i43GMnMXlg=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: c175897d-af8e-4ba1-9a4e-08df3eec3f9c
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2019.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:34:11.1165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlmplA2zuj4vXa+UVx8rE/CSQpsAGo70K+er61K8shMHPl3txn3+MBrsqb5OJmd6B+Dy45pA8bt9Ic26hS7wuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1798
X-purgate-ID: tlsNG-c1860d/1794288854-CFED287B-6974AE90/0/0
X-purgate-type: clean
X-purgate-size: 5384
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On heterogeneous systems (e.g. a big.LITTLE system), the number of
PMU counters (PMCR_EL0.N) may differ between cores.
Any counter count reported to guests therefore needs to be valid
no matter which CPU their vCPUs run on.

Read PMCR_EL0.N once on the boot CPU and on each secondary CPU that
stays online, and keep the smallest value in 'system_pmu_num_cntrs'.
The update happens in update_system_features(), which is not called
for CPUs being parked. Secondary CPUs are brought up sequentially,
so no locking is needed.

To be able to do that in common code, move the PMCR_EL0.N field
definitions to asm/processor.h and provide the PMCR_EL0 -> PMCR
alias for arm32 builds.

Signed-off-by: Daisuke Nishimura <nishimura@valinux.co.jp>
---
 xen/arch/arm/arm64/cpufeature.c       |  6 ++++++
 xen/arch/arm/cpufeature.c             | 21 +++++++++++++++++++++
 xen/arch/arm/include/asm/cpregs.h     |  1 +
 xen/arch/arm/include/asm/cpufeature.h |  7 ++++++-
 xen/arch/arm/include/asm/processor.h  |  4 ++++
 xen/arch/arm/setup.c                  |  1 +
 6 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm64/cpufeature.c
b/xen/arch/arm/arm64/cpufeature.c index 6fb8974ade..b32f924fc0 100644
--- a/xen/arch/arm/arm64/cpufeature.c
+++ b/xen/arch/arm/arm64/cpufeature.c
@@ -567,6 +567,12 @@ static void sanitize_reg(u64 *cur_reg, u64
new_reg, const char *reg_name, */
 void update_system_features(const struct cpuinfo_arm *new)
 {
+       /*
+        * Keep track of the smallest number of PMU counters across the
+        * CPUs that stay online (this function is not called for cores
+        * that are being parked).
+        */
+       update_system_pmu_num_cntrs();

 #define SANITIZE_REG(field, num, reg)  \
        sanitize_reg(&system_cpuinfo.field.bits[num],
 new->field.bits[num], \ diff --git a/xen/arch/arm/cpufeature.c
 b/xen/arch/arm/cpufeature.c index 8d8cd19a96..6ce55a0f68 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -17,6 +17,27 @@ DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);

 struct cpuinfo_arm __read_mostly domain_cpuinfo;

+/* Minimum number of PMU counters across all online CPUs. */
+unsigned int __read_mostly system_pmu_num_cntrs = UINT_MAX;
+
+/*
+ * On heterogeneous systems the number of PMU counters may differ
+ * between cores. Keep the smallest value seen on CPUs that stay
+ * online, so that guests can be given a number of counters that is
+ * usable no matter which CPU their vCPUs run on.
+ *
+ * Called once on the boot CPU and once on every secondary CPU during
+ * bring-up; CPUs are started sequentially, so no locking is needed.
+ */
+void update_system_pmu_num_cntrs(void)
+{
+    unsigned int n = (unsigned int)(READ_SYSREG(PMCR_EL0) >>
+                     PMCR_N_SHIFT) & PMCR_N_MASK;
+
+    if ( n < system_pmu_num_cntrs )
+        system_pmu_num_cntrs = n;
+}
+
 #ifdef CONFIG_ARM_64
 static bool has_sb_instruction(const struct arm_cpu_capabilities
*entry) {
diff --git a/xen/arch/arm/include/asm/cpregs.h
b/xen/arch/arm/include/asm/cpregs.h index 3f62b38dc0..fc0a7c6da3 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -480,6 +480,7 @@
 #define MIDR_EL1                MIDR
 #define MPIDR_EL1               MPIDR
 #define PAR_EL1                 PAR
+#define PMCR_EL0                PMCR
 #define SCTLR_EL1               SCTLR
 #define SCTLR_EL2               HSCTLR
 #define TCR_EL1                 TTBCR
diff --git a/xen/arch/arm/include/asm/cpufeature.h
b/xen/arch/arm/include/asm/cpufeature.h index c554686415..1ff31ab9b4
100644 --- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -465,14 +465,19 @@ struct cpuinfo_arm {

 extern struct cpuinfo_arm system_cpuinfo;

+/* Minimum number of PMU counters usable on all online CPUs. */
+extern unsigned int system_pmu_num_cntrs;
+
 extern void identify_cpu(struct cpuinfo_arm *c);

+void update_system_pmu_num_cntrs(void);
+
 #ifdef CONFIG_ARM_64
 extern void update_system_features(const struct cpuinfo_arm *new);
 #else
 static inline void update_system_features(const struct cpuinfo_arm
*cpuinfo) {
-    /* Not supported on arm32 */
+    update_system_pmu_num_cntrs();
 }
 #endif

diff --git a/xen/arch/arm/include/asm/processor.h
b/xen/arch/arm/include/asm/processor.h index 8ee8f88fb4..24ab182f84
100644 --- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -446,6 +446,10 @@
 #define HDCR_TPM        (_AC(1,U)<<6)           /* Trap Performance
Monitors accesses */ #define HDCR_TPMCR      (_AC(1,U)<<5)           /*
Trap PMCR accesses */

+/* PMCR_EL0/PMCR Number of event counters field, bits [15:11] */
+#define PMCR_N_SHIFT       11
+#define PMCR_N_MASK        0x1F
+
 #define HSR_EC_SHIFT                26

 #define HSR_EC_UNKNOWN              0x00
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 2cd1c021b5..474ab5deda 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -117,6 +117,7 @@ static void __init processor_id(void)
     struct cpuinfo_arm *c = &system_cpuinfo;

     identify_cpu(c);
+    update_system_pmu_num_cntrs();
     current_cpu_data = *c;

     if ( c->midr.implementer < ARRAY_SIZE(processor_implementers) &&
--
2.43.0

