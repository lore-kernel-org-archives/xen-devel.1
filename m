Return-Path: <SRS0=JVsS=MF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28433C07E95
	for <xen-devel@archiver.kernel.org>; Tue, 13 Jul 2021 18:07:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE2E861369
	for <xen-devel@archiver.kernel.org>; Tue, 13 Jul 2021 18:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE2E861369
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.155557.287288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mo7-0001v7-Bn; Tue, 13 Jul 2021 18:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155557.287288; Tue, 13 Jul 2021 18:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mo7-0001tb-6m; Tue, 13 Jul 2021 18:06:59 +0000
Received: by outflank-mailman (input) for mailman id 155557;
 Tue, 13 Jul 2021 18:06:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3Mo5-0002kr-UL
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:57 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.171])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0840d682-e405-11eb-8793-12813bfff9fa;
 Tue, 13 Jul 2021 18:06:23 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6HtAx
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:17 +0200 (CEST)
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
X-Inumbo-ID: 0840d682-e405-11eb-8793-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199577;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=EqbkUFGoJ5kAajdvgf66aZTTmFJgr8buS42CRf7IZCM=;
    b=s3tvuDYTIJBgYEAhcTEYPn+hd/6Lox5NyjwWlrhxIQPcX0AMX321FES4gI/cm16cVH
    aKEO92boPkt+pmCfzl39cbgZXfD4grPxXSdLlTPlV56wOusEU5XVI73C9BGqjfP70WMJ
    9T1+qM3PQif9Hy6kCjBrihoLjyDQs2TWOEk/YSDwvycL+C0e7b7C2lRSel7bAmGdJIZT
    FkZRzljpZsOLxWGQRrsUcqnl+tQpJOAcgkFFiptA4OkORj7SELNN7yaiRrSE2QCsUghD
    cgF1wDDi4y3zbKAwV6sEuF9ydc6xMbcceOsOH+lQ2ama6MLT2Z8wAsK7CD3jwb0uZowD
    I2iQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgthqlagRsstpH9XYEN5v9xf7dypFU9ge5p0Oi0V"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210713 15/31] tools: restore: preallocate types array
Date: Tue, 13 Jul 2021 20:05:49 +0200
Message-Id: <20210713180605.12096-16-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove repeated allocation from migration loop. There will never be
more than MAX_BATCH_SIZE pages to process in an incoming batch.
Allocate the space once.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  |  1 +
 tools/libs/guest/xg_sr_restore.c | 22 +++++++---------------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index d32b4c46f3..bd2027ba5d 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -257,6 +257,7 @@ struct xc_sr_context
             struct xc_sr_restore_ops ops;
             struct restore_callbacks *callbacks;
             xen_pfn_t *pfns;
+            uint32_t *types;
 
             int send_back_fd;
             unsigned long p2m_size;
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index e812f65f99..bbb55b6844 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -315,7 +315,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
     int rc = -1;
 
     xen_pfn_t pfn;
-    uint32_t *types = NULL, type;
+    uint32_t type;
 
     /*
      * v2 compatibility only exists for x86 streams.  This is a bit of a
@@ -362,14 +362,6 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         goto err;
     }
 
-    types = malloc(pages->count * sizeof(*types));
-    if ( !types )
-    {
-        ERROR("Unable to allocate enough memory for %u pfns",
-              pages->count);
-        goto err;
-    }
-
     for ( i = 0; i < pages->count; ++i )
     {
         pfn = pages->pfn[i] & PAGE_DATA_PFN_MASK;
@@ -393,7 +385,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
             pages_of_data++;
 
         ctx->restore.pfns[i] = pfn;
-        types[i] = type;
+        ctx->restore.types[i] = type;
     }
 
     if ( rec->length != (sizeof(*pages) +
@@ -406,11 +398,9 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         goto err;
     }
 
-    rc = process_page_data(ctx, pages->count, ctx->restore.pfns, types,
-                           &pages->pfn[pages->count]);
+    rc = process_page_data(ctx, pages->count, ctx->restore.pfns,
+                           ctx->restore.types, &pages->pfn[pages->count]);
  err:
-    free(types);
-
     return rc;
 }
 
@@ -727,7 +717,8 @@ static int setup(struct xc_sr_context *ctx)
     }
 
     ctx->restore.pfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.pfns));
-    if ( !ctx->restore.pfns )
+    ctx->restore.types = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.types));
+    if ( !ctx->restore.pfns  || !ctx->restore.types )
     {
         ERROR("Unable to allocate memory");
         rc = -1;
@@ -764,6 +755,7 @@ static void cleanup(struct xc_sr_context *ctx)
 
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
+    free(ctx->restore.types);
     free(ctx->restore.pfns);
 
     if ( ctx->restore.ops.cleanup(ctx) )

