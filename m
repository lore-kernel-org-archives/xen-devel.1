Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB816C55174
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 02:16:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384127.1627210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrneI-0008F2-Sp; Thu, 06 Aug 2026 02:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384127.1627210; Thu, 06 Aug 2026 02:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrneI-0008Ev-Ot; Thu, 06 Aug 2026 02:15:58 +0000
Received: by outflank-mailman (input) for mailman id 1384127;
 Thu, 06 Aug 2026 02:15:58 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wrneI-000822-3J
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 02:15:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrneG-00GdGF-WF
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 04:15:57 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a73ee52-5cb7-0a2a0a5109dd-0a2a4505ebc2-2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 04:15:56 +0200
Received: from [40.107.208.28]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a73ee5a-4cb1-0a2a45050019-286bd01c69af-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 04:15:56 +0200
Received: from SJ0PR03CA0345.namprd03.prod.outlook.com (2603:10b6:a03:39c::20)
 by CY8PR12MB7099.namprd12.prod.outlook.com (2603:10b6:930:61::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 02:15:51 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:39c:cafe::8d) by SJ0PR03CA0345.outlook.office365.com
 (2603:10b6:a03:39c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Thu, 6
 Aug 2026 02:15:51 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Thu, 6 Aug 2026 02:15:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 21:15:50 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 5 Aug 2026 21:15:48 -0500
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
 b=xdo5L35LXODd09otAaJlr+S+QtR0J72oZRMdNbQdDuDizhVzbujhnl0H8/kAhYbT3RyEzipFdT38oEwZA5G9BylqSh/HQkoA9zarHkJJoO8v6v1A5cdYwNb0BepxmIQJbFnbDhH/WoR/XoQXUKvHCgxH8JI0JPnkJ45UMjoUqJB8TI0pCwyyesUPricqPqpLl4GN4C8Uk0kZFBEta3xVptQls+jddGyHhHt0RssKRaMGqGkt9aRNTzPzgDaqWVS4ZojxGmfPPRP+1rXcFoqEVuOeNwk1ZCzCNnPFlN6aK100iuTJ26cRXAKqsLLZ88IbmMWVBDcjw/KBY76fDSup7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXAvQeolZboNEWTS4fZrLvWfW/st6wbkjRYk4ih4T68=;
 b=QxV8HxKd4NbZjW/gd1JgFD60eTICMpYstSXbzZpr9eYvXP1gvpTi0CYnUL/ena2thrZ5i74C2m5KwE4KnUTxLkjpmQnkWI7wMITxhWJnFW2UdQ60K/W0aMUqq7MaVYNHQk7TDZ969fLZZdDN08CTexCO7L82w8UbZNh5b5hlnzVDPNVeHxLd6T5V3pek9A9JzxNJFJm3zPOeWr9KEwL/3YsO46SbNtNG2w6Y8kvaqR1AoRgb9HyJH0IXIVZh0LcxcqKU8uBTyv782gglVpF1tdg5m+dILId0Rwvp9jfucSa0cxC3oga5bIVu7ODySeG174FDalpXVBHz3D16P+xdfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXAvQeolZboNEWTS4fZrLvWfW/st6wbkjRYk4ih4T68=;
 b=pqryTsKuQaSM60OUjRqZR+vZ6Cj/CbqsgcGWs5tTeMFvDsYqVWlxLPzaTO1Ysq07c8h9sIK7v3xEFs//FnjJP548g7WRvZCc38u35KTctMWtY0sg0MjFiMvK1UdA8yix5B5edq7smNLcRlpsJ5q9pfNwKXROp2WAIXIqbkVKUc8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jane Malalane
	<jane.malalane@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] xen/events: Fix xen_set_upcall_vector stub
Date: Wed, 5 Aug 2026 21:52:30 -0400
Message-ID: <20260806015233.202486-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806015233.202486-1-jason.andryuk@amd.com>
References: <20260806015233.202486-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|CY8PR12MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d62d85c-85e0-4988-5a79-08def360a32f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|11063799006|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	g+6irZcPPMyS5Z+fpScCudS5BQHP0IvueDRiFeFmCcr7kMfd77p/dz/COJ9n0EAEYE+zNspkroz6u+Cln13AHl1XhtODFA9yD1DlsEUU76VUuEXG5F8kkU9TRTzL0N6sISXpVwhNhJMdvYEHXOqAmd7m6A0UEiReomyNyz11XGHJ+pfLQr4kour9Aexqy/d2NOhWsPYCQ5+MUs5k4PW4f2GJmwddn9BswEyNZ8suCpl+NnOZzndFE4pzjwGvK5s3cujMj1+KtuHKi5cKmD80O6z2KPGNtGuKnZwpof61anHWH5CrTjYk219+iNDcEAyVSHfArQvv72zBBIYnmK1x7RcSQxxStG23LOBCCU57u6XSdzHaTmPz1hSrFPdMs9xGAotF6H+IqcUpTF+4sI8Z1Nr/diEc40nBDQqzfYkTkYvCUMHJ3v0h2TBfoqsr5jaeF5qhxWE/iMH3xTB31h5Q1OOSif6hpzoUCoTWP/j0FebzocZfsfXC+9OPqrHNnL5X2MDucvqPGwiam0BVQSDptNLY0jI3ME7mV8EkRhgsYHzjOAejf0/JdZq8+diGTr8BUyHNmzq6+goBlgN1sU1eP/JPYbZGAn3cyzISPXneYgMn1yiT230SfHD4eQVAOhxNq5UOrmL6/gCEex0MuqdZ6aTDC7FbNG1POE73QkWTPjzvNJSNuvcIIdOw5tRzBKkVs+xLPOOaFKm0XD/mS4fOMw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(11063799006)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ukc4V5iWWvD3oEDitPOUcApowXWrjpelPreuhinvzvw/Tx144JsAG0B486Vw74JwbOrzhI3m0AvWdSWxI0BnU94uMkMXg/5hUKffn/1pPFXJvBI05g8PShZQayE7U5UN/e6xHUFBCPd+8Dx4QFN9CH9XGUjhb9SEAFWq1rzG1GflsM8kb9CAZsSvFPrRb0caBj1gMRMJnalgxjQGR5xvMmUE05qHXASVF+FZgrLRz487XDCO3DrxG6d+Ny1cwz2yGHEH8upTLs908DNsnJiqU8Y7GR0p2vzQSFHkW5n8qnw32xk+UbcbLxKFvZQtRe/+gHf++VvYcQcXqhfSFtTdXyz3Kl/9YsTkrrNsHirNKNKRK3Fn4KMLuZaeJe/2C+O4tYZcCLLZxKMqGYSMSdBd1RhBlENiqCmAzsq0RJUvbQMda5rH85jrNVfODMxicd11
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 02:15:51.2124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d62d85c-85e0-4988-5a79-08def360a32f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7099
X-purgate-ID: tlsNG-c201ff/1785982556-F6EB12A1-C7B14472/0/0
X-purgate-type: clean
X-purgate-size: 1100

Building the xen_set_upcall_vector stub fails with
error: control reaches end of non-void function.

Return -EINVAL, which matches the hypercall's return for a non-HVM
domain.

This is needed to allow disabling CONFIG_XEN_PVHVM.

Fixes: b1c3497e604d ("x86/xen: Add support for HVMOP_set_evtchn_upcall_vector")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 drivers/xen/events/events_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 6ea945508a89..3a5ae96e73cc 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -2245,7 +2245,7 @@ static __init void xen_alloc_callback_vector(void)
 #else
 void xen_setup_callback_vector(void) {}
 static inline void xen_init_setup_upcall_vector(void) {}
-int xen_set_upcall_vector(unsigned int cpu) {}
+int xen_set_upcall_vector(unsigned int cpu) { return -EINVAL; }
 static inline void xen_alloc_callback_vector(void) {}
 #endif /* CONFIG_XEN_PVHVM */
 #endif /* CONFIG_X86 */
-- 
2.55.0


