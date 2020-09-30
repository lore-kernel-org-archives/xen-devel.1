Return-Path: <SRS0=Shbi=DH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37C4C4727E
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 12:00:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6150C2076B
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 12:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6150C2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.628.2101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNami-0001jv-U2; Wed, 30 Sep 2020 12:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628.2101; Wed, 30 Sep 2020 12:00:36 +0000
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
	id 1kNami-0001jn-Qo; Wed, 30 Sep 2020 12:00:36 +0000
Received: by outflank-mailman (input) for mailman id 628;
 Wed, 30 Sep 2020 12:00:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eJ1H=DH=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kNamg-0001iP-P3
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:00:34 +0000
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23989c6d-8ac6-42b3-8cb7-ddba8fb81831;
 Wed, 30 Sep 2020 12:00:33 +0000 (UTC)
Received: from ame8.swcp.com (ame8.swcp.com [216.184.2.163])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 08UC0VVc005378;
 Wed, 30 Sep 2020 06:00:31 -0600
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame8.swcp.com (8.15.2/8.15.2) with ESMTP id 08UC0BdE003035;
 Wed, 30 Sep 2020 06:00:28 -0600 (MDT) (envelope-from hudson@trmm.net)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eJ1H=DH=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kNamg-0001iP-P3
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 12:00:34 +0000
X-Inumbo-ID: 23989c6d-8ac6-42b3-8cb7-ddba8fb81831
Received: from mx1a.swcp.com (unknown [216.184.2.64])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 23989c6d-8ac6-42b3-8cb7-ddba8fb81831;
	Wed, 30 Sep 2020 12:00:33 +0000 (UTC)
Received: from ame8.swcp.com (ame8.swcp.com [216.184.2.163])
	by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 08UC0VVc005378;
	Wed, 30 Sep 2020 06:00:31 -0600
Received-SPF: neutral (ame8.swcp.com: 62.251.112.184 is neither permitted nor denied by domain of hudson@trmm.net) receiver=ame8.swcp.com; client-ip=62.251.112.184; helo=diamond.fritz.box; envelope-from=hudson@trmm.net; x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with libspf2-1.2.10;
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
	by ame8.swcp.com (8.15.2/8.15.2) with ESMTP id 08UC0BdE003035;
	Wed, 30 Sep 2020 06:00:28 -0600 (MDT)
	(envelope-from hudson@trmm.net)
X-Authentication-Warning: ame8.swcp.com: Host 62-251-112-184.ip.xs4all.nl [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
        wl@xen.org
Subject: [PATCH v8 3/5] efi/boot.c: wrap PrintStr/PrintErr to allow const CHAR16* arguments
Date: Wed, 30 Sep 2020 08:00:09 -0400
Message-Id: <20200930120011.1622924-4-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930120011.1622924-1-hudson@trmm.net>
References: <20200930120011.1622924-1-hudson@trmm.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78
X-Greylist: Message whitelisted by DRAC access database, not delayed by milter-greylist-4.6.2 (ame8.swcp.com [216.184.2.128]); Wed, 30 Sep 2020 06:00:30 -0600 (MDT)
X-Virus-Scanned: clamav-milter 0.99.2 at ame8
X-Virus-Status: Clean

This patch wraps the EFI OutputString() method so that they can be
called with const arguments.  The OutputString method does not modify
its argument, although the prototype is missing const, so it is necssary
to cast away the const when calling it.

It also updates callers of PrintStr/PrintErr to remove unneeded un-const casts.

Signed-off-by: Trammell Hudson <hudson@trmm.net>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/efi/boot.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 93cfeba7e1..bd629eb658 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -151,10 +151,17 @@ static struct file __initdata cfg;
 static struct file __initdata kernel;
 static struct file __initdata ramdisk;
 static struct file __initdata xsm;
-static CHAR16 __initdata newline[] = L"\r\n";
+static const CHAR16 __initconst newline[] = L"\r\n";
 
-#define PrintStr(s) StdOut->OutputString(StdOut, s)
-#define PrintErr(s) StdErr->OutputString(StdErr, s)
+static void __init PrintStr(const CHAR16 *s)
+{
+    StdOut->OutputString(StdOut, (CHAR16 *)s );
+}
+
+static void __init PrintErr(const CHAR16 *s)
+{
+    StdErr->OutputString(StdErr, (CHAR16 *)s );
+}
 
 /*
  * Include architecture specific implementation here, which references the
@@ -275,7 +282,7 @@ static bool __init match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2)
 void __init noreturn blexit(const CHAR16 *str)
 {
     if ( str )
-        PrintStr((CHAR16 *)str);
+        PrintStr(str);
     PrintStr(newline);
 
     if ( !efi_bs )
@@ -316,7 +323,7 @@ static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
     EFI_STATUS ErrIdx = ErrCode & ~EFI_ERROR_MASK;
 
     StdOut = StdErr;
-    PrintErr((CHAR16 *)mesg);
+    PrintErr(mesg);
     PrintErr(L": ");
 
     if( (ErrIdx < ARRAY_SIZE(ErrCodeToStr)) && ErrCodeToStr[ErrIdx] )
@@ -540,7 +547,7 @@ static char * __init split_string(char *s)
     return NULL;
 }
 
-static void __init handle_file_info(CHAR16 *name,
+static void __init handle_file_info(const CHAR16 *name,
                                     const struct file *file, const char *options)
 {
     if ( file == &cfg )
@@ -562,7 +569,7 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     EFI_FILE_HANDLE FileHandle = NULL;
     UINT64 size;
     EFI_STATUS ret;
-    CHAR16 *what = NULL;
+    const CHAR16 *what = NULL;
 
     if ( !name )
         PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
-- 
2.25.1


