Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42633606A32C
	for <xen-devel@archiver.kernel.org>; Sat,  7 Nov 2026 02:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ajKEc884
Received: from list by lists.xenproject.org with outflank-mailman.1477742.1683057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPVxU-0005so-T5; Sat, 07 Nov 2026 02:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477742.1683057; Sat, 07 Nov 2026 02:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPVxU-0005sf-PI; Sat, 07 Nov 2026 02:15:08 +0000
Received: by outflank-mailman (input) for mailman id 1477742;
 Sat, 07 Nov 2026 02:15:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xPVxU-0005sF-8e
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 02:15:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPVxT-001QTj-Lh
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 03:15:07 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aee8933-8faa-0a2a0a5109dd-0a2a4505dc0a-40
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 03:15:07 +0100
Received: from [52.101.43.31]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aee89a9-4cb1-0a2a45050019-34652b1f4637-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 03:15:07 +0100
Received: from SJ0PR05CA0165.namprd05.prod.outlook.com (2603:10b6:a03:339::20)
 by DM6PR12MB4436.namprd12.prod.outlook.com (2603:10b6:5:2a3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 02:15:00 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::8f) by SJ0PR05CA0165.outlook.office365.com
 (2603:10b6:a03:339::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Sat, 7
 Nov 2026 02:15:00 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 02:14:59 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 20:14:57 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 20:14:57 -0600
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Fri, 6 Nov 2026 20:14:55 -0600
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
 b=ulcB5grcaFFaufz3atQ9iE43Ola6RpZVjOGIRYzGopp8zbf/3kAyJ7f0pB0C9ZYenHg01WDJUiO7jgGZGWF2dLynZdRGha0UkF5/u3jCaEtZm7G7wOTIH2eWlkNQ5Cprbg4sjjiembPFazLkCooeutZq7qZbKo3z+n5ewaasBN71t82QFoQ0M1C8f7WT6cZ/RH8Ns8U4hU+OH7it8kTsP/VjJd2wiV26VSGKqW2+aEiK3z8u1HiLISZwbJqPAdFg6bhDjux4g+G+KtRuLR5EgCoa99HDLMT3r1TiUdJLembxp8vGcr18JDFGcPzV+iM/OO6dHXXQSkUVVfJK0WnSdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXWPjtC47JOAhS/1FwfOO4rezzkfX6QRL375FvELi68=;
 b=bSOdAoVNuvLZiHcFjbTA4MTP/a7KvijdArzwm7O7+++yJSdI7Y6BA9+eh4diFFx6okB6QSkCi3FuNINj4bk+/CMBodbhtJAxg8wXlBjLflFW8JldEZQFxc9PNFrkWPfXwcBoDgrEqVETKSxQpjUYOKIfdk1tUvFf6LkxBLh3oO+ZCQi9+6b1ceQwVhVW41IAC4gzopsnI1R4Lt9kPyKGZ7ybw98qg65IR+FocnAYL8qnYfbqoLphqfEK3fucUtBoI3Qw5DVZltChlI1recTGRTqYbosH6sd6NQc8xewmLf/rJ4nao/FmEAyXu0X3PLLg6VkgOyW2eCbI5ZY7Uq+t+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXWPjtC47JOAhS/1FwfOO4rezzkfX6QRL375FvELi68=;
 b=ajKEc884d/TlpAP06STh/oS4OGhfVcMvTBUKxMnOQgJzQqvqkF8rJSOQHYi8n6PGlUavjb3aLHNth38rIIPCvm2S2S4A6z8XGupp0GgDrlJWRvUlv9BlS1y2p8FLDBy18/OUOAwAKKKaBUMtja2ewCCRfta76audjGsVpxyRTcs=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/4] xen/arm: traps: enter the SP_EL0 vector group for an exception at EL1t
Date: Fri, 6 Nov 2026 18:14:40 -0800
Message-ID: <20261107021442.253612-3-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107021442.253612-1-stefano.stabellini@amd.com>
References: <20261107021442.253612-1-stefano.stabellini@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|DM6PR12MB4436:EE_
X-MS-Office365-Filtering-Correlation-Id: 92508245-c160-41dd-7c0e-08df3c74ece6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|22082099003|18002099003|10067099003|56012099006|11063799006|261102123227099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	3g+lZ1rMbAz8rz4Uv85s6oFFsmxAHVb+7YVkSoO+RMqy66FbufMCDX8lVrhnPA06+Ys7x222oHwvKGrzF1hUZ1gwlYzqz6L6+BNeDsQW0EmTIfnTNHk6eS5wTxjhzNF4rM3CpqosRQg2QufxKbFDXn2Al7PCKuYJn8iC5QARlJMTLHa3E5IKzHTakOrCpQvLHWaPzU1hI9elZA7LND8zVfR7DQYikGuM2OsVCYFMFRqgL06UiC2mmayA6RO0jKelMYaZlvJECmQnnqZAYGDbNYa1UjgKB9h+wnrbfxytLr436ye3A7S2xbC5d5WAWfs3ABDaABajn1OCfJHqxdLQHOa3B5guS9kpJjbmJW/j9o1zgfKLwueKEkVe0Sl3SEQIHZLGRkoW7l4X/vXf70AJytkcb9LlidOX4+duh7MztAejvYwWVMbtPEn8H2asTe5hidaeqoGCZ7on7XuL78VueDH1Zr1BC8gl1PoJrtGX2Zq52sII52xO/mkwhA/Dcf9ePCEjcGKMl6F2yUEj/d0ljjvuimUzhTwYNQRYGtWuXyW+Vogr6hOLjuWxCuEgMuQY3jlZf6KgqUtPFOzg5HAkEpOu2aHbmjispC2cpJBRM/r3jyi4cZ6hsPMrFepZikEj8OdPUjeFAxMV2Dl9DD+ELeYXGsEGawtZZDXWaMzroeEQvnsElmmGW5HZtSjl8wzlp7q6dzQLmjwFXDGQzprOaQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2wKGIbSOaat3HFxmp4ulDqiejR1iOyS6I38QK96A0uBvP9kIbyTDPfzEgkKQbNgydEDv+Imvowhc2RBGAUu04NArT8BPNKocmOKEVv+peT0Gaqm/rgTM7CoQIHRjQZe7XaOlS5dL+HFhVDOx8XdYce/+y0Of+7VLio1XFUdxxqaK8sCK8U+SAHSrgK+DOJ+7egia8Nawl1mNXCpuYqlITzcOVJX27ZsClIJW/03gioaNzRBABsWkwXm790Aeb78sLOOZn1r2nFIseQjc4gOuElgcqvX26pr48EMpHyhZYUGx0g1U+eHDRWDB53scwGGJE/A+8CxLC92V6csMFf2jBr9KPorRdoqsSmjFl4wKrrLhE/f9hZ7OTSRViYDa1kvKuCQSGooVq9DzMpJ2MBtFWpA5E9WTYJfHoLpkh9G3mQNbO1PN9mjmgo439+6hBz6d
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 02:14:59.7038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92508245-c160-41dd-7c0e-08df3c74ece6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4436
X-purgate-ID: tlsNG-c201ff/1794017707-F48A62A1-F3819588/0/0
X-purgate-type: clean
X-purgate-size: 1401
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An exception taken from the current level is delivered to the SP_EL0
vector group (offset 0x000) when the guest was at EL1t, and to the
SP_ELx group (0x200) only at EL1h (ARM DDI 0487A.k D1.10.2, Table
D1-7). exception_handler64() used 0x200 for both.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
---
 xen/arch/arm/traps.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 6a5dcef2aa..f6abe25f74 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -532,7 +532,13 @@ static vaddr_t exception_handler64(struct cpu_user_regs *regs, vaddr_t offset)
         base += VECTOR64_LOWER32_BASE;
     else if ( psr_mode(regs->cpsr,PSR_MODE_EL0t) )
         base += VECTOR64_LOWER64_BASE;
-    else /* Otherwise must be from kernel mode */
+    /*
+     * Otherwise must be from kernel mode. The current EL group is chosen by
+     * the stack pointer in use (ARM DDI 0487A.k D1.10.2, Table D1-7).
+     */
+    else if ( psr_mode(regs->cpsr,PSR_MODE_EL1t) )
+        base += VECTOR64_CURRENT_SP0_BASE;
+    else
         base += VECTOR64_CURRENT_SPx_BASE;
 
     return base + offset;
-- 
2.43.0


