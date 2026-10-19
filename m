Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90346075526
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ed9pjOni
Received: from list by lists.xenproject.org with outflank-mailman.1454504.1668094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIoo9-0002Mi-Sn; Mon, 19 Oct 2026 14:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454504.1668094; Mon, 19 Oct 2026 14:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIoo9-0002Mb-PN; Mon, 19 Oct 2026 14:57:49 +0000
Received: by outflank-mailman (input) for mailman id 1454504;
 Mon, 19 Oct 2026 14:57:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xIoo8-0002MV-9B
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 14:57:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIoo6-00ErjS-79
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 16:57:46 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ad62fdf-8faa-0a2a0a5109dd-0a2a4502a4fe-18
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 16:57:45 +0200
Received: from [40.93.194.41]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ad62fe6-6ca4-0a2a45020019-285dc2291eab-4
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 16:57:43 +0200
Received: from MW4PR04CA0056.namprd04.prod.outlook.com (2603:10b6:303:6a::31)
 by PH8PR12MB7134.namprd12.prod.outlook.com (2603:10b6:510:22d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 14:57:36 +0000
Received: from MWH0EPF000C618B.namprd02.prod.outlook.com
 (2603:10b6:303:6a:cafe::4c) by MW4PR04CA0056.outlook.office365.com
 (2603:10b6:303:6a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 14:57:35 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C618B.mail.protection.outlook.com (10.167.249.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 14:57:35 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 09:57:27 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 09:57:27 -0500
Received: from APPOL-18KY0J4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 19 Oct 2026 09:57:26 -0500
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
 b=TKxNjuqVIGcSbXLwXGAWx85fVxjCpdwe3JS8nmSu5uJv3FPdikWBlbit77cIccNxb1B2DzQqz/ILyY1eUsERqHGjrR1RTv3HjdXit/CrSFBw4Pr6QoB9FLJfKQavPtYspRTBCGuOJOAQado4LfrehvhE0oX7dxbVafCcYm/i85YsaGyXczlydA/dcd+GFCzQPMPNwQBAuMlHg4ih8k5uigYOCgmN3gdIED9nFOC4beBRUcR5CnOOnt7O03tQ9JIJDrOZ8iNDDZ43rbpSokVKAdNgwk2O1eVLUCqDGnbvI/ict7y3LsMBzWDb+sOK06B/HWOIYgoei/vELS3dMihpFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYk5IBixoan2IiArJFwaqEC/IXumFkwYCSAmsE+DvQA=;
 b=k/zn3WUItmTlAx3CA4KredvNYtPEeihivdI34MRVHhHV7SnCQZw4rtYzQZIHs4bjbcI5ZudZnKkg/mVvwb8HcZGgEFxC8Qur9vytaorGqQYQwJ3b1gvMcNQz4mICGB/rDSEs9zaiOKBxc9LBngBa2/5TUPmMOVtFh4NwBD7g8MEFFMzuJsf2OkQ5+K3/EJ6RjDX9DwjSGu3/QXS4hc37l2gvjaCXYk+b9cYwmKGmvV2W7HxE7wmIrk0c6iHXBHT3MXNtE3Whh6Rz/C4064oNbS0B27myIkxRRIl8YYMJoHFSZbvtXgRI8kFTx1j/gQgtvPW8d0kY/9SQg9fjz4QaxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYk5IBixoan2IiArJFwaqEC/IXumFkwYCSAmsE+DvQA=;
 b=ed9pjOniB+7fm19PL0bAJ1wnn8D3uZm2UlTHo7yaEwaisy0o20bRp8DPLeG19VA7N6VEVL4p0Km6bfKzA+RD3PorBNfmveEQ4QTBv8hsrbYtDtGR3cLGOIYI6AbqY7Rk6toRM5XIEUJoZydLKj0y9QWExNyZpCqnnJ3TBc+tgdw=
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
Subject: [PATCH] xen/arm: validate max grant frames against the grant table region
Date: Mon, 19 Oct 2026 16:57:25 +0200
Message-ID: <20261019145726.648111-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618B:EE_|PH8PR12MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: b015dae9-fd9b-4eb6-df26-08df2df14fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|6133799003|18002099003|10067099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	JQgde4g+ZE874YVldNXQXo8pYUcGSCFrF7W6VwHMBkc9fZftslabVtZgmWErFuKnYGWA8fLj8BplHj8xnrEnG7WNiNnDGAFPwAp67OFDtsgQRSpef7JDAToX4QTstApRtRDZ6rnTg9YO1ISuce4c4/vDMzUA9g7t/lyQls1orjRe0BGKKF27g9ZU6lOuTtHwm8EzLTBrUd43Mgg8urm9+snngQ40/T4bsqYf1KA8HjZ35ACVBhU3mmufnW4moYgTANhT4BUNKx2hVZuqe0Jfi0hCzlBueSetp/aPEeD/HPvRO/tAzv1XfiQ5F2cjKuydBibGY22V5CeHTJCUT4HUaJYkKu9D8MUgJXPGyaB4Xi58DrZ2V535m8A4OV5D6wckdoqWq84gwC4k+1+TTYYZho7BXFD7csnYNHmzOZNkMkZS3b/vRT5Al87HVMx3lRru40+VI3O+nwZ8vc3Tyq+8oocgqRmlY3HheH24AumJJ69pYuEoQrAwh28EFvt/Ph1o7pzMS2Ps9hOK15EI+jb9IlcwqZv1FyLrgt3hqwe7xVm5UtdvsXWnmFcFQ+OQEWycVEn+kX97eOQfQ5ZWwAyod2htPJASkoCLT1Od/aGT3YyNFmdARnS7mO5DUiItTYR65FU7mWgjyuH53L1C42qzp7RY7Idge12GEd5NXWaYAcCaeFB/so5S/MjYR1cYBjyeZIZkYfRnFlJgO+VRLX8+cw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(6133799003)(18002099003)(10067099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5lj65Os1eYQqBPE0+77fklGlTW6vdo+ilQnrDZouiLA36ihRCE2LfAkB+5jTZiltG7ljGhhDL+7N5D+o4K1O2LQpPrDGEA/Or9mp7piXcK4KoZASFHswoPFsOJN7/NrATVNbRWoQmIiGRWbYmMVSDcwZxSHv5SvfVaQmQYjD1BIAohGkBx8qvdc+5Ms19Qpomh79LzC00UojTcBkNTEFBCETVzLrJvKY83Gu7egAhgq9Vt923hHomrh7nqmH5/PAzkEPutPpRCsYT8kWa0sReAF3/TzvRLcmqnaqhjCb2cMl8fxqOv/jVpv8xTzhujtiVgDMcYFt3K46MqVVOvpBLYVlimHoxWpMooDgArLUAUtCHQ35/sKyOAVFlxwDeWvg22KO8cU2aycE2Cgvvu4LDeqMwfRZyr7YlsuErbquy7wCJdxAUBLqzXd23KYV93fV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 14:57:35.5707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b015dae9-fd9b-4eb6-df26-08df2df14fad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C618B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7134
X-purgate-ID: tlsNG-720697/1792421865-F3ABD2AC-2D36038A/0/0
X-purgate-type: clean
X-purgate-size: 4439
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Per the binding (docs/misc/arm/device-tree/guest.txt), region 0 for
mapping grant table is large enough to map the whole grant table. Xen
never checks that this holds:
 - enhanced dom0less domUs are given GUEST_GNTTAB_SIZE (4096 frames),
   while their limit comes from the max_grant_frames DT property or, if
   absent, from the gnttab_max_frames command line option or default,
   neither of which is bounded by the region size,
 - a dom0less hardware domain is given gnttab_dom0_frames() frames,
   while the max_grant_frames DT property can raise its limit above
   that.

A guest growing its grant table past the end of the region ends up
mapping grant frames over whatever follows it in its address space,
e.g. the magic pages at GUEST_MAGIC_BASE for a domU.

Validate that the configured max frames can actually fit in the region
Xen exposes in make_hypervisor_node().

Fix find_gnttab_region() logic of setting the gnttab_size for hardware
domain to allow the max frames up until the size of the text section.
Otherwise, the DT setting would only allow to shrink it from the
default.

Fixes: 79eb2871f25e ("xen/arm: configure dom0less domain for enabling xenstore after boot")
Fixes: df68a4cb7ed9 ("xen/arm: Add capabilities to dom0less")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 docs/misc/arm/device-tree/booting.txt |  5 ++++-
 xen/arch/arm/domain_build.c           | 16 +++++++++++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 3787d2e2b668..1dfdff0e4fe3 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -291,7 +291,10 @@ with the following properties:
     Optional. A 32-bit integer specifying the maximum number of grant frames
     the domain is allowed to have. If this property is missing, the value
     specified by Xen command line parameter gnttab_max_frames (or its default
-    value if unspecified, i.e. 64) is used.
+    value if unspecified, i.e. 64) is used. For hardware domain and xen,enhanced
+    domains (for which Xen advertises /hypervisor node) the limit is based on
+    the max region size (GUEST_GNTTAB_SIZE for domUs, size of Xen's text section
+    for hardware domain). A larger value makes the domain fail to build.
 
 - max_maptrack_frames
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 72f6f7539a7f..1ee1f1f6a733 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1031,6 +1031,8 @@ int __init make_hypervisor_node(struct domain *d,
     void *fdt = kinfo->fdt;
     struct membanks *ext_regions = NULL;
     unsigned int i, nr_ext_regions;
+    unsigned int gnttab_frames =
+        gnttab_resource_max_frames(d, XENMEM_resource_grant_table_id_shared);
 
     dt_dprintk("Create hypervisor node\n");
 
@@ -1042,6 +1044,14 @@ int __init make_hypervisor_node(struct domain *d,
         (sizecells != 1 && sizecells != 2))
         panic("Cannot cope with this size\n");
 
+    if ( gnttab_frames > PFN_DOWN(kinfo->gnttab_size) )
+    {
+        printk(XENLOG_ERR
+               "%pd: grant frames limit (%u) exceeds the region size (%lu frames)\n",
+               d, gnttab_frames, (unsigned long)PFN_DOWN(kinfo->gnttab_size));
+        return -EINVAL;
+    }
+
     /* See linux Documentation/devicetree/bindings/arm/xen.txt */
     res = fdt_begin_node(fdt, "hypervisor");
     if ( res )
@@ -1750,6 +1760,9 @@ void __init evtchn_allocate(struct domain *d)
 static void __init find_gnttab_region(struct domain *d,
                                       struct kernel_info *kinfo)
 {
+    unsigned int gnttab_frames =
+        gnttab_resource_max_frames(d, XENMEM_resource_grant_table_id_shared);
+
     /*
      * The region used by Xen on the memory will never be mapped in DOM0
      * memory layout. Therefore it can be used for the grant table.
@@ -1758,7 +1771,8 @@ static void __init find_gnttab_region(struct domain *d,
      * enough space for a large grant table
      */
     kinfo->gnttab_start = __pa(_stext);
-    kinfo->gnttab_size = gnttab_dom0_frames() << PAGE_SHIFT;
+    kinfo->gnttab_size = min_t(unsigned int, gnttab_frames,
+                               PFN_DOWN(_etext - _stext)) << PAGE_SHIFT;
 
 #ifdef CONFIG_ARM_32
     /*
-- 
2.43.0


