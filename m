Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88393606A336
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 00:09:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1473016.1680748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOl2U-0000DT-1m; Thu, 05 Nov 2026 00:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473016.1680748; Thu, 05 Nov 2026 00:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOl2T-0000DM-VF; Thu, 05 Nov 2026 00:09:09 +0000
Received: by outflank-mailman (input) for mailman id 1473016;
 Thu, 05 Nov 2026 00:01:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kavithadaula@kavithas-macbook-pro.local>)
 id 1xOkvU-0008B1-Gd
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 00:01:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOkvT-00FtPN-F6
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:01:55 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kavithadaula@kavithas-macbook-pro.local>)
 id 6aebc762-2eae-0a2a0a5409dd-0a2a450c9428-10
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:01:55 +0100
Received: from [72.66.120.178] (helo=Kavithas-MacBook-Pro.local)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <kavithadaula@kavithas-macbook-pro.local>)
 id 6aebc772-f479-0a2a450c0019-484278b2cd41-1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:01:55 +0100
Received: by Kavithas-MacBook-Pro.local (Postfix, from userid 501)
 id 4A07A1A585A2; Wed,  4 Nov 2026 19:01:54 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Kavitha Daula <kavithadaula@Kavithas-MacBook-Pro.local>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Kavitha Daula <kavi@edera.dev>
Subject: [PATCH] xen/grant-table: annotate on-stack work in gnttab_unmap_refs_sync()
Date: Wed,  4 Nov 2026 19:01:37 -0500
Message-ID: <20261105000137.82224-1-kavithadaula@Kavithas-MacBook-Pro.local>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1793836915-51737A5B-C19AC4A2/0/0
X-purgate-type: clean
X-purgate-size: 2951
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_ADSP_NXDOMAIN,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Kavitha Daula <kavi@edera.dev>

Both callers of gnttab_unmap_refs_sync(), free_persistent_gnts() and
xen_blkbk_unmap_purged_grants() in blkback, keep their struct
gntab_unmap_queue_data on the stack. gnttab_unmap_refs_async() sets up
the delayed work inside it with INIT_DELAYED_WORK(), so with
CONFIG_DEBUG_OBJECTS_WORK and CONFIG_DEBUG_OBJECTS_TIMERS every
persistent grant teardown warns twice, once for the work and once for
its timer:

  [  104.366085] ODEBUG: object ffffc9004020fad8 is on stack ffffc9004020c000, but NOT annotated.
  [  104.371551] WARNING: CPU: 1 PID: 48 at lib/debugobjects.c:672 lookup_object_or_alloc.part.0+0x12b/0x1f0
  Call Trace:
   <TASK>
   __debug_object_init+0xfe/0x1a0
   debug_object_init+0x38/0x50
   __init_work+0x28/0x30
   gnttab_unmap_refs_async+0x18/0xa0
   gnttab_unmap_refs_sync+0x61/0x90
   free_persistent_gnts+0x179/0x280
   xen_blkbk_free_caches+0x16/0x30
   xen_blkif_disconnect+0xfa/0x2d0
   frontend_changed+0x90/0x680
   xenbus_otherend_changed+0x80/0xb0
   frontend_changed+0x14/0x20
   xenwatch_thread+0x96/0x1a0
   kthread+0x11d/0x250
   ret_from_fork+0x29f/0x2d0
   ret_from_fork_asm+0x1a/0x30
   </TASK>

gnttab_unmap_refs_sync() waits for the unmap to complete before it
returns, so the work never outlives the caller's frame. Initialise it
with INIT_DELAYED_WORK_ONSTACK() when the item is on the stack and
destroy it before returning. The function is exported, so an item that
is not on the stack keeps INIT_DELAYED_WORK().

Fixes: b44166cd46e2 ("xen/grant: introduce func gnttab_unmap_refs_sync()")
Signed-off-by: Kavitha Daula <kavi@edera.dev>
---
 drivers/xen/grant-table.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index f75b5cc..5a85908 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -38,6 +38,7 @@
 #include <linux/sched.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <linux/sched/task_stack.h>
 #include <linux/vmalloc.h>
 #include <linux/uaccess.h>
 #include <linux/io.h>
@@ -1360,12 +1361,21 @@ static void unmap_refs_callback(int result,
 int gnttab_unmap_refs_sync(struct gntab_unmap_queue_data *item)
 {
 	struct unmap_refs_callback_data data;
+	bool on_stack = object_is_on_stack(item);
 
 	init_completion(&data.completion);
 	item->data = &data;
 	item->done = &unmap_refs_callback;
-	gnttab_unmap_refs_async(item);
+	/* blkback keeps @item, and so its retry work, on the stack. */
+	if (on_stack)
+		INIT_DELAYED_WORK_ONSTACK(&item->gnttab_work, gnttab_unmap_work);
+	else
+		INIT_DELAYED_WORK(&item->gnttab_work, gnttab_unmap_work);
+	item->age = 0;
+	__gnttab_unmap_refs_async(item);
 	wait_for_completion(&data.completion);
+	if (on_stack)
+		destroy_delayed_work_on_stack(&item->gnttab_work);
 
 	return data.result;
 }
-- 
2.50.1 (Apple Git-155)


