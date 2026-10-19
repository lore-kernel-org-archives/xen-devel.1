Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1907606A319
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=iqGzzSm0
Received: from list by lists.xenproject.org with outflank-mailman.1454846.1668466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItS9-0005zL-FZ; Mon, 19 Oct 2026 19:55:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454846.1668466; Mon, 19 Oct 2026 19:55:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItS8-0005rb-Mo; Mon, 19 Oct 2026 19:55:24 +0000
Received: by outflank-mailman (input) for mailman id 1454846;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-0003i0-QS
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:55:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItRz-0000000230A-3wyE;
 Mon, 19 Oct 2026 19:55:15 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xItGf-00000001FjN-12Qo;
 Mon, 19 Oct 2026 19:43:33 +0000
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
	bh=IljL9ERbJZTdTGatiECVH6x/M/gfKWv60kBNbg4WwnQ=; b=iqGzzSm0J/I43i2gk1lTExYrvR
	SnW6w+qJiJ1EroduJaeymaSVWRtf3EydBaZp1LR8/avjxkq8/tnVXswKyqbCLVsoWZM390KclAoiZ
	GkliKUC5x3LUxUU5FieyQJe41nSAmwrMYYMmfXYm8wAz0C6V1+IOyame+senp930EiDo=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 17/30] x86/domain_page: key the directmap fast paths on the loaded view
Date: Mon, 19 Oct 2026 20:42:48 +0100
Message-ID: <20261019-asi-hvm-v4-17-b68b66652266@xenproject.org>
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

map_domain_page() returns directmap addresses whenever it can: for any
MFN the directmap covers in release builds, and for vCPUs without a
mapcache.  Once guest contexts may run on the sparse view of the
directmap, modify this to take the fast path returning the directmap
address only when the full directmap is loaded.

The release-build shortcut ahead of the vCPU lookup looks at the vCPU
whose page-tables are loaded, without completing a lazy context
switch: if that vCPU is not on the sparse view, its page-tables map
the page through the directmap, and completing the switch would only
move the CPU to the idle vCPU's page-tables, which map it too.

A vCPU on the sparse view always has a mapcache: HVM ones through
per-vCPU page-tables, PV ones through the domain-wide mapcache, which
mapcache_domain_init() now sets up for a domain using the sparse view in
release builds too, rather than only when the directmap does not cover
all memory.

map_domain_page_global() mappings must be valid in every context: use
vmap() for all of them once a sparse view is configured, as
arch_mfns_in_directmap() then says.

Add d->arch.asi.sparse_dmap for this; nothing sets it yet.

No functional change.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v4:
- d->arch.sparse_dmap is now a one-bit field of d->arch.asi, beside
  vcpu_pt.
- Wrap a line that reached 80 columns.
- Drop sparse_dmap_active: d->arch.asi.sparse_dmap alone says whether a
  domain's root page-tables carry the sparse view (Roger).  Builds
  without CONFIG_SPARSE_DIRECTMAP compile the test out, as before.
- Drop the second directmap check after the vCPU lookup: the
  !cache->inuse case covers it.

Changes in v3:
- New in this version.
---
 xen/arch/x86/domain_page.c        | 34 ++++++++++++++++++++++++++++---
 xen/arch/x86/include/asm/domain.h |  3 +++
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 770fee80a4..6b662706fb 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -56,6 +56,13 @@ static inline struct vcpu *mapcache_current_vcpu(void)
     return ACCESS_ONCE(this_cpu(pgtable_vcpu));
 }
 
+/* Whether @v's page-tables carry the sparse view of the directmap. */
+static bool on_sparse_dmap(const struct vcpu *v)
+{
+    return IS_ENABLED(CONFIG_SPARSE_DIRECTMAP) &&
+           v->domain->arch.asi.sparse_dmap;
+}
+
 /*
  * The accounting for v's mapcache: its own for a vCPU-PT domain, the domain's
  * otherwise, in which case *dcache is set so the caller takes the domain-wide
@@ -135,9 +142,19 @@ void *map_domain_page(mfn_t mfn)
 
 #ifdef NDEBUG
     if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
-        return mfn_to_virt(mfn_x(mfn));
+    {
+        const struct vcpu *pt_vcpu = this_cpu(pgtable_vcpu);
+
+        /*
+         * The page-tables loaded map @mfn through the directmap, unless they
+         * carry the sparse view.
+         */
+        if ( !pt_vcpu || !on_sparse_dmap(pt_vcpu) )
+            return mfn_to_virt(mfn_x(mfn));
+    }
 #endif
 
+    /* No vCPU (early boot), or no mapcache: the full directmap is loaded. */
     v = mapcache_current_vcpu();
     if ( !v )
         return mfn_to_virt(mfn_x(mfn));
@@ -145,7 +162,10 @@ void *map_domain_page(mfn_t mfn)
     cache = vcpu_mapcache(v, &dcache);
     vcache = &v->arch.mapcache;
     if ( !cache->inuse )
+    {
+        ASSERT(!on_sparse_dmap(v));
         return mfn_to_virt(mfn_x(mfn));
+    }
 
     perfc_incr(map_domain_page_count);
 
@@ -294,7 +314,11 @@ void mapcache_domain_init(struct domain *d)
     ASSERT(is_pv_domain(d));
 
 #ifdef NDEBUG
-    if ( !mem_hotplug && max_page <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
+    /*
+     * Not needed when the directmap loaded for the domain covers everything.
+     */
+    if ( !d->arch.asi.sparse_dmap && !mem_hotplug &&
+         max_page <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
         return;
 #endif
 
@@ -378,8 +402,12 @@ void *map_domain_page_global(mfn_t mfn)
              system_state < SYS_STATE_active) ||
             local_irq_is_enabled()));
 
+    /*
+     * Global mappings must hold in every context: a sparse view of the
+     * directmap rules the directmap out.
+     */
 #ifdef NDEBUG
-    if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
+    if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
         return mfn_to_virt(mfn_x(mfn));
 #endif
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 7076e38848..f84ac15759 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -490,6 +490,9 @@ struct arch_domain
     struct {
         /* Give each vCPU its own per-domain area (HVM only). */
         bool vcpu_pt:1;
+
+        /* The domain's root page-tables carry the sparse directmap view. */
+        bool sparse_dmap:1;
     } asi;
 
     /* Emulated devices enabled bitmap. */
-- 
2.55.0


