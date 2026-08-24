Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CEEC5DF94
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 07:12:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398693.1634834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyOqa-0003UV-NZ; Mon, 24 Aug 2026 07:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398693.1634834; Mon, 24 Aug 2026 07:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyOqa-0003UO-Kx; Mon, 24 Aug 2026 07:11:56 +0000
Received: by outflank-mailman (input) for mailman id 1398693;
 Mon, 24 Aug 2026 07:11:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dfaggioli@suse.com>) id 1wyOqZ-0003UI-Oy
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 07:11:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyOqX-00739i-Mb
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 09:11:53 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dfaggioli@suse.com>)
 id 6a8beeab-2eae-0a2a0a5409dd-0a2a4506b9cc-36
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 09:11:53 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dfaggioli@suse.com>)
 id 6a8beeb9-195a-0a2a45060019-c387df83dc70-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 09:11:53 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D1CBB3E29;
 Mon, 24 Aug 2026 07:11:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 586D313332;
 Mon, 24 Aug 2026 07:11:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id vJsjErDui2poXQAAD6G6ig
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1787555509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jJ8qGw+agFErzPYv0YCncP3NT4a3nGW2CIWK9s/ZZZA=;
	b=rL+EL+MWW0IqpTQeWdQ4ZNoRkHYomq2i8Oftw0qi9rbBMWIhxtNVbAzEq74pc1b6zhWmuj
	PA4sTcxre9+SMbN2Thb0abFaGijHyDlL9GUcoVb8PxY9QUj8b9CrgFuCTz9IXoabZdgE/K
	vlk+xG5S2dFyDXHWwcjnDZylHh92Gp0=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=boEpiZM1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1787555504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jJ8qGw+agFErzPYv0YCncP3NT4a3nGW2CIWK9s/ZZZA=;
	b=boEpiZM1/G7aZB5zrtrOnw9MYhMQ0hdQTmvI9rBARKvkdggVzCPo3HCtWWrp4OnI0R9kYu
	UBCDeyQ+qvFuihIErnJL0jUhpFhTIcQ7Hm6MCfSNRuVm8KLGlQdBfJYfQFWcSTWJVJSQk3
	310i8sSE8p0vDQRdtsIMLnrhkHsgWWI=
From: Dario Faggioli <dfaggioli@suse.com>
To: qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
	sstabellini@kernel.org,
	anthony@xenproject.org,
	edgar.iglesias@gmail.com,
	philmd@mailo.com,
	odaki@rsg.ci.i.u-tokyo.ac.jp,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [RFC PATCH 0/1] hw/display/xenfb: always register vfb and allocate console early
Date: Mon, 24 Aug 2026 09:11:15 +0200
Message-ID: <20260824071116.935828-1-dfaggioli@suse.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.com:mid,suse.com:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,kernel.org,xenproject.org,gmail.com,mailo.com,rsg.ci.i.u-tokyo.ac.jp,suse.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Queue-Id: D1CBB3E29
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-purgate-ID: tlsNG-16d1c6/1787555513-FD40B77B-B1E0AA59/0/0
X-purgate-type: clean
X-purgate-size: 2045

Hello,

We've been having an issue with Xen PV and PVH guests' console since:

https://bugzilla.suse.com/show_bug.cgi?id=1232712
https://lists.nongnu.org/archive/html/qemu-devel/2024-12/msg02294.html

Back then, until our QEMU 11.0 package, I "solved" it locally by reverting
these two commits:

6ece1df966 hw/xen: Register framebuffer backend via xen_backend_init()
e99441a379 ui/curses: Do not use console_select()

For the 11.1 package, I decided it was enough and finally managed to find
the time to investigate a bit more (and, yes, I know I should have done
this earlier, but never could... Sorry :-( ).

From my debugging, these are the problems:

1. Commit 6ece1df966 restricted the vfb backend registration under an
   'if (vga_interface_type == VGA_XENFB)'. However, it can happen that the
   -vga parameter is just not provided (e.g., for PV and PVH guests) and the
   backend is never initialized.

2. Once the backend is registered, xenfb defers the QemuConsole creation to
   fb_initialise(). The VNC server, though, starts earlier, finds no active
   consoles, and binds to the dummy surface (black screen showing the message
   "This VM has no graphic display device"). Furthermore, since the removal
   of console_select(), such surface is never dropped for switching to the
   actual xenfb console.

I have drafted a patch to address both issues. It removes the
vga_interface_type check and moves qemu_graphic_console_create() to fb_init()
so the console is created "early enough".

I am sending this as an RFC because, although it fixes the problem in my
testing, I am no expert in the QEMU UI subsystem and I am not sure that these
are the correct and/or the best solutions.

I'm happy to try to come up and/or to test different approaches and/or patches.

Thanks and Regards,
Dario

Dario Faggioli (1):
  hw/display/xenfb: always register vfb and allocate console early

 hw/display/xenfb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.55.0


