Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E96C606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 22:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=smrl3qE2
Received: from list by lists.xenproject.org with outflank-mailman.1456593.1669841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJI4G-0000t3-A6; Tue, 20 Oct 2026 22:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456593.1669841; Tue, 20 Oct 2026 22:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJI4G-0000sw-7J; Tue, 20 Oct 2026 22:12:24 +0000
Received: by outflank-mailman (input) for mailman id 1456593;
 Tue, 20 Oct 2026 22:12:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xJI4F-0000sX-3T
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:12:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJI4E-001QVZ-6U
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 00:12:22 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ad7e727-2eae-0a2a0a5409dd-0a2a4507940e-40
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 00:12:21 +0200
Received: from [40.107.209.48]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ad7e744-b4ea-0a2a45070019-286bd1309419-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 00:12:21 +0200
Received: from BN1PR12CA0023.namprd12.prod.outlook.com (2603:10b6:408:e1::28)
 by CY3PR12MB9704.namprd12.prod.outlook.com (2603:10b6:930:102::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 22:12:17 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:e1:cafe::2a) by BN1PR12CA0023.outlook.office365.com
 (2603:10b6:408:e1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 22:12:17 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Tue, 20 Oct 2026 22:12:17 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 20 Oct
 2026 17:12:15 -0500
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Tue, 20 Oct 2026 17:12:14 -0500
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
 b=ZzFbkAkyCGmYaaPHKdQFBfVfNy8FCAEHQyqSlPQKFkdK3JyUGBY/H3k8MuEmX65SgYjc8COBOhvPhtQ5jEfjsQky937AJoHhw8nAjT8E2Yz7PskU7pBNUMDxfb8fQwojvlegOh5lbFBeZ0W7XPPEYhUOSaFB+TcH78OLispUhGiAbZap0xPaxjvalRJg7qi4ndUeUb+y1Y9TNvUUaGGI5xhhDFihowmI0Nt5KwzCXqbr/whHK0v2TffiuxiM8poZ3+J6L07nylU8f6qozFLOys1eAEjFi9t/XRKtkk0ASZjU58LytW52JM1SvvXXYEk3a9sJN/Agcyv9/8lDFRlvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lTzeI14p4isnUJycPWW8/lofc2072mgt52wrZcl9+A=;
 b=Sf7OyMJ1olu/3LOF0Ai7oOeTd5TSFqKLE0VTBd4OfZaXBz5v5SgOFEYMql6vT8XAB6ol8OddhzQsZRBpN5BKjSf1q781/QQEndzjsXsdImqf+grKA8D1VJ5qWVC2U/eizpPN/d8y/N8nmMJSGjuMhiXYrsM4/uLybURkz2dcXgvZ42T21DiVrQKAURoDI8YztVdM724J8MX0yxujgq/XgrnTfG3/MuJv0CUZV6lJADVygHltV8S9s6uR3Jydv3EPIyTztOhPHdtlKBB0pgXgHY/kN0l9eGSf6d+8Mz3A9sOkkL/PkFlrGykDAxIz2SXBAgxBhoB5aYsej3SoqA6WRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lTzeI14p4isnUJycPWW8/lofc2072mgt52wrZcl9+A=;
 b=smrl3qE2irLCyIhCKL/FSUDtCDohFD1AkirhLM1ccpA3n3+TGl7xqAw4dT8n/D8uOElzYp3Pg8l5qG8t+aa96EWbVMXsmfNoqA7sIij/R9DEkSg18UdP3a4Tm5xG6GlOgATbXp+TV/c/3kiNFtq/+PLkviIs6VcNTun8hRTFsBk=
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
Subject: [PATCH] xen/amd/iommu: record the IOMMU for alias DeviceIDs
Date: Tue, 20 Oct 2026 15:12:14 -0700
Message-ID: <20261020221214.3683476-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|CY3PR12MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: 024ee4f3-debb-483d-a654-08df2ef73415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|261009223027099003|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	SYbk33rlha4P58K3luuxBC76Eo67eyp4SxmW734o6Kp+lszKVRA98tFHcf98SFhWSnbh9NRdPPD2AUVBW2Rtl/Ew2UNaw1TqfjR97dgZ1hTFtzNwdJ/xKgiF4VqsfR/EfOqhAOaqchOkI7teQmf0xVMnKpMapRb3dXHbiTjfdwN0rMlv9gONouJWiUMl+UcQFQ5bRlt2JDm0APUD1em7YuziiVBdrTAj3kJ0RRP6jiB3WqMz8RmrY8gTfBrhkv0+KO/ZEKlKIr5j6+enqb0AhTtvwSuqaY4K4gQ+0OLpanP8fJvhyu1quNGuNwn3VNCq39usIfjYkpFENicl/H4Xqwx/VDcrIHQ3/JJVTlEhmoqij4xeI2kFCH/CesPyUNE6gwLpnNZVTnkf//IeXe7PEsMeZmeAJNjAO359cEcLtiNa7vy9xpaCpwEA3nMaGr2x8vwa5Hfp4MxSRa7BJAtd8dXc2B/8vigV55iJM7+S9YW/l5vXVpce+ZRfQ4BiLPfkhivzAt+zxgKT2mVtbiWO+NdxZsMMtOjgjhzn5W6Mca28Wq0RNG0+oyR/nGvlIxlEPurt4jkh6Uxis0Ulg/OqOk8AEDDIo7R0NM0hXV3hdzwfAxVxd2y5rUOvqZXWBN5tzptXuMbGkLAgWdhLolVldHhvmicWXJyZtccZTAsCipDLyEkXnGtS5LV4icaYe8Ulw8RBlUUr2U446FRmZxG8yQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(261009223027099003)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7Ej7rE/u1LomhCe1Na6HLyEVsSlpfbR7DAWYkvqql2AreWGunQk7tQyOIhCT+pjyJOriuFYsQ/T/kvf3oZF0Ce8FVxSs23twvxgbmx/zSdPxsKCeFYinVGcvhoTNOIhoToQBzixNfZdNn1mrLHgmUSe+nEJVh9XNoGq7dLC3ZL41/pj5VHXV7uqVULDbxuxHuYXLfCesqfH40tMN832BTYQaYI6KXG7uY7QUB6rhc1d5F6THE6IRhDcaaf8ATFmTd68doWkc3TnIWcFZWip7l4Cg5JfWlPbKg4DO1iFKbH9ASxScxBXE/E+Y3JXOPB78YWOjPRQzGZ244nrrccIqaBdUUo9wskaW6MnoVfZdbOa3Xm9eS6V7p5dR59cFBqdy+oUXsrqBR63t2Dj56qElkbShgRsx17xAOUl1cGRGhuNsg6ax+ZIldHaEsJ6UCywm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 22:12:17.5104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 024ee4f3-debb-483d-a654-08df2ef73415
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9704
X-purgate-ID: tlsNG-ef75cf/1792534341-A64DBAE4-E92BEDF2/0/0
X-purgate-type: clean
X-purgate-size: 1094
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

add_ivrs_mapping_entry() marks an alias DeviceID valid and may give it
an interrupt remapping table, but records the IOMMU only for the
aliased device.  If no IVHD entry names the alias DeviceID itself,
amd_iommu_setup_device_table() passes a NULL IOMMU to
amd_iommu_set_intremap_table(), and Xen crashes at boot.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/drivers/passthrough/amd/iommu_acpi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index fe3dee872c..31fae663c8 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -104,6 +104,10 @@ static void __init add_ivrs_mapping_entry(
 
     /* Assign IOMMU hardware. */
     ivrs_mappings[bdf].iommu = iommu;
+
+    /* Requests using the alias go through the same IOMMU. */
+    if ( !ivrs_mappings[alias_id].iommu )
+        ivrs_mappings[alias_id].iommu = iommu;
 }
 
 static struct amd_iommu * __init find_iommu_from_bdf_cap(
-- 
2.43.0


