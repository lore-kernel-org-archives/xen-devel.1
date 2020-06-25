Return-Path: <SRS0=ZzRU=AG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEA7C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 25 Jun 2020 02:55:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E453B2078D
	for <xen-devel@archiver.kernel.org>; Thu, 25 Jun 2020 02:55:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Az91tkeP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E453B2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joI2U-0008LG-L0; Thu, 25 Jun 2020 02:54:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=829E=AG=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1joI2T-0008Ks-9V
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 02:54:57 +0000
X-Inumbo-ID: 40420b68-b68f-11ea-bb8b-bc764e2007e4
Received: from mail-pg1-x544.google.com (unknown [2607:f8b0:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40420b68-b68f-11ea-bb8b-bc764e2007e4;
 Thu, 25 Jun 2020 02:54:56 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id e18so2603444pgn.7
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 19:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zp4npQcgeZMS0pGjybddj8LwS3fxPZyTX8wZXmAxxq8=;
 b=Az91tkePwm/xh44txinQdcyBs/2AMx7g4pZmjPtGWK2i06v/4LoR+m3rR1QuJD/JYK
 Y07aw6vQOY6UupyMDXeuqqdgCerrwRSuFxZtNWPAPsSK2Y15Evu3u62oyDGJ1KInb3el
 y5pMfE7BF0nslx1d99ZO6inoSdV3sUcwB6LgDAXB1/vu8DHwlQRoJ97hfxqp2p6jflU5
 /jWTggLrwFX55TkRA9aPLeK2NvVdv2e/C/QwsxlOdQfBx43RxEDhMzgLpySzJZSu9EBS
 SbwThB3OXl8kBaxZVNhPp/UoUv1pyGsWBPayAXzR89WKZBIvUPbBq8KY7bFm22h8giPj
 NNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zp4npQcgeZMS0pGjybddj8LwS3fxPZyTX8wZXmAxxq8=;
 b=n7/WZGrLqHpaXjQk/uBwj7vzxkKe2j1P3qGvHVY/YQynpBcMoDkMsv7uQmsdCrTCsa
 3mmipDt9aCMajniUzCVkCCXT7CAsshgXrbaeCqrncAKcg+dpX2kSRtZBy6TDZvNVFNYI
 3jRIOKcjYGN5jUpzMzFe6ZGfVwTZOAYWVGGcY1Pb99DA9ifg/vbzpVZGeqFxcPwaq0bE
 Cu0AetYhVPjJsIn3Tx2miiujGnYcKmQvf1rkaUUcYDhu9bFatAYfXajuihIfdQfPtEtW
 zJt46s13X4HI8umuTLOJqTCQnHNUUiQ4S9p/Wn2fg47z2nBGIxYct1UDAYIzwKR8Sc4s
 YW2A==
X-Gm-Message-State: AOAM532hWPpd42Ncc3wTYHp3szxzeNwi6P/lNSuQJcVDwk57H9NguI8H
 vXgYJGepOoa36vsYzgn0D+s=
X-Google-Smtp-Source: ABdhPJxabE67+Alwujp7u9O15q0niQ7itBEEzErE0Ls5oHuYwsqVsBmpiuxlji26MFkmaJ/GNds1hA==
X-Received: by 2002:a62:60c7:: with SMTP id
 u190mr30255128pfb.240.1593053695830; 
 Wed, 24 Jun 2020 19:54:55 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.182.254.114])
 by smtp.gmail.com with ESMTPSA id y10sm18593000pgi.54.2020.06.24.19.54.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jun 2020 19:54:55 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Subject: [PATCH 2/2] xen/privcmd: Convert get_user_pages*() to
 pin_user_pages*()
Date: Thu, 25 Jun 2020 08:32:40 +0530
Message-Id: <1593054160-12628-2-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1593054160-12628-1-git-send-email-jrdr.linux@gmail.com>
References: <1593054160-12628-1-git-send-email-jrdr.linux@gmail.com>
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <xadimgnik@gmail.com>,
 linux-kernel@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 Souptick Joarder <jrdr.linux@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In 2019, we introduced pin_user_pages*() and now we are converting
get_user_pages*() to the new API as appropriate. [1] & [2] could
be referred for more information. This is case 5 as per document [1].

[1] Documentation/core-api/pin_user_pages.rst

[2] "Explicit pinning of user-space pages":
        https://lwn.net/Articles/807108/

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Paul Durrant <xadimgnik@gmail.com>
---
Hi,

I'm compile tested this, but unable to run-time test, so any testing
help is much appriciated.

 drivers/xen/privcmd.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 0da417c..eb05254 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -595,7 +595,7 @@ static int lock_pages(
 		if (requested > nr_pages)
 			return -ENOSPC;
 
-		page_count = get_user_pages_fast(
+		page_count = pin_user_pages_fast(
 			(unsigned long) kbufs[i].uptr,
 			requested, FOLL_WRITE, pages);
 		if (page_count < 0) {
@@ -612,13 +612,7 @@ static int lock_pages(
 
 static void unlock_pages(struct page *pages[], unsigned int nr_pages)
 {
-	unsigned int i;
-
-	for (i = 0; i < nr_pages; i++) {
-		if (!PageDirty(page))
-			set_page_dirty_lock(page);
-		put_page(pages[i]);
-	}
+	unpin_user_pages_dirty_lock(pages, nr_pages, 1);
 }
 
 static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
-- 
1.9.1


