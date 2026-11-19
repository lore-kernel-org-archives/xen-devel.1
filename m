Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635E8606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 22:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MrImc79S
Received: from list by lists.xenproject.org with outflank-mailman.1497489.1695795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUAB5-0002s5-OW; Thu, 19 Nov 2026 22:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497489.1695795; Thu, 19 Nov 2026 22:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUAB5-0002rn-Kr; Thu, 19 Nov 2026 22:00:23 +0000
Received: by outflank-mailman (input) for mailman id 1497489;
 Thu, 19 Nov 2026 22:00:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xUAB4-0002fO-DK
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 22:00:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUAB3-008TYA-QJ
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 23:00:21 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aff716a-8faa-0a2a0a5109dd-0a2a450be9ce-8
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 23:00:21 +0100
Received: from [52.101.85.6]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6aff7173-b7e8-0a2a450b0019-346555060cf9-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 23:00:21 +0100
Received: from PH7P221CA0081.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::33)
 by PH7PR12MB7377.namprd12.prod.outlook.com (2603:10b6:510:20c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 22:00:14 +0000
Received: from PH3PEPF00059618.namprd05.prod.outlook.com
 (2603:10b6:510:328:cafe::52) by PH7P221CA0081.outlook.office365.com
 (2603:10b6:510:328::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.10 via Frontend Transport; Thu,
 19 Nov 2026 22:00:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF00059618.mail.protection.outlook.com (10.167.243.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 22:00:13 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 16:00:08 -0600
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.57 via Frontend Transport;
 Thu, 19 Nov 2026 16:00:08 -0600
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
 b=UOohB+t4Ce+LjSS72BAfvXSroxs54r43gv+tWWjEzgkx/MoKzZlJjohiP7GpCVIYl47iR0NIEZFZE9zlGIwKOrgX+Y2hsqU2PIvfarCuKvq/NrwKKPxpjUI0dILsGHhOVt2acKdnhEBDK1BWev5G1JJ7RT13fwdFEVMWk0X3/pZHBD5y/tUM/4/3IrDFJpkN+TCUVPzVInL1dF3ffWnN/YN0K1LR9KuCf70A8fh/liwykGHiSXRRgRN7o2Uc/vNCB9W+or0vAAbaZYC3QzzxlRTlR8cgcSNbf3iVledVw3raYNt+ooW5LPc10pPhoJiKYDBtA8v7jKsn1hGjViWWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ay71OTXEc2b2PcH81duJHY+HzzXE2LrrUJCJt2DtFNA=;
 b=N//ANvN1fvfc63cnhjhwAraeEN/BznaH8fkiZOzKeS9dZ/B3Zx6K/q3Pt1xzMJRMe2gu9tT2V0xmLzM9irJlZA/GHerdcv+EInLnCtR5ZVvnwVDFeYz2HzpbYzyL6uZw+QsS7I5D2CCjwSXeFsCfeYAGWvXlKfH/p5iQTTAx5bhDqdKw18qE868yoOYfqPcbEfUEtgXvpEhcSUcP+Pd93Bjzs0qpg0MhgdH9qKPytcf5mUpMyfV6SxjuNo49qW7w9kxagq1KCAqPx2Y4/gwMJPcujLKxy0Nt3h45R9MYrVgpWtbuTpCYAkNW3dM4bXSr9JPTPkOjs0gUoCrZu1SXXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ay71OTXEc2b2PcH81duJHY+HzzXE2LrrUJCJt2DtFNA=;
 b=MrImc79SRMloK2FUSwPQoLu2b6G9iAC9ZugTNOUGlZMk2rI6CSvrGZ78lMeTFf3KJN9wB8owUkpJaUGbGw6pQK3BRauwrOmKTpkX7w8HKArSSu2Skhe5K9oNFS8n6PZYv9wnCbHRKjgE/+jvaXmBuu13I6htwmswTUg/+YS2OJM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 1/2] x86/vlapic: size the all-ones broadcast by the sender's mode
Date: Thu, 19 Nov 2026 14:00:01 -0800
Message-ID: <20261119220003.38517-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF00059618:EE_|PH7PR12MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b69949d-d3c5-42ba-d40f-08df46887cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|18002099003|261009223027099003|13003099007|11063799006|261026121527099003|261026140227099003|56012099006|261022105027099003|261021121427099003|261021123027099003|261028144727099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	s8OE3pieYvEjIbFDiNXmzMHPIqcmeJ9k3c82a+bBIZpCR36iKkNuFdC41IZ6Jc3VpI69vkno6Wqaodi8GsB5f9mTizEv042t6pJROivwOpcF8MiACIgGHvwgedrM5PX1JjDy+vqS6EhPb+Z7fkI6J74K68qXfeIp2tmfFSTF37gsiakFQ0tmMbdE0iV0JjYQ2HkjJLGQwbryG1qtjxYyRgR5mYq6HAd+DYjP2ujHrJE17P/ixXO8KIoGHnAhbBfZlaQ/EJX14R3xcIQCoRi50yKwjpVj8ACWaE/g/YBrl7R5XTmXPSMeflpICdrRG20Z2qv1E6ghwBkvNviQMlrGuygcZq9fZ+0UV/FOvty43t3yVjVs5JI9JAegXFs9eKeE+b1s4mPnumqH1K/cE8jSBoNDOdmmUnXzF8oUwYn5ia8SmG7jiGtfg4du7czWDNxUzugruP+CKVffz//Nc7xDB/VfvHPc9rVvjsSX1tIwiT7uoMZSm3IxyKutvENUZPjeDik7gvFuhli/IWuncLqH73VuJKi9VUyGtU6sbcic2xea94hjrIJdq/+kD6+Vmg0WVDJ7Z6FsLy/iiTLFJW1kkSfOI/EDMmPf/uQm5CFEDHrvDRRkGz38M9r3BEoptDJZ59pLd97OTeDuD+l0geR9h0d/YxlCF+9b7mxSq6hH/Zo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(18002099003)(261009223027099003)(13003099007)(11063799006)(261026121527099003)(261026140227099003)(56012099006)(261022105027099003)(261021121427099003)(261021123027099003)(261028144727099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8RK16OVTdLiYn4Lc7dGJD4f13SJtdntBrU768gSAP+Txe0C0LWdB2Aj1rXe4jRLWQafrxCtnnCeHSx6zBPOuKHGr3qwTdzp95+ofpiBcNlgr0O1gwStkpf8/5satImuwz8dBOHew0xBnDr//3x/pK5D/2ohJDvWfAaHV8ckS8uUzpOzOMCf9dcsrCsqs9l/ZuZujV51DD6aQ6O7uqhB9Y1wZ17dIWkWmtUVxuGNvq0ps7KxqTgLCE0yzeBGpxo98Cz/Z0qLwlxdy2ReFnnkqf/VJ7r77v8LeWydXA8RoiY41Y1ucF06zLFJX46nmagC5t0IKe7FAm9DzYDdnDq9o/5xA1JJMDwBf5v/Zn9zzwCnBtq0QHLAwYLt1X/9w3BCMuvFVUTonYg5EUBFKXjud2EEwED6UalTTj43n+LiM1FC6hFqkM/W7x6b24B+t1Mmb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 22:00:13.1393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b69949d-d3c5-42ba-d40f-08df46887cc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF00059618.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7377
X-purgate-ID: tlsNG-42698a/1795125621-A9EC69EA-ACFDBC72/10/78276251493
X-purgate-type: spam
X-purgate-size: 1815
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vlapic_match_dest() detects a broadcast by comparing the destination
with all ones in the target's mode, but an IPI's destination has the
width of the sender's mode.

Use the sender's mode when there is one, as is_multicast_dest() does:
whether a destination is a broadcast is decided by the sender. vIO-APIC
and MSI destinations have no sender and are still compared in the
target's mode.

Fixes: 82d29b97d013 ("x86/vlapic: accept a logical destination of all ones as a broadcast")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Link: https://lore.kernel.org/xen-devel/95e0e0fb-2978-4c87-b723-fb7c30f36883@citrix.com/
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

 xen/arch/x86/hvm/vlapic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 50b515d254..b7861bd2ba 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -247,8 +247,12 @@ bool vlapic_match_dest(
     switch ( short_hand )
     {
     case APIC_DEST_NOSHORT:
-        /* All ones is a broadcast in either destination mode. */
-        if ( dest == _VLAPIC_ID(target, 0xffffffffU) )
+        /*
+         * All ones is a broadcast in either destination mode.  An IPI's
+         * destination has the width of its sender's mode; IO-APIC and MSI
+         * destinations are compared in the target's.
+         */
+        if ( dest == _VLAPIC_ID(source ?: target, 0xffffffffU) )
             return true;
         if ( dest_mode )
             return vlapic_match_logical_addr(target, dest);
-- 
2.47.3


