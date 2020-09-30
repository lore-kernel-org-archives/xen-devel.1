Return-Path: <SRS0=Shbi=DH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF680C4727E
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 12:00:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF0422075F
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 12:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF0422075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.627.2089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNamd-0001fO-Lv; Wed, 30 Sep 2020 12:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627.2089; Wed, 30 Sep 2020 12:00:31 +0000
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
	id 1kNamd-0001fG-IQ; Wed, 30 Sep 2020 12:00:31 +0000
Received: by outflank-mailman (input) for mailman id 627;
 Wed, 30 Sep 2020 12:00:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eJ1H=DH=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kNamc-0001eL-4W
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:00:30 +0000
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4aa224d5-133f-4b1e-b179-648e60b1d2d6;
 Wed, 30 Sep 2020 12:00:29 +0000 (UTC)
Received: from ame8.swcp.com (ame8.swcp.com [216.184.2.163])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 08UC0RMK005372;
 Wed, 30 Sep 2020 06:00:27 -0600
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame8.swcp.com (8.15.2/8.15.2) with ESMTP id 08UC0BdD003035;
 Wed, 30 Sep 2020 06:00:23 -0600 (MDT) (envelope-from hudson@trmm.net)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eJ1H=DH=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kNamc-0001eL-4W
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:00:30 +0000
X-Inumbo-ID: 4aa224d5-133f-4b1e-b179-648e60b1d2d6
Received: from mx1a.swcp.com (unknown [216.184.2.64])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4aa224d5-133f-4b1e-b179-648e60b1d2d6;
	Wed, 30 Sep 2020 12:00:29 +0000 (UTC)
Received: from ame8.swcp.com (ame8.swcp.com [216.184.2.163])
	by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 08UC0RMK005372;
	Wed, 30 Sep 2020 06:00:27 -0600
Received-SPF: neutral (ame8.swcp.com: 62.251.112.184 is neither permitted nor denied by domain of hudson@trmm.net) receiver=ame8.swcp.com; client-ip=62.251.112.184; helo=diamond.fritz.box; envelope-from=hudson@trmm.net; x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with libspf2-1.2.10;
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
	by ame8.swcp.com (8.15.2/8.15.2) with ESMTP id 08UC0BdD003035;
	Wed, 30 Sep 2020 06:00:23 -0600 (MDT)
	(envelope-from hudson@trmm.net)
X-Authentication-Warning: ame8.swcp.com: Host 62-251-112-184.ip.xs4all.nl [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
        wl@xen.org
Subject: [PATCH v8 2/5] efi/boot.c: add handle_file_info()
Date: Wed, 30 Sep 2020 08:00:08 -0400
Message-Id: <20200930120011.1622924-3-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930120011.1622924-1-hudson@trmm.net>
References: <20200930120011.1622924-1-hudson@trmm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78
X-Greylist: Message whitelisted by DRAC access database, not delayed by milter-greylist-4.6.2 (ame8.swcp.com [216.184.2.128]); Wed, 30 Sep 2020 06:00:26 -0600 (MDT)
X-Virus-Scanned: clamav-milter 0.99.2 at ame8
X-Virus-Status: Clean

Add a separate function to display the address ranges used by
the files and call `efi_arch_handle_module()` on the modules.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/efi/boot.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index c2ce0c7294..93cfeba7e1 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -540,6 +540,22 @@ static char * __init split_string(char *s)
     return NULL;
 }
 
+static void __init handle_file_info(CHAR16 *name,
+                                    const struct file *file, const char *options)
+{
+    if ( file == &cfg )
+        return;
+
+    PrintStr(name);
+    PrintStr(L": ");
+    DisplayUint(file->addr, 2 * sizeof(file->addr));
+    PrintStr(L"-");
+    DisplayUint(file->addr + file->size, 2 * sizeof(file->addr));
+    PrintStr(newline);
+
+    efi_arch_handle_module(file, name, options);
+}
+
 static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
                              struct file *file, const char *options)
 {
@@ -584,16 +600,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     {
         file->need_to_free = true;
         file->size = size;
-        if ( file != &cfg )
-        {
-            PrintStr(name);
-            PrintStr(L": ");
-            DisplayUint(file->addr, 2 * sizeof(file->addr));
-            PrintStr(L"-");
-            DisplayUint(file->addr + size, 2 * sizeof(file->addr));
-            PrintStr(newline);
-            efi_arch_handle_module(file, name, options);
-        }
+        handle_file_info(name, file, options);
 
         ret = FileHandle->Read(FileHandle, &file->size, file->str);
         if ( !EFI_ERROR(ret) && file->size != size )
-- 
2.25.1


