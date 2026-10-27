Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E2F606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 19:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=A2+hv2fw
Received: from list by lists.xenproject.org with outflank-mailman.1462525.1673492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLmi0-0003Y0-Td; Tue, 27 Oct 2026 19:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1462525.1673492; Tue, 27 Oct 2026 19:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLmi0-0003Xt-Qv; Tue, 27 Oct 2026 19:19:44 +0000
Received: by outflank-mailman (input) for mailman id 1462525;
 Tue, 27 Oct 2026 19:19:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xLmhz-0003Xn-3D
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 19:19:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLmhy-00A8cT-GL
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 20:19:42 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ae0f924-2eae-0a2a0a5409dd-0a2a4506811a-38
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 20:19:41 +0100
Received: from [40.107.201.34]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ae0f94c-195a-0a2a45060019-286bc922ea2c-4
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 20:19:41 +0100
Received: from CH5PR04CA0012.namprd04.prod.outlook.com (2603:10b6:610:1f4::28)
 by IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 19:19:32 +0000
Received: from LV8PEPF0000005F.namprd02.prod.outlook.com
 (2603:10b6:610:1f4:cafe::6d) by CH5PR04CA0012.outlook.office365.com
 (2603:10b6:610:1f4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 19:19:31 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 LV8PEPF0000005F.mail.protection.outlook.com (10.167.245.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 19:19:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 14:19:31 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 27 Oct
 2026 14:19:31 -0500
Received: from amd.com (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Tue, 27 Oct 2026 14:19:30 -0500
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
 b=EVfF/vXqg1FUTwiaHYL6nYQXsL4vFljioTQ5XHYK1J1c1ibKoKCu7AZGhhFlyf0WPfrhtM1ODn0P8myeEcxv/eHQhUVSrHRxns4Gu0rm2Lmz+fdsOW8bt9AqrXqZkTJDxsW8SxjMRjEmSEzYANbt6p9ZeR/Ox3QxYUBYig1W2oIyIx2ltklrXIq3M2B8Z5pqqQ9pAcB8vlpyoRgU77faTMIpQrNdRcpDT5CQ1WOsco4uC/vbyjbmbS6l16gJDXTswygzhWaj6epFu45gpTMzcZrGWE04T3SHnDiqfu01uMGBKMKtM2FQbpiYdt63jFzJWKBchv6yHKItLpmqoIsD7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgLw99O5rK3mJ3/D1pRGmjU8Ajn00l6hs94fnBFb4cY=;
 b=AXrQK8ZNP9BheFIxWzfZaFlcD7qrVKyxw0zJNXtzehkPG6O6UON1ogBiLHc40JlPUpSeZkjnnUqEWS+cK4ffrEPnD5j5vA5yThc7JAVIlMtSMq8syCN0WrRateMlqjIMZpN8DBqylcS378wzW6HpB9V6hEk+Ik5DSV1M915sHlyhE3DmQcew7yY5BnPh+c6W4dJcweBJtSlCPbCAB6AeIONmoCadnPPK+cldc1/7xKkL6ELlFG2dBwYiW3ztoyUJh9LFMwqD4XqS8EAFvbcqeo6ZqXadSZ8kYZfYjI2eb1N+eROSO9XX36A70i9vrQJ047zkMAuVt3deJ39+JB7R1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgLw99O5rK3mJ3/D1pRGmjU8Ajn00l6hs94fnBFb4cY=;
 b=A2+hv2fwXcZLjcs+yw90nfEHwvhJZ2WMp3xJw04XD5GDyIh21BxV8ojlomkmA0z7qC2+zc1igmWjnfclSH+ERCQXAvf3JHzLm3Ycvj5aIud7PaULUzKERp6yrcCgq1NY5ZiyvYkbJqihc1BI9AiDrNC/z0Ju/157P46BVPG2Scc=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger@xenproject.org>,
	<teddy.astie@vates.tech>, <jason.andryuk@amd.com>, <roger.pau@amd.com>
Subject: [PATCH v2] x86/mcheck: keep the banks past the end of the CMCI map polled
Date: Tue, 27 Oct 2026 12:19:24 -0700
Message-ID: <20261027191924.1844282-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027001315.2614976-1-stefano.stabellini@amd.com>
References: <20261027001315.2614976-1-stefano.stabellini@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005F:EE_|IA1PR12MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: c7df3a36-25fd-4f66-ea55-08df345f3a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|11063799006|56012099006|261021121427099003|261022105027099003|261021123027099003|261009223027099003|10067099003|22082099003|18002099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	QgO8qOF4/H71ZgNjWPA0ltVR5jcSv/UUbF4tCFcoNidIIcUDgLWZ4GeCN+4bPN/y5QpCxaAFj2DMTWJ9DUDUQ7brlZw6eULbXusthhqWBfRQ3yL4A+PsJ2rRThstIxIwAQerL1vQ+/09Yp5rk3DPLeRRSOIKAeyRq9EbtqPIJ6yefuWCYb6RmAbYOnPsGE7Ptj6Whq0+6zp9Q4ZKw1NMdsWVf2Yg9qd+AXmilhm6FV3t0sxs/omWrw2LKUafRSqeBDrVl0TKERxRE5mnuwb2spqR361rvWnmmzKRlK4uPgzMpaiy7j39+1H+bK7SXIMD3xw8HqjvHJ8MaJKz7kuMhk9HVJoY4JAR1e1AtGJS6tCmAp1dQmzW0C+bI6EkZXR0CMKm7rW8BX+JptV7r5/ZMuxXQhvsmmQFIillJviKeWDXMaKxuJ4/RNi/VE0hr8MYMcTMZofNpZP9NJhprsd0a/H295pFLPr4lI2lpK46WaqW7Qr1PTJhqxb/+vI2X78Gbh+HfoUZo0zwTOf+687WYG7KDWrX/ed9dbBAV5yT8puj+UA2KYvaUJQdwFSH6uMZfC4HZ23C25nxmYaJ8pvpMu6KzKdaiylmSqkh0/nd9XEq4oKXV9x4sFHy4fL6JagbL1Ok9VjdCzo9AXxpqy/vunLBbK73wo9tnVnP9j6eTI+nyTgOl5DhMEQlzsDrs4VQ7J7/e0ViqEzndSdoa9f/+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261021123027099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vo1E8RZ6/kL56FLQq3E9/1F7cElWua84OJcMHpjNgt5wJBPoIhhkvjrCxe23oh3r6HfIs4BTZsA95/Nzbz5tFK/XhbtmJXEB9S+OcncedAfiRGDGzwCcsa9nX75F/v54ZiovkVw/B2Y1DPlKkWAbwh8W060MCKfPmxXbDe2cy88hOabIoPeVGEK2WihosqxxYVLt7frtMHhX5Ymsl2jkD7pwRka02K026UBb8mey31VHcYTbqcr1lmrfcPRPBOB1cXZgCgWCYbvrwD71UnIArBeGr82YT53E78oA/kYmawaFiCpxSvprDcgGY8WQFBOAyiHsXvL79qN1qYkW41MPsY/wz3p8Uk2+Srzpykrhflz7S8E8Mgqicy2oYCOc9YKp02E3IWqGzTdVSgSnR+mvcvdPplZ7dsgVAiWvNrdrKx2xKY8MS8Is++lWPvvWSSLH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 19:19:31.5869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7df3a36-25fd-4f66-ea55-08df345f3a68
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312
X-purgate-ID: tlsNG-16d1c6/1793128781-F7ACA77B-ED7B0BEB/0/0
X-purgate-type: clean
X-purgate-size: 1565
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

bitmap_copy() copies whole words, so in set_poll_bankmask() it may clear
banks past the end of the CMCI map that bitmap_fill() may just have set,
leaving them neither polled nor reported by CMCI.  Set those bits after
the copy instead.

Fixes: 560cf418c845 ("x86/mcheck: allow varying bank counts per CPU")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Acked-by: Roger Pau Monné <roger.pau@amd.com>
---
v2:
- reword the commit message as suggested by Jan
---
 xen/arch/x86/cpu/mcheck/mce.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 1888f22d15..f9a1389516 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -621,9 +621,14 @@ static void set_poll_bankmask(struct cpuinfo_x86 *c)
     {
         const struct mca_banks *cmci = per_cpu(no_cmci_banks, cpu);
 
-        if ( unlikely(cmci->num < mb->num) )
-            bitmap_fill(mb->bank_map, mb->num);
         bitmap_copy(mb->bank_map, cmci->bank_map, min(mb->num, cmci->num));
+        /*
+         * Banks past the end of the CMCI map are not reported by CMCI
+         * either, so they need polling.  Set them after the copy, which
+         * works in whole words and would otherwise clear them again.
+         */
+        if ( unlikely(cmci->num < mb->num) )
+            bitmap_set(mb->bank_map, cmci->num, mb->num - cmci->num);
     }
     else
     {
-- 
2.47.3


