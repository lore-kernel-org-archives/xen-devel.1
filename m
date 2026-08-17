Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C09EC5CFC1
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 07:19:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392497.1631478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvrci-0005Z8-3k; Mon, 17 Aug 2026 07:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392497.1631478; Mon, 17 Aug 2026 07:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvrci-0005Yy-0U; Mon, 17 Aug 2026 07:19:08 +0000
Received: by outflank-mailman (input) for mailman id 1392497;
 Mon, 17 Aug 2026 07:19:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wvrcf-0005SL-OJ
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 07:19:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvrcf-00Fq6W-4u
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 09:19:05 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a82b5e9-8faa-0a2a0a5109dd-0a2a4507ce94-0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:19:05 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a82b5e8-b4ea-0a2a45070019-c387df82a520-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:19:05 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 87DEE83EA1;
 Mon, 17 Aug 2026 07:18:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 66A547933D;
 Mon, 17 Aug 2026 07:18:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id q4X0F+C1gmqwPwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 17 Aug 2026 07:18:56 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1786951140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jz9nxDviL3DwVV7FG8Py1n1l8eGXnnA2gyfKebkXks0=;
	b=LO2GD1GsZAke8p0iuYt8iZ/n97H4LPgBLCDLCmmsrJYuz4uy8JxQ5HmEFBNM0Q5tvd39rV
	Trnl9yhhMianKdbwegyXaTGLghYn6VAxGQrtu9A2tPdv/CwwvS1mrGE8IpX79Ywm+A6+Uj
	zIeEGpPdj/sZQ+D0JB/br/Wyi+xCRI0=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1786951136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jz9nxDviL3DwVV7FG8Py1n1l8eGXnnA2gyfKebkXks0=;
	b=uaGT8T4fKbfFSj07IXgCCJIeYvXvbIhyVTBM7fSDXVKqof+cnVMxdlwD82vviCSUC/NWzb
	71f2nUeKFRQzFaQC/G6UBkl7Oyhq2QBP+9YTbrU5/piHVKRidLdePZVXg4jIlcPu9BGsQn
	zEZeneZt4lWXR0s/UL4nliYgOiWyQ1M=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 2/4] stubdom: remove pciutils
Date: Mon, 17 Aug 2026 09:18:41 +0200
Message-ID: <20260817071843.114898-3-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817071843.114898-1-jgross@suse.com>
References: <20260817071843.114898-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,sourceware.org:url,gnu.org:url,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-ef75cf/1786951145-A6CDFAE4-C61C9F2C/0/0
X-purgate-type: clean
X-purgate-size: 16091

There is no user of libpci left in stubdoms.

Remove libpci from the stubdom build system.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 config/Stubdom.mk.in      |   3 -
 stubdom/.gitignore        |   1 -
 stubdom/Makefile          |  33 +----
 stubdom/configure         |  21 ---
 stubdom/configure.ac      |   1 -
 stubdom/libpci.config.h   |   5 -
 stubdom/libpci.config.mak |   7 -
 stubdom/pciutils.patch    | 298 --------------------------------------
 8 files changed, 2 insertions(+), 367 deletions(-)
 delete mode 100644 stubdom/libpci.config.h
 delete mode 100644 stubdom/libpci.config.mak
 delete mode 100644 stubdom/pciutils.patch

diff --git a/config/Stubdom.mk.in b/config/Stubdom.mk.in
index 0d70d03941..b90eaee75a 100644
--- a/config/Stubdom.mk.in
+++ b/config/Stubdom.mk.in
@@ -14,9 +14,6 @@ STUBDOM_INSTALL     := @STUBDOM_INSTALL@
 ZLIB_VERSION        := @ZLIB_VERSION@
 ZLIB_URL            := @ZLIB_URL@
 
-LIBPCI_VERSION      := @LIBPCI_VERSION@
-LIBPCI_URL          := @LIBPCI_URL@
-
 NEWLIB_VERSION      := @NEWLIB_VERSION@
 NEWLIB_URL          := @NEWLIB_URL@
 
diff --git a/stubdom/.gitignore b/stubdom/.gitignore
index 08f2e9b432..8c6dc00f83 100644
--- a/stubdom/.gitignore
+++ b/stubdom/.gitignore
@@ -23,7 +23,6 @@
 /mk-headers-*
 /newlib-1.*
 /newlib-x86*
-/pciutils-*
 /pkg-config/*
 /polarssl-*
 /tpm_emulator-*
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 40b6ececf1..f542a4295a 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -122,34 +122,6 @@ $(ZLIB_STAMPFILE): zlib-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
 	  $(MAKE) DESTDIR= libz.a && \
 	  $(MAKE) DESTDIR= install )
 
-##############
-# Cross-libpci
-##############
-
-pciutils-$(LIBPCI_VERSION).tar.bz2:
-	$(FETCHER) $@ $(LIBPCI_URL)/$@
-
-pciutils-$(XEN_TARGET_ARCH): pciutils-$(LIBPCI_VERSION).tar.bz2
-	tar xjf $<
-	mv pciutils-$(LIBPCI_VERSION) $@
-	patch -d $@ -p1 < pciutils.patch
-	touch $@
-
-LIBPCI_STAMPFILE=$(CROSS_ROOT)/$(GNU_TARGET_ARCH)-xen-elf/lib/libpci.a
-.PHONY: cross-libpci
-cross-libpci: $(LIBPCI_STAMPFILE)
-$(LIBPCI_STAMPFILE): pciutils-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE) $(ZLIB_STAMPFILE)
-	( cd $< && \
-	  cp ../libpci.config.h lib/config.h && \
-	  chmod u+w lib/config.h && \
-	  echo '#define PCILIB_VERSION "$(LIBPCI_VERSION)"' >> lib/config.h && \
-	  ln -sf ../../libpci.config.mak lib/config.mk && \
-	  $(MAKE) DESTDIR= CC="$(CC) $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) -I$(call realpath,$(MINI_OS)/include)" lib/libpci.a && \
-	  $(INSTALL_DATA) lib/libpci.a $(CROSS_PREFIX)/$(GNU_TARGET_ARCH)-xen-elf/lib/ && \
-	  $(INSTALL_DIR) $(CROSS_PREFIX)/$(GNU_TARGET_ARCH)-xen-elf/include/pci && \
-	  $(INSTALL_DATA) lib/config.h lib/header.h lib/pci.h lib/types.h $(CROSS_PREFIX)/$(GNU_TARGET_ARCH)-xen-elf/include/pci/ \
-	)
-
 ######
 # lwIP
 ######
@@ -250,7 +222,7 @@ cross-tpmemu: $(TPMEMU_STAMPFILE)
 #######
 
 .PHONY: $(CROSS_ROOT)
-$(CROSS_ROOT): cross-newlib cross-zlib cross-libpci
+$(CROSS_ROOT): cross-newlib cross-zlib
 
 #######
 # libraries under tools/libs
@@ -477,7 +449,7 @@ clean:
 crossclean: clean
 	rm -fr $(CROSS_ROOT)
 	rm -fr newlib-$(XEN_TARGET_ARCH)
-	rm -fr zlib-$(XEN_TARGET_ARCH) pciutils-$(XEN_TARGET_ARCH)
+	rm -fr zlib-$(XEN_TARGET_ARCH)
 	rm -fr libs-$(XEN_TARGET_ARCH)
 	rm -fr xenstore xenstorepvh
 	rm -fr gmp-$(XEN_TARGET_ARCH)
@@ -502,7 +474,6 @@ downloadclean: patchclean
 	rm -f zlib-$(ZLIB_VERSION).tar.gz
 	rm -f gmp-$(GMP_VERSION).tar.bz2
 	rm -f tpm_emulator-$(TPMEMU_VERSION).tar.gz
-	rm -f pciutils-$(LIBPCI_VERSION).tar.bz2
 	rm -f lwip-$(LWIP_VERSION).tar.gz
 	rm -f polarssl-$(POLARSSL_VERSION)-gpl.tgz
 
diff --git a/stubdom/configure b/stubdom/configure
index 689ff4d6ed..f3d63dceff 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -634,8 +634,6 @@ LWIP_VERSION
 LWIP_URL
 NEWLIB_VERSION
 NEWLIB_URL
-LIBPCI_VERSION
-LIBPCI_URL
 ZLIB_VERSION
 ZLIB_URL
 INSTALL_DATA
@@ -725,7 +723,6 @@ LDFLAGS
 LIBS
 CPPFLAGS
 ZLIB_URL
-LIBPCI_URL
 NEWLIB_URL
 LWIP_URL
 GMP_URL
@@ -1376,7 +1373,6 @@ Some influential environment variables:
   CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
               you have headers in a nonstandard directory <include dir>
   ZLIB_URL    Download url for zlib
-  LIBPCI_URL  Download url for libpci
   NEWLIB_URL  Download url for newlib
   LWIP_URL    Download url for lwip
   GMP_URL     Download url for libgmp
@@ -4038,23 +4034,6 @@ ZLIB_VERSION="1.2.3"
 
 
 
-if test "x$LIBPCI_URL" = "x"
-then :
-
-	if test "x$extfiles" = "xy"
-then :
-  LIBPCI_URL=\$\(XEN_EXTFILES_URL\)
-else $as_nop
-  LIBPCI_URL="https://mirrors.edge.kernel.org/pub/software/utils/pciutils"
-fi
-
-fi
-LIBPCI_VERSION="2.2.9"
-
-
-
-
-
 if test "x$NEWLIB_URL" = "x"
 then :
 
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index 6ff3ab0ee9..d3d2a840d3 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -39,7 +39,6 @@ AX_DEPENDS_PATH_PROG([vtpm], [CMAKE], [cmake])
 
 # Stubdom libraries version and url setup
 AX_STUBDOM_LIB([ZLIB], [zlib], [1.2.3])
-AX_STUBDOM_LIB([LIBPCI], [libpci], [2.2.9], [https://mirrors.edge.kernel.org/pub/software/utils/pciutils])
 AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [https://sourceware.org/ftp/newlib])
 AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [https://download.savannah.gnu.org/releases/lwip])
 AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [https://gmplib.org/download/gmp/archive])
diff --git a/stubdom/libpci.config.h b/stubdom/libpci.config.h
deleted file mode 100644
index 28c2f6ab31..0000000000
--- a/stubdom/libpci.config.h
+++ /dev/null
@@ -1,5 +0,0 @@
-#define PCI_OS_MINIOS
-#define PCI_HAVE_STDINT_H
-#define PCI_PATH_IDS_DIR "."
-#define PCI_COMPRESSED_IDS
-#define PCI_IDS "pci.ids.gz"
diff --git a/stubdom/libpci.config.mak b/stubdom/libpci.config.mak
deleted file mode 100644
index 5c8632cf07..0000000000
--- a/stubdom/libpci.config.mak
+++ /dev/null
@@ -1,7 +0,0 @@
-LIBZ=-lz
-LDLIBS+=$(LIBZ)
-PCI_OS_MINIOS=1
-PCI_HAVE_STDINT_H=1
-PCI_PATH_IDS_DIR=.
-PCI_COMPRESSED_IDS=1
-PCI_IDS=pci.ids.gz
diff --git a/stubdom/pciutils.patch b/stubdom/pciutils.patch
deleted file mode 100644
index 5ab84d6cce..0000000000
--- a/stubdom/pciutils.patch
+++ /dev/null
@@ -1,298 +0,0 @@
-diff -urN pciutils-2.2.9.orig/lib/access.c pciutils-2.2.9/lib/access.c
---- pciutils-2.2.9.orig/lib/access.c	2007-02-06 11:59:43.000000000 +0000
-+++ pciutils-2.2.9/lib/access.c	2008-06-30 19:07:09.713187000 +0100
-@@ -57,6 +57,11 @@
- #else
-   NULL,
- #endif
-+#ifdef PCI_OS_MINIOS
-+  &pm_minios,
-+#else
-+  NULL,
-+#endif
- };
- 
- struct pci_access *
---- pciutils-2.2.9.orig/lib/pci.h	2006-09-09 13:46:06.000000000 +0100
-+++ pciutils-2.2.9/lib/pci.h	2008-06-30 18:56:15.350111000 +0100
-@@ -33,6 +33,7 @@
-   PCI_ACCESS_NBSD_LIBPCI,		/* NetBSD libpci */
-   PCI_ACCESS_OBSD_DEVICE,		/* OpenBSD /dev/pci */
-   PCI_ACCESS_DUMP,			/* Dump file (params: filename) */
-+  PCI_ACCESS_MINIOS,			/* MiniOS */
-   PCI_ACCESS_MAX
- };
- 
---- pciutils-2.2.9.orig/lib/internal.h	2006-09-09 11:52:47.000000000 +0100
-+++ pciutils-2.2.9/lib/internal.h	2008-07-01 10:46:24.968202000 +0100
-@@ -37,4 +37,4 @@
- 
- extern struct pci_methods pm_intel_conf1, pm_intel_conf2, pm_linux_proc,
- 	pm_fbsd_device, pm_aix_device, pm_nbsd_libpci, pm_obsd_device,
--	pm_dump, pm_linux_sysfs;
-+	pm_dump, pm_linux_sysfs, pm_minios;
---- pciutils-2.2.9.orig/lib/Makefile	2007-10-19 13:41:34.000000000 +0100
-+++ pciutils-2.2.9/lib/Makefile	2008-07-01 12:13:14.400525000 +0100
-@@ -46,6 +46,12 @@
- PCILIB=libpciutils.a
- endif
- 
-+ifdef PCI_OS_MINIOS
-+XEN_ROOT=$(CURDIR)/../../..
-+include $(XEN_ROOT)/Config.mk
-+OBJS += minios.o
-+endif
-+
- all: $(PCILIB) $(PCILIBPC)
- 
- $(PCILIB): $(OBJS)
---- pciutils-2.2.9.orig/lib/types.h    2009-07-14 18:18:59.000000000 +0200
-+++ pciutils-2.2.9/lib/types.h 2009-07-14 18:19:16.000000000 +0200
-@@ -20,10 +20,12 @@ typedef DWORD u32;
- typedef uint8_t u8;
- typedef uint16_t u16;
- typedef uint32_t u32;
-+typedef uint64_t u64;
- #else
- typedef u_int8_t u8;
- typedef u_int16_t u16;
- typedef u_int32_t u32;
-+typedef u_int64_t u64;
- #endif
-
- #ifdef PCI_HAVE_64BIT_ADDRESS
- 
---- pciutils-2.2.9.orig/lib/minios.c	1970-01-01 01:00:00.000000000 +0100
-+++ pciutils-2.2.9/lib/minios.c	2008-07-01 12:31:40.554260000 +0100
-@@ -0,0 +1,106 @@
-+/*
-+ *	The PCI Library -- MiniOS PCI frontend access
-+ *
-+ *	Samuel Thibault <samuel.thibault@eu.citrix.com>, 2008
-+ *
-+ *	Can be freely distributed and used under the terms of the GNU GPL.
-+ */
-+
-+#include <os.h>
-+#include <pcifront.h>
-+#include <xenbus.h>
-+#include "internal.h"
-+
-+static int
-+minios_detect(struct pci_access *a)
-+{
-+  return 1;
-+}
-+
-+static void
-+minios_init(struct pci_access *a)
-+{
-+}
-+
-+static void
-+minios_cleanup(struct pci_access *a)
-+{
-+  shutdown_pcifront(NULL);
-+}
-+
-+static void
-+minios_scan(struct pci_access *a)
-+{
-+  void func(unsigned int domain, unsigned int bus, unsigned int slot, unsigned int fun)
-+  {
-+    struct pci_dev *d = pci_alloc_dev(a);
-+
-+    d->domain = domain;
-+    d->bus = bus;
-+    d->dev = slot;
-+    d->func = fun;
-+
-+    pci_link_dev(a, d);
-+  }
-+
-+  pcifront_scan(NULL, func);
-+}
-+
-+static int
-+minios_read(struct pci_dev *d, int pos, byte *buf, int len)
-+{
-+  unsigned int val;
-+  switch (len) {
-+    case 1:
-+      if (pcifront_conf_read(NULL, d->domain, d->bus, d->dev, d->func, pos, len, &val))
-+        return 0;
-+      * buf = val;
-+      return 1;
-+    case 2:
-+      if (pcifront_conf_read(NULL, d->domain, d->bus, d->dev, d->func, pos, len, &val))
-+        return 0;
-+      *(u16 *) buf = cpu_to_le16((u16) val);
-+      return 1;
-+    case 4:
-+      if (pcifront_conf_read(NULL, d->domain, d->bus, d->dev, d->func, pos, len, &val))
-+        return 0;
-+      *(u32 *) buf = cpu_to_le32((u32) val);
-+      return 1;
-+    default:
-+      return pci_generic_block_read(d, pos, buf, len);
-+  }
-+}
-+
-+static int
-+minios_write(struct pci_dev *d, int pos, byte *buf, int len)
-+{
-+  unsigned int val;
-+  switch (len) {
-+    case 1:
-+      val = * buf;
-+      break;
-+    case 2:
-+      val = le16_to_cpu(*(u16 *) buf);
-+      break;
-+    case 4:
-+      val = le32_to_cpu(*(u32 *) buf);
-+      break;
-+    default:
-+      return pci_generic_block_write(d, pos, buf, len);
-+  }
-+  return !pcifront_conf_write(NULL, d->domain, d->bus, d->dev, d->func, pos, len, val);
-+}
-+
-+struct pci_methods pm_minios = {
-+  "MiniOS-device",
-+  NULL,                                 /* config */
-+  minios_detect,
-+  minios_init,
-+  minios_cleanup,
-+  minios_scan,
-+  pci_generic_fill_info,
-+  minios_read,
-+  minios_write,
-+  NULL,                                 /* dev_init */
-+  NULL                                  /* dev_cleanup */
-+};
---- pciutils-2.2.9/lib/generic.c	2007-02-06 12:00:05.000000000 +0000
-+++ pciutils-2.2.9-mine/lib/generic.c	2008-07-01 19:13:52.289949000 +0100
-@@ -74,6 +74,19 @@
-   pci_generic_scan_bus(a, busmap, 0);
- }
- 
-+static u32 pci_size(u32 base, u32 maxbase, u32 mask)
-+{
-+  u32 size = mask & maxbase;
-+  if (!size)
-+    return 0;
-+  size = (size & ~(size-1)) - 1;
-+
-+  if (base == maxbase && ((base | size) & mask) != mask)
-+    return 0;
-+
-+  return size + 1;
-+}
-+
- int
- pci_generic_fill_info(struct pci_dev *d, int flags)
- {
-@@ -114,23 +127,61 @@
- 	      if (!x || x == (u32) ~0)
- 		continue;
- 	      if ((x & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO)
--		d->base_addr[i] = x;
--	      else
-+                {
-+                  d->base_addr[i] = x & PCI_BASE_ADDRESS_IO_MASK;
-+                  if (flags & PCI_FILL_SIZES)
-+                    {
-+                      u32 size;
-+                      pci_write_long(d, PCI_BASE_ADDRESS_0 + i*4, ~0);
-+                      d->size[i] = pci_size(x, pci_read_long(d, PCI_BASE_ADDRESS_0 + i*4), PCI_BASE_ADDRESS_IO_MASK);
-+                      pci_write_long(d, PCI_BASE_ADDRESS_0 + i*4, x);
-+                    }
-+                }
-+              else
- 		{
- 		  if ((x & PCI_BASE_ADDRESS_MEM_TYPE_MASK) != PCI_BASE_ADDRESS_MEM_TYPE_64)
--		    d->base_addr[i] = x;
-+                    {
-+                      d->base_addr[i] = x & PCI_BASE_ADDRESS_MEM_MASK;
-+                      if (flags & PCI_FILL_SIZES)
-+                        {
-+                          u32 size;
-+                          pci_write_long(d, PCI_BASE_ADDRESS_0 + i*4, ~0);
-+                          d->size[i] = pci_read_long(d, PCI_BASE_ADDRESS_0 + i*4);
-+                          d->size[i] = pci_size(x, pci_read_long(d, PCI_BASE_ADDRESS_0 + i*4), PCI_BASE_ADDRESS_MEM_MASK);
-+                          pci_write_long(d, PCI_BASE_ADDRESS_0 + i*4, x);
-+                        }
-+                    }
- 		  else if (i >= cnt-1)
- 		    a->warning("%04x:%02x:%02x.%d: Invalid 64-bit address seen for BAR %d.", d->domain, d->bus, d->dev, d->func, i);
- 		  else
- 		    {
- 		      u32 y = pci_read_long(d, PCI_BASE_ADDRESS_0 + (++i)*4);
- #ifdef PCI_HAVE_64BIT_ADDRESS
--		      d->base_addr[i-1] = x | (((pciaddr_t) y) << 32);
-+		      d->base_addr[i-1] = (x | (((pciaddr_t) y) << 32)) & PCI_BASE_ADDRESS_MEM_MASK;
-+                      if (flags & PCI_FILL_SIZES)
-+                        {
-+                          u32 size;
-+                          pci_write_long(d, PCI_BASE_ADDRESS_0 + (i-1)*4, ~0);
-+                          pci_write_long(d, PCI_BASE_ADDRESS_0 + i*4, ~0);
-+                          d->size[i-1] = pci_size(y, pci_read_long(d, PCI_BASE_ADDRESS_0 + (i-1)*4) | 
-+                                         pci_read_long(d, PCI_BASE_ADDRESS_0 + i*4), 0xffffffff );
-+                          pci_write_long(d, PCI_BASE_ADDRESS_0 + (i-1)*4, x);
-+                          pci_write_long(d, PCI_BASE_ADDRESS_0 + i*4, y);
-+                        }
- #else
- 		      if (y)
- 			a->warning("%04x:%02x:%02x.%d 64-bit device address ignored.", d->domain, d->bus, d->dev, d->func);
- 		      else
--			d->base_addr[i-1] = x;
-+                        {
-+                          d->base_addr[i-1] = x & PCI_BASE_ADDRESS_MEM_MASK;
-+                          if (flags & PCI_FILL_SIZES)
-+                            {
-+                              u32 size;
-+                              pci_write_long(d, PCI_BASE_ADDRESS_0 + (i-1)*4, ~0);
-+                              d->size[i-1] = pci_size(x, pci_read_long(d, PCI_BASE_ADDRESS_0 + (i-1)*4), PCI_BASE_ADDRESS_MEM_MASK);
-+                              pci_write_long(d, PCI_BASE_ADDRESS_0 + (i-1)*4, x);
-+                            }
-+                        }
- #endif
- 		    }
- 		}
-@@ -154,10 +205,19 @@
- 	{
- 	  u32 u = pci_read_long(d, reg);
- 	  if (u != 0xffffffff)
--	    d->rom_base_addr = u;
-+            {
-+              d->rom_base_addr = u;
-+              if (flags & PCI_FILL_SIZES)
-+                {
-+                  u32 size;
-+                  pci_write_long(d, reg, ~0);
-+                  d->rom_size = pci_read_long(d, reg);
-+                  pci_write_long(d, reg, u);
-+                }
-+            }
- 	}
-     }
--  return flags & ~PCI_FILL_SIZES;
-+  return flags;
- }
- 
- static int
-diff -uNpbE -uNpbEr pciutils-2.2.9.orig/lib/sysdep.h pciutils-2.2.9/lib/sysdep.h
---- pciutils-2.2.9.orig/lib/sysdep.h	2007-02-06 12:00:18.000000000 +0000
-+++ pciutils-2.2.9/lib/sysdep.h	2009-07-22 16:26:30.000000000 +0100
-@@ -32,6 +32,10 @@ typedef u16 word;
- 
- #else
- 
-+#ifdef PCI_OS_MINIOS
-+#include <machine/endian.h>
-+#endif
-+
- #ifdef PCI_OS_LINUX
- #include <endian.h>
- #define BYTE_ORDER __BYTE_ORDER
-- 
2.55.0


