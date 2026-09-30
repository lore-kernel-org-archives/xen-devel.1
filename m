Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D58CA5FC4
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 17:58:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437795.1656750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xByZI-0002c9-C4; Wed, 30 Sep 2026 17:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437795.1656750; Wed, 30 Sep 2026 17:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xByZI-0002c2-9A; Wed, 30 Sep 2026 17:58:12 +0000
Received: by outflank-mailman (input) for mailman id 1437795;
 Wed, 30 Sep 2026 17:58:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1xByZG-0002bw-HS
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 17:58:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xByZF-00D7af-RC
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 19:58:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6abd4d74-2eae-0a2a0a5409dd-0a2a45038636-26
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 19:58:09 +0200
Received: from [52.101.46.13]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6abd4daf-fae8-0a2a45030019-34652e0d6c9e-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 19:58:08 +0200
Received: from BN9PR03CA0639.namprd03.prod.outlook.com (2603:10b6:408:13b::14)
 by DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 17:58:03 +0000
Received: from BN1PEPF00018549.namprd05.prod.outlook.com
 (2603:10b6:408:13b:cafe::3b) by BN9PR03CA0639.outlook.office365.com
 (2603:10b6:408:13b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 17:58:03 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00018549.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 17:58:03 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 12:58:00 -0500
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
 b=DwmUECqyCEKMvs/agH1sAwi3097y8uMkrYlnrxIVUziCLasy6aHLBJh2b7VBmibXh7LpbXjVNBQYlc2aPlWXtWUQW7LSUP6EtY1SlfIvcHkr1H4Jey28h23paFw/c/F4ei5QRXgtK15tGay/UQdSqCMj/jxpu/YRKFxk1jClwuquDoyK78eJ/Y0Nj6H1youl7B7XVWMhGqGxbjAv7OuHkC1pWZ5f4jW01kakFpB91qHY089Qs+XzPw5kCz8DJcVpgvP03lbxxWfOe63otN/yfiKyCvhBGwTIuROwqGN617jVSOXVnh1QIyMo3jq+VXP+8Bvl+PfiNoeIX0JaxZph/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7CkcP5eIBFh2knIHSHjiBm2u5CmRivfb9hR1HKwcB4=;
 b=XzUKvIYZE5YR6YrD7mMGt7HClmc+HSZR5O3Y4Wg79VSWZe+47LEFH4OmpHTF5td2LhjTXzCJXS8cCqlGlF97t+zgfnq6MiSSVg6Phfvmosxb1DE4QZSDRENIPxRmWRf9SHrD+ibGI7k1O2qyUrXwvUUMaPxjpphEedSqWtY5zG/JX+OcWIGNTjfQqebvQZlyehwBGuc0boTsRKBcsY+B9shQqWlGTE6m3HENjRJ91uAQ9t7OjYifiegqjK7ikyjWVFF/FB4A2W7zWOrl5jkvEbaIPgYAaIjo8lDejvXm8viP7kZbCeXPpxmWNKG/PO+JI8BZ9S0WWLlgTqbuT2lFUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7CkcP5eIBFh2knIHSHjiBm2u5CmRivfb9hR1HKwcB4=;
 b=bVLg1/nxSUDXk9fiv9zuPJJbU6RCgC3zWca5G5d8Vbk9kE4LMjjcF0BMnpaXcsYLVGKYt4o0KuUMvwySK/MzZRlNIXlhSaw6kh68UDtI2aXwXzz9ZahmVfygUXVUlp8Ux9Ln6CQNCnoK2vhrPRR2CzRYCObBSfgrtA+1kr+K8cw=
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
	<roger@xenproject.com>
Subject: [XEN PATCH v2] xen/credit2: let the tickled pCPU pick up the unit it was tickled for
Date: Thu, 1 Oct 2026 01:57:47 +0800
Message-ID: <20260930175747.274967-1-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018549:EE_|DM6PR12MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: 42ccd195-4e9a-4bde-7213-08df1f1c5f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|10067099003|56012099006|260925021911599003|260925022911599003|260925021311599003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	9u3pNdgZzkR0uVKQwe+w5rhLg6+DZ7rwQyljygDnvo5OqwtyTLN2M8EJkIeZiNZf60pavWYEv9AJe13qGvJBLnLgaFW2SO6MCzjYuBRe2tthX2CPLZs3miNocVIkK3/hvFNXlId9FBFVxCj9YwuxU3xINnKBmEOxNwkFSy/0yQLMXCnr48ITradYcY05HRyQsYfWj5/74tLYnwb4b0HkujbBCAsVNb3MNOqrI4+QpVqXVL3dgaXmaiHieIMCyrVe4NFOGaoxLSBrdfSJ6PhJWH9E+b559qnPX9gf8RvkKV7ZhrRSod7pK7/+vxMyec+NzUA5TM3d4gspjOXSzBAjT0zOLWFxYBg3BN+gZwmUAwuvODqPyR6hUD46LlH9plZuARfoeuzv7YI0nGuWG5oEHWRB3jhHtR4oW6Q5VQ3/yOd346ZXdJB9c4W8TUMNqpnqDwusxbbgYUN+9SPXJzVu0rtY1cHykctgmOd8+bJBV8gxKMs4dez//knLH4vhgck8jHN0m20pZCMWAJ52go7wFJaebe656k8zRuCGigOzqkbj3Ud2qKmz2MPiDprbjUe2JwtGiMUxd6mYaLuQeBaOE6SBt1O+guQmlmEmOQbWn10Kdk/E33kT0U1tiTUc+NnIJZxY28P96DY6/e2gFBtuDeLkMEf3XyxXaCx9ESKsxU4GGX83x9n5VjiDDAFNOi9okcOFvHCoGfeh6m+3teoFxQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(10067099003)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5IGvrQ66VHCZ2I/ANAOiIjKE4BhJhSpI/0b951L833spc2gfPVrkPR29vVvY3vG+ZVi/yLrXq+JWo2Np5hLisIP3KSfHXqSSSM1XmmPSj+0AOZrwrtLNqiF4oOX7y0PRY6o5ez15upihsiYSDBsqjk97p6P4guOiK7jMel57NpE9I93VkKL9V6Mq4xWRgOm6FOjXtHaOoGRVutQbbZpJbOpmdtz7KYLffGBmvZjKM8XKiKlVm0W9jr6u5ENlY/qkRVLzxuKRRDtQNheYd9lFUheCCVcq0oQEa5D46EeALIf+om9fTVZ+34PVIYr2EJiWzFLuip07zspDCzPkXRMFddccZ4EV5qh+MweaNWcNSPspkLXRh9touuwpYISb2avSgpFfVSwCyJ4YFN1i67yGcMtvghb8Wo7WPFcfKPNFklX+ALZzddzKIZ3KkPPeSTqo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 17:58:03.1581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ccd195-4e9a-4bde-7213-08df1f1c5f85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018549.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4124
X-purgate-ID: tlsNG-33051d/1790791089-760FE4E9-B4A5C89E/0/0
X-purgate-type: clean
X-purgate-size: 1788

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
Reviewed-by: George Dunlap <gwd@xenproject.org>
---
v2:
* Add corresponding comment for this fix.
* Add Reviewed-by tag from George.
---
 xen/common/sched/credit2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 4949606881..c32e753bb4 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -3514,9 +3514,11 @@ runq_candidate(struct csched2_runqueue_data *rqd,
 
         /*
          * If this is on a different processor, don't pull it unless
-         * its credit is at least CSCHED2_MIGRATE_RESIST higher.
+         * its credit is at least CSCHED2_MIGRATE_RESIST higher, or the
+         * processor was tickled for it.
          */
         if ( sched_unit_master(svc->unit) != cpu
+             && svc->tickled_cpu != cpu
              && snext->credit + CSCHED2_MIGRATE_RESIST > svc->credit )
         {
             SCHED_STAT_CRANK(migrate_resisted);
-- 
2.53.0


