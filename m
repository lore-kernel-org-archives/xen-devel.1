Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1308C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 07:19:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392496.1631469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvrce-0005IU-Ri; Mon, 17 Aug 2026 07:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392496.1631469; Mon, 17 Aug 2026 07:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvrce-0005IN-Ov; Mon, 17 Aug 2026 07:19:04 +0000
Received: by outflank-mailman (input) for mailman id 1392496;
 Mon, 17 Aug 2026 07:19:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wvrcc-00055D-Sd
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 07:19:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvrcc-002YtT-9e
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 09:19:02 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a82b5e2-2eae-0a2a0a5409dd-0a2a4509ad96-6
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:19:02 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a82b5e6-be1a-0a2a45090019-c387df83b234-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:19:02 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F2D763E0F;
 Mon, 17 Aug 2026 07:19:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D2BC179340;
 Mon, 17 Aug 2026 07:19:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id c9ViMuW1gmq3PwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 17 Aug 2026 07:19:01 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: smtp-out2.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 3/4] stubdom: remove build of zlib
Date: Mon, 17 Aug 2026 09:18:42 +0200
Message-ID: <20260817071843.114898-4-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817071843.114898-1-jgross@suse.com>
References: <20260817071843.114898-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: F2D763E0F
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-purgate-ID: tlsNG-bad1c0/1786951142-BC8C9034-5E764E0C/0/0
X-purgate-type: clean
X-purgate-size: 4435

The last users of zlib for stubdoms have been removed.

Remove zlib from the stubdom build system, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 config/Stubdom.mk.in |  3 ---
 stubdom/.gitignore   |  1 -
 stubdom/Makefile     | 24 +-----------------------
 stubdom/configure    | 15 ---------------
 stubdom/configure.ac |  1 -
 5 files changed, 1 insertion(+), 43 deletions(-)

diff --git a/config/Stubdom.mk.in b/config/Stubdom.mk.in
index b90eaee75a..dc0a3b54b3 100644
--- a/config/Stubdom.mk.in
+++ b/config/Stubdom.mk.in
@@ -11,9 +11,6 @@ STUBDOM_TARGETS     := @STUBDOM_TARGETS@
 STUBDOM_BUILD       := @STUBDOM_BUILD@
 STUBDOM_INSTALL     := @STUBDOM_INSTALL@
 
-ZLIB_VERSION        := @ZLIB_VERSION@
-ZLIB_URL            := @ZLIB_URL@
-
 NEWLIB_VERSION      := @NEWLIB_VERSION@
 NEWLIB_URL          := @NEWLIB_URL@
 
diff --git a/stubdom/.gitignore b/stubdom/.gitignore
index 8c6dc00f83..e5d5744361 100644
--- a/stubdom/.gitignore
+++ b/stubdom/.gitignore
@@ -29,4 +29,3 @@
 /vtpm/vtpm_manager.h
 /xenstore
 /xenstorepvh
-/zlib-*
diff --git a/stubdom/Makefile b/stubdom/Makefile
index f542a4295a..8830deebce 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -102,26 +102,6 @@ $(NEWLIB_STAMPFILE): mk-headers-$(XEN_TARGET_ARCH) newlib-$(NEWLIB_VERSION)
 	  $(MAKE) DESTDIR= && \
 	  $(MAKE) DESTDIR= install )
 
-############
-# Cross-zlib
-############
-
-zlib-$(ZLIB_VERSION).tar.gz:
-	$(FETCHER) $@ $(ZLIB_URL)/$@
-
-zlib-$(XEN_TARGET_ARCH): zlib-$(ZLIB_VERSION).tar.gz 
-	tar xzf $<
-	mv zlib-$(ZLIB_VERSION) $@
-
-ZLIB_STAMPFILE=$(CROSS_ROOT)/$(GNU_TARGET_ARCH)-xen-elf/lib/libz.a
-.PHONY: cross-zlib
-cross-zlib: $(ZLIB_STAMPFILE)
-$(ZLIB_STAMPFILE): zlib-$(XEN_TARGET_ARCH) $(NEWLIB_STAMPFILE)
-	( cd $< && \
-	  CFLAGS="$(TARGET_CPPFLAGS) $(TARGET_CFLAGS)" CC=$(CC) ./configure --prefix=$(CROSS_PREFIX)/$(GNU_TARGET_ARCH)-xen-elf && \
-	  $(MAKE) DESTDIR= libz.a && \
-	  $(MAKE) DESTDIR= install )
-
 ######
 # lwIP
 ######
@@ -222,7 +202,7 @@ cross-tpmemu: $(TPMEMU_STAMPFILE)
 #######
 
 .PHONY: $(CROSS_ROOT)
-$(CROSS_ROOT): cross-newlib cross-zlib
+$(CROSS_ROOT): cross-newlib
 
 #######
 # libraries under tools/libs
@@ -449,7 +429,6 @@ clean:
 crossclean: clean
 	rm -fr $(CROSS_ROOT)
 	rm -fr newlib-$(XEN_TARGET_ARCH)
-	rm -fr zlib-$(XEN_TARGET_ARCH)
 	rm -fr libs-$(XEN_TARGET_ARCH)
 	rm -fr xenstore xenstorepvh
 	rm -fr gmp-$(XEN_TARGET_ARCH)
@@ -471,7 +450,6 @@ patchclean: crossclean
 .PHONY: downloadclean
 downloadclean: patchclean
 	rm -f newlib-$(NEWLIB_VERSION).tar.gz
-	rm -f zlib-$(ZLIB_VERSION).tar.gz
 	rm -f gmp-$(GMP_VERSION).tar.bz2
 	rm -f tpm_emulator-$(TPMEMU_VERSION).tar.gz
 	rm -f lwip-$(LWIP_VERSION).tar.gz
diff --git a/stubdom/configure b/stubdom/configure
index f3d63dceff..1a5687d32b 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -634,8 +634,6 @@ LWIP_VERSION
 LWIP_URL
 NEWLIB_VERSION
 NEWLIB_URL
-ZLIB_VERSION
-ZLIB_URL
 INSTALL_DATA
 INSTALL_SCRIPT
 INSTALL_PROGRAM
@@ -722,7 +720,6 @@ CFLAGS
 LDFLAGS
 LIBS
 CPPFLAGS
-ZLIB_URL
 NEWLIB_URL
 LWIP_URL
 GMP_URL
@@ -1372,7 +1369,6 @@ Some influential environment variables:
   LIBS        libraries to pass to the linker, e.g. -l<library>
   CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
               you have headers in a nonstandard directory <include dir>
-  ZLIB_URL    Download url for zlib
   NEWLIB_URL  Download url for newlib
   LWIP_URL    Download url for lwip
   GMP_URL     Download url for libgmp
@@ -4023,17 +4019,6 @@ fi
 # Stubdom libraries version and url setup
 
 
-if test "x$ZLIB_URL" = "x"
-then :
-
-	ZLIB_URL=\$\(XEN_EXTFILES_URL\)
-fi
-ZLIB_VERSION="1.2.3"
-
-
-
-
-
 if test "x$NEWLIB_URL" = "x"
 then :
 
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index d3d2a840d3..34a47c95e1 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -38,7 +38,6 @@ AC_PROG_INSTALL
 AX_DEPENDS_PATH_PROG([vtpm], [CMAKE], [cmake])
 
 # Stubdom libraries version and url setup
-AX_STUBDOM_LIB([ZLIB], [zlib], [1.2.3])
 AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [https://sourceware.org/ftp/newlib])
 AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [https://download.savannah.gnu.org/releases/lwip])
 AX_STUBDOM_LIB([GMP], [libgmp], [4.3.2], [https://gmplib.org/download/gmp/archive])
-- 
2.55.0


