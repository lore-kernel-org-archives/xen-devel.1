Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130BB606A330
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 23:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=siCkZ3Jt
Received: from list by lists.xenproject.org with outflank-mailman.1477482.1682940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPTA3-00057E-RY; Fri, 06 Nov 2026 23:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477482.1682940; Fri, 06 Nov 2026 23:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPTA3-000572-NS; Fri, 06 Nov 2026 23:15:55 +0000
Received: by outflank-mailman (input) for mailman id 1477482;
 Fri, 06 Nov 2026 23:15:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xPTA1-00054G-T4
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 23:15:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPTA1-00EGLl-9a
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 00:15:53 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee5fa8-bab6-0a2a0a5309dd-0a2a4502cb4a-0
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:15:52 +0100
Received: from [52.101.85.29]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee5fa7-6ca4-0a2a45020019-3465551d7da8-3
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:15:52 +0100
Received: from CH2PR02CA0011.namprd02.prod.outlook.com (2603:10b6:610:4e::21)
 by MW4PR12MB6876.namprd12.prod.outlook.com (2603:10b6:303:208::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 23:15:44 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:610:4e:cafe::8) by CH2PR02CA0011.outlook.office365.com
 (2603:10b6:610:4e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 23:15:44 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 23:15:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 17:15:42 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 17:15:41 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 6 Nov 2026 17:15:40 -0600
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
 b=bkX/oxY+rN7V6xkprNHd96Wxpg8G6JhW3dUgQMRmQWddXYFDWI6Rsz5VIUKlgRLktW2NomjE3r32Ino2/e66BqMO3pSLeE+oimh3lGDp9COKDftju6oNe3nAtpJEHXLlZZ8aoiTxb2ipH+HyTDLdlq/Yh7fgGuakpktUGDYtgoOP14CIMsvQy0QEZptuQO2rzHqsun/sB7my8CC/6wWI4X7QIqdjgmvPTdouemsju8frxBWqOVHK+OySdC03ifRALVxcZNAS6e35LkNInsyp8PvfpIKvQ/eSwv9ZtOUiAgvtRBUavruKaiZHoatHt1PIGlJSN+pTVV1cRa+5DZ4E7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvB52JWQG6bRO1jPkIW77vtkV0moRZM3AN5DW/h+kik=;
 b=HHhCykoyUKPTNguUDSU9NRr5kWPuqJF/eXEgiCgys7lLyfJ623/3B5KH4BOvCVFRYbFcjR2qvM+zjX6hw65tb3TpYSMomfOPgCbX2hQIe0q9SIiH4RPbb3mM2hEMwllQWO8DlC2YTSCjth2xYaE/pFQexbKq4A9fmBYUMm9O//p5O4x4Daj1925PcNJZvpPPm//pTw2AUfcEERfCid8QL6EMNe6VmGeID+98t2d5Kon30x1qH+u8QD7JqSiJagYW71vxq+VM8QhyvR3S1BgX1UvwMrLZveCuJXFmvp3iTXEtqO1MR7e2bI5lAK4SQApFTWth6zW5kfkNRtJuVsZ0OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvB52JWQG6bRO1jPkIW77vtkV0moRZM3AN5DW/h+kik=;
 b=siCkZ3Jt47icN4zbdanl7IjoNyz88ZMzLwDfswWrLaExnIKH3W5aXB6t/P+OpdYEndTYu1kaDH0vG3aelKBROD8NJ96u98/SC+YYkZgT/PNSI15QRv9CB/9LMu5wsputteQ/005UEbgjq6pUSRe0NyIORbpM5Z2S6ljYREk/SKs=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 4/4] libxl: Add emulated TPM support on ARM
Date: Fri, 6 Nov 2026 18:15:26 -0500
Message-ID: <20261106231526.482418-5-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106231526.482418-1-jason.andryuk@amd.com>
References: <20261106231526.482418-1-jason.andryuk@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|MW4PR12MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: e2dbb5d6-4cd9-4c39-4271-08df3c5be19d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|30052699003|23010399003|1800799024|10067099003|6133799003|22082099003|18002099003|3023799007|56012099006|11063799006|261028144727099003|261022075727099003|5023799004|261026121527099003|261022105027099003|261021123027099003|261009223027099003|261021121427099003|261026140227099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	3M31a9f/tCAfYAN0ufPb3tDtXvWiVw8BVDSQAqytnTHqDCXuW32kaoCCfEwShEI7K+MoSFdJc31MkJcAS9+iS9PlIe2kVVfPewf2GPI3GGfaGUGBoZEhBRNPDOWmuufqoCbs1nDNDtQgloAW4JbC6zqt9YJ4MPJL9vZoQanXZ2/vRn5hoPm0d3RkO/ZCmqpdCLMeuVtGMe1bDwEU/H6oSH7RG/AHEfxMyUlkP0M4/n1SRPntde1Lce4BG0f8HkaxaF0E7gLwW/W1KNnQV63Yxt7y9kZJU+y9NdxTe04j34HXML3P8LcJO9jNz7BAPeYC84LJGidP06ew5bQV5r8cjB1G9dOnwtrzAhJVJwRstHFKuXbmDZ+sZ+a1MuiehaQDPsYtmFI+mEcg+K8cL8ZxxlyrPJaVhMfb9oKc/qfZoLYc7cr8ECpTnLcCrjzoiWscOJiTob2CdZBsdfn/PygDPzaV+X9Tvp6MlKzY3Dc3Jd0BnBogGXuP7OtO2/rcf9CJtTMZ3Dh2lezddULDMgCeGlc544ivBlGwnmFJDjbyNawX3tH3Ec9UmorCyNxOV8dV2IYjVJMweih46YDdcqtUF7x0uswhCqvHf045sz+OL2zUsdKy5h6XJj8xxAbVGRhRdD8NyBvS9MWs/1orG93sKzEcuKh8Z8gq4ZUCWrvRVUer/7WWvKEnbyJDWlJj1LOoQp9TkrfV6kLHNCV7h38O2A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(30052699003)(23010399003)(1800799024)(10067099003)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(261028144727099003)(261022075727099003)(5023799004)(261026121527099003)(261022105027099003)(261021123027099003)(261009223027099003)(261021121427099003)(261026140227099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BtCzG+tw3TTiVhLfatIfux7bgDFy0I8Ip30imODunbjtt60HFNi5deOO6GAE0H8NwqjEhbeGQnxxdarcT48Ii5RWMy2R9AY2YEGQEUCoX8sKgdXigeZ4BrVOMDPH3OJMNC0/yWEE1B7BOGgAS9Sj9c7EQ6aGC9Mbwpi0U6rKzgM4DKc9q+rYTwoiJ2c0yLpbt9rPyA9ratINPl83yoxVM1Ip1mHOTUXuhlbQ/tyzkMsf32zNqosdyotZ54v6Ha/FQryEH/iEHHxJLfUnaJTPifj75SKYCQpNAe3l6SHj0K6LHaV6MLTR9A4RafjYcGLO86y3RhdnY+jVkA5uUzgBpcRVtiGaAQebzxWVMrB/5TBK8MpTZ6EFJgzW5Imqy4eeej99+ZjSelCx8nyzImx2UAIwpthvwQ/P+x7y7kSNh1eHAINOand80WNYCy8uCF6M
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 23:15:43.4346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2dbb5d6-4cd9-4c39-4271-08df3c5be19d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6876
X-purgate-ID: tlsNG-720697/1794006952-67CBA2AC-F219970D/0/0
X-purgate-type: clean
X-purgate-size: 9890
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Stefano Stabellini <stefano.stabellini@amd.com>

QEMU's ARM "xenpvh" machine runs as an IOREQ server and, when given a
"tpm-base-addr" machine property, instantiates a TPM TIS sysbus device
at that address connected to the "tpm0" TPM backend.  Hook the existing
tpm_* configuration up to it so ARM guests can use an swtpm-backed TPM.

Reserve GUEST_TPM_BASE/GUEST_TPM_SIZE in the ARM guest memory map and
add a "tcg,tpm-tis-mmio" node to the guest device tree when a TPM
version is configured.  The xenpvh machine has no CRB device, so TIS is
the default and only interface allowed for both TPM 1.2 and 2.0.

Add libxl__arch_pv_pvh_machinearg() returning the QEMU -machine argument
for a PV/PVH guest.  x86 returns plain "xenpv", while ARM uses "xenpvh"
and appends tpm-base-addr when a TPM is configured.  uint64_t tpm_base
in ARM's libxl__arch_pvh_machinearg() is to allow PRIx64 to print the
value.  Otherwise the ull argument mismatches PRIx64's %lx format.

libxl__arch_pv_pvh_machinearg() also handles PV guests.  This keeps the
extra_pv handling identical between PV and PVH guests.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
[ Merge ARM parts with new libxl_dm implementation. ]
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 docs/man/xl.cfg.5.pod.in      | 14 ++++++++---
 tools/include/libxl.h         |  5 ++--
 tools/libs/light/libxl_arch.h |  6 +++++
 tools/libs/light/libxl_arm.c  | 47 +++++++++++++++++++++++++++++++++++
 tools/libs/light/libxl_dm.c   | 14 ++++++++++-
 tools/libs/light/libxl_x86.c  |  6 +++++
 xen/include/public/arch-arm.h |  4 +++
 7 files changed, 89 insertions(+), 7 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index c12d2dc4db..e5952d7e27 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -823,11 +823,16 @@ value is optional if this is a guest domain.
 
 =item B<tpm_version=NUMBER>
 
-Provides an emulated TPM to a QEMU-based HVM guest, backed by B<swtpm(8)>.
-The TPM version to emulate is either B<1> for TPM 1.2 or B<2> for TPM 2.0.
+Provides an emulated TPM to a QEMU-based HVM guest, or to an Arm guest,
+backed by B<swtpm(8)>.  The TPM version to emulate is either B<1> for
+TPM 1.2 or B<2> for TPM 2.0.
 When this option is not specified, no TPM is provided and the other
 B<tpm_*> options are ignored.
 
+On Arm, QEMU's B<xenpvh> machine is started as an IOREQ server to emulate
+a TPM TIS interface, and the guest device tree gains a
+C<tcg,tpm-tis-mmio> node describing it.
+
 One of B<tpm_statefile> or B<tpm_statedir> is required, but not both.
 
 =item B<tpm_statefile="PATH">
@@ -844,8 +849,9 @@ Path to a directory in which B<swtpm> stores the persistent TPM state.
 
 The TPM interface presented to the guest.  B<tis> is the TPM Interface
 Specification (FIFO) interface and B<crb> is the Command Response Buffer
-interface.  B<tpm_version=1> only supports B<tis>, while B<tpm_version=2>
-supports either and defaults to B<crb>.
+interface.  On x86, B<tpm_version=1> only supports B<tis>, while
+B<tpm_version=2> supports either and defaults to B<crb>.  On Arm, only
+B<tis> is supported, for both TPM versions.
 
 =item B<tpm_swtpm_override="PATH">
 
diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 8b431b708d..8d19cf41bc 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1568,8 +1568,9 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst, const libxl_mac *src);
  *
  * If this is defined the tpm member of struct domain_build_info is
  * available.  When its version is non-zero, libxl starts swtpm to
- * provide an emulated TPM to a QEMU-based HVM guest.  Its interface
- * member selects the TPM interface (TIS or CRB) presented to the guest.
+ * provide an emulated TPM to a QEMU-based HVM guest, or to an Arm guest
+ * via QEMU's xenpvh machine.  Its interface member selects the TPM
+ * interface (TIS or CRB) presented to the guest.
  */
 #define LIBXL_HAVE_TPM
 
diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
index c8ef52ddbe..b3355d1e82 100644
--- a/tools/libs/light/libxl_arch.h
+++ b/tools/libs/light/libxl_arch.h
@@ -97,6 +97,12 @@ _hidden
 int libxl__arch_hvm_unmap_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid);
 _hidden
 bool libxl__arch_local_domain_has_pirq_notion(libxl__gc *gc);
+
+/* QEMU -machine argument for a PVH guest. */
+_hidden
+char *libxl__arch_pv_pvh_machinearg(libxl__gc *gc,
+                                    const libxl_domain_build_info *b_info);
+
 #if defined(__i386__) || defined(__x86_64__)
 
 #define LAPIC_BASE_ADDRESS  0xfee00000
diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 47b662ea5c..6325b19766 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -978,6 +978,29 @@ static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
     return 0;
 }
 
+static int make_tpm_node(libxl__gc *gc, void *fdt)
+{
+    int res;
+    const uint64_t base = GUEST_TPM_BASE;
+    const char *name = GCSPRINTF("tpm@%"PRIx64, base);
+
+    res = fdt_begin_node(fdt, name);
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, "tcg,tpm-tis-mmio");
+    if (res) return res;
+
+    res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
+                            GUEST_ROOT_SIZE_CELLS, 1,
+                            base, GUEST_TPM_SIZE);
+    if (res) return res;
+
+    res = fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
 /* The caller is responsible to complete / close the fdt node */
 static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
                                         uint32_t irq, uint32_t backend_domid,
@@ -1450,6 +1473,9 @@ next_resize:
         if (iommu_needed)
             FDT( make_xen_iommu_node(gc, fdt) );
 
+        if (info->tpm.version)
+            FDT( make_tpm_node(gc, fdt) );
+
         if (pfdt)
             FDT( copy_partial_fdt(gc, fdt, pfdt) );
 
@@ -1860,6 +1886,16 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
         return ERROR_FAIL;
     }
 
+    /* The xenpvh machine only provides a TIS TPM interface. */
+    if (b_info->tpm.version) {
+        if (b_info->tpm.interface == LIBXL_TPM_INTERFACE_DEFAULT)
+            b_info->tpm.interface = LIBXL_TPM_INTERFACE_TIS;
+        if (b_info->tpm.interface != LIBXL_TPM_INTERFACE_TIS) {
+            LOG(ERROR, "Only the tis TPM interface is supported on Arm.");
+            return ERROR_INVAL;
+        }
+    }
+
     /* Sanitise SVE parameter */
     if (b_info->arch_arm.sve_vl) {
         unsigned int max_sve_vl =
@@ -1949,6 +1985,17 @@ bool libxl__arch_local_domain_has_pirq_notion(libxl__gc *gc)
     return true;
 }
 
+char *libxl__arch_pv_pvh_machinearg(libxl__gc *gc,
+                                    const libxl_domain_build_info *b_info)
+{
+    uint64_t tpm_base = GUEST_TPM_BASE;
+
+    if (b_info->tpm.version)
+        return GCSPRINTF("xenpvh,tpm-base-addr=0x%"PRIx64, tpm_base);
+
+    return libxl__strdup(gc, "xenpvh");
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index 843b8e29eb..ebdd05586e 100644
--- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -18,6 +18,7 @@
 #include "libxl_osdeps.h" /* must come before any other headers */
 
 #include "libxl_internal.h"
+#include "libxl_arch.h"
 
 #include <xen/hvm/e820.h>
 #include <sys/types.h>
@@ -1573,7 +1574,12 @@ static int libxl__build_device_model_args_new(libxl__gc *gc,
     switch (b_info->type) {
     case LIBXL_DOMAIN_TYPE_PVH:
     case LIBXL_DOMAIN_TYPE_PV:
-        flexarray_append(dm_args, "xenpv");
+        machinearg = libxl__arch_pv_pvh_machinearg(gc, b_info);
+        flexarray_append(dm_args, machinearg);
+
+        if (b_info->tpm.version)
+            libxl__dm_add_tpm_args(gc, dm_args, guest_domid);
+
         for (i = 0; b_info->extra_pv && b_info->extra_pv[i] != NULL; i++)
             flexarray_append(dm_args, b_info->extra_pv[i]);
         break;
@@ -3892,6 +3898,12 @@ int libxl__need_xenpv_qemu(libxl__gc *gc, libxl_domain_config *d_config)
         goto out;
     }
 
+    /* QEMU provides the emulated TPM, e.g. via the ARM xenpvh machine. */
+    if (d_config->b_info.tpm.version) {
+        ret = 1;
+        goto out;
+    }
+
     for (idx = 0;; idx++) {
         dt = device_type_tbl[idx];
         if (!dt)
diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 3182cfc9df..a6e9ad777e 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -937,6 +937,12 @@ bool libxl__arch_local_domain_has_pirq_notion(libxl__gc *gc)
     return false;
 }
 
+char *libxl__arch_pv_pvh_machinearg(libxl__gc *gc,
+                                    const libxl_domain_build_info *b_info)
+{
+    return libxl__strdup(gc, "xenpv");
+}
+
 int libxl__arch_hvm_map_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
 {
     int pirq = -1, gsi, r;
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 5d15f572c7..efb45eb33c 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -452,6 +452,10 @@ typedef uint64_t xen_callback_t;
 #define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
 #define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
 
+/* Emulated TPM (TIS over MMIO) */
+#define GUEST_TPM_BASE    xen_mk_ullong(0x0c000000)
+#define GUEST_TPM_SIZE    xen_mk_ullong(0x00005000)
+
 /* ACPI tables physical address */
 #define GUEST_ACPI_BASE xen_mk_ullong(0x20000000)
 #define GUEST_ACPI_SIZE xen_mk_ullong(0x02000000)
-- 
2.34.1


