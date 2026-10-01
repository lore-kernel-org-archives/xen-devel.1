Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F33CA5FB3
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 11:16:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438174.1657050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCEmJ-0000Ew-8u; Thu, 01 Oct 2026 11:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438174.1657050; Thu, 01 Oct 2026 11:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCEmJ-0000Ep-3r; Thu, 01 Oct 2026 11:16:43 +0000
Received: by outflank-mailman (input) for mailman id 1438174;
 Thu, 01 Oct 2026 11:16:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCEmH-0008T1-HB
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:16:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCEmG-002bSU-AJ
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 13:16:40 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abe4115-e002-0a2a0a5209dd-0a2a4505aa14-8
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 13:16:40 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6abe4117-4cb1-0a2a45050019-4a7de18d9870-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 13:16:40 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e721b5503so60140115e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 04:16:40 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b068ff994sm5610427f8f.6.2026.10.01.04.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 04:16:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790853399; x=1791458199; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6moSCjWJjNEFzqSKa0SKXJwMyyg6GCB49Pw7Ja5Krs8=;
        b=tLnF5bFYyg4Vb+k89UHScL8W2sP1reieWzP5+H1wXSAgEGAVVlAy+uvmcDIfRo15nH
         gB61uHzG5c0GNZLqmY2R1nRVXfKKaVnON6k+Xi8UM61OiGnsy+/UlCJE3ML1LsIlWIsw
         gApd39kJr6UQCrIbKGEAW//4G4UTroDlSzbrQkEVyJif9bO6xz189VDTylmJSpVgvn4l
         PqTZ8gteUaU2geHiT18ZR2y4NzP84uhSSxbofY8s2Lbh4XXcsC2Nr7GO1n25ajsAITTL
         BL/gfIGAao1vPnoK7hctLArhv6B5kWO9Kb+p1/JnTknbZJBQE927xIAFXIHq3crr+qm5
         pkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790853399; x=1791458199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6moSCjWJjNEFzqSKa0SKXJwMyyg6GCB49Pw7Ja5Krs8=;
        b=Izyc5/weUXNYPZh2oz/Y0B4vSRzdQ88XaJCZZTvcsMuw7fId6WzIIvggAJnSMXi48D
         ATfAdlZCQcYzb5hw9TUrdIpsQPn7GGx0nXhOWEYqlYMdN1rPYdgmklW/hyXAhCeQa+70
         S1SSJ0g4/PmXRZ5uNftFCMSH8BluGo0PF/VOYnqQ04FiWBryPyDMWWjsjIV0SLy7Dkbq
         fBSJsP1xuz6MvSDieqRiF1tEIIVXfMNfObBt1IsfMIrVzOBGh7LLZB2t6CNq+3aPRrxs
         2Zzexp+efEbfHcm7nelhootUpccLKeuxgcoNl7XZzpnRmOLpuNTRFWKIVrdXG27hwAi3
         EnIw==
X-Gm-Message-State: AFuF++kiBjNPu5NEcvzin5+omYYY43+d6vudKAmuuzGjLGeULEFQe4go
	n1kOhD32uMvkBTPSLHDcjfLngbHX0zilAQYd/j9L5tBd1kz81whyqkW+Nf/lww==
X-Gm-Gg: AYBFou1UGonglzZhqcPl68NqrWM85iSdDd/E0vb53SXK6hEfcOZrDX8j7yHkuMnorG6
	vtnNOhWyQ3wqenHbh9QXIw975obDRErEaiL7shVU6jgQ1o91+VVv1f4ea2qb5wbnuxrxx7TqtIy
	5/8Okdzo3PKjpmBmWOj1t763bJ91W8hgQMlAjZby7tfsTZQ4/ZPiiFJ+odymnsT8GihwcH/n+PE
	0b2+mrs4BQu2V8+Nkx7rrXSlUcxEOTDMYR28h/qQVU1GFmfX/3VvPSL+Ho+n8nUix6811ta8ixG
	Q0F6Y5iD+lhmUaZRF+6GdUX6fCjsil/fU/IB4ADCWD4c4SxJPF1rgGIXJAhW635bUSsYROptWR8
	ejhAdYscZkSGKduMpDvDhNyCgXFuDo+CsQLw+m+xwUyZDIgfJ/nBvy3kqcOE8MgroHfnRi6ByOs
	4dVOBO5EpF9sWRpxem8cFYS/s6GSXiP89Br3xeSszqb0wyHrxlO2DSygikRT0RUReTdBXpGQ/HK
	Yg4fJBeyvD/jFgZA8EIjfz22kNj793sgcD/bVGj
X-Received: by 2002:a05:600c:3144:b0:4a0:1c0e:b136 with SMTP id 5b1f17b1804b1-4a01c0ec65fmr64496175e9.29.1790853399202;
        Thu, 01 Oct 2026 04:16:39 -0700 (PDT)
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
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 1/2] xen/device-tree: add a helper to dump an FDT in DTS-like format
Date: Thu,  1 Oct 2026 13:16:29 +0200
Message-ID: <20261001111630.112472-2-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001111630.112472-1-oleksii.kurochko@gmail.com>
References: <20261001111630.112472-1-oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1790853400-243112A1-97988D2D/10/73395122804
X-purgate-type: spam
X-purgate-size: 9391

The device tree Xen builds for a dom0less domain is only ever consumed
by the guest, so a mistake in it surfaces as an obscure failure inside
the domain, far away from the code which produced the tree.

Add device_tree_dump(). The output follows dtc's format so that a dump
can be diffed against the source DTS or fed back to dtc; the value
formatting heuristics are ported from dtc's utilfdt_print_data() for
that reason. The walk itself goes through libfdt rather than decoding
the tag stream by hand as dtc's fdtdump does.

Dumping a whole tree is only useful while debugging and costs both code
size and a lot of console output, hence CONFIG_DEVICE_TREE_DEBUG. Mention
the dump in the help text of the option.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/Kconfig.debug                       |   3 +-
 xen/common/device-tree/Makefile         |   1 +
 xen/common/device-tree/dom0less-build.c |   4 +
 xen/common/device-tree/fdt-dump.c       | 180 ++++++++++++++++++++++++
 xen/include/xen/bootfdt.h               |  13 ++
 5 files changed, 200 insertions(+), 1 deletion(-)
 create mode 100644 xen/common/device-tree/fdt-dump.c

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index d900d926c555..664f50bf8a96 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -95,7 +95,8 @@ config DEVICE_TREE_DEBUG
 	depends on DEVICE_TREE_PARSE
 	help
 	  Device tree parsing and DOM0 device tree building messages are
-	  logged in the Xen ring buffer.
+	  logged in the Xen ring buffer. The device tree generated for each
+	  dom0less domU is dumped there as well, in a DTS-like format.
 	  If unsure, say N here.
 
 config SCRUB_DEBUG
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 9036e455d66a..959dd2a9fd30 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
 obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-bindings.init.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
+obj-$(CONFIG_DEVICE_TREE_DEBUG) += fdt-dump.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += intc.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index fcbeb8adbd73..182201384faf 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bootfdt.h>
 #include <xen/bootinfo.h>
 #include <xen/device_tree.h>
 #include <xen/dom0less-build.h>
@@ -587,6 +588,9 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret < 0 )
         goto err;
 
+    dt_dprintk("Device tree for %pd:\n", d);
+    device_tree_dump(kinfo->fdt);
+
     return 0;
 
   err:
diff --git a/xen/common/device-tree/fdt-dump.c b/xen/common/device-tree/fdt-dump.c
new file mode 100644
index 000000000000..fc3d9eca5891
--- /dev/null
+++ b/xen/common/device-tree/fdt-dump.c
@@ -0,0 +1,180 @@
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
+        while ( (s < se) && *s && isprint(*s) )
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
+void __init device_tree_dump(const void *fdt)
+{
+    int node, depth = 0;
+    /* Depth up to which nodes are open and still have to be closed. */
+    int open_depth = 0;
+
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
index 0e82ccea2f84..08983375209b 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -99,6 +99,19 @@ int device_tree_for_each_node(const void *fdt, int node,
                               device_tree_node_func func,
                               void *data);
 
+/*
+ * device_tree_dump - print a device tree blob in a DTS-like format
+ * @fdt: flat device tree.
+ *
+ * The tree is printed at debug log level and is only meant to be used for
+ * debugging, so it is a no-op unless CONFIG_DEVICE_TREE_DEBUG is enabled.
+ */
+#ifdef CONFIG_DEVICE_TREE_DEBUG
+void device_tree_dump(const void *fdt);
+#else
+static inline void device_tree_dump(const void *fdt) {}
+#endif
+
 typedef enum {
     BOOTMOD_XEN,
     BOOTMOD_FDT,
-- 
2.55.0


