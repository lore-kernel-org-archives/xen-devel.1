Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F353E606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:56:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1481385.1685257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQiaV-0007ud-Kc; Tue, 10 Nov 2026 09:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481385.1685257; Tue, 10 Nov 2026 09:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQiaV-0007uS-FG; Tue, 10 Nov 2026 09:56:23 +0000
Received: by outflank-mailman (input) for mailman id 1481385;
 Tue, 10 Nov 2026 09:56:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQiaT-0007tB-SU
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:56:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQiaT-00A8KZ-8h
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:56:21 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6af2ea3c-bab6-0a2a0a5309dd-0a2a45069278-48
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:56:21 +0100
Received: from [195.135.223.130] (helo=smtp-out1.suse.de)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jgross@suse.com>)
 id 6af2ea44-195a-0a2a45060019-c387df82b9f4-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:56:20 +0100
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5412421F2E;
 Tue, 10 Nov 2026 09:56:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04CFF1339F;
 Tue, 10 Nov 2026 09:56:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id p/aFM0Pq8mpgCgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 10 Nov 2026 09:56:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 2/2] Xen/gnttab: improve error handling in gnttab_dma_{alloc,free}_pages()
Date: Tue, 10 Nov 2026 10:56:05 +0100
Message-ID: <20261110095605.369848-3-jgross@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110095605.369848-1-jgross@suse.com>
References: <20261110095605.369848-1-jgross@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Queue-Id: 5412421F2E
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-purgate-ID: tlsNG-16d1c6/1794304580-1F2C677B-8087210B/10/78276251493
X-purgate-type: spam
X-purgate-size: 2571
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jan Beulich <jbeulich@suse.com>

Both decrease-reservation and populate-physmap can succeed partially. For
the former this may be pretty unlikely, but clearly the latter can hit
both out-of-memory conditions in the hypervisor or denial because of the
allocation exceeding the domain's allowance (there's no interaction with
the balloon driver here either).

In gnttab_dma_free_pages() we simply can't give back to the system what
hasn't been re-filled with backing memory. For gnttab_dma_alloc_pages()
both parts of the overall region need dealing with differently.

While no present caller of gnttab_dma_free_pages() checks its return
value, also don't use -EFAULT there: It really is an out-of-memory
condition. (In gnttab_dma_alloc_pages() -EFAULT doesn't look quite right
either, but I couldn't think of a clearly better error code there.)

Fixes: 9bdc7304f536 ("xen/grant-table: Allow allocating buffers suitable for DMA")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/grant-table.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/grant-table.c b/drivers/xen/grant-table.c
index 56a497987942..2a520080a570 100644
--- a/drivers/xen/grant-table.c
+++ b/drivers/xen/grant-table.c
@@ -1096,6 +1096,24 @@ int gnttab_dma_alloc_pages(struct gnttab_dma_alloc_args *args)
 	ret = xenmem_reservation_decrease(args->nr_pages, args->frames);
 	if (ret != args->nr_pages) {
 		pr_debug("Failed to decrease reservation for DMA buffer\n");
+		if (ret >= 0) {
+			/* Free the part where decrease didn't work. */
+			size_t done = ret << PAGE_SHIFT;
+
+			if (args->coherent)
+				dma_free_coherent(args->dev, size - done,
+						  args->vaddr + done,
+						  args->dev_bus_addr + done);
+			else
+				dma_free_wc(args->dev, size - done,
+					    args->vaddr + done,
+					    args->dev_bus_addr + done);
+
+			if (!ret) /* Nothing else to do? */
+				return -EFAULT;
+
+			args->nr_pages = ret;
+		}
 		ret = -EFAULT;
 		goto fail;
 	}
@@ -1132,7 +1150,12 @@ int gnttab_dma_free_pages(struct gnttab_dma_alloc_args *args)
 	ret = xenmem_reservation_increase(args->nr_pages, args->frames);
 	if (ret != args->nr_pages) {
 		pr_debug("Failed to increase reservation for DMA buffer\n");
-		ret = -EFAULT;
+		/* Can only free what has been re-filled. */
+		if (!ret)
+			return -ENOMEM;
+		if (ret > 0)
+			args->nr_pages = ret;
+		ret = -ENOMEM;
 	} else {
 		ret = 0;
 	}
-- 
2.56.0


