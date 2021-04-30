Return-Path: <SRS0=vACI=J3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E514C433B4
	for <xen-devel@archiver.kernel.org>; Fri, 30 Apr 2021 16:35:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7A5E61420
	for <xen-devel@archiver.kernel.org>; Fri, 30 Apr 2021 16:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7A5E61420
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.120706.228281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcW6b-0006RQ-Vh; Fri, 30 Apr 2021 16:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120706.228281; Fri, 30 Apr 2021 16:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcW6b-0006RJ-Sp; Fri, 30 Apr 2021 16:35:05 +0000
Received: by outflank-mailman (input) for mailman id 120706;
 Fri, 30 Apr 2021 16:35:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BSS5=J3=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lcW6a-0006RE-TL
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 16:35:04 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6688be77-238f-49dc-928e-29cddfd5692e;
 Fri, 30 Apr 2021 16:35:03 +0000 (UTC)
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
X-Inumbo-ID: 6688be77-238f-49dc-928e-29cddfd5692e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619800503;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nuzFdV0QUWkg3W9rmcl5jJaiMd5QRUHMmTZ+jdAfApE=;
  b=EUYzdKNIy+kZlR36Vq6ygqiLGWm8YG/ru4siCkf5kfn9Zo4MGMakowU+
   Mb4L3Tn2UN58LAji2ha6AuyaUxl3T357p/Tv0xHHlKL2515FcqItT5/OQ
   NQEdJcD3w9hE84rpznf+UuFD0KQ/pXosojlFFqgtyNz4hhWWr6Qods5mT
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: igWuJsrqlCI9Of4M0spP8n5YBZ9E8QnoSwW2sgtj2zvUMrgmiA91yOwVrZ/ocIB4lULTxBkzOM
 0rhlKQ/InPzoIOMh8LPld722hKkPOa3kiONqAqoI7IyAb/Gbed2+2IrNINtnXNtZ8woTYad27G
 bIg7uvtl/UggzugCH3G8pGOT63sLSUYvOeb0swKcNkEJU5OyuOrEv4Pf4hQn/gaDDW1Aqzj0hD
 ghO1vPTkGn8lT+LoefDQ5PtNLJ0vWG+xVzSrUB10GxYBdsEfixVe1Rbhbz1ubrcLJSytiWjXag
 tlA=
X-SBRS: 5.1
X-MesageID: 44335315
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EsZLaq+pZ1uLW4KgT/9uk+A8I+orLtY04lQ7vn1ZYzY9SKKlvu
 qpm+kW0gKxtS0YX2sulcvFFK6LR37d8pAd2/h0AZ6JWg76tGy0aLxz9IeK+UyHJwTS/vNQvJ
 0BT4FQE9v1ZGIXse/fwC2VV+kt28OG9qfAv5a6815IQRtxY69tqydVYzzrcXFefwVNCZonGJ
 f03KMuzFDMRV0tYtmmHX5AZuDfprTw5fXbSCQbDB0q4hTmt1KVwYP9eiL24j4uFxdGwbIv6g
 H+4m7E2pk=
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="44335315"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Kevin Wolf
	<kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	<xen-devel@lists.xenproject.org>, <qemu-block@nongnu.org>
Subject: [PATCH] xen-block: Use specific blockdev driver
Date: Fri, 30 Apr 2021 17:34:32 +0100
Message-ID: <20210430163432.468894-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@citrix.com>

... when a xen-block backend instance is created via xenstore.

Following 8d17adf34f50 ("block: remove support for using "file" driver
with block/char devices"), using the "file" blockdev driver for
everything doesn't work anymore, we need to use the "host_device"
driver when the disk image is a block device and "file" driver when it
is a regular file.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/block/xen-block.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 83754a434481..674953f1adee 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -728,6 +728,8 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
     XenBlockDrive *drive = NULL;
     QDict *file_layer;
     QDict *driver_layer;
+    struct stat st;
+    int rc;
 
     if (params) {
         char **v = g_strsplit(params, ":", 2);
@@ -761,7 +763,17 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
     file_layer = qdict_new();
     driver_layer = qdict_new();
 
-    qdict_put_str(file_layer, "driver", "file");
+    rc = stat(filename, &st);
+    if (rc) {
+        error_setg_errno(errp, errno, "Could not stat file '%s'", filename);
+        goto done;
+    }
+    if (S_ISBLK(st.st_mode)) {
+        qdict_put_str(file_layer, "driver", "host_device");
+    } else {
+        qdict_put_str(file_layer, "driver", "file");
+    }
+
     qdict_put_str(file_layer, "filename", filename);
     g_free(filename);
 
-- 
Anthony PERARD


