Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2DD606A31B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 23:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=2+Go13xg
Received: from list by lists.xenproject.org with outflank-mailman.1470794.1679453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONxg-0001QN-T7; Tue, 03 Nov 2026 23:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470794.1679453; Tue, 03 Nov 2026 23:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONxg-0001P4-Eb; Tue, 03 Nov 2026 23:30:40 +0000
Received: by outflank-mailman (input) for mailman id 1470794;
 Tue, 03 Nov 2026 23:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xONxc-0000cW-09
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONxb-0000000Cot2-1ezN;
 Tue, 03 Nov 2026 23:30:35 +0000
Received: from [2607:fb91:4c8c:bd3f:1da5:e92a:c5fb:865a]
 (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONoB-0000000EMFa-0jBr;
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
	bh=nCu/9nxrMBPoeFP8cJd8ihmMLFkJzdeaGH0E1Itmh5E=; b=2+Go13xgx3rs6kb+85arVkIJfH
	PD27N7CAB47+Zq61Ro1SoMwlN6vQJuWTzGt/jSAF/Oi7uV4myISFSEv6xRhhYpQ/90UpiXzSxV3CB
	kr/U867nGpFzP8EmEPciCwJN1AIX5NQ8qyS3hj2UJJfWTjF8gbe9Sh1QnrORpT2z+tVU=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Tim Deegan <tim@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v6 36/44] x86/shadow: use map_domain_pages() for cross-page emulated writes
Date: Tue,  3 Nov 2026 17:13:58 -0500
Message-ID: <20261103-asi-hvm-v6-36-59dbc5ce9615@xenproject.org>
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

sh_emulate_map_dest() picks its mapping method purely on whether the
write straddles a page boundary: a single page goes through
map_domain_page(), two pages through vmap() -- mapping the destination
in every context for the duration, those of domains on the sparse
directmap view included, whatever the guest's own configuration.
map_domain_pages() maps it only in the page tables of the guest's own
domain; use it for the two-page case.

The NULL return handling is unchanged: the primitive can fail only for
want of a free slot, and the emulation then bails out as unhandleable
exactly as before.

This is one of the two in-tree consumers of the primitive.

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- New in this version.
---
 xen/arch/x86/mm/shadow/hvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/hvm.c b/xen/arch/x86/mm/shadow/hvm.c
index 0b23326214..b1c3d5e637 100644
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -506,7 +506,7 @@ static void *sh_emulate_map_dest(struct vcpu *v, unsigned long vaddr,
         /* Cross-page writes mean probably not a pagetable. */
         sh_remove_shadows(d, sh_ctxt->mfn[1], 0, 0 /* Slow, can fail. */ );
 
-        map = vmap(sh_ctxt->mfn, 2);
+        map = map_domain_pages(sh_ctxt->mfn, 2);
         if ( !map )
         {
             put_page(mfn_to_page(sh_ctxt->mfn[0]));
@@ -670,7 +670,7 @@ static void sh_emulate_unmap_dest(struct vcpu *v, void *addr,
     if ( unlikely(mfn_valid(sh_ctxt->mfn[1])) )
     {
         put_page(mfn_to_page(sh_ctxt->mfn[1]));
-        vunmap((void *)((unsigned long)addr & PAGE_MASK));
+        unmap_domain_pages(addr, 2);
     }
     else
         unmap_domain_page(addr);
-- 
2.56.0


