Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC05FC53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 12:07:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375645.1622764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp344-0000o7-Me; Wed, 29 Jul 2026 12:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375645.1622764; Wed, 29 Jul 2026 12:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp344-0000nw-IW; Wed, 29 Jul 2026 12:07:12 +0000
Received: by outflank-mailman (input) for mailman id 1375645;
 Wed, 29 Jul 2026 12:07:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wp342-0000mb-T5
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 12:07:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp342-00HPjJ-9q
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 14:07:10 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a69ece9-5cb7-0a2a0a5109dd-0a2a450be72a-24
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 14:07:10 +0200
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6a69eced-b7e8-0a2a450b0019-c387df82a262-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 14:07:10 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 914737CACE;
 Wed, 29 Jul 2026 12:07:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 645B1779A1;
 Wed, 29 Jul 2026 12:07:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BlkXF+XsaWrgKAAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 29 Jul 2026 12:07:01 +0000
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
	t=1785326825; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJ9KZC1N9lgIdK6gjTKt/b/8X+SICl0CjKrsBqav+I4=;
	b=I5UCs0MSXGEe5X5BT1cjVVdsDsvL83fC23AzpL/LeDy3Jiqc3urSlR8xg9UG3dewPcXEe4
	dlpSm6bOiMPGu64PIJ0VgpLXI43mH2ClVumw6Bt/1mGCNgy9p8m0lfaPsWMd8BXhPNR5Mp
	CxC6f8TJw7aP0hgZCQ0ZHt2XKj8v4iU=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1785326821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJ9KZC1N9lgIdK6gjTKt/b/8X+SICl0CjKrsBqav+I4=;
	b=EYPDMgeXbiRRZMo25vBd4TcYha5c5DAPjegC41TfARM8s3egi+txgEgN1YAxvE/qwr2jo8
	5CeDxQwqKyuiDSLEw/L4FuQwTF6ZGcqoPi7qZSvPEhrIyeqxG8iSr+iQwcGjQgDaih2s0b
	QK8XQ2wkJcGcL5efkfcN8A8cQABZZqc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	Dietmar Hahn <dietmar.hahn@fujitsu.com>
Subject: [PATCH 2/2] xen/sched: fix schedule_dump() handling of free cpus
Date: Wed, 29 Jul 2026 14:06:43 +0200
Message-ID: <20260729120643.327387-3-jgross@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729120643.327387-1-jgross@suse.com>
References: <20260729120643.327387-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fujitsu.com:email,imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-purgate-ID: tlsNG-42698a/1785326830-AAAD89EA-092B6C06/0/0
X-purgate-type: clean
X-purgate-size: 1469

With the introduction of core scheduling cpus not used by any cpupool
have been switched to use the very simple idle scheduler instead of the
default scheduler.

Trying to obtain diagnostic scheduling data via the "r" debug key is
scanning through all cpupools using the per-cpupool scheduler to print
the related data. Unfortunately the switch to use the idle scheduler
for free cpus wasn't reflected in schedule_dump(), causing the default
scheduler's dump_cpu_state callback to be used for free cpus.

This causes NULL dereferences in case the default scheduler is one of
credit or null.

Fix that by using the idle scheduler instead of the default scheduler
for free cpus. Note that it is fine for a scheduler to have no
dump_cpu_state callback.

Fixes: f855dd962523 ("sched: add minimalistic idle scheduler for free cpus")
Reported-by: Dietmar Hahn <dietmar.hahn@fujitsu.com>
Tested-by:  Dietmar Hahn <dietmar.hahn@fujitsu.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 55b71301cf..9ccf5811bf 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3452,7 +3452,7 @@ void schedule_dump(struct cpupool *c)
     }
     else
     {
-        sched = &operations;
+        sched = &sched_idle_ops;
         cpus = &cpupool_free_cpus;
     }
 
-- 
2.55.0


