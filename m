Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A33CD98C5
	for <xen-devel@archiver.kernel.org>; Mon, 15 Jun 2026 16:44:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1338455.1599488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZAPY-00089V-NO; Mon, 15 Jun 2026 16:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338455.1599488; Mon, 15 Jun 2026 16:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZAPY-00089O-Jz; Mon, 15 Jun 2026 16:43:44 +0000
Received: by outflank-mailman (input) for mailman id 1338455;
 Mon, 15 Jun 2026 16:43:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZAPW-00089E-US
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:43:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZAPV-007CPv-O3
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 18:43:41 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a302ba2-2eae-0a2a0a5409dd-0a2a45048be4-42
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 18:43:41 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a302bbd-1dec-0a2a45040019-d155802ea4d3-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 18:43:41 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4921e4dd62dso20167145e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 09:43:41 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa97a07sm8140625e9.14.2026.06.15.09.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 09:43:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1781541821; x=1782146621; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Uxz4AFsb6BuvOZ2L5jpMpjXOP12D2W1S6mLyHuiDvU=;
        b=hjr+tzJUJ+eCx5agLkbKX+it1KF0/h6hT4BAPa4xAr9nW2ogNp6PcBT54mLj/j3fML
         VhKiwI/06msKP1TfT3nkbS66OuUpCiI68DDslc7m8qQB7FjjBYsuxEWiUFhkq4Lu5Nqf
         51bdTEclKoOc3xj0HeKAiJuX5QpZROutMxVeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781541821; x=1782146621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Uxz4AFsb6BuvOZ2L5jpMpjXOP12D2W1S6mLyHuiDvU=;
        b=F3Wfr6xs+WmJmnaRwVGeNmd1gLE24NJy5ULSaiUzgaDxjz9ggeMW4m9/9lrA8+8K+R
         gi5F0II5Yr7s1o1nlgR04rItY9lZiEFdnHEjqJvVgdxBqza8EIpn4m7qZ1QiAxeYT2CA
         T4o1LqzxUCJNGZMFvCMptr6pP24pGt849IVdejvbsVoWTQfbbLxQRXP7+yY+fG4D9bHS
         8ErIq6GXPnmB7VkT/5JVJpeczuh3KPzzPTuWpE6abkchVepux9b3PuCFA5kuHK7MRT+I
         ovEpFqe6Wh9LTUnvJ5Xa7KdkBOjRa8j796gldtbjakJQzH4vLj/ccpwEy7sDNWGrUtJO
         ff/A==
X-Gm-Message-State: AOJu0YxSh7Uk0PZELCI0QXiXoHmeoX0EBjC/eOyanvxIJ1s+ayDiw7HP
	fxlRTFhcoR1CXIDUz9DTTVmrqohb8RfJ7XAYRinCsBlXdbJaKuG5NLTyLAF0iZtZgL7pG2tMQrz
	U1A/L
X-Gm-Gg: Acq92OFkwKjVadt6rY9ojaatfRNtJrYMm6uG+I2opwA+X6KbQzLpUmhsi+A1F9NAnvn
	G6zsFFqOSzqGCBlBT1qsflIeYWKf4Ch9/rqziT3jsfXb9G2CHmWUwtSWKM4RVVN6kjiP2H2xfGl
	1YfHa7Un8IF31KCy8RjNTCTYY+SpaNVezvyyRFMlT08wu+qbmH2brwShAuzpEdGOEnaHmgGLT3H
	zwEYIUevqoRxVVlVJs61Jy0M32wuhLRxMngKl7KoMwf8xsgbyetSZE4n6rQDKgP6AKdhWnGl832
	MsFehbuOl2reDcPSfCOzL9MttNAN8QJ6MPrpC3pDd2jB0dVgXDcZcJ9Q5Ha0bnsnl5vXAIiJUuG
	tJ9jFuSsP6ge1bqeRCNeJWUJywE2F9TU8twplgxEfEereYM0WseDpPlahycqouU0vwj/9IeviK3
	AmiSV8MOSpp3bE2gPjxaO60ecNLbsok8meCmgdR65SVABVtvI78aqe+NTgN1V+oaPhUZzI9lkeZ
	/3s
X-Received: by 2002:a05:600c:6215:b0:490:e180:2e0 with SMTP id 5b1f17b1804b1-4922fab22c9mr4202245e9.3.1781541820907;
        Mon, 15 Jun 2026 09:43:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v2 1/7] tools/xenalyze: Fix -Werror=nonnull failure
Date: Mon, 15 Jun 2026 17:43:19 +0100
Message-Id: <20260615164319.3206324-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260612230924.3181154-2-andrew.cooper3@citrix.com>
References: <20260612230924.3181154-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1781541821-433673FF-C27E6193/10/73395122804
X-purgate-type: spam
X-purgate-size: 1256

GCC 15.2 with Alpine Linux 3.24 fails with -Werror=nonnull, complaining that
we're calling bzero(NULL, 128).

This is a legitimate diagnostic.  xenalyze has it's own error() function
shadowing the standard library one, and can in principle return when p is
NULL.

Extend the check in error() with ERR_MAX_TOLERABLE to short circuit the
variable tolerance check.

Suggested-by: Anthony PERARD <anthony.perard@vates.tech>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
v2:
 * Fix in light of error() being local

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2602806440
---
 tools/xentrace/xenalyze.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xentrace/xenalyze.c b/tools/xentrace/xenalyze.c
index 876d59d42ca5..42feeb282e31 100644
--- a/tools/xentrace/xenalyze.c
+++ b/tools/xentrace/xenalyze.c
@@ -8767,7 +8767,7 @@ void dump_raw(const char * s, struct record_info *ri)
 
 void error(enum error_level l, struct record_info *ri)
 {
-    if ( l > opt.tolerance )
+    if ( l > ERR_MAX_TOLERABLE || l > opt.tolerance )
     {
         if ( ri )
             dump_generic(warn, ri);
-- 
2.39.5


