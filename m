Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEDC606A321
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 22:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0L7oNkBP
Received: from list by lists.xenproject.org with outflank-mailman.1456576.1669824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJHsD-00060O-1B; Tue, 20 Oct 2026 21:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456576.1669824; Tue, 20 Oct 2026 21:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJHsC-00060H-Tv; Tue, 20 Oct 2026 21:59:56 +0000
Received: by outflank-mailman (input) for mailman id 1456576;
 Tue, 20 Oct 2026 21:59:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xJHsB-00060B-Id
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 21:59:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJHsA-001Oih-SY
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 23:59:54 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ad7e42e-e002-0a2a0a5209dd-0a2a4502ea8c-26
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 23:59:54 +0200
Received: from [40.107.209.42]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ad7e458-6ca4-0a2a45020019-286bd12a29b3-4
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 23:59:54 +0200
Received: from MW4PR02CA0002.namprd02.prod.outlook.com (2603:10b6:303:16d::10)
 by IA4PR12MB929686.namprd12.prod.outlook.com (2603:10b6:207:110::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 21:59:50 +0000
Received: from MW1PEPF0001888E.namprd03.prod.outlook.com
 (2603:10b6:303:16d:cafe::32) by MW4PR02CA0002.outlook.office365.com
 (2603:10b6:303:16d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 21:59:49 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF0001888E.mail.protection.outlook.com (10.167.249.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 21:59:49 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 20 Oct
 2026 16:59:48 -0500
Received: from amd.com (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Tue, 20 Oct 2026 16:59:48 -0500
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
 b=JOHTJZWoOFleh3mynl1hCguxR08Qujw+7U7MQfgxudtiaL7Kg1bOXwZjox0fuV2TUGAUuk/h7tMcPoQkC+EW8dCrbIIuc/1rGP19X5ZyPD9tmpPpfTjzoDQL7ZtDhxr+ottwepOLlPCSOOX3zAeTF+ELI7ur7EC0NcJD9QiqE/4A/pIWCy/sn3LfznelgXvWzlW3NYOD266u17f0Nsmaelt/rHGRQR4rnntA13PPoRnND/SL4LwIeR9f2tXLdB/jUe7tad6Z04o166MZ6IexsdJCn+3yQI4FcSoTEWwkhlJ24fW5r4VzvqSDjm0M2GIaqLKoWrE7W7GIwIHiDF4WGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FhfR7bu914GJu8wPNMWnXkcHIbDHzzuoXzcUtJH2wY=;
 b=e4v2emswJeFI+zt5693HdRiqQhYqPmvWYX3hgyZHBO6errtvPkKSx8CXULOv2uKuGSmVoVggrqgaX99G1VYmlZepKsLpY1++OqLZ7/gWYiRcH9KhFM2icd2i38nyK66q4ddx7AjHKwrTvjwh3OsZ0qJ4rqJ45HUG5COPmHeKkSCQr9XbxXYRpAL+5GtkhqGfzPlRttFzy0nEDsKtPBR/jaTR3tNQT5vOw78novCvfVOLMV07thK6Eq1m8NIT1nETH9BMm/o49VYXmBqA5F0Kf9/WCcAEHo5a1a+E54GORuoR1tGiZPi0fa1Xv94H+GAMiD/yTq8+XKjGzP2pOdZEuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FhfR7bu914GJu8wPNMWnXkcHIbDHzzuoXzcUtJH2wY=;
 b=0L7oNkBPysZL2xiH5l0zUhX/iorWzvngUieCTFIJNCPtqRYV7mvhWu8pf51IFyP5hS5UQCVM0wadzbIFyf/vntEdBW4OuAJGXzQVicOrtFqlQAMglg/3ehTX9VlKOQRC7vR/w0RCQ3U31oSpv0NSeIZcbSKWKoPLE0U/sw8uras=
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
Subject: [PATCH] xen/amd/iommu: Skip IO-APICs missing from the IVRS in shared IRT mode
Date: Tue, 20 Oct 2026 14:59:41 -0700
Message-ID: <20261020215941.3667346-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001888E:EE_|IA4PR12MB929686:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e1169d-9962-4899-4292-08df2ef57637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|10067099003|18002099003|11063799006|260925021311599003|260925021911599003|260925022911599003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	qHdScHD8VJfCCNf/TBhq+lb6GX0lB52j8VJDx5e/U6XNSRj/4SnZGFoN9ZnznIhURlYHZmVmS/0+fknkRL2PQnei+Y1ElSHl0OfeTNWHkNQW7TSvadIR0TP/pZuYKkmxSVk49+v8uW92sgzSfCRlqmhlCkTRY4gXzbrsz/x97ZxEEO/f0QqGjFo+30w0+v2d3LV8IvCSy7hHrYQrd2gVQuzFV5xbUKNnrSrSN4C+kxtkhuPI9P4jXd78nbiJSHMntOKOaPAhYhVBgEcS3p1/pesLA/Zjyke8YV694RIpowb6OnUwNWU/8CNH+57BRnYcmsE4uQcsfEZPicoRHnyBdlpd/DEirFthxMrbR4g5KtrfrvnMq5a/vzhT1BVQkZMgcdjfP5I+tl98MlNMyRtpJyBdP5oMqTevG6ocw7We2LRbhCrVxwy6gbhlMAg2fkNcfTI/cZejpxm8Uf18MclISO+Fp7UQf53ylc4+v1UkAJZ25IcUpYZVCsQ4D7U0yJWLB8M37NykwmWguaZ/6gqwv79uUMxzVQjKwkHffmtIK9m6r4QUsJUMqAy9BgVNNXwILiL2kGki1gHIhPHj5uqAEZ1iv2iFR6O1NH4N98m8Z4zzxzkvVIgWLi6JIaL7e4Y11DfrsHrWQxax4dkGasGcHx2UPmivXyZHPusBEFn6oQyDAas6pkHvtSSiuQfgECtBTVsEa50et5YKIOtum/147g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(10067099003)(18002099003)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/BDrYiChMd8znobSBqnrXUyMwtIPdyX16KQqxbeEYilpkdCiWjT9HNVb/epkL8PRz3vcd1HlrgYC7f4Lc/WO6qK5q5faTyPAn9zj0Hoh4hjmWp0NbQqt5a+3uwKmykFAV34pqQCi2puhakO2ne/BmzvcNwIIdIQkl+tzPiAcqWPDJn8D5a+Scpl3u8JFubWnlauaOwcxhJfy506OiFXzq1JZXzZ1IQsA3vF39gX8MbGytcaLJENUhMztl9rS71IWv1oeu+RgLOvZZ4YqXhOHmyhIpwu0ma1Yiaj5I/E6RlrmxUTuDoCvppRLkseI6ShcDX9ZZ1acjpJjDXuy/JSJtOj15fIT/o2xME4UsTqFKki13cEWQJH6NXANsNblZBv2BFEthR4C0/O+nJzgoeJowF/nwaJdGh1ER22eCr9F7CxkH6eoIWvtT9OfUz6NtnvW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 21:59:49.3703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e1169d-9962-4899-4292-08df2ef57637
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF0001888E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB929686
X-purgate-ID: tlsNG-720697/1792533594-F22A92AC-9988601C/0/0
X-purgate-type: clean
X-purgate-size: 1196
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When an IO-APIC with entries isn't described by the IVRS,
ioapic_id_to_index() returns MAX_IO_APICS.  With per-device interrupt
remapping tables this is fatal, but in shared mode parse_ivrs_table()
only logs it and then uses MAX_IO_APICS as an index, reading and writing
one past the end of ioapic_sbdf[].

Skip such an IO-APIC instead.  It is left without interrupt remapping,
which is what the rest of the code already assumes for an IO-APIC with
no index.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/drivers/passthrough/amd/iommu_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index 39ae637959..4688908824 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -1132,6 +1132,7 @@ static int __init cf_check parse_ivrs_table(struct acpi_table_header *table)
                    IO_APIC_ID(apic));
             if ( amd_iommu_perdev_intremap )
                 return -ENXIO;
+            continue;
         }
 
         /* SB IO-APIC is always on this device in AMD systems. */
-- 
2.43.0


