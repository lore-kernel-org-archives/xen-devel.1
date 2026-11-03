Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4647B606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 23:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=ca0ULvjt
Received: from list by lists.xenproject.org with outflank-mailman.1470715.1679353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONnn-0003Rc-Lg; Tue, 03 Nov 2026 23:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470715.1679353; Tue, 03 Nov 2026 23:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONnn-0003RO-IG; Tue, 03 Nov 2026 23:20:27 +0000
Received: by outflank-mailman (input) for mailman id 1470715;
 Tue, 03 Nov 2026 23:20:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xONnl-0003Ok-K9
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:20:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONnl-0000000Coff-0TD7;
 Tue, 03 Nov 2026 23:20:25 +0000
Received: from [2607:fb91:4c8c:bd3f:1da5:e92a:c5fb:865a]
 (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONnj-0000000EMFa-3OKN;
 Tue, 03 Nov 2026 23:20:25 +0000
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
	bh=ULtiu4aFlCDZSTihWE2R472MpYJVuVy4Xwfo4YXyEfQ=; b=ca0ULvjt+26YeVsKccI+kqPVYi
	TCTjshxtmN45+mwavA28NEIDHyW/i/Yb2DsiPUbGqza64fCLUh0d/TTdF4dnOqZ/gvq7h3KIEijvw
	Oouq6luYB0dIgCulc19mxuV1j+dMKRIYFLmIKzP8x8biR/fmyw3GxAcnpRmWYFOmh3J8=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v6 05/44] x86/mm: prepare create_perdomain_mapping() for per-vCPU perdomain areas
Date: Tue,  3 Nov 2026 17:13:27 -0500
Message-ID: <20261103-asi-hvm-v6-5-59dbc5ce9615@xenproject.org>
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
create_perdomain_mapping() work either with a single perdomain area,
or with a per-vCPU perdomain area.

The remaining callers are already in a vCPU context.  This is no
accident: much of the perdomain area has always been laid out in
per-vCPU slices -- each vCPU has its own GDT/LDT window and its own
COMPAT_ARG_XLAT pages -- and each vCPU's slice is set up as that vCPU
is created.  For these callers, we just need to change the parameter
from a domain pointer to a vCPU pointer.  Once the perdomain area
itself becomes per-vCPU, the same calls will populate the owning
vCPU's own area rather than slices of a shared one.

Note that we cannot yet do a parallel movement of
free_perdomain_mappings(): the per-domain page-table hierarchy is
still a single domain-wide structure shared by all vCPUs, so tearing
it down from a per-vCPU path would pull the mappings out from under
sibling vCPUs (e.g. on a partially failed, retryable
XEN_DOMCTL_max_vcpus), and vCPU-create error paths can rely on domain
destruction to free a partially set up hierarchy.  Once a domain's
area is per-vCPU, a later change gives its vCPUs a teardown of their
own; the domain-wide teardown stays for domains with a shared area, PV
ones included.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v6:
- Rebase over "x86/mm: allocate the per-domain L3 in
  arch_domain_create()".
- No longer add an implicit L3 creation in arch_vcpu_create().

Changes in v5:
- Message: the domain-wide mapcache is one pool, not per-vCPU windows:
  drop it from the per-vCPU slices, and say "much of" the area.

Changes in v4:
- Message: drop a sentence repeating its paragraph, and say that the
  domain-wide teardown stays for domains with a shared area (Roger).
- End the comment in arch_vcpu_create() at the colon (Roger).

Changes in v3:
- Rebased onto staging without the GDT/LDT conversions (for the
  HVM-only series): the capture parameters stay, as the PV GDT/LDT
  stash still uses them.

Changes in v2:
- Added to the series

Changes since the previously posted version:
- Keep free_perdomain_mappings() (and hence perdomain teardown)
  domain-scoped.
- Keep the idle domain without a perdomain area.
- Retitle (was: "x86/mm: switch {create,destroy}_perdomain_mapping()
  domain parameter to vCPU"); destroy_perdomain_mapping() was switched
  in a separate patch.
- Split the removal of mapcache_domain_init()'s redundant
  create_perdomain_mapping() call into its own (preceding) patch.
---
 xen/arch/x86/domain_page.c    | 6 +++---
 xen/arch/x86/include/asm/mm.h | 2 +-
 xen/arch/x86/mm.c             | 3 ++-
 xen/arch/x86/pv/domain.c      | 2 +-
 xen/arch/x86/x86_64/mm.c      | 2 +-
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index f02be1675b..f3e65e2d44 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -260,15 +260,15 @@ int mapcache_vcpu_init(struct vcpu *v)
     if ( ents > dcache->entries )
     {
         /* Populate page tables. */
-        int rc = create_perdomain_mapping(d, MAPCACHE_VIRT_START, ents,
+        int rc = create_perdomain_mapping(v, MAPCACHE_VIRT_START, ents,
                                           NIL(l1_pgentry_t *), NULL);
 
         /* Populate bit maps. */
         if ( !rc )
-            rc = create_perdomain_mapping(d, (unsigned long)dcache->inuse,
+            rc = create_perdomain_mapping(v, (unsigned long)dcache->inuse,
                                           nr, NULL, NIL(struct page_info *));
         if ( !rc )
-            rc = create_perdomain_mapping(d, (unsigned long)dcache->garbage,
+            rc = create_perdomain_mapping(v, (unsigned long)dcache->garbage,
                                           nr, NULL, NIL(struct page_info *));
 
         if ( rc )
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 1cdd30f7e2..e85a6db203 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -607,7 +607,7 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 #define IS_NIL(ptr) (!((uintptr_t)(ptr) + sizeof(*(ptr))))
 
 struct page_info *allocate_perdomain_l3(struct domain *d);
-int create_perdomain_mapping(struct domain *d, unsigned long va,
+int create_perdomain_mapping(struct vcpu *v, unsigned long va,
                              unsigned int nr, l1_pgentry_t **pl1tab,
                              struct page_info **ppg);
 void destroy_perdomain_mapping(const struct vcpu *v, unsigned long va,
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index c784c4f726..61bd4aa02a 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -6245,10 +6245,11 @@ struct page_info *allocate_perdomain_l3(struct domain *d)
     return pg;
 }
 
-int create_perdomain_mapping(struct domain *d, unsigned long va,
+int create_perdomain_mapping(struct vcpu *v, unsigned long va,
                              unsigned int nr, l1_pgentry_t **pl1tab,
                              struct page_info **ppg)
 {
+    struct domain *d = v->domain;
     struct page_info *pg;
     l3_pgentry_t *l3tab;
     l2_pgentry_t *l2tab;
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index 28ea0742ab..f3c711b85b 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -313,7 +313,7 @@ int switch_compat(struct domain *d)
 
 static int pv_create_gdt_ldt_l1tab(struct vcpu *v)
 {
-    return create_perdomain_mapping(v->domain, GDT_VIRT_START(v),
+    return create_perdomain_mapping(v, GDT_VIRT_START(v),
                                     1U << GDT_LDT_VCPU_SHIFT,
                                     v->domain->arch.pv.gdt_ldt_l1tab,
                                     NULL);
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index f467ed426b..7b04537066 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -732,7 +732,7 @@ void __init zap_low_mappings(void)
 
 int setup_compat_arg_xlat(struct vcpu *v)
 {
-    return create_perdomain_mapping(v->domain, ARG_XLAT_START(v),
+    return create_perdomain_mapping(v, ARG_XLAT_START(v),
                                     PFN_UP(COMPAT_ARG_XLAT_SIZE),
                                     NULL, NIL(struct page_info *));
 }
-- 
2.56.0


