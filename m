Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03FC606A324
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=M7quML3H;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=M7quML3H
Received: from list by lists.xenproject.org with outflank-mailman.1484373.1687712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRB4P-0006Um-2N; Wed, 11 Nov 2026 16:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484373.1687712; Wed, 11 Nov 2026 16:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRB4O-0006Ud-W2; Wed, 11 Nov 2026 16:21:08 +0000
Received: by outflank-mailman (input) for mailman id 1484373;
 Wed, 11 Nov 2026 16:21:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xRB4N-0006UC-JN
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:21:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRB4M-000R5p-Vk
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 17:21:06 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af495e3-bab6-0a2a0a5309dd-0a2a4508c8d6-42
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 17:21:06 +0100
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af495f2-f659-0a2a45080019-c387df82e28c-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 17:21:06 +0100
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 66E5F21E20;
 Wed, 11 Nov 2026 16:21:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 108C3134E5;
 Wed, 11 Nov 2026 16:21:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jphANPGV9GoGAwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 11 Nov 2026 16:21:06 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794414066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FxBAbV0izYrRrCVmV/Lhrk7G0zfUxlgRLfpCEF5MJuI=;
	b=M7quML3H12c0bAAZGKdWgSNbhHrMX2cQ/KIUENvcQab+UQKzNMfDyWewk5hUbNAzZhN6qB
	7VltbfEk/wurt5lRzDCS27Py5BPsW62Gf7iFeGICy1N4FZboyjoet7qp3k+Kx+6LrFtpHn
	0UF+MrmkeJ7mmzCp3I5zFh08uoy47NE=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=M7quML3H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794414066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FxBAbV0izYrRrCVmV/Lhrk7G0zfUxlgRLfpCEF5MJuI=;
	b=M7quML3H12c0bAAZGKdWgSNbhHrMX2cQ/KIUENvcQab+UQKzNMfDyWewk5hUbNAzZhN6qB
	7VltbfEk/wurt5lRzDCS27Py5BPsW62Gf7iFeGICy1N4FZboyjoet7qp3k+Kx+6LrFtpHn
	0UF+MrmkeJ7mmzCp3I5zFh08uoy47NE=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/3] xen-blkback: Remove statistics logging on console
Date: Wed, 11 Nov 2026 17:20:56 +0100
Message-ID: <20261111162058.804033-2-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111162058.804033-1-jgross@suse.com>
References: <20261111162058.804033-1-jgross@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 66E5F21E20
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-12.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -12.01
X-purgate-ID: tlsNG-c1860d/1794414066-DFAD487B-092975DE/35/110847
X-purgate-type: clean
X-purgate-size: 3163
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The xen-blkback can print I/O statistics data to the console every
10 seconds. This functionality has been present since the introduction
of xen-blkback, but retrieving the data is possible via sysfs, too.

So remove the console logging, as there is no need to have the same
functionality twice.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/block/xen-blkback/blkback.c | 25 -------------------------
 drivers/block/xen-blkback/common.h  |  1 -
 drivers/block/xen-blkback/xenbus.c  |  1 -
 3 files changed, 27 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 88526e349ce1..f3a8f3eae86b 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -126,10 +126,6 @@ MODULE_PARM_DESC(max_ring_page_order, "Maximum order of pages to be used for the
  */
 #define LRU_PERCENT_CLEAN 5
 
-/* Run-time switchable: /sys/module/blkback/parameters/ */
-static unsigned int log_stats;
-module_param(log_stats, int, 0644);
-
 #define BLKBACK_INVALID_HANDLE (~0)
 
 static inline bool persistent_gnt_timeout(struct persistent_gnt *persistent_gnt)
@@ -536,21 +532,6 @@ irqreturn_t xen_blkif_be_int(int irq, void *dev_id)
  * SCHEDULER FUNCTIONS
  */
 
-static void print_stats(struct xen_blkif_ring *ring)
-{
-	pr_info("(%s): oo %3llu  |  rd %4llu  |  wr %4llu  |  f %4llu"
-		 "  |  ds %4llu | pg: %4u/%4d\n",
-		 current->comm, ring->st_oo_req,
-		 ring->st_rd_req, ring->st_wr_req,
-		 ring->st_f_req, ring->st_ds_req,
-		 ring->persistent_gnt_c, max_pgrants);
-	ring->st_print = jiffies + secs_to_jiffies(10);
-	ring->st_rd_req = 0;
-	ring->st_wr_req = 0;
-	ring->st_oo_req = 0;
-	ring->st_ds_req = 0;
-}
-
 int xen_blkif_schedule(void *arg)
 {
 	struct xen_blkif_ring *ring = arg;
@@ -614,17 +595,11 @@ int xen_blkif_schedule(void *arg)
 		else
 			gnttab_page_cache_shrink(&ring->free_pages,
 						 max_buffer_pages);
-
-		if (log_stats && time_after(jiffies, ring->st_print))
-			print_stats(ring);
 	}
 
 	/* Drain pending purge work */
 	flush_work(&ring->persistent_purge_work);
 
-	if (log_stats)
-		print_stats(ring);
-
 	ring->xenblkd = NULL;
 
 	return 0;
diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
index f5890b3f1df9..0a60e29a7cc3 100644
--- a/drivers/block/xen-blkback/common.h
+++ b/drivers/block/xen-blkback/common.h
@@ -277,7 +277,6 @@ struct xen_blkif_ring {
 	unsigned long           next_lru;
 
 	/* Statistics. */
-	unsigned long		st_print;
 	unsigned long long	st_rd_req;
 	unsigned long long	st_wr_req;
 	unsigned long long	st_oo_req;
diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index 8d0ff8fcac22..62e3bad4ab0e 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -158,7 +158,6 @@ static int xen_blkif_alloc_rings(struct xen_blkif *blkif,
 		init_waitqueue_head(&ring->pending_free_wq);
 		init_waitqueue_head(&ring->shutdown_wq);
 		ring->blkif = blkif;
-		ring->st_print = jiffies;
 		ring->active = true;
 	}
 
-- 
2.56.0


