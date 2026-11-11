Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91797606A32A
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 16:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=l3qeiwj3;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=WvTBTjvR
Received: from list by lists.xenproject.org with outflank-mailman.1484374.1687721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRB4U-0006l4-7r; Wed, 11 Nov 2026 16:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484374.1687721; Wed, 11 Nov 2026 16:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRB4U-0006kx-5E; Wed, 11 Nov 2026 16:21:14 +0000
Received: by outflank-mailman (input) for mailman id 1484374;
 Wed, 11 Nov 2026 16:21:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xRB4T-0006j0-2g
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:21:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRB4S-004LtL-Fg
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 17:21:12 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af495ee-e002-0a2a0a5209dd-0a2a4509ac70-10
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 17:21:12 +0100
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af495f8-be1a-0a2a45090019-c387df83c29c-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 17:21:12 +0100
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F0D371F80D;
 Wed, 11 Nov 2026 16:21:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A668A134E5;
 Wed, 11 Nov 2026 16:21:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id JF4yIfeV9GoXAwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 11 Nov 2026 16:21:11 +0000
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
	t=1794414072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=saitawIKx4KwcKVQs3zXZcaCqHPuFnuj001Oa7m/5Wo=;
	b=l3qeiwj3cDHv4ZxDgABEfcpkZBwISLXe+befvEqV/ZIaO8tfrykrnGaTeeC2tXXa7wWRRy
	msLQ/PpAGvoqBTwzNH3CPsSbIY9Qfm+O+JxkwPiHIKM3AHNI/6c2cRds3OPd14AMeigCAe
	hRh7jEzL5ylny6bggBfbPkYcrVkQQC8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794414071; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=saitawIKx4KwcKVQs3zXZcaCqHPuFnuj001Oa7m/5Wo=;
	b=WvTBTjvR6xrw1dqmvdaEcXbjWYmBCvPYvCw/+t99Xxpy0jpxAMa7GgLgmeDW2mLvCY+g+7
	Ri4nmoJ9XGxU4fLm+W6yiKqXoiv9JBBtUa3NZswB78SnF87mAuenipGexPBYQUNVIijIpd
	GWiMTNrD585fB2gcb0IMiN+R8OV0Bds=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/3] xen-blkback: move statistics data into sub-structure
Date: Wed, 11 Nov 2026 17:20:57 +0100
Message-ID: <20261111162058.804033-3-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111162058.804033-1-jgross@suse.com>
References: <20261111162058.804033-1-jgross@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80
X-purgate-ID: tlsNG-bad1c0/1794414072-BF6D2034-D5529523/35/110847
X-purgate-type: clean
X-purgate-size: 3939
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move the statistics data into a dedicated new struct xen_blkif_stat.

This is done in preparation of not losing statistics in case of
disconnect/reconnect cycles.

No functional change intended.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/block/xen-blkback/blkback.c | 14 +++++++-------
 drivers/block/xen-blkback/common.h  | 19 ++++++++++++-------
 drivers/block/xen-blkback/xenbus.c  |  2 +-
 3 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index f3a8f3eae86b..e2f09bd4e84e 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -958,7 +958,7 @@ static int dispatch_discard_io(struct xen_blkif_ring *ring,
 			preq.sector_number + preq.nr_sects, blkif->vbd.pdevice);
 		goto fail_response;
 	}
-	ring->st_ds_req++;
+	ring->st.ds_req++;
 
 	if (blkif->vbd.discard_secure &&
 	    (req->u.discard.flag & BLKIF_DISCARD_SECURE))
@@ -1198,7 +1198,7 @@ __do_block_io_op(struct xen_blkif_ring *ring, unsigned int *eoi_flags)
 
 		pending_req = alloc_req(ring);
 		if (NULL == pending_req) {
-			ring->st_oo_req++;
+			ring->st.oo_req++;
 			more_to_do = 1;
 			break;
 		}
@@ -1297,11 +1297,11 @@ static int dispatch_rw_block_io(struct xen_blkif_ring *ring,
 
 	switch (req_operation) {
 	case BLKIF_OP_READ:
-		ring->st_rd_req++;
+		ring->st.rd_req++;
 		operation = REQ_OP_READ;
 		break;
 	case BLKIF_OP_WRITE:
-		ring->st_wr_req++;
+		ring->st.wr_req++;
 		operation = REQ_OP_WRITE;
 		operation_flags = REQ_SYNC | REQ_IDLE;
 		break;
@@ -1309,7 +1309,7 @@ static int dispatch_rw_block_io(struct xen_blkif_ring *ring,
 		drain = true;
 		fallthrough;
 	case BLKIF_OP_FLUSH_DISKCACHE:
-		ring->st_f_req++;
+		ring->st.f_req++;
 		operation = REQ_OP_WRITE;
 		operation_flags = REQ_PREFLUSH;
 		break;
@@ -1445,9 +1445,9 @@ static int dispatch_rw_block_io(struct xen_blkif_ring *ring,
 	blk_finish_plug(&plug);
 
 	if (operation == REQ_OP_READ)
-		ring->st_rd_sect += preq.nr_sects;
+		ring->st.rd_sect += preq.nr_sects;
 	else if (operation == REQ_OP_WRITE)
-		ring->st_wr_sect += preq.nr_sects;
+		ring->st.wr_sect += preq.nr_sects;
 
 	return 0;
 
diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
index 0a60e29a7cc3..f8385c4b9d30 100644
--- a/drivers/block/xen-blkback/common.h
+++ b/drivers/block/xen-blkback/common.h
@@ -248,6 +248,17 @@ struct persistent_gnt {
 	struct list_head remove_node;
 };
 
+/* Statistic data. */
+struct xen_blkif_stat {
+	unsigned long long	rd_req;
+	unsigned long long	wr_req;
+	unsigned long long	oo_req;
+	unsigned long long	f_req;
+	unsigned long long	ds_req;
+	unsigned long long	rd_sect;
+	unsigned long long	wr_sect;
+};
+
 /* Per-ring information. */
 struct xen_blkif_ring {
 	/* Physical parameters of the comms window. */
@@ -277,13 +288,7 @@ struct xen_blkif_ring {
 	unsigned long           next_lru;
 
 	/* Statistics. */
-	unsigned long long	st_rd_req;
-	unsigned long long	st_wr_req;
-	unsigned long long	st_oo_req;
-	unsigned long long	st_f_req;
-	unsigned long long	st_ds_req;
-	unsigned long long	st_rd_sect;
-	unsigned long long	st_wr_sect;
+	struct xen_blkif_stat	st;
 
 	/* Used by the kworker that offload work from the persistent purge. */
 	struct list_head	persistent_purge_list;
diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index 62e3bad4ab0e..b3ef483a92fd 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -408,7 +408,7 @@ void xen_blkif_interface_fini(void)
 		for (i = 0; i < blkif->nr_rings; i++) {		\
 			struct xen_blkif_ring *ring = &blkif->rings[i];	\
 									\
-			result += ring->st_##name;			\
+			result += ring->st.name;			\
 		}							\
 									\
 out:									\
-- 
2.56.0


