Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F2FCA5FED
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 10:32:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441360.1658941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2Sq-0003f9-8z; Tue, 06 Oct 2026 10:32:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441360.1658941; Tue, 06 Oct 2026 10:32:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2Sq-0003f2-67; Tue, 06 Oct 2026 10:32:04 +0000
Received: by outflank-mailman (input) for mailman id 1441360;
 Tue, 06 Oct 2026 10:32:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xE2Sp-0003ew-61
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 10:32:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE2So-005dbB-Iy
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 12:32:02 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac4ce1a-8faa-0a2a0a5109dd-0a2a4501b568-24
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 12:32:02 +0200
Received: from [40.93.201.40]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac4ce20-5984-0a2a45010019-285dc928d3e4-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 12:32:02 +0200
Received: from SJ0PR03CA0284.namprd03.prod.outlook.com (2603:10b6:a03:39e::19)
 by LV8PR12MB9641.namprd12.prod.outlook.com (2603:10b6:408:295::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 10:31:57 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::72) by SJ0PR03CA0284.outlook.office365.com
 (2603:10b6:a03:39e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 10:31:56 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 10:31:56 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 6 Oct
 2026 05:31:54 -0500
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
 b=unPSKZ6MGr3AahWjc6PsOAUBbrlVjS3QN6rOfJg6jHRujg/+VppCgXybRmRw222lgFAkItypSlz1jpn8+QVuz+CBUmX7dgsM5TcPA/eOLupFKn2tXehAY5NZxHdP6C9QHKGmn/iorZHBTG6pmJpJZRd62rYISNqqPPvDF03OBFnx7rm1OAbD6rli2xTvm34sKAUV6IZWvNvLjjSwq0RBMks9LyKHJN74oXPT5jKWha2DMBuDw74TF/cZiqB9TsNG5aMeoAiM9JJ/990fnq6SR078cxWgVoi3BHvFmsBtCpPXs4PdfhdTKi3wA7rC5NEAm1jqSv8/BnOO801iRrpoKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaWkWhr8Df7fn3pAXC2CTiSVEyMc+gf6VWML+h9pGoA=;
 b=sPYn1j1iMylT9WfpjNC/AXxyJ+aixZ1IgjAfeYokJh598Tvg40KMVNoegzLGA1Qfy4j+Z6rSI9N64UY38Q8fuUu1ZltXwI2fFQY19Djfp83/Dtsl7cHtTRTsRJ2glgyOBRE11d+gHumXBGqzCTwww707fZE0zgHRQZnQdzyQYGDrwtpbHUASaVQomvw8IgSqnHlZz2jeX/UdAIY0KX7eqAIVR9uu47hf7yxzSefeg4tIj2OTuPhrrRYKZBelEAARHBhlC8+DxNon+Q+/Rr/oLLBNyf+B38L3Y52ZuqqCLM4SXyZUjne3HhsBXgI4XPWaO6Uu651whjLsV2qZIHlI8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaWkWhr8Df7fn3pAXC2CTiSVEyMc+gf6VWML+h9pGoA=;
 b=I0If4aCVxG35hWcUfIWhRDsYFGhW/bJ1u6MmTpQtHU8ub5XSCbw0OJEIm0BBnZ2w6sgu4PCJxKpwq2jC7fW30q+aR3peez2KDB6buggcKqjAH7Ab43B06f5IBIarkUaM9O8qc0E2z2FYz0L9LO2giat6ffSE6Aa5Jns+p6plZFw=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] arm/nospec: Make nospec helpers always_inline
Date: Tue, 6 Oct 2026 12:31:40 +0200
Message-ID: <20261006103142.139422-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|LV8PR12MB9641:EE_
X-MS-Office365-Filtering-Correlation-Id: f6df2be3-bd37-46eb-cf52-08df23950bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|376014|1800799024|36860700016|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	T7aWvoM75eC09qK3ykCWPDgUr0GldBgcODPJqlf8vT+9jtpJCv8JOAzc11I/gHCU9bB1uoEfz/1vggPiXFp+FyOBWCSBm8yECyU6nHPu6bqN7jd/F89D3T87zhEkesvz1sCLrLo4snm7KD6xnQeZOs71gRer5q9eyHm1lVXtCoPrn5yYh20loVqG3eLvDHC4CqJ8drk1EnhBdlJIPZ16L5Mxi0xEVhpUdA/duiSKn+lmwz4QUknItUWMHWOk4gcg8Jdk1aDRDy9RzCxf6lUJ4Sqo8dA2RMl40cDSdexAgk9w4Sadoc1nZ110XGkh5hNFWmZWUeeOXyybLJtn+VJ+thpplY9E8Cvd4dZP9gMdE+aMGNmoczf+nxjMpOydMkwm08SZartlxOfC+A1cKsFvOXzStx+VWgppG6e9JBls/ASgE4LO9CSoOp+vlx1ResZjWLvbcD3ZQQnlDZZtfOuN5udPgUUOL/LOulPhbg3RXgB7dq+0s5Pg2wDN+e3XXu8RxoArZX1Mn99ulxMcfzMUCAOspy1BqIvSasfVz6b0+YQIihlbeRIfbxOduLvHyZArtboCEfmX189hvVlq9ZYAbEz3Z7MC/r6LvW7RNXzXokKUlVLM9YqVxEyLA57AyFWYHhVi7YPSGx/N3SHNhsGRvCPpEH9K5sY+uowyk3hgCbogXCmsyD7L5SgrGNtl9miW/n78y+lol4+UT4CeyxwKDA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(376014)(1800799024)(36860700016)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pgctTiA6ADwzG9XOqc0ioXMj7mXNcUYIYfLVcCebcGasIcu0QsF/zh/HPYiaK5D1h4fv9O3c4Mc4K7eCUJwIYoUOW8o3qxT2HeOV2uXVC86C3xDfqRgyb5t9c+dQRRk1mLtxIuya56J9QOShKwZlzON0MsoeLjFc1QoJAqoY0KoiK3opLhn8R7U5NbY8DcXbgZlas72iMNvLHOcon9hox0l/M2kS52Sgh2i/1jNp6XhE5U2rZsJx1pONwmErSs4C+d2tOj8tXsGIVkMeqvaurTutSgQLwqljpUUOdMiljXN5NWE/Nv4XvK005ap5QYgLVJa4gCyc3LadMyDxEPAsbFWPlVotmrejp4Z0pVYdUf9R9a+Jlxtb/HlItRyQetC6fCimC2Wh91MpLwGnXBjPfbqCbkyUeQnyCaud5zqlkzLgmhEOO55RKZetrXqssCPr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 10:31:56.3051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6df2be3-bd37-46eb-cf52-08df23950bb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9641
X-purgate-ID: tlsNG-d62444/1791282722-1D87F757-8270B616/0/0
X-purgate-type: clean
X-purgate-size: 974

While today they don't implement fencing in a way that would block
speculation, once/if they do they'll absolutely need to be inlined, even
if -fno-inline or -fno-early-inlining are passed.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/arm/include/asm/nospec.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/nospec.h b/xen/arch/arm/include/asm/nospec.h
index 51c7aea4f4..b84f8dff45 100644
--- a/xen/arch/arm/include/asm/nospec.h
+++ b/xen/arch/arm/include/asm/nospec.h
@@ -4,12 +4,12 @@
 #ifndef _ASM_ARM_NOSPEC_H
 #define _ASM_ARM_NOSPEC_H
 
-static inline bool evaluate_nospec(bool condition)
+static always_inline bool evaluate_nospec(bool condition)
 {
     return condition;
 }
 
-static inline void block_speculation(void)
+static always_inline void block_speculation(void)
 {
 }
 

base-commit: 290959692726bed9a9404fbb151767dba9928c5b
-- 
2.43.0


