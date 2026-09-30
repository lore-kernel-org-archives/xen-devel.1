Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B15CA5FC7
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 16:20:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437476.1656396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx25-0006gT-7y; Wed, 30 Sep 2026 16:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437476.1656396; Wed, 30 Sep 2026 16:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBx25-0006gK-22; Wed, 30 Sep 2026 16:19:49 +0000
Received: by outflank-mailman (input) for mailman id 1437476;
 Wed, 30 Sep 2026 16:19:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBx22-0006O4-PV
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 16:19:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBx22-006NIu-6c
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 18:19:46 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd3692-2eae-0a2a0a5409dd-0a2a450ca994-40
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:46 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abd36a2-f479-0a2a450c0019-4a7de18dcecb-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 18:19:46 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e7d2bb404so9224985e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 09:19:46 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01eb60804sm2807245e9.1.2026.09.30.09.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:19:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790785186; x=1791389986; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSU4/LWkp/snZLor2J2IjSVQr3Wp7NAVAmray4t/CSM=;
        b=UPhVFWROGj1NfHIebfaaGcQFwkGYKsc7w7Z5b2BZK9ApLt2RyHBU4YpdI8ydwtIg/Z
         Ag62HTIyKxlht3D83X6hgKOGA0WRzO4SdS0DYw9ml9S6W1i2qXmXIcQn1mQK3GGqmsxp
         KnXiQ2+Fg28UWzsTB35CqsaqdYuGhGlNoZbKzhEytbZiLRmRUQ+rxbM3HxYNTNsKrU2I
         XJROUvybX4ciCxqnsjz/UDe2vzhhjNZy6PPdfeDlj7GoXZsnEVV88m3VXtf+aHl/By6g
         vvVzJZ+Id3YhqBmqrH3wQ/Tz9gPZ6JV4evkU/a2TRZkuNNIGyk1StSd8Lum8SmUHJr9U
         JQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785186; x=1791389986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zSU4/LWkp/snZLor2J2IjSVQr3Wp7NAVAmray4t/CSM=;
        b=YgLRemy9erTEhNw/GQzyX8iScXFphrq27nl3hYO393tUOPHqnsSeL2qGyvoRtPr9bs
         M0okfqB33r8xZ72BLTwcFpk4bwYoqInBvSkhUSWwvIN+HMUVftD6FnXEJhTOb5SYuYMd
         Rtk7JFAfKq1ZDPDdn0i5mlBZsmSMSjr4mlBFPtkjb1M7D4MdfWoX1BUUNqo6+q3UN0QT
         LFWcpSwt7K/deYJ4nfyL9zi99AFa6AXe67y4jlERGOMp69cWTl1jT3ucIIuhrLgeE0tK
         MKZadAcz7cIwUS+PD0dnCrVUYZKFK/f3ijiI86bK3SwtORsN/QJ3+w19QJNU1+5VvUo/
         QU9A==
X-Gm-Message-State: AFuF++nKnrPAPWOudAS+fdsHYN4KcIwgj33Tup5jHcjpAZLem/buO0m+
	NRlCyQXxShBRQI/5xXCliff9EHiflzjubvyymm1A0AA3zCwzpz1+qcZCwZnMaA==
X-Gm-Gg: AYBFou1lpcvGkRRjJuai3T8QKJTeUlFnm7uuBq4kNkP8TboBitASIubQXhEV3J5XGpv
	ttiI0TVKh6rnMec6yfiqzZ7mnRf9pbv2kNFkDtTAQ5YjfqTuKH6RPIlHoSqG9HVr8Bqh2U+Q40E
	tNKmLn8EuL0PxFDRC7x4UugWHqeG2YGJhWKMT6g31bBKtzinsHYqpWpANgLgeVQfFKNFYlvejoY
	QJ+JWnl45aObLK7M6A9QKLbZCS4HYOCdoLv+ITZ1/lHNALxlsLti258JGwQGTxJ0lOxMwkc1Ud1
	QFYKaxdDSJYpvg4TTLVGM/RD37swUdbxgF9J27vfbbnX92plyG7CrQG605rIjuSIP+COs9T+rjP
	WRhUnFbsecoPxNpmxPkvE07v3f5JhBzc6o7T/TVLDd0a7EyVMEZD6EKkWXnkO0zhR+w065Wdc9E
	KS8LWfR+bRz0Zqy078X2rcx6cadFE/IFoguufO3LqRp8YT6jzaLwVUZwmTKUO+UoxRF7V3a+/Vw
	ANb0Fx0PA5FahkDKYPtIoxFxAs5Zy2w2Gn22CAR
X-Received: by 2002:a7b:ca5a:0:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a01eb19ffdmr1883005e9.17.1790785185448;
        Wed, 30 Sep 2026 09:19:45 -0700 (PDT)
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
Subject: [PATCH v3 06/39] xen/riscv: introduce device-agnostic MMIO emulation dispatch
Date: Wed, 30 Sep 2026 18:18:48 +0200
Message-ID: <cafb356d9cc3148d74df846e08c4961da72bea0e.1790779209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1790785186-03CD3A5B-F6925B72/10/73395122804
X-purgate-type: spam
X-purgate-size: 12556

A RISC-V guest can be given several emulated devices at distinct GPA
ranges; the virtual interrupt controllers alone account for vPLIC on
legacy machines and vAPLIC together with vIMSIC on AIA-compliant ones.
Routing MMIO faults via a per-device is_access() check in the trap
handler would couple that handler to every device it must serve,
requiring a new conditional branch in the fault path for each emulated
device added.

Introduce a per-domain MMIO handler registration table, modeled
after the equivalent ARM framework, so that virtual devices
self-register their GPA ranges and read/write callbacks at domain
creation time. The MMIO fault path delegates to a single do_mmio()
entry point and remains agnostic of which device owns a particular
address.

Nothing registers a handler and do_mmio() has no callers yet, so this
patch is a no-op; the trap handler is left untouched.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
do_mmio() gets its first caller in "xen/riscv: add guest load emulation
for trapped MMIO accesses" in this series.
---
Changes in v3:
 - Update the commit message.
 - Capitalize the comments inside mmio_info_t and drop the list of access
   widths from the one on len, as it could go stale.
 - Drop the parentheses around the typedef names.
 - Reject an access width which isn't a power of 2 in do_mmio().
 - Fold the !size check of register_mmio_handler() into end <= addr.
 - Return -EADDRINUSE instead of -EEXIST for an overlapping region.
 - Drop setting d->arch.vmmio.num_entries to 0, as struct domain starts
   out zero-filled.
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
 xen/arch/riscv/mmio.c               | 175 ++++++++++++++++++++++++++++
 5 files changed, 245 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/mmio.h
 create mode 100644 xen/arch/riscv/mmio.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 665ec2693335..5454517724bd 100644
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
index d94652809e36..fd6229635627 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -12,6 +12,7 @@
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/intc.h>
+#include <asm/mmio.h>
 #include <asm/riscv_encoding.h>
 #include <asm/vtimer.h>
 
@@ -310,6 +311,8 @@ int arch_domain_create(struct domain *d,
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
index 000000000000..1bf48571a9f7
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
+    unsigned int len;  /* Access width in bytes */
+    bool is_write;
+    /* Store: value to write; load: value read (set by handler) */
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
+typedef enum io_state mmio_read_t(struct vcpu *v, mmio_info_t *info);
+typedef enum io_state mmio_write_t(struct vcpu *v, const mmio_info_t *info);
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
index 000000000000..cf739a790afc
--- /dev/null
+++ b/xen/arch/riscv/mmio.c
@@ -0,0 +1,175 @@
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
+    if ( (len & (len - 1)) || (fault_addr & (len - 1)) )
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
+    if ( !ops || !ops->read || !ops->write || end <= addr )
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
+        /* Nothing to do */;
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
+        rc = -EADDRINUSE;
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


