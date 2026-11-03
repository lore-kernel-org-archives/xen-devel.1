Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC05606A31B
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 23:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=umzSBLXU
Received: from list by lists.xenproject.org with outflank-mailman.1470791.1679424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONxe-0000pu-O1; Tue, 03 Nov 2026 23:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470791.1679424; Tue, 03 Nov 2026 23:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xONxe-0000mt-Fj; Tue, 03 Nov 2026 23:30:38 +0000
Received: by outflank-mailman (input) for mailman id 1470791;
 Tue, 03 Nov 2026 23:30:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xONxb-0000cJ-Sv
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 23:30:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONxb-0000000Cot6-2B2z;
 Tue, 03 Nov 2026 23:30:35 +0000
Received: from [2607:fb91:4c8c:bd3f:1da5:e92a:c5fb:865a]
 (helo=localhost.localdomain)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xONo7-0000000EMFa-43ya;
 Tue, 03 Nov 2026 23:20:48 +0000
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
	bh=HhSSqAUO6JoWEvu4Yjy41Bg2ZJEqbHPy2eEHgBHq04s=; b=umzSBLXUktyoPhdhok+4W6/JTU
	PIshuMwNJTTl8KgM7Gkcu57T32wVgNqXfsmP34T1k2ZDgjrZyMw7KwCHkmYOzjutFWNfAPzGVDBD2
	Ye+7zBnhfuc3HmyNImgw0LAIaiYXUaTrT9/9n9kqk98wdaoekW94B0W5b+rMQlYp9pzg=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v6 33/44] x86/hvm: move the emulator's operand caches behind the vCPU state window
Date: Tue,  3 Nov 2026 17:13:55 -0500
Message-ID: <20261103-asi-hvm-v6-33-59dbc5ce9615@xenproject.org>
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

The HVM emulator keeps two per-vCPU caches of guest data: the read cache
(struct hvmemul_cache), which records every guest-memory read made while
an instruction is emulated -- guest page-table entries, instruction
bytes and memory operands -- so that a re-execution observes the same
values, and the three MMIO caches, which hold the operand bytes of an
instruction's MMIO accesses.  Both are xvmalloc() allocations, from the
xmalloc pool on the xenheap, and so mapped in every context, the sparse
directmap view included.  Disabling the read cache when emulation
completes leaves its entries in place.

Put both in a domain-heap page of the vCPU's own, mapped for the life of
the vCPU at a new slot (index 7) of its state window: the read cache,
counts included, then the MMIO caches, 4032 bytes of the page.  As
"x86: move the saved register frame behind the vCPU state window" does
for the register frame, this applies to every HVM vCPU, whatever asi=
says; for a vCPU without per-vCPU page tables the window is in the
per-domain area that all its domain's vCPUs share, which only that
domain's page tables map.  The pointers in struct hvm_vcpu_io hold
window addresses.  hvmemul_cache_init() sets the page up through a
transient mapping, as the vCPU is still being built, and
hvmemul_cache_destroy(), now out of line, unmaps it before freeing it.

The emulator only ever works on the vCPU running, on its own page
tables, and reaches the caches through the window address;
hvmemul_find_mmio_cache() now asserts as much.  The read cache also has
users in other contexts: a debugger's guest page walk on a paused vCPU
(gdbsx, and the guest stack dump of the debug keys), which reads and
extends it if the vCPU was paused mid-emulation, and hvmemul_cancel(),
which disables it, on toolstack, VCPUOP_initialise and INIT/SIPI paths.
Its accessors therefore map the page transiently unless the vCPU is
running on its own page tables, as VCPU_MAP_REGS() does: a single page,
so no new failure paths.  They drop the mapping with
unmap_vcpu_state_page(), which also flushes this CPU's translation.
The read and write paths are split into an outer function, which checks
and maps the cache once, and a recursive inner one.

Cost: a page per HVM vCPU, where the caches took about 4KiB of the
xmalloc pool, and the emulator reaches them through a 4KiB mapping in
the per-domain area instead of the directmap.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v5:
- New in this version.

Notes for reviewers: the sizes before and after, on x86-64
(CONFIG_PAGING_LEVELS 4, MAX_INST_LEN 15).

                   before                    after
read cache ents    16*2*(4+1) + 15*(4+1)     (16*2 + 15) * (4+1)
                   = 235 (nents)             = 235 (HVMEMUL_CACHE_ENTS)
read cache bytes   8 + 235*16 = 3768         the same offsetof(), at 0
MMIO buffer bytes  64 (max_bytes)            64 (MMIO_CACHE_BYTES)
MMIO cache bytes   24 + 64 = 88, three       88 (MMIO_CACHE_SIZE), three

The page:

offset  bytes  contents
     0      8  num_ents, max_ents
     8   3760  ents[235], 16 bytes each
  3768     88  mmio_cache[0]: 24-byte header, buffer[64]
  3856     88  mmio_cache[1]
  3944     88  mmio_cache[2]
  4032     64  unused

The four old allocations together asked for 4032 bytes, the span the
page now uses.  The limits the code checks, max_ents (235) and space
(64), are unchanged.  The BUILD_BUG_ON() in hvmemul_cache_init() keeps
the end within the page.
---
 xen/arch/x86/domain.c                  |   2 +
 xen/arch/x86/hvm/emulate.c             | 196 +++++++++++++++++++------
 xen/arch/x86/include/asm/config.h      |   1 +
 xen/arch/x86/include/asm/hvm/emulate.h |   9 +-
 xen/arch/x86/include/asm/hvm/vcpu.h    |   7 +
 5 files changed, 165 insertions(+), 50 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 03f6572086..66d71ec41b 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -595,6 +595,8 @@ int arch_vcpu_create(struct vcpu *v)
         BUILD_BUG_ON(VCPU_STATE_IDX_N2VMCB >= VCPU_STATE_NR_PAGES);
         BUILD_BUG_ON(VCPU_STATE_IDX_VMX_MSR >= VCPU_STATE_NR_PAGES);
         BUILD_BUG_ON(VCPU_STATE_IDX_REGS >= VCPU_STATE_NR_PAGES);
+        BUILD_BUG_ON(VCPU_STATE_IDX_EMUL >= VCPU_STATE_NR_PAGES);
+        BUILD_BUG_ON(VCPU_STATE_IDX_EMUL == VCPU_STATE_IDX_REGS);
         /* Page tables only; torn down with the rest of the per-domain area. */
         rc = create_perdomain_mapping(v, VCPU_STATE_START(v),
                                       VCPU_STATE_NR_PAGES,
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index cd2831d34b..e2cf982c25 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -9,6 +9,7 @@
  *    Keir Fraser <keir@xen.org>
  */
 
+#include <xen/domain_page.h>
 #include <xen/init.h>
 #include <xen/iocap.h>
 #include <xen/ioreq.h>
@@ -56,6 +57,26 @@ struct hvmemul_cache
     } ents[];
 };
 
+/*
+ * AVX512F scatter/gather insns can access up to 16 independent linear
+ * addresses, up to 8 bytes size. Each such linear range can span a page
+ * boundary, i.e. may require two page walks.  Account for each insn byte
+ * individually, both for simplicity and to leave some slack space.
+ */
+#define HVMEMUL_CACHE_ENTS \
+    ((16 * 2 + MAX_INST_LEN) * (CONFIG_PAGING_LEVELS + 1))
+
+/* Operand bytes per MMIO cache: up to m512 or a tile row. */
+#define MMIO_CACHE_BYTES 64
+
+/* Layout of the caches' page: the read cache, then the MMIO caches. */
+#define MMIO_CACHE_SIZE                                                   \
+    ROUNDUP(offsetof(struct hvm_mmio_cache, buffer[MMIO_CACHE_BYTES]),    \
+            __alignof__(struct hvm_mmio_cache))
+#define EMUL_PAGE_MMIO_CACHE(i)                                           \
+    (ROUNDUP(offsetof(struct hvmemul_cache, ents[HVMEMUL_CACHE_ENTS]),    \
+             __alignof__(struct hvm_mmio_cache)) + (i) * MMIO_CACHE_SIZE)
+
 static void hvmtrace_io_assist(const ioreq_t *p)
 {
     unsigned int size, event;
@@ -1130,6 +1151,9 @@ static struct hvm_mmio_cache *hvmemul_find_mmio_cache(
     unsigned int i;
     struct hvm_mmio_cache *cache;
 
+    ASSERT(hvio == &current->arch.hvm.hvm_io);
+    ASSERT(this_cpu(pgtable_vcpu) == current);
+
     for ( i = 0; i < hvio->mmio_cache_count; i ++ )
     {
         cache = hvio->mmio_cache[i];
@@ -3057,77 +3081,133 @@ void hvm_dump_emulation_state(const char *loglvl, const char *prefix,
 
 int hvmemul_cache_init(struct vcpu *v)
 {
-    /*
-     * AVX512F scatter/gather insns can access up to 16 independent linear
-     * addresses, up to 8 bytes size. Each such linear range can span a page
-     * boundary, i.e. may require two page walks.
-     */
-    unsigned int nents = 16 * 2 * (CONFIG_PAGING_LEVELS + 1);
-    unsigned int i, max_bytes = 64;
+    struct hvm_vcpu_io *hvio = &v->arch.hvm.hvm_io;
+    struct page_info *pg = alloc_domheap_page(v->domain, MEMF_no_owner);
+    void *va = (void *)VCPU_STATE_ADDR(v, VCPU_STATE_IDX_EMUL), *p;
     struct hvmemul_cache *cache;
+    unsigned int i;
+    mfn_t mfn;
 
-    /*
-     * Account for each insn byte individually, both for simplicity and to
-     * leave some slack space.
-     */
-    nents += MAX_INST_LEN * (CONFIG_PAGING_LEVELS + 1);
+    BUILD_BUG_ON(EMUL_PAGE_MMIO_CACHE(ARRAY_SIZE(hvio->mmio_cache)) >
+                 PAGE_SIZE);
 
-    cache = xvmalloc_flex_struct(struct hvmemul_cache, ents, nents);
-    if ( !cache )
+    if ( !pg )
         return -ENOMEM;
 
-    /* Cache is disabled initially. */
-    cache->num_ents = nents + 1;
-    cache->max_ents = nents;
+    mfn = page_to_mfn(pg);
+    clear_domain_page(mfn);
 
-    v->arch.hvm.hvm_io.cache = cache;
+    /* v != current, so we can't use the vCPU state window. */
+    p = map_domain_page(mfn);
 
-    for ( i = 0; i < ARRAY_SIZE(v->arch.hvm.hvm_io.mmio_cache); ++i )
+    /* Cache is disabled initially. */
+    cache = p;
+    cache->num_ents = HVMEMUL_CACHE_ENTS + 1;
+    cache->max_ents = HVMEMUL_CACHE_ENTS;
+
+    for ( i = 0; i < ARRAY_SIZE(hvio->mmio_cache); ++i )
     {
-        v->arch.hvm.hvm_io.mmio_cache[i] =
-            xvmalloc_flex_struct(struct hvm_mmio_cache, buffer, max_bytes);
-        if ( !v->arch.hvm.hvm_io.mmio_cache[i] )
-            return -ENOMEM;
-        v->arch.hvm.hvm_io.mmio_cache[i]->space = max_bytes;
+        struct hvm_mmio_cache *mmio = p + EMUL_PAGE_MMIO_CACHE(i);
+
+        mmio->space = MMIO_CACHE_BYTES;
     }
 
+    unmap_domain_page(p);
+
+    populate_perdomain_mapping(v, (unsigned long)va, &mfn, 1,
+                               __PAGE_HYPERVISOR_RW);
+
+    hvio->emul_pg = pg;
+    hvio->cache = va;
+    for ( i = 0; i < ARRAY_SIZE(hvio->mmio_cache); ++i )
+        hvio->mmio_cache[i] = va + EMUL_PAGE_MMIO_CACHE(i);
+
     return 0;
 }
 
+void hvmemul_cache_destroy(struct vcpu *v)
+{
+    struct hvm_vcpu_io *hvio = &v->arch.hvm.hvm_io;
+    unsigned int i;
+
+    if ( !hvio->emul_pg )
+        return;
+
+    unmap_vcpu_state(v, VCPU_STATE_IDX_EMUL, 1);
+    free_domheap_page(hvio->emul_pg);
+    hvio->emul_pg = NULL;
+    hvio->cache = NULL;
+    for ( i = 0; i < ARRAY_SIZE(hvio->mmio_cache); ++i )
+        hvio->mmio_cache[i] = NULL;
+}
+
+/*
+ * The read cache of @v, for access from any context: the window address in
+ * struct hvm_vcpu_io where v runs here on its own page tables, a transient
+ * mapping of the page otherwise, and the NULL left there once the cache is
+ * destroyed.  v's page tables being loaded is not enough: while this CPU
+ * holds v's state lazily, an IPI syncing that state for another CPU can
+ * switch them away at any time.
+ */
+static struct hvmemul_cache *map_cache(const struct vcpu *v)
+{
+    const struct hvm_vcpu_io *hvio = &v->arch.hvm.hvm_io;
+
+    if ( !hvio->emul_pg || (v == current && this_cpu(pgtable_vcpu) == v) )
+        return hvio->cache;
+
+    /* The read cache is at the start of the page. */
+    return __map_domain_page(hvio->emul_pg);
+}
+
+static void unmap_cache(const struct vcpu *v,
+                        const struct hvmemul_cache *cache)
+{
+    if ( cache != v->arch.hvm.hvm_io.cache )
+        unmap_vcpu_state_page(cache);
+}
+
+#define HVMEMUL_MAP_CACHE(v) map_cache(v)
+
+/* Drops the mapping of a vCPU's read cache and nullifies its pointer. */
+#define HVMEMUL_UNMAP_CACHE(v, cache) do {  \
+    unmap_cache(v, cache);                  \
+    (cache) = NULL;                         \
+} while ( false )
+
 unsigned int hvmemul_cache_disable(struct vcpu *v)
 {
-    struct hvmemul_cache *cache = v->arch.hvm.hvm_io.cache;
+    struct hvmemul_cache *cache = HVMEMUL_MAP_CACHE(v);
     unsigned int token = cache->num_ents;
 
     cache->num_ents = cache->max_ents + 1;
 
+    HVMEMUL_UNMAP_CACHE(v, cache);
+
     return token;
 }
 
 void hvmemul_cache_restore(struct vcpu *v, unsigned int token)
 {
-    struct hvmemul_cache *cache = v->arch.hvm.hvm_io.cache;
+    struct hvmemul_cache *cache = HVMEMUL_MAP_CACHE(v);
 
     ASSERT(cache->num_ents > cache->max_ents);
     cache->num_ents = token;
+
+    HVMEMUL_UNMAP_CACHE(v, cache);
 }
 
-bool hvmemul_read_cache(const struct vcpu *v, paddr_t gpa,
-                        void *buffer, unsigned int size)
+static bool read_cache(const struct hvmemul_cache *cache, paddr_t gpa,
+                       void *buffer, unsigned int size)
 {
-    const struct hvmemul_cache *cache = v->arch.hvm.hvm_io.cache;
     unsigned int i;
 
-    /* Cache unavailable? */
-    if ( !is_hvm_vcpu(v) || cache->num_ents > cache->max_ents )
-        return false;
-
     while ( size > sizeof(cache->ents->data) )
     {
         i = gpa & (sizeof(cache->ents->data) - 1)
             ? -gpa & (sizeof(cache->ents->data) - 1)
             : sizeof(cache->ents->data);
-        if ( !hvmemul_read_cache(v, gpa, buffer, i) )
+        if ( !read_cache(cache, gpa, buffer, i) )
             return false;
         gpa += i;
         buffer += i;
@@ -3144,22 +3224,37 @@ bool hvmemul_read_cache(const struct vcpu *v, paddr_t gpa,
     return false;
 }
 
-void hvmemul_write_cache(const struct vcpu *v, paddr_t gpa,
-                         const void *buffer, unsigned int size)
+bool hvmemul_read_cache(const struct vcpu *v, paddr_t gpa,
+                        void *buffer, unsigned int size)
 {
-    struct hvmemul_cache *cache = v->arch.hvm.hvm_io.cache;
-    unsigned int i;
+    const struct hvmemul_cache *cache;
+    bool hit = false;
 
-    /* Cache unavailable? */
-    if ( !is_hvm_vcpu(v) || cache->num_ents > cache->max_ents )
-        return;
+    if ( !is_hvm_vcpu(v) )
+        return false;
+
+    cache = HVMEMUL_MAP_CACHE(v);
+
+    /* Cache available? */
+    if ( cache->num_ents <= cache->max_ents )
+        hit = read_cache(cache, gpa, buffer, size);
+
+    HVMEMUL_UNMAP_CACHE(v, cache);
+
+    return hit;
+}
+
+static void write_cache(const struct vcpu *v, struct hvmemul_cache *cache,
+                        paddr_t gpa, const void *buffer, unsigned int size)
+{
+    unsigned int i;
 
     while ( size > sizeof(cache->ents->data) )
     {
         i = gpa & (sizeof(cache->ents->data) - 1)
             ? -gpa & (sizeof(cache->ents->data) - 1)
             : sizeof(cache->ents->data);
-        hvmemul_write_cache(v, gpa, buffer, i);
+        write_cache(v, cache, gpa, buffer, i);
         gpa += i;
         buffer += i;
         size -= i;
@@ -3186,6 +3281,23 @@ void hvmemul_write_cache(const struct vcpu *v, paddr_t gpa,
     cache->num_ents = i + 1;
 }
 
+void hvmemul_write_cache(const struct vcpu *v, paddr_t gpa,
+                         const void *buffer, unsigned int size)
+{
+    struct hvmemul_cache *cache;
+
+    if ( !is_hvm_vcpu(v) )
+        return;
+
+    cache = HVMEMUL_MAP_CACHE(v);
+
+    /* Cache available? */
+    if ( cache->num_ents <= cache->max_ents )
+        write_cache(v, cache, gpa, buffer, size);
+
+    HVMEMUL_UNMAP_CACHE(v, cache);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index c8d4a8ddc7..5bd9970fce 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -312,6 +312,7 @@ extern unsigned long xen_phys_start;
 #define VCPU_STATE_IDX_N2VMCB    1
 #define VCPU_STATE_IDX_VMX_MSR   2
 #define VCPU_STATE_IDX_REGS      6
+#define VCPU_STATE_IDX_EMUL      7
 
 #define ELFSIZE 64
 
diff --git a/xen/arch/x86/include/asm/hvm/emulate.h b/xen/arch/x86/include/asm/hvm/emulate.h
index 178ac32e15..16491a92b1 100644
--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -117,14 +117,7 @@ int hvmemul_do_pio_buffer(uint16_t port,
  *   further re-execution.
  */
 int __must_check hvmemul_cache_init(struct vcpu *v);
-static inline void hvmemul_cache_destroy(struct vcpu *v)
-{
-    unsigned int i;
-
-    for ( i = 0; i < ARRAY_SIZE(v->arch.hvm.hvm_io.mmio_cache); ++i )
-        XVFREE(v->arch.hvm.hvm_io.mmio_cache[i]);
-    XVFREE(v->arch.hvm.hvm_io.cache);
-}
+void hvmemul_cache_destroy(struct vcpu *v);
 bool hvmemul_read_cache(const struct vcpu *v, paddr_t gpa,
                         void *buffer, unsigned int size);
 void hvmemul_write_cache(const struct vcpu *v, paddr_t gpa,
diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h b/xen/arch/x86/include/asm/hvm/vcpu.h
index 876c230784..ee7bc8be00 100644
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -46,6 +46,13 @@ struct hvm_vcpu_io {
     unsigned char mmio_insn[16];
     struct hvmemul_cache *cache;
 
+    /*
+     * The page holding the caches above, mapped in the vCPU's state window:
+     * mmio_cache[] and cache hold addresses in the window, for use while the
+     * vCPU's own page tables are loaded.
+     */
+    struct page_info *emul_pg;
+
     /*
      * For string instruction emulation we need to be able to signal a
      * necessary retry through other than function return codes.
-- 
2.56.0


