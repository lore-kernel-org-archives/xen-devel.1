Return-Path: <SRS0=KcDw=KB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1701C433ED
	for <xen-devel@archiver.kernel.org>; Thu,  6 May 2021 14:10:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60048610A5
	for <xen-devel@archiver.kernel.org>; Thu,  6 May 2021 14:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60048610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.123579.233108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leei9-0003mX-HW; Thu, 06 May 2021 14:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123579.233108; Thu, 06 May 2021 14:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leei9-0003mQ-EH; Thu, 06 May 2021 14:10:41 +0000
Received: by outflank-mailman (input) for mailman id 123579;
 Thu, 06 May 2021 14:10:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1leeYS-0003iB-ON
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:00:40 +0000
Received: from mail-qk1-x732.google.com (unknown [2607:f8b0:4864:20::732])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bdbc5300-8ed8-4b5d-a25c-9cea716549e0;
 Thu, 06 May 2021 14:00:05 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id a22so4386201qkl.10
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 07:00:05 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:6095:81da:832e:3929])
 by smtp.gmail.com with ESMTPSA id
 189sm2069992qkh.99.2021.05.06.07.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 07:00:04 -0700 (PDT)
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
X-Inumbo-ID: bdbc5300-8ed8-4b5d-a25c-9cea716549e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1sC6PaVJyxmKcXNwmv0ZrJDDSAEP8iNaKd4bhckdCXE=;
        b=ebg8vvSndFSKXEg6iZxUqqYDaQQx/5MfRXdnR/tjWhdDLlXhrtUnRj2sCNEekwYmjh
         ybyz9bp0xcbBAbf9CTB3rOt7mCBeOW8um2t9B8Dt6nB4miBlMkNFuA0caiwU9QD8O1JC
         8PK8RZppD6CN90dh4484V28rThyThXJXQ/rq2gWc3qK6mL5hkXrhu86I4u2HiwLtjKIK
         kXJb+w4et4cK8LiQ4r00nSjywYKd/X96/yegCFgjHKfQcXNvMe3qHcF0WNTZpDGbHfAh
         Qr9i5G5Q72f8CLDTt8obeuVHMd8aZ0aEZW2VrtKs4RClpx4L8vp2ARgyafVC6KqT0r0y
         vWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1sC6PaVJyxmKcXNwmv0ZrJDDSAEP8iNaKd4bhckdCXE=;
        b=aAwDLugZYiuTuUqoHrE+/faCmTLp8eFybamzV3Mt6mtX81AMTYFBCwdbRVUpVjuVKp
         LM36HVPCpjUcGAzrPMI7UEjS0J5PsAtTz6zKNpw1hOFpUDws+SLOE6C82Vny30WKP9qt
         mVgM4/X1v06mmcr6C5GKU6ryGaYYg61A7/4HTq1dYliVivV+B/5prbwKZH2rU2vNC+/B
         EYeiJZHeLC+d7iUvK/Cjp8stJndJSl7Sl/JFSTYR+RJG5M2I7X6m5Ge7AP8iHJwiXFyu
         T1+JycNTqW+vq/jTGbyFa192b3X4z41VnXKMKl0zX5eUxYyKxrTXkQtMFvz/NYrCQJ9m
         +wfg==
X-Gm-Message-State: AOAM5319+PRiFDgvIiadgDBZ4gRr5k7jDQmTtvRKgeTnrcm7dS+e8r8a
	FeiKe5OTOkns1MSjBJJVBYXumZRoB6U=
X-Google-Smtp-Source: ABdhPJzL4DGsx5vrbgjgb3flP4SmhP7g6Cx9swZiXeM7Pt8mE0yentKObQYuauanntkIQoyK/yOXlQ==
X-Received: by 2002:ae9:ed44:: with SMTP id c65mr4076178qkg.271.1620309604778;
        Thu, 06 May 2021 07:00:04 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Quan Xu <quan.xu0@gmail.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 10/13] vtpmmgr: Remove bogus cast from TPM2_GetRandom
Date: Thu,  6 May 2021 09:59:20 -0400
Message-Id: <20210506135923.161427-11-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506135923.161427-1-jandryuk@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The UINT32 <-> UINT16 casting in TPM2_GetRandom is incorrect.  Use a
local UINT16 as needed for the TPM hardware command and assign the
result.

Suggested-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 stubdom/vtpmmgr/tpm2.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/stubdom/vtpmmgr/tpm2.c b/stubdom/vtpmmgr/tpm2.c
index 655e6d164c..ebd06eac74 100644
--- a/stubdom/vtpmmgr/tpm2.c
+++ b/stubdom/vtpmmgr/tpm2.c
@@ -427,15 +427,22 @@ abort_egress:
 
 TPM_RC TPM2_GetRandom(UINT32 * bytesRequested, BYTE * randomBytes)
 {
+    UINT16 bytesReq;
     TPM_BEGIN(TPM_ST_NO_SESSIONS, TPM_CC_GetRandom);
 
-    ptr = pack_UINT16(ptr, (UINT16)*bytesRequested);
+    if (*bytesRequested > UINT16_MAX)
+        bytesReq = UINT16_MAX;
+    else
+        bytesReq = *bytesRequested;
+
+    ptr = pack_UINT16(ptr, bytesReq);
 
     TPM_TRANSMIT();
     TPM_UNPACK_VERIFY();
 
-    ptr = unpack_UINT16(ptr, (UINT16 *)bytesRequested);
-    ptr = unpack_TPM_BUFFER(ptr, randomBytes, *bytesRequested);
+    ptr = unpack_UINT16(ptr, &bytesReq);
+    *bytesRequested = bytesReq;
+    ptr = unpack_TPM_BUFFER(ptr, randomBytes, bytesReq);
 
 abort_egress:
     return status;
-- 
2.30.2


