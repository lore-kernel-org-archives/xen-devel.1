Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5F5606A325
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 21:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=GbllUmmW
Received: from list by lists.xenproject.org with outflank-mailman.1497133.1695567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9iT-0007H5-No; Thu, 19 Nov 2026 21:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497133.1695567; Thu, 19 Nov 2026 21:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU9iR-000775-I8; Thu, 19 Nov 2026 21:30:47 +0000
Received: by outflank-mailman (input) for mailman id 1497133;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-0001Dg-Mp
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 21:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9hz-00000006tIm-0w8g;
 Thu, 19 Nov 2026 21:30:19 +0000
Received: from [217.155.165.12] (helo=Georges-MacBook-Pro-2.tail87ea19.ts.net)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xU9Mw-0000000CVBH-20wh;
 Thu, 19 Nov 2026 21:08:34 +0000
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
	bh=Soc8NB4lvXkdupVTEB5EOLyLQSbxZ3jeOfxme/bIcNg=; b=GbllUmmWHScCsRTJfUEzeSVfJa
	nRgjDrL/LqZNUq4nTasncU0e8gh6EkIPfw4kcXRWVabYw4GpS+lZJDlBbzHoemya8iOYlogzhHFFj
	9/RGCoHkrFJHpAEoJVvNsG2HTS1Ut1YUS5uF1gfR50EKHy0Wfs7t8FIfKJXickosyJL0=;
From: George Dunlap <gwd@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 45/50] xen/smp: introduce by-value payloads for call-function IPIs
Date: Thu, 19 Nov 2026 21:07:36 +0000
Message-ID: <20261119-asi-hvm-v7-45-6551b6d5c879@xenproject.org>
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

Per-CPU stack mappings, to come as part of Address Space Isolation,
give some contexts page-tables which map only the stack of the CPU
they run on.  A CPU in such a context cannot reach another CPU's
stack, so a call-function callee cannot dereference a pointer into the
initiator's stack frame, however long that frame stays alive.
on_selected_cpus() passes @info as an opaque pointer, and a number of
callers point it at a local variable; those payloads need a globally
reachable home.

The in-tree callers are correct today.  The @wait == 1 ones hold their
frame across the call by definition, and every @wait == 0 one keeps
its frame alive for as long as the callees use the payload - by
spinning on its own completion protocol, or by never returning.  But
the API itself imposes no lifetime rule: with @wait == 0 the callee
acknowledges the IPI before invoking @func, so nothing stops a future
caller from unwinding while a callee still holds the pointer.  The
new API closes off that possible misuse as well.

Add on_selected_cpus_data() and on_selected_cpus_data_inout(), which
take an additional @size and pass the payload by value: @size bytes
are copied into a bounce buffer within the (call_lock-serialised,
statically allocated) call_data, and callees receive a pointer to that
copy.  The two differ in the payload's direction:

 * on_selected_cpus_data(): IN only, with either @wait.  It copies
   nothing back.

   With @wait == 1, callees run on the shared bounce copy directly -
   the buffer cannot be reused while the initiator holds call_lock.
   In debug builds the initiator checks, once every callee has
   acknowledged, that the copy still matches the caller's object.  A
   callee which writes an IN payload means that its caller chose the
   wrong call; in a release build the result is lost, nothing worse,
   so the check is an ASSERT().

   With @wait == 0, each callee copies the payload to a private buffer
   strictly before clearing its bit in call_data.selected.  The
   initiator spins on that mask (even for @wait == 0) before releasing
   call_lock, so every callee's copy completes before the slot can be
   reused, and after the ACK a callee only touches its private copy:
   payload lifetime is independent of the caller's frame by
   construction.

 * on_selected_cpus_data_inout(): IN/OUT, always synchronous, as an
   asynchronous call could not return results.  Callees run on the
   shared bounce copy, and its final contents are copied back to the
   caller's object before return.  OUT parameters and atomic RMW
   payload fields behave exactly as with a plain pointer today.

Both take a plain pointer, even for IN only: their shared
implementation copies from and, for IN/OUT, back to the caller's object
through that one pointer, rather than through two pointers to the same
object.

The initiator also issues an smp_rmb() between observing the final ACK
and its subsequent reads.  This orders the copy-back and the debug
check after the ACK-observing loads on architectures with relaxed
load-load ordering, and equally covers the pattern of a caller reading
callee-written data through a by-pointer @info after return.

Interior pointers are copied as-is, so anything a callee dereferences
through them must be globally reachable; this, the size cap and the
16-byte alignment cap (from the callee-side private copy) are spelled
out at the declaration.  The typed wrappers, on_selected_cpus_obj()
and on_selected_cpus_obj_inout(), infer the size from the pointed-to
type and turn an oversized or over-aligned payload into a build
failure.

CALLFUNC_DATA_MAX is 192 bytes: the largest in-tree by-value payload is
struct xen_mc_msrinject (144 bytes), followed by struct hw_residencies
(112).  Note that no payload embeds a cpumask_t, keeping the buffer
size independent of CONFIG_NR_CPUS.

on_selected_cpus() shares their implementation, a static
_on_selected_cpus(), and passes its pointer through as before.
smp_call_function() and on_each_cpu() get no by-value variants: none
of their callers passes a pointer into its stack.

Apart from the smp_rmb(), a compiler barrier on x86, no functional
change: nothing calls the new functions yet.

Groundwork for per-CPU stack mappings, which take away a CPU's access
to other CPUs' stacks: besides get_cpu_current(), cross-CPU rendezvous
and call-function payloads are what reads another CPU's stack at run
time.

Assisted-by: Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
Signed-off-by: George Dunlap <gwd@xenproject.org>
---
Changes in v7:
- New in this version.
---
 xen/common/smp.c      | 89 ++++++++++++++++++++++++++++++++++++++++++-
 xen/include/xen/smp.h | 66 +++++++++++++++++++++++++++++++-
 2 files changed, 152 insertions(+), 3 deletions(-)

diff --git a/xen/common/smp.c b/xen/common/smp.c
index a011f541f1..eb419a3aeb 100644
--- a/xen/common/smp.c
+++ b/xen/common/smp.c
@@ -18,8 +18,10 @@
 
 #include <asm/hardirq.h>
 #include <asm/processor.h>
+#include <xen/cache.h>
 #include <xen/spinlock.h>
 #include <xen/smp.h>
+#include <xen/string.h>
 
 /*
  * Structure and data for smp_call_function()/on_selected_cpus().
@@ -29,7 +31,10 @@ static struct call_data_struct {
     void (*func) (void *info);
     void *info;
     int wait;
+    unsigned int size;
     cpumask_t selected;
+    /* Bounce buffer for payloads passed by value (@size != 0). */
+    uint8_t buf[CALLFUNC_DATA_MAX] __aligned(SMP_CACHE_BYTES);
 } call_data;
 
 void smp_call_function(
@@ -44,14 +49,24 @@ void smp_call_function(
     on_selected_cpus(&allbutself, func, info, wait);
 }
 
-void on_selected_cpus(
+/*
+ * The by-pointer and by-value calls in one.  By pointer (@size == 0), @func
+ * gets @info itself.  By value, @func gets a copy of the @size bytes at
+ * @info, made under call_lock; with @copy_back, a synchronous call copies
+ * the results back to @info before returning.
+ */
+static void _on_selected_cpus(
     const cpumask_t *selected,
     void (*func) (void *info),
     void *info,
+    unsigned int size,
+    bool copy_back,
     int wait)
 {
     ASSERT(local_irq_is_enabled());
     ASSERT(cpumask_subset(selected, &cpu_online_map));
+    BUG_ON(size > CALLFUNC_DATA_MAX);
+    BUG_ON(size && !info);
 
     spin_lock(&call_lock);
 
@@ -61,18 +76,74 @@ void on_selected_cpus(
         goto out;
 
     call_data.func = func;
-    call_data.info = info;
     call_data.wait = wait;
+    call_data.size = size;
+    if ( size )
+    {
+        memcpy(call_data.buf, info, size);
+        call_data.info = call_data.buf;
+    }
+    else
+        call_data.info = info;
 
     smp_send_call_function_mask(&call_data.selected);
 
     while ( !cpumask_empty(&call_data.selected) )
         cpu_relax();
 
+    /*
+     * Order the loads which observed the ACKs before reads of what the
+     * callees wrote: the copy-back or check below, and the caller's own
+     * reads through a by-pointer @info.
+     */
+    smp_rmb();
+
+    /*
+     * With @wait == 1 the callees operated directly on the bounce buffer
+     * (which cannot be reused while call_lock is held): propagate their
+     * results back into the caller's object, or check that none of them
+     * wrote an IN-only payload.
+     */
+    if ( size && wait )
+    {
+        if ( copy_back )
+            memcpy(info, call_data.buf, size);
+        else
+            ASSERT(!memcmp(call_data.buf, info, size));
+    }
+
 out:
     spin_unlock(&call_lock);
 }
 
+void on_selected_cpus(
+    const cpumask_t *selected,
+    void (*func) (void *info),
+    void *info,
+    int wait)
+{
+    _on_selected_cpus(selected, func, info, 0, false, wait);
+}
+
+void on_selected_cpus_data(
+    const cpumask_t *selected,
+    void (*func) (void *info),
+    void *in,
+    unsigned int size,
+    int wait)
+{
+    _on_selected_cpus(selected, func, in, size, false, wait);
+}
+
+void on_selected_cpus_data_inout(
+    const cpumask_t *selected,
+    void (*func) (void *info),
+    void *inout,
+    unsigned int size)
+{
+    _on_selected_cpus(selected, func, inout, size, true, 1);
+}
+
 void smp_call_function_interrupt(void)
 {
     void (*func)(void *info) = call_data.func;
@@ -94,6 +165,20 @@ void smp_call_function_interrupt(void)
         smp_mb();
         cpumask_clear_cpu(cpu, &call_data.selected);
     }
+    else if ( call_data.size )
+    {
+        /*
+         * Asynchronous call with a by-value payload: copy it before the ACK,
+         * after which the initiator may return and the buffer be reused.
+         */
+        uint8_t buf[CALLFUNC_DATA_MAX] __aligned(16);
+        unsigned int size = call_data.size;
+
+        memcpy(buf, call_data.buf, size);
+        smp_mb();
+        cpumask_clear_cpu(cpu, &call_data.selected);
+        (*func)(buf);
+    }
     else
     {
         smp_mb();
diff --git a/xen/include/xen/smp.h b/xen/include/xen/smp.h
index 2ca9ff1bfc..73bf7075d6 100644
--- a/xen/include/xen/smp.h
+++ b/xen/include/xen/smp.h
@@ -1,6 +1,8 @@
 #ifndef __XEN_SMP_H__
 #define __XEN_SMP_H__
 
+#include <xen/macros.h>
+
 #include <asm/smp.h>
 
 #ifndef cpu_is_offline
@@ -36,7 +38,7 @@ extern void smp_call_function(
     void *info,
     int wait);
 
-/* 
+/*
  * Call a function on a selection of processors
  */
 extern void on_selected_cpus(
@@ -45,6 +47,68 @@ extern void on_selected_cpus(
     void *info,
     int wait);
 
+/*
+ * Maximum size of a by-value payload.  Objects whose size scales with the
+ * configuration (such as a cpumask_t at large NR_CPUS) must not be passed by
+ * value.  Payloads must not require alignment beyond 16 bytes (the
+ * callee-side copy's alignment); the _obj() wrappers enforce both bounds at
+ * build time.
+ */
+#define CALLFUNC_DATA_MAX 192
+
+/*
+ * Call a function on a selection of processors, passing the payload by
+ * value: @size bytes at @in are copied into a global bounce buffer
+ * under the call lock, and @func is invoked with a pointer to that copy.
+ * Use this whenever the payload would otherwise live on the caller's
+ * stack, which other CPUs need not be able to reach.
+ *
+ * The payload is IN only: nothing is copied back, and @func must not
+ * write it.  With @wait == 1 all callees share the (locked) bounce buffer,
+ * and debug builds check that it is unchanged on return.  With @wait == 0
+ * each callee consumes a private copy before acknowledging, making payload
+ * lifetime independent of the caller's frame.
+ *
+ * Interior pointers within the payload are copied as-is: whatever a callee
+ * dereferences through them must itself be globally reachable (not
+ * stack-allocated).
+ */
+extern void on_selected_cpus_data(
+    const cpumask_t *selected,
+    void (*func) (void *info),
+    void *in,
+    unsigned int size,
+    int wait);
+
+/*
+ * As on_selected_cpus_data(), for a payload which @func writes results to
+ * (IN/OUT).  The call is synchronous, since an asynchronous one could not
+ * return results: all callees share the bounce buffer, and its final
+ * contents are copied back to @inout before return, so OUT parameters and
+ * atomic read-modify-write payload fields keep working.
+ */
+extern void on_selected_cpus_data_inout(
+    const cpumask_t *selected,
+    void (*func) (void *info),
+    void *inout,
+    unsigned int size);
+
+/*
+ * Typed convenience wrappers: pass the object @objp points at by value,
+ * with the size inferred and bounds-checked at build time.
+ */
+#define on_selected_cpus_obj(mask, func, objp, wait) ({                 \
+    BUILD_BUG_ON(sizeof(*(objp)) > CALLFUNC_DATA_MAX);                  \
+    BUILD_BUG_ON(alignof(*(objp)) > 16);                                \
+    on_selected_cpus_data(mask, func, objp, sizeof(*(objp)), wait);     \
+})
+
+#define on_selected_cpus_obj_inout(mask, func, objp) ({                 \
+    BUILD_BUG_ON(sizeof(*(objp)) > CALLFUNC_DATA_MAX);                  \
+    BUILD_BUG_ON(alignof(*(objp)) > 16);                                \
+    on_selected_cpus_data_inout(mask, func, objp, sizeof(*(objp)));     \
+})
+
 /*
  * Mark the boot cpu "online" so that it can call console drivers in
  * printk() and can access its per-cpu storage.
-- 
2.56.0


