Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2519606A329
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 23:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=uCm6qzsi
Received: from list by lists.xenproject.org with outflank-mailman.1470799.1679483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONxj-000264-SC; Tue, 03 Nov 2026 23:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470799.1679483; Tue, 03 Nov 2026 23:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONxj-00024B-BK; Tue, 03 Nov 2026 23:30:43 +0000
Received: by outflank-mailman (input) for mailman id 1470799;
 Tue, 03 Nov 2026 23:30:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xONxc-0000d1-4Q
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:30:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONxb-0000000CotU-3ZsP;
 Tue, 03 Nov 2026 23:30:35 +0000
Received: from [2607:fb91:4c8c:bd3f:1da5:e92a:c5fb:865a]
 (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONo5-0000000EMFa-24Wc;
 Tue, 03 Nov 2026 23:20:45 +0000
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
	bh=0lX6CHwDNVccQVi6T81X3E5uhExKP3Yedzo3WsWaf6A=; b=uCm6qzsi7xypOqhnHV2zL8csxu
	yR57HCBK+VvVmaCED4p8Pp9r5Limx6YykPo5W7LPM87i24TLgBU0NSeGTPjCTCyKUy+kLpx/5ZNUL
	nHLqhOTjnYxiq0x01gxY08viKc3peNXTplMBzL27zNcOAdwqoVCMMx9VDs8CMLYdaPOU=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v6 30/44] x86/vmx: move the guest MSR load/save list off always-mapped memory
Date: Tue,  3 Nov 2026 17:13:52 -0500
Message-ID: <20261103-asi-hvm-v6-30-59dbc5ce9615@xenproject.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
References: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The guest MSR load/save list holds guest MSR values (SPEC_CTRL, LBR,
PT, vPMU global control, and EFER on hardware without dedicated
controls), but lives on the xenheap, where it stays reachable from
every context.  Move the page to the domain heap and map it at its
fixed slot in the owning vCPU's state window, so that under Address
Space Isolation it is only mapped while that vCPU's page tables are
loaded.  Hardware is unaffected: the VMCS MSR-area pointers hold the
physical address, now derived from the page rather than from
virt_to_maddr() on a directmap VA.

The host MSR load list is left on the xenheap: it holds Xen's own
exit-time values, not guest data, so relocating it would serve no
isolation purpose.

The window VA is only valid in the owning vCPU's context.  Almost all
accesses have v == current and keep going through vmx->msr_area
unchanged (the vmentry-path LBR fixups, the failed-vmentry dump, vPMU,
and the MSR intercepts).  The remote accessors -- vmx_add_msr() /
vmx_del_msr() from vCPU construction, policy updates and context
load, and single-entry reads/writes from the HVM context save/load
and get/set-reg paths, all of which already require the target vCPU
to be paused -- dispatch through a transient mapping of the page,
dropped with unmap_vcpu_state_page(), which also drops this CPU's
translations of it:

 * vmx_add_msr() and vmx_del_msr() map internally around their
   search/insert/remove.

 * vmx_read_guest_msr(), vmx_read_guest_loadonly_msr() and
   vmx_write_guest_msr() move out of line and do the same, via
   vmx_find_msr_in(), the existing lookup parameterised on the mapped
   area.  vmx_find_msr() itself is unchanged for its remaining
   callers, which all run in current context and dereference the
   returned pointer through the window.

vmx_destroy_vmcs() takes the page out of the window before freeing it,
with unmap_vcpu_state(): without per-vCPU page tables the window is in
the per-domain area that all its domain's vCPUs share, which outlives
a vCPU whose creation fails.

The new page pointer goes with the existing page_info pointers after
pi_desc rather than next to msr_area: struct pi_desc is 64-byte
aligned, so inserting eight bytes ahead of it would have added 56
bytes of padding, growing struct vmx_vcpu from 448 to 512 bytes and,
via the union in struct arch_vcpu, every struct vcpu by 64 bytes
(x86_64 defconfig).

Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- Map and unmap through VMX_MAP_MSR_AREA() and VMX_UNMAP_MSR_AREA(),
  which clears the pointer (George).

Changes in v4:
- New in this version.
---
 xen/arch/x86/hvm/vmx/vmcs.c             | 142 ++++++++++++++++++++++--
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  63 +++--------
 2 files changed, 147 insertions(+), 58 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 8ec7ae7403..592722f1ca 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1416,8 +1416,11 @@ static struct vmx_msr_entry *locate_msr_entry(
     return start;
 }
 
-struct vmx_msr_entry *vmx_find_msr(const struct vcpu *v, uint32_t msr,
-                                   enum vmx_msr_list_type type)
+/* As vmx_find_msr(), but reaching the guest MSR area through @area. */
+static struct vmx_msr_entry *vmx_find_msr_in(const struct vcpu *v,
+                                             struct vmx_msr_entry *area,
+                                             uint32_t msr,
+                                             enum vmx_msr_list_type type)
 {
     const struct vmx_vcpu *vmx = &v->arch.hvm.vmx;
     struct vmx_msr_entry *start = NULL, *ent, *end;
@@ -1435,11 +1438,11 @@ struct vmx_msr_entry *vmx_find_msr(const struct vcpu *v, uint32_t msr,
         break;
 
     case VMX_MSR_GUEST:
-        start    = vmx->msr_area;
+        start    = area;
         break;
 
     case VMX_MSR_GUEST_LOADONLY:
-        start    = vmx->msr_area;
+        start    = area;
         substart = subend;
         subend   = total;
         break;
@@ -1458,6 +1461,77 @@ struct vmx_msr_entry *vmx_find_msr(const struct vcpu *v, uint32_t msr,
     return ((ent < end) && (ent->index == msr)) ? ent : NULL;
 }
 
+struct vmx_msr_entry *vmx_find_msr(const struct vcpu *v, uint32_t msr,
+                                   enum vmx_msr_list_type type)
+{
+    ASSERT(v == current || type == VMX_MSR_HOST);
+
+    return vmx_find_msr_in(v, v->arch.hvm.vmx.msr_area, msr, type);
+}
+
+static struct vmx_msr_entry *vmx_msr_area_map(const struct vcpu *v)
+{
+    const struct vmx_vcpu *vmx = &v->arch.hvm.vmx;
+
+    if ( v == current || !vmx->msr_area )
+        return vmx->msr_area;
+
+    return map_domain_page(page_to_mfn(vmx->msr_area_pg));
+}
+
+static void vmx_msr_area_unmap(const struct vcpu *v,
+                               const struct vmx_msr_entry *area)
+{
+    if ( v != current && area )
+        unmap_vcpu_state_page(area);
+}
+
+#define VMX_MAP_MSR_AREA(v) vmx_msr_area_map(v)
+
+/* Drops the mapping of a guest MSR area and nullifies its pointer. */
+#define VMX_UNMAP_MSR_AREA(v, area) do {  \
+    vmx_msr_area_unmap(v, area);          \
+    (area) = NULL;                        \
+} while ( false )
+
+int vmx_read_guest_msr(const struct vcpu *v, uint32_t msr, uint64_t *val)
+{
+    struct vmx_msr_entry *area = VMX_MAP_MSR_AREA(v);
+    const struct vmx_msr_entry *ent =
+        area ? vmx_find_msr_in(v, area, msr, VMX_MSR_GUEST) : NULL;
+
+    *val = ent ? ent->data : 0;
+    VMX_UNMAP_MSR_AREA(v, area);
+
+    return ent ? 0 : -ESRCH;
+}
+
+int vmx_read_guest_loadonly_msr(const struct vcpu *v, uint32_t msr,
+                                uint64_t *val)
+{
+    struct vmx_msr_entry *area = VMX_MAP_MSR_AREA(v);
+    const struct vmx_msr_entry *ent =
+        area ? vmx_find_msr_in(v, area, msr, VMX_MSR_GUEST_LOADONLY) : NULL;
+
+    *val = ent ? ent->data : 0;
+    VMX_UNMAP_MSR_AREA(v, area);
+
+    return ent ? 0 : -ESRCH;
+}
+
+int vmx_write_guest_msr(struct vcpu *v, uint32_t msr, uint64_t val)
+{
+    struct vmx_msr_entry *area = VMX_MAP_MSR_AREA(v);
+    struct vmx_msr_entry *ent =
+        area ? vmx_find_msr_in(v, area, msr, VMX_MSR_GUEST) : NULL;
+
+    if ( ent )
+        ent->data = val;
+    VMX_UNMAP_MSR_AREA(v, area);
+
+    return ent ? 0 : -ESRCH;
+}
+
 int vmx_add_msr(struct vcpu *v, uint32_t msr, uint64_t val,
                 enum vmx_msr_list_type type)
 {
@@ -1503,13 +1577,38 @@ int vmx_add_msr(struct vcpu *v, uint32_t msr, uint64_t val,
     {
         paddr_t addr;
 
-        if ( (*ptr = alloc_xenheap_page()) == NULL )
+        if ( type == VMX_MSR_HOST )
         {
-            rc = -ENOMEM;
-            goto out;
+            if ( (*ptr = alloc_xenheap_page()) == NULL )
+            {
+                rc = -ENOMEM;
+                goto out;
+            }
+
+            addr = virt_to_maddr(*ptr);
         }
+        else
+        {
+            struct page_info *pg = alloc_domheap_page(v->domain,
+                                                      MEMF_no_owner);
+            mfn_t mfn;
 
-        addr = virt_to_maddr(*ptr);
+            if ( pg == NULL )
+            {
+                rc = -ENOMEM;
+                goto out;
+            }
+
+            mfn = page_to_mfn(pg);
+            clear_domain_page(mfn);
+            populate_perdomain_mapping(v,
+                                       VCPU_STATE_ADDR(v,
+                                                       VCPU_STATE_IDX_VMX_MSR),
+                                       &mfn, 1, __PAGE_HYPERVISOR_RW);
+            vmx->msr_area_pg = pg;
+            *ptr = (void *)VCPU_STATE_ADDR(v, VCPU_STATE_IDX_VMX_MSR);
+            addr = mfn_to_maddr(mfn);
+        }
 
         switch ( type )
         {
@@ -1525,7 +1624,7 @@ int vmx_add_msr(struct vcpu *v, uint32_t msr, uint64_t val,
         }
     }
 
-    start = *ptr;
+    start = type == VMX_MSR_HOST ? *ptr : VMX_MAP_MSR_AREA(v);
     end   = start + total;
     ent   = locate_msr_entry(start + substart, start + subend, msr);
 
@@ -1565,6 +1664,8 @@ int vmx_add_msr(struct vcpu *v, uint32_t msr, uint64_t val,
     rc = 0;
 
  out:
+    if ( type != VMX_MSR_HOST )
+        VMX_UNMAP_MSR_AREA(v, start);
     vmx_vmcs_exit(v);
 
     return rc;
@@ -1576,6 +1677,7 @@ int vmx_del_msr(struct vcpu *v, uint32_t msr, enum vmx_msr_list_type type)
     struct vmx_msr_entry *start = NULL, *ent, *end;
     unsigned int substart = 0, subend = vmx->msr_save_count;
     unsigned int total = vmx->msr_load_count;
+    int rc = 0;
 
     ASSERT(v == current || !vcpu_runnable(v));
 
@@ -1605,11 +1707,17 @@ int vmx_del_msr(struct vcpu *v, uint32_t msr, enum vmx_msr_list_type type)
     if ( !start )
         return -ESRCH;
 
+    if ( type != VMX_MSR_HOST )
+        start = VMX_MAP_MSR_AREA(v);
+
     end = start + total;
     ent = locate_msr_entry(start + substart, start + subend, msr);
 
     if ( (ent == end) || (ent->index != msr) )
-        return -ESRCH;
+    {
+        rc = -ESRCH;
+        goto out;
+    }
 
     memmove(ent, ent + 1, sizeof(*ent) * (end - ent - 1));
 
@@ -1632,7 +1740,11 @@ int vmx_del_msr(struct vcpu *v, uint32_t msr, enum vmx_msr_list_type type)
 
     vmx_vmcs_exit(v);
 
-    return 0;
+ out:
+    if ( type != VMX_MSR_HOST )
+        VMX_UNMAP_MSR_AREA(v, start);
+
+    return rc;
 }
 
 void vmx_set_eoi_exit_bitmap(struct vcpu *v, u8 vector)
@@ -1829,7 +1941,13 @@ void vmx_destroy_vmcs(struct vcpu *v)
     vmx_free_vmcs(vmx->vmcs_pa);
 
     free_xenheap_page(v->arch.hvm.vmx.host_msr_area);
-    free_xenheap_page(v->arch.hvm.vmx.msr_area);
+    if ( v->arch.hvm.vmx.msr_area_pg )
+    {
+        unmap_vcpu_state(v, VCPU_STATE_IDX_VMX_MSR, 1);
+        free_domheap_page(v->arch.hvm.vmx.msr_area_pg);
+        v->arch.hvm.vmx.msr_area_pg = NULL;
+        v->arch.hvm.vmx.msr_area = NULL;
+    }
     free_xenheap_page(v->arch.hvm.vmx.msr_bitmap);
 }
 
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index d0716e97d2..e5730780e2 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -140,6 +140,10 @@ struct vmx_vcpu {
      * context.  However, the data can be modified by toolstack/migration
      * actions.  Remote access is only permitted for paused vcpus, and is
      * protected under the domctl lock.
+     *
+     * The guest list is a domain-heap page (msr_area_pg, below) mapped at a
+     * fixed slot in the owning vCPU's state window: msr_area holds that
+     * window VA, which is only valid in the owning vCPU's context.
      */
     struct vmx_msr_entry *msr_area;
     struct vmx_msr_entry *host_msr_area;
@@ -185,6 +189,9 @@ struct vmx_vcpu {
 
     struct page_info     *pml_pg;
 
+    /* Backing page of msr_area; see the comment there. */
+    struct page_info     *msr_area_pg;
+
     /* Bitmask of trapped CR4 bits. */
     unsigned long        cr4_host_mask;
 
@@ -669,55 +676,19 @@ static inline int vmx_add_host_load_msr(struct vcpu *v, uint32_t msr,
     return vmx_add_msr(v, msr, val, VMX_MSR_HOST);
 }
 
+/*
+ * Look an MSR up in the guest or host list of @v.  The returned pointer
+ * reaches the guest lists through the vCPU state window, so for those it
+ * is only valid (and the call only permitted) in current context; the
+ * single-entry accessors below handle paused remote vCPUs.
+ */
 struct vmx_msr_entry *vmx_find_msr(const struct vcpu *v, uint32_t msr,
                                    enum vmx_msr_list_type type);
 
-static inline int vmx_read_guest_msr(const struct vcpu *v, uint32_t msr,
-                                     uint64_t *val)
-{
-    const struct vmx_msr_entry *ent = vmx_find_msr(v, msr, VMX_MSR_GUEST);
-
-    if ( !ent )
-    {
-        *val = 0;
-        return -ESRCH;
-    }
-
-    *val = ent->data;
-
-    return 0;
-}
-
-static inline int vmx_read_guest_loadonly_msr(
-    const struct vcpu *v, uint32_t msr, uint64_t *val)
-{
-    const struct vmx_msr_entry *ent =
-        vmx_find_msr(v, msr, VMX_MSR_GUEST_LOADONLY);
-
-    if ( !ent )
-    {
-        *val = 0;
-        return -ESRCH;
-    }
-
-    *val = ent->data;
-
-    return 0;
-}
-
-static inline int vmx_write_guest_msr(struct vcpu *v, uint32_t msr,
-                                      uint64_t val)
-{
-    struct vmx_msr_entry *ent = vmx_find_msr(v, msr, VMX_MSR_GUEST);
-
-    if ( !ent )
-        return -ESRCH;
-
-    ent->data = val;
-
-    return 0;
-}
-
+int vmx_read_guest_msr(const struct vcpu *v, uint32_t msr, uint64_t *val);
+int vmx_read_guest_loadonly_msr(const struct vcpu *v, uint32_t msr,
+                                uint64_t *val);
+int vmx_write_guest_msr(struct vcpu *v, uint32_t msr, uint64_t val);
 
 /* MSR intercept bitmap infrastructure. */
 enum vmx_msr_intercept_type {
-- 
2.56.0


