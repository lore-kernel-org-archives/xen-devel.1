Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA1AC4451B
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 08:19:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366244.1616149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljDD-0006Dk-Ol; Mon, 20 Jul 2026 08:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366244.1616149; Mon, 20 Jul 2026 08:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljDD-0006Dd-L9; Mon, 20 Jul 2026 08:18:55 +0000
Received: by outflank-mailman (input) for mailman id 1366244;
 Mon, 20 Jul 2026 08:18:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wljDB-0006BU-QP
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 08:18:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wljDB-000Q8b-7D
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:18:53 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a5dd9e5-2eae-0a2a0a5409dd-0a2a4506b5d4-32
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:18:53 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a5dd9ed-195a-0a2a45060019-c387df828f60-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:18:53 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BAF3379E46;
 Mon, 20 Jul 2026 08:18:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95AB1779AA;
 Mon, 20 Jul 2026 08:18:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ABMqI+zZXWrLXgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 20 Jul 2026 08:18:52 +0000
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
	t=1784535532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rR6a7u62PrIE8LmzzOCco11yRON8r8BBfjyeOxn53M=;
	b=Twg0vhucaNAvaoxVABi3APoMRF/QHfavTSV6x2mEHmnlb+3B2ClmXyFhuPK1bTY/HzXDG9
	9FypavQX2z88Yytf6SG0mRaFCE2ng8KXZJHFbuT/fjMNsY718Z7J0CwKJbY8O8tjnSsci+
	jaQSq5Z7ucQo7R0qnNBS3NfFbUoY60U=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Twg0vhuc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1784535532; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rR6a7u62PrIE8LmzzOCco11yRON8r8BBfjyeOxn53M=;
	b=Twg0vhucaNAvaoxVABi3APoMRF/QHfavTSV6x2mEHmnlb+3B2ClmXyFhuPK1bTY/HzXDG9
	9FypavQX2z88Yytf6SG0mRaFCE2ng8KXZJHFbuT/fjMNsY718Z7J0CwKJbY8O8tjnSsci+
	jaQSq5Z7ucQo7R0qnNBS3NfFbUoY60U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 3/5] stubdom: remove building of libxenguest and libxenctrl
Date: Mon, 20 Jul 2026 10:18:30 +0200
Message-ID: <20260720081833.4122182-4-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260720081833.4122182-1-jgross@suse.com>
References: <20260720081833.4122182-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BAF3379E46
X-purgate-ID: tlsNG-16d1c6/1784535533-F480577B-4A5DA928/0/0
X-purgate-type: clean
X-purgate-size: 784

grub-pv was the last user of the stubdom variants of libxenguest and
libxenctrl.

Remove both libraries from the stubdom build system.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 2698bddc9d..40b6ececf1 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -256,9 +256,7 @@ $(CROSS_ROOT): cross-newlib cross-zlib cross-libpci
 # libraries under tools/libs
 #######
 
-STUB_LIBS := toolcore toollog evtchn gnttab call foreignmemory devicemodel ctrl guest manage
-
-LIBDEP_guest := cross-zlib
+STUB_LIBS := toolcore toollog evtchn gnttab call foreignmemory devicemodel manage
 
 #######
 # common handling
-- 
2.54.0


