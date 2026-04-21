Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48470F8FA90
	for <xen-devel@archiver.kernel.org>; Tue, 21 Apr 2026 16:16:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1289180.1569373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFDln-00026z-3b; Tue, 21 Apr 2026 16:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1289180.1569373; Tue, 21 Apr 2026 16:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFDln-00026s-0T; Tue, 21 Apr 2026 16:16:15 +0000
Received: by outflank-mailman (input) for mailman id 1289180;
 Tue, 21 Apr 2026 16:16:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wFDlk-00026m-Uh
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 16:16:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFDlk-00CoEo-Bm
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 18:16:12 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e7a2b5-bab6-0a2a0a5309dd-0a2a4505c4d2-40
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 18:16:12 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e7a2cb-aaa8-0a2a45050019-a0658309a4bc-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 18:16:12 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 8849981B9152;
 Tue, 21 Apr 2026 12:15:14 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 1/1] xen/efi: Config parsing: Free the same page count as allocated.
Date: Tue, 21 Apr 2026 17:13:50 +0100
Message-Id: <127e7a4e0bf360d7ffe8be94022840a353a307b2.1776787216.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1776788172-E07AE443-785AB7C8/0/0
X-purgate-type: clean
X-purgate-size: 4121

When reading the config file or the config section, we may need to append
a terminating NUL byte to the config buffer if the last byte is not a
control character.

This may cause an additional page to be allocated by efi_bs->AllocatePages()
if the config file or config section size is a multiple of the page size.

For this case, increment file->size by one so the number of pages to be
freed by efi_bs->FreePages() is the same as the number of pages allocated
by efi_bs->AllocatePages() when the additional byte is allocated.

I moved the dcache flush after the NUL termination so the flushed range
covers the final buffer contents.

I didn't add a dcache flush for the copied cfg buffer in read_section():
that buffer is created by memcpy() and then consumed only by normal CPU
reads in the EFI loader, so there is no non-coherent producer or other
observer that would require cache maintenance.

Fixes: df75f77092c1 ("EFI: avoid OOB config file reads")
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

----
PS: The same fix applies to its backport to 4.21 and other branches,
for example:

stable-4.21:
Fixes: feb99494bf59 ("EFI: avoid OOB config file reads")

stable-4.20:
Fixes: 05b8f716aa32 ("EFI: avoid OOB config file reads")

PPS: A review using GPT-5.4 (just a data point for review) confirms what
I've found by manual code inspection:

> The fix in boot.c:882-886 and boot.c:913-928 is consistent with the existing
> free sites at boot.c:790-797, boot.c:1564-1567, and boot.c:1638-1641: Once the
> config buffer gets an extra terminating byte, using the incremented size for
> PFN_UP during FreePages is the right fix.
>
> I also checked the parser helpers at boot.c:584-641; they already operate on
> a bounded buffer and treat NUL/control bytes as terminators, so the synthetic
> extra byte does not create an obvious parsing regression.
---
 xen/common/efi/boot.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index b44762878be4..94461b113180 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -858,7 +858,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
     what = L"Allocation";
     file->addr = min(1UL << (32 + PAGE_SHIFT),
                      HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
-    /* For config files allocate an extra byte to put a NUL there. */
+
+    /* For config file buffers, allocate space for the terminating NUL byte */
     ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
                                 PFN_UP(size + (file == &cfg)), &file->addr);
     if ( EFI_ERROR(ret) )
@@ -877,10 +878,12 @@ static bool __init read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
 
     FileHandle->Close(FileHandle);
 
-    efi_arch_flush_dcache_area(file->ptr, file->size);
-
     if ( file == &cfg )
-        file->str[file->size] = 0;
+    {
+        file->str[file->size] = 0; /* NUL-terminate the config data buffer. */
+        file->size += 1;           /* Free the same page count as allocated. */
+    }
+    efi_arch_flush_dcache_area(file->ptr, file->size);
 
     return true;
 
@@ -907,9 +910,9 @@ static bool __init read_section(const EFI_LOADED_IMAGE *image,
 
     file->ptr = ptr;
 
-    /* For cfg file, if necessary allocate space to put an extra NUL there. */
     if ( file == &cfg && file->size && !iscntrl(file->str[file->size - 1]) )
     {
+        /* Create a copy the config section for terminating the config buffer */
         EFI_PHYSICAL_ADDRESS addr;
         EFI_STATUS ret = efi_bs->AllocatePages(AllocateMaxAddress,
                                                EfiLoaderData,
@@ -922,6 +925,7 @@ static bool __init read_section(const EFI_LOADED_IMAGE *image,
         file->addr = addr;
         file->need_to_free = true;
         file->str[file->size] = 0;
+        file->size += 1; /* Free the same page count as allocated. */
     }
 
     handle_file_info(name, file, options);
-- 
2.39.5


