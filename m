Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DD6C44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 08:19:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366243.1616139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljD7-0005ti-Gh; Mon, 20 Jul 2026 08:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366243.1616139; Mon, 20 Jul 2026 08:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljD7-0005tV-Dp; Mon, 20 Jul 2026 08:18:49 +0000
Received: by outflank-mailman (input) for mailman id 1366243;
 Mon, 20 Jul 2026 08:18:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wljD6-0005si-8L
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 08:18:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wljD5-008gXE-LC
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:18:47 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a5dd9e5-e002-0a2a0a5209dd-0a2a45039940-18
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:18:47 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a5dd9e7-fae8-0a2a45030019-c387df82bd3c-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:18:47 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 42BC379E46;
 Mon, 20 Jul 2026 08:18:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E01B779AA;
 Mon, 20 Jul 2026 08:18:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gY8KBufZXWrGXgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 20 Jul 2026 08:18:47 +0000
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
	t=1784535527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6EAc2AbX/aQuKD/P9abpYa37fs6FYgsEE4fa9CoGsA=;
	b=BSVnLg8oYtfHgJlFSRoU8KoDH7hEe74V41rkCOQ86k+f1GeGwBySCD5UHiAwj35RzVoUST
	+tN6OvPoYeA7Hy5NGeyDoPUCQNsq0aXxg2ZewTQdFILIu1YzNOWSd2a9KkShAMWAP1iwvO
	QLG2UUzeYOCC7fNyFyw9FNG3zwketyg=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=BSVnLg8o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1784535527; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z6EAc2AbX/aQuKD/P9abpYa37fs6FYgsEE4fa9CoGsA=;
	b=BSVnLg8oYtfHgJlFSRoU8KoDH7hEe74V41rkCOQ86k+f1GeGwBySCD5UHiAwj35RzVoUST
	+tN6OvPoYeA7Hy5NGeyDoPUCQNsq0aXxg2ZewTQdFILIu1YzNOWSd2a9KkShAMWAP1iwvO
	QLG2UUzeYOCC7fNyFyw9FNG3zwketyg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 2/5] stubdom: remove support for building in 32-bit mode
Date: Mon, 20 Jul 2026 10:18:29 +0200
Message-ID: <20260720081833.4122182-3-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260720081833.4122182-1-jgross@suse.com>
References: <20260720081833.4122182-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 42BC379E46
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:email,suse.com:mid];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-purgate-ID: tlsNG-33051d/1784535527-6D4D74E9-FE930673/0/0
X-purgate-type: clean
X-purgate-size: 1110

With the removal of grub-pv there is no 32-bit stubdom left.

Remove 32-bit support from the stubdom build system.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/Makefile | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 850e8544ca..2698bddc9d 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -31,15 +31,7 @@ endef
 $(foreach lib,$(LIBS_LIBS),$(eval $(call LIB_deps,$(lib))))
 
 GNU_TARGET_ARCH:=$(XEN_TARGET_ARCH)
-ifeq ($(XEN_TARGET_ARCH),x86_32)
-GNU_TARGET_ARCH:=i686
-endif
 
-ifeq ($(GNU_TARGET_ARCH), i686)
-TARGET_CFLAGS=
-NEWLIB_CFLAGS+=-D_I386MACH_ALLOW_HW_INTERRUPTS
-STUBDOM_SUPPORTED=1
-endif
 ifeq ($(GNU_TARGET_ARCH), x86_64)
 TARGET_CFLAGS=-mno-red-zone
 NEWLIB_CFLAGS+=-D_I386MACH_ALLOW_HW_INTERRUPTS
@@ -179,9 +171,6 @@ gmp-$(GMP_VERSION).tar.bz2:
 	$(FETCHER) $@ $(GMP_URL)/$@
 
 .PHONY: cross-gmp
-ifeq ($(XEN_TARGET_ARCH), x86_32)
-   GMPEXT=ABI=32
-endif
 gmp-$(XEN_TARGET_ARCH): gmp-$(GMP_VERSION).tar.bz2 $(NEWLIB_STAMPFILE)
 	tar xjf $<
 	rm $@ -rf || :
-- 
2.54.0


