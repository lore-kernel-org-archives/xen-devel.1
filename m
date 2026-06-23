Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300C9CDB470
	for <xen-devel@archiver.kernel.org>; Tue, 23 Jun 2026 21:03:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1344500.1603538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc8Gy-0000Pa-9H; Tue, 23 Jun 2026 21:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344500.1603538; Tue, 23 Jun 2026 21:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc8Gy-0000PT-67; Tue, 23 Jun 2026 21:03:08 +0000
Received: by outflank-mailman (input) for mailman id 1344500;
 Tue, 23 Jun 2026 21:03:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1wc8Gx-0000P2-Jr
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 21:03:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc8Gw-000Nt9-2C; Tue, 23 Jun 2026 23:03:06 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6a3af461-e002-0a2a0a5209dd-0a2a4502dd4e-26
 for <multiple-recipients>; Tue, 23 Jun 2026 23:03:05 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <ehem@m5p.com>)
 id 6a3af488-fdf1-0a2a45020019-4a68bc043162-3
 for <multiple-recipients>; Tue, 23 Jun 2026 23:03:05 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 65NL2vr4071604
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 23 Jun 2026 17:03:02 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 65NL2ub6071603;
 Tue, 23 Jun 2026 14:02:56 -0700 (PDT) (envelope-from ehem)
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
Date: Tue, 23 Jun 2026 14:02:56 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org
Subject: Update for Tianocore/EDK2 needed for ARM
Message-ID: <ajr0gN9kmPkLQlGF@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="flcvX6a7KUqt5CGv"
Content-Disposition: inline
X-purgate-ID: tlsNG-720697/1782248585-44E6F3F3-15275D7D/0/0
X-purgate-type: clean
X-purgate-size: 3436


--flcvX6a7KUqt5CGv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Tianocore/EDK2 is one of the prefered Xen bootloaders.  On ARM it is
indeed very functional.  Unfortunately the change of disallowing multiple
mappings of the shared information page breaks booting with
Tianocore/EDK2.  As the change was done on Xen I suspect they would say
it is the Xen Project's job to submit a fix.

Their history suggests Julien Grall had been the liason for
Tianocore/EDK2, so you're the one I'm sending this message towards.

The attached patch restores Tianocore/EDK2's ability to function as a
DomU bootloader on Xen.  I believe this patch though is incomplete.  In
particular I believe Dev->SharedInfo is a region marked as retained by
firmware and not to be used by the OS.  This would need to be changed to
only being used until BootServices exits.

I'm not really up for polishing the patch to get it into Tianocore/EDK2.
Problem is their style seems awful to me and I don't want to finish.
Nonetheless this seems fairly crucial as DomU bootloaders are.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



--flcvX6a7KUqt5CGv
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename=0001-OvmfPkg-XenBusDxe-Unmap-shared-information-page-on-e.patch

From 225da4bd7b73d48ae54b4bacc7ffd8596ee370fa Mon Sep 17 00:00:00 2001
Message-ID: <225da4bd7b73d48ae54b4bacc7ffd8596ee370fa.1782247458.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
Date: Wed, 4 Oct 2023 21:47:17 -0700
Subject: [PATCH] OvmfPkg/XenBusDxe: Unmap shared information page on exit

Xen/ARM now requires the shared information page to only be mapped once.
This behavior is expected to be copied to Xen/x86 at some future point.
---
 OvmfPkg/XenBusDxe/XenBusDxe.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/OvmfPkg/XenBusDxe/XenBusDxe.c b/OvmfPkg/XenBusDxe/XenBusDxe.c
index 132f43a72b..117a299d10 100644
--- a/OvmfPkg/XenBusDxe/XenBusDxe.c
+++ b/OvmfPkg/XenBusDxe/XenBusDxe.c
@@ -83,7 +83,34 @@ XenGetSharedInfoPage (
 
   return EFI_SUCCESS;
 }
-
+
+/**
+  Map the shared_info_t page into memory.
+
+  @param Dev    A XENBUS_DEVICE instance.
+**/
+VOID
+XenClearSharedInfoPage (
+  IN OUT XENBUS_DEVICE  *Dev
+  )
+{
+  xen_remove_from_physmap_t  Parameter;
+
+  //
+  // Either never mapped, or else already cleared.  No further cleanup
+  // action required.
+  //
+  if (!Dev->SharedInfo) return;
+
+  Parameter.domid = DOMID_SELF;
+  Parameter.gpfn  = (UINTN)Dev->SharedInfo >> EFI_PAGE_SHIFT;
+  if (XenHypercallMemoryOp (XENMEM_remove_from_physmap, &Parameter) != 0)
+    return;
+
+  FreePages (Dev->SharedInfo, 1);
+  Dev->SharedInfo = NULL;
+}
+
 /**
   Unloads an image.
 
@@ -500,7 +527,9 @@ XenBusDxeDriverBindingStop (
   gBS->CloseEvent (Dev->ExitBootEvent);
   XenStoreDeinit (Dev);
   XenGrantTableDeinit (Dev);
-
+
+  XenClearSharedInfoPage(Dev);
+
   gBS->CloseProtocol (
          ControllerHandle,
          &gEfiDevicePathProtocolGuid,
-- 
2.47.3


--flcvX6a7KUqt5CGv--

