Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7DFCA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 14:32:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442426.1659993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESgS-00073c-5w; Wed, 07 Oct 2026 14:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442426.1659993; Wed, 07 Oct 2026 14:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESgS-00073V-1X; Wed, 07 Oct 2026 14:31:52 +0000
Received: by outflank-mailman (input) for mailman id 1442426;
 Wed, 07 Oct 2026 14:31:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xESgQ-000729-QJ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 14:31:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xESgQ-008Syv-6P
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 16:31:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac657ce-2eae-0a2a0a5409dd-0a2a450ae994-32
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:31:49 +0200
Received: from [40.107.208.67]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6ac657d1-f2d2-0a2a450a0019-286bd0433a16-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 16:31:47 +0200
Received: from CYXPR02CA0002.namprd02.prod.outlook.com (2603:10b6:930:cf::28)
 by MN0PR12MB5931.namprd12.prod.outlook.com (2603:10b6:208:37e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 14:31:40 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:930:cf:cafe::73) by CYXPR02CA0002.outlook.office365.com
 (2603:10b6:930:cf::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 14:31:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 14:31:39 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 09:31:36 -0500
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
 b=qGxiXy1dm6MTSOr8cEKVgLHlSS+mds6tB+3uinOZkpBZcX9wUZySelX3DNyZzDd0L5LXW1ZZeIi4es9Un0TKXiJD9eaOrbpbv8bm/Up8+nQWK1Xj54Tk63uws/cHK7utYtlwVKkOKylEBrPPp8WvgqJRempPJAefksMQcqTQv4MW2ujN7R/HrQho/Bxjw1pAqTWOQW244X525Y9vvXPv+w1BQeSggccu8vsxsOCYt5wQOu4e16C/MfxGRu3YgZz+/ksqrHIm1gdLiU8Qyn07L7ToDQ6wPalNGR4Xgwd+UrKLSV0M8hjva4FLzmrI4/w1v1hqkF/oDnLBLgoI8g4D8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKkCPFa4pzpfzKbbz3YgL7Xlp/A9xi/G2NwMw10eKJ4=;
 b=pYGQVmAeeBakdHn2yPFk/jNWDJVG0r96cFv3nPArjZz9417SIfnL27NcZcjsg1dHopfee2nkD6eCLkTvJYGqJOhbncV/rXkmrn4AJq6AFPfqiACGVq0k5xNhAUweV+eRysrUAxmN+FqWmv+NkK15WOqmUtgFc+OulesrmsqZQeizMlehfmW4TpJjBF0w85sX9KM5PCvSdiQiO2xnSUmP/4tJ5j+QBg4jw4Ob7AUyEZH8BZQi7tfzvd0XopgxAZiCj9/+aVpOuZK3dn+wyCMeIR9WfbcxlrwZdiQc3xeuh+2dTcpkFrzRUxqegM/lOxnw4ej46Yv3OJd4XqTS1lkNLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKkCPFa4pzpfzKbbz3YgL7Xlp/A9xi/G2NwMw10eKJ4=;
 b=Af5UJ4/lTZYARCjTPcCzpeQGcjBIZIravSgpZBTOD/4a1n2J+PRkxrxTlXqnP7S2Z/tfGJU2OD9/1q6Yq/CqNugirQKXElAbqlZFc97jTOehcCptolGIXcr0HMQ8fd+R7EgvUXPj9XQbk7gFeaTNg7uUmOYij6mH1Xbe8zBDep4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/3] ppc/nospec: Make nospec helpers always_inline
Date: Wed, 7 Oct 2026 16:31:08 +0200
Message-ID: <20261007143117.757375-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007143117.757375-1-alejandro.garciavallejo@amd.com>
References: <20261007143117.757375-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|MN0PR12MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: dba2cd52-5ef7-40e6-6fe4-08df247fb342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HA2TXq1CorMIYHJdFkgqCFzPy9ynOyUM2RpodXi59GyWHW2sWwTxh3UpcE5z8laNQ6tBV10dmr60AmKIPCX2xNCMhdyo0a5t8HyCrT/gb2yy++BfnYUiA+drABmmBJhLM1+xQBz6dUhchVSYmkq6mtFNwDIW90j9QJubB97t+BfUVLX+HInl1dAWe//tDf6CVl8Awv0k/tuY5+mCjlCaFetc1vFxTZ2MSEdOyHdSksAvc54rJJEtiZ9K6shZUIHxyGvWaMDPUtmpOid4Oqgu1YRmHxssl9g01Pp8O/7OntHzc+hqPTatiPoaeP0yaBLNBI7ty8YFWHw4WymGnoMjWcMyDwvSIKzaGqbAnbCUS9Ge6bl5q8KokAR/aPL8XBTuFgL389tbZfCbTv1Sbf20SkUX/ahM0CmjRGCi06J58R3qYPTIjmN3o9qxblEvjclBB0aahSNTpmrTmouEg6xAETfd7N396lWA+a6q0RjXWzeFgjjS2MiwWbMdP9JuwYB5rasyOHIZ0sLVi9RBlpOP8A2XECBmfXl8Z0/OLIc8yLgcCP5FJQsQa28ppyP1P+EHC/JD1HmjbRg1XvOW/D4pYSLyF0byMsAUMEOT9ObetXlMt2SWeSqcri6t5OYO8O3wS0M1gTuWVLqqBpOsTgbVC+QAA7YtSQJr33wLuolYZhky9bvVqI+KPvDDgitXan7f0wnioWSeGqqEscXhIHjupA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lKu+WthuaU5ZdXk9V8/a5JxlRIAUZWAj35dOe5iBj2mhEEvdnn+cRI8qpZ8MLOTKe8VC14/Pd7dz/iN4tFjYya/r8fMOS21K39Be2x9rESTLdiEfCku5gm/fLGoLITYpxVY6KFEnddtf5sJQR1Dug+lV4nbmKfH6fI4daI+OckFDNJT/04QrDq3SgoHo6bmwwDQlc0fw0oFF79Lpaeh8ovfLc7Rd2WchpGMbFSSXEvoyObB6N3OKvNHkTU6H17r5FXx5GuNQvN7pERiSgzkuwPv3AMy3uQ0i/RGGhOS6i/3bsmHb5m0chd9iBP4hMeaX4EoAZ5qLDgohRx8uNMAGdywxFJ9uK02c2U7/rseUfkIi9u3co94fScXsYZh2MDsrmvhd2f8T+Rg2w3SBBWHr/3eModafJWKnTSHHE6aJziOjXPE/se4F1pAsiBR/d1PP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 14:31:39.6430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dba2cd52-5ef7-40e6-6fe4-08df247fb342
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5931
X-purgate-ID: tlsNG-4011c0/1791383509-5ABD8CFC-170FAD37/0/0
X-purgate-type: clean
X-purgate-size: 899

While today they don't implement fencing in a way that would block
speculation, once/if they do they'll absolutely need to be inlined, even
if -fno-inline is passed.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/ppc/include/asm/nospec.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/ppc/include/asm/nospec.h b/xen/arch/ppc/include/asm/nospec.h
index b97322e48d..647800b123 100644
--- a/xen/arch/ppc/include/asm/nospec.h
+++ b/xen/arch/ppc/include/asm/nospec.h
@@ -3,12 +3,12 @@
 #ifndef __ASM_PPC_NOSPEC_H__
 #define __ASM_PPC_NOSPEC_H__
 
-static inline bool evaluate_nospec(bool condition)
+static always_inline bool evaluate_nospec(bool condition)
 {
     return condition;
 }
 
-static inline void block_speculation(void)
+static always_inline void block_speculation(void)
 {
 }
 
-- 
2.43.0


