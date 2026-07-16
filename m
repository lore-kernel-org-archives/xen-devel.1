Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71951C44515
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 18:23:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364361.1615615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkQk2-0001zm-Ig; Thu, 16 Jul 2026 18:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364361.1615615; Thu, 16 Jul 2026 18:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkQk2-0001y9-DH; Thu, 16 Jul 2026 18:23:26 +0000
Received: by outflank-mailman (input) for mailman id 1364361;
 Thu, 16 Jul 2026 17:09:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kariyam@oss.nttdata.com>) id 1wkPaT-00017v-Fx
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 17:09:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkPaS-000QF3-Jn
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 19:09:28 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kariyam@oss.nttdata.com>)
 id 6a591023-e002-0a2a0a5209dd-0a2a450988a6-32
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 19:09:27 +0200
Received: from [49.212.34.109] (helo=oss.nttdata.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kariyam@oss.nttdata.com>)
 id 6a591045-be1a-0a2a45090019-31d4226db678-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 19:09:27 +0200
Received: by oss.nttdata.com (Postfix, from userid 1024)
 id 3B36E2020241; Fri, 17 Jul 2026 02:09:24 +0900 (JST)
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
Subject: [PATCH 2/4] xen-block: Fix inverted error check in xen_cdrom_realize()
Date: Fri, 17 Jul 2026 02:09:21 +0900
Message-ID: <20260716170923.2125858-3-Mitsuru.Kariya@oss.nttdata.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716170923.2125858-1-Mitsuru.Kariya@oss.nttdata.com>
References: <20260716170923.2125858-1-Mitsuru.Kariya@oss.nttdata.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 1.4.3 at oss.nttdata.com
X-Virus-Status: Clean
X-purgate-ID: tlsNG-bad1c0/1784221767-39AC0034-E687D95C/0/0
X-purgate-type: clean
X-purgate-size: 1445

xen_cdrom_realize() checks the return value of blk_attach_dev() with

    if (!rc) {
        error_setg_errno(errp, -rc, "failed to create drive");
        return;
    }

but blk_attach_dev() returns 0 on success and a negative errno on
failure.  The condition is inverted: a successful attach (rc == 0) is
reported as an error and fails realize, while a real failure (rc < 0)
is silently ignored.

Here blk_attach_dev() is called on a BlockBackend just created by
blk_new(), so blk->dev is NULL and its only failure path (-EBUSY)
cannot be taken.  Replace the bogus check with an assertion, matching
the other empty-drive realize paths (scsi-disk, ide, fdc, swim).

Signed-off-by: Mitsuru Kariya <Mitsuru.Kariya@oss.nttdata.com>
---
 hw/block/xen-block.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 474c12fe4a..abf9df2eee 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -762,10 +762,7 @@ static void xen_cdrom_realize(XenBlockDevice *blockdev, Error **errp)
         conf->blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
 
         rc = blk_attach_dev(conf->blk, DEVICE(blockdev));
-        if (!rc) {
-            error_setg_errno(errp, -rc, "failed to create drive");
-            return;
-        }
+        assert(rc == 0);
     }
 
     blockdev->info = VDISK_READONLY | VDISK_CDROM;
-- 
2.43.0


