Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E740CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 13:59:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442373.1659925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESAk-00079d-9w; Wed, 07 Oct 2026 13:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442373.1659925; Wed, 07 Oct 2026 13:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xESAk-00079W-7F; Wed, 07 Oct 2026 13:59:06 +0000
Received: by outflank-mailman (input) for mailman id 1442373;
 Wed, 07 Oct 2026 13:59:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xESAi-00079O-Dy
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 13:59:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xESAh-001mD6-8l
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:59:03 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac65022-bab6-0a2a0a5309dd-0a2a450bac9c-20
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 15:59:02 +0200
Received: from [40.107.200.32]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac65022-b7e8-0a2a450b0019-286bc8200569-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 15:59:02 +0200
Received: from CH2PR04CA0020.namprd04.prod.outlook.com (2603:10b6:610:52::30)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.26; Wed, 7 Oct 2026 13:58:52 +0000
Received: from DM2PEPF00003FC8.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::ab) by CH2PR04CA0020.outlook.office365.com
 (2603:10b6:610:52::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 13:58:52 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DM2PEPF00003FC8.mail.protection.outlook.com (10.167.23.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 13:58:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 08:58:50 -0500
Received: from APPOL-18KY0J4.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 7 Oct 2026 08:58:49 -0500
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
 b=ZSNXPvcOlfC0JIRANksZxO43kSQymnZtUyLFYnr22oyX5599yECAXBCj1/Kfq7NJ40nnwph/VM4GqeK19xTkZdsmAtbP306mLkgeJHYwZ8NFa/YgO5QX5f0jxp+EzxZcPTT/0asaVVz/DKNnRnUeFv6Bujl2Yl9ZuKR3WjtyjuseD1wLl1giC9NDgywPbfytWOHO6gPk1rNg4UEuV3I2smyl/fwAf/2EPYPc9u2axkWIjAYvfb4YFZ1Cvt2GEyv3uo26DnrKt7S/Tlq4Jhp9A/flBT5cZSvuo2XfNoOz/jstP14Ce02Uwr8AxF7AB1zemX9mrMnNZQ6jvIATYXRmBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AolQ6BjlzNs+PwrahIUve3U3eotV5pf1jtleJTOhi1M=;
 b=HcRHHVdruIg6aDWtKepMVLrZyNWKox17Tj2QWvfa3iRoOPX1p+gCcwayHcon7ha926He8+QUQHRSiQGdyqIzuaeXkZ43i9wxliUhK+F1kX/aH9klD7o0FPMbXmSdjpPG8RRGGV8+pdL+OHIWGeiqRVlmZNnIkfUYzzhJW2df9Ue7y6XwaOlhTYvCzlZtwE/5ADwB4aitKK9L+LtLGOoQMes4x4qr+yGQJta3dUKVZg2/2tlIxYyV3lquW6jjFASIhtLcm7trxdCbLhE588QG4KFhFy7fRXzGXeG/pKW3KEmPOD5mueSCvPqo2NiDP71+6Rt0lBXazOf6qztq0qVTug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AolQ6BjlzNs+PwrahIUve3U3eotV5pf1jtleJTOhi1M=;
 b=SgD2FSBLFnyR1WxnFmVSkMkTCjUDVZTMXUqnNdg47CCAaTmQ611gQF1IrtmWXhmceOAgNBrwq0OYOmWOQWQ2qNCf47csH/KCxy2T9l9eR6JbEsMNWJhNzXFtc8tWV6+YLQSUW1snDg+lCzutaD7qaVtBY7yG5BCNhV5O3ulbrls=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Fix under-mapping in map_range_to_domain()
Date: Wed, 7 Oct 2026 15:58:48 +0200
Message-ID: <20261007135848.220047-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC8:EE_|DS7PR12MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 413cf0df-e157-43f9-90a0-08df247b1e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|11063799006|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	J+dYTxb706WFa25UM9huY8z+i5GfLJljQgnGsah1xX1FW3gNHr+0dfeW1sh+gNox/VjF+pOsvsg38bW+fTSZWcVTcD0eZl7yktTMe0aW967/VLQrtq8vbLp0K5N4Dc+EhbM+JPGptJ43FIiPwsPn0juSPxiwGD4XLQaifdNm6mVRlUwB9gE6M3DPAE8IfFHSjPCr1+tBUioO1vMIJCsZ9S+j+PUXTH75qszw6SnkaXPct9RHC1xy5szbuwhHv7418FcD8eZlGUz/aciyVjQewA2m9u4SAUd5budB9XzyEZbAZVQuhhmn3Out0prmj5qXjFOEVPltfgyqtm1jxVgguAX1RBBeHykIyGzK0ptia4XFFOCqmRIxxx9RhCPsDoz9nMKQMIdqWvCEVNj1jDJp7PsANxoZjWCFg5m5/SnGUgWMRlDiK1NVUZJDCS8GBFN5lHlE1ED1Cgw+E0FBwPWjLgSFdHJAckNsF7LKW/lAkEsUwGx0oZ9s4XedtNgNdUs6YIQ5J7DzR9zY0u0wW0c51KP6l2RTVVLeWdR9ItdqPeOCtjowOZuD7L9lf3Ib5ez3pz+RqVLJZF0QAZFyxuqTiUvJXHZhwJsQ1bbEhcmlk4iW9sEsmfu0wKtsulYabZtpGMNiwHd2taByP6l1vYaikToNvc3t08BcEDD6Lg+laMSMCedwDeFw5EMDon7Dqiov2Z9vYG5xL+oaYxWK4IDfew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(11063799006)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4y7wWS6cSqKnv4/zNHxuME9yQR0aX16eplU0FWnedZPVJFELJocgzRRR2Bpj9rSQQ26DvSYGPAKj0cuKKTDR2tOCSqJRSduPheSEbQ+XL0ElEVIK4jJ49gH8T3AAG3ySJbq+WY5X29fxONaV/JNsZwNxNrQaRS8rNHVw2XPO8tsiZR2VLqoKwY2yuYR/A1954vKSJciWm+szp07W37tkbJX+Y5Xfu3Pu8+qE/QWTzoa7fIY1BGeG3dziNyf+MsSf7lVyZHT0foN6Xi4OmBKYjCBJjzO1nprG/DaRoy6ee4Gu5aMAbpBfdUo1AbeVzh4LMWr8j42+bmWyHIPfAOlgq1RhJ8UJMJqMLFYagzMIJtXnn/3qyvSbuOno3Afv4li6nne3uJY+m458Vf03TfE//S5qY6GLGn8KJiLJeC4PhhiL5SxZZ8/eRIahhRjhwypk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 13:58:52.1035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 413cf0df-e157-43f9-90a0-08df247b1e8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262
X-purgate-ID: tlsNG-42698a/1791381542-192CC9EA-0A5000C4/0/0
X-purgate-type: clean
X-purgate-size: 1165

If the memory region to be mapped does not start at the page boundary
and its end spans over the page boundary, map_range_to_domain() passes
a number of pages that is short by one to map_regions_p2mt(). Domain's
attempt to access memory within that page will fail. Fix it by calculating
the number of pages to be mapped taking into account the start offset.

Fixes: 88c10b0d6eee ("arch/arm: let map_mmio_regions() use start and count")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index b11366d722ef..ad50838b9f11 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -89,7 +89,7 @@ int __overlay_init map_range_to_domain(const struct dt_device_node *dev,
     {
         res = map_regions_p2mt(d,
                                gaddr_to_gfn(addr),
-                               PFN_UP(len),
+                               PFN_UP(addr + len) - PFN_DOWN(addr),
                                maddr_to_mfn(addr),
                                mr_data->p2mt);
 
-- 
2.43.0


