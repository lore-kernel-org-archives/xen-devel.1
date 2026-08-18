Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F0FC5DF80
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 02:53:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393351.1632181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww9wk-0002Hq-RH; Tue, 18 Aug 2026 02:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393351.1632181; Tue, 18 Aug 2026 02:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww9wk-0002Hj-Mx; Tue, 18 Aug 2026 02:53:02 +0000
Received: by outflank-mailman (input) for mailman id 1393351;
 Tue, 18 Aug 2026 02:53:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <onlywig@gmail.com>) id 1ww9wj-0002GO-Ep
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 02:53:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ww9wi-005CSk-SC
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 04:53:00 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a83c8da-8faa-0a2a0a5109dd-0a2a4501ccf4-20
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 04:53:00 +0200
Received: from [209.85.216.53] (helo=mail-pj1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <onlywig@gmail.com>)
 id 6a83c90b-5984-0a2a45010019-d155d835f059-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 04:53:00 +0200
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-38ec1402b05so3260515a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 19:53:00 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net.
 [125.227.154.99]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3954d3b40basm4333605a91.14.2026.08.17.19.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 19:52:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787021579; x=1787626379; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LmPSKrMbhSlQ3VAakH/YeUU+H9erldiN9BSC2cOsGzs=;
        b=PBD2mBRLaLdWw6vmRafQK40MMX80kHCZi+f/X7sfgFychshAgLi4FH7QR/mmqmj66Q
         y8x5KYyPakO7u4eLVYMjzDidS2KtogeLzJchpvLKZuPwQrx+zbg4X/yPFbA62SXvMzhg
         1S/2wgMFK9+Q42t/G9OJT9ZUr4HFr/mKEuLKhpKRkbwDy67563Lk+FY09mnoVbcXi/R2
         N16i5jYKxCjriIbowcb5Wpme+c1AhOwtumMJQvz2nU4iwIIdNswej2+J3nc09Z1FQn7u
         8RjGIGf2hzDoGyOomoBgHLfvT9I8fCVgoJpVrcks9Wj4tV1o0AqF7iCQWi7aXXT3ltZG
         HOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787021579; x=1787626379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LmPSKrMbhSlQ3VAakH/YeUU+H9erldiN9BSC2cOsGzs=;
        b=TxWVB11TgKzbosmqQ+BJU0kU7K/ZMsajCZCzwmS6GAsvMjuPwopv95H99RN2MWF4Y6
         dYMlgc+iD2W8d32xae8pKyCj2vjGNV5sn0KJD07XZCIr2jvLY/bjAtUKN6T+eITPX/Lp
         5LndtmxeQP+50ihw2/7f/bYNxzDi3MH2SIMwtAFr+GApB6tWXNcMPBqgu7UatBXigy54
         n5NU7HiPFb5n7ebti1OB00s8T6zp8LK0fQWgp8roHdhB2QambEvkJfFg5Mzus2GFTLyQ
         NkT1LYIe1JEm4YkbmG+ACUVq2O4lzncuUONmjRI7fQ5ZeTsVUxRxhn5JG4y2UPgiGeZI
         OOxg==
X-Gm-Message-State: AOJu0YyaZ4Q13TXcTPvrNm2lGwwspQj72l+OLvu1T+F0LLfgKiy2Yaui
	qz4CCesYpAWpWclSqut5U73f1GHIl5WoX+y7fgHHlZkka0RbdXzAQmkTo93r8BB9
X-Gm-Gg: AR+sD12wtHXhJaDWh6VN4FeoA32v8aNoZj4SmtnsZNZ+gqF1MXM2Up/gUsy2uZH2rGu
	yxK80yzzrF/Yt3pJ6PGJrWVHrOaUtchB7QrzqAsTD8AaynnCyiuP0P+mJQM1RsWMsJ6SV/VjuN7
	7nHUSAPt+POsYUIDxek3ZtMlIAtCKAF0I3U4WMwGmIQSZHINLqLph4oWg/NV8Ym9jaXGN6evPBR
	2+bzXtS3ayTyo7bREIwvwlz4D709V54ESO7ZcUWCp8D5u5D2sSExY9JMW+AQbWruZkn14PLsIJS
	MB76rGpQkUY+ErrtJu+dOgbnl834mmxQhTW0rbltgpSbHTKZh5zyRnKYOy5XtJuhEHX1TyakVHn
	bqGF2EPPzpFjnHWJjh0U1hVFQ8fi8qdcrGciraI1kczm2ysl81LlqFJpKRTAo/Xs9ZkRzevq5fr
	578c8jGAVVStnU0q/O7XyazqRpqBpGSAPJ2bQIOr4qhsW/eegC9lJQcurRR0kP6WMeu2BKvMbQT
	n5wAgbtQJxQ9PY3OfdXYYIKqaItfVIs
X-Received: by 2002:a17:90b:224e:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-3933b506db9mr25497993a91.0.1787021578702;
        Mon, 17 Aug 2026 19:52:58 -0700 (PDT)
From: Wig Cheng <onlywig@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v2 4/4] MAINTAINERS: add myself as reviewer of i.MX8M related patches
Date: Tue, 18 Aug 2026 10:52:24 +0800
Message-ID: <20260818025224.4165503-5-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818025224.4165503-1-onlywig@gmail.com>
References: <20260818025224.4165503-1-onlywig@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1787021580-1FE68757-D59D1D7C/0/0
X-purgate-type: clean
X-purgate-size: 752

I wrote the i.MX8M platform and UART support and can help review
patches touching these areas.

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ed0ffa608f..0434377fe1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -364,6 +364,13 @@ F:	tools/misc/xenhypfs.c
 F:	xen/common/hypfs.c
 F:	xen/include/xen/hypfs.h
 
+IMX8M SUPPORT
+R:	Wig Cheng <onlywig@gmail.com>
+F:	xen/arch/arm/arm64/debug-imx-uart.inc
+F:	xen/arch/arm/include/asm/imx-uart.h
+F:	xen/arch/arm/platforms/imx8m.c
+F:	xen/drivers/char/imx-uart.c
+
 IMX8QM/QXP SUPPORT
 R:	John Ernberg <john.ernberg@actia.se>
 F:	xen/arch/arm/platforms/imx8qm.c
-- 
2.43.0


