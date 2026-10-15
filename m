Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A39CC6B2F
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 08:29:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450021.1665520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHGpd-0001Zx-38; Thu, 15 Oct 2026 08:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450021.1665520; Thu, 15 Oct 2026 08:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHGpd-0001Zo-0Q; Thu, 15 Oct 2026 08:28:57 +0000
Received: by outflank-mailman (input) for mailman id 1450021;
 Thu, 15 Oct 2026 08:28:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHGpb-0001ZQ-Pj
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 08:28:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHGpb-001cg2-6L
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 10:28:55 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad08ec0-e002-0a2a0a5209dd-0a2a45018e6e-14
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:28:55 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ad08ec7-5984-0a2a45010019-d155802ee518-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 10:28:55 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a1682bff3cso8027375e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 01:28:55 -0700 (PDT)
Received: from fedora (public-gprs367967.centertel.pl. [37.47.68.160])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd5e9dd7sm36029895e9.0.2026.10.15.01.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 01:28:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792052934; x=1792657734; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgX8fpX0WC/UHWq0xLpQHSFXGDe7NEPolmA1/ZDpQ14=;
        b=p6MAgwoRqMW/TfW3gWjMRRWnH1KkZVnlm76XBXiyXbsgWIevhhUtffLuR9Yby7hBIV
         d0+gaBD8NOsDBrFfUt5D7m0pFu2wmlI3D6khtwX0fM/QYOSIVj3u+q51cEhJMGFnbk0k
         w+aK3Vv6Z9ApL5J6tkMvkVSzs4oKgZQXW3QzKOcQzYQYUR72nMwQrO+3S2wVD1bZ1iu3
         2fYtgA7EV4P0rGOscKD4fQ2MVRo+4YGT1G4yPsMMATfMTN+gCtIHsEdwBYyyVI4B5wN7
         ECDrdwpj4iatydUmMYHbN11gaAA8nIvp6jKKugSQpXGEgyoyaNrYQsPIJ5NgTUAaa+p7
         wOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792052934; x=1792657734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgX8fpX0WC/UHWq0xLpQHSFXGDe7NEPolmA1/ZDpQ14=;
        b=IpB1ZTe61T4IRV9PPj7Eu98axkrqS85xo4RjHvn4yuXd//Tol4mlnWggVV2OKe1ixA
         xrRv8g/O4HolL10+yeBiyMJdFH/ty5IcH4mn9VoCruwKmdFWFvxrB5ggGR6uewFXIATM
         /LNpo8dojN3jFM62Fifobbu40CLrU7+APd7+x6y/RN8F2E5Fcms+mtx3PAa06AW7aGno
         +Ht1htAtvHi2x/ggjc6Y//y8PcQF2GujhGFjshbd87v+zzKH9+Mz4g7v45YtCAF8QR24
         TNU8IlVUkXtd8E3xHnNNXjJLh/74jdDOCJ62CKAJE2U8R4Mr7xeUNmADE+dsIkf6ybHt
         t/FQ==
X-Gm-Message-State: AFq9FYLeq8sTpfMRVLx0wSQwQFm5Q6MDKeqApRh+CP4g/LmfCMpS8wS9
	XGdFhECfMsipOLBGU6OoA4osWV3coxUFtMzPIaA3LzEzS3FpGtP5M+CCfhfdTg==
X-Gm-Gg: AYBFou0i5ckB+RlED5BvXfTjKMLMYlmpblzchhMkwpTeWMXVTobtITnL+OXMBXXkb+W
	w6dIqDey/0spKHRgGVEWqU0JyZ8Zi1GCyR/0Somc4xocrCwcrcwQx9vjoljW3Gp603FnL5mcZHZ
	DdisPbtZIW+2EjYpf8axk9A0XY4HAILdjQb+eGr0nwJWy/uEcA4hxuxh6os2R0LlGAhI1vRTXh9
	XDQLbSdj/YejTbFOLoefj7I/vly93G2TTtKtW8FThP/EkDW3EYXXs0bxmh1b9DnBByonH6QbkRx
	KoyQOL7JaZ5xtC21NGFVDz3G3SpzotC5e+J/MMf5e2v3FTM0PaNf/SFzfDKrsp0g+Vz+UpfT7/6
	mTtO+qZa5szI8YxNkIW/iKMfqVGwxuR4CjdQJSeMyABtriZuNrHpgLm9rTL1eEfzGltlr3H6TPM
	O9Vkn3153Enw3vCBqnHy0q6rGuuH+3hmhDDrMLhyMw3FwVMj3/9Pxqa6GS34ToJiVzv4wqi9RJN
	X8vTE6/PEN6AR91fMb9vxOeWmVqSe0Jjc/Xr1y/
X-Received: by 2002:a05:600c:8b64:b0:49d:174e:2a1e with SMTP id 5b1f17b1804b1-4a18e498851mr389949485e9.19.1792052934395;
        Thu, 15 Oct 2026 01:28:54 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3] xen/device-tree: add a helper to dump an FDT in DTS-like format
Date: Thu, 15 Oct 2026 10:28:45 +0200
Message-ID: <20261015082845.19511-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1792052935-BFA6E757-2724E578/10/73395122804
X-purgate-type: spam
X-purgate-size: 11297

The device tree Xen builds for dom0/hwdom or for a dom0less domain is
only ever consumed by the guest, so a mistake in it surfaces as an
obscure failure inside the domain, far away from the code which
produced the tree.

Add device_tree_dump(). The output follows dtc's format so that a dump
can be diffed against the source DTS or fed back to dtc; the value
formatting heuristics are ported from dtc's utilfdt_print_data() for
that reason. The walk itself goes through libfdt rather than decoding
the tag stream by hand as dtc's fdtdump does.

Dumping a whole tree is only useful while debugging and costs both code
size and a lot of console output, so it is put under its own option,
CONFIG_DEVICE_TREE_DUMP. It is separate from CONFIG_DEVICE_TREE_DEBUG
because the generated tree is often all that is needed, without the rest
of the device tree debug messages.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
CI tests:
https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2947342162
---
Changes in v3:
 - Drop the loglvl remark from the CONFIG_DEVICE_TREE_DUMP help text.
 - Indent the dump by 4 spaces per nesting level instead of 2. Introduce
   macros DUMP_INDENT_WIDTH for that.
---
Changes in v2:
 - Dump the device tree generated for dom0/hwdom as well.
 - Put the dump under its own CONFIG_DEVICE_TREE_DUMP instead of
   CONFIG_DEVICE_TREE_DEBUG.
 - Pass the domain to device_tree_dump() and print the "Device tree for"
   header from it.
 - Combine isprint() with isascii(), as Xen's isprint() also accepts
   the characters 0xa0-0xff, unlike the one dtc uses.
 - Update the commit message.
---
---
 xen/Kconfig.debug                       |   9 ++
 xen/arch/arm/domain_build.c             |   2 +
 xen/common/device-tree/Makefile         |   1 +
 xen/common/device-tree/dom0less-build.c |   3 +
 xen/common/device-tree/fdt-dump.c       | 188 ++++++++++++++++++++++++
 xen/include/xen/bootfdt.h               |  16 ++
 6 files changed, 219 insertions(+)
 create mode 100644 xen/common/device-tree/fdt-dump.c

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d900d926c555..8e90209b8b65 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -98,6 +98,15 @@ config DEVICE_TREE_DEBUG
 	  logged in the Xen ring buffer.
 	  If unsure, say N here.
 
+config DEVICE_TREE_DUMP
+	bool "Dump generated device trees"
+	depends on DEVICE_TREE_PARSE
+	help
+	  The device tree Xen generates for dom0/hwdom and for each dom0less
+	  domain is printed on the Xen console in a DTS-like format.
+	  The dump is logged at debug level.
+	  If unsure, say N here.
+
 config SCRUB_DEBUG
 	bool "Page scrubbing test"
 	default DEBUG
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 795b40108774..9f4ef7acc743 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1705,6 +1705,8 @@ static int __init prepare_dtb_hwdom(struct domain *d, struct kernel_info *kinfo)
     if ( ret < 0 )
         goto err;
 
+    device_tree_dump(d, kinfo->fdt);
+
     return 0;
 
   err:
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 9036e455d66a..730d202349eb 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
 obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-bindings.init.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
+obj-$(CONFIG_DEVICE_TREE_DUMP) += fdt-dump.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += intc.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 2021838d3830..fcb438c50a04 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bootfdt.h>
 #include <xen/bootinfo.h>
 #include <xen/device_tree.h>
 #include <xen/dom0less-build.h>
@@ -587,6 +588,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret < 0 )
         goto err;
 
+    device_tree_dump(d, kinfo->fdt);
+
     return 0;
 
   err:
diff --git a/xen/common/device-tree/fdt-dump.c b/xen/common/device-tree/fdt-dump.c
new file mode 100644
index 000000000000..0f5176de8b75
--- /dev/null
+++ b/xen/common/device-tree/fdt-dump.c
@@ -0,0 +1,188 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Dump a flattened device tree blob in a DTS-like format.
+ *
+ * is_printable_string() and print_value() are derived from
+ * util_is_printable_string() and utilfdt_print_data() in the device tree
+ * compiler (dtc).
+ *
+ * Copyright 2011 The Chromium Authors, All Rights Reserved.
+ * Copyright 2008 Jon Loeliger, Freescale Semiconductor, Inc.
+ * util_is_printable_string contributed by
+ *      Pantelis Antoniou <pantelis.antoniou AT gmail.com>
+ */
+
+#include <xen/bootfdt.h>
+#include <xen/ctype.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/types.h>
+
+/* Deeper nodes are still printed, but not indented any further. */
+#define DUMP_MAX_INDENT_DEPTH 32
+
+/* Spaces per nesting level. */
+#define DUMP_INDENT_WIDTH 4
+
+/* Indentation, in characters, of a node at depth @depth. */
+static int __init indent_of(int depth)
+{
+    return DUMP_INDENT_WIDTH * min(depth, DUMP_MAX_INDENT_DEPTH);
+}
+
+static bool __init is_printable_string(const void *data, unsigned int len)
+{
+    const char *s = data;
+    const char *se = s + len;
+
+    /* A zero length property, or one which isn't NUL terminated, isn't one. */
+    if ( (len == 0) || (s[len - 1] != '\0') )
+        return false;
+
+    while ( s < se )
+    {
+        const char *ss = s;
+
+        /*
+         * Xen's isprint() also accepts the characters 0xa0-0xff, while the
+         * one dtc uses only accepts ASCII ones.
+         */
+        while ( (s < se) && *s && isascii(*s) && isprint(*s) )
+            s++;
+
+        /* Stopped on a non printable character, or the string is empty. */
+        if ( (*s != '\0') || (s == ss) )
+            return false;
+
+        s++;
+    }
+
+    return true;
+}
+
+/*
+ * Print the value of a property, using the same heuristics as dtc: a list of
+ * NUL terminated printable strings is printed as such, a value which is a
+ * multiple of 4 bytes as a list of cells, anything else as a byte string.
+ *
+ * The caller has already started the line (and with it selected the log
+ * level), so no XENLOG_* prefix may be used here.
+ */
+static void __init print_value(const void *data, unsigned int len)
+{
+    unsigned int i;
+
+    /* Empty property, nothing to print. */
+    if ( len == 0 )
+        return;
+
+    if ( is_printable_string(data, len) )
+    {
+        const char *s = data;
+        const char *end = data + len;
+
+        printk(" = ");
+        while ( s < end )
+        {
+            printk("\"%s\"", s);
+            s += strlen(s) + 1;
+            if ( s < end )
+                printk(", ");
+        }
+    }
+    else if ( IS_ALIGNED(len, sizeof(fdt32_t)) )
+    {
+        const fdt32_t *cell = data;
+
+        printk(" = <");
+        for ( i = 0; i < len / sizeof(*cell); i++ )
+            printk("%s0x%08x", i ? " " : "", fdt32_ld(&cell[i]));
+        printk(">");
+    }
+    else
+    {
+        const uint8_t *byte = data;
+
+        printk(" = [");
+        for ( i = 0; i < len; i++ )
+            printk("%s%02x", i ? " " : "", byte[i]);
+        printk("]");
+    }
+}
+
+static void __init print_properties(const void *fdt, int node, int indent)
+{
+    int prop;
+
+    fdt_for_each_property_offset ( prop, fdt, node )
+    {
+        const char *name;
+        const void *data;
+        int len;
+
+        data = fdt_getprop_by_offset(fdt, prop, &name, &len);
+        if ( !data )
+        {
+            printk(XENLOG_DEBUG "%*scouldn't read property at offset %d: %s\n",
+                   indent, "", prop, fdt_strerror(len));
+            return;
+        }
+
+        printk(XENLOG_DEBUG "%*s%s", indent, "", name);
+        print_value(data, len);
+        printk(";\n");
+    }
+
+    if ( (prop < 0) && (prop != -FDT_ERR_NOTFOUND) )
+        printk(XENLOG_DEBUG "%*scouldn't walk the properties: %s\n",
+               indent, "", fdt_strerror(prop));
+}
+
+void __init device_tree_dump(const struct domain *d, const void *fdt)
+{
+    int node, depth = 0;
+    /* Depth up to which nodes are open and still have to be closed. */
+    int open_depth = 0;
+
+    printk(XENLOG_DEBUG "Device tree for %pd:\n", d);
+    printk(XENLOG_DEBUG "/dts-v1/;\n");
+
+    /*
+     * fdt_next_node() signals the end of the subtree it was started on by
+     * making the depth negative, and only returns an error when the blob
+     * itself is malformed.
+     */
+    for ( node = 0; (node >= 0) && (depth >= 0);
+          node = fdt_next_node(fdt, node, &depth) )
+    {
+        const char *name = fdt_get_name(fdt, node, NULL);
+
+        /* Close the nodes which aren't a parent of the current one. */
+        while ( open_depth > depth )
+            printk(XENLOG_DEBUG "%*s};\n", indent_of(--open_depth), "");
+
+        printk(XENLOG_DEBUG "%*s%s {\n", indent_of(depth), "",
+               (depth == 0) ? "/" : (name ?: "<unknown>"));
+        print_properties(fdt, node, indent_of(depth) + DUMP_INDENT_WIDTH);
+
+        open_depth = depth + 1;
+    }
+
+    while ( open_depth > 0 )
+        printk(XENLOG_DEBUG "%*s};\n", indent_of(--open_depth), "");
+
+    if ( node < 0 )
+        printk(XENLOG_DEBUG "The device tree dump is incomplete: %s\n",
+               fdt_strerror(node));
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 0e82ccea2f84..b19e0fa41a1b 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -99,6 +99,22 @@ int device_tree_for_each_node(const void *fdt, int node,
                               device_tree_node_func func,
                               void *data);
 
+struct domain;
+
+/*
+ * device_tree_dump - print a device tree blob in a DTS-like format
+ * @d: domain the device tree was generated for.
+ * @fdt: flat device tree.
+ *
+ * The tree is printed at debug log level and is only meant to be used for
+ * debugging, so it is a no-op unless CONFIG_DEVICE_TREE_DUMP is enabled.
+ */
+#ifdef CONFIG_DEVICE_TREE_DUMP
+void device_tree_dump(const struct domain *d, const void *fdt);
+#else
+static inline void device_tree_dump(const struct domain *d, const void *fdt) {}
+#endif
+
 typedef enum {
     BOOTMOD_XEN,
     BOOTMOD_FDT,

base-commit: 7168cc02f86fb069da6e7405afbf5c7a1c215b0d
-- 
2.55.0


