Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2AAC98304
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 16:20:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431047.1653440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PhW-0000hW-Uq; Wed, 23 Sep 2026 16:20:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431047.1653440; Wed, 23 Sep 2026 16:20:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9PhW-0000hO-Q5; Wed, 23 Sep 2026 16:20:06 +0000
Received: by outflank-mailman (input) for mailman id 1431047;
 Wed, 23 Sep 2026 16:20:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1x9PhQ-0008Ey-MV
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 16:20:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9PhP-00EKA5-SZ
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 18:19:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ab3fc2b-e002-0a2a0a5209dd-0a2a45078a3e-14
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 18:19:59 +0200
Received: from [40.93.196.43]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ab3fc2d-b4ea-0a2a45070019-285dc42b452b-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 18:19:58 +0200
Received: from MW4PR03CA0081.namprd03.prod.outlook.com (2603:10b6:303:b6::26)
 by IA0PPF64A94D5DF.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 16:19:52 +0000
Received: from CO1PEPF00012E7D.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::2c) by MW4PR03CA0081.outlook.office365.com
 (2603:10b6:303:b6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 16:19:49 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7D.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 16:19:49 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 11:19:48 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 11:19:48 -0500
Received: from fedora (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.49 via Frontend Transport; Wed, 23
 Sep 2026 11:19:47 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+ogYtxpuJyktxxUPNzUYEgRMYKTOPncp8iH6OjAhNhPA3DQAwSmHuo0gT38zea09P//M/aBEeWM8I3k6pcRlCk2AYj4YNl3wDTC35YQM2SfS6dalxWgVpPNry/l6XtogUY2GvBBHHmEbTKmWTzR736JgIBfA+8GtndN4zDmUS6L3ueqwQCMI6D4cZNaev7Up93ZNYzqqfwVZ4JMhWYl9D9X2mSl0kC8FKsyyvOIX45PN0LEgnQq5arY+6EPCC1Je/D39lAExNQOKZZF4Tm6qsc54V7h8h8LkH4M8dqy6fCTpZfg3ruJw4Q+miArRXq/7qfREMxcJZGMpXqiGNzsgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyKqwygtGsE4qSrFPliY7ncBXi+c2UzL9Gwyvrui5b0=;
 b=N5sReWPRVLkC38xdLJc0SRnqD4YS3Xe5xTy1yV6aqlVa93vXfQzNdbt+xsIB1PY3hqgGZAelWMxaBrCXdxi2s+H7ApSNeliGxc3P5loUebT7K+mm4RlIaZdooZAEz97EE6dOVCUIxLuRE8b6pktvH07UcH5aMbCuMs2bF8yxFz83oeAi51Be764kfl99omGWUbqk46yXKDub70qmGQUlYpfDPNbAQ4xwykdQcE23w5y5cpRr9iO3ShqUkVP1FE0C0U0oJf/8BGQuOm3XVgAciAD7/mFksvBZU6jpIdjGMj0PGJqzY6i118oDsBD7wveodYOdYqRA3Y5FqXH+fCFSmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyKqwygtGsE4qSrFPliY7ncBXi+c2UzL9Gwyvrui5b0=;
 b=zZ9T1mrCzgq/i4WU2yaUN0RdF6KY0t885hjVeQQI1m/BrK7qWeQCmfSYIGSwSeICiVl5pCSFVeKM9SAqq4zcnBgsPRJ6t1vCgIa2vdPECWk/BgvM7RIIGOmyS3UxrtTJDybg2A+kOOhprICND3FCls6pHMJRim3x86X2wEbPi0s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Teddy
 Astie <teddy.astie@vates.tech>, Grygorii Strashko
	<grygorii_strashko@epam.com>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>
Subject: [PATCH] xen: Consolidate linker script setup data
Date: Wed, 23 Sep 2026 12:19:35 -0400
Message-ID: <20260923161935.24429-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7D:EE_|IA0PPF64A94D5DF:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f33177b-efb0-4fe3-ceee-08df198e7d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|36860700016|82310400026|3023799007|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	nWZBVkfm6ZFBjzxzdEebu7bFtw6xTPeKtYeYynzB+OwZbRnsgBhg0YCRPwAN/85+fNznsEQruAfuXAl18pnUKnArAhZ+DcXzKqxETzPwBz50Wd7JOFIWYtIhXZ+5792YDTHM/gyWpYfcFcImG/etRuFpCAyMSQP6qvYAy4h9IdYvSRW06l+6+in32FkLuCarFwBTjIwzHe7/YwvgbgvsK034KDtja1S0yLr1UAMrroG0iw9bV94N/v+6uOJjuiPATpLdQIDU9/P6z3u4t9Raoq/WsTPsmI2v0p2rY/3XnHS7LVkwfOCvafUmNx9MjbvluOZ8W5MfKuDcmGo6nng4coLy0i0q+7FjMMRNr7ci8gjLjuqxjI4aVnE75k/9BcRCNGiIBdm7ZOGio6mfHzjNrGV1R8rbZKHOT7eEcNNOZFFVNwK5lJ261dzzpRB6SRC5eIuPx9RNn7PA46V+oLhcqxhRsmxfrgmOtQQs4cmJBguGqDuhir+d1F1EMD/EkNr7A7tpLowb7GDViOQ0sHY/clz9ryhNUSKr/W75ExnN8Mo2FlCLs42ieQ8KoFm3mAr6inLu2k6fa3zVJcUNBG5VDCE/B/WYabthMUxtO0YNYmPxRVMiP89D85INsBFKO0Cl6vEZag5eZFI7ShcKAuONDJZdx6ZGKNsD6pu3Y1wQatIqaENHy3k1FoJIkuEqmuhwOeH9vlaGlw3Wt1zBgFLWOQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(36860700016)(82310400026)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YNaz/ZGMCRlmlbjHEXIwm8nDoizqTwBkFA2iHCNzEwhgTouG4qr5E4GAO/gq57OMdnSiSc3e4x9YWjS9yK18t+SWxCLrTi9f4Hv0fioyRJULX/usTE5ODdXqa7dBLB4B477hp6XYUBypX+TimZQB4a+qEdLfhR8LCb8KKRAOL75YzqtnO0RnzgfYHabsU3IYBZWmy83FqAshakb8WBpoGA4N40UtM1cLf3jt8mzX6/6L4EhD4T9WbNTzPbtd3DTNDFlvb0iWtmH0NZ2GDOQcw3eCqYBNgHsx1jmpSlNXp9wqeB9KZDTIdXdLhyb3o19bOKGnd2o5pq6Xzd0bRC1q+aoHOjI2/41NZNGvZELwtMvTvi69tj2ptKyHJU9Qb0ShAQ3l1hVT/jPsXDDpxVPZSSGqx6KeDugS//Ahgf0K1WQOERJkmVZ0lJlLE3qML2R+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 16:19:49.2118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f33177b-efb0-4fe3-ceee-08df198e7d9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E7D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF64A94D5DF
X-purgate-ID: tlsNG-ef75cf/1790180399-376D2AE4-EBF3D39B/0/0
X-purgate-type: clean
X-purgate-size: 3960

.init.setup, .initcallpresmp.init, and .initcall1.init are duplicated
across architectures.  Replace them with a common define, SETUP_DATA.

Suggested-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Alejandro reviewed internally.
Jan reviewed off list.
---
 xen/arch/arm/xen.lds.S    | 11 +----------
 xen/arch/ppc/xen.lds.S    | 12 +-----------
 xen/arch/riscv/xen.lds.S  | 12 +-----------
 xen/arch/x86/xen.lds.S    | 11 +----------
 xen/include/xen/xen.lds.h | 12 ++++++++++++
 5 files changed, 16 insertions(+), 42 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index d4d9594033..32afbfe131 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -135,16 +135,7 @@ SECTIONS
        *(.init.rodata)
        *(.init.rodata.*)
 
-       . = ALIGN(POINTER_ALIGN);
-       __setup_start = .;
-       *(.init.setup)
-       __setup_end = .;
-
-       __initcall_start = .;
-       *(.initcallpresmp.init)
-       __presmp_initcall_end = .;
-       *(.initcall1.init)
-       __initcall_end = .;
+       SETUP_DATA
 
        . = ALIGN(4);
        __alt_instructions = .;
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index d0f2ed43f1..37256c8865 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -107,17 +107,7 @@ SECTIONS
         *(.init.rodata)
         *(.init.rodata.*)
 
-        . = ALIGN(POINTER_ALIGN);
-        __setup_start = .;
-        *(.init.setup)
-        __setup_end = .;
-
-        __initcall_start = .;
-        *(.initcallpresmp.init)
-        __presmp_initcall_end = .;
-        *(.initcall1.init)
-        __initcall_end = .;
-
+        SETUP_DATA
         LOCK_PROFILE_DATA
 
         *(.init.data)
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 70db658fef..d9375a9616 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -114,17 +114,7 @@ SECTIONS
         *(.init.rodata)
         *(.init.rodata.*)
 
-        . = ALIGN(POINTER_ALIGN);
-        __setup_start = .;
-        *(.init.setup)
-        __setup_end = .;
-
-        __initcall_start = .;
-        *(.initcallpresmp.init)
-        __presmp_initcall_end = .;
-        *(.initcall1.init)
-        __initcall_end = .;
-
+        SETUP_DATA
         LOCK_PROFILE_DATA
 
         *(.init.data)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index b9e888e596..8f943e11ea 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -223,16 +223,7 @@ SECTIONS
        *(.init.rodata)
        *(.init.rodata.*)
 
-       . = ALIGN(POINTER_ALIGN);
-       __setup_start = .;
-       *(.init.setup)
-       __setup_end = .;
-
-       __initcall_start = .;
-       *(.initcallpresmp.init)
-       __presmp_initcall_end = .;
-       *(.initcall1.init)
-       __initcall_end = .;
+       SETUP_DATA
 
        *(.init.data)
        *(.init.data.rel)
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index ea11e3fb62..958f8256b0 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -179,6 +179,18 @@
        *(.data.schedulers)           \
        __end_schedulers_array = .;
 
+#define SETUP_DATA                   \
+       . = ALIGN(POINTER_ALIGN);     \
+       __setup_start = .;            \
+       *(.init.setup)                \
+       __setup_end = .;              \
+                                     \
+       __initcall_start = .;         \
+       *(.initcallpresmp.init)       \
+       __presmp_initcall_end = .;    \
+       *(.initcall1.init)            \
+       __initcall_end = .;
+
 #ifdef CONFIG_HYPFS
 #define HYPFS_PARAM              \
        . = ALIGN(POINTER_ALIGN); \
-- 
2.55.0


