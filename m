Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB5A606A31F
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 23:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=ZpgGwQ0a
Received: from list by lists.xenproject.org with outflank-mailman.1463798.1674678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6Y-00074F-T8; Wed, 28 Oct 2026 23:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463798.1674678; Wed, 28 Oct 2026 23:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMD6X-0006xK-Hp; Wed, 28 Oct 2026 23:30:49 +0000
Received: by outflank-mailman (input) for mailman id 1463798;
 Wed, 28 Oct 2026 23:30:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00048k-Uw
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMD6K-00000000pOD-2mbO;
 Wed, 28 Oct 2026 23:30:36 +0000
Received: from [217.155.165.12] (helo=Mac.fritz.box.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMCjo-00000001KpM-4B30;
 Wed, 28 Oct 2026 23:07:21 +0000
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
	bh=DbVOB2YlxYBgBhkCO9XsfTSfRNU6koHfebs+alJDQWM=; b=ZpgGwQ0a/ssphHOnxGzVp44Et5
	vA90tHujpLrJLgwBsxXLgbklo9gIi0KprcaH2Vtz6fMo5XWX9TYEXPMcjeOs+QA3QGe0kzPim2VDO
	Ng+mNe6fYHJ21t12LugQs4nP0GbU7op7E2b1boBk13MEeJejlx8Bc0Rv8QTnbWX3mP2Y=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v5 43/45] x86/xstate: classify xsave-area seam accesses by failure mode
Date: Wed, 28 Oct 2026 23:05:57 +0000
Message-ID: <20261028-asi-hvm-v5-43-13b908e0df0b@xenproject.org>
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

The VCPU_MAP_XSAVE_AREA() seam currently cannot fail: the map is a
pointer fetch.  Once guest XSAVE areas move behind per-vCPU mappings,
mapping another vCPU's multi-page area becomes an operation that can
run out of resources.  Split the seam's users along that line ahead of
the change:

 - expand_xsave_states() and compress_xsave_states() address the full
   area; they gain an error return, which their four callers (the
   vcpuextstate domctls and the HVM context save/load handlers)
   propagate.  The two deserialising callers (the setvcpuextstate
   domctl and the HVM xsave-state load handler) restore the
   previously-set XCR0 fields if the deserialisation fails, so a
   failed restore leaves the vCPU's state as it was.

 - Accessors touching only the legacy region and the XSAVE header --
   vcpu_reset_fpu(), vcpu_setup_fpu(), hvm_save_cpu_ctxt() and
   arch_get_info_guest() -- switch to a new
   VCPU_MAP_XSAVE_AREA_PREFIX() variant.  The prefix always fits the
   area's first page, so that variant can remain infallible, and no
   error plumbing is needed on the paths (INIT/SIPI, S3 resume) that
   have no way to fail.

No functional change: both variants are still pointer fetches.

Assisted-by: Claude Code:claude-fable-5
Signed-off-by: George Dunlap <gwd@xenproject.org>

---
Changes in v5:
- New in this version.
---
 xen/arch/x86/domctl.c             | 26 ++++++++++++++++++--------
 xen/arch/x86/hvm/hvm.c            | 27 ++++++++++++++++++---------
 xen/arch/x86/i387.c               |  8 ++++----
 xen/arch/x86/include/asm/xstate.h | 13 +++++++++++--
 xen/arch/x86/xstate.c             | 18 +++++++++++++++---
 5 files changed, 66 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index b7ea1e1801..b967352fc5 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1010,10 +1010,10 @@ long arch_do_domctl(
                     goto vcpuextstate_out;
                 }
 
-                expand_xsave_states(v, xsave_area, xsave_size);
+                ret = expand_xsave_states(v, xsave_area, xsave_size);
 
-                if ( copy_to_guest_offset(evc->buffer, offset, xsave_area,
-                                          xsave_size) )
+                if ( !ret && copy_to_guest_offset(evc->buffer, offset,
+                                                  xsave_area, xsave_size) )
                      ret = -EFAULT;
                 xfree(xsave_area);
            }
@@ -1077,14 +1077,24 @@ long arch_do_domctl(
                 ret = -EINVAL; /* Not legitimate data. */
             else
             {
+                uint64_t old_xcr0, old_xcr0_accum;
+
                 vcpu_pause(v);
 
+                old_xcr0 = v->arch.xcr0;
+                old_xcr0_accum = v->arch.xcr0_accum;
                 v->arch.xcr0 = _xcr0;
                 v->arch.xcr0_accum = _xcr0_accum;
-                compress_xsave_states(v, _xsave_area,
-                                      evc->size - PV_XSAVE_HDR_SIZE);
+                ret = compress_xsave_states(v, _xsave_area,
+                                            evc->size - PV_XSAVE_HDR_SIZE);
 
-                if ( is_hvm_domain(d) )
+                if ( ret )
+                {
+                    /* Leave the vCPU's state as it was. */
+                    v->arch.xcr0 = old_xcr0;
+                    v->arch.xcr0_accum = old_xcr0_accum;
+                }
+                else if ( is_hvm_domain(d) )
                     hvmemul_cancel(v);
 
                 vcpu_unpause(v);
@@ -1468,10 +1478,10 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
 #define c(fld) (c.nat->fld)
 #endif
 
-    xsave_area = VCPU_MAP_XSAVE_AREA(v);
+    xsave_area = VCPU_MAP_XSAVE_AREA_PREFIX(v);
     BUILD_BUG_ON(sizeof(c.nat->fpu_ctxt) != sizeof(xsave_area->fpu_sse));
     memcpy(&c.nat->fpu_ctxt, &xsave_area->fpu_sse, sizeof(c.nat->fpu_ctxt));
-    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
+    VCPU_UNMAP_XSAVE_AREA_PREFIX(v, xsave_area);
 
     if ( is_pv_domain(d) )
         c(flags = v->arch.pv.vgc_flags & ~VGCF_in_kernel);
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index eadccf3d79..42a7d03b3a 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -932,10 +932,10 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
     ctxt.ldtr_base = seg.base;
     ctxt.ldtr_arbytes = seg.attr;
 
-    xsave_area = VCPU_MAP_XSAVE_AREA(v);
+    xsave_area = VCPU_MAP_XSAVE_AREA_PREFIX(v);
     BUILD_BUG_ON(sizeof(ctxt.fpu_regs) != sizeof(xsave_area->fpu_sse));
     memcpy(ctxt.fpu_regs, &xsave_area->fpu_sse, sizeof(ctxt.fpu_regs));
-    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
+    VCPU_UNMAP_XSAVE_AREA_PREFIX(v, xsave_area);
     ctxt.flags = XEN_X86_FPU_INITIALISED;
 
     return hvm_save_entry(CPU, v->vcpu_id, h, &ctxt);
@@ -1251,10 +1251,8 @@ static int cf_check hvm_save_cpu_xsave_states(
     ctxt->xcr0 = v->arch.xcr0;
     ctxt->xcr0_accum = v->arch.xcr0_accum;
 
-    expand_xsave_states(v, &ctxt->save_area,
-                        size - offsetof(typeof(*ctxt), save_area));
-
-    return 0;
+    return expand_xsave_states(v, &ctxt->save_area,
+                               size - offsetof(typeof(*ctxt), save_area));
 }
 
 /*
@@ -1279,6 +1277,7 @@ static int cf_check hvm_load_cpu_xsave_states(
     struct hvm_hw_cpu_xsave *ctxt;
     const struct hvm_save_descriptor *desc;
     unsigned int i, desc_start, desc_length;
+    uint64_t old_xcr0, old_xcr0_accum;
 
     /* Which vcpu is this? */
     vcpuid = hvm_load_instance(h);
@@ -1383,12 +1382,22 @@ static int cf_check hvm_load_cpu_xsave_states(
     }
     /* Checking finished */
 
+    old_xcr0 = v->arch.xcr0;
+    old_xcr0_accum = v->arch.xcr0_accum;
     v->arch.xcr0 = ctxt->xcr0;
     v->arch.xcr0_accum = ctxt->xcr0_accum;
-    compress_xsave_states(v, &ctxt->save_area,
-                          size - offsetof(struct hvm_hw_cpu_xsave, save_area));
 
-    return 0;
+    err = compress_xsave_states(v, &ctxt->save_area,
+                                size - offsetof(struct hvm_hw_cpu_xsave,
+                                                save_area));
+    if ( err )
+    {
+        /* Leave the vCPU's state as it was. */
+        v->arch.xcr0 = old_xcr0;
+        v->arch.xcr0_accum = old_xcr0_accum;
+    }
+
+    return err;
 }
 
 #define HVM_CPU_MSR_SIZE(cnt) offsetof(struct hvm_msr, msr[cnt])
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index b796687eeb..d49e391e99 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -222,7 +222,7 @@ int vcpu_init_fpu(struct vcpu *v)
 
 void vcpu_reset_fpu(struct vcpu *v)
 {
-    struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
+    struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA_PREFIX(v);
 
     *xsave_area = (struct xsave_struct) {
         .xsave_hdr.xstate_bv = X86_XCR0_X87,
@@ -233,19 +233,19 @@ void vcpu_reset_fpu(struct vcpu *v)
     xsave_area->fpu_sse.fcw = FCW_RESET;
     xsave_area->fpu_sse.ftw = FXSAVE_FTW_RESET;
 
-    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
+    VCPU_UNMAP_XSAVE_AREA_PREFIX(v, xsave_area);
 }
 
 void vcpu_setup_fpu(struct vcpu *v, const void *data)
 {
-    struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
+    struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA_PREFIX(v);
 
     *xsave_area = (struct xsave_struct) {
         .fpu_sse = *(const fpusse_t*)data,
         .xsave_hdr.xstate_bv = XSTATE_FP_SSE,
     };
 
-    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
+    VCPU_UNMAP_XSAVE_AREA_PREFIX(v, xsave_area);
 }
 
 /* Free FPU's context save area */
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index 3d57aaadd8..c23308cbe2 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -103,8 +103,8 @@ int __must_check validate_xstate(const struct domain *d,
                                  uint64_t xcr0, uint64_t xcr0_accum,
                                  const struct xsave_hdr *hdr);
 int __must_check handle_xsetbv(u32 index, u64 new_bv);
-void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size);
-void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size);
+int expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size);
+int compress_xsave_states(struct vcpu *v, const void *src, unsigned int size);
 
 /* extended state init and cleanup functions */
 void xstate_free_save_area(struct vcpu *v);
@@ -171,4 +171,13 @@ xsave_area_compressed(const struct xsave_struct *xsave_area)
  */
 #define VCPU_UNMAP_XSAVE_AREA(v, x) do { (void)(v); (x) = NULL; } while (0)
 
+/*
+ * Variant of VCPU_MAP_XSAVE_AREA() for accessors which touch nothing
+ * beyond the legacy region and the XSAVE header (the first
+ * XSTATE_AREA_MIN_SIZE bytes).  That prefix always fits within the
+ * area's first page, so this variant cannot fail.
+ */
+#define VCPU_MAP_XSAVE_AREA_PREFIX(v) VCPU_MAP_XSAVE_AREA(v)
+#define VCPU_UNMAP_XSAVE_AREA_PREFIX(v, x) VCPU_UNMAP_XSAVE_AREA(v, x)
+
 #endif /* __ASM_XSTATE_H */
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 3c9be271a3..2dd1699aba 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -177,14 +177,19 @@ static void setup_xstate_comp(uint16_t *comp_offsets,
  * It is the callers responsibility to ensure that there is xsave state to
  * serialise, and that the provided buffer is exactly the right size.
  */
-void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
+int expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
 {
     const struct xsave_struct *xstate = VCPU_MAP_XSAVE_AREA(v);
     const void *src;
     uint16_t comp_offsets[sizeof(xfeature_mask)*8];
-    u64 xstate_bv = xstate->xsave_hdr.xstate_bv;
+    u64 xstate_bv;
     u64 valid;
 
+    if ( !xstate )
+        return -ENOMEM;
+
+    xstate_bv = xstate->xsave_hdr.xstate_bv;
+
     /* Check there is state to serialise (i.e. at least an XSAVE_HDR) */
     BUG_ON(!v->arch.xcr0_accum);
     /* Check there is the correct room to decompress into. */
@@ -233,6 +238,8 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
 
  out:
     VCPU_UNMAP_XSAVE_AREA(v, xstate);
+
+    return 0;
 }
 
 /*
@@ -245,13 +252,16 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
  * It is the callers responsibility to ensure that the source buffer contains
  * xsave state, is uncompressed, and is exactly the right size.
  */
-void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
+int compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
 {
     struct xsave_struct *xstate = VCPU_MAP_XSAVE_AREA(v);
     void *dest;
     uint16_t comp_offsets[sizeof(xfeature_mask)*8];
     u64 xstate_bv, valid;
 
+    if ( !xstate )
+        return -ENOMEM;
+
     BUG_ON(!v->arch.xcr0_accum);
     BUG_ON(size != xstate_uncompressed_size(v->arch.xcr0_accum));
     ASSERT(!xsave_area_compressed(src));
@@ -302,6 +312,8 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
 
  out:
     VCPU_UNMAP_XSAVE_AREA(v, xstate);
+
+    return 0;
 }
 
 void xsave(const struct vcpu *v, struct xsave_struct *ptr, uint64_t mask)
-- 
2.56.0


