Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE84C606A32A
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=Y4NP1kVl
Received: from list by lists.xenproject.org with outflank-mailman.1497109.1695385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i0-0001Gc-W3; Thu, 19 Nov 2026 21:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497109.1695385; Thu, 19 Nov 2026 21:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9i0-0001G7-QA; Thu, 19 Nov 2026 21:30:20 +0000
Received: by outflank-mailman (input) for mailman id 1497109;
 Thu, 19 Nov 2026 21:30:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hy-0001Bi-UJ
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hy-00000006tGF-2CXp;
 Thu, 19 Nov 2026 21:30:18 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9Me-0000000CVBH-3wqb;
 Thu, 19 Nov 2026 21:08:17 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=m2oN67Q6MdMj+BGnNG7mV2Sbn0XOpbnC48m8q6ubOXU=; b=Y4NP1kVlnCJNPXE9dI/pO8c/k2
	KFrKMtEnWBTooxzND43CXuyewS7/MrJIrX55OfKoUP9qQp0SYijAakHl+jyBGGu6qbZIUwNhJP8PI
	EtUSWldVLgSsdGnF/XPzjhuIYgN5KCJLwQW+Aw9h7U4LRaS8XzHW6L5FKUWVFpJS0ba8=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 29/50] x86/domain_page: don't unmap a mapcache entry that is not present
Date: Thu, 19 Nov 2026 21:07:20 +0000
Message-ID: <20261119-asi-hvm-v7-29-6551b6d5c879@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
References: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Mappings must be torn down by the vCPU that created them, and only
once.  Have unmap_domain_page() check that the entry it is handed is
present and bail out otherwise (ASSERT_UNREACHABLE()), rather than read
an MFN out of an empty PTE and act on it, as a second unmap of an entry
the first one zapped would.  (A second unmap of an entry the maphash
kept is caught, as before, only by the refcount ASSERT() in debug
builds.)

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
Reviewed-by: Roger Pau Monné <roger@xenproject.org>
---
Changes in v4:
- Reword the comment on the new check (Roger).

Changes in v3:
- New in this version, split out of "x86/hvm: introduce per-vCPU
  mapcache for vCPU-PT domains" for review.
---
 xen/arch/x86/domain_page.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 2ade2f9fd0..1cce58a466 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -237,6 +237,15 @@ void unmap_domain_page(const void *ptr)
     ASSERT(cache->inuse);
 
     idx = PFN_DOWN(va - MAPCACHE_VIRT_START);
+    /*
+     * Sanity check: an entry that isn't present means a double or stray
+     * unmap.  Play it safe: don't act on the MFN in an empty PTE.
+     */
+    if ( !(l1e_get_flags(MAPCACHE_L1ENT(idx)) & _PAGE_PRESENT) )
+    {
+        ASSERT_UNREACHABLE();
+        return;
+    }
     mfn = l1e_get_pfn(MAPCACHE_L1ENT(idx));
     hashent = &v->arch.mapcache.hash[MAPHASH_HASHFN(mfn)];
 
-- 
2.56.0


