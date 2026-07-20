Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41AFC44524
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:02:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367144.1616980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqRw-0008I8-00; Mon, 20 Jul 2026 16:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367144.1616980; Mon, 20 Jul 2026 16:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqRv-0008HB-RV; Mon, 20 Jul 2026 16:02:35 +0000
Received: by outflank-mailman (input) for mailman id 1367144;
 Mon, 20 Jul 2026 16:02:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqRu-0007uP-Q1
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:02:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqRu-00HTXg-6e
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:02:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4688-bab6-0a2a0a5309dd-0a2a45019a96-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:34 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e469a-5984-0a2a45010019-d1558034c4fc-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:02:34 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4954df200ddso17326535e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:02:34 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563eee22esm31331765e9.1.2026.07.20.09.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:02:32 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563354; x=1785168154; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2GtGX4lSvWuVxHxTWIzl2qVUw75GgyetUNG8vpXRat0=;
        b=FwLgMuTATHeUZ6OD+31cbou8UfUGjpP/pWudRvZX94Wkm5YClwgxFSVO31yG5Jidl9
         ++cVq5IK3yNrcquTxVj7f+fVqxa+dCYX0eFqeUTocXrTB8yngZe0f6hKpNet8zomJhpG
         5zawLFT1UnnyuG+DtXGv3/X/gxyYj/p/EVFw2xASC759wvntEXbOrmeQKEsM0Ew22aGC
         fTUOwto6vicEEDefx+FU9kn0UOc+AC2CRDao2Hagu6tv50QBeP0OqTNRyqo3b5XsgwM1
         VWmmKrCmvgFJtUmlJ0AJXpv0w2xk/2k+aWn/y7pH5RMGEayT0hQr5YRPwAI3fEegt/8t
         hpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563354; x=1785168154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2GtGX4lSvWuVxHxTWIzl2qVUw75GgyetUNG8vpXRat0=;
        b=IiNMS9hZBjtfmNBxPqt0K1M2tXtBsiz2gUPuZNInL+6xHikhkTp4UMI5fq4vlpi32P
         9Nua8JLEX8aIOwsFyHqiuaAACaQquL/pVo/PgI86Az0fpDRgqOTliPEdintOIfpG1Jti
         +XBqZngn/FKi4x1W6NXTNjIiBsCscyOr7HWCM2PDJIFYAR4Dgchoe6cz1MacHiLmDJq6
         pkBjJ5JEs2YZgFVxbul7dl0RlJhZqoP5i3JmxMHcMs/fQHbW8564LGhEUDrIcRoso8wf
         hpXB09GKexU9/e4/DMjpB14lDFlMNvQRTDdcxXyOJjZPitAT+Cc/UNflMNHMGt/XWROS
         jZFA==
X-Gm-Message-State: AOJu0Ywzfh05Cgwyytw0GpL4J7YDHqoUaXMuMrKzfcl+x/HdOytH8bNs
	tKqPBCH5Gg2zQq5dMkVa88TcbVDf78zepoanK48/tG8WTmEK7IXaZiQnmcPO4A==
X-Gm-Gg: AfdE7cm6kx0A7q+LYJX+VShB69s936Fyy0NvsZ6Zd2m/gco+AcQabNlcY1V0bKODoTj
	XeB06TNo5AJf7yu/PiNlrIcRK0mgl08beR9WLRb+6NZj5/inO9QneOeoE05GL+hqvmvDqXBNsFH
	HxoA9KkOmsXQ+VZOj0jwu31iKWwNgSy6xVyto7nWrld2BYtOC/DB3y5LY/fTMbMvIPye82j3cno
	e6LlD1Fvnh5tByNX+uRM5gjRb6WYdAtQSuVINHKFJh/PHYb6dgQ+Zd8/OZH8t8bvqst9gFVP2y6
	fAf+Xr6A2Afu0otC29vOEGkVLaye3B4kWV/ogXPjs0yoCN9zRgWKf3g4C8p4m3tko383+hfZGY0
	SdAWg0fcoF6XAaYm9Wxdys2Fpf0XPqVwYC9X6t8DacDyGVSELRX1s8699Ss78a3X53XrR1FwuCc
	hrmSR0Th3pnUd2+rqI5p7lt3DjK273FGVWuGXGXVSrdid5Ebk=
X-Received: by 2002:a05:600c:4fc9:b0:493:e974:41ac with SMTP id 5b1f17b1804b1-4954a3f3b28mr171637645e9.16.1784563353289;
        Mon, 20 Jul 2026 09:02:33 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 04/17] xen/riscv: introduce device-agnostic MMIO emulation dispatch
Date: Mon, 20 Jul 2026 18:02:02 +0200
Message-ID: <c12b69710d7b79bfc0c110f3fa043d871d8b8394.1784560663.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1784563354-1EE60757-489F366A/10/73395122804
X-purgate-type: spam
X-purgate-size: 9383

RISC-V guests can expose several virtual interrupt controllers at
distinct GPA ranges: vPLIC (hasn't been introduced yet) for legacy machines,
vAPLIC and vIMSIC for AIA-compliant ones (is being introduced in the follow
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

Subsequent patches wire this into arch_domain_create() and the MMIO fault
path in traps.c.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
Note that find_mmio_handler() and try_handle_mmio() is handling found
handler differently for now in comparison to Arm. But this behaviour will
be aligned at the end. Look at discussion:
  https://lore.kernel.org/xen-devel/cd78972e-88d5-471d-a201-5f9cd1392c73@gmail.com/T/#t
---
---
 xen/arch/riscv/Makefile             |   1 +
 xen/arch/riscv/domain.c             |   4 +
 xen/arch/riscv/include/asm/domain.h |   3 +
 xen/arch/riscv/include/asm/mmio.h   |  63 ++++++++++++
 xen/arch/riscv/mmio.c               | 145 ++++++++++++++++++++++++++++
 5 files changed, 216 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/mmio.h
 create mode 100644 xen/arch/riscv/mmio.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 046f73f4d87c..c452ebc3cf61 100644
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
index 4db9c28662c7..1e6f0ef66c2f 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -12,6 +12,7 @@
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
 #include <asm/intc.h>
+#include <asm/mmio.h>
 #include <asm/riscv_encoding.h>
 #include <asm/vtimer.h>
 
@@ -308,6 +309,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc = p2m_init(d, config)) != 0)
         goto fail;
 
+    if ( (rc = domain_io_init(d, MAX_IO_HANDLER)) != 0 )
+        goto fail;
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
index 000000000000..18df1133e621
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
+#define MAX_IO_HANDLER  16
+
+typedef struct {
+    paddr_t gpa;
+    unsigned int len;  /* access width in bytes (1, 2, 4, 8) */
+    bool is_write;
+    register_t data;   /* store: value to write; load: value read (set by handler) */
+} mmio_info_t;
+
+enum io_state
+{
+    IO_ABORT,       /* The IO was handled and led to an abort. */
+    IO_HANDLED,     /* The IO was successfully handled. */
+    IO_UNHANDLED,   /* No handler found for the IO. */
+};
+
+typedef enum io_state (*mmio_read_t)(struct vcpu *v, mmio_info_t *info,
+                                     register_t *r);
+typedef enum io_state (*mmio_write_t)(struct vcpu *v, mmio_info_t *info,
+                                      register_t r);
+
+struct mmio_handler_ops {
+    mmio_read_t read;
+    mmio_write_t write;
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
+    unsigned int max_num_entries;
+    rwlock_t lock;
+    struct mmio_handler *handlers;
+};
+
+enum io_state try_handle_mmio(mmio_info_t *info);
+void register_mmio_handler(struct domain *d,
+                           const struct mmio_handler_ops *ops,
+                           paddr_t addr, paddr_t size);
+int domain_io_init(struct domain *d, unsigned int max_count);
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
index 000000000000..7d56bc8b27c5
--- /dev/null
+++ b/xen/arch/riscv/mmio.c
@@ -0,0 +1,145 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) Vates
+ */
+
+#include <xen/bsearch.h>
+#include <xen/lib.h>
+#include <xen/rwlock.h>
+#include <xen/sched.h>
+#include <xen/sort.h>
+#include <xen/xvmalloc.h>
+
+#include <asm/current.h>
+#include <asm/mmio.h>
+
+static enum io_state handle_read(const struct mmio_handler *handler,
+                                 struct vcpu *v,
+                                 mmio_info_t *info)
+{
+    register_t r = 0;
+    enum io_state rc;
+
+    rc = handler->ops->read(v, info, &r);
+    if ( rc == IO_HANDLED )
+        info->data = r;
+
+    return rc;
+}
+
+static enum io_state handle_write(const struct mmio_handler *handler,
+                                  struct vcpu *v,
+                                  mmio_info_t *info)
+{
+    return handler->ops->write(v, info, info->data);
+}
+
+/* Assumes mmio regions are not overlapping. */
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
+static void swap_mmio_handler(void *a, void *b)
+{
+    struct mmio_handler *t1 = a, *t2 = b;
+
+    SWAP(*t1, *t2);
+}
+
+/*
+ * Return a copy of the matching handler rather than a pointer into
+ * vmmio->handlers: a concurrent register_mmio_handler() re-sorts the
+ * array, so an escaped pointer could refer to a different (or torn)
+ * entry once the lock is dropped.  The copy stays valid as the ops
+ * structures are never freed.
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
+enum io_state try_handle_mmio(mmio_info_t *info)
+{
+    struct vcpu *v = current;
+    struct mmio_handler handler = {};
+
+    if ( !find_mmio_handler(v->domain, info->gpa, &handler) )
+        return IO_UNHANDLED;
+
+    if ( info->is_write )
+        return handle_write(&handler, v, info);
+    else
+        return handle_read(&handler, v, info);
+}
+
+void register_mmio_handler(struct domain *d,
+                           const struct mmio_handler_ops *ops,
+                           paddr_t addr, paddr_t size)
+{
+    struct vmmio *vmmio = &d->arch.vmmio;
+    struct mmio_handler *handler;
+
+    write_lock(&vmmio->lock);
+
+    BUG_ON(vmmio->num_entries >= vmmio->max_num_entries);
+
+    handler = &vmmio->handlers[vmmio->num_entries];
+    handler->ops = ops;
+    handler->addr = addr;
+    handler->size = size;
+    vmmio->num_entries++;
+
+    /* Sort mmio handlers in ascending order based on base address */
+    sort(vmmio->handlers, vmmio->num_entries, sizeof(struct mmio_handler),
+         cmp_mmio_handler, swap_mmio_handler);
+
+    write_unlock(&vmmio->lock);
+}
+
+int domain_io_init(struct domain *d, unsigned int max_count)
+{
+    rwlock_init(&d->arch.vmmio.lock);
+    d->arch.vmmio.num_entries = 0;
+    d->arch.vmmio.max_num_entries = max_count;
+    d->arch.vmmio.handlers = xvzalloc_array(struct mmio_handler, max_count);
+    if ( !d->arch.vmmio.handlers )
+        return -ENOMEM;
+
+    return 0;
+}
+
+void domain_io_free(struct domain *d)
+{
+    XVFREE(d->arch.vmmio.handlers);
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
2.54.0


