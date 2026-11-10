Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742EA606A325
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=HfHO/LM/;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=HfHO/LM/
Received: from list by lists.xenproject.org with outflank-mailman.1481384.1685248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQiaP-0007b0-Do; Tue, 10 Nov 2026 09:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481384.1685248; Tue, 10 Nov 2026 09:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQiaP-0007as-7w; Tue, 10 Nov 2026 09:56:17 +0000
Received: by outflank-mailman (input) for mailman id 1481384;
 Tue, 10 Nov 2026 09:56:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1xQiaN-0007YS-Te
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:56:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQiaN-00A8Go-6j
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:56:15 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af2ea3a-8faa-0a2a0a5109dd-0a2a45028f62-22
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:56:15 +0100
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af2ea3e-6ca4-0a2a45020019-c387df83db58-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:56:15 +0100
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A901B1F7EE;
 Tue, 10 Nov 2026 09:56:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E0691339F;
 Tue, 10 Nov 2026 09:56:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ICdQDT7q8mpaCgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 10 Nov 2026 09:56:14 +0000
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
	t=1794304574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pwY9LfeqcRS7j1sr/gpJK/qWawtftlvmsiGAP+uG4hU=;
	b=HfHO/LM/+l1w+qhfmqU/ecJ8ZK1QLIWUmAWOIAwPicL4GjlpglWqR3g5H/SwLOfbLBhO06
	7WLq+tzMTYnOnRqgy+fU/E1nyBZ7UALUUH2/pThlTRupAZfAil8fw56CLxxakWH57oB0pk
	I7SHD345kPjsN/qk8voaxzXoD6qa/8s=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1794304574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pwY9LfeqcRS7j1sr/gpJK/qWawtftlvmsiGAP+uG4hU=;
	b=HfHO/LM/+l1w+qhfmqU/ecJ8ZK1QLIWUmAWOIAwPicL4GjlpglWqR3g5H/SwLOfbLBhO06
	7WLq+tzMTYnOnRqgy+fU/E1nyBZ7UALUUH2/pThlTRupAZfAil8fw56CLxxakWH57oB0pk
	I7SHD345kPjsN/qk8voaxzXoD6qa/8s=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 1/2] xen: don't allow gnttab_dma_[alloc|free]_pages() in PV guest
Date: Tue, 10 Nov 2026 10:56:04 +0100
Message-ID: <20261110095605.369848-2-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110095605.369848-1-jgross@suse.com>
References: <20261110095605.369848-1-jgross@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-15.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -15.80
X-Spam-Level: 
X-purgate-ID: tlsNG-720697/1794304575-676BF2AC-09F87BDE/35/110847
X-purgate-type: clean
X-purgate-size: 1921
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Today gnttab_dma_alloc_pages() or gnttab_dma_free_pages are never
called when running as a PV guest, but this holds for in-tree callers
only.

Bail out early when being called in PV mode in order to ensure no out
of tree module or future use cases are violating this assumption.

This enables to safely remove PV-only code from both functions.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/grant-table.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 604c4eea5930..56a497987942 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1063,6 +1063,9 @@ int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args *args)
 	size_t size;
 	int i, ret;
 
+	if (WARN_ON(xen_pv_domain()))
+		return -EINVAL;
+
 	if (args->nr_pages < 0 || args->nr_pages > (INT_MAX >> PAGE_SHIFT))
 		return -ENOMEM;
 
@@ -1090,8 +1093,6 @@ int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args *args)
 		xenmem_reservation_scrub_page(page);
 	}
 
-	xenmem_reservation_va_mapping_reset(args->nr_pages, args->pages);
-
 	ret = xenmem_reservation_decrease(args->nr_pages, args->frames);
 	if (ret != args->nr_pages) {
 		pr_debug("Failed to decrease reservation for DMA buffer\n");
@@ -1120,6 +1121,9 @@ int gnttab_dma_free_pages(struct gnttab_dma_alloc_args *args)
 	size_t size;
 	int i, ret;
 
+	if (WARN_ON(xen_pv_domain()))
+		return -EINVAL;
+
 	gnttab_pages_clear_private(args->nr_pages, args->pages);
 
 	for (i = 0; i < args->nr_pages; i++)
@@ -1133,9 +1137,6 @@ int gnttab_dma_free_pages(struct gnttab_dma_alloc_args *args)
 		ret = 0;
 	}
 
-	xenmem_reservation_va_mapping_update(args->nr_pages, args->pages,
-					     args->frames);
-
 	size = args->nr_pages << PAGE_SHIFT;
 	if (args->coherent)
 		dma_free_coherent(args->dev, size,
-- 
2.56.0


