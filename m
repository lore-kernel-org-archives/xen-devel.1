Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D7D606A336
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 00:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UaBKbJCl
Received: from list by lists.xenproject.org with outflank-mailman.1493441.1693417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTTsp-0006jm-NJ; Wed, 18 Nov 2026 00:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493441.1693417; Wed, 18 Nov 2026 00:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTTsp-0006jf-Kg; Wed, 18 Nov 2026 00:50:43 +0000
Received: by outflank-mailman (input) for mailman id 1493441;
 Wed, 18 Nov 2026 00:50:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xTTso-0006jZ-Cm
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 00:50:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTTsn-003ZlP-Ls
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 01:50:41 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6afcf623-bab6-0a2a0a5309dd-0a2a4503ba4e-20
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 01:50:41 +0100
Received: from [52.101.48.18]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6afcf65f-fae8-0a2a45030019-346530129190-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 01:50:40 +0100
Received: from CH0P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::27)
 by DS0PR12MB6464.namprd12.prod.outlook.com (2603:10b6:8:c4::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.12; Wed, 18 Nov 2026 00:50:33 +0000
Received: from DM3PEPF000265B0.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::4e) by CH0P220CA0006.outlook.office365.com
 (2603:10b6:610:ef::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 18
 Nov 2026 00:50:33 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DM3PEPF000265B0.mail.protection.outlook.com (10.167.23.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 00:50:32 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 18:50:32 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 18:50:31 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 18:50:28 -0600
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
 b=A0ApsdEtmYY8+3WrDyvI9HHtmFk6qP08tqb/KRU7BYqmq3r7kWD6INdCXSRn31zJmNul7jLKBsyfB2PrPIvKcsPgJ5atH7265cn7n2Txor5soz7tua6jyPgtXZ7OJEAnv72qZoIQ33QgOe2ycG3gfg+Ij+JxFcM+p1NO4s+mYJQMzW1n081uzcxcdjxzhfXgogDnpR5eVMw07bdba8qv+RTIcGlCYd/V7mKYzVP1vVZ3ImbGg7dqGmxQej8gow4PSbJKIUtzo2qR8+EjDeiFS17sPpTgt2VLceKqCNGbpqXRydq3DaC/OTHZQzZRsSPan8LP3krNhOkM0S1KUCHWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cByp1l5IDKbIGdEbw2/Oo0I2IiXL9zFRAGHMcla+V+0=;
 b=X+Mjksu9kwy2fxM6NGi7xnqN0R55R41DpQg4NU2DlMyYo5MaJ9FRXCjPKBhhNNqufC+hd3Y1+QlIH9FG89K46/8a70jLUXZBdB7mYTZQ23uLOBXd6yH8mV2Ahk0N4lJYJ6Ozwra4nDtyBwgufct+R9Fs3F7ipa63p7o6yOVN9t1yu3CZPNa3ci9Yd7AnE+EoDVmM5xXBAWp2MBv5ua+dKaqClCk6QSrNIgILlUis+Lj6NyKEU0Rf6E8XkkZbRNUKVAlg4PjfMhnYpn2JWss/p6tTCL7gBiPPs5ztnCSW8dVL5NLZZ0LbLqVu/5E5XKJzJWTLZJRU8r7TuL9jWk/2sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cByp1l5IDKbIGdEbw2/Oo0I2IiXL9zFRAGHMcla+V+0=;
 b=UaBKbJClUY2baaYputeOPgIX/ybEmv9l84mDQxFYm89J2nxY32L7eTAqaeqsvjpmQPYhnnrVrI3V9uEXV8VmuFvz8wVPtlGQMDFhJ3LxXg9J33jwa/nt5C9y78MMoDCirUOunswPAA75/UtjC1XuWWizSrFk+vQxzjs+RCmwXQ4=
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
Subject: [PATCH v2] xen/efi: Handle efi_memmap with Xen relocating itself
Date: Tue, 17 Nov 2026 19:50:21 -0500
Message-ID: <20261118005021.2809-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B0:EE_|DS0PR12MB6464:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c06d51-5ab3-4325-d27a-08df450df32d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|82310400026|1800799024|10067099003|261022105027099003|56012099006|11063799006|261021121427099003|261022115727099003|261009223027099003|261026140227099003|261022075727099003|261028144727099003|261102123227099003|261021123027099003|261026121527099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	hCozo39eUINOoT3ZOnet7o/A9ZN7mFIzZ6/zq1ythnZ78qQlL3VymVszULd/mTQxPYRQIK+Gb3HqIi2i1Wqx9ESsvukFnDkuQzP+c2wnD640lfxsIJQyqnST4SkkIZIzIU0sY1MLI6kZhsn3YUV8UOTkxQeTRQIO+qmD18bV1DT0s6elt9Z5QMx+q5tI+TKTtn5cyZ4gXuS3Ny1MUya5I8wWXvq/ObmrXi8fZ2NtknZhowk1+T0aAWKHdLo7CsgTfvHp4I2Cb4qu3Cujb97xl3ytpUjf7AFWoN7CM6ZEXWCmLqoKhZh7/PrJKzi9PybFUrIeTMqJjB+4CnjPsndE2rHgk6+MMga4kjkNsUAboWdwR3JhuzN4vLrcoX7ev+J884QxGqqhG+HEeTKR3efWM/xID0x7rdzO84qFkcarrUHUhiuL2yGqsdBmHo04kkmwVsB+9SSHXg3mClbi+4rjvQqMFAPCR21pMUneJnNS3bYA2WILstKLhYd2yq/LfR/Mq8j7xoZ2CzVxuNtpwt+duk/xVf9xjtYUw6+MaK+Es+r3FYiqdwPDJiNLpoI1okx5/ntzjHAwXNyNNBb1XejWuPOx16PVIV2mKRrr7Gmvfa3Fgl23ZmOa76ZNnZ2URFfQWsnHo3U7WP4OjWOMPXG0Um/hpojPLEuFLwoa+zYDfrXEdPlBOlDOrl/BXvTOz48guFSXVFjeZKk71RhmpsyILQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(82310400026)(1800799024)(10067099003)(261022105027099003)(56012099006)(11063799006)(261021121427099003)(261022115727099003)(261009223027099003)(261026140227099003)(261022075727099003)(261028144727099003)(261102123227099003)(261021123027099003)(261026121527099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d/PregS78Shx67fDhWz5z36uYrRPH+PLRmA7gL44Ow9nEzAoc1CIdINPOyq4TQSu1gBjD842D+8g1ODMM0OUCafjweaNeO10RJjpt7KglsdqNDRNRhmE1Jw2KttX7ivlTyqVgJdmH3bF7y14iN8aEo4I/aBXfhJRb+F+jS9yhPs/JVtAcXoErdAdyAB9id3BI7EwHSkCMb+CCgAYfw6qk3pVKNgectJshxC4TC1el1bCGOjkZGCO32Zy1eBRl5MQG/tB5Fyix5LjOON5NvtpwReEvwyt+hfUZi0PI74VhR34vXEyXr0bDB7IqcIfVJU4iwk2BR1qWBXbCkaABrtfKnro2VSZCeMnX70AuNOWL4xnll/Xcm/LCU6h72EvW6yDUFVWVEfSlCK+327wYzk3LljK43Q+g9o5UL1FDQGQQKOls7zHpt31La60L7FDFAE4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 00:50:32.5752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c06d51-5ab3-4325-d27a-08df450df32d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6464
X-purgate-ID: tlsNG-33051d/1794963041-75EFF4E9-82838321/0/0
X-purgate-type: clean
X-purgate-size: 4386
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
xen.efi in efi_exit_boot(), but not for xen.gz, so it cannot be used.

Add a generic helper using `lea __image_base__(%rip)` to get the current
load address, and use that to calculate the offset into the Xen image.
That offset is also valid from XEN_VIRT_START.  Ensure the value passed
in is within the image.  Use the generic helper to implement
efi_arch_mmap_buffer_virt().

Fixes: c5b9805bc1f7 ("efi: create new early memory allocator")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
I think it could be seen without MULTIBOOT2_LOAD_PREFERENCE_LOW if xen
chose to relocate itself.  But since grub usually loads xen high, it
doesn't relocate itself.

_end is already calculated as a rip-relative address by the compiler.  I
still added an inline asm to ensure a rip-relative value is used.  i.e.
I don't see why the compiler couldn't insert the absolute value, if it
chose to.  With CONFIG_DEBUG=n, I see the inline asm for _end removed.

v2:
Use common helper
Add ASSERT()s
---
 xen/arch/arm/efi/efi-boot.h |  5 +++++
 xen/arch/x86/efi/efi-boot.h | 24 ++++++++++++++++++++++++
 xen/common/efi/boot.c       |  2 +-
 3 files changed, 30 insertions(+), 1 deletion(-)

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
index d738b839ee..f35a50d091 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -219,11 +219,35 @@ static void __init efi_arch_process_memory_map(EFI_SYSTEM_TABLE *SystemTable,
 
 }
 
+/*
+ * Convert a runtime 1:1 physical address within the
+ * Xen image to a Xen virtual address.
+ */
+static void *__init efi_arch_image_phys_to_virt(void *ptr)
+{
+    unsigned long load_base;
+    unsigned long load_end;
+
+    /* RIP-relative address is the current Xen load address. */
+    asm ( "lea __image_base__(%%rip), %0" : "=r" (load_base) );
+    asm ( "lea _end(%%rip), %0" : "=r" (load_end) );
+
+    ASSERT(ptr >= (void *)load_base);
+    ASSERT(ptr <  (void *)load_end);
+
+    return ptr - load_base + XEN_VIRT_START;
+}
+
 static void *__init efi_arch_allocate_mmap_buffer(UINTN map_size)
 {
     return ebmalloc(map_size);
 }
 
+static void *__init efi_arch_mmap_buffer_virt(void *ptr)
+{
+    return efi_arch_image_phys_to_virt(ptr);
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


