Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A08FCA5FFF
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 11:00:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442173.1659738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPNs-00066A-2s; Wed, 07 Oct 2026 11:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442173.1659738; Wed, 07 Oct 2026 11:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEPNr-00065V-Uh; Wed, 07 Oct 2026 11:00:27 +0000
Received: by outflank-mailman (input) for mailman id 1442173;
 Wed, 07 Oct 2026 11:00:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEPNq-0005y8-EQ
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 11:00:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEPNq-001bwG-0K;
 Wed, 07 Oct 2026 11:00:26 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP5B-001QnT-2O;
 Wed, 07 Oct 2026 10:41:09 +0000
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=P7gSAZkpbEQZ016S+qOjogD467NTdt8ZgNSKB5Dcc3E=; b=UqZuNYEs3z/YdvEmir5hdRchl0
	OrJXg/t8GcPNmh29depEDwhjTJa6JvMiKv/+nUQ6V4c3KV6dLZL8BeiHlqN6HyTFMZ68UkFI11pdt
	NZKTC5q+G0NtJgF4uGnNudhuW+nL27/TeaXhawt7fTju1LvjlQFXk3aHnKI1Yd3q428Y=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 10/18] x86/domain_page: don't unmap a mapcache entry that is not present
Date: Wed,  7 Oct 2026 11:40:43 +0100
Message-ID: <20261007104051.48841-11-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007104051.48841-1-gwd@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mappings must be torn down by the vCPU that created them, and only
once.  Have unmap_domain_page() check that the entry it is handed is
present and bail out otherwise (ASSERT_UNREACHABLE()), rather than read
an MFN out of an empty PTE and act on it, as a second unmap of an entry
the first one zapped would.  (A second unmap of an entry the maphash
kept is caught, as before, only by the refcount ASSERT() in debug
builds.)

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v3:
- New in this version, split out of "x86/hvm: introduce per-vCPU
  mapcache for vCPU-PT domains" for review.
---
 xen/arch/x86/domain_page.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index f91ec8a75a..708df90a00 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -230,6 +230,16 @@ void unmap_domain_page(const void *ptr)
     ASSERT(cache->inuse);
 
     idx = PFN_DOWN(va - MAPCACHE_VIRT_START);
+    /*
+     * Mappings must be unmapped once, by the vCPU that created them.  With
+     * nothing present there is nothing to tear down: leave the hash and the
+     * bitmaps alone rather than act on a stale or foreign pointer.
+     */
+    if ( !(l1e_get_flags(MAPCACHE_L1ENT(idx)) & _PAGE_PRESENT) )
+    {
+        ASSERT_UNREACHABLE();
+        return;
+    }
     mfn = l1e_get_pfn(MAPCACHE_L1ENT(idx));
     hashent = &v->arch.mapcache.hash[MAPHASH_HASHFN(mfn)];
 
-- 
2.55.0


