Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6474E606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=L1QZV77D
Received: from list by lists.xenproject.org with outflank-mailman.1463790.1674603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6Q-0005E5-Eu; Wed, 28 Oct 2026 23:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463790.1674603; Wed, 28 Oct 2026 23:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6Q-0005A3-35; Wed, 28 Oct 2026 23:30:42 +0000
Received: by outflank-mailman (input) for mailman id 1463790;
 Wed, 28 Oct 2026 23:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00048K-RW
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00000000pO1-29SG;
 Wed, 28 Oct 2026 23:30:36 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjn-00000001KpM-0NMM;
 Wed, 28 Oct 2026 23:07:19 +0000
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
	bh=+ze/mUts7B6alTNouyX2ejvqaet9bE/wAgVhHkz5gYM=; b=L1QZV77DZv2kqUzdaEjiKeNt2P
	vYEhqvGJ/DEwb18S77KFu43mU2Y8cvsmU900pAPO4E2wmuCMz7TCs4TuHNAxSFQ06JNDILXVnOS5x
	r8D7RNFw4I13wKhotdO9kQlT5UST0DLuhLqcGT5YH39FquPlcjeZ09arqopN8Lh1H/Lk=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 41/45] x86/fpu: Pass explicit xsave areas to fpu_(f)xsave()
Date: Wed, 28 Oct 2026 23:05:55 +0000
Message-ID: <20261028-asi-hvm-v5-41-13b908e0df0b@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
References: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
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

Have the save entry point fetch the vCPU's XSAVE area once, through
the VCPU_MAP_XSAVE_AREA() seam, and pass the resulting pointer down
explicitly: xsave() gains an area parameter in place of its internal
dereference, and fpu_fxsave() takes the legacy region directly.  The
lower-level helpers no longer know where a vCPU's save area lives,
which is the property the coming relocation of guest save areas
relies on; the vcpu pointers become const on the way.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>

---
Revived from "x86: Address Space Isolation FPU preparations" v3 patch
10/12 (<20250110132823.24348-11-alejandro.vallejo@cloud.com>, Acked-by
Jan Beulich; no v4 was ever posted).

Changes in v5:
- New in this version.

Changes since the previously posted version:
 - Regenerated against the eager-FPU-only tree: the entry point is now
   vcpu_save_fpu() (vcpu_xsave_mask()/_vcpu_save_fpu() no longer
   exist), and the mask is always XSTATE_ALL.
 - Expanded the commit message.
---
 xen/arch/x86/i387.c               | 18 ++++++++++++------
 xen/arch/x86/include/asm/xstate.h |  2 +-
 xen/arch/x86/xstate.c             |  3 +--
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index c6796bc97b..65491b5697 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -109,7 +109,8 @@ static inline void fpu_fxrstor(struct vcpu *v)
 /*******************************/
 
 /* Save x87 extended state */
-static inline void fpu_xsave(struct vcpu *v)
+static inline void fpu_xsave(const struct vcpu *v,
+                             struct xsave_struct *xsave_area)
 {
     bool ok;
 
@@ -119,15 +120,14 @@ static inline void fpu_xsave(struct vcpu *v)
      */
     ok = set_xcr0(v->arch.xcr0_accum | XSTATE_FP_SSE);
     ASSERT(ok);
-    xsave(v, XSTATE_ALL);
+    xsave(v, xsave_area, XSTATE_ALL);
     ok = set_xcr0(v->arch.xcr0 ?: XSTATE_FP_SSE);
     ASSERT(ok);
 }
 
 /* Save x87 FPU, MMX, SSE and SSE2 state */
-static inline void fpu_fxsave(struct vcpu *v)
+static inline void fpu_fxsave(const struct vcpu *v, fpusse_t *fpu_ctxt)
 {
-    fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
     unsigned int fip_width = v->domain->arch.x87_fip_width;
 
     if ( fip_width != 4 )
@@ -192,15 +192,21 @@ void vcpu_restore_fpu(struct vcpu *v)
  */
 void vcpu_save_fpu(struct vcpu *v)
 {
+    struct xsave_struct *xsave_area;
+
     ASSERT(!is_idle_vcpu(v));
 
     /* This can happen, if a paravirtualised guest OS has set its CR0.TS. */
     clts();
 
+    xsave_area = VCPU_MAP_XSAVE_AREA(v);
+
     if ( cpu_has_xsave )
-        fpu_xsave(v);
+        fpu_xsave(v, xsave_area);
     else
-        fpu_fxsave(v);
+        fpu_fxsave(v, &xsave_area->fpu_sse);
+
+    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
 }
 
 /* Initialize FPU's context save area */
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index 0519379edb..40bb6f152e 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -95,7 +95,7 @@ uint64_t get_xcr0(void);
 void set_msr_xss(u64 xss);
 uint64_t get_msr_xss(void);
 uint64_t read_bndcfgu(void);
-void xsave(struct vcpu *v, uint64_t mask);
+void xsave(const struct vcpu *v, struct xsave_struct *ptr, uint64_t mask);
 void xrstor(struct vcpu *v, uint64_t mask);
 void xstate_set_init(uint64_t mask);
 bool xsave_enabled(const struct vcpu *v);
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 2eae3f098d..058bc4c0bc 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -304,9 +304,8 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
     VCPU_UNMAP_XSAVE_AREA(v, xstate);
 }
 
-void xsave(struct vcpu *v, uint64_t mask)
+void xsave(const struct vcpu *v, struct xsave_struct *ptr, uint64_t mask)
 {
-    struct xsave_struct *ptr = v->arch.xsave_area;
     uint32_t hmask = mask >> 32;
     uint32_t lmask = mask;
     unsigned int fip_width = v->domain->arch.x87_fip_width;
-- 
2.56.0


