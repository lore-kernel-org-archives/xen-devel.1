Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A93CCA9ED5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 07:35:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445856.1661718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGAYf-0005oL-Vp; Mon, 12 Oct 2026 07:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445856.1661718; Mon, 12 Oct 2026 07:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGAYf-0005nU-S2; Mon, 12 Oct 2026 07:34:53 +0000
Received: by outflank-mailman (input) for mailman id 1445856;
 Mon, 12 Oct 2026 07:34:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGAYe-0005gj-Lj
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 07:34:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGAYd-00AzWn-Js
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 09:34:51 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acc8d99-8faa-0a2a0a5109dd-0a2a4507cc18-6
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 09:34:51 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6acc8d9b-b4ea-0a2a45070019-d155dd2adc9e-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 09:34:51 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so1066236f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 00:34:51 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9aba3e5sm17622702f8f.31.2026.10.12.00.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 00:34:50 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1791790491; x=1792395291; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMxGP51tjn0U25bigtlNPn8d5ZOyybDKcznQ2+Ll/K8=;
        b=Dw6+dfZTp+iiZCFwIf96avU4u5mpHwdWDX4F69fdiKuTG3R33zwxd9hQQOliF2Z8MS
         z5tIeo095MX5x+J3DZ7jdQzlbJuEs4KahEAYHwbYTtmoiK6VEVxYnC7G7P2SygeRFhog
         ShSN4kT/7gnw/QO+8fRQEZ3LqE1FmmsWSfMGblvBC4o6vAI8p7vwed6XhM17YQAK18AT
         gwHxmiBX096Y+ypkbiuSBgXO3kQoBWR07OYNdI8h2DbQlb/aUElqt0lS+f1/weuSM2qh
         WBK7ZNODRhDZrXhkPCkEMAKtDKeutic92ADZx3gWOiLqLXipVoL0DfBCbFGqigAv38de
         gVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790491; x=1792395291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SMxGP51tjn0U25bigtlNPn8d5ZOyybDKcznQ2+Ll/K8=;
        b=SGRtEU5aHqi7s4N0tjSLjuhj5zTyWpi8SVKM57YKzxg2u+fnjG2vHQYm+gaRqOhIlo
         4rY2w/7Y5HuNa+Ac07w42ijN24NtP8S4maGf3pzfwiiOfRxNb7H1eDEc2EIuzpIQY65i
         YQF8h4dTDG3ia0vWfTM1BGsOMR3NXPm6LhqYRwevO4sVFVDrx6zwBkXoRx4crPjIXrhQ
         u6oG1CsUiWVprUAsJrnJ5UmTS5uK0J7oRVni9qv39zCExjI8fcSCuHXYMU73MJK8CHGM
         DwHHADFW4k6BDUyPeVOLoTFj2jYSYKFlBFJdtGcos7JUlhvJ3PYrCBYlNzc8V1VY3B5i
         lMNA==
X-Gm-Message-State: AFq9FYLn9+Z6Vb5TKK3d5BcYPKCD+D3ZqFyEj8WCyw3UrRXkPWCvtqyk
	zVK7X42234ZXMIuospT74FgZRmCc7GwRVTm+WWwluGKoVIIETk9NP/rHlrOo+Q==
X-Gm-Gg: AYBFou3jJD3QXsLKIEteoTMsCEkrPQ72sINXBmU74qsac4A+4B7dToVdKm86wXp5UDc
	xm8TQQi4w9BijV1WNShOaLd0maLThOol3rGRCIgLVFYyjLVxyaMJrv3fuZR3e4OMk1VGqqyzWd3
	iSmHYF3TISama+JDTw7FbTxW2DR/88lBmw0e3UxJvCCz3YWASR+DvqLzygmxjYSfwOkrgvvOSNa
	idUsq/ffF6E+Ne32yv9rw8klZ0x6rYddweysGo+ptMuBiqDyB3T1/YQp/OrZwul4nLeQn+hjOJq
	0Z68fPYgv1wIFAAnPN6V7Y6GxN55qlJhT3MCEWVSHPK22TN5jCQfOYlY7JhXoR+4F/cLe3u8J1V
	OhI4xtoawFU/aSEN4lauioEA49jXeAf6rG+uyVatty5JM1NPrBNUNUZIeivjuo1o4ZShL9mc97J
	w5BAV+1UuObooeIeWM4K/t6/zcOQNu7wp8ny4muqeqnBypKNp6meY8zoM6kMk0BET37mOK1eStf
	HpwAN4aJ9cuNhzqvRtDqLnuQ8aztU0hokKL+mAdhfmQw4biiVU=
X-Received: by 2002:adf:e00f:0:20b0:48b:2ae:686f with SMTP id ffacd0b85a97d-48dba7892e9mr11201208f8f.5.1791790490723;
        Mon, 12 Oct 2026 00:34:50 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v2 2/2] xen/device-tree: add a helper to dump an FDT in DTS-like format
Date: Mon, 12 Oct 2026 09:34:42 +0200
Message-ID: <20261012073442.15819-3-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012073442.15819-1-oleksii.kurochko@gmail.com>
References: <20261012073442.15819-1-oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1791790491-A7ED6AE4-05ACBAE2/10/73395122804
X-purgate-type: spam
X-purgate-size: 10913

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
 xen/Kconfig.debug                       |  10 ++
 xen/arch/arm/domain_build.c             |   2 +
 xen/common/device-tree/Makefile         |   1 +
 xen/common/device-tree/dom0less-build.c |   3 +
 xen/common/device-tree/fdt-dump.c       | 185 ++++++++++++++++++++++++
 xen/include/xen/bootfdt.h               |  16 ++
 6 files changed, 217 insertions(+)
 create mode 100644 xen/common/device-tree/fdt-dump.c

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d900d926c555..45cff9dbc467 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -98,6 +98,16 @@ config DEVICE_TREE_DEBUG
 	  logged in the Xen ring buffer.
 	  If unsure, say N here.
 
+config DEVICE_TREE_DUMP
+	bool "Dump generated device trees"
+	depends on DEVICE_TREE_PARSE
+	help
+	  The device tree Xen generates for dom0/hwdom and for each dom0less
+	  domain is printed on the Xen console in a DTS-like format.
+	  The dump is logged at debug level, so on a non-debug build it is
+	  only shown with "loglvl=all".
+	  If unsure, say N here.
+
 config SCRUB_DEBUG
 	bool "Page scrubbing test"
 	default DEBUG
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 72d531618045..6a20af23e1bb 100644
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
index fcbeb8adbd73..24a9c6b1e3e1 100644
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
index 000000000000..296ae0d90d12
--- /dev/null
+++ b/xen/common/device-tree/fdt-dump.c
@@ -0,0 +1,185 @@
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
+/* Indentation, in characters, of a node at depth @depth. */
+static int __init indent_of(int depth)
+{
+    return 2 * min(depth, DUMP_MAX_INDENT_DEPTH);
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
+        print_properties(fdt, node, indent_of(depth) + 2);
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
-- 
2.55.0


