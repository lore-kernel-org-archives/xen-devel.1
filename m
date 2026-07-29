Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EDEC54F52
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 12:07:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375643.1622751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp33y-0000P1-Hi; Wed, 29 Jul 2026 12:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375643.1622751; Wed, 29 Jul 2026 12:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp33y-0000Ot-Bn; Wed, 29 Jul 2026 12:07:06 +0000
Received: by outflank-mailman (input) for mailman id 1375643;
 Wed, 29 Jul 2026 12:07:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wp33x-0000Lg-Ag
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 12:07:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp33w-0006Zi-Nj
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:07:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a69ece2-e002-0a2a0a5209dd-0a2a4506c790-22
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 14:07:04 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a69ece8-195a-0a2a45060019-c387df82c4e2-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 14:07:04 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 164C27CA08;
 Wed, 29 Jul 2026 12:06:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB925779B1;
 Wed, 29 Jul 2026 12:06:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id w8o5NN/saWrZKAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 29 Jul 2026 12:06:55 +0000
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
	t=1785326820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0BQAZ0Qu4PKd0KoO61TIZjvwax8MIaVRGF11HrjtQV0=;
	b=gsoQUgqaEvbTNE6+MDquTTB760Esmpl7EYtfzlJRtZHjNOZ24W3IvXxw8reoaOmr7TNCWL
	U4Bi/sHjedRcELCMz51lPxApV/LFnnkvCPAIm8CU4kxMTs/egyybhKQUjOIKMWNZKWZjSh
	3FrCQ2He0s74JTkdfAhYyjVN0a37VCA=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=GNaneZ6y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1785326816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0BQAZ0Qu4PKd0KoO61TIZjvwax8MIaVRGF11HrjtQV0=;
	b=GNaneZ6yJNJGAQb6hcL582mHt1eUbgvcWuT7DD4q+0vwGuja114zo54v1Qg/92Cj9uXrYY
	ooDT1XyLVxrFtDu9a1w7siNQR5Wb/MoCq9PMxaPfMF+9OsNrF7H/Z25BqZWPvIuv3Q2CfG
	XmOK1rjfuVoacAhIfnB4ofIPyaI7Me8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	Dietmar Hahn <dietmar.hahn@fujitsu.com>
Subject: [PATCH 1/2] xen/credit: fix race with schedule_cpu_rm() in csched_timer()
Date: Wed, 29 Jul 2026 14:06:42 +0200
Message-ID: <20260729120643.327387-2-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729120643.327387-1-jgross@suse.com>
References: <20260729120643.327387-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 164C27CA08
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fujitsu.com:email,suse.com:mid,suse.com:email,suse.com:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-purgate-ID: tlsNG-16d1c6/1785326824-F74C977B-497F951E/0/0
X-purgate-type: clean
X-purgate-size: 1289

When removing a CPU from a cpupool running the credit scheduler, a
race might happen between schedule_cpu_rm() and csched_timer(),
resulting in a NULL dereference.

The timer associated with csched_timer() is killed only in
csched_deinit_pdata(), which is called by schedule_cpu_rm() after
setting the scheduler's per-cpu data to NULL AND after enabling
interrupts again. This can result in the timer to fire before it is
being killed, so csched_timer() needs to test the per-cpu data to be
set before accessing it.

Fixes: 78be3dbbfefa ("cpupools [1/6]: hypervisor changes")
Reported-by: Dietmar Hahn <dietmar.hahn@fujitsu.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/credit.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 328c802d0c..4dde2ede12 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -1589,6 +1589,10 @@ static void cf_check csched_tick(void *_cpu)
     struct csched_pcpu *spc = CSCHED_PCPU(cpu);
     struct csched_private *prv = CSCHED_PRIV(sr->scheduler);
 
+    /* Handle race of timer disabling vs. firing when switching scheduler. */
+    if ( !spc )
+        return;
+
     spc->tick++;
 
     /*
-- 
2.55.0


