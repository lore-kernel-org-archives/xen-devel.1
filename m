Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741D1C44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 15:50:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366751.1616710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqFp-0008Nl-BL; Mon, 20 Jul 2026 15:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366751.1616710; Mon, 20 Jul 2026 15:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqFp-0008Nc-8P; Mon, 20 Jul 2026 15:50:05 +0000
Received: by outflank-mailman (input) for mailman id 1366751;
 Mon, 20 Jul 2026 15:50:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcus.granado@citrix.com>) id 1wlqFn-0007wl-AA
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 15:50:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqFm-00GJmC-Mk
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 17:50:02 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a5e438b-5cb7-0a2a0a5109dd-0a2a450387ba-28
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:50:02 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcus.granado@citrix.com>)
 id 6a5e43a9-fae8-0a2a45030019-a0658309c936-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 17:50:02 +0200
Received: from mewpvdipd1023.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTPS id AE55F8291CA3;
 Mon, 20 Jul 2026 11:48:20 -0400 (EDT)
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
From: Marcus Granado <marcus.granado@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <freddy77@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Marcus Granado <marcus.granado@citrix.com>
Subject: [PATCH v1 5/6] tools/libs/guest: opt in to LZ4 save-side compression via XCFLAGS_COMPRESS_LZ4
Date: Mon, 20 Jul 2026 16:48:30 +0100
Message-ID: <20260720154832.1907401-6-marcus.granado@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720154832.1907401-1-marcus.granado@citrix.com>
References: <20260720154832.1907401-1-marcus.granado@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1784562602-6F6C64E9-6E97009F/0/0
X-purgate-type: clean
X-purgate-size: 1914

This patch introduces a new public flag XCFLAGS_COMPRESS_LZ4 (bit 2) that
can be used to enable the LZ4 migration compression. xc_domain_save() now
starts with ctx.compression = XC_SR_COMPRESS_NONE and only switches to
XC_SR_COMPRESS_LZ4 when the caller sets the flag.

When this flag is clear, libxenguest emits the legacy REC_TYPE_PAGE_DATA
records just as it did before this series.

Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
---
 tools/include/xenguest.h      |  5 +++--
 tools/libs/guest/xg_sr_save.c | 11 +++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 2a277cb7cd..332c95f45b 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -24,8 +24,9 @@
 
 #define XC_NUMA_NO_NODE   (~0U)
 
-#define XCFLAGS_LIVE      (1 << 0)
-#define XCFLAGS_DEBUG     (1 << 1)
+#define XCFLAGS_LIVE         (1 << 0)
+#define XCFLAGS_DEBUG        (1 << 1)
+#define XCFLAGS_COMPRESS_LZ4 (1 << 2) /* Compress PAGE_DATA with LZ4 on save */
 
 #define X86_64_B_SIZE   64 
 #define X86_32_B_SIZE   32
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index dbbcddf6fd..6eae9894d3 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -1317,6 +1317,17 @@ int xc_domain_save(xc_interface *xch, int io_fd, uint32_t dom,
     bool hvm;
 
     ctx.compression = XC_SR_COMPRESS_NONE;
+    if ( flags & XCFLAGS_COMPRESS_LZ4 )
+    {
+#ifdef HAVE_LZ4
+        ctx.compression = XC_SR_COMPRESS_LZ4;
+#else
+        ERROR("XCFLAGS_COMPRESS_LZ4 requested but libxenguest was built "
+              "without liblz4 support");
+        errno = EOPNOTSUPP;
+        return -1;
+#endif
+    }
 
     /* GCC 4.4 (of CentOS 6.x vintage) can' t initialise anonymous unions. */
     ctx.save.callbacks = callbacks;
-- 
2.43.0


