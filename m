Return-Path: <SRS0=SN9p=EE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1E5C2D0A3
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2020 17:21:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82FF920796
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2020 17:21:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="eeVgrae+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82FF920796
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.14442.35795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbf-0004dW-1L; Thu, 29 Oct 2020 17:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14442.35795; Thu, 29 Oct 2020 17:20:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbe-0004ck-HN; Thu, 29 Oct 2020 17:20:58 +0000
Received: by outflank-mailman (input) for mailman id 14442;
 Thu, 29 Oct 2020 17:20:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYBbc-0003MD-OD
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:56 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d042921d-b001-4a70-b3e6-3b7021119e28;
 Thu, 29 Oct 2020 17:20:23 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THKG3fS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 18:20:16 +0100 (CET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYBbc-0003MD-OD
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:56 +0000
X-Inumbo-ID: d042921d-b001-4a70-b3e6-3b7021119e28
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.102])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d042921d-b001-4a70-b3e6-3b7021119e28;
	Thu, 29 Oct 2020 17:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992022;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=7l8yhNQOQPrO7fe+7mN7zL3gcTrejyHmlkzb9nVzYkU=;
	b=eeVgrae+rDElAgTheRJNRHdLvU+1Y9cxgOjEh/7sQmhVyGnKV+SkzqBExLqCJTUEN5
	m5Qt2FcBn+Z3f8HlDc3U0VdmAWyOPfn3oxnoZYxLY/aOVcEVyok6+ZbG9gdxACo3jHmC
	yqlxSbSrfSk5UGdRmXwQFnSJ0duUbycF0rDvtpJu5dds46iVZ4CoynWveUN76NNo7M3x
	YN1O4p1fypXQO5w22lrjhaRLP0qnUe8IyhVhKivzuBpiK6XnpetuHAmRcRp9i7jNGn9p
	1dX3SR6rc5Y53frY+5PKJQP/ism4dsT5C8ZYZmGVC/YwhewDYRJu1781hs/ZQn08+J6F
	1YMQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THKG3fS
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 18:20:16 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 20/23] tools/guest: restore: move pfns array in populate_pfns
Date: Thu, 29 Oct 2020 18:20:00 +0100
Message-Id: <20201029172004.17219-21-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove allocation from hotpath, move populate_pfns' pfns array into preallocated space.
Use some prefix to avoid conflict with an array used in handle_page_data.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  |  1 +
 tools/libs/guest/xg_sr_restore.c | 11 +----------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 96a77b5969..3fe665b91d 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -232,6 +232,7 @@ struct xc_sr_restore_arrays {
     int map_errs[MAX_BATCH_SIZE];
     /* populate_pfns */
     xen_pfn_t pp_mfns[MAX_BATCH_SIZE];
+    xen_pfn_t pp_pfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 85a32aaed2..71b39612ee 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -139,17 +139,10 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 {
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns = ctx->restore.m->pp_mfns,
-        *pfns = malloc(count * sizeof(*pfns));
+        *pfns = ctx->restore.m->pp_pfns;
     unsigned int i, nr_pfns = 0;
     int rc = -1;
 
-    if ( !pfns )
-    {
-        ERROR("Failed to allocate %zu bytes for populating the physmap",
-              2 * count * sizeof(*mfns));
-        goto err;
-    }
-
     for ( i = 0; i < count; ++i )
     {
         if ( (!types ||
@@ -190,8 +183,6 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
     rc = 0;
 
  err:
-    free(pfns);
-
     return rc;
 }
 

