Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155A3606A330
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2026 23:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=n6nb9yD3
Received: from list by lists.xenproject.org with outflank-mailman.1477537.1682967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPTGc-0000fk-3H; Fri, 06 Nov 2026 23:22:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1477537.1682967; Fri, 06 Nov 2026 23:22:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xPTGb-0000fd-W1; Fri, 06 Nov 2026 23:22:41 +0000
Received: by outflank-mailman (input) for mailman id 1477537;
 Fri, 06 Nov 2026 23:22:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xPTGa-0000fX-Cm
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2026 23:22:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xPTGZ-001J6e-Q3
 for xen-devel@lists.xenproject.org; Sat, 07 Nov 2026 00:22:39 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee610a-bab6-0a2a0a5309dd-0a2a4501c53c-38
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:22:39 +0100
Received: from [52.101.62.44]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aee613d-5984-0a2a45010019-34653e2c72d5-4
 for <xen-devel@lists.xenproject.org>; Sat, 07 Nov 2026 00:22:39 +0100
Received: from CH0PR04CA0097.namprd04.prod.outlook.com (2603:10b6:610:75::12)
 by PH0PR12MB8151.namprd12.prod.outlook.com (2603:10b6:510:299::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 23:18:23 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:610:75:cafe::ae) by CH0PR04CA0097.outlook.office365.com
 (2603:10b6:610:75::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 23:18:22 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 23:18:22 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 17:18:21 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 17:18:21 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 6 Nov 2026 17:18:20 -0600
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
 b=Fu9sqzvi1I+cc6k8rcXv/c2Isb65aNZBMoyGZJXyeOxP+nxOn1h7XM3BU1xcGfgwk+Kp2AL0zYhxaWK3jD1Ho0q65Ny34/IVMKfS+iDGS07WatdszYxtKWE/t0LlUwgXrLp/uURkZ0j7yRf8X+gX+EbmmzEOTKdTVu6RHvbmVyUR7CyncLgX9Jc9eeoEw5GfqOZp1AN3I4lPuXae/Kt9jEMfgTDD+4djJpYoIzYOpZWDH+nRwva5I4/B11Nux6WeryBNj3m6ZTmTLNF5QHfNIolBXMgId7nTBCOnKOyw2k2+mZ/PPCvr6cbi68JhOCjrRJnbbf0b4NVPhq8j0+jhDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5E8tva5VeiWDebMRKelLIwpUYYUIu8xtyTWuQvy6+EI=;
 b=FKputN6N0eLW5kVVJdp9CwxSQIIhDsMz/8POio0jCoQjmwByxk6CHybiQBGYP3Vhslte2xUL0bXey6lJJtZBQlsh4JQWaTTyB2QsQbXvFLLyAHwep+1nicz/uqaksRbnpQ5dh1VX0rowT/KBsUnCcEuOCWuavLyiEA6i4ZN1O2PoMRrPG4QpzRcYT9wrUeXWfQi3uAU91I3VaGjDDHN5Lar9qJryvCIN53INe9dcj/CjKwESvFZXLqvPqWdnNy1A/TmHbBWW0kIFI/VkGioUZMB2IB+Bl12Ypc1y8XxwADg3kGMtz0nB2kX6XUCI/kjMgX3mx/NsxkBtc8h1kxjD8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5E8tva5VeiWDebMRKelLIwpUYYUIu8xtyTWuQvy6+EI=;
 b=n6nb9yD30F3GVdCJnIumDtqFvpgMPXkKd2UKaafSTiFrMw+BWEBf0lU3++o0EGF2PcnF6sxbAXbvPS0M0kgOfrnIw3aXuatnXUxXBSQ2J8mZta+CJxD22uRNnU1dcfbxRAgl8Vqg2wEUkK9xB0BzXC2b/7YzTIJvO5vYi/wmxt4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] xen/efi: Handle efi_memmap with Xen relocating itself
Date: Fri, 6 Nov 2026 18:18:18 -0500
Message-ID: <20261106231818.482564-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|PH0PR12MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b3dd3c2-9d56-45ef-525d-08df3c5c403d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261022115727099003|261022075727099003|261021121427099003|261022105027099003|261021123027099003|261009223027099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6Vq74p7dGr0zn3qCVAzQT7TvnZgmn2lfv3XRNT4f2XSpodCOf63QW0dbjZSQzg0OXDtQN5hl47dIy9z0Xvl+TEo9Ke+lYxD/HXA5uBK7V75wAtEO/ds9YlC3oiqMve/I1VAT0zplHepZ7O1pOEytxurgLAx3K3sOqCIoSTy/9oT2S/gVSP+trdnFqj6529SkfbBCOnc6uIrRWdJ/ka0RMlVwNbNl5n/S+dQ3DEn47t5tixcpxdnnpK7qqozi5CKzxoITxVpcOEeIaffQdI7bOirjh01/mrm9SdBQRMk91IvEIjwcOyP21XcRdojbOR5OeNXGohLawTElPI1MXJaYQhYOakXYRUK3XZ7qkPsL8UrX1zqNKBVKyW9LPfW9saDz5pHCsGrp3GMwQO1EyC2QPKYeVbiSOJE0WUN5dQ6FG9pcodMOIRIt+6kWMUOyTfI55njUzHIR7w4+82hd0SRndzyws699A76IpT/8+KJ3UJyo+r8lKBI8CYY3aPEaWk6yzaxTetS7ias2JDVpIjhh+GWx85B+0nWT3+Br56DfyYwROkGVPIMeifGKE4LOZYbRlKMjPr0IE9kSU3BC0zvMCemXHcnJTSvsIyOpitRjOUdjJQVswQNMtdsy4bCQ5dxhXHwmu4ZokT7h+taS4oV8dTHo4B1Ra5YcZSPBvZGy0sSCffjHeq2aooJ6+s5QmYAdp2zSUI427srktynKMgFh7Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261022115727099003)(261022075727099003)(261021121427099003)(261022105027099003)(261021123027099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GvdYk2iL8tlc9Q/GF6ZBoE5pyjELFC259LzVK47+FAAY5dWLqmc6/0hoJ8Y7JMl2z6zO2EFIG6veLAzL2c9lp7m+RNzwWhOHPVjv1t4xIk5ovbTk1J87P5w+xZFV62H5e58uBm7Zmn+tCEVI0D0+/V0rvfxtqssv9X6zqk4UA4iDoJWQItbKcHIdNCR/cFzqi+uKvGCYeFahEJTCnF0GHzdySamMvYK06AI5ac4UgK3FzHwH6VqX+fa9sh9w2ijcH5y0kCs4xThF+TWf3+Ujm5GnxwpnhxmoUgYCW8DsAXzAUGbL2ZtlurHqPcy78M84mZlxhqRe0o8IJZxkfWA7ynARgD31QREtyLd2HqkLSwh+XO6Zfzk/g1H3ouF6WNQimWCdAq/+VI0IIX9QC8T6t89BEXEziyaWSJDkngtJXvuZYu1rZApM+xyRgpuVmtB8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 23:18:22.1889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3dd3c2-9d56-45ef-525d-08df3c5c403d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8151
X-purgate-ID: tlsNG-d62444/1794007359-1DA7E757-D7B2E92C/0/0
X-purgate-type: clean
X-purgate-size: 3405
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With Xen booting via Multiboot2/GRUB on an EFI platform, and modified to
use MULTIBOOT2_LOAD_PREFERENCE_LOW, Xen relocates itself with
move_xen().

However a PVH dom0 shows:
kernel: Failed to lookup header 0x77ffd000 in Xen memory map: error -3
kernel: ACPI=0x77ffd000

... for all the Xen efi memory map lookups.  Dumping the memory map at
runtime showed it was scrubbed.  Because Xen relocated itself, the
original physical address referenced through a directmap address goes
stale.

Add efi_arch_mmap_buffer_virt() to convert from the initial value to an
appropriate runtime value.  ARM uses Boot Services AllocatePool(), so it
must continue to use DIRECTMAP_VIRT_START.

For x86, we use an offset into the loaded Xen binary at the time of the
call and add the to XEN_VIRT_START.  ebmalloc() allocates from the Xen
image memory, so it moves during relocation.  xen_phys_start is set for
xen.efi in efi_exit_boot(), but not for xen.gz, so it cannot be used
Use `lea __image_base__(%rip)` to get the current load address, and use
that to calculate the offset into the Xen image.  That offset is also
valid from XEN_VIRT_START.

Fixes: c5b9805bc1f7 ("efi: create new early memory allocator")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
I think it could be seen without MULTIBOOT2_LOAD_PREFERENCE_LOW if xen
chose to relocate itself.  But since grub usually loads xen high, it
doesn't relocate itself.
---
 xen/arch/arm/efi/efi-boot.h |  5 +++++
 xen/arch/x86/efi/efi-boot.h | 10 ++++++++++
 xen/common/efi/boot.c       |  2 +-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 069cc68b0a..717bd8d607 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -449,6 +449,11 @@ static void *__init efi_arch_allocate_mmap_buffer(UINTN map_size)
     return ptr;
 }
 
+static void *__init efi_arch_mmap_buffer_virt(void *ptr)
+{
+    return ptr + DIRECTMAP_VIRT_START;
+}
+
 static void __init efi_arch_edd(void)
 {
 }
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index d738b839ee..ffc277ccfd 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -224,6 +224,16 @@ static void *__init efi_arch_allocate_mmap_buffer(UINTN map_size)
     return ebmalloc(map_size);
 }
 
+static void *__init efi_arch_mmap_buffer_virt(void *ptr)
+{
+    unsigned long load_base;
+
+    /* RIP-relative address is the current Xen load address. */
+    asm("lea __image_base__(%%rip), %0" : "=r" (load_base));
+
+    return ptr - load_base + XEN_VIRT_START;
+}
+
 static void __init efi_arch_pre_exit_boot(void)
 {
     if ( !trampoline_phys )
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 89b5831691..5396bad7a5 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1425,8 +1425,8 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
     /* Adjust pointers into EFI. */
     efi_ct = (const void *)efi_ct + DIRECTMAP_VIRT_START;
     efi_rs = (const void *)efi_rs + DIRECTMAP_VIRT_START;
-    efi_memmap = (void *)efi_memmap + DIRECTMAP_VIRT_START;
     efi_fw_vendor = (const void *)efi_fw_vendor + DIRECTMAP_VIRT_START;
+    efi_memmap = efi_arch_mmap_buffer_virt(efi_memmap);
 }
 
 /* SAF-1-safe */
-- 
2.34.1


