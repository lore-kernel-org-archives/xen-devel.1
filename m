Return-Path: <SRS0=7qAe=KH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C24C433ED
	for <xen-devel@archiver.kernel.org>; Wed, 12 May 2021 16:48:30 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBD626101B
	for <xen-devel@archiver.kernel.org>; Wed, 12 May 2021 16:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBD626101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.126314.237792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgs1l-0003NG-Aa; Wed, 12 May 2021 16:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126314.237792; Wed, 12 May 2021 16:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgs1l-0003N9-7R; Wed, 12 May 2021 16:48:05 +0000
Received: by outflank-mailman (input) for mailman id 126314;
 Wed, 12 May 2021 16:48:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F0FV=KH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lgs1k-0003N3-2y
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 16:48:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50807ee1-380d-46ec-8392-41edfec7e43a;
 Wed, 12 May 2021 16:48:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 01685B148;
 Wed, 12 May 2021 16:48:02 +0000 (UTC)
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
X-Inumbo-ID: 50807ee1-380d-46ec-8392-41edfec7e43a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620838082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=20PFQ0WahlPjBf4V0QLtvAJuN8ggnfjR+YmNs21FlUs=;
	b=KSaojBZAv6QL6z8bbdHkOBHaT7gzzBz8CKCmmAMgbasuQUvm6HTaufvR+ynqSWVNY6xl7H
	erUk4Zo7tv8Z/wUUmyd9P/wf8wHKLIOESLxmNQBah+ROXdJsSBrrfAC+egdtadr3gn9wFl
	30mdm0/15TwjV7aDuTu/yYOAJBmSw9Q=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH] include/public: add RING_RESPONSE_PROD_OVERFLOW macro
Date: Wed, 12 May 2021 18:48:00 +0200
Message-Id: <20210512164800.26236-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new RING_RESPONSE_PROD_OVERFLOW() macro for being able to
detect an ill-behaved backend tampering with the response producer
index.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/public/io/ring.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
index 0b08b2697e..c486c457e0 100644
--- a/xen/include/public/io/ring.h
+++ b/xen/include/public/io/ring.h
@@ -259,6 +259,10 @@ typedef struct __name##_back_ring __name##_back_ring_t
 #define RING_REQUEST_PROD_OVERFLOW(_r, _prod)                           \
     (((_prod) - (_r)->rsp_prod_pvt) > RING_SIZE(_r))
 
+/* Ill-behaved backend determination: Can there be this many responses? */
+#define RING_RESPONSE_PROD_OVERFLOW(_r, _prod)                          \
+    (((_prod) - (_r)->rsp_cons) > RING_SIZE(_r))
+
 #define RING_PUSH_REQUESTS(_r) do {                                     \
     xen_wmb(); /* back sees requests /before/ updated producer index */ \
     (_r)->sring->req_prod = (_r)->req_prod_pvt;                         \
-- 
2.26.2


