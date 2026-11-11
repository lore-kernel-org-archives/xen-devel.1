Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866EF606A326
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 16:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=tg5PpfpL;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=tg5PpfpL
Received: from list by lists.xenproject.org with outflank-mailman.1484376.1687730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRB4a-00072c-Ez; Wed, 11 Nov 2026 16:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484376.1687730; Wed, 11 Nov 2026 16:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRB4a-00072R-CC; Wed, 11 Nov 2026 16:21:20 +0000
Received: by outflank-mailman (input) for mailman id 1484376;
 Wed, 11 Nov 2026 16:21:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xRB4Z-00071N-4y
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:21:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRB4Y-000RAM-FR
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 17:21:18 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af495f6-bab6-0a2a0a5309dd-0a2a4503d2f2-22
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 17:21:18 +0100
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af495fd-fae8-0a2a45030019-c387df82cd46-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 17:21:17 +0100
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AEAB621D93;
 Wed, 11 Nov 2026 16:21:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5767C134E5;
 Wed, 11 Nov 2026 16:21:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AuQhCv2V9GocAwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 11 Nov 2026 16:21:17 +0000
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
	t=1794414077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSSv9eG1iTWrGFTeMHmS2DVPwf3MYF59DxWDnGZ5sCE=;
	b=tg5PpfpLp/dgUzWIDV/iSAU0nguXlNp6hSiYcOS2zsUh9F8aeKmpYS2xNtgMMZj5NrJXWp
	j5jbkXYSPf9jx4mCvwI5gphXASoF8HgrHDrsJBSvHBRiYAqDvvTjcNlsvHVa8yvkEJw0nA
	esAZUn8gyTcAM46y8pDLpWjWGT4iS5k=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794414077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSSv9eG1iTWrGFTeMHmS2DVPwf3MYF59DxWDnGZ5sCE=;
	b=tg5PpfpLp/dgUzWIDV/iSAU0nguXlNp6hSiYcOS2zsUh9F8aeKmpYS2xNtgMMZj5NrJXWp
	j5jbkXYSPf9jx4mCvwI5gphXASoF8HgrHDrsJBSvHBRiYAqDvvTjcNlsvHVa8yvkEJw0nA
	esAZUn8gyTcAM46y8pDLpWjWGT4iS5k=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 3/3] xen-blkback: make statistics data persistent across disconnect/connect
Date: Wed, 11 Nov 2026 17:20:58 +0100
Message-ID: <20261111162058.804033-4-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111162058.804033-1-jgross@suse.com>
References: <20261111162058.804033-1-jgross@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
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
X-Spam-Level: 
X-purgate-ID: tlsNG-33051d/1794414077-6E8CD4E9-E6EDEC26/35/110847
X-purgate-type: clean
X-purgate-size: 2409
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Today the statistics data is living in struct xen_blkif_ring only.

This means that a disconnect/connect cycle will reset the data, as the
rings are freed and re-allocated in this case.

Add a struct xen_blkif_stat in struct xen_blkif and sum up the per-ring
data there when freeing the rings, and add those values to the printed
statistics data.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/block/xen-blkback/common.h |  2 ++
 drivers/block/xen-blkback/xenbus.c | 19 ++++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/block/xen-blkback/common.h b/drivers/block/xen-blkback/common.h
index f8385c4b9d30..c35ec207b31d 100644
--- a/drivers/block/xen-blkback/common.h
+++ b/drivers/block/xen-blkback/common.h
@@ -327,6 +327,8 @@ struct xen_blkif {
 	unsigned int		nr_rings;
 
 	unsigned long		buffer_squeeze_end;
+
+	struct xen_blkif_stat	st;
 };
 
 struct seg_buf {
diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
index b3ef483a92fd..f0d4cec4432a 100644
--- a/drivers/block/xen-blkback/xenbus.c
+++ b/drivers/block/xen-blkback/xenbus.c
@@ -346,6 +346,18 @@ static int xen_blkif_disconnect(struct xen_blkif *blkif)
 	 */
 	write_lock(&blkif->rings_lock);
 
+	for (r = 0; r < blkif->nr_rings; r++) {
+		struct xen_blkif_ring *ring = &blkif->rings[r];
+
+		blkif->st.rd_req += ring->st.rd_req;
+		blkif->st.wr_req += ring->st.wr_req;
+		blkif->st.oo_req += ring->st.oo_req;
+		blkif->st.f_req += ring->st.f_req;
+		blkif->st.ds_req += ring->st.ds_req;
+		blkif->st.rd_sect += ring->st.rd_sect;
+		blkif->st.wr_sect += ring->st.wr_sect;
+	}
+
 	rings = blkif->rings;
 	blkif->rings = NULL;
 	blkif->nr_rings = 0;
@@ -399,13 +411,14 @@ void xen_blkif_interface_fini(void)
 		struct backend_info *be = dev_get_drvdata(&dev->dev);	\
 		struct xen_blkif *blkif = be->blkif;			\
 		unsigned int i;						\
-		unsigned long long result = 0;				\
+		unsigned long long result;				\
 									\
 		read_lock(&blkif->rings_lock);				\
-		if (!blkif->rings)				\
+		result = blkif->st.name;				\
+		if (!blkif->rings)					\
 			goto out;					\
 									\
-		for (i = 0; i < blkif->nr_rings; i++) {		\
+		for (i = 0; i < blkif->nr_rings; i++) {			\
 			struct xen_blkif_ring *ring = &blkif->rings[i];	\
 									\
 			result += ring->st.name;			\
-- 
2.56.0


