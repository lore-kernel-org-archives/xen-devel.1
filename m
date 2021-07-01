Return-Path: <SRS0=zJBp=LZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C310C11F6A
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 10:02:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3898361425
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 10:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3898361425
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.148469.274496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWU-0005wF-R4; Thu, 01 Jul 2021 10:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148469.274496; Thu, 01 Jul 2021 10:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytWU-0005vl-Jx; Thu, 01 Jul 2021 10:02:18 +0000
Received: by outflank-mailman (input) for mailman id 148469;
 Thu, 01 Jul 2021 10:02:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRv-0004XT-Sy
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:35 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.82])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a76f642b-8ab8-4845-afd7-b6e202d99543;
 Thu, 01 Jul 2021 09:56:52 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619uk5N3
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:46 +0200 (CEST)
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
X-Inumbo-ID: a76f642b-8ab8-4845-afd7-b6e202d99543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133406;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=KnwsPxLRJB68rPXEArkMW6OSaI/spxXLS3HmgXIKcHw=;
    b=F9jVJ1N144s3xumrT8kJVbYSY9MfWREIAi4QGQ0tQpX+AHdjKtnEIBCUSYTo8GG9jL
    RJBHhn5HrnUp5abb3C6hYg4cv2g9tPC6W9JJjWlxGAayaRpmA0+UOC5OvsuTVgjoE+Qg
    3UqSMgQq5+gXYGmDjTPoRAf46TSFqrMYWtivGdddA4StQEO5e1HUqD5nSzVE2EvZ79Mx
    MsiulUUErQpT+YKwx/1BCRmrl9FynwGYNWkxSard0VRpDefefTQMy7e7mNSwOKIJYs70
    qQsuXmTYeeN8b0om/Z9fgO7CFd+QHOVUBo47dj4q7AfhkP+Juw8Ci7u5+yiAZpeNjj82
    aUuA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v20210701 16/40] tools: save: move mfns array
Date: Thu,  1 Jul 2021 11:56:11 +0200
Message-Id: <20210701095635.15648-17-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move mfns array into preallocated space.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/saverestore/common.h | 2 ++
 tools/libs/saverestore/save.c   | 7 ++-----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 968bb8af13..1415a182d2 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -225,6 +225,8 @@ static inline int update_blob(struct xc_sr_blob *blob,
 
 struct sr_save_arrays {
     xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
+    /* write_batch: Mfns of the batch pfns. */
+    xen_pfn_t mfns[MAX_BATCH_SIZE];
 };
 
 struct sr_restore_arrays {
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index e29b6e1d66..6b09784be8 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -88,7 +88,7 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = NULL, *types = NULL;
+    xen_pfn_t *mfns = ctx->save.m->mfns, *types = NULL;
     void *guest_mapping = NULL;
     void **guest_data = NULL;
     void **local_pages = NULL;
@@ -105,8 +105,6 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Mfns of the batch pfns. */
-    mfns = malloc(nr_pfns * sizeof(*mfns));
     /* Types of the batch pfns. */
     types = malloc(nr_pfns * sizeof(*types));
     /* Errors from attempting to map the gfns. */
@@ -118,7 +116,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* iovec[] for writev(). */
     iov = malloc((nr_pfns + 4) * sizeof(*iov));
 
-    if ( !mfns || !types || !errors || !guest_data || !local_pages || !iov )
+    if ( !types || !errors || !guest_data || !local_pages || !iov )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -277,7 +275,6 @@ static int write_batch(struct xc_sr_context *ctx)
     free(guest_data);
     free(errors);
     free(types);
-    free(mfns);
 
     return rc;
 }

