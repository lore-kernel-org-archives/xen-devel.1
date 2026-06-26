Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E00C43211
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jun 2026 22:38:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1346561.1604970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wdFBu-0001cf-Qt; Fri, 26 Jun 2026 22:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346561.1604970; Fri, 26 Jun 2026 22:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wdFBu-0001cY-Nq; Fri, 26 Jun 2026 22:38:30 +0000
Received: by outflank-mailman (input) for mailman id 1346561;
 Fri, 26 Jun 2026 22:38:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <alhouseenyousef@gmail.com>) id 1wdFBt-0001bm-Sy
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 22:38:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wdFBt-00HIwS-9v
 for xen-devel@lists.xenproject.org; Sat, 27 Jun 2026 00:38:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a3eff65-e002-0a2a0a5209dd-0a2a4505d7a8-0
 for <xen-devel@lists.xenproject.org>; Sat, 27 Jun 2026 00:38:29 +0200
Received: from [209.85.128.180] (helo=mail-yw1-f180.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <alhouseenyousef@gmail.com>)
 id 6a3eff64-3cb2-0a2a45050019-d15580b4b4ef-3
 for <xen-devel@lists.xenproject.org>; Sat, 27 Jun 2026 00:38:29 +0200
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-7dfceeaf168so19491497b3.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 15:38:28 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-80abc3d1734sm23177557b3.15.2026.06.26.15.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 15:38:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782513508; x=1783118308; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI5He4iihLUJokMNvGv1uiqx/8mjJsZ4EoloRA/RmsI=;
        b=Z7xmlt9G5qI5F5hLtJCPPL9j2rTkf/2XiJz+zUFi2Qw56YSfZyp6r6Vk6tEhLwBdM+
         NtiJesZqb96cT+2woidIUXBjJNZVjfiyU2KyeS4hhDj1Xdu6CrmSYoO24vi5CS9QPLFQ
         2b0WO05LycaHdOVYcqtcZZZsftk2/ToXdLx5sqMG2IWESDkkDSpCpRUB4x6Z5iNY9QuJ
         N9akgfcXxsYNixxXe/k2KZXNbo+g8ZQLTLWQVYOQSltjr1Y8+ZcdeeatRULYYFKnhBOG
         LOTQM69TnB6aROUc6BrcCDKL8e6aGFuWFyl1K/wt8jP01FFijlgpudy/L73JvrrGU1TE
         VkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782513508; x=1783118308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CI5He4iihLUJokMNvGv1uiqx/8mjJsZ4EoloRA/RmsI=;
        b=EiAbY1inSyRjEMKZXx9w4QlL85kh6if89qsfIBC7cELOafoD6MrkrU7YXYeqWmalH9
         0X6Qlgyqbytt+T01TKwbqlkmgEgdJtPV01Rs6DH1wpyrwSJmEzuzx9iCMHsbnK9JM8A2
         PqijTb4FTb++vrK5pFZbGG9ATHpVu2e/CQSRZSVn0UJ4Zpb34okTOVAsNDiNFScqDeqZ
         ecO8H14k6jnpL8KzdEmZK+gAVqaPFGdP/A0VATpeUaC2/1MUHxRhS0DsiaunBMwCFlbL
         f2ILx7UmkG5VwpCa79g3+tKgV+FMJJ8rfbyumgr59JecgaS7afPZ6dzpiV5TM0E0z5Ru
         w8ww==
X-Gm-Message-State: AOJu0YwarzXJuxU95xfjpEd5djDEq5DXATtXsjpADL2yldbVxbTGWF+K
	8iuJ8NUXVdiJDO6yZlaO7bPRuyv7JQIQdJcvQqXK6cyUCU3JYLAzhTsY
X-Gm-Gg: AfdE7clcYTD+23nE2aRyIGyk5/0sOPjG+DwEs5baNZAgZWPBHtFRoGyWAMtw5ZuRsMs
	o09+XARAb3aqoLiwfVk1v9u1rTRsDlokwhg5TXg1PgwpX59jSY63hqDPDXSufewks4+R0HT5I44
	BNQGwwOMVAm0l1MnYx+WDlIUFbCG+COqqtgt9XnR1geWwrQWSGJOFyXaWP1hDVaU5gI9JqHZP9k
	a7BZyHumvpb+AZYm+kp8wSZvn8JnMdCa2F3hS6Fr/f1QjDcxR6HaFYbkeYV2HCH7yRs0ahOhpum
	dnDVI2vg9BYKqghBJq+CcOWGJkRnyspmi/VJV7lS1nKe2DY01P7BIkEbFNgXVVKdKH+fxZns+un
	gk1dR4c1Z8eoLyTAIcLMZSbrU2j5Cz2t5SyOMaXYSwQSmqUwy+KB8iATM+/zgiw5sp7ZEF8cUvJ
	siKyPvmrgzHBbWa1YPPoN+Bxv2xVnjgKTammi6
X-Received: by 2002:a05:690c:d8d:b0:7bd:5af9:f0a2 with SMTP id 00721157ae682-80a691c3383mr84757587b3.14.1782513507711;
        Fri, 26 Jun 2026 15:38:27 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH v2 2/2] xen/gntalloc: validate grant count before allocation
Date: Sat, 27 Jun 2026 00:38:05 +0200
Message-ID: <20260626223805.43781-3-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626223805.43781-1-alhouseenyousef@gmail.com>
References: <20260624124745.10073-1-alhouseenyousef@gmail.com>
 <20260626223805.43781-1-alhouseenyousef@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1782513509-17D1E2B8-D2A491A2/0/0
X-purgate-type: clean
X-purgate-size: 2040

gntalloc_ioctl_alloc() allocates the grant-id array before checking
whether the requested count fits within the global grant limit. Counts
above that limit cannot succeed, so reject them before the
user-controlled allocation reaches kcalloc().

Use a subtraction-based check while holding gref_mutex so adding the
requested count cannot wrap. Also cast the count before advancing the
per-file index so the page-size multiplication is performed in 64-bit
arithmetic.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/xen/gntalloc.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/xen/gntalloc.c b/drivers/xen/gntalloc.c
index 9279f1521..3218686be 100644
--- a/drivers/xen/gntalloc.c
+++ b/drivers/xen/gntalloc.c
@@ -272,6 +272,7 @@ static long gntalloc_ioctl_alloc(struct gntalloc_file_private_data *priv,
 	int rc = 0;
 	struct ioctl_gntalloc_alloc_gref op;
 	uint32_t *gref_ids;
+	unsigned int limit_snapshot;
 
 	pr_debug("%s: priv %p\n", __func__, priv);
 
@@ -280,6 +281,12 @@ static long gntalloc_ioctl_alloc(struct gntalloc_file_private_data *priv,
 		goto out;
 	}
 
+	limit_snapshot = READ_ONCE(limit);
+	if (op.count > limit_snapshot) {
+		rc = -ENOSPC;
+		goto out;
+	}
+
 	gref_ids = kcalloc(op.count, sizeof(gref_ids[0]), GFP_KERNEL);
 	if (!gref_ids) {
 		rc = -ENOMEM;
@@ -292,14 +299,16 @@ static long gntalloc_ioctl_alloc(struct gntalloc_file_private_data *priv,
 	 * are about to enforce, removing them here is a good idea.
 	 */
 	do_cleanup();
-	if (gref_size + op.count > limit) {
+	limit_snapshot = READ_ONCE(limit);
+	if (gref_size > limit_snapshot ||
+	    op.count > limit_snapshot - gref_size) {
 		mutex_unlock(&gref_mutex);
 		rc = -ENOSPC;
 		goto out_free;
 	}
 	gref_size += op.count;
 	op.index = priv->index;
-	priv->index += op.count * PAGE_SIZE;
+	priv->index += (uint64_t)op.count * PAGE_SIZE;
 	mutex_unlock(&gref_mutex);
 
 	rc = add_grefs(&op, gref_ids, priv);
-- 
2.54.0


