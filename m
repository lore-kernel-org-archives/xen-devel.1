Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B129606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 10:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MlLXe3HM
Received: from list by lists.xenproject.org with outflank-mailman.1464395.1675068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMNbI-00060M-K1; Thu, 29 Oct 2026 10:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464395.1675068; Thu, 29 Oct 2026 10:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMNbI-00060F-HM; Thu, 29 Oct 2026 10:43:16 +0000
Received: by outflank-mailman (input) for mailman id 1464395;
 Thu, 29 Oct 2026 10:43:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xMNbH-000603-Eo
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 10:43:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMNbG-005JKR-Ry
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 11:43:14 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae32339-8faa-0a2a0a5109dd-0a2a4506c4c8-32
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 11:43:14 +0100
Received: from [40.107.201.67]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ae32340-195a-0a2a45060019-286bc9436f1a-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 11:43:14 +0100
Received: from CYXPR03CA0059.namprd03.prod.outlook.com (2603:10b6:930:d1::11)
 by CY5PR12MB6623.namprd12.prod.outlook.com (2603:10b6:930:41::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 10:43:10 +0000
Received: from CO1PEPF00012E65.namprd05.prod.outlook.com
 (2603:10b6:930:d1:cafe::73) by CYXPR03CA0059.outlook.office365.com
 (2603:10b6:930:d1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Thu, 29
 Oct 2026 10:43:10 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E65.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 10:43:08 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 05:43:08 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 05:43:08 -0500
Received: from APPOL-18KY0J4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 05:43:07 -0500
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
 b=T7egk3bZJ24CkH/Jy0jyvk6FpZPMk0T/ekulm14gs9NbK4GautO6ocPr+Thj1AJ4s1Rjj1pIfQF6vvLFn7zGnBeV3WrmQaMy/wRHYfM9MHYV32+kzpSU7M05pOitJIrHh/Gk89yPhEJ0fc2r+LfPBo0AWQ3tISNCPNiwqyVkQCD/W1qbX5bUiS+XeFA1a7pqV/OmoutFWumhkWkQG0fKPkNAxGjltgAUS17SBwbQZgTyeIjofxw/htdUCrf4aMBjRg8ERUu535ErOwKAKXPYuInFTOYqz1KCL7AsvvB6+SCssA2AGYNLqg4bl89opxg/TVr/fJMhI9p68nuljTTj7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/Gsr14SbE4BHUwi0UD3spkz8U+EQr4T/9fDf5mXp34=;
 b=NFur581ba0D8h2QKaDRMK5SQ8Od9iYWFyrXlXuKeroSfJRqGDh/j08R49jcz30x+hresMkP5dA6S4qCYNSbxFBFo5EoaSpKK9fg3fsTG4lzFeZrswGbT/YdOplUMncF+IZcaAFDz1OP6hZrNmN5cZ9rwsLGGWh/MeI537AgeMkSEZpsadQlqxy6Mf0Gsl49yVzQeztXVv/ppHH4WE95AnzZJ1vcFQarh0j+ijPf97qb9y8A/tef93u0TY0L434gw9m7893xZ1vbcCKy6u63X7u9hCQvDMdMMvToqhHsvjoGLmnAaaOY5N2c2f5cp/gAJipzQS5CTv6fWgLFJQDRGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/Gsr14SbE4BHUwi0UD3spkz8U+EQr4T/9fDf5mXp34=;
 b=MlLXe3HMrze6lv6PWQ3WieTIO8AiVbIurCiHQlh/zyHoby7IGxyTn1+f9+HNavjfexfmQSa2V5XY73kSo7ZoGsZviKOtE/hebMx3XtiRi7gW/cJa9/lUd5JhU4lqdIZHrRueXncBWrsVZ9WCTh5K3GN+p2W34jF70i+iSPiEZuA=
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
	<bertrand.marquis@arm.com>
Subject: [PATCH] xen/dt: Don't advertise Xen static-heap region to hwdom
Date: Thu, 29 Oct 2026 11:43:05 +0100
Message-ID: <20261029104305.169036-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E65:EE_|CY5PR12MB6623:EE_
X-MS-Office365-Filtering-Correlation-Id: ae638d42-8b2b-42b3-3b50-08df35a96c2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|261021121427099003|261026121527099003|260925021311599003|260925021911599003|260925022911599003|11063799006|5023799004|56012099006|261022105027099003|261022075727099003|261009223027099003|261021123027099003|10067099003|18002099003|6133799003|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	kpFwalQGph8bT8tuSeatZYZjSCLOrAhUmHndLjBQn7c1nXOJvYWtY3Gc4M01SSf6DIOE6BGXfe2hozglo9j+PLnGe5HQhWT5T5sap0NChdpcJ2Smi+BN0hJk1/N3sDAN3Sb3fzBn337ZzH7tAQCizOZ4P3AfAMXaZDE02yl3GbSriiYyHQ8aW+Pbk6BPGhH6OPO43MTLIrHkBao0/gPIWqM6hw/EZWggc1YBmfDyBQkjOBZ6eJWmr353HnDTWUiHdk8yT6b98MeRObx6URnvYqWIspY0opKt0UkfuqQ9MkHJwpZ5d/RPgKEp2N9R2atVe4rmsPe4TNP/PqwgOtikHedCw0LM4yVQlD0NvYjaD3RJKKAP5SWDkjlf3uPRAaSzQB+jL4AJyvFzBRfRtWwwQfX+fxu6UXQRN5NP5UkCaLhnB/eZa8OIfkptCKFTd1FPVpVfiOAc0POHIuCbJ5zjXVSOZsChdHS6htlWIvcdjeILYjCRLOE67TCzOeoeqZ03umvsk9xMMZWAwvi7D2TY/+oFihfrbOG/AafA5i3t6kDQwg078yCTQWAS2SvcT+jzAd0OmVsE4PqM4BSIl/M78TpqmTFVcn55zg7HoqNlj7VQwTfqGJfqnn9I4irCcW0uF+aRnDGK3HQ6d+ABYXlC8xxS+sPxyIfyknPu1bhGiktoxzpXJfCalxmtVID/3cSGZvzMoqcDQf6C2fRu/7+Dog==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(261021121427099003)(261026121527099003)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(5023799004)(56012099006)(261022105027099003)(261022075727099003)(261009223027099003)(261021123027099003)(10067099003)(18002099003)(6133799003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	leOAkV8JunCZxZavG7744pcmp7cQnpgajekVbx5N2LtA7ki6nvHORXPo+blnfgURKOspx5DQfWiVzEECoKloJjSGkF8f64S/teVWQWIxvYqOh3gNg080+RqRAnb+tFAtkUsl1ooa2AlkfrLhKlqEzBervRY7DOS4ibXi4zkb4Ar/ihZXKxPfvNnLl1PmQeekNk6jZWyM+T1l/pUSIIG2+WjnOmX/BsCITVGfUlRvPPK3Dsb74qs8BKhscZX3Bx4T0DLXn9pD3iLDCZQdbSdIboHoScEHxcRMqiEi9Mb2WpTTb+TL+2QTe5rvZnNpOOoDG6Cv2PcZnt1tEA83y+DqUXsi1iH8gpsuzzMK8GrVq1TDpoeVLe2CwXvBPsMb0QlyKE1qCBNJpWe7sClTISG5IwlYyx2yfEt6aFIiG3tRWNwSrEYxByDl+8/B5vhSCwfD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 10:43:08.9587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae638d42-8b2b-42b3-3b50-08df35a96c2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E65.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6623
X-purgate-ID: tlsNG-16d1c6/1793270594-F580D77B-C87B7E30/0/0
X-purgate-type: clean
X-purgate-size: 1560
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

bootinfo.reserved_mem is used to store different types of memory that
Xen considers as reserved: domU static mem, normal /reserved-memory,
FDT memreserve and Xen static heap. make_memory_node(), invoked during
FDT generation for a hwdom for reserved memory, only skips the domU
static memory and FDT memreserve. This results in advertising Xen static
heap (if used) to a hwdom as /memory. This memory is not mapped in P2M
and guest attempt to access it fails. Interestingly, if the
/reserved-memory node is placed after /chosen, there is no problem because
of the check at the beginning of make_memory_node() that finds the first
memory range using the correct type.

Fixes: 4596329291f5 ("docs, xen/arm: Introduce static heap memory")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/domain-build.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 30a59abfa722..634a26946c24 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -541,8 +541,7 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
         u64 start = mem->bank[i].start;
         u64 size = mem->bank[i].size;
 
-        if ( (mem->bank[i].type == MEMBANK_STATIC_DOMAIN) ||
-             (mem->bank[i].type == MEMBANK_FDT_RESVMEM) )
+        if ( mem->bank[i].type != MEMBANK_DEFAULT )
             continue;
 
         nr_cells += reg_size;
-- 
2.43.0


