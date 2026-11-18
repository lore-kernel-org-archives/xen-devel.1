Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEA1606A325
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 17:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=V95IQ3UT
Received: from list by lists.xenproject.org with outflank-mailman.1494908.1694135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjIY-0001Hk-Pt; Wed, 18 Nov 2026 17:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494908.1694135; Wed, 18 Nov 2026 17:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjIY-0001Hd-My; Wed, 18 Nov 2026 17:18:18 +0000
Received: by outflank-mailman (input) for mailman id 1494908;
 Wed, 18 Nov 2026 17:18:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xTjIX-0001HX-L1
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 17:18:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTjIX-00279j-1J
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 18:18:17 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6afdddc9-8faa-0a2a0a5109dd-0a2a450c9aee-16
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:18:16 +0100
Received: from [52.101.53.53]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6afdddd7-f479-0a2a450c0019-346535356642-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:18:16 +0100
Received: from SJ0PR05CA0037.namprd05.prod.outlook.com (2603:10b6:a03:33f::12)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 17:18:13 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::77) by SJ0PR05CA0037.outlook.office365.com
 (2603:10b6:a03:33f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.7 via Frontend Transport; Wed, 18
 Nov 2026 17:18:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 17:18:12 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 11:18:10 -0600
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
 b=PHGipCn1CUBqM4NHPCkH8zOLAc/9kKjJlbk/yEvlA/J5GSVuEwzVEGGhDitDmNQJXbg9l/qIRTO9hEBvdh7CSUMR3pZejY9YORrZ29VSJips/+84GykPhHHg7VSDM1t4rnlS3C3U7Rgye1oZ0xA6qCj779yjCLgNKOCdowygyDHz8qarjgEAnzu8qWHKtpiCDNMWSPaLw85+eZNwIVQ2MhEZ9I5YCUKY8+EnqcsaHo7ljxqi0T2mK7mFHLy0Jmb85TfwbZWbhmFA4kx7ZZqFzt+S8c8EgJ3lRO35qwzblknIg9r+BV07POJRN7KS0i4dMvHNbIMHWRWNkW4S+jlu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhCxaoYFdF/YkecV/5jll5MbBTtNX16YZDf7YohbE2k=;
 b=bT1qS1YFYSbOmwMiY5NEP7zlNcaKsftEFZUZUrA23Sym7CaSQrUTmUjg/2bE2T8HzLaRBgmG6FQF0Zz/UtgDNu01TVdzP1Q6cSo1wTwLyzxx3nOMuWRzFAnu/9mLMCXbPu/xFfIFEkoOhtKa8lJjtEJeTW2SZmJJoss15yvNQPrQ7OXoProaZT8/GANqgBlje4elKZHlTC0fqdCG+xcI3h/fhoypie3b6nfdWE7zLkU69MpQYBRPfGoivXH86A6YQDrCVeWrfL3Tl8vE9qV3rLi8aQDnZZo+DLN6Z7fRnR09oRGISBYt4b48afU58OYlX4qG9IEHGzr+gaIrq/T2ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhCxaoYFdF/YkecV/5jll5MbBTtNX16YZDf7YohbE2k=;
 b=V95IQ3UT3UbARivOlCJGHADs4uCmZEkOXWJdn3R2Ron6hvjNtw9rZbw4reoKtTbSuevIL/LvY2k4/ir5y3KOswyFSdH4eSpJltVjwASExJ2ekyh4yQgQW9ZW8YQd4ctM8riDsf2Xds+Gu6RBZ1jOrmxFIcdrlIDl7ffw/uqI6M0=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH 1/5] x86/cpu: Add break to early_cpu_init() switch
Date: Wed, 18 Nov 2026 18:17:52 +0100
Message-ID: <20261118171758.1125066-2-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118171758.1125066-1-alejandro.garciavallejo@amd.com>
References: <20261118171758.1125066-1-alejandro.garciavallejo@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: cd936ef1-666b-4595-4e07-08df4597ec96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|22082099003|18002099003|261009223027099003|11063799006|56012099006|261026121527099003|261102123227099003|10067099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	FC+47tbPCmtoSg4gPN0gcqVu176g/BAmCERTEnpp2QXLhmxSeoF0e66DRPdoTIDMggcfMOVhlt0sjTkUQ5q7EpmklYyUf3ii4f6Fibt8raqC2oPNUbXDOHN6E5XnJwwDJA4sDb2yMTJrqbr0zOhugwJMi4R21ncu47wyBmxczW8vtsHwZwgayFWdaHwy7roP9MdoQGtc0pYFCtWCJEMap2gsmFRWfqk2/tubALRUD5wAI+Num8ngHmkbr6jIe8FsCUQ1b2QBJdDpxYuvlAI/dkGbq7gspPYIPuQalnfvDwuk9GLJugd7c1Feh0t6DSUfBl0TM7Ea39M76cK6xPZwa/xTWYsvXGhu8Q3H2HTfXqnfcOHwxKN8WBuqXgJqdhQ6A7dm33+0Bcai2gQF/POh4+VA8CJb1u8/XIwgwwP7DPtYXPr99SScpA9kyR3hKkR96H6IiCOjvTEp6VPFgysq+wshLfAN1bvi0Z/w29ZBmOWX3ZcxqejrEtYMcYsQLkRWvREieOP3VzRuk5clyUTDJoazn/2lWm5/nQGenI/xggJbQGhGGVNEF1ScGgZVD6qxmw8asDyiDZdECVvT6mrP+mzOpOSp+mHOHVyRkOIXxemQg93qVVje3tfJRWjLdGWXLFWkoXqKjZzlqJ+JnPTAwmqol2WbB5HTMrbJnJ1lnB4IknthItHw8lnbPqNw+JIPdbCua3k3zB375vtc6Z/nZQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(10067099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/pGQQnXfkzdW71rtIIPv95XnsMxiQW1ZNl7OQTd80Liy5cHPYlF8uzmuv+pPg4ZwEqD+hDo3UxN8Q2dB3kldnHkyWXVm5CbIr8jAewjRP7sxo/YxZQzWkmuqeJ0/XDJfBUsAHGpN4uBPSXA/EkDRvNTd8IU+foGR5pnA5u6Nk9PF4rtyPH7UG6nRbd4w9BxKcZZUOK1Ii9L6WI8yxhiriW4dmaM627KjgQULhiRSDzmvuAud7731eELCBrOqEFCoNF0kkJ2/sRoXNu/eMKdT3uZDKxNQJLjQReSXRYxkoHRV3NNIp6vqojy53fM7Pknrrx/Dk2a+OEcjEvJwz045oi3y4JkvNKpI61qgG/EZ/+Dbm3HhFJbStbMohBSfVv5mpcasPLYFIPku0GOBHS+TzGoMToqAP21VyeaRMWyzTZgz+6ZUODYUgX5vZhEtyFSc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 17:18:12.0220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd936ef1-666b-4595-4e07-08df4597ec96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124
X-purgate-ID: tlsNG-d25034/1795022296-012C8A5B-356D36AD/0/0
X-purgate-type: clean
X-purgate-size: 700
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MISRA C Rule 16.3 requires every switch clause to be terminated by an
unconditional break statement.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpu/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 43785d19cc..54e3a02dd1 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -341,6 +341,7 @@ void __init early_cpu_init(bool verbose)
 		printk(XENLOG_ERR
 		       "Unrecognised or unsupported CPU vendor '%.12s'\n",
 		       c->x86_vendor_id);
+		break;
 	}
 
 	cpuid(0x00000001, &eax, &ebx, &ecx, &edx);
-- 
2.43.0


