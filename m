Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1917F606A32F
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 23:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=PFdYYBSl
Received: from list by lists.xenproject.org with outflank-mailman.1470813.1679600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONy7-0006iZ-K5; Tue, 03 Nov 2026 23:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470813.1679600; Tue, 03 Nov 2026 23:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONy5-0006ZJ-Ls; Tue, 03 Nov 2026 23:31:05 +0000
Received: by outflank-mailman (input) for mailman id 1470813;
 Tue, 03 Nov 2026 23:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xONxc-0000e7-Iz
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONxc-0000000CowF-2ALZ;
 Tue, 03 Nov 2026 23:30:36 +0000
Received: from [2607:fb91:4c8c:bd3f:1da5:e92a:c5fb:865a]
 (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONoB-0000000EMFa-2YLH;
 Tue, 03 Nov 2026 23:20:51 +0000
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
	bh=tI8rWUCKpztUW6i1B6fFTfydag4KVKVQaRj7AWM+f08=; b=PFdYYBSlPazogd+zDW6QBUkiY7
	krXZyDtMh2h+WOSWP1a1EFPa1w38RNzW0hp5gW/O75U0cR9bV8/udKImyscxFr7oztXsToMuO2UoV
	ew3BI2Iu2sVSETl1QmuahdOYfFPWIyUpRz8gvT72MKaMsaUUy1KdmPD73w8akAQp/gCs=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v6 37/44] x86/hvm: use map_domain_pages() for multi-frame emulated accesses
Date: Tue,  3 Nov 2026 17:13:59 -0500
Message-ID: <20261103-asi-hvm-v6-37-59dbc5ce9615@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
References: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hvmemul_map_linear_addr() picks its mapping method purely on the frame
count: one frame goes through map_domain_page(), more through vmap() --
mapping the guest data in every context for the duration, those of
domains on the sparse directmap view included, whatever the guest's own
configuration.  map_domain_pages() maps them only in the page tables of
the guest's own domain; use it for the multi-frame case.

The NULL return handling is unchanged: the primitive can fail only for
want of a free slot, and the access then bails out as unhandleable
exactly as before.

This is one of the two in-tree consumers of the primitive.  Other
long-lived global mappings of guest pages (the ioreq server pages among
them) remain in the vmap area.

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- New in this version.
---
 xen/arch/x86/hvm/emulate.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index da7c08b5d9..7e7beccb93 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -735,7 +735,8 @@ static void *hvmemul_map_linear_addr(
 
     /*
      * The maximum access size depends on the number of adjacent mfns[] which
-     * can be vmap()'d, accouting for possible misalignment within the region.
+     * can be mapped together, accounting for possible misalignment within
+     * the region.
      * The higher level emulation callers are responsible for ensuring that
      * mfns[] is large enough for the requested access size.
      */
@@ -824,9 +825,9 @@ static void *hvmemul_map_linear_addr(
     /* Entire access within a single frame? */
     if ( nr_frames == 1 )
         mapping = map_domain_page(hvmemul_ctxt->mfn[0]);
-    /* Multiple frames? Need to vmap(). */
-    else if ( (mapping = vmap(hvmemul_ctxt->mfn,
-                              nr_frames)) == NULL )
+    /* Multiple frames? Need a multi-page mapping. */
+    else if ( (mapping = map_domain_pages(hvmemul_ctxt->mfn,
+                                          nr_frames)) == NULL )
         goto unhandleable;
 
 #ifndef NDEBUG /* Poision unused mfn[]s with INVALID_MFN. */
@@ -867,7 +868,7 @@ static void hvmemul_unmap_linear_addr(
     if ( nr_frames == 1 )
         unmap_domain_page(mapping);
     else
-        vunmap(mapping);
+        unmap_domain_pages(mapping, nr_frames);
 
     for ( i = 0; i < nr_frames; i++ )
     {
-- 
2.56.0


