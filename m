Return-Path: <SRS0=KcSv=OD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE25C433F5
	for <xen-devel@archiver.kernel.org>; Mon, 13 Sep 2021 18:27:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9FDC60EFE
	for <xen-devel@archiver.kernel.org>; Mon, 13 Sep 2021 18:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9FDC60EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.185873.334630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPqfA-0000Pb-M8; Mon, 13 Sep 2021 18:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185873.334630; Mon, 13 Sep 2021 18:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPqfA-0000PU-J5; Mon, 13 Sep 2021 18:26:40 +0000
Received: by outflank-mailman (input) for mailman id 185873;
 Mon, 13 Sep 2021 18:26:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Zzy=OD=yandex.ru=isaikin-dmitry@srs-us1.protection.inumbo.net>)
 id 1mPqf8-0000PO-9S
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 18:26:39 +0000
Received: from forward108o.mail.yandex.net (unknown [37.140.190.206])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 202d31fb-14c0-11ec-b3c2-12813bfff9fa;
 Mon, 13 Sep 2021 18:26:36 +0000 (UTC)
Received: from sas1-13a2ee69ea33.qloud-c.yandex.net
 (sas1-13a2ee69ea33.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:b520:0:640:13a2:ee69])
 by forward108o.mail.yandex.net (Yandex) with ESMTP id 1C60C5DD49CD;
 Mon, 13 Sep 2021 21:26:34 +0300 (MSK)
Received: from sas1-f4dc5f2fc86f.qloud-c.yandex.net
 (sas1-f4dc5f2fc86f.qloud-c.yandex.net [2a02:6b8:c08:cb28:0:640:f4dc:5f2f])
 by sas1-13a2ee69ea33.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 RnCTFsLKqN-QXEOQGOn; Mon, 13 Sep 2021 21:26:34 +0300
Received: by sas1-f4dc5f2fc86f.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id rGWIcXSjtA-QVAmAHL1; Mon, 13 Sep 2021 21:26:32 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
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
X-Inumbo-ID: 202d31fb-14c0-11ec-b3c2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1631557594;
	bh=l4Xy+6AjeOD9IsajbIycNQtuqAoIo+6fbHJfaRuKTg0=;
	h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
	b=DAAoAQqL93KaYxImWzNLkdtDvSZ6BjFc1aKLWk4RTK2rV9PimrTFQauTJP/Dz8QEe
	 5DwSDZYbQgiapiwLqvIyotFBEZ0Aj6SO2AMiZmkj05Bd68KqohK9rc47HM75EVodwv
	 fzI9yGdqg+KZ54T8sUyT+FqrWiPz/wP/ELBWaZpU=
Authentication-Results: sas1-13a2ee69ea33.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Isaikin <isaikin-dmitry@yandex.ru>
To: xen-devel@lists.xenproject.org
Cc: Dmitry Isaikin <isaikin-dmitry@yandex.ru>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/1] tools/xl: Fix regular expression for autobaloon mode detection based on xen command line.
Date: Mon, 13 Sep 2021 21:26:21 +0300
Message-Id: <9dc667d2017e6e69877a2b9859041c1f7d965899.1631555561.git.isaikin-dmitry@yandex.ru>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1631555561.git.isaikin-dmitry@yandex.ru>
References: <cover.1631555561.git.isaikin-dmitry@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The case of specifying a negative size was handled incorrectly.

From misc/xen-command-line documentation:

dom0_mem (x86)
= List of ( min:<sz> | max:<sz> | <sz> )

If a size is positive, it represents an absolute value.
If a size is negative, it is subtracted from the total available memory.
---
 tools/xl/xl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xl/xl.c b/tools/xl/xl.c
index 4107d10fd4..a9f7e769fd 100644
--- a/tools/xl/xl.c
+++ b/tools/xl/xl.c
@@ -81,7 +81,7 @@ static int auto_autoballoon(void)
         return 1; /* default to on */
 
     ret = regcomp(&regex,
-                  "(^| )dom0_mem=((|min:|max:)[0-9]+[bBkKmMgG]?,?)+($| )",
+                  "(^| )dom0_mem=((|min:|max:)-?[0-9]+[bBkKmMgG]?,?)+($| )",
                   REG_NOSUB | REG_EXTENDED);
     if (ret)
         return 1;
-- 
2.33.0


