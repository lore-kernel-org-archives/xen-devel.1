Return-Path: <SRS0=a+y6=DG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43211C47420
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2020 18:17:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D500F208B8
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2020 18:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D500F208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.339.988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNKBz-0000ym-Oj; Tue, 29 Sep 2020 18:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339.988; Tue, 29 Sep 2020 18:17:35 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNKBz-0000yf-Lj; Tue, 29 Sep 2020 18:17:35 +0000
Received: by outflank-mailman (input) for mailman id 339;
 Tue, 29 Sep 2020 18:17:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/JXF=DG=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kNKBy-0000ya-Ks
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 18:17:34 +0000
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe0f2324-29ad-4c14-8979-b082e123d361;
 Tue, 29 Sep 2020 18:17:32 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 08TIHUFi004926;
 Tue, 29 Sep 2020 12:17:30 -0600
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 08TIHJkp051120;
 Tue, 29 Sep 2020 12:17:27 -0600 (MDT) (envelope-from hudson@trmm.net)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=/JXF=DG=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kNKBy-0000ya-Ks
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 18:17:34 +0000
X-Inumbo-ID: fe0f2324-29ad-4c14-8979-b082e123d361
Received: from mx1a.swcp.com (unknown [216.184.2.64])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id fe0f2324-29ad-4c14-8979-b082e123d361;
	Tue, 29 Sep 2020 18:17:32 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
	by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 08TIHUFi004926;
	Tue, 29 Sep 2020 12:17:30 -0600
Received-SPF: neutral (ame7.swcp.com: 62.251.112.184 is neither permitted nor denied by domain of hudson@trmm.net) receiver=ame7.swcp.com; client-ip=62.251.112.184; helo=diamond.fritz.box; envelope-from=hudson@trmm.net; x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with libspf2-1.2.10;
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
	by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 08TIHJkp051120;
	Tue, 29 Sep 2020 12:17:27 -0600 (MDT)
	(envelope-from hudson@trmm.net)
X-Authentication-Warning: ame7.swcp.com: Host 62-251-112-184.ip.xs4all.nl [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
        wl@xen.org
Subject: [PATCH v7 1/5] efi/boot.c: add file.need_to_free
Date: Tue, 29 Sep 2020 14:17:13 -0400
Message-Id: <20200929181717.1596965-2-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200929181717.1596965-1-hudson@trmm.net>
References: <20200929181717.1596965-1-hudson@trmm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.83
X-Greylist: Message whitelisted by DRAC access database, not delayed by milter-greylist-4.6.2 (ame7.swcp.com [216.184.2.128]); Tue, 29 Sep 2020 12:17:29 -0600 (MDT)
X-Virus-Scanned: clamav-milter 0.100.2 at ame7
X-Virus-Status: Clean

The config file, kernel, initrd, etc should only be freed if they
are allocated with the UEFI allocator.  On x86 the ucode, and on
ARM the dtb, are also marked as need_to_free.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
---
 xen/arch/arm/efi/efi-boot.h |  2 +-
 xen/arch/x86/efi/efi-boot.h |  2 +-
 xen/common/efi/boot.c       | 10 ++++++----
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 27dd0b1a94..82f2fc7685 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -546,7 +546,7 @@ static void __init efi_arch_cpu(void)
 
 static void __init efi_arch_blexit(void)
 {
-    if ( dtbfile.addr && dtbfile.size )
+    if ( dtbfile.need_to_free )
         efi_bs->FreePages(dtbfile.addr, PFN_UP(dtbfile.size));
     if ( memmap )
         efi_bs->FreePool(memmap);
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index eef3f52789..1025000afd 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -689,7 +689,7 @@ static void __init efi_arch_cpu(void)
 
 static void __init efi_arch_blexit(void)
 {
-    if ( ucode.addr )
+    if ( ucode.need_to_free )
         efi_bs->FreePages(ucode.addr, PFN_UP(ucode.size));
 }
 
diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 157fe0e8c5..c2ce0c7294 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -102,6 +102,7 @@ union string {
 
 struct file {
     UINTN size;
+    bool need_to_free;
     union {
         EFI_PHYSICAL_ADDRESS addr;
         char *str;
@@ -280,13 +281,13 @@ void __init noreturn blexit(const CHAR16 *str)
     if ( !efi_bs )
         efi_arch_halt();
 
-    if ( cfg.addr )
+    if ( cfg.need_to_free )
         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
-    if ( kernel.addr )
+    if ( kernel.need_to_free )
         efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
-    if ( ramdisk.addr )
+    if ( ramdisk.need_to_free )
         efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
-    if ( xsm.addr )
+    if ( xsm.need_to_free )
         efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));
 
     efi_arch_blexit();
@@ -581,6 +582,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     }
     else
     {
+        file->need_to_free = true;
         file->size = size;
         if ( file != &cfg )
         {
-- 
2.25.1


