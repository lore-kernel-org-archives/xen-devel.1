Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C019C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 14:05:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413153.1643401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4IvG-0004wh-Hm; Wed, 09 Sep 2026 14:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413153.1643401; Wed, 09 Sep 2026 14:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4IvG-0004wa-ED; Wed, 09 Sep 2026 14:05:10 +0000
Received: by outflank-mailman (input) for mailman id 1413153;
 Wed, 09 Sep 2026 14:05:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x4IvF-0004w5-8N
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:05:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4IvD-006T2L-1e;
 Wed, 09 Sep 2026 14:05:07 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4IvD-009AfJ-0Q;
 Wed, 09 Sep 2026 14:05:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From;
	bh=mSzuR5Ka/pPapr0FJwRJ5lPhaQWm8jB/vfBAH3X6m10=; b=ihbnoxw9Ktw/YprWK12X9Ke+75
	tLY9HfBhd+tiisDs/3wpDxCyL12GpISN8dJAgd0KumEGu8Tkd2EAyHpqU8d8/Jb4Uw9uLVfDKFX6Q
	snJ7Eq8P/0SfwZhBn9CRaORlwzNETVFrlR0JgVs9+uJLD7P4+dcuRLyFZPMweWvEYgjo=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] x86/mm: limit deferred TLB flushing to PV domain support
Date: Wed,  9 Sep 2026 16:05:00 +0200
Message-ID: <20260909140500.73483-1-roger@xenproject.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic on x86 will mark all domain owned pages as needing a TLB
flush before being re-used.  However such TLB flushing is only strictly
needed when the pages might have been mapped by a PV domain, as those can
keep a reference to the page in the TLB after it has been freed.

Limit the flushing to builds with PV domain support, as tracking whether a
page might have been mapped by a PV domain is not trivial (and possibly not
worth the extra logic).

Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
Changes since v1:
 - Only avoid the flush if there's no PV domain support.
 - Fix comment.
---
 xen/common/page_alloc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 62ac89b824de..cbb2af7f64ce 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1538,8 +1538,11 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
         BUG();
     }
 
-    /* If a page has no owner it will need no safety TLB flush. */
-    pg->u.free.need_tlbflush = (page_get_owner(pg) != NULL);
+    /*
+     * If a page has no owner and there's no PV domain support it will need no
+     * safety TLB flush, there can be no stale TLB entries.
+     */
+    pg->u.free.need_tlbflush = IS_ENABLED(CONFIG_PV) && page_get_owner(pg);
     if ( pg->u.free.need_tlbflush )
         page_set_tlbflush_timestamp(pg);
 
-- 
2.55.0


