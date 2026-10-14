Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEEBCC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 13:52:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449076.1665012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGzOl-0002Ia-Dl; Wed, 14 Oct 2026 13:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449076.1665012; Wed, 14 Oct 2026 13:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGzOl-0002IR-Ae; Wed, 14 Oct 2026 13:52:03 +0000
Received: by outflank-mailman (input) for mailman id 1449076;
 Wed, 14 Oct 2026 13:52:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGzOk-0002I7-8m
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:52:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGzOj-005hEH-LN
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:52:01 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6acf88fa-8faa-0a2a0a5109dd-0a2a4504a884-16
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:52:01 +0200
Received: from [52.101.193.0]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6acf8900-b57f-0a2a45040019-3465c100edf0-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:52:01 +0200
Received: from BY3PR04CA0021.namprd04.prod.outlook.com (2603:10b6:a03:217::26)
 by CH3PR12MB8755.namprd12.prod.outlook.com (2603:10b6:610:17e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 13:51:56 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::11) by BY3PR04CA0021.outlook.office365.com
 (2603:10b6:a03:217::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 13:51:55 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 13:51:53 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 08:51:46 -0500
Received: from fedora (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport; Wed, 14
 Oct 2026 08:51:46 -0500
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
 b=poryjatiZUG+UBswC6xe/NFumxaJbjNRM91jIfZbWyuFvgfVhkfWlqmWKgMmGEl0IE4Kx2GF/aD0yqmSv/VhwTDxj/TqGqz9r5Qn6iIDfDZvYy1VB8ifZZRM0xDRtDWvmCQss22FdQOFUQcABSL7NyAknwjlHwH3EPZyYq4BhYmiJcmLYsFJ0mWTDXtKbVUEE7nN8Rc8mSzbqDg/jzwjveZ6m/OyFeghhVCO3r30LRhZYm1N2e0u++jzBVSLofkioLbIA33NxeuOqtNPwL/VTfD0zhLuQ5j6+hhpDatzLuTT9ZUsN407tAuZL8aVKCllIZA9TzUR+EsU1VWGE6YY7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63JVV+iMj3kFDQfc/Papuas4qCGoPPdfcLCYLdJ7awI=;
 b=r4LkB8ci6jKKKMKNcf6BsdZFVbnzdUVVvPPnvoflyPC9nChgF7Wy/mEf3oJuIMIdNOzgh+SWdw/rk/zn1lUhYX5DMS2jWnXEYj5l0h0vxZ2wdqzacKGTFhaZokAa9TGCgS1NEZ5zMpluugzKkyFLDUYd6BjTyLURlh+Mb1G7lumXFwjOBaluMo5PBwA5GMG2Z79gZhFDv48zkqFa9Z2EN6A8urgf98T87LbTEhfFBgOdaDKmFvUA5zMVI3EALnNTS2UN0kCnBKyOHtWJRvm6xAuvyZun+ESHmyTz3hYR+J8xYBXo8cup7oZqERImmqEF7c3MgDuqOkwHjp3lKPLpPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63JVV+iMj3kFDQfc/Papuas4qCGoPPdfcLCYLdJ7awI=;
 b=ik6TINIs3ucHpmO05olDoTnY1nJwCQWZbdWhnA0Og1pe5atOJa38hUPVpCWqiPF9mZDEABEhSACWOWukxmZnSINqz75Xd95c+25WHrSrrJwWx8XkSUi/naYyN8kUAGjv45t9X8joGgFQk80SVxxjsPF8HJH1u1vkX5CQpjXpDCU=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, Jason Andryuk
	<jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>
Subject: [PATCH 1/2] amd-vi: set the size flag in the IOTLB page invalidation command
Date: Wed, 14 Oct 2026 09:51:42 -0400
Message-ID: <20261014135143.34220-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014135143.34220-1-jason.andryuk@amd.com>
References: <20261014135143.34220-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|CH3PR12MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: eb5bf6e8-64b0-4474-e401-08df29fa4dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	OMUmvUAMUpqgZ3r7dyixh+AIWkkWWebsdZDpe/hEfmhBrTCSAdrgCVbvX6l46rA21/KaMrPLStCECRTR5stf2qtEuqq4qZOK4BPG+piQu3QvcGmaF2FkhxWvIB1uwI4oKqoj7RP8xjMd22STOtBIkkDz2n7zSBZPCgur+7K0cRDNpqtUCQI7EAs1py0gPRVqo4b3xMz0EZxnOvzkVNIT6R1j+PmRckKpyZldJpt7CK/IdYETjDqwylbG9tioHvsdpdEyN8yErJODbuggsbY2yXsPh/mwRolH6jGdrrdS4XLqOZbhGAZ1QYlFk0i9qC0rna0hNr+EmiocH1SiHNxkHtDyjO9AjgB+h42PrDbVvNiuVSirNHHXVbnXtIipwAnnps0IvSTNKxCflT3gnHiRJ/cPNoJWKLHz0kXtKgeJj9fksgV8JvBHcQrp9cNjBaeE2ssw37oF3fE1TtbeuwjxRGMT8FehJrkM0iSr/sxU207Lr4jMv2toj9GI8h0gGM3nSGG0MQlA86JFZ6UFilX6DZWmZXj0inrf3Dyfr+a2Dcl3DnaZplF2bsoGy4EcBDjHtSgphRb2zDEzSpGuXSyemwz3dlthSjcKLlgY5lZysjFSZsdH7nMWZAYKvGmFsjSVVbJJQaBTJskRUnE7DfVf5beeyi+JSUTkg2H9qhB++y+JRPFfK34+vS4wQmSBg2elUner0JHcIer+mX1tiMlOUw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CtKBf6oPJ5P0QrNh6L9Z9itPr/2uIOgZo2V6nAim+9TseLbQJzGddobL2x2suwR1AFvCx5YtiOXV7J3XCfWZILs3YDA7x0gI84kX+KV9CnhV9V3EqesRhvC3hDpM2RQfENnyGhMuzPOMjEHG4B7wxxkxNg0P5jx5xr+XQbBnDANHZhbmuIO2uERXOfpKIBvDfOkWFo0t/dE6YShvDrF4ikRHxwkscY+bHnE+gwDkxJAo6VNNI+p29Fc9ZyONYH+FPN7yP2gbJ6OlCsnKvW9pVxOAW665KZr/xc4bCySnIanbxo59j5t9LBJUP+Ve91laxXxY1XS3iASIHk/oz9hLQTnj4bEgK0yi9Hpo9JTI7xmFYOhx0/iHZcQEW75Uisb6C1j1YLoq9dmFi+YcmwoygyzMQcoTJWHPXdWwF1x0tj9/VoM+wGFiwv0K4Z2AwZAc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 13:51:53.6417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5bf6e8-64b0-4474-e401-08df29fa4dff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8755
X-purgate-ID: tlsNG-ebf023/1791985921-538C1B50-680456A9/10/78276251493
X-purgate-type: spam
X-purgate-size: 2157

From: Stefano Stabellini <stefano.stabellini@amd.com>

The S bit of an INVALIDATE_IOTLB_PAGES command selects between the two
sizes the command can name: cleared, the invalidation covers 4 Kbytes;
set, it covers the range encoded by the first zero bit of the address,
counting from bit 12. invalidate_iotlb_pages() builds that encoding
whenever it is given a non-zero order or the all-pages address, and then
passes the field's mask where set_field_in_reg_u32() expects the shift.
The correct mask is 1 and the shift is 0.  When mask (1) is passed for
both, the value is shifted out of the field it was to occupy and the
bit is left clear.  i.e. (x << 1) & 1 is always 0.

An endpoint holding translations of its own is therefore told to drop one
page where it should have dropped a range.  The rest of the range is
kept in its cache after the page tables backing it have changed.

Pass the shift, as the sibling INVALIDATE_IOMMU_PAGES builder does.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
[ Reword commit message. ]
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
This was submitted to the security list, but it is out of scope.  Xenia
reviewed internally and Jan reviewed from the security list.

 xen/drivers/passthrough/amd/iommu_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
index 665e882a2d..abfbdf2b28 100644
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -212,7 +212,7 @@ static void invalidate_iotlb_pages(struct amd_iommu *iommu,
 
     set_field_in_reg_u32(sflag, 0,
                          IOMMU_INV_IOTLB_PAGES_S_FLAG_MASK,
-                         IOMMU_INV_IOTLB_PAGES_S_FLAG_MASK, &entry);
+                         IOMMU_INV_IOTLB_PAGES_S_FLAG_SHIFT, &entry);
 
     set_field_in_reg_u32((u32)addr_lo >> PAGE_SHIFT, entry,
                          IOMMU_INV_IOTLB_PAGES_ADDR_LOW_MASK,
-- 
2.56.0


