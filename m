Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19FC606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 23:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=m5v61Kqk
Received: from list by lists.xenproject.org with outflank-mailman.1470713.1679336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONnk-0002yh-2a; Tue, 03 Nov 2026 23:20:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470713.1679336; Tue, 03 Nov 2026 23:20:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONnj-0002ya-Vz; Tue, 03 Nov 2026 23:20:23 +0000
Received: by outflank-mailman (input) for mailman id 1470713;
 Tue, 03 Nov 2026 23:20:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xONni-0002wo-Qw
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:20:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONni-0000000CofN-1h5Q;
 Tue, 03 Nov 2026 23:20:22 +0000
Received: from [2607:fb91:4c8c:bd3f:1da5:e92a:c5fb:865a]
 (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONnh-0000000EMFa-2DVQ;
 Tue, 03 Nov 2026 23:20:22 +0000
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
	bh=3VJN5UNE9/z4qrpuleJ1/OW1QHRZAWYrv6m65EedvqM=; b=m5v61KqkHzWattc6yApMmTdIUu
	6NeSqowudPi3AnVvZ/xY6Cq+vSWsWY3OVoHpwiDFPoCAz3uYlaIhjFAI/Sx70UK4rnowrxH+0GIRm
	Zg3t6wdFp7T8ZmxHat404orQL+sxFkYrULxgRBRRXPzBz+pN7DmgU2d7tK3FzglXW6hA=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v6 03/44] x86/mm: prepare destroy_perdomain_mapping() for per-vCPU perdomain areas
Date: Tue,  3 Nov 2026 17:13:25 -0500
Message-ID: <20261103-asi-hvm-v6-3-59dbc5ce9615@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
References: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
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

From: Roger Pau Monné <roger.pau@citrix.com>

We want to change per-domain mappings to be per-vCPU mappings.  In
preparation for that, we want to arrange that
destroy_perdomain_mapping() work either with a single perdomain area,
or with a per-vCPU perdomain area.

The one remaining caller, free_compat_arg_xlat(), is already in a vCPU
context, so we just need to change the parameter from a domain pointer
to a vCPU pointer.

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
Reviewed-by: Roger Pau Monné <roger@xenproject.org>
---
Changes in v4:
- Say "No functional change." (Roger).

Changes in v3:
- Rebased onto staging without the GDT/LDT conversions (for the
  HVM-only series): free_compat_arg_xlat() is the only caller left.
- Drop the linear-page-table fast path altogether (Jan): its only user
  would have been guest-driven LDT teardown, and without it the
  function does not depend on the linear mapping being available.

Changes in v2:
- Added to the series

Changes since the previously posted version:
- The fast path is gone (v3), and with it the previously posted
  version's sync_local_execstate() call.
- Reword and retitle for clarity (was: "x86/mm: switch
  destroy_perdomain_mapping() parameter from domain to vCPU").
---
 xen/arch/x86/include/asm/mm.h | 2 +-
 xen/arch/x86/mm.c             | 3 ++-
 xen/arch/x86/x86_64/mm.c      | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index e77ac5ccdf..1cdd30f7e2 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -610,7 +610,7 @@ struct page_info *allocate_perdomain_l3(struct domain *d);
 int create_perdomain_mapping(struct domain *d, unsigned long va,
                              unsigned int nr, l1_pgentry_t **pl1tab,
                              struct page_info **ppg);
-void destroy_perdomain_mapping(struct domain *d, unsigned long va,
+void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr);
 void free_perdomain_mappings(struct domain *d);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 63e6aadcda..c784c4f726 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6356,10 +6356,11 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
     return rc;
 }
 
-void destroy_perdomain_mapping(struct domain *d, unsigned long va,
+void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr)
 {
     const l3_pgentry_t *l3tab, *pl3e;
+    const struct domain *d = v->domain;
 
     ASSERT(va >= PERDOMAIN_VIRT_START &&
            va < PERDOMAIN_VIRT_SLOT(PERDOMAIN_SLOTS));
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 8eadab7933..f467ed426b 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -739,7 +739,7 @@ int setup_compat_arg_xlat(struct vcpu *v)
 
 void free_compat_arg_xlat(struct vcpu *v)
 {
-    destroy_perdomain_mapping(v->domain, ARG_XLAT_START(v),
+    destroy_perdomain_mapping(v, ARG_XLAT_START(v),
                               PFN_UP(COMPAT_ARG_XLAT_SIZE));
 }
 
-- 
2.56.0


