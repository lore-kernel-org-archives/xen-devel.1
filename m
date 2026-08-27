Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9B6C61DC6
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:22:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400927.1636611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvN-00080V-7L; Thu, 27 Aug 2026 15:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400927.1636611; Thu, 27 Aug 2026 15:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbvN-00080G-1c; Thu, 27 Aug 2026 15:21:53 +0000
Received: by outflank-mailman (input) for mailman id 1400927;
 Thu, 27 Aug 2026 15:21:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbvL-0007he-2e
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:21:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbvK-009ksf-Fq
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:21:50 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9055fd-2eae-0a2a0a5409dd-0a2a45029cdc-22
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:50 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90560e-6ca4-0a2a45020019-d1558029b852-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:21:50 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so11598645e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:21:50 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b4b2d6b30sm57441155e9.14.2026.08.27.08.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:21:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787844110; x=1788448910; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mh6VNmg6fph8ZjJKqYXDVKtLdFlz1wuNoXDYt9j8GKQ=;
        b=DnpVX3P76wt2iOMJbJSErFsdBM2y1dKvFPY8ScFla8646j5BkD4qNO3rPXVx9u3Lze
         Z2WX53S848g1NTg03NH9+ai12wChpmTzaRuVDgRWXngJ7XIsw3pBU83sp0R68uwLZqOy
         0QlfG8TOCU+vJ3Mcp/iHU+AE6cS4zl+MOkyb03L5Q5CYUClM92TyXRs/28TJIZxDg3nm
         TO8yD8MnoolPJTsPNasWL0uiWc9bTtRgnf0JgzsZ2OzHLUSO0VohkcByVu8Hx02wqw9B
         oUXLEDCBojWDvpCve4awpYZ9ycGMTUCB4XOd8dQ99NMi7hJ4vTZ8PWjaDIoRyoCqvsQ0
         lBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844110; x=1788448910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mh6VNmg6fph8ZjJKqYXDVKtLdFlz1wuNoXDYt9j8GKQ=;
        b=Wc6KMv0jfW8N8W2f8a8/NTawh8w9xunDjW4TMA3n4AMryMaOquxBPb6VHyk01IFaKv
         VmNj+HCMyoNIiSIfrZrgY5MIHF7igpTjeMbDglfRP5IqVTKqRGtIJUDojxh2tFZogiUo
         4uOQL6UCTrsOKInJTc6tfiVld/YtGH8s5YT/ZPZFqbozHR+FSe97jGFGrmVhEqL07tfD
         qUtUQlW91PmJAh8jixCSG+OLjgbOIZEpVBFzU8q1U22KOcvfNJZe+Gbu8E3TBH5AQr6A
         jck108EG4D5cXC/aWfUC8WaV6Mx+K/6klhgL4q+LAtzjdfO7mgydEAask+sxDzuWBcUD
         7HbA==
X-Gm-Message-State: AFuF++kiGl3+mA0/PPAJvpHsauzos2+jrG8wKeT1Dg0Y++hQx6aGIsFc
	C5IKQBW4Scc6w3uZc6MFpDXsPDg9h953SHRdxkgLTqc0oAvumb4TPoOq6UMsIA==
X-Gm-Gg: AR+sD11Dpb3YXtcLN0tC6TzWlc/E1GIIlpkhH9KRC7TD+Mwh8V3Kyr96ovL42btzWtn
	Bi+cHjzrlRGGrbHZHNhX/q1Am5Pu10uqU3YTaGls6hUsq40LRgRr5cCLctg6x9Eh+yWs/b/suNU
	rtBtcA+IYQvnaTlHthHLXwN3hmQEqwaDkmNHmaCfXhk4tsvMhApv34gcg/yDqiTx5DQe2mD2YwR
	2N03IiM+3l5G5FGx2OyWHiZtSFrrmA8CAZ7sNic+4Dc+qfg0qTi3E7+m15LQ56Ul6QsWftPB8MJ
	bWSYY7JHzY4eOzlYCUEFWDH/8QtvCRBGHCiesPjvVIcpDqdEnq6tiHlIAu7BspEqVVrkSkvPxu0
	lHu9SJ9mY7MCds9as1xHwitHj025XKWOqb6duWmTr5kke6jDy6eyvFUuhJxScp/mghFB/AdV1cB
	eXuL22VG/aLUmDF9vZ4KoTHWu+STsG16/NfWuwmoxcjDB7cM+0iqpdc5VLWuRZtzR5TmxK4+EJ4
	5cAGqxP2WdvwYYj89TDbM9aPW18WOEptlsoVdGVfi8=
X-Received: by 2002:a05:600c:c87:b0:499:d22a:8973 with SMTP id 5b1f17b1804b1-499dc6f47ccmr154953335e9.1.1787844109718;
        Thu, 27 Aug 2026 08:21:49 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 08/39] xen/riscv: introduce device-agnostic MMIO emulation dispatch
Date: Thu, 27 Aug 2026 17:20:52 +0200
Message-ID: <a74ff916f76fb95e1e44bfadd45fbc477df00c51.1787838835.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787844110-666B72AC-5A122C66/10/73395122804
X-purgate-type: spam
X-purgate-size: 11906

RISC-V guests can expose several virtual interrupt controllers at
distinct GPA ranges: vPLIC (hasn't been introduced yet) for legacy machines,
vAPLIC and vIMSIC for AIA-compliant ones (are being introduced in the follow
up patches). Routing MMIO faults via a per-device is_access() check in the
trap handler would couple it to every device it must serve, requiring a
new conditional branch in the fault path each time a new emulated device is
added.

Introduce a per-domain MMIO handler registration table, modeled
after the equivalent ARM framework, so that virtual devices
self-register their GPA ranges and read/write callbacks at domain
creation time. The MMIO fault path delegates to a single
try_handle_mmio() entry point and remains agnostic of which device
owns a particular address.

A subsequent patch wires this into the MMIO fault path in traps.c.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Drop copyright from mmio.c as it will go stale anyway as code moves
   around.
 - Drop the max_count parameter of domain_io_init() (MAX_IO_HANDLER is a
   global boundary) and embed the handler array directly in struct vmmio
   as struct mmio_handler handlers[MAX_IO_HANDLER].  This removes the
   xvzalloc_array() allocation, the max_num_entries field and
   domain_io_free() altogether; domain_io_init() consequently cannot fail
   any longer and now returns void. Note this goes slightly beyond the
   suggested variant in that max_num_entries is dropped as well, since
   ARRAY_SIZE(vmmio->handlers) serves the same purpose.
 - Drop the separate register_t argument of mmio_read_t/mmio_write_t;
   handlers now produce and consume the value through info->data.
   handle_read()/handle_write() are gone as a result, with
   try_handle_mmio() invoking ops->read()/ops->write() directly.
 - Turn mmio_read_t/mmio_write_t into function types rather than
   pointer-to-function types, so that pointer-ness is visible at the use
   sites in struct mmio_handler_ops. Constify the mmio_info_t * of the
   write callback, which has no reason to modify it any more.
 - register_mmio_handler() returns int instead of BUG_ON()ing on a full
   table: -ENOSPC now lets the caller fail domain creation. It also
   validates its inputs, rejecting a NULL ops (or one with a missing
   read/write callback) as well as zero-sized and address-wrapping
   regions with -EINVAL.
 - Guarantee the non-overlap property that cmp_mmio_handler() relies on:
   register_mmio_handler() checks the new region against both neighbours
   of its insertion slot and returns -EEXIST on overlap.
 - Replace the sort() call per registration with an insertion into the
   already sorted array: locate the slot and memmove() the tail up by
   one. sort(), swap_mmio_handler() and <xen/sort.h> are gone.
 - Extend cmp_mmio_handler()'s comment to state that it is a bsearch()
   comparator and to explain the key/elem asymmetry; document why the
   neighbours' addr + size cannot overflow.
 - Fix over-long lines and a mis-indented label.
---
---
 xen/arch/riscv/Makefile             |   1 +
 xen/arch/riscv/domain.c             |   3 +
 xen/arch/riscv/include/asm/domain.h |   3 +
 xen/arch/riscv/include/asm/mmio.h   |  63 ++++++++++
 xen/arch/riscv/mmio.c               | 176 ++++++++++++++++++++++++++++
 5 files changed, 246 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/mmio.h
 create mode 100644 xen/arch/riscv/mmio.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 3b948c11dd61..ce6410a299a4 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -14,6 +14,7 @@ obj-y += intc.o
 obj-y += irq.o
 obj-y += kernel.init.o
 obj-y += mm.o
+obj-y += mmio.o
 obj-y += p2m.o
 obj-y += paging.o
 obj-y += pt.o
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 57c37cb2dfc2..ec327a5e8a23 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -12,6 +12,7 @@
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/intc.h>
+#include <asm/mmio.h>
 #include <asm/riscv_encoding.h>
 #include <asm/vtimer.h>
 
@@ -316,6 +317,8 @@ int arch_domain_create(struct domain *d,
     if ( (rc = p2m_init(d, config)) != 0)
         goto fail;
 
+    domain_io_init(d);
+
     if ( (rc = domain_vintc_init(d)) )
         goto fail;
 
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index e035b33ddfdc..15e8fa19685e 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -9,6 +9,7 @@
 
 #include <asm/cpufeature.h>
 #include <asm/guest-layout.h>
+#include <asm/mmio.h>
 #include <asm/p2m.h>
 #include <asm/vtimer.h>
 
@@ -101,6 +102,8 @@ struct arch_domain {
     const unsigned long *isa;
 
     struct vintc *vintc;
+
+    struct vmmio vmmio;
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/mmio.h b/xen/arch/riscv/include/asm/mmio.h
new file mode 100644
index 000000000000..582969e5351b
--- /dev/null
+++ b/xen/arch/riscv/include/asm/mmio.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef RISCV_MMIO_H
+#define RISCV_MMIO_H
+
+#include <xen/lib.h>
+#include <xen/rwlock.h>
+
+struct domain;
+struct vcpu;
+
+#define MAX_IO_HANDLER  16
+
+typedef struct {
+    paddr_t gpa;
+    unsigned int len;  /* access width in bytes (1, 2, 4, 8) */
+    bool is_write;
+    /* store: value to write; load: value read (set by handler) */
+    register_t data;
+} mmio_info_t;
+
+enum io_state
+{
+    IO_ABORT,       /* The IO was handled and led to an abort. */
+    IO_HANDLED,     /* The IO was successfully handled. */
+    IO_UNHANDLED,   /* No handler found for the IO. */
+};
+
+typedef enum io_state (mmio_read_t)(struct vcpu *v, mmio_info_t *info);
+typedef enum io_state (mmio_write_t)(struct vcpu *v, const mmio_info_t *info);
+
+struct mmio_handler_ops {
+    mmio_read_t *read;
+    mmio_write_t *write;
+};
+
+struct mmio_handler {
+    paddr_t addr;
+    paddr_t size;
+    const struct mmio_handler_ops *ops;
+};
+
+struct vmmio {
+    unsigned int num_entries;
+    rwlock_t lock;
+    struct mmio_handler handlers[MAX_IO_HANDLER];
+};
+
+int do_mmio(mmio_info_t *info, paddr_t fault_addr, unsigned int len);
+int register_mmio_handler(struct domain *d,
+                          const struct mmio_handler_ops *ops,
+                          paddr_t addr, paddr_t size);
+void domain_io_init(struct domain *d);
+
+#endif /* RISCV_MMIO_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/mmio.c b/xen/arch/riscv/mmio.c
new file mode 100644
index 000000000000..d241ab5ea13d
--- /dev/null
+++ b/xen/arch/riscv/mmio.c
@@ -0,0 +1,176 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/bsearch.h>
+#include <xen/lib.h>
+#include <xen/rwlock.h>
+#include <xen/sched.h>
+#include <xen/string.h>
+
+#include <asm/current.h>
+#include <asm/mmio.h>
+
+/*
+ * bsearch() comparator: @key holds the address to look up in its addr field,
+ * @elem is an entry of vmmio->handlers. Relies on the regions not
+ * overlapping, which register_mmio_handler() enforces.
+ */
+static int cmp_mmio_handler(const void *key, const void *elem)
+{
+    const struct mmio_handler *handler0 = key;
+    const struct mmio_handler *handler1 = elem;
+
+    if ( handler0->addr < handler1->addr )
+        return -1;
+
+    if ( handler0->addr >= (handler1->addr + handler1->size) )
+        return 1;
+
+    return 0;
+}
+
+/*
+ * Return a copy of the matching handler rather than a pointer into
+ * vmmio->handlers: a concurrent register_mmio_handler() shifts entries
+ * up to keep the array sorted, so an escaped pointer could refer to a
+ * different (or torn) entry once the lock is dropped. The copy stays
+ * valid as the ops structures are never freed.
+ */
+static bool find_mmio_handler(struct domain *d, paddr_t gpa,
+                              struct mmio_handler *out)
+{
+    struct vmmio *vmmio = &d->arch.vmmio;
+    struct mmio_handler key = { .addr = gpa };
+    const struct mmio_handler *handler;
+
+    read_lock(&vmmio->lock);
+    handler = bsearch(&key, vmmio->handlers, vmmio->num_entries,
+                      sizeof(*handler), cmp_mmio_handler);
+    if ( handler )
+        *out = *handler;
+    read_unlock(&vmmio->lock);
+
+    return handler != NULL;
+}
+
+static enum io_state try_handle_mmio(mmio_info_t *info)
+{
+    struct vcpu *v = current;
+    struct mmio_handler handler = {};
+
+    if ( !find_mmio_handler(v->domain, info->gpa, &handler) )
+        return IO_UNHANDLED;
+
+    if ( info->is_write )
+        return handler.ops->write(v, info);
+    else
+        return handler.ops->read(v, info);
+}
+
+/*
+ * Check alignment and dispatch a decoded MMIO access to a registered
+ * handler. On success (0), info->data holds the read value for loads.
+ *
+ * There is no "retry" outcome to handle: find_mmio_handler() returns a
+ * copy of the matching handler taken under vmmio->lock and the ops
+ * structures are never freed, so the lookup result cannot go stale
+ * between finding the handler and invoking it.
+ */
+int do_mmio(mmio_info_t *info, paddr_t fault_addr, unsigned int len)
+{
+    /* Fault address should be aligned to length of MMIO */
+    if ( fault_addr & (len - 1) )
+        return -EIO;
+
+    info->gpa = fault_addr;
+    info->len = len;
+
+    switch ( try_handle_mmio(info) )
+    {
+    case IO_HANDLED:
+        return 0;
+
+    case IO_ABORT:
+        return -EIO;
+
+    default:
+        return -EOPNOTSUPP;
+    }
+}
+
+int register_mmio_handler(struct domain *d,
+                          const struct mmio_handler_ops *ops,
+                          paddr_t addr, paddr_t size)
+{
+    struct vmmio *vmmio = &d->arch.vmmio;
+    struct mmio_handler *handlers = vmmio->handlers;
+    paddr_t end = addr + size;
+    unsigned int i;
+    int rc = 0;
+    bool overlap;
+
+    if ( !ops || !ops->read || !ops->write || !size || end < addr )
+        return -EINVAL;
+
+    write_lock(&vmmio->lock);
+
+    if ( vmmio->num_entries >= ARRAY_SIZE(vmmio->handlers) )
+    {
+        rc = -ENOSPC;
+        goto out;
+    }
+
+    /*
+     * The array is kept sorted by base address, so rather than appending and
+     * re-sorting, find the slot the new region belongs to and shift the tail
+     * up by one.
+     */
+    for ( i = vmmio->num_entries;
+          i > 0 && handlers[i - 1].addr > addr;
+          i-- )
+        /* Nothing */;
+
+    /*
+     * Regions are required not to overlap; check both neighbours. Their
+     * addr + size cannot overflow, as such regions are rejected above when
+     * they get registered.
+     */
+    overlap = (i > 0 && handlers[i - 1].addr + handlers[i - 1].size > addr) ||
+              (i < vmmio->num_entries && end > handlers[i].addr);
+
+    if ( overlap )
+    {
+        rc = -EEXIST;
+        goto out;
+    }
+
+    memmove(&handlers[i + 1], &handlers[i],
+            (vmmio->num_entries - i) * sizeof(*handlers));
+
+    handlers[i] = (struct mmio_handler){
+        .addr = addr,
+        .size = size,
+        .ops = ops,
+    };
+
+    vmmio->num_entries++;
+
+ out:
+    write_unlock(&vmmio->lock);
+
+    return rc;
+}
+
+void domain_io_init(struct domain *d)
+{
+    rwlock_init(&d->arch.vmmio.lock);
+    d->arch.vmmio.num_entries = 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.55.0


