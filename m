Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8CC606A336
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 22:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KKoHmQml
Received: from list by lists.xenproject.org with outflank-mailman.1461703.1672751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLStY-00045Q-IV; Mon, 26 Oct 2026 22:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461703.1672751; Mon, 26 Oct 2026 22:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLStY-00045J-Fb; Mon, 26 Oct 2026 22:10:20 +0000
Received: by outflank-mailman (input) for mailman id 1461703;
 Mon, 26 Oct 2026 22:10:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xLStW-00045C-Ne
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 22:10:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLStV-006yIc-MU
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 23:10:17 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6adfcfa5-bab6-0a2a0a5309dd-0a2a45099286-34
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 23:10:17 +0100
Received: from [40.93.196.47]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6adfcfc7-be1a-0a2a45090019-285dc42f70a3-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 23:10:16 +0100
Received: from CY5PR22CA0047.namprd22.prod.outlook.com (2603:10b6:930:1d::34)
 by SA3PR12MB7782.namprd12.prod.outlook.com (2603:10b6:806:31c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 22:10:12 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:930:1d:cafe::9b) by CY5PR22CA0047.outlook.office365.com
 (2603:10b6:930:1d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 22:10:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 22:10:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 26 Oct
 2026 17:10:10 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 26 Oct
 2026 17:10:10 -0500
Received: from amd.com (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Mon, 26 Oct 2026 17:10:10 -0500
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
 b=IxCP5WFZ/AFiy3AI6JhA6N0d+qRdDWER01kw176POt+AFUQHneBfIDIdOgAAWrFLX1NWsqned+Q+d7e1ioiR6M9we/81jQjMtq3cCe97DDeDrjVA72cqJQ45VdYcN0bYCo9XWMg8F6TLF+Z7PYvaOTjqjExbvg7FMFV57fEBRck1bozuTFOfJofGUuh9iVVht5G2KhA9rfadzSDpNhZ7xeYkueCiws0XQguMhyPSMsAwhNPV9rjr8sse+auE3yqUIkcVjpqQvIkSTuZJrj4uQCeT5XZy9pREqIIBRTW37Cm07u1WsbxoQC4nUtbodyPVsZUKyjwO5sryygPKWMtgUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgRuL5osHe+qZq2ftiIHHB4CIWGBlYNFTN/IHvgSaa0=;
 b=pThDfYlnLWWYEyq9Wb8DHk2tGbwY6o4ydCKWo8+QAiOl/ConJPbZspbjpegmNHoqsakKMjT+Pwie8/QoBS/+0r525tZjGlVC2kqGmT3FasnmH++Gbn6ttJDA+g0VsKiqRkOf8GFM34qVuQnjrcJfYZGdE2t6LYVkO7aGzDmQolN0oyXROt9wvlCXDI16NnH/QbUP3RjQZS1k5eZbz+ZWKP+j3NaCx5Jvr3o1ARwJlSYS0fPdQ5p0CNl9mFMq9c+ACSzihWR5yvarLfAJv0jpYwd5MONc3DI6RIi+STFRxvK9ZoPJmysa562HA/zUNEMGW5TklgCOisMosUrwSWWgSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgRuL5osHe+qZq2ftiIHHB4CIWGBlYNFTN/IHvgSaa0=;
 b=KKoHmQmlMaxHueRFSkGwfZXZmU5EKEqpxXgL95fgKy5U8BpO8fHXcJi+TI1IiAHVdyi3fDqjK5JvgPVy2yFo1UFe1aWsAnXdQA2/IobnXYfoMl7U2ptAQcnUGs5ozz8lzogUbKsV0H4av1AqxOPxmz0E90pLBWxXOEu/cSYvfng=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger@xenproject.org>, <jason.andryuk@amd.com>,
	<teddy.astie@vates.tech>
Subject: [PATCH v2] x86/bzimage: Check that the payload lies within the image
Date: Mon, 26 Oct 2026 15:10:08 -0700
Message-ID: <20261026221008.1143527-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020214825.3655848-1-stefano.stabellini@amd.com>
References: <20261020214825.3655848-1-stefano.stabellini@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|SA3PR12MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: bb0fbb6d-9809-4d14-510a-08df33ade757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|261026140227099003|11063799006|56012099006|261022075727099003|261021121427099003|261022115727099003|261022105027099003|10067099003|261021123027099003|22082099003|18002099003|261026121527099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	0j4bo7iSdOYuxlvK8sHcJex/012Ra5qTtlMDN61sPRikgu1mraBAkLxh9X+c4DlsZlCRD/gTNMLdmqX1pvmHW5DQJSKVVkWCZU0AnQnkoPsmX0h7y0p5U3M0UElyRgqosJ9TgDdL0D9/ozdhyb76Hhwnq+zPDA4YxECLKjMjGuORaaAM8/CHRtERNHpwK43AdRobL+z6cHyYxtcUtmin7ro4OEj4zK0l/HTn72cyvYSPKMsd6/ReKq8Fdy/R6xCG06wLMNg3wssU1hheXfst2dkYWrsEpbR8+3urAEeeD0bUxPoXqAIcNIwnSLRriq/vRnkF9FwyAGkqe0ascOjsWPewzy1yjN6DmgS4PR5BbrjCEsoLtaF4D913LVzyxVznFjCjxXg0841NS59PDsEJ8qeU14xfULfYxXZlMTjFVGR/ulRNu4O0vnax2EE0uRXNaAoeoc3IvDfkJzr50SjSNFkul1J07aRnkEw0Uvm4sPOnyYmpym1QTrVFJVcu2O0PAf8I5wtzlWYiBGl7IT57q9xHWw+ByKuhuasfK3wvw6Aorj0QU57coNjsjcr+ZbhhUwLM69rigxuYYzR0hgoC2fhlKESW45xpJ8JFcMJYpfMPBCM8aEwUpt1ee9RR7sJvpiaM2rQhqX/B5xgzGBmCz8sXitv3i2gEEMnHgloT9a8BYm23wU6jwYU63rsrAlgfJZjmLP+EFVd7GEvTCrFNlg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(261026140227099003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261022115727099003)(261022105027099003)(10067099003)(261021123027099003)(22082099003)(18002099003)(261026121527099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZPQ6CaQ63kZWNgvgiPA75mSLB1Mcj3SyGCFXmqtLjSXI0nar6+icD1Dm+FvamIbQTp0GI61gBRTY1MgeI49HD6mYAtN6Tjqiho7+RmJiEUas6ZYwgCsdiITPSGGOeJ95eEe4Kv9nZLyD1ypYaAokfZtWz7xxmCAKv4Nr8MU/vtKuiQpXtNxwzjYU6OsF00//QBT3VpX4KI9FQA4XtOZvhJ/wORvfLuo0bHGqZGt7v8kI3k/2eAwAHj31qT7vf0/7Gfa+WhvxMfob7IYVyfeXzkLJYQtXY7mlFDQO9R131M1+QU5OjqEFkHWGGf+slwPin6x+Lvs46i/AWkZfqEPZO/JMuMI8V/vrojlPflKI9mq2JEH2aFUsGHsoI0QAtK02kcHF2ci5BBDiq61ttma3/Bf6GwvkMbe4psm3t1skfoe0rUCECCqq1L7eDRMVDYaP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 22:10:11.3184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0fbb6d-9809-4d14-510a-08df33ade757
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7782
X-purgate-ID: tlsNG-bad1c0/1793052617-BC2F4034-F956AC34/0/0
X-purgate-type: clean
X-purgate-size: 2422
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

bzimage_check() doesn't validate setup_sects, payload_offset or
payload_length against the image size.  A truncated or malformed bzImage
therefore makes bzimage_headroom() and bzimage_parse() read beyond the
end of the boot module, which shows up as a fatal page fault, a bogus
headroom, or a decompression failure, rather than as a bad image.

Reject such a header up front.  bzimage_parse() passes bzimage_check() a
length which includes the decompression headroom in front of the image,
so subtract it to check against the image alone.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- drop the UL suffix: setup_sects is 8 bits wide, so the multiplication
  cannot overflow, and the offset is now computed the same way as where
  bzimage_headroom() and bzimage_parse() use it
- reword the error message
- drop the dereferences from the comment

 xen/arch/x86/bzimage.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index 66f648f311..41f19221ac 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -54,6 +54,8 @@ struct __packed setup_header {
 
 static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
 {
+    unsigned long payload_start;
+
     if ( len < sizeof(struct setup_header) )
         return 0;
 
@@ -65,6 +67,15 @@ static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
            hdr->version >> 8, hdr->version & 0xff);
         return -EINVAL;
     }
+
+    payload_start = (hdr->setup_sects + 1) * 512 + hdr->payload_offset;
+    if ( payload_start > len || hdr->payload_length > len - payload_start )
+    {
+        printk("bzImage payload %#x@%#lx past the image size (%#lx)\n",
+               hdr->payload_length, payload_start, len);
+        return -EINVAL;
+    }
+
     return 1;
 }
 
@@ -107,7 +118,8 @@ int __init bzimage_parse(void *image_base, void **image_start,
                          unsigned long *image_len)
 {
     struct setup_header *hdr = (struct setup_header *)(*image_start);
-    int err = bzimage_check(hdr, *image_len);
+    /* image_len also counts the headroom ahead of image_start. */
+    int err = bzimage_check(hdr, *image_len - (*image_start - image_base));
     unsigned long output_len;
 
     if ( err < 0 )
-- 
2.47.3


