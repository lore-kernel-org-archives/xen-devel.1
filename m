Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4620606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 00:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ea6Y2OUH
Received: from list by lists.xenproject.org with outflank-mailman.1493460.1693435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTU17-0008Gc-Qc; Wed, 18 Nov 2026 00:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493460.1693435; Wed, 18 Nov 2026 00:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTU17-0008GV-O4; Wed, 18 Nov 2026 00:59:17 +0000
Received: by outflank-mailman (input) for mailman id 1493460;
 Wed, 18 Nov 2026 00:59:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xTU16-0008GL-Mr
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 00:59:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTU16-003acG-3M
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 01:59:16 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6afcf838-e002-0a2a0a5209dd-0a2a45029c3a-30
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 01:59:15 +0100
Received: from [52.101.52.67]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6afcf862-4900-0a2a45020019-346534438b7b-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 01:59:15 +0100
Received: from DS7PR03CA0202.namprd03.prod.outlook.com (2603:10b6:5:3b6::27)
 by MN2PR12MB4080.namprd12.prod.outlook.com (2603:10b6:208:1d9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 00:59:11 +0000
Received: from DM3PEPF000265C5.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::2b) by DS7PR03CA0202.outlook.office365.com
 (2603:10b6:5:3b6::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 00:59:11 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265C5.mail.protection.outlook.com (10.167.23.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 00:59:11 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 18:59:10 -0600
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.57 via Frontend Transport;
 Tue, 17 Nov 2026 18:59:10 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJMUT57KQ6ZObM8kGRD1vAqxL840XkzRSPoDuAFfxNCvzf68kVg4HkxmoH3I1eczjKt3k1BCNPNoielo2TgW5qqFrePgPLtRXNrfVuJd4riLOf9UjAIaZGCEDVZT0xMcaWfsoLka8FTcXk17X3Rqutt/QFEMI/ROYlSNRQwo7kbv+tnRJp9VL58aO0AnkJFN+/f/MzUmY0ktUN/cWjtkTwoqTwrkJdim3puLWqe0H//EgMEUEoAXlNWsqbMIlJZAUraYsAQVKQnCbDLhh7tzeJmzJNrCC8mKh4l+CooYNfIIcgF+InnNQe4ZqyRqngxVsboYro5Em9LbSnvc8xg2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U05Nx9cqADRaNyGYvpkNwv1VsbDKFsTvDwYvYUs/CE4=;
 b=uYTZQHMUt7q2nILwGFpLZlWVuqdgqTp/XVwtMzyZW3/xAlOnQuHz0QqN2Uu99EY8X+3FjhA8JcSixfISGMvob7cvb0aZXD8NFuwR3g3LDbds9OgI0LDTpFCTt+KZuOe8zwnNi2nMLzwg5csv+nV+sEu34wwqojlmiR03hcnMOfkt6gZdi7utpNxA35BTKnrMtqMYEYT1iEa0KKnkWQRNOLKVE2ZNlbAVhu0SA9AgkMs1Gc1ZFbZL0kcBAubLpS8g6vfSHnGd4mvJoIfNHrY9ciyw6ZBg+/jbsJ1dsdDQ3UezHIzDbV+GgikzkeAgqIwmzf7gDyu8NO1K6+dOytrlZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U05Nx9cqADRaNyGYvpkNwv1VsbDKFsTvDwYvYUs/CE4=;
 b=Ea6Y2OUHDusg0IW0G14DFBCIvHwiSYQ6bZXe3cykRkKBf7ah5vqqlaf71SpDWbVCjQeXl9ht1v5yRCT8NRXUifEzb6xJOtsYw1JafciuBl7LxLLWn2G21vTSb4Agj2ozIZ5fQMS2JHKH2fiGixY4ZFGawibU/EqBZlT++gDzlsI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/4] xen/arm: traps: enter the SP_EL0 vector group for an exception at EL1t
Date: Tue, 17 Nov 2026 16:59:02 -0800
Message-ID: <84a854e6acda231429b8c13ee339612d7ab27c2b.1794962603.git.stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794962603.git.stefano.stabellini@amd.com>
References: <cover.1794962603.git.stefano.stabellini@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265C5:EE_|MN2PR12MB4080:EE_
X-MS-Office365-Filtering-Correlation-Id: 012136f9-a2d7-4852-271a-08df450f2844
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102123227099003|261021123027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	oi+k+m8r0bhyQOGqa+PMTTrGDcgkpJ1OfRUCz8iUYcMUSBWaEt1u7oVSIMBYNPMxbdtXbKJBoC/JgvWBFYkNoTtjjMqDEfjmmrmwMxXnAKCHf4HwoCD0087V0X8q0eIy2dGo3GqFNIpCNuQ5jmk+HNxJs336QZ7C2qtHuDL/6whNEJWO90Uc8PqLA3xe3fadb/hUY+uILokxADy4uW1Wsm6H3twXUfTQPd+R8YNVMba57AEa/eL/VVbtpZf6FJGWy+frbpyubgM883ijXJwoS1ZaI6SCsTwGJ0glWHi85Amtdkwl/8pxaffrX8sD+RtItgBHZdoG4zUb3f8Xdd6EJ66hJvtbeGKTD/5/Wd0LAMBKPLmXkzApMWtT/4DXBqI/0KLZazNW3FgRW7muBacoIhmkT6VVU3nKnOSNln+IC08lQigeCTan3gRhoIm5Uki3EfLhY0UtRWM9BWIWpBs7/LP9QdV+gL2Vnjig0QGDmVumg6Qh9ajMARvwZDEshA3B0uWOvnn65lf6yMWTm6IbkeBnXweOUNeXoHsEos4d5Q5peaWjb2KUQL6zbWwvOyKUbUEnLHPgZMUTEBJ7oxITcB9nWoRJBlMtFpX/I0NEsxXxe5cLjXz4bZuF+gziyeJSkXvKbgAwotLy1FuzHmmYnbSGbQ2Ng4/OWaEhAdcT422/AufUGJF8TeSHeAb7q/45i32Wz9VNoAXtwVKlPnr97w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261021123027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	h3srYczwIbITdHHxxn4ptXozBl1DF1gxT5bYe9DtjkyiOVIiSC8BpfIuzF+ytMg/+Gf5poIe8hrk9JqXndiftB7tyShq/XSgMySSn4CKbmS7inJwzQn5W0jLIrLIREdZGXp9Suq2YZRf8LmD0rc9u8r/xLWfPxeGRVvQ2Ie58xds89Dagr3ELH9iyd3VZ4iMSxGp+HsCwCCALq3xyFMHC5oUXwB+OlMSpxelVwDeWxAzS53Zmr6/ol+3ATa34tKGrkBlqrjZ3KxVjvYFPgmRCbzCFFg+pjyS1OYwZvy9h8JBObLGihoDNoRpLSnEJuvP4y90pDOhLYi/Gz4lTP/V/Kns37LbF2WW++WnvzdjWICAjYOmDXIWFBD1sGr1v20n0JuczT/0vS4NPSp9tXalPPe1z/O1jtp0MhGWToQJJ1O5FQB6lyurrrY2DoghhtCA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 00:59:11.1726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 012136f9-a2d7-4852-271a-08df450f2844
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265C5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4080
X-purgate-ID: tlsNG-720697/1794963555-33F996C6-C6F8DE9F/0/0
X-purgate-type: clean
X-purgate-size: 1600
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An exception taken from the current level is delivered to the SP_EL0
vector group (offset 0x000) when the guest was at EL1t, and to the
SP_ELx group (0x200) only at EL1h (ARM DDI 0487 M.d D1.4.1).
exception_handler64() used 0x200 for both.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Cc: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

Changes in v2:
- Cite ARM DDI 0487 M.d D1.4.1 instead of A.k, in the commit message
  and the comment.
- Move the Cc list after ---.
- Add Michal's Reviewed-by.
---
 xen/arch/arm/traps.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 47a5c6bdd4..b4ca812233 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -532,7 +532,13 @@ static vaddr_t exception_handler64(struct cpu_user_regs *regs, vaddr_t offset)
         base += VECTOR64_LOWER32_BASE;
     else if ( psr_mode(regs->cpsr,PSR_MODE_EL0t) )
         base += VECTOR64_LOWER64_BASE;
-    else /* Otherwise must be from kernel mode */
+    /*
+     * Otherwise must be from kernel mode. The current EL group is chosen by
+     * the stack pointer in use (ARM DDI 0487 M.d D1.4.1).
+     */
+    else if ( psr_mode(regs->cpsr,PSR_MODE_EL1t) )
+        base += VECTOR64_CURRENT_SP0_BASE;
+    else
         base += VECTOR64_CURRENT_SPx_BASE;
 
     return base + offset;
-- 
2.47.3


