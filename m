Return-Path: <SRS0=61/H=ED=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E2BC388F7
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 14:31:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 376D624761
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 14:31:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="Vjq9hrSC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 376D624761
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.13630.34353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXmTU-0000M0-Rh; Wed, 28 Oct 2020 14:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13630.34353; Wed, 28 Oct 2020 14:30:52 +0000
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
	id 1kXmTU-0000Lr-OH; Wed, 28 Oct 2020 14:30:52 +0000
Received: by outflank-mailman (input) for mailman id 13630;
 Wed, 28 Oct 2020 14:30:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LDgn=ED=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kXmTT-0000IU-Tx
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 14:30:51 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.166])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7528e28e-3a0b-40cf-848b-882835f0625c;
 Wed, 28 Oct 2020 14:30:42 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.2.3 DYNA|AUTH)
 with ESMTPSA id D03373w9SEUV5Md
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 28 Oct 2020 15:30:31 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LDgn=ED=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kXmTT-0000IU-Tx
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 14:30:51 +0000
X-Inumbo-ID: 7528e28e-3a0b-40cf-848b-882835f0625c
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.166])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7528e28e-3a0b-40cf-848b-882835f0625c;
	Wed, 28 Oct 2020 14:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603895441;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=nOFtdNXlk5HjYyxO1mkGMNqJ+Z1za/MxmXOScJ0HbPg=;
	b=Vjq9hrSCC0J4X6bcR9uJ0f2dDFFfDSEpA6wPy5IKsY10nhsk25L1NpaCFj4xWmj6HY
	Qtx7RbNQ/keVcUl6kOpelrdPipY4wZlBYCFvAl0RwtATWzb9+gb7M+W8ZAXVn3gMC0Vg
	Wj1VXNOJDiNCEJvOR5EAoneEWONksVZzRilTBJ84XM+9FianWfQ8VUulmckugmF8mEIO
	MMKl9KYWrIO6tW9/DqLhXlgSnfyUehj65B98gmdETtPB/932l2HEsKr/Na3ndtV9Bj65
	+bBCtTnQnFCpZV/hLZeTHo0zcf5DjNQZAFDMAexgaD95bCg2oO6eLRcmSNh7b5386QgO
	aKHg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.2.3 DYNA|AUTH)
	with ESMTPSA id D03373w9SEUV5Md
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Wed, 28 Oct 2020 15:30:31 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 2/3] tools: use xc_is_known_page_type
Date: Wed, 28 Oct 2020 15:30:23 +0100
Message-Id: <20201028143024.26833-3-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201028143024.26833-1-olaf@aepfle.de>
References: <20201028143024.26833-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify pfn type on sending side, also verify incoming batch of pfns.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_restore.c | 3 +--
 tools/libs/guest/xg_sr_save.c    | 6 ++++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index b57a787519..f1c3169229 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -406,8 +406,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         }
 
         type = (pages->pfn[i] & PAGE_DATA_TYPE_MASK) >> 32;
-        if ( ((type >> XEN_DOMCTL_PFINFO_LTAB_SHIFT) >= 5) &&
-             ((type >> XEN_DOMCTL_PFINFO_LTAB_SHIFT) <= 8) )
+        if ( xc_is_known_page_type(type) == false )
         {
             ERROR("Invalid type %#"PRIx32" for pfn %#"PRIpfn" (index %u)",
                   type, pfn, i);
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 2ba7c3200c..044d0ae3aa 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -147,6 +147,12 @@ static int write_batch(struct xc_sr_context *ctx)
 
     for ( i = 0; i < nr_pfns; ++i )
     {
+        if ( xc_is_known_page_type(types[i]) == false )
+        {
+            ERROR("Wrong type %#"PRIpfn" for pfn %#"PRIpfn, types[i], mfns[i]);
+            goto err;
+        }
+
         switch ( types[i] )
         {
         case XEN_DOMCTL_PFINFO_BROKEN:

