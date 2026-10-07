Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19B9CA600E
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 10:41:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442108.1659693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP5C-0007oz-LG; Wed, 07 Oct 2026 10:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442108.1659693; Wed, 07 Oct 2026 10:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEP5C-0007ni-Du; Wed, 07 Oct 2026 10:41:10 +0000
Received: by outflank-mailman (input) for mailman id 1442108;
 Wed, 07 Oct 2026 10:41:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEP5B-0007ay-40
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 10:41:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP5B-001bjC-0B;
 Wed, 07 Oct 2026 10:41:09 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEP5A-001QnT-2f;
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
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=ZVsDH654BNOr5j/nSB+hEf87XBdvPaHAdCERFcMYZ2E=; b=x/3yVIuNIlXPV+gDEtn/VLKHgC
	p0rkmckTlK1KK9lAR5ZoqZ4spaxI3w8kUcVLaQC4PMzRDJ9gkGSL8tWLkgjV44lUIx/e4cY1EgDSV
	CU/6qb00yjdMeKfLmL9XHFnEaz6L08Ga67CeJSkO/rVqMfuAzrwG5Yh1F9Dhfgy17DGg=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 09/18] x86/domain_page: move struct mapcache_vcpu to struct arch_vcpu
Date: Wed,  7 Oct 2026 11:40:42 +0100
Message-ID: <20261007104051.48841-10-gwd@xenproject.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007104051.48841-1-gwd@xenproject.org>
References: <20261007104051.48841-1-gwd@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monné <roger.pau@citrix.com>

struct mapcache_vcpu, the per-vCPU part of the mapcache (the maphash
and the vCPU's shadow of the domain's TLB epoch), lives in struct
pv_vcpu, as only PV vCPUs have a mapcache.  In preparation for
implementing mapcaches for HVM domains, move it to struct arch_vcpu:
v->arch.pv.mapcache becomes v->arch.mapcache.

struct pv_vcpu shrinks from 512 to 376 bytes, and struct vcpu grows
from 2880 to 3008 bytes (x86_64, debug build), within its page: from
here on HVM vCPUs carry the 136-byte struct mapcache_vcpu too, ahead of
its use by those of vCPU-PT domains.

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v3:
- New in this version, split out of "x86/hvm: introduce per-vCPU
  mapcache for vCPU-PT domains" for review.
---
 xen/arch/x86/domain_page.c        | 6 +++---
 xen/arch/x86/include/asm/domain.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index 5d90f77bed..f91ec8a75a 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -134,7 +134,7 @@ void *map_domain_page(mfn_t mfn)
         return mfn_to_virt(mfn_x(mfn));
 
     cache = vcpu_mapcache(v, &dcache);
-    vcache = &v->arch.pv.mapcache;
+    vcache = &v->arch.mapcache;
     if ( !cache->inuse )
         return mfn_to_virt(mfn_x(mfn));
 
@@ -231,7 +231,7 @@ void unmap_domain_page(const void *ptr)
 
     idx = PFN_DOWN(va - MAPCACHE_VIRT_START);
     mfn = l1e_get_pfn(MAPCACHE_L1ENT(idx));
-    hashent = &v->arch.pv.mapcache.hash[MAPHASH_HASHFN(mfn)];
+    hashent = &v->arch.mapcache.hash[MAPHASH_HASHFN(mfn)];
 
     local_irq_save(flags);
 
@@ -334,7 +334,7 @@ int mapcache_vcpu_init(struct vcpu *v)
     BUILD_BUG_ON(MAPHASHENT_NOTINUSE < MAPCACHE_ENTRIES);
     for ( i = 0; i < MAPHASH_ENTRIES; i++ )
     {
-        struct vcpu_maphash_entry *hashent = &v->arch.pv.mapcache.hash[i];
+        struct vcpu_maphash_entry *hashent = &v->arch.mapcache.hash[i];
 
         hashent->mfn = ~0UL; /* never valid to map */
         hashent->idx = MAPHASHENT_NOTINUSE;
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 6f5873879e..cfa24c4e75 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -552,9 +552,6 @@ struct arch_domain
 
 struct pv_vcpu
 {
-    /* map_domain_page() mapping cache. */
-    struct mapcache_vcpu mapcache;
-
     unsigned int vgc_flags;
 
     struct trap_info *trap_ctxt;
@@ -650,6 +647,9 @@ struct arch_vcpu
 #define async_exception_state(t) async_exception_state[(t)-1]
     uint8_t async_exception_mask;
 
+    /* map_domain_page() mapping cache. */
+    struct mapcache_vcpu mapcache;
+
     /* Virtual Machine Extensions */
     union {
         struct pv_vcpu pv;
-- 
2.55.0


