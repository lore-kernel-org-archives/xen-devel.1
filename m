Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28635C4332F
	for <xen-devel@archiver.kernel.org>; Thu, 28 Apr 2022 08:28:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.316177.535011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVE-0006wj-V2; Thu, 28 Apr 2022 08:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316177.535011; Thu, 28 Apr 2022 08:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVE-0006q5-7F; Thu, 28 Apr 2022 08:27:56 +0000
Received: by outflank-mailman (input) for mailman id 316177;
 Thu, 28 Apr 2022 08:27:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njzVB-0005SL-AT
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:27:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1708cee3-c6cd-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 10:27:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B78F51F88A;
 Thu, 28 Apr 2022 08:27:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A17913491;
 Thu, 28 Apr 2022 08:27:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CFi8HwVQamIBLgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Apr 2022 08:27:49 +0000
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
X-Inumbo-ID: 1708cee3-c6cd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651134469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPIngja7rfH6/X0ahWtYB7L7nX8NRl4zj/+cjR7xZr0=;
	b=b7TnDrRcZ8z68LrDQfaX1DqYfORj8ovWaBSLWfmePTyAcTrj7ib5gCErS/v1IQdBeh1X3M
	Qu5cD8Fe5euQgJsZU3TUwzQz/XM70bZA++EtW65/fPX/tHI910GU8H0Dh8g3F4RlQWAky9
	CV2BiAzCmMq6L8R2HrQyYiQ9FoU5Y7A=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 07/19] xen/dmabuf: switch gntdev-dmabuf to use INVALID_GRANT_REF
Date: Thu, 28 Apr 2022 10:27:31 +0200
Message-Id: <20220428082743.16593-8-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428082743.16593-1-jgross@suse.com>
References: <20220428082743.16593-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using a private macro for an invalid grant reference use
the common one.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/xen/gntdev-dmabuf.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index d5bfd7b867fc..91073b4e4a20 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -24,15 +24,6 @@
 
 MODULE_IMPORT_NS(DMA_BUF);
 
-#ifndef GRANT_INVALID_REF
-/*
- * Note on usage of grant reference 0 as invalid grant reference:
- * grant reference 0 is valid, but never exposed to a driver,
- * because of the fact it is already in use/reserved by the PV console.
- */
-#define GRANT_INVALID_REF	0
-#endif
-
 struct gntdev_dmabuf {
 	struct gntdev_dmabuf_priv *priv;
 	struct dma_buf *dmabuf;
@@ -532,7 +523,7 @@ static void dmabuf_imp_end_foreign_access(u32 *refs, int count)
 	int i;
 
 	for (i = 0; i < count; i++)
-		if (refs[i] != GRANT_INVALID_REF)
+		if (refs[i] != INVALID_GRANT_REF)
 			gnttab_end_foreign_access(refs[i], 0UL);
 }
 
@@ -567,7 +558,7 @@ static struct gntdev_dmabuf *dmabuf_imp_alloc_storage(int count)
 	gntdev_dmabuf->nr_pages = count;
 
 	for (i = 0; i < count; i++)
-		gntdev_dmabuf->u.imp.refs[i] = GRANT_INVALID_REF;
+		gntdev_dmabuf->u.imp.refs[i] = INVALID_GRANT_REF;
 
 	return gntdev_dmabuf;
 
-- 
2.34.1


