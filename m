Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A76606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 20:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gvgpE06f
Received: from list by lists.xenproject.org with outflank-mailman.1466066.1676430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMt1F-0008Ak-Gi; Fri, 30 Oct 2026 20:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1466066.1676430; Fri, 30 Oct 2026 20:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMt1F-0008Ad-E2; Fri, 30 Oct 2026 20:16:09 +0000
Received: by outflank-mailman (input) for mailman id 1466066;
 Fri, 30 Oct 2026 20:16:09 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMt1E-0008AX-VN
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 20:16:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMt1E-00FMLA-CE
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 21:16:08 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ae4facb-8faa-0a2a0a5109dd-0a2a4503e194-46
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 21:16:07 +0100
Received: from [40.107.201.60]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ae4fb06-fae8-0a2a45030019-286bc93c7caf-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 21:16:07 +0100
Received: from SJ0PR13CA0024.namprd13.prod.outlook.com (2603:10b6:a03:2c0::29)
 by CHXPR12MB999220.namprd12.prod.outlook.com (2603:10b6:610:2fd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 20:16:02 +0000
Received: from SJ1PEPF000037B5.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::56) by SJ0PR13CA0024.outlook.office365.com
 (2603:10b6:a03:2c0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.5 via Frontend Transport; Fri, 30
 Oct 2026 20:16:00 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000037B5.mail.protection.outlook.com (10.167.244.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Fri, 30 Oct 2026 20:16:00 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 15:15:59 -0500
Received: from amd.com (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Fri, 30 Oct 2026 15:15:58 -0500
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
 b=vdzkZq+FrAJLiQ2NM9HBADuXDnxDqQiaDawjj2J0B3f2aHQBImEqjoza8nuTsr2l2QqzRjqlZS/AbpxGOumnjyZI5ktIhWp/AtShm5u3AAaS4QvsvKDzhHZLJyL5SVksFB20I4mK2YzAynVwZy+l385rsicMz4ml0W7itLSHVUvrS1OBCqo3oZkmhO1xB/zjLvNICjl9b0neBtROSETwQYGcyuEp7+S7ZFND0I2FN+FCjh/UxnSkWwaXNmQi+8BqarzyU8m+achf1gAJ/SWqv3w3qcm4AvVksbq7Fr6PSsiye8Boy8jEUl81YnpJT+4zehe9HoPsuBPX8dZH7CeM7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1Hz381z67ll8PavJLQmYEch9DB4Vv2FFyJamyBbfgI=;
 b=SyhgAn0c9K5kVc0UERzHRbLb9p/uJCPTU4yFjrL96gj8Fr0Ca8nVQ7CPYUWpLIvFwTEMNS5CZWLHDBVrYeSJehSmAyOA6UE/IJtJJdkam89hDxfXOGdHJCtn3WwGrBYSAxumcRgVJzI5L7GSET+Estg5EKe+898wfMwgFJcSr6cGiWnj42TJ7Z3kjmSmDZhDmmwUy8VVVdoGWY0+HoU+l1dwM9aSuqPIxMAx+tiFsRKBMgFvH//KdT0Fgx1SXnJ0qj1ahu6qZHIbSu9bk5qVs3Gnnr7M4pwb5sOu0GclM/ii2QZ9TYvheR5LGRjnfeVCWZEI1OmLICSLRwj481/CLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1Hz381z67ll8PavJLQmYEch9DB4Vv2FFyJamyBbfgI=;
 b=gvgpE06f7Kj+v285gdg55J8c1ix0yUHnSzXiCpGzBOnzfRB+ClqZh0fsP47oqXaq6VMjPGNTCuEJ5QLz+wiqPqPYJTh1j0dDvkLhMjJQ/YIHB07PcJzXI4g++DDS8wQO2n77I4U2du62QnXRPWixbYyq7+fPyzuvGdEzhXslGuQ=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>
Subject: [PATCH] xen/gunzip: refuse a back-reference before the start of the output
Date: Fri, 30 Oct 2026 13:15:54 -0700
Message-ID: <20261030201554.1363058-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B5:EE_|CHXPR12MB999220:EE_
X-MS-Office365-Filtering-Correlation-Id: ccdd4697-08a3-4c2a-84b1-08df36c29d79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|261028144727099003|261021121427099003|261021123027099003|261022115727099003|261022105027099003|261022075727099003|261009223027099003|261026121527099003|261026140227099003|10067099003|11063799006|3023799007|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CHwhhUCNrU9jizaDej8CGBAvhxQWGNPif0YGRgGF1/XH5v4nCxrhsgE8vGrUQR0VyzYMICASyD7ZJnGJNFDP9pH3ecHKwBgGHu6bhnikcCoz4ZAGNmYZMg9SEqk5mPTRYPtlrJnad/BiMw0eXxPrevd73J69OPdsAddazn6i1JfH+0LrsPbeL0qeSJh+bhl2wo8AI89tDgLBVJLDUxGps0Gn1br7qyPqdTP+b2YKkJP7bY+vXI1qxH8uvjVhdgesD1GtCya0RZvMKMd6IqevlwSi3t7umEPGoeJexmeXOtmjmCH5qfNUhdynLvIE+GMpS3rjTLB+D84oitC1Gx1GF1NksaRdfOd0i1YO4iTzfFrbxBtokVIMlwxwERvsFxCf4fwUZVpy+CQNJsusEhL5lndbFPXtr5nw8PXzQ57pnjh/biiI+a5IcgAw3gBEBpu2bcb4pyH9eI1V/1K4XuY4r6Ml5rE+17uALceG3Ox8xh49H32Pc0lWktQeLnRkv5naIe5Cb2IiacgTZCY7GE2PpJVdyrirl4LBccvRP2NcnlDu8sOZQEFZgvgU8WmQdVaQbKJ77PVDY1wrs7O/4FL/IjGPjUQHzQB/+j8CCG1XVRsGXkV9qm6HxAUkilDN6Mrl3NrN6YtxIAHPLNcX4pYW7iJUPoyEY19FX3k+1jl5cokJOfUVUixwDc+jJpPZTbBHsNCW5tu/Hk6C6idjN9WXOw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(261028144727099003)(261021121427099003)(261021123027099003)(261022115727099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(11063799006)(3023799007)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CvjPrJzDBnyGBgAOXASQxFPwtzZj/LiwJMtJX5v606zNp/r299IFY9ii9IGoBlptQtNZ6qyZ1/GhT3f/txxKnAD1pYmr4vej5cYpXvDrxu3zlEV1AtNY2kJIWD8rai34g29MNNvSvyzjhxNUkmWPAyHEVhR3uYrnhWvfajjaIrCYbq3zs1cRWATFofLzqUbVzSeT3DyRtoCWobJ4H8Xzohi3boY1YDbfmWWX5iWbzRZIGtXlYSAO4Wdm/PBWgotziiQzWCpscO3nB2qWv+mNmdcDWP/Jgtv+thXgCrHxtTejEhE4O7cjpfvVmbcCKEZ13EZp7aY+j1X+YnFS3JD2RhqKXNiLPh+VigmA0xnRiuhFdwq3K6X7FvBtJFJBmeQeVqmX2t/7I2iN8vg6tRM/KJA11BDenT0GEPBqirXidDVYlTpzFLwTiHs9FYwHkZ4X
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 20:16:00.2108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccdd4697-08a3-4c2a-84b1-08df36c29d79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR12MB999220
X-purgate-ID: tlsNG-33051d/1793391367-6D4D74E9-78C2B243/10/78276251493
X-purgate-type: spam
X-purgate-size: 2318
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

inflate_codes() copies each length/distance pair from that many bytes
behind the write position, and does not check the distance against the
bytes written so far. RFC 1951 (section 3.2.3) forbids a distance
reaching back before the start of the output, but a corrupt or crafted
image can carry one. The source position is then taken modulo WSIZE,
and because Xen's window is the output buffer itself, sized for the
image and not 2 GiB long, the copy reads from up to 32 KiB below offset
2 GiB of that buffer: memory the decompressor was never given, whose
contents end up in the unpacked kernel. The CRC32 and length checks of
the trailer only reject the image afterwards, once that memory has been
read.

Check the distance as soon as it is decoded, against the bytes written
so far, the current window position plus what earlier flushes of the
window wrote out, and refuse the block as invalid, as for an undefined
code, when it reaches back further. Xen then stops with "invalid
compressed format (err=1)", as for any other invalid block, without
reading memory outside the output.

Fixes: e2b1ebf4de50 ("x86: Support booting a bzImage format domain 0 kernel.")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau Monné <roger@xenproject.org>
---
 xen/common/gzip/inflate.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index cb146555c8..a40e83b250 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -603,8 +603,13 @@ static int __init inflate_codes(
                 } while ((e = (t = t->v.t + ((unsigned)b & mask_bits[e]))->e) > 16);
             DUMPBITS(t->b);
             NEEDBITS(s, e);
-            d = w - t->v.n - ((unsigned)b & mask_bits[e]);
+            d = t->v.n + ((unsigned)b & mask_bits[e]);
             DUMPBITS(e);
+
+            if (d > w + s->bytes_out)
+                return 1;
+
+            d = w - d;
             Tracevv((stderr,"\\[%d,%d]", w-d, n));
 
             /* do the copy */
-- 
2.47.3


