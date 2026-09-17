Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F78C982D0
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 07:54:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423730.1648675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x76wn-0000KX-FP; Thu, 17 Sep 2026 07:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423730.1648675; Thu, 17 Sep 2026 07:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x76wn-0000KI-AG; Thu, 17 Sep 2026 07:54:21 +0000
Received: by outflank-mailman (input) for mailman id 1423730;
 Thu, 17 Sep 2026 07:54:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x76wl-0000JO-W9
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 07:54:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x76wl-00Cg8p-Cw
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 09:54:19 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6aab9ca8-bab6-0a2a0a5309dd-0a2a45088d44-20
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 09:54:19 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6aab9cab-f659-0a2a45080019-c387df83e14c-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 09:54:19 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EAA0420020;
 Thu, 17 Sep 2026 07:54:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A805F1374A;
 Thu, 17 Sep 2026 07:54:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id leFHHqGcq2oYPgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 17 Sep 2026 07:54:09 +0000
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
	t=1789631654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sq2juZmccS1kbSX34mhsDq8iUQGA6RiaIGaDBw9BsD4=;
	b=pFYpzXgPW3spsAZknQedbpzIcRu9UuchSHiH1huH4wg+hCbq5j2zVSCMVwcLT1bIUZH+Sn
	kAFnexkhXFk+juc1HV3dot4fUGYbTrUwnUvhXpgMym1cttYcKVBsGdglEX0NAYPwE8hwQ3
	j4czyznqzqYZ3Goylckb97uUPMIR76M=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1789631649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sq2juZmccS1kbSX34mhsDq8iUQGA6RiaIGaDBw9BsD4=;
	b=vUEGeo6SMR7PBlvsx00UDLJg5GZBi6k1i313USWy2wkz/fuSxqJgnO8C6Wz9BdnZ0ND2vd
	HlNR14yZd+hARXMD/RQoJmYKP8mFkv4Bdr4kUvTjr3zmJbj6HZAOpTbeHo5swWio6OxqA3
	2ZCUXUbhiQSXetZgPec9kJWjEaFk4Rw=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 2/4] stubdom: remove build of zlib
Date: Thu, 17 Sep 2026 09:53:49 +0200
Message-ID: <20260917075351.37208-3-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917075351.37208-1-jgross@suse.com>
References: <20260917075351.37208-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,sourceware.org:url,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-c1860d/1789631659-D795A87B-FE99E032/35/110847
X-purgate-type: clean
X-purgate-size: 4648

The last users of zlib for stubdoms have been removed.

Remove zlib from the stubdom build system, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 config/Stubdom.mk.in |  3 ---
 stubdom/.gitignore   |  1 -
 stubdom/Makefile     | 25 ++-----------------------
 stubdom/configure    | 15 ---------------
 stubdom/configure.ac |  1 -
 5 files changed, 2 insertions(+), 43 deletions(-)

diff --git a/config/Stubdom.mk.in b/config/Stubdom.mk.in
index 0d70d03941..59f5e955e3 100644
--- a/config/Stubdom.mk.in
+++ b/config/Stubdom.mk.in
@@ -11,9 +11,6 @@ STUBDOM_TARGETS     := @STUBDOM_TARGETS@
 STUBDOM_BUILD       := @STUBDOM_BUILD@
 STUBDOM_INSTALL     := @STUBDOM_INSTALL@
 
-ZLIB_VERSION        := @ZLIB_VERSION@
-ZLIB_URL            := @ZLIB_URL@
-
 LIBPCI_VERSION      := @LIBPCI_VERSION@
 LIBPCI_URL          := @LIBPCI_URL@
 
diff --git a/stubdom/.gitignore b/stubdom/.gitignore
index 08f2e9b432..021ad263ff 100644
--- a/stubdom/.gitignore
+++ b/stubdom/.gitignore
@@ -30,4 +30,3 @@
 /vtpm/vtpm_manager.h
 /xenstore
 /xenstorepvh
-/zlib-*
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 40b6ececf1..2e0d65e26b 100644
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
 ##############
 # Cross-libpci
 ##############
@@ -250,7 +230,7 @@ cross-tpmemu: $(TPMEMU_STAMPFILE)
 #######
 
 .PHONY: $(CROSS_ROOT)
-$(CROSS_ROOT): cross-newlib cross-zlib cross-libpci
+$(CROSS_ROOT): cross-newlib cross-libpci
 
 #######
 # libraries under tools/libs
@@ -477,7 +457,7 @@ clean:
 crossclean: clean
 	rm -fr $(CROSS_ROOT)
 	rm -fr newlib-$(XEN_TARGET_ARCH)
-	rm -fr zlib-$(XEN_TARGET_ARCH) pciutils-$(XEN_TARGET_ARCH)
+	rm -fr pciutils-$(XEN_TARGET_ARCH)
 	rm -fr libs-$(XEN_TARGET_ARCH)
 	rm -fr xenstore xenstorepvh
 	rm -fr gmp-$(XEN_TARGET_ARCH)
@@ -499,7 +479,6 @@ patchclean: crossclean
 .PHONY: downloadclean
 downloadclean: patchclean
 	rm -f newlib-$(NEWLIB_VERSION).tar.gz
-	rm -f zlib-$(ZLIB_VERSION).tar.gz
 	rm -f gmp-$(GMP_VERSION).tar.bz2
 	rm -f tpm_emulator-$(TPMEMU_VERSION).tar.gz
 	rm -f pciutils-$(LIBPCI_VERSION).tar.bz2
diff --git a/stubdom/configure b/stubdom/configure
index 689ff4d6ed..259d3768ed 100755
--- a/stubdom/configure
+++ b/stubdom/configure
@@ -636,8 +636,6 @@ NEWLIB_VERSION
 NEWLIB_URL
 LIBPCI_VERSION
 LIBPCI_URL
-ZLIB_VERSION
-ZLIB_URL
 INSTALL_DATA
 INSTALL_SCRIPT
 INSTALL_PROGRAM
@@ -724,7 +722,6 @@ CFLAGS
 LDFLAGS
 LIBS
 CPPFLAGS
-ZLIB_URL
 LIBPCI_URL
 NEWLIB_URL
 LWIP_URL
@@ -1375,7 +1372,6 @@ Some influential environment variables:
   LIBS        libraries to pass to the linker, e.g. -l<library>
   CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
               you have headers in a nonstandard directory <include dir>
-  ZLIB_URL    Download url for zlib
   LIBPCI_URL  Download url for libpci
   NEWLIB_URL  Download url for newlib
   LWIP_URL    Download url for lwip
@@ -4027,17 +4023,6 @@ fi
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
 if test "x$LIBPCI_URL" = "x"
 then :
 
diff --git a/stubdom/configure.ac b/stubdom/configure.ac
index 6ff3ab0ee9..5ef1dead11 100644
--- a/stubdom/configure.ac
+++ b/stubdom/configure.ac
@@ -38,7 +38,6 @@ AC_PROG_INSTALL
 AX_DEPENDS_PATH_PROG([vtpm], [CMAKE], [cmake])
 
 # Stubdom libraries version and url setup
-AX_STUBDOM_LIB([ZLIB], [zlib], [1.2.3])
 AX_STUBDOM_LIB([LIBPCI], [libpci], [2.2.9], [https://mirrors.edge.kernel.org/pub/software/utils/pciutils])
 AX_STUBDOM_LIB([NEWLIB], [newlib], [1.16.0], [https://sourceware.org/ftp/newlib])
 AX_STUBDOM_LIB([LWIP], [lwip], [1.3.0], [https://download.savannah.gnu.org/releases/lwip])
-- 
2.55.0


