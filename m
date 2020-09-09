Return-Path: <SRS0=Kfrc=CS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6B9C43461
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2020 09:54:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B713F21D79
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2020 09:54:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aepfle.de header.i=@aepfle.de header.b="km34NFoq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B713F21D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aepfle.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFwnc-0008CX-TK; Wed, 09 Sep 2020 09:53:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M6/y=CS=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kFwnb-0008CO-NB
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 09:53:55 +0000
X-Inumbo-ID: 555adeb5-acd3-4207-8164-f8550d81061f
Received: from mo4-p01-ob.smtp.rzone.de (unknown [81.169.146.167])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 555adeb5-acd3-4207-8164-f8550d81061f;
 Wed, 09 Sep 2020 09:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1599645233;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=9/erXoR7NzaDAyAvPflQwDTjMgFFlFjSP1ohGB9WHz4=;
 b=km34NFoqVFsm6DAQ39vsATbhz+M1M23GOVxnxEBUE4XFXCIKrFxdoimLbxR3pJPd6G
 tVfFM61qjOMW54S47pyuTJ48SzW1SaMo8krLyDMOJ5YwtjyCG0GklhSfrFCym1cVZ/D4
 Y8aUioQFpsmDOiFYn8U4yA5qe0Fp7qxQHTS+d5zFdWPWLj3+/I6dzzkIxbWhLSwqF88k
 tKDHBM/OUII1sG6NlM0WH7TNQTHbkTSopgpPIJEFELjFQw2uVKpe8a0uhSqfOrtaIMf/
 1b0PhDmuvNqpQmFEecP7axSqyy0FScLlbQQhCoteBL+1bOebuIxJR15qJShTKH3Ppips
 2qnw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS32hIjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.7 SBL|AUTH)
 with ESMTPSA id 60ad29w899rkL5A
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 9 Sep 2020 11:53:46 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v1] libxc: use bitmap_alloc
Date: Wed,  9 Sep 2020 11:53:44 +0200
Message-Id: <20200909095344.9462-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use existing helper to allocate a bitmap.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libxc/xc_sr_save.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libxc/xc_sr_save.c b/tools/libxc/xc_sr_save.c
index 80b1d5de1f..bc5a1a723c 100644
--- a/tools/libxc/xc_sr_save.c
+++ b/tools/libxc/xc_sr_save.c
@@ -809,7 +809,7 @@ static int setup(struct xc_sr_context *ctx)
         xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
     ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
                                   sizeof(*ctx->save.batch_pfns));
-    ctx->save.deferred_pages = calloc(1, bitmap_size(ctx->save.p2m_size));
+    ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
 
     if ( !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
     {

