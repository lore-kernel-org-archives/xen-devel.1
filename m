Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35CDCA5FA7
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 17:09:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436649.1655337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBbK1-0007dH-9k; Tue, 29 Sep 2026 17:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436649.1655337; Tue, 29 Sep 2026 17:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBbK1-0007dA-6w; Tue, 29 Sep 2026 17:08:53 +0000
Received: by outflank-mailman (input) for mailman id 1436649;
 Tue, 29 Sep 2026 17:08:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Edgar.Iglesias@amd.com>) id 1xBbJz-0007d4-Sm
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 17:08:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBbJz-009k3Z-9g
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 19:08:51 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 6abbf078-8faa-0a2a0a5109dd-0a2a4505e1a4-46
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 19:08:50 +0200
Received: from [40.93.195.63]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 6abbf0a1-4cb1-0a2a45050019-285dc33f4f4b-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 19:08:50 +0200
Received: from BY1P220CA0049.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::15)
 by LVUPR12MB999138.namprd12.prod.outlook.com (2603:10b6:408:39e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 17:08:43 +0000
Received: from MW1PEPF0001615D.namprd21.prod.outlook.com
 (2603:10b6:a03:59e:cafe::5e) by BY1P220CA0049.outlook.office365.com
 (2603:10b6:a03:59e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Tue,
 29 Sep 2026 17:08:43 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF0001615D.mail.protection.outlook.com (10.167.249.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Tue, 29 Sep 2026 17:08:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 12:08:41 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 12:08:40 -0500
Received: from xiremeasae11.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via
 Frontend Transport; Tue, 29 Sep 2026 12:08:40 -0500
Received: by xiremeasae11.xilinx.com (Postfix, from userid 13690)
 id 79A3640140; Tue, 29 Sep 2026 18:08:35 +0100 (IST)
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
 b=DCovPEMTXuAq2EufMaMqpBJ+rHNA2+qR88GJ/cC34MAaQN1NkdDBxjnq9z7Oxe22MCqnm/6K5A1qslIcThKORqo8xPQBPIY3bYnvYda88LRDcCiCAaLL4GLbLzmtoVr9KwNh8Kc+YU4delljkGL6IVkHHQfYtfCTF/BJA231jS39w5vapn4gElCt0Beo+VAEbHpIQD/HNt06iT6iAmoS2UmuL/vXzm/wMzGBxCa+s8AjRd7P39GHNoYfBdrmpA1R29+Rq5lF+0/nN7dH+BGwFSoC7pQpd6r40t3L7GuQT36O/b4pZf5uYU5YExvDZnq7u+rSqte76xiudqkJpOkOxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HaPFovSO4rhmgsWBhUS5lmdIuhgckoiwCbP7wlhJyY=;
 b=JXWFcoQO2eWc7y8ujlWau2joEenQpo8hvHMGBehci3/rZOt+Qifx2SpeMSjEvxxDVq2LOy1YwpIDE6DIyxsP+A7P9WpJMkgJzEYZNbRHbZeTm1uBLu4wLsoH0wRKG9wHT9RuH3AmEDMZDjZuSNHczdUxJod38c+5KPCbgP3BuSUTp+I/0fgBJr0vTU80dQMg0g5cM0KvD9Y04/MouKUD7Qi/tiO4VpoWdC9SnUeIUa0RRnfkRQr36DI9J/421tutsy/mrCI7zVl8aHBQyBi7ieBGay0ksY/bJ2F2pfRr6urPuy+IJFvVC1+AAfKisBz9kgfyxvb4O2iIkapdiA84UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HaPFovSO4rhmgsWBhUS5lmdIuhgckoiwCbP7wlhJyY=;
 b=Qvxy2PnbL5wiVd+MLCq8U7coDTITmirhcvNfrbVBBHVQrvKTj25S+sWpoGleRj32u9lL2Odtpz1ZOWbDkwVVRNxo4Y0PQeK3Dv2NMSkMand7C0wvH2wz8SSTtKj/u1ZSnC4q2TqdIXCbhZWTPjdL3g2VKnTNVbOzZQyGqk17esw=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Alejandro Vallejo
	<alejandro.garciavallejo@amd.com>
Subject: [PATCH] xen/ioreq: drop the emulator reference when range set allocation fails
Date: Tue, 29 Sep 2026 18:08:35 +0100
Message-ID: <20260929170835.964609-1-edgar.iglesias@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615D:EE_|LVUPR12MB999138:EE_
X-MS-Office365-Filtering-Correlation-Id: 2139c001-b67a-478e-4cdd-08df1e4c4fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	QRJHt4lZwrvqagmUxmKfV/uafr76CxGHS96KYJ3i1AWL6dUOdpRKvxGxsVxCAX1MbMh2RQ2HjmJ8tG4vAyhlv/KOaDfzUXTHkA7HdSfcEDH06oCzclSNVikYfqrTwM3j9oY7qxBgTtu/eenh2r5dCHUN2kw0oyv1iTA7G9RAwyDDWHY+goVvtUzYn/a7b1BTekzBeFWSbgQEKlBMj9fj6qWNMEgj14pb5dzlyCUO8VSM0XN+7n0gjLbj9f2ZkWY2PNL3hmOwTdv8Q8qTgUjuD+CuKUxMJdIvh7pTrBupNo2vL2Tw+CCvO88lGFprthCmBHB+UjPCO6cn+4oYqmcReU7cKRoIP8jQWxDevjhgU+PDiUwMHJAJISRAS1jpFxyhqnvwkConYuvmFVd/vHDyIBUPUeDIYnyX2BCHuUTqUD0KC4uo5ogBA/a+j5jc6PGzvBHv75QKeuKbTkRahR49gpEOM58b5N8aR59mmsXJh7A0LxjrM3tJ/F5FNYNkJ7qmLRjQu48ueLmhqu/I2SlropFNxUNinmzlue5UNhYgEmxAtWgF1d/AeOsTH6/iEUL0JCRa5U+98nkvVEJHemrdVxxCrY8251g2rR3M1b3Sv6p2Z88pv4MGAbuMAqX89KDiJR0IrY1mMmfiENuHD0swsPYTd9oRQPbqVkbc8r6T9l1W/jpq+Re0DzFXa/QEloeW6ri62aH5gbG0ECLkhQNfuw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PkHqcg1YJs/2iQTSp6iLYg6eJ0HNQAsBfbHDEGk5sw9iypCfmN1DGjPzb+zfyWt5x0E+szkaaAs6DOScr055DKU2/trlQvwUJ11knGxqFEZQTHvDx4hfBqnLYGW7bYD6TF2CpTCE51cpmtSx97n15BizWw+sVS+eDMYX/7GZKz2ghqt9AWovNB1MzwyBcb5zW4X66JeBVrWs9Pl5PHIn9pW3K+hIACTruts5hGMrhMJw9yq7x4oPKBz9/vI+eigzy+TrPcThYUAXczg5jP9iqchhA0OJc6k7NloRzDzp/IZRhuqiPSK/gbpE8GavYXIDT+SGAhkMd0wQxH7MH9+qvoKl6cwfa6E2d8C1VWm16kWNX9p6DKAaFSFCQqwNJGtPRTpQzwotq5AC5//QiePz1oQrRoPGaQsJxikQv+PJXoraxmAe8naqCCGVyL8vGOxQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 17:08:41.2959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2139c001-b67a-478e-4cdd-08df1e4c4fb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001615D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999138
X-purgate-ID: tlsNG-c201ff/1790701730-F74BC2A1-6FBF279A/0/0
X-purgate-type: clean
X-purgate-size: 1191

ioreq_server_init() takes a reference on the emulating domain before
allocating the server's range sets, but does not release it when that
allocation fails. The leaked reference prevents the emulating domain
from ever being fully destroyed.

Route this failure through the existing put_domain() cleanup.

Fixes: ccb42e0ca661 ("x86/hvm: take a reference on ioreq server emulating domain")
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/common/ioreq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index f5fd30ce12..4b321a5c61 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -595,7 +595,7 @@ static int ioreq_server_init(struct ioreq_server *s,
 
     rc = ioreq_server_alloc_rangesets(s, id);
     if ( rc )
-        return rc;
+        goto fail_rangesets;
 
     s->bufioreq_handling = bufioreq_handling;
 
@@ -614,6 +614,7 @@ static int ioreq_server_init(struct ioreq_server *s,
 
     ioreq_server_free_rangesets(s);
 
+ fail_rangesets:
     put_domain(s->emulator);
     return rc;
 }

base-commit: 24bd190cd99447ec634da6cb56590ccf44ad627d
-- 
2.47.3


