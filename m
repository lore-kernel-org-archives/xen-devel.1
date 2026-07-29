Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822B7C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 14:13:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376000.1622985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp51v-0004kt-Cn; Wed, 29 Jul 2026 14:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376000.1622985; Wed, 29 Jul 2026 14:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp51v-0004km-A2; Wed, 29 Jul 2026 14:13:07 +0000
Received: by outflank-mailman (input) for mailman id 1376000;
 Wed, 29 Jul 2026 14:13:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wp51u-0004kf-IC
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:13:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp51t-007tFy-V2
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 16:13:05 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a6a0a5a-2eae-0a2a0a5409dd-0a2a4504edaa-40
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:13:05 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a6a0a71-b57f-0a2a45040019-c387df83b358-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 16:13:05 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DE7E83E08;
 Wed, 29 Jul 2026 14:12:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C97F779A1;
 Wed, 29 Jul 2026 14:12:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id TNflJGgKampuJwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 29 Jul 2026 14:12:56 +0000
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
	t=1785334381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PzcBAV0niX1QSCV+ZrT4H7Zx6/xF1w51Zr20c1YgxiY=;
	b=l3aeot7AK4dBgQAr3Qu1dKsD36zmHJ/BJq1YL6wXwI7VSog5y+dPVaa7lPqq8dgnrvLYrJ
	o8GIqdxNhBMtHWEE3EOgixCPswr3SSIIZxt0Otj3HLOarlZD/XD7z1gAKiVMagVhqUDx6K
	tIBH4xGeLLdEkONVyg1iqMQuUjA+zMw=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=KlxMSZTM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1785334376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=PzcBAV0niX1QSCV+ZrT4H7Zx6/xF1w51Zr20c1YgxiY=;
	b=KlxMSZTMEjHCxQNE7NsbzrSmN/HPyjzkv6nvxiOwRFSNrHhUtuKSYMFziRHDNa4EdjanOl
	Z22zPgbVD1KHXnmddQLG9UHpDIEWm7/McWo75C4Gnu+DdvF5gYW5axXjGlUEC4RviD+jr3
	4lcW72a8IeG1XZNQcLNF6R0EAZwFDNY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/evtchn: fix wrong usage of array_index_nospec()
Date: Wed, 29 Jul 2026 16:12:54 +0200
Message-ID: <20260729141254.345989-1-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Queue-Id: DE7E83E08
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-purgate-ID: tlsNG-ebf023/1785334385-C32CCB50-557DE739/0/0
X-purgate-type: clean
X-purgate-size: 1332

The size passed to array_index_nospec() in evtchn_fifo_word_from_port()
doesn't match the value it is meant to clamp.

Fix it by clamping the port to a safe interval and use that value to
calculate the event_array[] index and the offset into the page
addressed by the array element.

Fixes: 443d3ab6daee ("evtchn: block speculative out-of-bound accesses")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/event_fifo.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index cae08a594e..eb8e26bba1 100644
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -71,11 +71,10 @@ static inline event_word_t *evtchn_fifo_word_from_port(const struct domain *d,
      */
     smp_rmb();
 
-    p = array_index_nospec(port / EVTCHN_FIFO_EVENT_WORDS_PER_PAGE,
-                           d->evtchn_fifo->num_evtchns);
-    w = port % EVTCHN_FIFO_EVENT_WORDS_PER_PAGE;
+    p = array_index_nospec(port, d->evtchn_fifo->num_evtchns);
+    w = p % EVTCHN_FIFO_EVENT_WORDS_PER_PAGE;
 
-    return d->evtchn_fifo->event_array[p] + w;
+    return d->evtchn_fifo->event_array[p / EVTCHN_FIFO_EVENT_WORDS_PER_PAGE] + w;
 }
 
 static void cf_check evtchn_fifo_init(struct domain *d, struct evtchn *evtchn)
-- 
2.55.0


