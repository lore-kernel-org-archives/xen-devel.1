Return-Path: <SRS0=oX/+=76=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE6AC433DF
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2020 03:07:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE64A2082F
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2020 03:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRtzcfZI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE64A2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlOPd-0007MX-7f; Wed, 17 Jun 2020 03:06:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dcrs=76=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jlOPb-0007MR-Tc
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 03:06:51 +0000
X-Inumbo-ID: 96fd4fe2-b047-11ea-bca7-bc764e2007e4
Received: from mail-pf1-x443.google.com (unknown [2607:f8b0:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96fd4fe2-b047-11ea-bca7-bc764e2007e4;
 Wed, 17 Jun 2020 03:06:51 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 23so415292pfw.10
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2020 20:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=dq2SjmoQupE4U9LhXdo/f9IZ6YV5RooIfJwqe+qSBlg=;
 b=cRtzcfZIAK/fnCW3uavu1pTWu4tlI6Gez8w4jjX7ksTVmViB2GmyPtbfv4pHB2N0B7
 52+2ATk8e+AdXsI+gEvmXN+4fq+8vjqv5o1Q0+Vd0gW34QPnbxztqI7LwNR9biWgAZ+K
 iouMSgsyC99J7dM0nr1U+0TzVOj6EhcTo2mWN62PK3JzQGIoX4VIrHq49FgsD5+CV6F5
 qU4zo67ue4q3ETFJqak0LoXVYaD8bpLC4qjg64CJULa32Hlk6S/kdBQ2e+0k+xTrp5Ap
 r2l0ZLwk0wBa1V5SVadZXT7AZlW/xY4KUHIACaXXJvCEgsyULxXV6Kpj0/Uv1SEvLz6T
 rMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dq2SjmoQupE4U9LhXdo/f9IZ6YV5RooIfJwqe+qSBlg=;
 b=hORn5p17sHhQpeBUECYZqH+SbV/gvZteRVgMX5dIg7ZmA6ZS0arz1AbZKgGkjTIA2U
 JqBmK9eqngpxXZRNW+8z7tTGp8onjoVNWRuf/CWZqTirJ+qtY+AUbNzjtypkYLTyoPNx
 GbIx2s3LfSPGoWNvuFGGoE0m/JFux75/g4n8gLu6lS05xpiVE3dwMNkV2uvanHra9FmK
 gB+JCcvsTqsMLEfbqFyB0UfVa9y7kMC8P5prvy9+EeU6qouzGwoN+0WujfymYqRPYvgp
 leiMvD4QnMVrH/OLdvhLdcfVxSIuS/CFoysZ8IvE+rabMCPtOCR//8SVz5QuHs69q2l7
 aEjQ==
X-Gm-Message-State: AOAM531mQFmIi9AI9nm5uccO+UNgbmtVwrD231Zs53YAmNei/KTJu8NA
 2xpUQM8ut4viA0P4E9FRJ2Y=
X-Google-Smtp-Source: ABdhPJw//k0NXcYX0XzZ+Ih/gjrZwd7t+FwVka95iS2KhwMy/vQRUu8NT/fZjBz2+jqHCu7RJ8h7ag==
X-Received: by 2002:a63:4822:: with SMTP id v34mr3878745pga.81.1592363210656; 
 Tue, 16 Jun 2020 20:06:50 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.171.213.184])
 by smtp.gmail.com with ESMTPSA id g19sm18210446pfo.209.2020.06.16.20.06.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jun 2020 20:06:49 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Subject: [RFC PATCH] xen/privcmd: Convert get_user_pages*() to
 pin_user_pages*()
Date: Wed, 17 Jun 2020 08:44:58 +0530
Message-Id: <1592363698-4266-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, Souptick Joarder <jrdr.linux@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In 2019, we introduced pin_user_pages*() and now we are converting
get_user_pages*() to the new API as appropriate. [1] & [2] could
be referred for more information.

[1] Documentation/core-api/pin_user_pages.rst

[2] "Explicit pinning of user-space pages":
        https://lwn.net/Articles/807108/

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>
---
Hi,

I have compile tested this patch but unable to run-time test,
so any testing help is much appriciated.

Also have a question, why the existing code is not marking the
pages dirty (since it did FOLL_WRITE) ?

 drivers/xen/privcmd.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index a250d11..543739e 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -594,7 +594,7 @@ static int lock_pages(
 		if (requested > nr_pages)
 			return -ENOSPC;
 
-		pinned = get_user_pages_fast(
+		pinned = pin_user_pages_fast(
 			(unsigned long) kbufs[i].uptr,
 			requested, FOLL_WRITE, pages);
 		if (pinned < 0)
@@ -614,10 +614,7 @@ static void unlock_pages(struct page *pages[], unsigned int nr_pages)
 	if (!pages)
 		return;
 
-	for (i = 0; i < nr_pages; i++) {
-		if (pages[i])
-			put_page(pages[i]);
-	}
+	unpin_user_pages(pages, nr_pages);
 }
 
 static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
-- 
1.9.1


