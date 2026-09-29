Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EA5CA5FA5
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 14:07:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436471.1655120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBYUA-0007PN-Dg; Tue, 29 Sep 2026 14:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436471.1655120; Tue, 29 Sep 2026 14:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBYUA-0007PG-Ao; Tue, 29 Sep 2026 14:07:10 +0000
Received: by outflank-mailman (input) for mailman id 1436471;
 Tue, 29 Sep 2026 14:07:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1xBYU8-0007P1-Ux
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 14:07:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBYU4-003MN4-Bc
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 16:07:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6abbc5ea-bab6-0a2a0a5309dd-0a2a4506d18e-44
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 16:07:03 +0200
Received: from [40.107.201.35]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6abbc606-195a-0a2a45060019-286bc923c72b-4
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 16:07:03 +0200
Received: from PH0PR07CA0013.namprd07.prod.outlook.com (2603:10b6:510:5::18)
 by BL1PR12MB5780.namprd12.prod.outlook.com (2603:10b6:208:393::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 14:06:57 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::64) by PH0PR07CA0013.outlook.office365.com
 (2603:10b6:510:5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 14:06:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 14:06:56 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 09:06:54 -0500
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
 b=INI78uN6nOswo4GbUjzTcMjNXjmvhesrELA8Apdg5eUQH07GnduLou/Ceua1xLIB3d36Jr7QO5vjkytFHW9yvlmMVtAU8tzW4n/TqCUKefGgJD9gtZwpy8Xta8n5qWDew8hvkRfTIFNdFpwhNQnZCibf+3cVNaEMvfzhzrlwRrK536o8Hss+gKiBbdjYP06QBuu2GHG8XrqYkKLEyMNMzA7yAh6wxOs++V9aZJArxhjfz9R3M1qV7Pbl2DxLPfGAfwQcrLa/1xDJ/jZBQ/5QkydDHj2s5NcuGNeaSmeSUUd1SLK0qYcjlUAJbVViYkw7+LyKOJjgVoSpM3PlL/2veg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bHk3rsSw1G5BQtibXtqslx1MAkGdUpX2+7hfOQ9N9A=;
 b=xciWMTucWbT1eiDYjWxOAJnsZTOTCRrJvvpJIQT4YzrnKaxVnygFaU46whrL7F3XAt3VXe3fkUAYBg36zZE6IbPpv9Pms1HgXE7ZyMIRMbKZtAMlWuohjCS45bcJA1Nk+Byqkj1k4MO/fbdupvZJsLAXrR3Bli4/z+WnO8HCEm3R1CESqeZ7Ck/av4mXoSMgfM0HJ28m5mckFislzqkq0udK8vk+3vBbFD34IPYHlwiI4ycfxtVG1R2UjMuGerZYFzAakGZhQeSDNv5qjWcRDoVr3KXJ52MKkMN/gThcphJavKHcn9+/Yq/4B0MMzXSc5/YStoJD/w5u1QGJiN9iYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bHk3rsSw1G5BQtibXtqslx1MAkGdUpX2+7hfOQ9N9A=;
 b=zrrdQxuv3hQQrYC9kZrNxSnp8TttgYGEH7CO2gvpSzaFInFvj6YezU+vuazWID43/bizv9B5qo0w5snwAU9cgpDcL4+nerCmdNJtjsACv04cfb7/wolT+brZWQO8cxMZsGmm6pPSHrWif8iY26QlbMNLKOThxinQJenZFaRXvAA=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jiaqing Zhao <Zhao.Jiaqing@amd.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>
Subject: [XEN PATCH] xen/credit2: let the tickled pCPU pick up the unit it was tickled for
Date: Tue, 29 Sep 2026 22:05:42 +0800
Message-ID: <20260929140542.249693-1-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|BL1PR12MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ef9c70-408f-483f-bd9e-08df1e32ec20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|260925021311599003|260925021911599003|18002099003|10067099003|11063799006|56012099006|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	GSHQRUw7UCapUX4lNelfAN26ByIjaZDB3KuUcjsuaitmJGUY/t2vj9s+r//oGw8nEPvk1a1NwXtGfsQDsStPXWWoWVO4vOwgu4hN4TU+N7D0/9iu0Fuo8dKBHIh17A+FKw3NGVIb75dAckOi7EucbAYV34wK2/+cMuyV7LOxnzyByfkfoeK9pWCq/WMiRoWWrhKuP1OqBCyGd+v2q8oisewfJCIkd9Eg7uC8f+MvZF2gNGfFUYNVY40uGn2/WnALYPeM1+aF52N2iDGFbJkSrBws6ylciz13Hxpt7cDKYlTtEdJ9DX4tmzHkhEBvOw/HnNASirkxsGOMMWnu/mKLwC7J4uAcNQoVnBl7D0JE0jE6Upye3hjJsXj7jfH/NsvUdt8vafdf8vecTABLRMG1Wwi6fEAqNjdLhJso2DV2+w6ytRjDGl33w0D4j0OSuCWh4cap9MehleVSOh1MVJNTNodFSq5u7wxSPPWFybfDM4ioUXVTW3zt8bMLyxOZJWwCOTShmBza8nO3uI79Yqb6KnPIvdMgqHfWSwkER6O0BnrecioyIV3JxscBpSqBasyCYNu2OuAm+8otF0J7WKuZ5S7lTemYhdbl+j4GrixIahKWK+W/jpPuoIi5S8TSfotKivXc3jhBOzM36YL/EL5q2McXdngIhLBbgzlavZEUoNtQZFC0y+CRgoXBI6fNBByHrBgI3EYMQhAvxmawOGVRUQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(260925021311599003)(260925021911599003)(18002099003)(10067099003)(11063799006)(56012099006)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UtNLHsdKlNrVIoXRd36kOD1ZQ/rdtkdZDyduDoaXfufZA1JFzzyFq/Crafoql22lrBtuM9LLonlrN7lh6XrATOTtTSU6XDOthm/wGcM3ag88iEdZzdOCwRj6kd1Sg8f79biH9SRW3JP+ALpShGybamRUp3wwP4bJ4zPwOGhLEkwp/3yeNcF8TJ3u3V/JuVxL0hyUF2/P3brW37mvzxAdRSu/bKiYhBPZNGZM4vTNQviLgstVwYamUaDeed0Im91BIFlgXyirAxbjQV0PPR+yogzTWRESqBQz4z1bUBlSSJvWtkY6IyjPh/RsDnJ5fo3+zGVYyKuJY94YX2hi4gFyNiyggJxSAvTkP5JmytNjQiUZ5irXmbPlv8dzrD/dLFz840VBdZuiWpjS5lDHTjVndcwmVY/qVPJJFfRxKtHlUhnFeOOJOXFpYgroY3XUzew/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 14:06:56.7999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ef9c70-408f-483f-bd9e-08df1e32ec20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5780
X-purgate-ID: tlsNG-16d1c6/1790690823-FEE7677B-72FEC612/0/0
X-purgate-type: clean
X-purgate-size: 1426

runq_tickle() picks an idle pCPU without taking CSCHED2_MIGRATE_RESIST
into account, but runq_candidate() on that pCPU still applies it. With
the unit's credit within CSCHED2_MIGRATE_RESIST of CSCHED2_CREDIT_MIN,
the tickled pCPU declines the unit because it is not its master, while
the master has already skipped it as deferred to the tickled pCPU. Both
go idle and the unit stays runnable on the runqueue with nobody to run
it.

Seen as a permanent PVH dom0 stall under nested virtualization, where
dom0 overruns its slice far enough to be clamped at CSCHED2_CREDIT_MIN.

Don't resist migration to the pCPU that was tickled for the unit.

Fixes: 069cf39fb171 ("xen: credit2: make tickling more deterministic")
Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
---
 xen/common/sched/credit2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 4949606881..3791a8d4cd 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3517,6 +3517,7 @@ runq_candidate(struct csched2_runqueue_data *rqd,
          * its credit is at least CSCHED2_MIGRATE_RESIST higher.
          */
         if ( sched_unit_master(svc->unit) != cpu
+             && svc->tickled_cpu != cpu
              && snext->credit + CSCHED2_MIGRATE_RESIST > svc->credit )
         {
             SCHED_STAT_CRANK(migrate_resisted);
-- 
2.53.0


