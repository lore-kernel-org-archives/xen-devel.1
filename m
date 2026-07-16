Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644FEC44512
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 18:23:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364360.1615612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkQk2-0001xo-CE; Thu, 16 Jul 2026 18:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364360.1615612; Thu, 16 Jul 2026 18:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkQk2-0001xe-6k; Thu, 16 Jul 2026 18:23:26 +0000
Received: by outflank-mailman (input) for mailman id 1364360;
 Thu, 16 Jul 2026 17:09:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kariyam@oss.nttdata.com>) id 1wkPaT-00017u-Fx
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 17:09:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkPaS-00HRef-Ej
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 19:09:28 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kariyam@oss.nttdata.com>)
 id 6a59100d-5cb7-0a2a0a5109dd-0a2a450cdbb6-34
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 19:09:27 +0200
Received: from [49.212.34.109] (helo=oss.nttdata.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kariyam@oss.nttdata.com>)
 id 6a591045-f479-0a2a450c0019-31d4226dac80-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 19:09:27 +0200
Received: by oss.nttdata.com (Postfix, from userid 1024)
 id 5766E2020242; Fri, 17 Jul 2026 02:09:24 +0900 (JST)
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
From: Mitsuru Kariya <Mitsuru.Kariya@oss.nttdata.com>
To: qemu-devel@nongnu.org
Cc: Mitsuru Kariya <Mitsuru.Kariya@oss.nttdata.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs),
	qemu-block@nongnu.org (open list:Block layer core)
Subject: [PATCH 3/4] xen-block: Fix BlockBackend leak on unplug of empty CD-ROM
Date: Fri, 17 Jul 2026 02:09:22 +0900
Message-ID: <20260716170923.2125858-4-Mitsuru.Kariya@oss.nttdata.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716170923.2125858-1-Mitsuru.Kariya@oss.nttdata.com>
References: <20260716170923.2125858-1-Mitsuru.Kariya@oss.nttdata.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 1.4.3 at oss.nttdata.com
X-Virus-Status: Clean
X-purgate-ID: tlsNG-d25034/1784221767-50321A5B-84A236A2/0/0
X-purgate-type: clean
X-purgate-size: 1341

When a Xen CD-ROM is created without a backing drive (an empty CD-ROM),
xen_cdrom_realize() allocates an anonymous BlockBackend for the empty
drive with blk_new() and attaches it to the device using
blk_attach_dev().

blk_new() returns the backend with refcnt == 1 (the creation reference
owned by the caller) and blk_attach_dev() takes an additional reference
for the device.  The creation reference was never released, so on
unplug blk_detach_dev() only drops the device's reference and the
BlockBackend is leaked.

Release the creation reference with blk_unref() right after
blk_attach_dev(), matching the idiom already used in set_drive_helper()
in hw/core/qdev-properties-system.c ("If we need to keep a reference,
blk_attach_dev() took it").

Signed-off-by: Mitsuru Kariya <Mitsuru.Kariya@oss.nttdata.com>
---
 hw/block/xen-block.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index abf9df2eee..e5e14e47ee 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -763,6 +763,7 @@ static void xen_cdrom_realize(XenBlockDevice *blockdev, Error **errp)
 
         rc = blk_attach_dev(conf->blk, DEVICE(blockdev));
         assert(rc == 0);
+        blk_unref(conf->blk);
     }
 
     blockdev->info = VDISK_READONLY | VDISK_CDROM;
-- 
2.43.0


