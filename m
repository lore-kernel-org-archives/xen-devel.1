Return-Path: <SRS0=O81L=GO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD59C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 17:43:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 157C020738
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 17:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 157C020738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.65108.115290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DP-0002rY-El; Mon, 11 Jan 2021 17:42:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65108.115290; Mon, 11 Jan 2021 17:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DP-0002rL-Aq; Mon, 11 Jan 2021 17:42:51 +0000
Received: by outflank-mailman (input) for mailman id 65108;
 Mon, 11 Jan 2021 17:42:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1DN-0002a6-W8
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:42:50 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d547fe36-8693-4e39-b553-bd98e10f128f;
 Mon, 11 Jan 2021 17:42:39 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgWM3Q
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:32 +0100 (CET)
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
X-Inumbo-ID: d547fe36-8693-4e39-b553-bd98e10f128f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386958;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=nOFtdNXlk5HjYyxO1mkGMNqJ+Z1za/MxmXOScJ0HbPg=;
	b=SYUpcoo+cvY0y//y2LinWjy+sqC9/eM3LKPtfcykppzCiq94V0mOCVrvKZiHnDF84L
	flJYgPQqDEXsaPZ5ONdjiWdSWtO8dvznd1IFgMpEMHB7iU5D6XIot62SLnUE+ypbfipU
	EVDL6WVUHyFjHofwTMaL010rwHkLVQtM8+pCc4DQaZaNejCXRvWayatdZskpFow102D6
	12KooPTYe45eA4p2+qBMoSslT/liODPELDOMg997lNc4dexdImlSkZF9hPOJF26L9mNM
	Myu7CXV6sLmaP+snETSueBSE3O8ZnixkE3znripijQ5YY1DTCF5vpHoppG1GW/7A0VKW
	SY/w==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 11/39] tools: use xc_is_known_page_type
Date: Mon, 11 Jan 2021 18:41:56 +0100
Message-Id: <20210111174224.24714-12-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
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

