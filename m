Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E45A606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 22:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qx1I1Azd
Received: from list by lists.xenproject.org with outflank-mailman.1456585.1669832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJI0X-0007m9-O5; Tue, 20 Oct 2026 22:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456585.1669832; Tue, 20 Oct 2026 22:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJI0X-0007m2-LN; Tue, 20 Oct 2026 22:08:33 +0000
Received: by outflank-mailman (input) for mailman id 1456585;
 Tue, 20 Oct 2026 22:08:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xJI0V-0007kO-Ee
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:08:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJI0U-003pUG-MT
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 00:08:30 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ad7e62a-8faa-0a2a0a5109dd-0a2a450ca2ac-24
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 00:08:30 +0200
Received: from [52.101.48.53]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ad7e65c-f479-0a2a450c0019-34653035395a-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 00:08:30 +0200
Received: from CH5P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::10)
 by MW6PR12MB8866.namprd12.prod.outlook.com (2603:10b6:303:24c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 22:08:26 +0000
Received: from BL6PEPF0006C3DA.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::9a) by CH5P223CA0002.outlook.office365.com
 (2603:10b6:610:1f3::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 20 Oct 2026 22:08:25 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0006C3DA.mail.protection.outlook.com (10.167.249.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 22:08:25 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 20 Oct
 2026 17:08:25 -0500
Received: from amd.com (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Tue, 20 Oct 2026 17:08:24 -0500
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
 b=xjjv2jLpxXhIcXeZtgGvESP5yoDQqTVBR6lRKUKAKR1cIY62FgX4C383A19qeB71Z5AUp8nO/excsTdzAYfkFDEUq0ElSW2O4NCITZKy79z80U6GJn2fkHCXA1mLzPa8oCLwVv0CDMQyf+PqJ3p9OvjdFL+YaJtPETQf6IAZ1IHABJXbCX6/8x+hRSh0FgxezbXjfGR1azf8mtLxffMDhBp6vQ+p8r4j3kMcI+cq9dvwAIsS3+s49uIPxwD6Vzedmtiecs8TZmEEBScDUH1DRLyhzbULKLpJu69n4ErzoTOQlNAUcelREL1j4MEQI2y2cvIeR/lgr/GdG+ol8NLSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XFgylyY5lCQI8u54Xl+Lijc4iEF4EWHbGduJ1YJbxQ=;
 b=sgnU4k5JRvTy8P3WFdqpQD287xZKP5bTEmkeVupyV/HyMfFQrCqIJewP2mKsRm9yPgVkR41+aYdh2XqKxwpD7o5sNjuispq3xIFEUaHdOlwodHz+o5iDASAp2il7G4wauzRVUHXtEAPAHCYuXtYZ0+J0qnHnVdfUr2it0AbYnUzljgCPE4S1WnhKHE81/o3aqTjWBfcZgl0tsW66H/LtGltJzDpK7GOnYTtNr8nWb5hQVFtb6BX/ZGKqWPqMK3TIzmT8yvDsV/pgKA00ZFyO2z9UwR8HF/CPs2nnkqCNZBkWQSDE/67EgeMtoLtJB+LdOuJ2YF5WYHn6utAfzdq7vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XFgylyY5lCQI8u54Xl+Lijc4iEF4EWHbGduJ1YJbxQ=;
 b=qx1I1AzdY7bc/rz7SNxl+9Kc4dilm5g4LpAkO9u5S4wHvTcMd3Ytx3izj0sxf3pDg2KLlvcc0wYuRbLs6o1CsTTkRfWp2Wvkyv0JMUlg1I2fM5HXnJJNXRTjKiBvMP6nCVDCGLAK0UTgV8w0gXrT6vLsRoSo3IZILAMfCAwl+qM=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger@xenproject.org>,
	<jason.andryuk@amd.com>, <teddy.astie@vates.tech>,
	<stefano.stabellini@amd.com>
Subject: [PATCH] xen/amd/iommu: Don't swap the IVMD read and write permissions
Date: Tue, 20 Oct 2026 15:08:21 -0700
Message-ID: <20261020220821.3681692-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0006C3DA:EE_|MW6PR12MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 8377a12a-3df2-410f-c799-08df2ef6a9bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|10067099003|18002099003|11063799006|260925021911599003|260925022911599003|260925021311599003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	soDy8W2TGJjhGHX0GbPQ4jWHbNCBivqJHzmkZOz4MfzjpW7+2BSI9VfHTXeyyvZfwlikyljaLH5VN9XbpwKvXc50OzKj2qM/PXoJcnTp+yeB9tMCk/B0asVP4csGvze621RziNt4OXIQ7rfZg0FCWvWg0tb3dDfiiahvbgpPQqM+38ArMW4mCbGCghunjYxx9RRWdirng3Z22n2TG3qArT0d4l/3/DUPu42uATWYZUryPgSEcQvOgvoU5YbJups4fSOSpD4x0bh1EWr+mJQnVCZCsIO5OxhdUHpem/Q073dYh6OPimt/cp5WdOiPAfQGwsWCFOaDyT3ZI/FUQZkxEjfdN6KFD1KntuAyAkKogN/MFToWcDTgBKipN8QYyyvu448JC0nAq+C6zsBVuTW+olArhVSQ1ec+mDQGu5LirVr9V30ninKZ+PP7RAD319mmWw0M1bWHe4BagQvSIKT7H8APOPFrtDyBTrxTkILDTeKpeDhJFLPUvIHzvIbxvU/pVOL7Rxhi74KEjIG4U24mEL4KkMzzSdk+C/HfpM+6Wg8M0nvict8ZCFP4Wh4EBhM9te6n7SwVNj+gB7TZqUNpBgYXZnXA646s0qlXSd6+rM8CLQFnsh/JTeZqoOcacr86AyvaZAjB4WAfPYeKgb8fBJ4qkcSOqFIpEtO93Bo7YOQIoqUdAstwyRePgyfjaLw0AWzmMx5zB5Gi9avHsjLJKQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(10067099003)(18002099003)(11063799006)(260925021911599003)(260925022911599003)(260925021311599003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tFXu3mm5KhNeuTaf8wT2JEqKoEoCX6goSJ7YyLk+iDl9a9Dl8nzMnbpJM16lWz/WWSRfpERbLSJOKnwkjKfaTbUIS4UBgp/Hf5SVCIIWVqOjRBv/RKmJcI3XEoucdzEaNb9sS6r7d/zbU3rzj629vidZFzUP/YDaXhXKj+vTa4+Nn9/pE+ADlgPakCnkgNyNAtaidjjv5a9+saUOf01yl734FB5DI7m4hZJESR9bNMccsA+aNYYxRxVBXP6/JkZjFudZtbsSKk7B1ioyYrplmycWB5OffbM30E8uMjIL680XIDVOtXiEn7u4JO78+Qr43HqZ9RcFRpZOwEMQ3o+Z/cqqzfpzDt6zib9dtoCdoMYwKlSsnUBBKLkpzTr8t/tR+lyz3wJQnE/BDDAjr4d1tR1WSPhLwflwQnyXtxyNHIuoWqnZ3JsZlFEuTyCDI+RZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 22:08:25.3938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8377a12a-3df2-410f-c799-08df2ef6a9bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0006C3DA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8866
X-purgate-ID: tlsNG-d25034/1792534110-76CDBA5B-12CFB247/0/0
X-purgate-type: clean
X-purgate-size: 1209
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Per the IVMD Flags definition, bit 1 is IR and bit 2 is IW, matching
ACPI_IVMD_READ and ACPI_IVMD_WRITE.  parse_ivmd_block() takes iw from
the former and ir from the latter, so a unity range firmware declares
read-only is mapped write-only, and vice versa.

Ranges with both permissions, including Xen's own, are unaffected.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/drivers/passthrough/amd/iommu_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index 4688908824..fe3dee872c 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -414,8 +414,8 @@ static int __init parse_ivmd_block(const struct acpi_ivrs_memory *ivmd_block)
         exclusion = true;
     else if ( ivmd_block->header.flags & ACPI_IVMD_UNITY )
     {
-        iw = ivmd_block->header.flags & ACPI_IVMD_READ;
-        ir = ivmd_block->header.flags & ACPI_IVMD_WRITE;
+        iw = ivmd_block->header.flags & ACPI_IVMD_WRITE;
+        ir = ivmd_block->header.flags & ACPI_IVMD_READ;
     }
     else
     {
-- 
2.43.0


