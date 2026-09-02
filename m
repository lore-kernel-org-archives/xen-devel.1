Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92801C624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 09:49:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405528.1639022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1haf-00074f-Kh; Wed, 02 Sep 2026 09:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405528.1639022; Wed, 02 Sep 2026 09:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1haf-00074P-Hd; Wed, 02 Sep 2026 09:49:09 +0000
Received: by outflank-mailman (input) for mailman id 1405528;
 Wed, 02 Sep 2026 09:49:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 1x1had-00071c-Qh
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:49:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1had-00HNoW-7e
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:49:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97f109-2eae-0a2a0a5409dd-0a2a450c8ef0-38
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:49:07 +0200
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.fritz.box)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTP (eXpurgate 4.57.1)
 (envelope-from <dunlapg@georges-macbook-pro-2.fritz.box>)
 id 6a97efe6-f479-0a2a450c0019-d99ba50cf8a1-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 11:44:06 +0200
Received: by Georges-MacBook-Pro-2.fritz.box (Postfix, from userid 501)
 id A314F36928F3; Wed,  2 Sep 2026 10:44:06 +0100 (BST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: George Dunlap <dunlapg@umich.edu>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Alejandro Vallejo <agarciav@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 10/14] x86/domain_page: drop redundant create_perdomain_mapping() call
Date: Wed,  2 Sep 2026 10:43:54 +0100
Message-ID: <20260901-asi-part2-10-ecc269f268b7@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1788342246-008CDA5B-4A1DBDB3/0/0
X-purgate-type: clean
X-purgate-size: 3821

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
will actually use with populate=true calls, which allocate any missing
page-table structure on demand -- and since d->max_vcpus is fixed
before any vCPU is created, the range those calls cover never grows.
The pre-plumbed tail beyond it backs virtual addresses that are never
populated at all.

Drop the call.  With the only fallible operation gone,
mapcache_domain_init() becomes void, and arch_domain_create()'s error
handling for it goes away.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v2:
- Added to the series (split out of the following patch).

Changes since the previously posted version:
- Split out of "x86/mm: switch {create,destroy}_perdomain_mapping()
  domain parameter to vCPU", where the removal was folded into the
  parameter switch without its own rationale.
---
 xen/arch/x86/domain.c             | 3 +--
 xen/arch/x86/domain_page.c        | 7 ++-----
 xen/arch/x86/include/asm/domain.h | 2 +-
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d8af06e533..efa72cd2f1 100644
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
index b42cf1c8cf..449d4f2a7d 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -256,7 +256,7 @@ void unmap_domain_page_irqoff(const void *ptr)
     do_unmap_domain_page(ptr, true);
 }
 
-int mapcache_domain_init(struct domain *d)
+void mapcache_domain_init(struct domain *d)
 {
     struct mapcache_domain *dcache = &d->arch.pv.mapcache;
     unsigned int bitmap_pages;
@@ -265,7 +265,7 @@ int mapcache_domain_init(struct domain *d)
 
 #ifdef NDEBUG
     if ( !mem_hotplug && max_page <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
-        return 0;
+        return;
 #endif
 
     BUILD_BUG_ON(MAPCACHE_VIRT_END + PAGE_SIZE * (3 +
@@ -277,9 +277,6 @@ int mapcache_domain_init(struct domain *d)
                       (bitmap_pages + 1) * PAGE_SIZE / sizeof(long);
 
     spin_lock_init(&dcache->lock);
-
-    return create_perdomain_mapping(d, (unsigned long)dcache->inuse,
-                                    2 * bitmap_pages + 1, false);
 }
 
 int mapcache_vcpu_init(struct vcpu *v)
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 5c7fad26a6..38df5c376e 100644
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


