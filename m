Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F81C5B56A
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 13:08:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388203.1629425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtmDf-0004BI-79; Tue, 11 Aug 2026 13:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388203.1629425; Tue, 11 Aug 2026 13:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtmDf-0004BB-3m; Tue, 11 Aug 2026 13:08:39 +0000
Received: by outflank-mailman (input) for mailman id 1388203;
 Tue, 11 Aug 2026 13:08:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wtmDd-0004AT-IR
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 13:08:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtmDb-00C6un-GR
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 15:08:35 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a7b1ebf-bab6-0a2a0a5309dd-0a2a4504d4c0-10
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 15:08:34 +0200
Received: from [52.101.61.7]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a7b1ed0-b57f-0a2a45040019-34653d07ff69-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 15:08:33 +0200
Received: from MW4PR04CA0200.namprd04.prod.outlook.com (2603:10b6:303:86::25)
 by CY8PR12MB8216.namprd12.prod.outlook.com (2603:10b6:930:78::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 13:08:24 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:303:86:cafe::19) by MW4PR04CA0200.outlook.office365.com
 (2603:10b6:303:86::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 13:08:24 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 13:08:23 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 08:08:23 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 08:08:23 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via
 Frontend Transport; Tue, 11 Aug 2026 08:08:21 -0500
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
 b=pjZTF9x1J7t22vx58dyf98E6h1QUv3O6Tdq4bQ5HtbViEjgWBzppyqZ9Vz/xZ0GyaH6PJ4z1eNkF/+sRC9Ptr4e/gVtQIrmvC+5YOrdMOJBLq/21V+bIHzfxBSjuoaqFvc/aKK6dJEkUtBFhEP20x9kifw7nNfQ8L+h658qdzOohlixN9fjW4NNptt96GTxivM8eFHqK28gju/HbajbZAGbLMlFTTQgzTKIFfEENsaBw1FJXe0wJ4a5iLiz20sv0UVPZbJR6TxJC430evlfUqBg9Hqrf8TbiQKCJJfhQ5BwzIsz0UBS/nfMJMngyMxexzJYJ1zPwFB0wYeqe/WQk1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uL5twoODR7h7tXvISrc2qyc1Omt/iP2tMqUXiS6AdPI=;
 b=Ta5d04Qe+VOXzp6ZdYfV83LJd/NdT9Zqu7L90sNr4S1wz6+saD+oM1b/Lk30LOP/FhhgLddeYq3vQ1mKKaNNOF6vSPwy6pCqx6ZMBBFLSMWlre135Fb21l0kqAuAzwykTKM5NY6T06Bykod7T4C1q6BMkbS4JuGsu7aLml2YAnzKjdO9SCaRU74cM4LsikqdC2ZQ9KL6g48dDmui92PvMRDS73xAnVwmNgYfl+EUAcGBTgx64hvgGOAzv9WcDBv95woUBEcZVqZyORmIeaHdawaizqIZs+ESJ5nSrLmmRlQL9EaqQCYVzgL1m0n4EWdKa3X1+3JYy6HbLxDOSmH9og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uL5twoODR7h7tXvISrc2qyc1Omt/iP2tMqUXiS6AdPI=;
 b=BcgWIkaItx4W380piZwuVhTnJnNbQsGRamc5CHvuWRFeSozWUlKVQFamLgsvQ9jJtAqtb4tqnqbPw0vGCB9qZx0VcprAF3MLXgvWnFtyxzSiUNhkTWpsn36FF3+1s3+5GQhCE3dCcRBOJy3rP4TLY/RL8LAEpzvMWq5wUYrHaco=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/arm: drop unreachable EL0 check when emulating ACTLR
Date: Tue, 11 Aug 2026 15:08:17 +0200
Message-ID: <20260811130818.123862-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811130818.123862-1-michal.orzel@amd.com>
References: <20260811130818.123862-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|CY8PR12MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 48d65d3f-6abd-4c34-73a3-08def7a99fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|22082099003|18002099003|11063799006|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	bxGwBHES/iI/G1HZkX+RSdBRLyswPdKzdPRxxAW5Io5B6m5SDAHCHURFOkk8R2C60hPsVwtnvcz76Cm1+j+h/eOyS1haEj1yrOtE7xQSrM/RKGG2sBAT/RRkzvXai6dE6xQGYtk/OKWXpnuc0iqQeTcommWdHSCQLZlClaoTVc/FgParuMtfDUKB4upe7KrA45VMehfi0pXRGLemX1dm3ke8nenR7H6tku0EBp1Leyl+uJSsgEREL7m7MDcR6GvweXaQ9MSD+66r/Qxsx7TG/ACeewLS1ft+xlYU1cIxH/5QIYOcFO+H5rXr/sMM0TV9BODxgxryYHnPw+N8F2Jt/QRCBtlWSy/X1ZeJNusic52AF4k98Brc5BI7EU6yj2k3M+VZwIf14lblW+XhpoFsMMiZvMIBefK4QSAbk9Ud9OFbN0Wjr/XBElRzf0zGun+hcVOQm2xh5WIHuGZ+i3DPVKBreAwhXduDeD0R1fr9TcFvwnmYXi2go68QmztigFDp8yO0t7KlRdO2xxfQxLkPCCN/L/OlUK4alJG0rlyt9+uaayPFDZiY2rQNi+u3hKk00BDppgUBjmDKO36XbBQex1kCPoW7m6nrsE+O1b/KoLQy2W2FnRFDbxWmkUKYZer6bAJnAA4b2NDHPzwMWTzYXR+ND1oZRZOWs8M/UcwPdKevV+rYxcQZVBGqTm7GGqbWKAN75S4S6LVVV9H6CZOgiw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	indfLzljTVZSSWcQfsd/j5+GV0/Mfe/NYSnwZ38n65KOk5I5HIZPBCCesI3rwUNrFpMacuf1FYuDz+FmlD3KlpiSzIIKfe4vhlgIAFtnHN5je4w8fv96O36q9xXB4tnEV9B6UbFRjzhNylDVmyLtxN0SRuo7jk+GFBRKmjZiV+1dT8pmTMLDo0NgKFhwzQOLoIE8ksWfTW8NVq5UPKzt2Z1jEekP3/FmWrzymVp3tZejFchPo+4J/D6lQdE+tWZ6Mdm11y69N0kIOjN8qYangBEh/c2N//Vssm0pF3Z0mjkPJYqCqIAH65rb2w35UIAec7yoJZ/DGoaH5foHyJlWbGoCLRhkFVskhElKjm1gjcph7GqTJnaclUD8SS2b3PWn7Iwz+PC4GYuYk3SzRMpgqCBxNb9RLRuEb320fC4NtWZ/Nkb7HWh5qlh+CBZk4XXF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:08:23.6179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d65d3f-6abd-4c34-73a3-08def7a99fe4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8216
X-purgate-ID: tlsNG-ebf023/1786453714-520D5B50-70BBE54E/0/0
X-purgate-type: clean
X-purgate-size: 2223

do_sysreg() and do_cp15_32() inject an undefined exception when the
trapped access to ACTLR_EL1 (resp. ACTLR) originates from EL0. That
branch cannot be taken. ACTLR_EL1 can be accessed by EL1 and above, and no
enable makes them accessible at EL0. The only trap covering them,
HCR_EL2.TACR (HCR.TAC on AArch32), applies to accesses from EL1 only.

Refer Arm ARM (DDI 0487M.b) D1.4.5.6 "Prioritization of Synchronous
exceptions": "attempting to execute an instruction that is defined to
never be accessible at the current Exception level and Security state,
regardless of any enables or traps" is priority 18, whereas an exception
taken to EL2 as the result of a configuration control in HCR_EL2 is
priority 24. The former wins, so an access from EL0 is UNDEFINED and the
TACR trap is not taken.

An EL0 access therefore never reaches EL2: it is taken to EL1, as Xen
never sets HCR_EL2.TGE for guests, and it is reported with EC=0x00
(Unknown reason) rather than EC=0x18/0x03.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm64/vsysreg.c | 2 --
 xen/arch/arm/vcpreg.c        | 2 --
 2 files changed, 4 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index a02ad951f9c1..a59848889659 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -95,8 +95,6 @@ void do_sysreg(struct cpu_user_regs *regs,
      * ARMv8 (DDI 0487A.d): D7.2.1
      */
     case HSR_SYSREG_ACTLR_EL1:
-        if ( regs_mode_is_user(regs) )
-            return inject_undef_exception(regs);
         if ( hsr.sysreg.read )
             set_user_reg(regs, regidx, v->arch.actlr);
         break;
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index d6f9326b712c..749ce6d3a57c 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -219,8 +219,6 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
      * ARMv8 (DDI 0487A.d): G6.2.1
      */
     case HSR_CPREG32(ACTLR):
-        if ( regs_mode_is_user(regs) )
-            return inject_undef_exception(regs);
         if ( cp32.read )
             set_user_reg(regs, regidx, v->arch.actlr);
         break;
-- 
2.43.0


