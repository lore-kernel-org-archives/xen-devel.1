Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44025C98307
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 07:28:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428273.1651024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uvS-0000sq-Is; Tue, 22 Sep 2026 07:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428273.1651024; Tue, 22 Sep 2026 07:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uvS-0000sh-EF; Tue, 22 Sep 2026 07:28:26 +0000
Received: by outflank-mailman (input) for mailman id 1428273;
 Tue, 22 Sep 2026 07:28:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1x8uvR-0000r7-4W
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 07:28:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8uvQ-00Eo3r-H0
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 09:28:24 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6ab22e18-8faa-0a2a0a5109dd-0a2a45018594-0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 09:28:24 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6ab22e18-5984-0a2a45010019-c387df82a256-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 09:28:24 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D791E21B41;
 Tue, 22 Sep 2026 07:28:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90275139EE;
 Tue, 22 Sep 2026 07:28:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 9yUzGg8usmroXQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 22 Sep 2026 07:28:15 +0000
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
	t=1790062100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Tjr53TjzcY2Euedmp8hrOEc/dVhYgBczdwHGnlXh3I=;
	b=khWsM89GcYA3GmZK4tEG5MibBYrKM2jGN4fay/U4NmK86rl6nQsxlujDNpkbdwQbYdh7YH
	A1k0KAfHyX4MLX2FWcbRePtA6p8yRFfwSl4FQiOASqvFNtHfxVGfh5ANPO+RO/7lQVfxeC
	03+lHCc9MUVsKL0TgSqA1Q+5rK8yDtk=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=hButAnh+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1790062095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Tjr53TjzcY2Euedmp8hrOEc/dVhYgBczdwHGnlXh3I=;
	b=hButAnh+DgsJr29lUq3PqaQGoq3ZofNiuxYx96sB5oxBh3ve7pIBPdJkn3eD9ZUyZIeChg
	Lsgur0FGs9qd/+c8SPTRxjVUrIIF2fW95u0oj2d0nPIeH30KvHklZBIEh8S8ftCKZfSxyj
	QePI4lVwszQhEXOCCKZvJDD8q7z5pjQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v3 3/4] stubdom: remove build of zlib
Date: Tue, 22 Sep 2026 09:27:10 +0200
Message-ID: <20260922072711.385956-4-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922072711.385956-1-jgross@suse.com>
References: <20260922072711.385956-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D791E21B41
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,suse.com:dkim,suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[gnu.org:url,suse.com:dkim,suse.com:email,suse.com:mid,ens-lyon.org:email];
	DKIM_TRACE(0.00)[suse.com:+]
X-purgate-ID: tlsNG-d62444/1790062104-1F46D757-3C6A3E53/35/110847
X-purgate-type: clean
X-purgate-size: 4680

The last users of zlib for stubdoms have been removed.

Remove zlib from the stubdom build system, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
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
index 254f8d2fc8..164694dd14 100644
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
 #######################################################################
 # There used to be a slightly modified version of pciutils, this is now
 # available under https://github.com/pciutils/pciutils/pull/236
@@ -227,7 +207,7 @@ cross-tpmemu: $(TPMEMU_STAMPFILE)
 #######
 
 .PHONY: $(CROSS_ROOT)
-$(CROSS_ROOT): cross-newlib cross-zlib
+$(CROSS_ROOT): cross-newlib
 
 #######
 # libraries under tools/libs
@@ -454,7 +434,6 @@ clean:
 crossclean: clean
 	rm -fr $(CROSS_ROOT)
 	rm -fr newlib-$(XEN_TARGET_ARCH)
-	rm -fr zlib-$(XEN_TARGET_ARCH)
 	rm -fr libs-$(XEN_TARGET_ARCH)
 	rm -fr xenstore xenstorepvh
 	rm -fr gmp-$(XEN_TARGET_ARCH)
@@ -476,7 +455,6 @@ patchclean: crossclean
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


