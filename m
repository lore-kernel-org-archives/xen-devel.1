Return-Path: <SRS0=bMr6=AR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AA5C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2020 18:08:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8963020720
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2020 18:08:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYmDnfr2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8963020720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsVXH-0003Xr-JF; Mon, 06 Jul 2020 18:08:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8At=AR=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jsVXG-0003Xb-CN
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 18:08:10 +0000
X-Inumbo-ID: a628ce30-bfb3-11ea-b7bb-bc764e2007e4
Received: from mail-pl1-x642.google.com (unknown [2607:f8b0:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a628ce30-bfb3-11ea-b7bb-bc764e2007e4;
 Mon, 06 Jul 2020 18:08:09 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id s14so15633068plq.6
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 11:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lQCZlvushcOD69EcXhMHyrU/TPLV5UJPHlxcyr/r1Xg=;
 b=PYmDnfr2KReJ6L3ka/pFQ5TCVzJeDABsscKdIo2hVK+g6RynNJZXKJA8nKzjJjOnq0
 L2VdcsAO3SDozGKprBlSPKVlFyWx7ATEpTpHPmuQpqv+2Av+4+UtEMqP4nkiI/TBFFud
 YrT89cUVzUAujSFRvMPiwbghNFNc5iir/1aAB3zwSpXHvBizJQ+zLqhEevq9ZGMXUgDo
 /5JbKtwsVXV5OZ84G6tunl9EnJlXINSomZ+kuBkCV+2h8io0Gx75UW8PzdiOGLFGAV3E
 N4+IHa22YZq1UWZL12+aqy8rW4h9Ghp2VSD7l8bky+RMlBK5Ez4iWmccWaS138Ltdd4F
 J8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lQCZlvushcOD69EcXhMHyrU/TPLV5UJPHlxcyr/r1Xg=;
 b=QHbOTwC8wqOc7gZVjYyaUuAzoWzjXe6lJYUQ99rBmLw2Y7G70s1c5Rgi5cRYwnVKya
 vWH7/m7R+igWW7KY8ecN8C+4La3Axw5tn3wmBGEYHfQz0sredKnyXeYi38hGEAekqmBV
 VykuPFT55f2+e/ndta6gdwuiaS8NeusZOsvVm9mltFbRDrUUaacHuY/1tDVyduD/4ZFJ
 SBx3/Gi7n64x128BIe6NrM28IOQ17EFc/LgJMqEpeJF9/Yl8BMmKvKQNS0Ib7m8M8y3m
 /pmYCdUZwSP3Di0KLP+wokLGVyuUCsG9sMWjZ7EnWjyjTXNA1lYamQCX+JS6InaYL9C0
 2hxA==
X-Gm-Message-State: AOAM530PQXu8HFLjiICec4rfS/DrD/lf0zyXiPrulVhtovpMFj8Zcfra
 HSeT+xZA4Bn1zDPXsvnOExs=
X-Google-Smtp-Source: ABdhPJxXyvj4hRWrdgEtWV/PcGf7R0fJvjrqlaQ3A42V+efb3QSuM3VXtxd7bpryewDUbBJN29AM8A==
X-Received: by 2002:a17:90a:ff92:: with SMTP id
 hf18mr461075pjb.10.1594058889231; 
 Mon, 06 Jul 2020 11:08:09 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.171.43.125])
 by smtp.gmail.com with ESMTPSA id 199sm20425544pgc.79.2020.07.06.11.08.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jul 2020 11:08:08 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Subject: [PATCH v2 2/3] xen/privcmd: Mark pages as dirty
Date: Mon,  6 Jul 2020 23:46:11 +0530
Message-Id: <1594059372-15563-3-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1594059372-15563-1-git-send-email-jrdr.linux@gmail.com>
References: <1594059372-15563-1-git-send-email-jrdr.linux@gmail.com>
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

pages need to be marked as dirty before unpinned it in
unlock_pages() which was oversight. This is fixed now.

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Suggested-by: John Hubbard <jhubbard@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Paul Durrant <xadimgnik@gmail.com>
---
 drivers/xen/privcmd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 33677ea..f6c1543 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -612,8 +612,11 @@ static void unlock_pages(struct page *pages[], unsigned int nr_pages)
 {
 	unsigned int i;
 
-	for (i = 0; i < nr_pages; i++)
+	for (i = 0; i < nr_pages; i++) {
+		if (!PageDirty(pages[i]))
+			set_page_dirty_lock(pages[i]);
 		put_page(pages[i]);
+	}
 }
 
 static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
-- 
1.9.1


