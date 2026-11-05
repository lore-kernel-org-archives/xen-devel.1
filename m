Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48478606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 00:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=edera.dev header.i=@edera.dev header.a=rsa-sha256 header.s=google header.b=H89zCo+P
Received: from list by lists.xenproject.org with outflank-mailman.1473030.1680739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOl2A-0008NO-RB; Thu, 05 Nov 2026 00:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1473030.1680739; Thu, 05 Nov 2026 00:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOl2A-0008NH-Nl; Thu, 05 Nov 2026 00:08:50 +0000
Received: by outflank-mailman (input) for mailman id 1473030;
 Thu, 05 Nov 2026 00:07:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kavi@edera.dev>) id 1xOl0p-0008Gs-8X
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 00:07:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOl0o-00DrPP-Ll
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 01:07:26 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kavi@edera.dev>)
 id 6aebc852-bab6-0a2a0a5309dd-0a2a4502ce68-44
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:07:26 +0100
Received: from [209.85.160.177] (helo=mail-qt1-f177.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kavi@edera.dev>)
 id 6aebc8bd-6ca4-0a2a45020019-d155a0b1b575-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 01:07:26 +0100
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-5495d549924so12467761cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 16:07:26 -0800 (PST)
Received: from localhost.localdomain
 ([2600:4040:2e7a:3100:d9e8:a7bf:8c30:7336])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91e7dfdfb5fsm32786346d6.16.2026.11.04.16.07.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Nov 2026 16:07:24 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=edera.dev header.i="@edera.dev" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edera.dev; s=google; t=1793837245; x=1794442045; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XCpW/b5tui0bRd/i8QmB/FeEdN2UMNiMD2TH2Q2ymh4=;
        b=H89zCo+PfIWoSpchAgRgJFHbP/kNUIT9wTFwmS9sIrP3+T7OVJ4DnYkMDPQskkzzFW
         yUIcgtQatpKmrYAtqfTZJJrf/JLmzY6uwnxD6Il+kfnoZzELmH5u/2n4t/jYfqbGgqnT
         g6W3e1Hl/GZhgFMOrcQLFOArF0qN9xWv+8lTriH6to3hCOoZ8ES1eMgp7W6mQTCRmJaV
         ocnc6HJCi1Pqxro+7lv11TXDVaduu88sfaa6mTPSy8lgUbdipLZBpX9fBEcyHfFuXQiC
         pClcdUtRUApvYLTmJfc0eNYNjSWX6uVjK6ZtBqCaA7MH+0G242a8Qb+l834ExrH2xLDk
         WZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837245; x=1794442045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XCpW/b5tui0bRd/i8QmB/FeEdN2UMNiMD2TH2Q2ymh4=;
        b=ygl14wSrPN4MjPButU0AtYlgi+0ZxIf4oBn8i/yMDYjidt2Ne2t+Anmk4xP7F4/eII
         ROVpUQZGLVfH/BUXNJqh4tD+wefpQNAZFqv+c2U8xMiY6Bf4eKIknVw95wm5hW5Hyl0w
         Ue1/2Z11XGBs51u5rALnNUR0jCnbAoC/FGNydDW7fRQk85m4Ei5NqWZNj5YkYjoHZejx
         TedbFda5G0XBmp2tsvdihK9iC7SdaVipeqkyvMl1T/ku+gNZLx1hsZ7unUWMUp6VXpAb
         iKjxjYbQIhagfI5h2FApAAOpfk6SFfBalKqSbvnarVvlNn0+dnsnGGQrgmBepcxm+2Cd
         Rsfg==
X-Forwarded-Encrypted: i=1; AKwUvBxOfhDzEIZvd6llTLAqWq8fZYHlFcuoo99s0xlGyAOxVpvN9gG2IcB4fc5/WspU+vgrJxB2zMX96mI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+qC2sR7pPqdDiI+tebJIX4PCeMBRlEjG3cAUT8nHKnkMf859XT
	oENYRHWOEvVDEObcmq7qv5C99i/YOa4k0LHhTnJ8mLJZNsyJIIl95RoaISyRMtNIhi8=
X-Gm-Gg: AYBFou0tFtk+HEnRULX47T9jO7DImF63ozhu8Sh655dKFqddAlRSROoj83yMlWtD/6X
	U8x9PdYqG2eOID4CAitatN/dB1+g4h5uho+qhmJpK6cntEQb9yleWq2RDimHu45Ld+yI1fiORyO
	vtCJq5dKA2L9o8ZYdBPjMEx+T7ajFCZ9XHfX9hwXN14akdCFaMA/EIlKdlE910O8ofMfMalCW1O
	oTyZz782tNiMCtFUL01hd16SbZLwrUI7tOFt719hpuTsNXcFIvnwH54DZVJxuXROEcWzTv8BxcX
	pAYHHyEy7vcFj32/TLmS0b4is/Tqzqz5+Lm8Q/IUoRfBj5FpzresoWxz/JVCx6yM7AlhO/xSwTg
	rDwIG7L5wgBNsjMp+GXWTLevSwqEjeKN7pPB40KLb7VZlUrXRWhNaKFinygcCAlwnjkFfm/TNaj
	mwXDnYz6oEbrZeJcaoh0oYION5A3W0D9Y/8/s+ApLvMgwcKT4/vgrMJ1BN03EmE1rv7adXhq7Yz
	EYXiJ4ZkA+n+HBz2hvikMUYdzJzeulpQ+alIe+tvfVhDhq9MGiNPBJyviNh5CvpATQaWrgmaPWa
	yzU0tUeq9Jac4GVKevDM56+KfWpUORwAXHIKJt3451BbjD/hCCCjMsgmbpqUJIIjKufzMxA5gnf
	26upmy2YM
X-Received: by 2002:a05:622a:1f90:b0:535:80b:9911 with SMTP id d75a77b69052e-542b658d18amr268931571cf.24.1793837244780;
        Wed, 04 Nov 2026 16:07:24 -0800 (PST)
From: Kavitha Daula <kavi@edera.dev>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Kavitha Daula <kavi@edera.dev>
Subject: [PATCH] xen/grant-table: annotate on-stack work in gnttab_unmap_refs_sync()
Date: Wed,  4 Nov 2026 19:07:16 -0500
Message-ID: <20261105000716.83314-1-kavi@edera.dev>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1793837246-311CF2AC-4E303F2C/0/0
X-purgate-type: clean
X-purgate-size: 2911
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


