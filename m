Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB589606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=ZmsEhrIA
Received: from list by lists.xenproject.org with outflank-mailman.1454850.1668509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItSJ-0007cy-0i; Mon, 19 Oct 2026 19:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454850.1668509; Mon, 19 Oct 2026 19:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItSH-0007W8-5d; Mon, 19 Oct 2026 19:55:33 +0000
Received: by outflank-mailman (input) for mailman id 1454850;
 Mon, 19 Oct 2026 19:55:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItS4-0004uj-Sc
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:55:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-000000022zs-3hwi;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGX-00000001FjN-2QLd;
 Mon, 19 Oct 2026 19:43:25 +0000
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
	bh=eMzms4kJ3QFpMQV91hrT3uRFSRB8DVNpEMsCuiyn6Aw=; b=ZmsEhrIAG33dUiD+l1lP8dUZ1k
	3oQuYQq/BVvuSK2DZ6UX6oJ7RMQ0bqZo5aPg3SSnZrUuEyiZiIJ1iLCk2wiEBw/tZUvngtN4j517h
	dSVvxwiClkKUTO7hl+/JYXm5pONe6ykfViJIk5CLveNIY+S/zQZ2p3sI3u1M6UJm9+ms=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 10/30] x86/domain_page: drop redundant is_pv_vcpu() checks
Date: Mon, 19 Oct 2026 20:42:41 +0100
Message-ID: <20261019-asi-hvm-v4-10-b68b66652266@xenproject.org>
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

The is_pv_vcpu() checks after mapcache_current_vcpu() never fail: they
have been redundant since 622c9a5ba95d ("x86/mm: accurately track
which vCPU page-tables are loaded") made mapcache_current_vcpu() do
the check itself.  mapcache_current_vcpu() is now guaranteed to return
a PV vCPU with a caching structure (which is what is needed for the
subsequent dcache->inuse check): either a scheduled PV vCPU, or this
CPU's idle vCPU (possibly after finishing a lazy context switch).
Drop the checks; their speculation barriers (evaluate_nospec()) go
too.

mapcache_current_vcpu() returns NULL if this CPU's pgtable_vcpu is not
yet set (early boot) or is not a PV vCPU.  Otherwise it reads
pgtable_vcpu again and returns that.  In between, pgtable_vcpu changes
only when a lazy context switch from a PV vCPU is completed, by
mapcache_current_vcpu() itself (sync_local_execstate()) or first by an
interrupt such as a FLUSH_VCPU_STATE IPI; completing it loads the idle
vCPU's page-tables and sets pgtable_vcpu to the idle vCPU.  No other
writer of pgtable_vcpu runs in an interrupt that returns to the code it
interrupted.  During an EFI runtime call pgtable_vcpu is the idle
vCPU: efi_rs_enter() completes any lazy switch, then loads EFI's
page-tables, which carry the directmap.  So the vCPU returned is either
the PV vCPU checked or this CPU's idle vCPU.

The idle vCPU passes is_pv_vcpu(), as the idle domain is created
without XEN_DOMCTL_CDF_hvm, but its mapcache is never set up:
domain_create() returns for the idle domain before calling
arch_domain_create(), which is what calls mapcache_domain_init().  With
its dcache->inuse NULL, map_domain_page() uses the directmap, and
unmap_domain_page()'s ASSERT() on dcache->inuse still catches a
mapcache address unmapped with no mapcache in use.  In builds without
CONFIG_PV, is_pv_vcpu() is always false and mapcache_current_vcpu()
always returns NULL.

No functional change.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v4:
- New in this version, split out of "x86/domain_page: prepare the
  mapcache for per-vCPU accounting", with a justification of its own.

NB I've included Claude's complete analysis in the commit message.
I've reworded the commit message so that the middle two paragraphs can
be dropped, or reworded more briefly on commit.
---
 xen/arch/x86/domain_page.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index f3e65e2d44..ed68483695 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -74,7 +74,7 @@ void *map_domain_page(mfn_t mfn)
 #endif
 
     v = mapcache_current_vcpu();
-    if ( !v || !is_pv_vcpu(v) )
+    if ( !v )
         return mfn_to_virt(mfn_x(mfn));
 
     dcache = &v->domain->arch.pv.mapcache;
@@ -179,7 +179,7 @@ void unmap_domain_page(const void *ptr)
     ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
 
     v = mapcache_current_vcpu();
-    ASSERT(v && is_pv_vcpu(v));
+    ASSERT(v);
 
     dcache = &v->domain->arch.pv.mapcache;
     ASSERT(dcache->inuse);
-- 
2.55.0


