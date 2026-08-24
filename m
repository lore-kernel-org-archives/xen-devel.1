Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A711CC5DF81
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 07:12:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398697.1634843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyOr6-0003sk-V4; Mon, 24 Aug 2026 07:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398697.1634843; Mon, 24 Aug 2026 07:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyOr6-0003sb-SY; Mon, 24 Aug 2026 07:12:28 +0000
Received: by outflank-mailman (input) for mailman id 1398697;
 Mon, 24 Aug 2026 07:12:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dfaggioli@suse.com>) id 1wyOr6-0003sR-Ba
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 07:12:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyOr5-000tfE-EU
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 09:12:27 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dfaggioli@suse.com>)
 id 6a8beeb9-8faa-0a2a0a5109dd-0a2a4501e50a-0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 09:11:53 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dfaggioli@suse.com>)
 id 6a8beeb9-5984-0a2a45010019-c387df829436-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 09:11:53 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E5D3865B9;
 Mon, 24 Aug 2026 07:11:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DBDF013335;
 Mon, 24 Aug 2026 07:11:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QDQDM7Dui2poXQAAD6G6ig
 (envelope-from <dfaggioli@suse.com>); Mon, 24 Aug 2026 07:11:44 +0000
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
	t=1787555509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQQzKc7fXgnyMVrT3Qi+0O4dsqzanUM4EfhHa4x9i88=;
	b=GRStE1zEjdoaZF7EeV1Qc7jRkK7AFsxQA8zdFSVrPuizxFKRrAFOHMrsza/kFNsjB79xxE
	JWtob8YtgEk2/+f8py9pZJf21SN362D2Bn2CJ2V6sRbyF0OlfhUzhq+tOwyXACWVqPx9uR
	06HjGZgDUwehZ+NfSocrJmxgXwu/2PI=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Rp8Zz61W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1787555505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RQQzKc7fXgnyMVrT3Qi+0O4dsqzanUM4EfhHa4x9i88=;
	b=Rp8Zz61WHAlZSqPrBHhVp2p/cTyKMXbTTswW8U98VQ8PoqXtbEqdD2SPXx9rqtAGKRbO0F
	2t3vqe9Rrjo+QVmXF7QGBMVTSs4I5ZjQ2B4ECwskTSUdOX1qbCXwC1PtO565DKAo+RStmP
	xYPR1XbzwMgxVfg4/qLGwPTPBq2KlQM=
From: Dario Faggioli <dfaggioli@suse.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	sstabellini@kernel.org,
	anthony@xenproject.org,
	edgar.iglesias@gmail.com,
	philmd@mailo.com,
	odaki@rsg.ci.i.u-tokyo.ac.jp,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [RFC PATCH 1/1] hw/display/xenfb: always register vfb and allocate console early
Date: Mon, 24 Aug 2026 09:11:16 +0200
Message-ID: <20260824071116.935828-2-dfaggioli@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824071116.935828-1-dfaggioli@suse.com>
References: <20260824071116.935828-1-dfaggioli@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 5E5D3865B9
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xenproject.org,gmail.com,mailo.com,rsg.ci.i.u-tokyo.ac.jp,suse.com];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-purgate-ID: tlsNG-d62444/1787555513-BDC79757-20543C4E/0/0
X-purgate-type: clean
X-purgate-size: 2659

This commit addresses a black console issues for Xen PV and PVH guests.

In fact, commit 6ece1df966 ("hw/xen: Register framebuffer backend via
xen_backend_init()") introduced a check before registering the vfb
backend. Problem is that the '-vga' agrument may not be present (e.g.,
for PV/PVH guests started with 'xl') and this causes the backend to be
silently ignored.

This commit restores the unconditional registration of the vfb backend.

Furthermore, even with the backend always being registered, the fact
that xenfb allocates the QemuConsole asynchronously in fb_initialise()
looks problematic. In fact, when the UI initializes, it finds 0 active
consoles and it permanently allocates a dummy surface showing the
message "This VM has no graphic display device". And since the removal
of console_select() there's no way to dynamically switch to the xenfb
console, when it is finally up and running.

This commit works around the issue by moving console creation to
fb_init(), so that VNC attaches to it immediately. The surface is then
updated normally via qemu_console_set_surface() once the guest framebuffer
is mapped.

Fixes: 6ece1df966 ("hw/xen: Register framebuffer backend via xen_backend_init()")
Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
---
 hw/display/xenfb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index ae302b217f..3a0cdc0578 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -851,9 +851,14 @@ static void xenfb_handle_events(struct XenFB *xenfb)
 
 static int fb_init(struct XenLegacyDevice *xendev)
 {
+    struct XenFB *fb = container_of(xendev, struct XenFB, c.xendev);
+
 #ifdef XENFB_TYPE_RESIZE
     xenstore_write_be_int(xendev, "feature-resize", 1);
 #endif
+
+    fb->con = qemu_graphic_console_create(NULL, 0, &xenfb_ops, fb);
+
     return 0;
 }
 
@@ -882,8 +887,6 @@ static int fb_initialise(struct XenLegacyDevice *xendev)
     if (rc != 0)
         return rc;
 
-    fb->con = qemu_graphic_console_create(NULL, 0, &xenfb_ops, fb);
-
     if (xenstore_read_fe_int(xendev, "feature-update", &fb->feature_update) == -1)
         fb->feature_update = 0;
     if (fb->feature_update)
@@ -973,9 +976,6 @@ static const GraphicHwOps xenfb_ops = {
 static void xen_ui_register_backend(void)
 {
     xen_be_register("vkbd", &xen_kbdmouse_ops);
-
-    if (vga_interface_type == VGA_XENFB) {
-        xen_be_register("vfb", &xen_framebuffer_ops);
-    }
+    xen_be_register("vfb", &xen_framebuffer_ops);
 }
 xen_backend_init(xen_ui_register_backend);
-- 
2.55.0


