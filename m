Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43484606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=NKMK8/Ki
Received: from list by lists.xenproject.org with outflank-mailman.1454765.1668298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItGT-00064h-Jk; Mon, 19 Oct 2026 19:43:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454765.1668298; Mon, 19 Oct 2026 19:43:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItGT-000641-BK; Mon, 19 Oct 2026 19:43:21 +0000
Received: by outflank-mailman (input) for mailman id 1454765;
 Mon, 19 Oct 2026 19:43:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItGS-0005ur-CS
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:43:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGS-000000022k8-1ErZ;
 Mon, 19 Oct 2026 19:43:20 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGS-00000001FjN-09tM;
 Mon, 19 Oct 2026 19:43:20 +0000
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
	bh=2WAx232e1o23xbVvwluUdMmJZVaoZJGamK8uLinVDPU=; b=NKMK8/Ki0ezCIEAlL7cZwz7gyp
	L1u3bm3PXbOvQ0ed6wuwklEkss95YOhTORtDceTntsIwdGFHOWnNrzsjVee65HkFrWdU1zKXbZiii
	T3q0KLx2NkVAVHH23HsPaP8wXRx7H+TW3czd75oZqrCbwv2g4IODQ/E+diO1FL4xnh2E=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 05/30] x86/domain_page: drop redundant create_perdomain_mapping() call
Date: Mon, 19 Oct 2026 20:42:36 +0100
Message-ID: <20261019-asi-hvm-v4-5-b68b66652266@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
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

One of the current calls in a domain context turns out to be
unnecessary:

mapcache_domain_init() pre-plumbs L1 tables over the whole
inuse/garbage bitmap range (sized for the full MAPCACHE_ENTRIES
capacity), without populating any data pages.  The plumbing is
redundant: mapcache_vcpu_init() installs the bitmap pages the domain
will actually use with populating calls, which allocate any missing
page-table structure on demand -- and since d->max_vcpus is fixed
before any vCPU is created, the range those calls cover never grows.
The pre-plumbed tail beyond it backs virtual addresses that are never
populated at all.

In debug builds, and on hosts with memory hotplug or with more memory
than the PV directmap covers, the call was also what first allocated a
PV domain's per-domain L3.  Release builds on other hosts already
allocated it only with the first vCPU.

Drop the call; now we always allocate only with the first vCPU.

With the only fallible operation gone, mapcache_domain_init() becomes
void, and arch_domain_create()'s error handling for it goes away.

The per-domain-mapping work in mapcache_vcpu_init() stays where it is
rather than moving into mapcache_domain_init() along with this change,
ready for a later patch which introduces per-vCPU mapcaches.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
Reviewed-by: Roger Pau Monné <roger@xenproject.org>
---
Changes in v3:
- Rebased onto staging without the GDT/LDT conversions (for the
  HVM-only series); no functional difference.
- Say why the per-vCPU part stays in mapcache_vcpu_init() (Jan).
- Say that the call also first allocated a PV domain's per-domain L3 in
  some builds, which all builds now do with the first vCPU.

Changes in v2:
- Added to the series (split out of the following patch).

Changes since the previously posted version:
- Split out of "x86/mm: switch {create,destroy}_perdomain_mapping()
  domain parameter to vCPU", where the removal was folded into the
  parameter switch without its own rationale.
---
 xen/arch/x86/domain.c             | 3 +--
 xen/arch/x86/domain_page.c        | 8 ++------
 xen/arch/x86/include/asm/domain.h | 2 +-
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 368e4deff3..8e17fbe6d9 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -908,8 +908,7 @@ int arch_domain_create(struct domain *d,
     }
     else if ( is_pv_domain(d) )
     {
-        if ( (rc = mapcache_domain_init(d)) != 0 )
-            goto fail;
+        mapcache_domain_init(d);
 
         if ( (rc = pv_domain_initialise(d)) != 0 )
             goto fail;
diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 5744754f11..f02be1675b 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -223,7 +223,7 @@ void unmap_domain_page(const void *ptr)
     local_irq_restore(flags);
 }
 
-int mapcache_domain_init(struct domain *d)
+void mapcache_domain_init(struct domain *d)
 {
     struct mapcache_domain *dcache = &d->arch.pv.mapcache;
     unsigned int bitmap_pages;
@@ -232,7 +232,7 @@ int mapcache_domain_init(struct domain *d)
 
 #ifdef NDEBUG
     if ( !mem_hotplug && max_page <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
-        return 0;
+        return;
 #endif
 
     BUILD_BUG_ON(MAPCACHE_VIRT_END + PAGE_SIZE * (3 +
@@ -244,10 +244,6 @@ int mapcache_domain_init(struct domain *d)
                       (bitmap_pages + 1) * PAGE_SIZE / sizeof(long);
 
     spin_lock_init(&dcache->lock);
-
-    return create_perdomain_mapping(d, (unsigned long)dcache->inuse,
-                                    2 * bitmap_pages + 1,
-                                    NIL(l1_pgentry_t *), NULL);
 }
 
 int mapcache_vcpu_init(struct vcpu *v)
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 2d0a915410..212daae1f5 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -89,7 +89,7 @@ struct mapcache_domain {
     unsigned long *garbage;
 };
 
-int mapcache_domain_init(struct domain *d);
+void mapcache_domain_init(struct domain *d);
 int mapcache_vcpu_init(struct vcpu *v);
 
 /* x86/64: toggle guest between kernel and user modes. */
-- 
2.55.0


