Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37BF606A333
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SkObN6je
Received: from list by lists.xenproject.org with outflank-mailman.1487716.1689991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWf-0001eU-8c; Fri, 13 Nov 2026 15:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487716.1689991; Fri, 13 Nov 2026 15:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRtWf-0001eH-3Z; Fri, 13 Nov 2026 15:49:17 +0000
Received: by outflank-mailman (input) for mailman id 1487716;
 Fri, 13 Nov 2026 15:49:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRtWd-00019E-43
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 15:49:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRtWc-003hNe-HJ
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 16:49:14 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af73173-e002-0a2a0a5209dd-0a2a4507e76c-16
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:14 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af7317a-b4ea-0a2a45070019-d155802ed12a-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 16:49:14 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so16139665e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 07:49:14 -0800 (PST)
Received: from fedora (user-109-243-65-71.play-internet.pl. [109.243.65.71])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c0e0dsm5786493f8f.15.2026.11.13.07.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2026 07:49:13 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794584954; x=1795189754; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AremKgn1FhHYbDhXuPvIogsSMm8N9/fPq/SInqwOsDw=;
        b=SkObN6jeelcRuqpdTd4Gs/jWUtc7QEkEkQQHH0G7JCeBIV0boIqg5Hr/p7ZuapXwaZ
         K3zehrbEJN7bqmhR99or2gdVTFDXqxJg2C0l+SLgWgFRs/Agn2la1BZexhiH55/j/R6P
         ypRcfefiNIFBY1FIlk5biJkR186RLuFf1Ye7tJSMwv8Nejr81Wo427zHaEbavE2XSeuU
         82imvomsHh9g/CfX7UavA0EMSjIZI9saIamuPH48mhe4fOhFoQLzWnnWWSxlVyB5bUoX
         Kaxkx5VaxXYdA2ThWvmVTt4W9YbP/wUg7E4nItIB+w4pZhT3u3/2jF5lNuBukl3HQs43
         gzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584954; x=1795189754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AremKgn1FhHYbDhXuPvIogsSMm8N9/fPq/SInqwOsDw=;
        b=B+/hBvRbjK2gsg+0BXSSmMSr6o4wt/dJTTgRYee6dM05J2NnMLZ4Pbo4CBYNdc/hp+
         ktqglgHXhaGw1uwQ8gsDFt04PZTV9fHu7QWI1fLR92tPkm7A+FRLCH/+NnB9vrGM/hTS
         yN5Ry2KB6jtxF3X9Cju5jxLaAX6nSSs7zvjszEPAiM4OjkPHQoUZT0B5+roYew8nFReh
         QlZg3utGpSrAWirXu4/3XV1/PAwTJ6ruzBeSWPvhB5E2YAN0KPIYMFTBItIG0t/4VTuw
         F+Y30Sle2rAX8ec5fa40M4zxYqS0o3Kziop5gCPvte6MyxmcqqNqOiOozg8GSueaRPcl
         oAtg==
X-Gm-Message-State: APuU4Z+UdTrzWtdmzntguKOoYlD27ddmrGlYiRVphmAMhIp9C9ja6AJw
	YQXtsMkQaF501DtLlOTxYYYR4aH7H6THT30ZuL33oFvO9RefUCBfcxgJRSoehA==
X-Gm-Gg: AYBFou30w+iCPpLGvgb9UraGFOdr2+hzj61NRpBr67u1DpDb6JOZzE2/WyZ1fK99gHs
	8un2+2ItfjsHnm2SHG6COJa/mt8OztSZb6esKIgR1M4aKhYiClqwtSz6nyNXqWgysdj1FriizMY
	22mBP8kBNiM/+EFR23m1sHIi1rHb7qVNvaIRAXlZXXw3KRPXsSx+TRIKdvbIwIT0fR8OVU6/Vt/
	nKPIpI4FhYoKtNy4Azm5/1yCoXusZF/CEMwybn6Lr+6Ng+hDVPqrLykIF76IocYeITZ+AWhIfME
	ZFNVp4a6KNITiimpuJ/c4mMzkvLPGaTfLxlILzyGzVrZp7xTuDzSQrhfkMWKiPLvTUhu1Fb0gki
	dLlOnMkF1xl3K3FdzCH0fSqf5YFMTR3mfouWlK/U6y3NPcX4muwOPyVYnKni126xPEjuuH9ePgG
	MZ3vgPLxqbJ1CGvgCBIe9gfkuUXoy6DP5z6uGBB5CaxEcDCqb2+KIDh8tpntfYo4OfgqVBmwwJQ
	984gTR9M7TiTOztSFX4tjZCa85aqc/QZ4vkCsMJmcen2TRiDLsq+sKgDPG+L/WHuv2uVmlIUpqQ
	aDKTNsXfn1kJOREgpM2E0qiHLplZvsRMD91d3ghI3wEm+VTnVz5q0w+S8KE/Khyh8IYd
X-Received: by 2002:a05:600c:3110:b0:4bb:5df4:685b with SMTP id 5b1f17b1804b1-4bb5df46970mr21946165e9.23.1794584953757;
        Fri, 13 Nov 2026 07:49:13 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 07/42] xen/riscv: introduce device-agnostic MMIO emulation dispatch
Date: Fri, 13 Nov 2026 16:48:28 +0100
Message-ID: <3fad8494f657cf24524befaff9d593c4fbeea515.1794562488.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794562488.git.oleksii.kurochko@gmail.com>
References: <cover.1794562488.git.oleksii.kurochko@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1794584954-A44CBAE4-70CD5C50/10/73395122804
X-purgate-type: spam
X-purgate-size: 13707
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
Changes in v4:
 - Put the opening brace of enum io_state on the same line as the
   enum's name.
 - Drop the redundant else in try_handle_mmio().
 - Allocate struct vmmio dynamically and make its definition, together
   with MAX_IO_HANDLER and struct mmio_handler, private to mmio.c, so
   that <asm/domain.h> doesn't need <asm/mmio.h> any more. As a result,
   domain_io_init() can fail again and domain_io_free() is reintroduced.
 - Name the domain parameter of find_mmio_handler() currd (and constify
   it) and the vCPU variable of try_handle_mmio() curr, as both always
   refer to current.
 - Drop the NULL check of ops and turn the checks of its callbacks into
   an ASSERT(), keeping -EINVAL for an empty or wrapping region.
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
 xen/arch/riscv/domain.c             |   6 +
 xen/arch/riscv/include/asm/domain.h |   2 +
 xen/arch/riscv/include/asm/mmio.h   |  48 +++++++
 xen/arch/riscv/mmio.c               | 205 ++++++++++++++++++++++++++++
 5 files changed, 262 insertions(+)
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
index cfce8e91fa16..683c37c0ee5a 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -12,6 +12,7 @@
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/intc.h>
+#include <asm/mmio.h>
 #include <asm/riscv_encoding.h>
 #include <asm/vtimer.h>
 
@@ -294,6 +295,8 @@ void arch_domain_destroy(struct domain *d)
     printk(XENLOG_WARNING "%s: not fully implemented\n", __func__);
 
     domain_vintc_deinit(d);
+
+    domain_io_free(d);
 }
 
 int arch_domain_create(struct domain *d,
@@ -310,6 +313,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc = p2m_init(d, config)) != 0)
         goto fail;
 
+    if ( (rc = domain_io_init(d)) )
+        goto fail;
+
     if ( (rc = domain_vintc_init(d)) )
         goto fail;
 
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 98e5e72e58ba..8c48833353f5 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -101,6 +101,8 @@ struct arch_domain {
     const unsigned long *isa;
 
     struct vintc *vintc;
+
+    struct vmmio *vmmio;
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/mmio.h b/xen/arch/riscv/include/asm/mmio.h
new file mode 100644
index 000000000000..21402f67eb2a
--- /dev/null
+++ b/xen/arch/riscv/include/asm/mmio.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef RISCV_MMIO_H
+#define RISCV_MMIO_H
+
+#include <xen/lib.h>
+
+struct domain;
+struct vcpu;
+
+typedef struct {
+    paddr_t gpa;
+    unsigned int len;  /* Access width in bytes */
+    bool is_write;
+    /* Store: value to write; load: value read (set by handler) */
+    register_t data;
+} mmio_info_t;
+
+enum io_state {
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
+int do_mmio(mmio_info_t *info, paddr_t fault_addr, unsigned int len);
+int register_mmio_handler(struct domain *d,
+                          const struct mmio_handler_ops *ops,
+                          paddr_t addr, paddr_t size);
+int domain_io_init(struct domain *d);
+void domain_io_free(struct domain *d);
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
index 000000000000..feeff06e3a12
--- /dev/null
+++ b/xen/arch/riscv/mmio.c
@@ -0,0 +1,205 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/bsearch.h>
+#include <xen/lib.h>
+#include <xen/rwlock.h>
+#include <xen/sched.h>
+#include <xen/string.h>
+#include <xen/xvmalloc.h>
+
+#include <asm/current.h>
+#include <asm/mmio.h>
+
+#define MAX_IO_HANDLER  16
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
+static bool find_mmio_handler(const struct domain *currd, paddr_t gpa,
+                              struct mmio_handler *out)
+{
+    struct vmmio *vmmio = currd->arch.vmmio;
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
+    struct vcpu *curr = current;
+    struct mmio_handler handler = {};
+
+    if ( !find_mmio_handler(curr->domain, info->gpa, &handler) )
+        return IO_UNHANDLED;
+
+    if ( info->is_write )
+        return handler.ops->write(curr, info);
+
+    return handler.ops->read(curr, info);
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
+    struct vmmio *vmmio = d->arch.vmmio;
+    struct mmio_handler *handlers = vmmio->handlers;
+    paddr_t end = addr + size;
+    unsigned int i;
+    int rc = 0;
+    bool overlap;
+
+    ASSERT(ops->read && ops->write);
+
+    if ( end <= addr )
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
+int domain_io_init(struct domain *d)
+{
+    struct vmmio *vmmio = xvzalloc(struct vmmio);
+
+    if ( !vmmio )
+        return -ENOMEM;
+
+    rwlock_init(&vmmio->lock);
+    d->arch.vmmio = vmmio;
+
+    return 0;
+}
+
+void domain_io_free(struct domain *d)
+{
+    XVFREE(d->arch.vmmio);
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
2.56.1


