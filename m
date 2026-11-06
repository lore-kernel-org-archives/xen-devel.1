Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3926B606A32C
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 23:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=H7Ef76yE
Received: from list by lists.xenproject.org with outflank-mailman.1477479.1682914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPT9v-0004OM-Sp; Fri, 06 Nov 2026 23:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477479.1682914; Fri, 06 Nov 2026 23:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPT9v-0004OF-Nk; Fri, 06 Nov 2026 23:15:47 +0000
Received: by outflank-mailman (input) for mailman id 1477479;
 Fri, 06 Nov 2026 23:15:46 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xPT9u-0004HM-AH
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 23:15:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPT9t-008Qrn-GA
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 00:15:45 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee5f7e-8faa-0a2a0a5109dd-0a2a4508d6ce-14
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:15:45 +0100
Received: from [52.101.57.1]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee5f9f-f659-0a2a45080019-34653901627f-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:15:44 +0100
Received: from BN1PR14CA0013.namprd14.prod.outlook.com (2603:10b6:408:e3::18)
 by DS0PR12MB7945.namprd12.prod.outlook.com (2603:10b6:8:153::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 23:15:40 +0000
Received: from BN6PEPF00000074.namprd03.prod.outlook.com
 (2603:10b6:408:e3:cafe::4a) by BN1PR14CA0013.outlook.office365.com
 (2603:10b6:408:e3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 23:15:39 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000074.mail.protection.outlook.com (10.167.248.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 23:15:39 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 17:15:38 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 17:15:38 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 6 Nov 2026 17:15:37 -0600
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
 b=NLRG5euIk9mGamh/0gxcfvr2Rr4cLw/0mg8sfN92D0e/shSksgqn+xXK0tj51bb0MEM/JyVCYG60gxrbDs1o5/3ChVhDxe8R84r03aPmNjLywUdv7bkFFwTNXC/+B9BoEzjbS1b9OvoMhePENfo+gqTeFv6qQThXUyrZqRstCUEAG2Esdbs+kF3MT+8tw3u7OYOz0wrBhfu5UhJTol60XLZ9H85LSAfAu79FAb6ItOqmmiKzR2MkNtnmKX511nal+axsS7OpXuOfU5lgZR69U6/v0X3dh0+A6m/ICxA6p4GKDMLwARshIUWB206ciRvJ1yI8PKzC+8MyYsnFjDy2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1DcHBs561t0kBi4qPFs+lEMif9+fpnNikLV7MEXHPs=;
 b=hMdV+H5yNEBF3uNTbDS+xbKfIMV6sulPE7/mYrAMzUq2PSdv70y8Kn0FkmNu65R4cqSgDPIOX+w4Nn+ZJ/qY+Qj+8UV4Aw5DaFHWr9V3d440zw01XkQ4KCO1BgCWi7r5prU0P3XOaKtrulQ8Vr34iLtrw/GQpy6tnMw7MPDm9WRj3axe7rhSXFPszaup1N6TZWvClvfUNBd5R7Mzi3zxMqi63DCao5fcEkrTDcy2IJPprX+aZ5mY6IyFJwQBSsgY7bMYzXdg9n8yagm6m5dsOmKZGkyibfBOa+rSBf4o4taMIsnDpW6ldw1iAFlq9zxwsZE1GV2KCXfj4MkA6E0aWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1DcHBs561t0kBi4qPFs+lEMif9+fpnNikLV7MEXHPs=;
 b=H7Ef76yEIGjfeCWquGvtzFvxMiH77hbsU2PCjHXDTW9pogQR3oqygpPF0l4me2um31ESRE715A2/2VRsTKdLK1ypp+GYTIEXS4sm0Tzc4uQhGFSVMXacsthwX1hQghjaXKfn9kcRKMS0h5k+6u7W+NWaC2fNfjF7gqrc/LMg96U=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH 2/4] hvmloader: Support the TIS interface for TPM 2.0
Date: Fri, 6 Nov 2026 18:15:24 -0500
Message-ID: <20261106231526.482418-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106231526.482418-1-jason.andryuk@amd.com>
References: <20261106231526.482418-1-jason.andryuk@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000074:EE_|DS0PR12MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: 689d8225-e1dc-4205-6e44-08df3c5bdf62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|18002099003|22082099003|11063799006|56012099006|261102123227099003|261021121427099003|261021123027099003|261026121527099003|261009223027099003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	GJY1Y3FI5xyGdqhYHz6N2RaHH4vCXKHGxBrYMNrcs63+6kC3C95u7Ak/cmRkJwAXThlsFA8LAUPZg7/e0Uo5Ytj9jo+Q4DdbL5Wmj3mAY5CfO17ZCBPuc+d/yWshqnT26WW7lxcOmiaPclN7cswTQQVLnmCA7uKZWLd9etMlkHHISuUoF5grK7/QhW06aXwpowXbyvf7S3WH24EYZ6tRIHTWlLin2Yvzi/9/j2optpPkKQVTdPf7uQEHIWeR+8gdfS71oZ+LLmFemhAD+Ekg5WEeinJsjwuaNjcP53NY7Z3Wbd7UyFv+AwTBdGibcSN8QMtxs3LdW4MfGixkL3d/bHalXTWKyMEOpuoH8IXHcRcBOTsn6bqD4N5fP9HlJ79gioY7WaM3HOJIdKa7d+d7c2AMgobmy0++xndKs08oRsG6ohQtn5EXK5eTtA7PK8mwx3xj/E6Z/VrVko9WUAz1wDp1sEyLlY+vz5sX+z4IGMR+f5M4C5wIRX/Q4LvMu1smYDHCY6K8hjpm83ipaVR9K6I344S5PnMm1xJA2sRG9xEDbXU6BGw47Z8ER5dESLblXBlRqqbx8AEldpxeQOqVDrpw6EGNOJ1WNnamy7cg34eShC7n0S1UrtMH4jEAwOyBNbHwfol9WJ2y041YfzpAKUD3dMo0HKM1prAiWsyT0GmtLRz/MCurAfFieaZzbYeGlJWHA58Y0EnuSMyQDdgfNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006)(261102123227099003)(261021121427099003)(261021123027099003)(261026121527099003)(261009223027099003)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vFmdtveJr1yVyyM3/Yr66xQs+KMnW+Vh9M85cbgsnNEQ11mETBtGoASXS8kq1ZwJ1uLHSuHsVROm2mZyVBdL46AtJw1JklBhJqWEKLuO8H63uAl3KZpbqURDtXu13qi7IVUyW+IXjXgGFWUK9AOhKtqUxKQgdB+SMiJSwTHZIvC03EvZIZpBcSg0RZdRxJ2/zX1rAufiTbodddUvIGt3miIzhxNUl30qWeMlG3ZYIhNMZXGWr6dozIP9yta/1XgPNRAuQuxOLgwcbLhPHRelYifDkAYCN+EoxprGwWaEYQ+JGPCh/h2lxgGBsYIkwQicxQQJmkCd578g8AhzpuO0KQcj+6gURCVe8lypkLbpN6dPIxl8LQaKuem7SIqonIS2XZvdF/Tsn0dDn2RKYoynLweapjhJuu08c8vnYLPhnC8+ETnyBc5tGvupcf1lSsua
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 23:15:39.6936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 689d8225-e1dc-4205-6e44-08df3c5bdf62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000074.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7945
X-purgate-ID: tlsNG-c1860d/1794006945-CFED287B-5A11E1D3/0/0
X-purgate-type: clean
X-purgate-size: 2774
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Read platform/tpm-interface to determine whether a TPM 2.0 device uses
the TIS or CRB interface, and pass it to libacpi so the matching SSDT
and TPM2 table are built.  The key defaults to "crb" when absent,
preserving the existing behaviour.  TPM 1.2 always uses TIS.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
tpm-interface is inconsistent with tpm_version, but it seems like "-" is
more common than "_".

 docs/misc/xenstore-paths.pandoc | 12 +++++++++++-
 tools/firmware/hvmloader/util.c | 12 +++++++++++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xenstore-paths.pandoc b/docs/misc/xenstore-paths.pandoc
index b8b02e007a..c24ffe342e 100644
--- a/docs/misc/xenstore-paths.pandoc
+++ b/docs/misc/xenstore-paths.pandoc
@@ -280,10 +280,20 @@ circumstances where the generation ID needs to be changed.
 The TPM version to be probed for.
 
 A value of 1 indicates to probe for TPM 1.2, whereas a value of 2
-indicates that a TPM 2.0 using CRB should be probed.
+indicates that a TPM 2.0 should be probed, using the interface given by
+~/platform/tpm-interface.
 A value of 0 or an invalid value will result in no TPM being probed.
 If unset, a default of 1 is assumed.
 
+#### ~/platform/tpm-interface = ("tis"|"crb") [HVM,INTERNAL]
+
+The TPM interface to be probed for when ~/platform/tpm_version is 2.
+
+A value of "tis" indicates the TPM Interface Specification (FIFO)
+interface, whereas "crb" indicates the Command Response Buffer
+interface.  If unset or set to any other value, "crb" is assumed.
+TPM 1.2 always uses the TIS interface and ignores this key.
+
 ### Frontend device paths
 
 Paravirtual device frontends are generally specified by their own
diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader/util.c
index e651342681..fe3e6ab1b9 100644
--- a/tools/firmware/hvmloader/util.c
+++ b/tools/firmware/hvmloader/util.c
@@ -922,7 +922,17 @@ void hvmloader_acpi_build_tables(struct acpi_config *config,
 
         case 2:
             config->table_flags |= ACPI_HAS_TPM;
-            config->crb_id = (uint16_t *)TPM_CRB_INTF_ID;
+            if ( !strcmp(xenstore_read("platform/tpm-interface", "crb"),
+                         "tis") )
+            {
+                config->tis_hdr = (uint16_t *)ACPI_TIS_HDR_ADDRESS;
+                config->tpm_interface = ACPI_TPM_INTERFACE_TIS;
+            }
+            else
+            {
+                config->crb_id = (uint16_t *)TPM_CRB_INTF_ID;
+                config->tpm_interface = ACPI_TPM_INTERFACE_CRB;
+            }
 
             mem_hole_populate_ram(TPM_LOG_AREA_ADDRESS >> PAGE_SHIFT,
                                   TPM_LOG_SIZE >> PAGE_SHIFT);
-- 
2.34.1


