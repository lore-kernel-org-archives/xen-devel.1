Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281C9606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=XPbhxbKi
Received: from list by lists.xenproject.org with outflank-mailman.1454844.1668447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItS7-0005Tg-8Y; Mon, 19 Oct 2026 19:55:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454844.1668447; Mon, 19 Oct 2026 19:55:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItS6-0005Q6-Rx; Mon, 19 Oct 2026 19:55:22 +0000
Received: by outflank-mailman (input) for mailman id 1454844;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-0003hu-Oa
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:55:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-000000022yI-1FGJ;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGj-00000001FjN-315T;
 Mon, 19 Oct 2026 19:43:37 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=LN8Bez7AsiyQjAHOZqZjhab+Xv6VL8QpdV20hUs5obk=; b=XPbhxbKiTjI9rUYIxjlVR6X38Q
	N7dJH7OMsei63XdjTT2UHl/zCZ6QC7VeeM9YoTWORP9VVidYAySyX7FH0R/3Chm5P6//eVhQbcLoP
	hOg0xa01PX9wX4lZpq2BQXTW51n5jmYtYbw2NXvSZ68P16j9uNdDo9MTrm4LAfa1CVW0=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 21/30] xen/xmalloc: return an emptied region after dropping the pool lock
Date: Mon, 19 Oct 2026 20:42:52 +0100
Message-ID: <20261019-asi-hvm-v4-21-b68b66652266@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a free leaves a whole region of an xmalloc pool empty,
xmem_pool_free() hands the region back through pool->put_mem() with
pool->lock still held.  For the xenheap pool that is
free_xenheap_pages(), which takes the heap lock inside the pool lock
and runs arch_xenheap_pages_free().  On x86 with a sparse directmap
view configured, the latter takes the page out of the view, at the
cost of one to three rounds of TLB-flush IPIs to every CPU, while every
other CPU's sub-page xmalloc() and xfree() waits on the pool lock.

By then the region is on no free list and no longer counted in the
pool, so nothing else can reach it.  Drop the lock first and return the
region afterwards, as xmem_pool_alloc() already does when it calls
pool->get_mem(), and say at both callbacks that they are called without
the pool lock, so that they keep not relying on it.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
 xen/common/xmalloc_tlsf.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
index b43219b4af..caf33f1a04 100644
--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -106,7 +106,10 @@ struct xmem_pool {
     unsigned long used_size;
     unsigned long num_regions;
 
-    /* User provided functions for expanding/shrinking pool */
+    /*
+     * User provided functions for expanding/shrinking pool.  They are
+     * called without the pool lock held, and must not rely on it.
+     */
     xmem_pool_get_memory *get_mem;
     xmem_pool_put_memory *put_mem;
 
@@ -488,17 +491,18 @@ void xmem_pool_free(void *ptr, struct xmem_pool *pool)
 
     if ( (b->prev_hdr == NULL) && ((tmp_b->size & BLOCK_SIZE_MASK) == 0) )
     {
-        pool->put_mem(b);
         pool->num_regions--;
         pool->used_size -= BHDR_OVERHEAD; /* sentinel block header */
-        goto out;
+        spin_unlock(&pool->lock);
+        pool->put_mem(b);
+        return;
     }
 
     INSERT_BLOCK(b, pool, fl, sl);
 
     tmp_b->size |= PREV_FREE;
     tmp_b->prev_hdr = b;
- out:
+
     spin_unlock(&pool->lock);
 }
 
-- 
2.55.0


