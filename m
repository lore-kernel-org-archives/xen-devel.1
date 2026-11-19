Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5A1606A32C
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=lzi6zaI5
Received: from list by lists.xenproject.org with outflank-mailman.1497127.1695508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9iF-0004Kv-2m; Thu, 19 Nov 2026 21:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497127.1695508; Thu, 19 Nov 2026 21:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9iD-0004Hl-U2; Thu, 19 Nov 2026 21:30:33 +0000
Received: by outflank-mailman (input) for mailman id 1497127;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-0001DE-GD
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-00000006tIJ-0JCC;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9MT-0000000CVBH-3C3O;
 Thu, 19 Nov 2026 21:08:05 +0000
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
	bh=O3n3UQQODatRF1IOFe5HjC1fiBbAzhiwh2RBel9BdYM=; b=lzi6zaI55aAj7uMgNyl4Gz+lrj
	xnVEK4CaxzVJM14PLqdcbEEeE2pUdriz8GC+na9gCEWru+GENpq6M6UVfxnMRNy6WJ8w7WKWI8EJZ
	PcBfuEhRFZf0LwmD4qAmq0i/ZHb+7hyOOSpB4eugYzzbEFOAnGuNjdUwlpftnDdI01gY=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v7 18/50] x86/fpu: Pass explicit xsave areas to fpu_(f)xrstor()
Date: Thu, 19 Nov 2026 21:07:09 +0000
Message-ID: <20261119-asi-hvm-v7-18-6551b6d5c879@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
References: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Mirror of the save-side change: the restore entry point fetches the
vCPU's XSAVE area once, through the VCPU_MAP_XSAVE_AREA() seam, and
passes the pointer down explicitly.  xrstor() gains an area parameter
in place of its internal dereference (its fault-recovery writes go
through the same mapped pointer), fpu_fxrstor() reduces to taking just
the legacy region, and the two direct xrstor() callers -- XSETBV
emulation and xstate_set_init() -- pass the pointers they already hold
mapped.  In handle_xsetbv() this moves the xrstor inside the mapped
section, where it belongs.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>

---
Revived from "x86: Address Space Isolation FPU preparations" v3 patch
11/12 (<20250110132823.24348-12-alejandro.vallejo@cloud.com>, Acked-by
Jan Beulich; no v4 was ever posted).

Changes in v5:
- New in this version.

Changes since the previously posted version:
 - Regenerated against the eager-FPU-only tree: the entry point is now
   vcpu_restore_fpu() (the lazy/nonlazy split no longer exists), and
   the mask is always XSTATE_ALL.
 - Moved handle_xsetbv()'s xrstor() call inside its map/unmap
   bracket, which the explicit-area form makes possible.
 - Expanded the commit message.
---
 xen/arch/x86/i387.c               | 19 ++++++++++++-------
 xen/arch/x86/include/asm/xstate.h |  2 +-
 xen/arch/x86/xstate.c             |  7 +++----
 3 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 65491b5697..b796687eeb 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -20,7 +20,8 @@
 /*     FPU Restore Functions   */
 /*******************************/
 /* Restore x87 extended state */
-static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
+static inline void fpu_xrstor(const struct vcpu *v,
+                              struct xsave_struct *xsave_area, uint64_t mask)
 {
     bool ok;
 
@@ -30,16 +31,14 @@ static inline void fpu_xrstor(struct vcpu *v, uint64_t mask)
      */
     ok = set_xcr0(v->arch.xcr0_accum | XSTATE_FP_SSE);
     ASSERT(ok);
-    xrstor(v, mask);
+    xrstor(v, xsave_area, mask);
     ok = set_xcr0(v->arch.xcr0 ?: XSTATE_FP_SSE);
     ASSERT(ok);
 }
 
 /* Restore x87 FPU, MMX, SSE and SSE2 state */
-static inline void fpu_fxrstor(struct vcpu *v)
+static inline void fpu_fxrstor(const fpusse_t *fpu_ctxt)
 {
-    const fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
-
     /*
      * Some CPUs don't save/restore FDP/FIP/FOP unless an exception
      * is pending. Clear the x87 state here by setting it to fixed
@@ -174,12 +173,18 @@ static inline void fpu_fxsave(const struct vcpu *v, fpusse_t *fpu_ctxt)
 /* Restore FPU state whenever VCPU is schduled in. */
 void vcpu_restore_fpu(struct vcpu *v)
 {
+    struct xsave_struct *xsave_area;
+
     ASSERT(!is_idle_vcpu(v));
 
+    xsave_area = VCPU_MAP_XSAVE_AREA(v);
+
     if ( cpu_has_xsave )
-        fpu_xrstor(v, XSTATE_ALL);
+        fpu_xrstor(v, xsave_area, XSTATE_ALL);
     else
-        fpu_fxrstor(v);
+        fpu_fxrstor(&xsave_area->fpu_sse);
+
+    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
 
     /* Xen doesn't need TS set, but the guest might. */
     if ( is_pv_vcpu(v) && (v->arch.pv.ctrlreg[0] & X86_CR0_TS) )
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index 40bb6f152e..3d57aaadd8 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -96,7 +96,7 @@ void set_msr_xss(u64 xss);
 uint64_t get_msr_xss(void);
 uint64_t read_bndcfgu(void);
 void xsave(const struct vcpu *v, struct xsave_struct *ptr, uint64_t mask);
-void xrstor(struct vcpu *v, uint64_t mask);
+void xrstor(const struct vcpu *v, struct xsave_struct *ptr, uint64_t mask);
 void xstate_set_init(uint64_t mask);
 bool xsave_enabled(const struct vcpu *v);
 int __must_check validate_xstate(const struct domain *d,
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 058bc4c0bc..3c9be271a3 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -378,11 +378,10 @@ void xsave(const struct vcpu *v, struct xsave_struct *ptr, uint64_t mask)
         ptr->fpu_sse.x[FPU_WORD_SIZE_OFFSET] = fip_width;
 }
 
-void xrstor(struct vcpu *v, uint64_t mask)
+void xrstor(const struct vcpu *v, struct xsave_struct *ptr, uint64_t mask)
 {
     uint32_t hmask = mask >> 32;
     uint32_t lmask = mask;
-    struct xsave_struct *ptr = v->arch.xsave_area;
     unsigned int faults, prev_faults;
 
     /*
@@ -1011,8 +1010,8 @@ int handle_xsetbv(u32 index, u64 new_bv)
         clts();
 
         asm ( "stmxcsr %0" : "=m" (xsave_area->fpu_sse.mxcsr) );
+        xrstor(curr, xsave_area, mask);
         VCPU_UNMAP_XSAVE_AREA(curr, xsave_area);
-        xrstor(curr, mask);
         if ( cr0 & X86_CR0_TS )
             write_cr0(cr0);
     }
@@ -1079,7 +1078,7 @@ void xstate_set_init(uint64_t mask)
 
     xstate = VCPU_MAP_XSAVE_AREA(v);
     memset(&xstate->xsave_hdr, 0, sizeof(xstate->xsave_hdr));
-    xrstor(v, mask);
+    xrstor(v, xstate, mask);
     VCPU_UNMAP_XSAVE_AREA(v, xstate);
 
     if ( cr0 & X86_CR0_TS )
-- 
2.56.0


