Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8458ECA5FF1
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 10:41:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442102.1659638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP56-0006LE-4t; Wed, 07 Oct 2026 10:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442102.1659638; Wed, 07 Oct 2026 10:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP56-0006Jd-0O; Wed, 07 Oct 2026 10:41:04 +0000
Received: by outflank-mailman (input) for mailman id 1442102;
 Wed, 07 Oct 2026 10:41:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEP54-0006Df-DW
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:41:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP54-001biM-0e;
 Wed, 07 Oct 2026 10:41:02 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP53-001QnT-34;
 Wed, 07 Oct 2026 10:41:02 +0000
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
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=3unBXKoSIkkOI4lQHAOOYMO5jJksROtYlSF7H+YURFQ=; b=LusKlcGYZaE+yA7HIQA5d1uH1u
	tdRg7BXimupG6gKpn7KsvQ/MwUItTUsp4ad0jKfxmaDIrGqMNLuchRdJMifCVMgEAVIkdh9973hrE
	Dx/LMCkIALELlEOP7pft5tEXJ80sONnS1w9p/T5KkbQCtS4EdF4ds6chHkdi3BxnI8nI=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 03/18] x86/mm: prepare destroy_perdomain_mapping() for per-vCPU perdomain areas
Date: Wed,  7 Oct 2026 11:40:36 +0100
Message-ID: <20261007104051.48841-4-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007104051.48841-1-gwd@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

We want to change per-domain mappings to be per-vCPU mappings.  In
preparation for that, we want to arrange that
destroy_perdomain_mapping() work either with a single perdomain area,
or with a per-vCPU perdomain area.

The one remaining caller, free_compat_arg_xlat(), is already in a vCPU
context, so we just need to change the parameter from a domain pointer
to a vCPU pointer.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
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
index 2254a7e3fe..b19b1ae53f 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -606,7 +606,7 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 int create_perdomain_mapping(struct domain *d, unsigned long va,
                              unsigned int nr, l1_pgentry_t **pl1tab,
                              struct page_info **ppg);
-void destroy_perdomain_mapping(struct domain *d, unsigned long va,
+void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
                                unsigned int nr);
 void free_perdomain_mappings(struct domain *d);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b158742408..769b9b3016 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6334,10 +6334,11 @@ int create_perdomain_mapping(struct domain *d, unsigned long va,
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
index 2a1805964d..8c576acdc7 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -744,7 +744,7 @@ int setup_compat_arg_xlat(struct vcpu *v)
  */
 void free_compat_arg_xlat(struct vcpu *v)
 {
-    destroy_perdomain_mapping(v->domain, ARG_XLAT_START(v),
+    destroy_perdomain_mapping(v, ARG_XLAT_START(v),
                               PFN_UP(COMPAT_ARG_XLAT_SIZE));
 }
 
-- 
2.55.0


