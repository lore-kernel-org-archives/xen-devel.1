Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460C4CD4F47
	for <xen-devel@archiver.kernel.org>; Sun, 17 May 2026 15:53:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1311234.1581488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOdnv-0004wY-1C; Sun, 17 May 2026 15:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311234.1581488; Sun, 17 May 2026 15:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOdnu-0004wR-UE; Sun, 17 May 2026 15:53:22 +0000
Received: by outflank-mailman (input) for mailman id 1311234;
 Sun, 17 May 2026 13:38:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yashsuthar983@gmail.com>) id 1wObhK-0003F3-QC
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 13:38:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wObhK-0009gY-2g
 for xen-devel@lists.xenproject.org; Sun, 17 May 2026 15:38:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yashsuthar983@gmail.com>)
 id 6a09c4cf-bab6-0a2a0a5309dd-0a2a4502e032-2
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 15:38:26 +0200
Received: from [209.85.214.178] (helo=mail-pl1-f178.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <yashsuthar983@gmail.com>)
 id 6a09c4d0-af86-0a2a45020019-d155d6b2dcfc-3
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 15:38:25 +0200
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2bab2548e8bso5562085ad.0
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2026 06:38:25 -0700 (PDT)
Received: from yash-Bravo-15-B5DD.local ([14.99.167.142])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5cfe64a9sm119689685ad.53.2026.05.17.06.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2026 06:38:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779025104; x=1779629904; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Up+AAAQj+csNMtbAdRw7R9ZHQCbCzjkAYPzeriCxm8=;
        b=Pg9sdmm5yyc2RrI4QqDPfzuHYDAu6R4439w2+KGzZYDhjlvBlf4RSdBWLQPP+HnYl4
         lGPvL7TqCTsiAQPvZ8KzspKQ6GwyrweHefCahdy5Mqos27GfUmaAcmTDVypsub77XM7N
         C7Zx0+nhGm57bFC1Qpv+I4lLuCB5Zg/CliT96KNjqG5KC1aq8UdDDPaoMKEAkUJ+CFpH
         vdN4XxbyPZxiBBThNZqVdG7d3WCBjBmMpK8aGnlq17d7/5J2Ixt2hwCIfLkZtaNjTvQa
         Qevx9MgriJT8/kRlUXturrKloMNjnxJ344RijxwjEgc4R3JWstnFmOcufpyasPNxXQa2
         Qpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779025104; x=1779629904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Up+AAAQj+csNMtbAdRw7R9ZHQCbCzjkAYPzeriCxm8=;
        b=TXTGz4x8gAHLGByFCFrS+4tILwR1LL6TgwWNn8Wg0BB2rMOmoKIY+m9elGM6zhjz1r
         1H2PRojFJJ3mt+yQnvhun6LLyrrOohRTIiiWLYrLTJk/LuM9zm0pjDRA8KFGmrhgaPq2
         9yLTY0HXg8dd7lNo00nRY0ILLBvX8O26HR1z10Xyk42liTQ/EkSAT61YRu+vngnRL62K
         jP9vNgh/DknWizZopc2uFrVn0YppvZLQAgetMSNMwhjqZ3Mb1H1Qf7UXERqqXLucpHHG
         /Sxs6w+pWMv2on4KFPJ/PUwh3x0h1tbM9nZMesqxe4J8Pw3redfx0E+AEtxxZQP/ph+F
         N4lg==
X-Forwarded-Encrypted: i=1; AFNElJ+Z9ehiacpEcDYRHKm43wI2+qYCsc6O+1sIzlGIzRLoIA13Ew2+PNtRljTG82WXtdPlSbC+f4MsLag=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7VV//xPeyRiaoTynECDHaVmyWGkNGr0cnuCF4hujr4042PpIj
	33TJZi5iSRhp5Sr9iEEToeFw/vbXrlFeNmtRArZUsGnCPZF6H3JfHSBr
X-Gm-Gg: Acq92OGgDB/QpA9lVmqPzOCOYyeuU3pPtUIQ0b+f+jfc9A8wS0qlqWcm072oyNBSv7l
	dLDiJYabIN360QlMVjQBRgzEP47JWPEX7y0t6bAcgE+eKZCH54iIDgdzN+6PkoY9YoY1j+WvdP3
	1VB7NWAeGMmMnlH9uMIHWy1gJ9yqSArSYxILS22Gck9FdhwkfayS+2eWfOqufDqmhFT9AtUrkTk
	akTzueS1Udtw9UYo9Zm86MpDA0v5IcGnVY3kmXM7lXA9RwlypOyQ7OPyimCTkbOK8mgdwswluFC
	f1R50wdnIqnksex+ugzXVOg7o+5OuiVIuIHY+gJvgClsMqO9endIgN0Yuw8TI8jFNTQbFAvcTsv
	D++L20A+HGpizd5q26iBOHlQM50Q/S41dtejvhWIKofQu0KIDvxHj0KaoK2hO8Syr7lxjNzYuTB
	PAujOJEswKXKRsveeDRnKO64AKlZp0Q4/i4GOtjS2aE7CTfZoJ/QVfYy4=
X-Received: by 2002:a17:902:e743:b0:2b4:696b:7bb7 with SMTP id d9443c01a7336-2bd7e8ae070mr127427075ad.15.1779025103805;
        Sun, 17 May 2026 06:38:23 -0700 (PDT)
From: Yash Suthar <yashsuthar983@gmail.com>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Yash Suthar <yashsuthar983@gmail.com>
Subject: [PATCH] xen: balloon: Replace sprintf() with sysfs_emit()
Date: Sun, 17 May 2026 19:08:17 +0530
Message-ID: <20260517133817.29691-1-yashsuthar983@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1779025106-82F6E161-133FE200/0/0
X-purgate-type: clean
X-purgate-size: 1548

Replace sprintf() calls with sysfs_emit() to follow current kernel
coding standards.

sysfs_emit() is the preferred method for formatting sysfs output as it
provides better bounds checking and is more secure.

Signed-off-by: Yash Suthar <yashsuthar983@gmail.com>
---
 drivers/xen/xen-balloon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/xen-balloon.c b/drivers/xen/xen-balloon.c
index b293d7652f15..67b0e2dbe84a 100644
--- a/drivers/xen/xen-balloon.c
+++ b/drivers/xen/xen-balloon.c
@@ -138,7 +138,7 @@ EXPORT_SYMBOL_GPL(xen_balloon_init);
 				   struct device_attribute *attr,	\
 				   char *buf)				\
 	{								\
-		return sprintf(buf, format, ##args);			\
+		return sysfs_emit(buf, format, ##args);			\
 	}								\
 	static DEVICE_ATTR_RO(name)
 
@@ -155,7 +155,7 @@ static DEVICE_BOOL_ATTR(scrub_pages, 0644, xen_scrub_pages);
 static ssize_t target_kb_show(struct device *dev, struct device_attribute *attr,
 			      char *buf)
 {
-	return sprintf(buf, "%lu\n", PAGES2KB(balloon_stats.target_pages));
+	return sysfs_emit(buf, "%lu\n", PAGES2KB(balloon_stats.target_pages));
 }
 
 static ssize_t target_kb_store(struct device *dev,
@@ -180,7 +180,7 @@ static DEVICE_ATTR_RW(target_kb);
 static ssize_t target_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
-	return sprintf(buf, "%llu\n",
+	return sysfs_emit(buf, "%llu\n",
 		       (unsigned long long)balloon_stats.target_pages
 		       << PAGE_SHIFT);
 }
-- 
2.43.0


