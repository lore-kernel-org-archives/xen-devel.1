Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C116C79FAA
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 07:25:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412628.1643024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Cg1-0004mY-VI; Wed, 09 Sep 2026 07:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412628.1643024; Wed, 09 Sep 2026 07:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Cg1-0004mR-Rx; Wed, 09 Sep 2026 07:25:01 +0000
Received: by outflank-mailman (input) for mailman id 1412628;
 Wed, 09 Sep 2026 07:24:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1x4Cfz-0004mK-UQ
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 07:24:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4Cfy-006KtE-21;
 Wed, 09 Sep 2026 07:24:58 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <roger@xenproject.org>) id 1x4Cfz-007Wbw-0J;
 Wed, 09 Sep 2026 07:24:58 +0000
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
	bh=3jw4iKButHJPwaMb26bDfnz2RJqz2Vwhjbbd7CxUQaM=; b=MCYOSvEzycmvGW87zaA1Lt2fWF
	Wq3Ry7QlufSuSOU7/JIHoaAqiF+9eNg12bm0AVqczoXX4abFxhlrRStsPFSvL/6q+jdDYvJzhMT4N
	TI+7iUZQO3/03kYKcEkUoJ0AhkvEtW8iVVxwHsZvN2ZQ7nq9dJ2wOtLOLhV+Nxy5grXI=;
From: Roger Pau Monne <roger@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] x86/mm: limit deferred TLB flushing to PV owned pages
Date: Wed,  9 Sep 2026 09:24:51 +0200
Message-ID: <20260909072451.67324-1-roger@xenproject.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current logic on x86 will mark all domain owned pages as needed a TLB
flush before being re-used.  However such TLB flushing is only strictly
needed for PV domain owned pages, as those can keep a reference to the page
in the TLB after it has been freed.

Limit the requirement of a flush to pages that are owned by PV domains.

Signed-off-by: Roger Pau Monné <roger@xenproject.org>
---
 xen/common/page_alloc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 62ac89b824de..be202f0b8d1e 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1501,6 +1501,7 @@ bool scrub_free_pages(void)
 
 static bool mark_page_free(struct page_info *pg, mfn_t mfn)
 {
+    const struct domain *owner = page_get_owner(pg);
     bool pg_offlined = false;
 
     ASSERT(mfn_x(mfn) == mfn_x(page_to_mfn(pg)));
@@ -1539,7 +1540,7 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
     }
 
     /* If a page has no owner it will need no safety TLB flush. */
-    pg->u.free.need_tlbflush = (page_get_owner(pg) != NULL);
+    pg->u.free.need_tlbflush = owner && is_pv_domain(owner);
     if ( pg->u.free.need_tlbflush )
         page_set_tlbflush_timestamp(pg);
 
-- 
2.55.0


