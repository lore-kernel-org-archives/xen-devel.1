Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52036606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RFxbdEbY
Received: from list by lists.xenproject.org with outflank-mailman.1494017.1693696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbB1-0004I2-Bz; Wed, 18 Nov 2026 08:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494017.1693696; Wed, 18 Nov 2026 08:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTbB1-0004Hv-91; Wed, 18 Nov 2026 08:37:59 +0000
Received: by outflank-mailman (input) for mailman id 1494017;
 Wed, 18 Nov 2026 08:37:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xTbAz-0004Gj-Su
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:37:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTbAz-004fJp-8u
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:37:57 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afd63dc-2eae-0a2a0a5409dd-0a2a450ab956-20
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:37:56 +0100
Received: from [52.101.48.38]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6afd63e3-f2d2-0a2a450a0019-3465302621d8-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:37:56 +0100
Received: from SJ0PR05CA0142.namprd05.prod.outlook.com (2603:10b6:a03:33d::27)
 by DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 08:37:50 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::2) by SJ0PR05CA0142.outlook.office365.com
 (2603:10b6:a03:33d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 18
 Nov 2026 08:37:50 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 08:37:50 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 02:37:50 -0600
Received: from APPOL-18KY0J4.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 02:37:49 -0600
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
 b=IXwlgijQUhkCFTMNiwLd3EqokkZ5zi4xj4qC5YSuKjY9oa6SnwE3PQCJtZpmyRRM8AgY4lUsvWjOTDSrIXRooijvbCGHgzlqgLW4sPKrHRt6Jd8ha8J7vk6JEd8H9Hg2/DW3NM/mwSLe/m6EIc0IwgoI8/VMvaLOORxVcfC9iXFDgGVDu8lCYJasVb07tOeM3ClsoMPEs2GIVGOUxq9L1dsqW5tQR72AYbfdvkn79HA+Y3zAOs4Y9AHCu5IZs9dTWEnKxM4euWBbIfI9KzubXPxiSHbkCSR5RjBbLZO3kQCx4N9UwQZrJpkpdMRCYPVSSyvfhSwwTomboYwsqh914Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=367FIxPIRRoWf+05E1+aWh6DlYSYbZJLLc7xNjyra3A=;
 b=j2XPAN5grAp/TYBKHM+QJ3EBdTz4vaYLIAWvCBKuuhujezSRSTxePZrblw0TczMMTJUDvHA9UEBXFlhnqBL5P5WtHRJlcSXMiEPuWqhJNPpdmsaHGD8w96bHSiB9ZKhsVxCCrTVmVR/NhAKYrQaxJD8lc5UPfSAOnv7IwXO5OWqZQeYL4fYYDy+NF/45uKopbhVGZF7UA+M7c9y5FJs3eMxET0egTdq0WNs7i08jl9dvZQhaXN9MeHvQayXQpJ8p1++hBdT+iSYEk/j/VXX/bgRqo0WKT9cA+Zc/lm5k7R+eI+usCy3Jpzn3W0U8tAwFwUbkFY/UfY7LYBrnXyJoHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=367FIxPIRRoWf+05E1+aWh6DlYSYbZJLLc7xNjyra3A=;
 b=RFxbdEbYRDKtOwBOHxjwM5BWjZXS0f1XHCiMuPXdnxlc1j1ysn22jggnEMYrOIVZUGZymCDKF43WYDhtANmjNsmv5aMkKWT5hZqGGM0swmhZe6POAaiJjVQQL0eUU9dsa+GNKixNyRUzTkZ+isFp8xDvYNoAd8MHB89G8gd/H48=
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
Subject: [PATCH] xen/arm: traps: Fix sign extension logic in sign_extend()
Date: Wed, 18 Nov 2026 09:37:42 +0100
Message-ID: <20261118083742.32484-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|DS4PR12MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 3163d4bd-750f-420f-97d9-08df454f3b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|261009223027099003|56012099006|11063799006|261102123227099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	wTLH3KvsX2sOc9C1wwmaTAjtrcR9CCmLG9DfLGecizEmSEnYqlhkSsdXWDKiMEUI9twkcJAjME9gH3p2d1fAIX8jXi8OwpVgViX8HlnCxCT9HPGUAMeqT7rbYPpOE9cErgXqma55CS7bjNd8/P+ky9t3Qh6mEKTiWHcalOCqirj50uT+wIQkuVQRjfrmgGn6bY2u4etmns/7Pojjc1AZjGR8TwqcEEmO0BCTxW1PJ/DbLnfEgmvoF/pafcunBPNEpGkFfwTgItxwuzNI6IJHAJapTogm6An2uI7g0/LeSMig8YDzuTDcckayAonPtIPejEGkChZKEx8Dzssbk65fZu3xAFbJlbIE0mAXB/SkZ9szMNLmeHhDc0x38HvAQ9ar15AFj7lDjJxdccbtYYDID5lkLjjlPPLKvJDOELJqWdX6LA+IYiHOo7Z/vgGPARWI4fVvF2hBKQNdXOptymb7MQu4fuOblpeaUb4bz/l1LU9DpUW9rjHWIRsA+e5UTWqvIrYDgDt2Cn3wVa5rUM8Lnwf3wpAIFJLOhwbZjuPeENezKdTr7wtzV/a8whF+fkiYiJcygRv5qUB27ovpcb9UuwXAlcfNZYgmB983T3eVG6juA2i6nRsg28GmBYmDsuJLjMzekp+ACa4z9FY+Qles9F9WmXZLGxH4G9pYSGl34/MA4cP7IW3OTSXxBTSp6H/7btZ8KjZBI3aYvm029g7B8w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Gjo3IFHp6W9necd+v4PsWF5JDh5+8uPZ7OfeQFyZwM48aK0u/CIccDZpoMQ3oGE6xNZ/EA896p/SeLrNGUatgnB3aAOYztGLmu+5xJue4Mv+MTFk8okdDoPNafhOYYZ9VPGLJASzxJZJ2v+r4DAtIVYMpihPmNnJZ+fWoX0U+CvO2TNCuoqf04VzF43yB+c6gYH/rNCP/dYav3/t+LFXWFxfCf8wpTcB5Po/Lp5S29FGTUj4Twxy2dotfbEZh7PqgdVpq0BArBWXKecoF83TOgh/rdKdM7njW4jma03AaJnFuSNigfyh86sxG8zYLm5Kanf+2RX4pTY0ihzfYBVYrD130X2kiVipJ+/jWT31eo40KWlO0YmxUrnYAYG8GlquE4lNKdoo8XsxNxUyOyWhDui8y7um8QJKkFp0WaLYaTAQH5pvfnzSRcoYNWjvqcOU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:37:50.6933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3163d4bd-750f-420f-97d9-08df454f3b35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9660
X-purgate-ID: tlsNG-4011c0/1794991076-4B6D6CFC-E1E10C3D/0/0
X-purgate-type: clean
X-purgate-size: 1206
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

At the moment, we always sign extend to the full register width, i.e.
64-bit on Arm64, even though for byte and half-word accesses the
destination can also be a W (32-bit) register (LDRSB Wt, LDRSH Wt). In
that case, the architecture requires bits [63:32] of Xt to be zero, but
a subsequent use of Xt by the guest sees them set to ones. Fix it.

Fixes: ac0ca6895b65 ("xen/arm: io: Support sign-extension for every read access")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/include/asm/traps.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
index 3b40afe26259..c5b6ff5b788b 100644
--- a/xen/arch/arm/include/asm/traps.h
+++ b/xen/arch/arm/include/asm/traps.h
@@ -111,6 +111,12 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
          */
         BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
         r |= (~0UL) << size;
+
+#ifdef CONFIG_ARM_64
+        /* When loading to W register we should only sign extend to 32-bit */
+        if ( !dabt.sf )
+            r = (uint32_t)r;
+#endif
     }
 
     return r;
-- 
2.43.0


