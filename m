Return-Path: <SRS0=KcDw=KB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URI_NOVOWEL,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D79C43460
	for <xen-devel@archiver.kernel.org>; Thu,  6 May 2021 14:00:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F1BB6103E
	for <xen-devel@archiver.kernel.org>; Thu,  6 May 2021 14:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F1BB6103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.123533.232988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeXl-0003zy-JF; Thu, 06 May 2021 13:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123533.232988; Thu, 06 May 2021 13:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leeXl-0003zp-F7; Thu, 06 May 2021 13:59:57 +0000
Received: by outflank-mailman (input) for mailman id 123533;
 Thu, 06 May 2021 13:59:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NmKg=KB=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1leeXj-0003iB-N7
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 13:59:55 +0000
Received: from mail-qt1-x82b.google.com (unknown [2607:f8b0:4864:20::82b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d060e54-3546-4113-998d-8797937aaeb2;
 Thu, 06 May 2021 13:59:55 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id o1so4050262qta.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 06:59:55 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:6095:81da:832e:3929])
 by smtp.gmail.com with ESMTPSA id
 189sm2069992qkh.99.2021.05.06.06.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 06:59:53 -0700 (PDT)
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
X-Inumbo-ID: 5d060e54-3546-4113-998d-8797937aaeb2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=poW51U2VVY5gXkXvZ25b1vYYpwTn8lqPWe1EiAs4Tbg=;
        b=HD7SXwT1NtfGxVWBp6YBENsTVJbzVh4hYQ7yBUVP/I57IT5WiRkPD0qxJ9Z9Odak6e
         z4kGtG4S2UPVug+BzfZGv1fEQWFV3enWUR4GuK9XqXF7VZPYJuSrjfXltS54iyhVBI73
         PsUgwc01UpMbTgfI8Mj0Kq6FQ64bEw345mssQe2pvL0ptGC322h0SzK1iEaKHB9N+NFm
         z55TXBqM5jGrZcPdoQ6ywyn33/L8aEyYL+q0nrmBBpuNSdpc7tsrc9MVJKJZginFtWNS
         sH+U+ZqOChZWLlHSD2YHv/nh3InxnkDdr+7ORPZg8BhVbnMMhv3kLf/xk+D1FGIIcN4g
         v4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=poW51U2VVY5gXkXvZ25b1vYYpwTn8lqPWe1EiAs4Tbg=;
        b=kaXmgcg1hYdqIIqeb9OBT7iHqkxBFyl5YP8GfBXRvoS9b8tUz7QjZylbcC0j54H6uf
         +vKSYkqIfbbP3lKWkPkofZ/O43BsD1azJau8ZGAJ22o7e1p4FhZHIrgWivq0W4urCxWy
         wd/zfGa4xYrp9Ge6qSzXSIi2BhcUP8VOvQ/W6tfNAU59w665G5p+n7TOopehgvA1wiDc
         dwozjxRzArr+gyKYF03aIYiEP/nn9SnolUgTXRW839JRFkXLop5oCrPVijl0wx0bD1NC
         7ObOzVH5G2ssjXq9fgbT274Q3A6ybijUV1Wf3FSAjgK2am7SrFYylBZRbsQE6IyexjWX
         YN5Q==
X-Gm-Message-State: AOAM532cX/DS+vsp73ODkBU7TF2uRkp2FY+qRPqtgsY4KbcvCUQ9rbfQ
	wJzypJNXFKp9zFWC23p1iAi5yHCN77c=
X-Google-Smtp-Source: ABdhPJx0LAeDDpflzjiEYTOwZOIRcLGZhioDrPhNBATKFN1RUoXo5q/WK1BQeG6fvr4KxQdFiBnfrg==
X-Received: by 2002:aed:2128:: with SMTP id 37mr4311335qtc.163.1620309594470;
        Thu, 06 May 2021 06:59:54 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 01/13] docs: Warn about incomplete vtpmmgr TPM 2.0 support
Date: Thu,  6 May 2021 09:59:11 -0400
Message-Id: <20210506135923.161427-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210506135923.161427-1-jandryuk@gmail.com>
References: <20210506135923.161427-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vtpmmgr TPM 2.0 support is incomplete.  Add a warning about that to
the documentation so others don't have to work through discovering it is
broken.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 docs/man/xen-vtpmmgr.7.pod | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/man/xen-vtpmmgr.7.pod b/docs/man/xen-vtpmmgr.7.pod
index af825a7ffe..875dcce508 100644
--- a/docs/man/xen-vtpmmgr.7.pod
+++ b/docs/man/xen-vtpmmgr.7.pod
@@ -222,6 +222,17 @@ XSM label, not the kernel.
 
 =head1 Appendix B: vtpmmgr on TPM 2.0
 
+=head2 WARNING: Incomplete - cannot persist data
+
+TPM 2.0 support for vTPM manager is incomplete.  There is no support for
+persisting an encryption key, so vTPM manager regenerates primary and secondary
+key handles each boot.
+
+Also, the vTPM manger group command implementation hardcodes TPM 1.2 commands.
+This means running manage-vtpmmgr.pl fails when the TPM 2.0 hardware rejects
+the TPM 1.2 commands.  vTPM manager with TPM 2.0 cannot create groups and
+therefore cannot persist vTPM contents.
+
 =head2 Manager disk image setup:
 
 The vTPM Manager requires a disk image to store its encrypted data. The image
-- 
2.30.2


