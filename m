Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6798C606A32A
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 21:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=GOkVarQ8
Received: from list by lists.xenproject.org with outflank-mailman.1456563.1669814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJHhC-0004FF-2L; Tue, 20 Oct 2026 21:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456563.1669814; Tue, 20 Oct 2026 21:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJHhB-0004F8-Vz; Tue, 20 Oct 2026 21:48:33 +0000
Received: by outflank-mailman (input) for mailman id 1456563;
 Tue, 20 Oct 2026 21:48:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xJHhA-0004EF-FU
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 21:48:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJHh9-006GiV-Sb
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 23:48:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ad7e159-e002-0a2a0a5209dd-0a2a4508b7c8-28
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 23:48:31 +0200
Received: from [40.93.201.43]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ad7e1ae-f659-0a2a45080019-285dc92bc0e3-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 23:48:31 +0200
Received: from CH2PR18CA0023.namprd18.prod.outlook.com (2603:10b6:610:4f::33)
 by DS7PR12MB9044.namprd12.prod.outlook.com (2603:10b6:8:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 21:48:27 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::8b) by CH2PR18CA0023.outlook.office365.com
 (2603:10b6:610:4f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 21:48:27 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 21:48:27 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 20 Oct
 2026 16:48:26 -0500
Received: from amd.com (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Tue, 20 Oct 2026 16:48:26 -0500
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
 b=woNk6nEOSMDBxgreeVSUbDBT6U5cMRFcAYdG30X3x2kU2Rie04LjaIlaksjXLslR75HGfSH2VEGo4We/zc0WmWwCrk+XHaOZXkq7k3YUGQLYG7gTYkb8PHVfOCpZux7uWJpVN7Cyq83jURuMN/eLZngixdfxb2KvB2UyBiM9eRJpokoY4Oka8OhW3XLU5OFB2JilIiCwVKJiU9EZlb5DFWHC6r/2YVebjVsbI5xsWpKP6Lj9IOW4ofJOZ58e2Ck2oPDTTXNFdSHaSVSrnFZ8B9U+jICuwKXZeQK/gLrLCIejGQ0lMFGJIwYlt81ZkAMvnniDRyqa/bp9PvQVP/JggA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWfJxBnbFCN8jfpoKTdBHh0yaVi1TS/lq8L8UsyMq8I=;
 b=tBiQNkRauRQ18m5Vy68JVtcpXMUgyI2eHPH6LQMNl5GFhyOid62znwwn8x4GP+qRckE3Jlz7zB5xLU1CfXHyrzxOFTlyTcOnVEXlw6wpJIBPV+b2H59V4Q069X80FrBrXPgjcFU7he1aLeC/iwDgH5WKLqkgdquEMv5dOPDe6u7A/HBkUjkVjlHoHOKtU5D+aNSJk1HHgzk8fI0b8NDmqDaymZBHGp8i8oxz6emFqM3ngd7fFbfO1v8Rm+FQBb5Hukx/Uiao7NewSoKrrxM53/67oweyS45L6kOSlp9N+QfbXNiywpsEWmzYAfAlkRJHg5AO54dWcbmstAtip1Mgjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWfJxBnbFCN8jfpoKTdBHh0yaVi1TS/lq8L8UsyMq8I=;
 b=GOkVarQ8qMt1/dzOAyeTX274Fqg01I+NHo0umJ8RGn4Wo4zCIg5eG3DzFlGFVzMto9nt5PIY9RYwavyn2fLkTr43vt6aVfCEK/ahmvML0pHENjHNB25BUb+9EQktIK/fOitgeD7zy6RVkemNyDm3Sz+7G4611CCUREaNwo8SytU=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger@xenproject.org>,
	<jason.andryuk@amd.com>, <teddy.astie@vates.tech>,
	<stefano.stabellini@amd.com>
Subject: [PATCH] x86/bzimage: Check that the payload lies within the image
Date: Tue, 20 Oct 2026 14:48:25 -0700
Message-ID: <20261020214825.3655848-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|DS7PR12MB9044:EE_
X-MS-Office365-Filtering-Correlation-Id: f9700f1f-bd03-4a33-f501-08df2ef3df7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|10067099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	CPEf6+iGsWR3BXSg6i+XbjvdI1UKh/Hyk2gLUjTSchbSh29y9/bxwW8uJXuoelE/VJa2yP1LGmQd/G0p32X3B6vHkH9sN01HUsdOvJh15QdYmLzz3iM7HpDmBbq+1AzgnJLWUd1vlvdrqqB90hoMOHoJR61HyLZ9Q9pibMVHby298i62QEBZka6l36TVDIHIAKdhlpYmBvn2Ar42+gvuXU3wHS+ZpQdQ7PseyT78kNqaH6KeQWLDtg/Ukj+gbpCX+fmbmC7C+l38g9a1hp+1bFb60DBWEL123sxiDz4136oCYmk/7ULt7WtkfBtCr1JfHhriTc+AV8Jo/NvrJHvC4cTUcdZmlh8yyJwTxPAyy2o3y5WQrroMIYNog46PgPF15bzBpcJuR/gJlhqJyW7s/Mqnjhq8VHL4rNSvOP10QZkG2f9uZcLIAY1aZALIq4c5FtbEfu1ov3wf4lq/xS8MZT4vvFWUVuh9hWCyVAmDPQOdIK1QFM+Qr+WHjOqrNc+3NjVWUW4ID+x43CujRPLEGoMIChmAzecKrPnQjr7yYmtT7Aix6T6k6KNJjujlFR3MDJG/faQDcMUlTezswyha3669mPHWwrsDywv3gU6DqKtCUaBYz/Pcm93yEFosPtjcbiyvqKSEnUnasY45qCIY/ufFaAZtOyim1tCCU3uEGwwnVwRIuBRBU/NT42EAALSU8BEAIw3z2sNgFzf4fEFPPA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(10067099003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0YQm5kYnI7fT9uhNNiX70N3BJJ4N2dY7OsyMe0uj/wJ6be8R+VX096d6joEH84WmUEwOMVK01zLUfPnUFQnaXz3Pq3NBy87IOSLwVbK16qs6sNUlfm1vUlRSNtwZrfwa7XApJr6D1Nk++yPe7COSEZm+9M3NhCflNeRnW9A92qfvqIlR531ibmcazHbO/kDAjmQjCckKzogQ2RpnhTA8qzSQl237s8uJZSluKPCk9oSp3nYRgw5qpmmsZAMADfnrRYMGmBJ3zGLIrIsLpNHhylCICe/AFKnTstlP/TefG7cZoYWuxaBPPqKs6SZFAu6vjaCjFlQMTdmyOlrPy+BoMknz/WWnfaSyGKF0d6XlxQ5MMN2V/e37QvCeZnQP4YPO80iu9Wf0Y78VE4oEutyZpijeBlC8QOKvcUtlFe4v2RIkJG3P2yF+YoBQL+xRcv64
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 21:48:27.0877
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9700f1f-bd03-4a33-f501-08df2ef3df7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9044
X-purgate-ID: tlsNG-c1860d/1792532911-CDB4987B-C8CBFB17/0/0
X-purgate-type: clean
X-purgate-size: 2144
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
 xen/arch/x86/bzimage.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index 66f648f311..a5c48755b6 100644
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
+    payload_start = (hdr->setup_sects + 1) * 512UL + hdr->payload_offset;
+    if ( payload_start > len || hdr->payload_length > len - payload_start )
+    {
+        printk("bzImage payload %#x@%#lx exceeds the %#lx byte image\n",
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
+    /* *image_len also counts the headroom ahead of *image_start. */
+    int err = bzimage_check(hdr, *image_len - (*image_start - image_base));
     unsigned long output_len;
 
     if ( err < 0 )
-- 
2.43.0


