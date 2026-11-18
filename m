Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C47F606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 00:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=x97CPD3v
Received: from list by lists.xenproject.org with outflank-mailman.1493462.1693454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTU1B-0000G1-8B; Wed, 18 Nov 2026 00:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493462.1693454; Wed, 18 Nov 2026 00:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTU1B-0000Fs-4n; Wed, 18 Nov 2026 00:59:21 +0000
Received: by outflank-mailman (input) for mailman id 1493462;
 Wed, 18 Nov 2026 00:59:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xTU18-0008Sn-Vs
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 00:59:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTU18-006NBu-CW
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 01:59:18 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6afcf815-bab6-0a2a0a5309dd-0a2a4504b4da-38
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 01:59:18 +0100
Received: from [40.93.198.60]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6afcf864-b57f-0a2a45040019-285dc63c8e38-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 01:59:17 +0100
Received: from DS7PR03CA0204.namprd03.prod.outlook.com (2603:10b6:5:3b6::29)
 by SN7PR12MB6840.namprd12.prod.outlook.com (2603:10b6:806:264::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 00:59:10 +0000
Received: from DM3PEPF000265C5.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::43) by DS7PR03CA0204.outlook.office365.com
 (2603:10b6:5:3b6::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 00:59:10 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265C5.mail.protection.outlook.com (10.167.23.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 00:59:09 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 18:59:09 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 18:59:09 -0600
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.57 via Frontend Transport;
 Tue, 17 Nov 2026 18:59:09 -0600
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
 b=h7V+tBDXYoefrzdOPWN3rvXOSZ3sW6JX0XYcf2RwF4Cm2hM7kj4JsxFhqgBbXcQ9qiNtxiecoyL5x5EVTc+cKTWBhxNBdIc6ZgqrTuXon68Szm/s2n9iI++UqCQLRLghM/2RoXkHtWqjyuvMWj1+Anf5fB8bYoNikmb6xq99OEkbNXMY+WceggVkTxxsP+YDu+UjI7qk1AvA4Ch5tziO7GVdQD02lnHPeESCKJtHl3M5eGu+xMsDSBBlL4xYkCHhZpGa12mrrX641SMLLrWqMencRe8aBbzxQRb9TjYIB/bCBWLsAldqK7iAuSFstdoJ8ZRLSSFWoF0sYjZM9LN0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lat0cFS0jRbxYYS2jmP4bfOiKTAQ1EuNGYNm55Hg/GU=;
 b=GCAfmwAlvUJBAKka9e/Xqd1BKB7Q/bP3ym5AozlIWPUZmetPUjZADpLFSMDJcPDv2M0VOx6sI02ngEL/FtAj7NvClDSwnR10NmPqD6sq1Pf5JFTYDsVlPkCPWBhtExgHfPV9PZagt/75BTBVKNF1Pq4iRVq4UCBlOCG8+HZHWzPS3YMIl5A/CUjEwBDa//EgQBKgLSwNxp8/sqFSPgwkX1Bw1YK2BHWB2h1u/w4ec0ZTW/Ta79oWhnLzd4xKivl3fmfKhEXcuybcZyEVDVUkC5aTvHbO9Vlo2pAg9u2I2KDyD5TuxGgTE9Y0U3bBEJg+y2824Fhc3wrukbK5nZRARw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lat0cFS0jRbxYYS2jmP4bfOiKTAQ1EuNGYNm55Hg/GU=;
 b=x97CPD3vXMgYfLtnIwdAdGPjfP3Z/Ksp16t3d2vXCTHkCS0pIcQob1XJOusQf6cyC6A75lMW6BwyS8dVig3Xl+7oj8l5NPZ28uzrBt584x3VdLwgVat89r+AMoKMZJCDAv6xEwDIxp04BTXmDoTzi7k0pICRFK7ylmeSsvgfhRw=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/4] xen/arm: guest_walk: refuse a block descriptor where the granule has none
Date: Tue, 17 Nov 2026 16:59:00 -0800
Message-ID: <b29ceab6082cae0336e56c6695e661b0c8e12813.1794962603.git.stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794962603.git.stefano.stabellini@amd.com>
References: <cover.1794962603.git.stefano.stabellini@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265C5:EE_|SN7PR12MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: af9d8426-f95c-4e2f-1ebc-08df450f278f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|18002099003|22082099003|261009223027099003|3023799007|11063799006|56012099006|261028144727099003|261102123227099003|261022105027099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	T+zoCXgRfYxBVEPjPvyBn0QlQD6JwFAfngrErp5pmcCUJDgB8jnV3/jnGLTR4FndR3McjrgbPQaIRykgT0DGqdJ4nKFvOhFp/WBwDoEY3McsRpeB/Ze7HdWFPC1HylYXZ9Zw/iTs+zEaw3g+T6nEKdIxV9h9+BylCwBcHmFo+ayVAL7UNyAgpds0s6UsjPzc0/2hM3Nxiu7xwubXvJjdgkKfln3Y9iYgz9S1RqcRiphWEd6gUfNYiE/ynHHwHf5czZ324rwhfDAHQa18UvqtK0ShUM7RR2GUfw/qecrd1VIOtfNYoNS1dJE7JZnsAIsNuzl8Y53H7JV1BUIRmayW7s/RIziqvhWgDtMVfE+lWxxCXYSSE93povSvdkf7pM8npAiwnVdeO0FakSeZgHZPArhCz1xCj1UrZ260YFaC7XSE8i2LFgtI7LtLxGQK7+Xio+CLaPJgdNRPcgNzdv2i1oyHIPZjBWpv38AN6gbYYHQ4ubnygZAcYmiVTMC5/F+eQcUjMVFZdIvdNnYHYz0ouKgJ9CB9disNHf7/EUlA2FvHY0dfz+xBaqgHzsB3RnbcjDx44JGbaFPUg8mzAQ8roFZGhpH4cR7G9IfVMNYJ5ATrHsM/w28DLT6UTq576b82uMEg7scBeLtIjrgoY9BpnNSvOEb9PO/NV7uxapKNvnwqSG2fFNLMzk39CWvGoJwi6SIXIAlJpdxWev4sLY1Alg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261022105027099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PlR2C73+lobvT+TxfDZFWQ8+2/cGnBrZWSrkBXJF6SJE2KN5Fp4ewBd0m0K1BeBSFmqm/Oxp5h91XpSBPOrlimyHsUlsB8z5IdoGzxXPs85x8HCBReiMOkatzJBTYuPe2dVwTxxeBS+4YAJ1gsR2NXeGPedwVSGueZ2aRVmxkgPldQ7VCdf9fFCMobGMbhPMrnEbLX9GXlZjMoELf1v8mayQqDOnLrz+0Nib7MKD8PtTiluWeGJlyAyG0zRLWjpVBzV5nA6ELF+goKzuFhz6tzVoAh5u1irxnN97b1HTuj1PH8Sv1X09uYdAFy4Kk6+j77X9vCDZPvgCfsz8gc1uL2yUFfa6yYANGkVN9J87bZ+6q3yB0xjfJC8idkiiag9aVIlunQscbNIf2TseS0H80Y1jHopKOXAXADqoDgOv45n67U9jxZYYuPdxCP+TdeqV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 00:59:09.9878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af9d8426-f95c-4e2f-1ebc-08df450f278f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265C5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6840
X-purgate-ID: tlsNG-ebf023/1794963558-50CDFB50-FA1C212A/0/0
X-purgate-type: clean
X-purgate-size: 2683
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

guest_walk_ld() accepted a block descriptor at any level. No granule has
level 0 blocks, and the 16KB and 64KB granules have no level 1 blocks
(ARM DDI 0487 M.d D8.3.1.2): the translation table walk makes such an
entry a Translation fault (AArch64.BlockDescSupported()). Refuse it.

The check is only valid without 52-bit support (FEAT_LPA, FEAT_LPA2).
Note in get_ipa_output_size() that 52-bit support requires updating it.

Fixes: 7d623b358a45 ("arm/mem_access: Add long-descriptor based gpt")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Cc: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

Changes in v2:
- Cite ARM DDI 0487 M.d instead of A.k.
- Say in the commit message and the comment that the check is only
  valid without 52-bit support (FEAT_LPA, FEAT_LPA2), and note in
  get_ipa_output_size() that 52-bit support requires updating it.
- Move the Cc list after ---.
---
 xen/arch/arm/guest_walk.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index 09fe486598..151b837541 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -201,7 +201,8 @@ static int get_ipa_output_size(struct domain *d, register_t tcr,
          * Return an error on reserved IPA output-sizes and if the IPA
          * output-size is 52bit.
          *
-         * XXX: 52 bit output-size is not supported yet.
+         * XXX: 52 bit output-size is not supported yet. Supporting it also
+         * requires updating the block descriptor check in guest_walk_ld().
          */
         if ( ips > TCR_EL1_IPS_48_BIT )
             return -EFAULT;
@@ -533,6 +534,17 @@ static bool guest_walk_ld(const struct vcpu *v,
     if ( !lpae_is_valid(pte) || !lpae_is_mapping(pte, level) )
         return false;
 
+    /*
+     * A block descriptor is only supported at level 1 and level 2 with the
+     * 4KB granule, and only at level 2 with the 16KB and 64KB granules (ARM
+     * DDI 0487 M.d D8.3.1.2). The block encoding at any other level generates
+     * a Translation fault (AArch64.BlockDescSupported()).
+     *
+     * This is only valid without 52-bit support (FEAT_LPA, FEAT_LPA2).
+     */
+    if ( level == 0 || (level == 1 && gran != GRANULE_SIZE_INDEX_4K) )
+        return false;
+
     /* Make sure that the lower bits of the PTE's base address are zero. */
     mask = GENMASK_ULL(47, grainsizes[gran]);
     *ipa = (pfn_to_paddr(pte.walk.base) & mask) |
-- 
2.47.3


