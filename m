Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135F9606A31C
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 22:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=IOD5vZky
Received: from list by lists.xenproject.org with outflank-mailman.1491599.1692315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT59K-0006pW-HY; Mon, 16 Nov 2026 22:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1491599.1692315; Mon, 16 Nov 2026 22:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xT59K-0006pP-DR; Mon, 16 Nov 2026 22:26:06 +0000
Received: by outflank-mailman (input) for mailman id 1491599;
 Mon, 16 Nov 2026 22:26:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xT59I-0006pJ-FG
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 22:26:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xT59H-00FrKy-Rq
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 23:26:03 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afb828e-bab6-0a2a0a5309dd-0a2a450cb2aa-32
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 23:26:03 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6afb82fb-f479-0a2a450c0019-d155dd36f025-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 23:26:03 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-491971ac844so3462348f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 14:26:03 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5d223b21sm27292099f8f.2.2026.11.16.14.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 14:26:01 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1794867963; x=1795472763; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jyFXJmnEADHcqDPhGx/kRZ6k5hoXysYI+LgxAK7Q3rE=;
        b=IOD5vZkyofmoXqeqFhq/Oz3FlSAKR5TxHgGtRXKD2dhhRuLD8Eus/5sytklF2doODq
         r+M57PrLieEkQGer+eyQIrJGFzEC/KWIVLK00CcyoUdyTLGsK8V9VCXF9iUOhpYzvH70
         IBShCqqWEVkt6Kyl0/zMxqI4NheY4YMQmQ2IQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867963; x=1795472763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jyFXJmnEADHcqDPhGx/kRZ6k5hoXysYI+LgxAK7Q3rE=;
        b=qprEfAd9vmwhKp1kZk/+bSNLBPyJ1T8f7du32b0tsGeYC4tavQyeFd2kEK7LitbJdI
         OtgAXbvEO4BK/QPqVHwHDV6TGAOpksMBgKOGVD9fmHNYFtmF682P2G+qXPLU6KWbA3YF
         /oLMp83qjaK/WWgoPMWqGgGII+TiJB0Fy19m45PXwn3lRu4GyEGyxPsimMz5eYkB/qVY
         1H3zMCzJYW+Htlyg72JwHD03C2dtNDQbcrP0imeSPO9msoUD8/BBFk5cf1qP0ofLcarm
         SNVry1ZQOQ7ud/5MiUYfIftALO36+DEChHWPTL0MGuX0epe/Xd1yWS/yzT+5IUMufiUK
         G1dw==
X-Gm-Message-State: APuU4Z8kKeGwt6beXaPfiYOMJ4087DP68cweBNQmDA6ZC0K+mfUzSk9X
	ADA9Icze3cL/KC0z43K0mWp273JcDLJNfcnT6DSjtdWCfVXVXKxpZFZZjSbgzu4v/NJ4aTlvYBv
	Sojcd
X-Gm-Gg: AZFdTZeCU0TTZVE9SYmKVTAE/CLq4/2ptbBNYMPJl0MKR/bEnvUjPrpMrBFOu1Vkew7
	q8pnW472P2OlLMzLEoIfBY5+K9MP3v2VjYbP2ovr7CgLLXHNb9xxf6oWWpdm8RCCZAXsl3Xz9e6
	vUZ0cLDi8ax9izuOfyI0cK8WeS1M2Cxy2nZXeUxJw/23lUG9TvfGcqzx2VYnqgGj4B7qqVKeY8A
	dD44HCIV/c71c1XY3XRz0Nx8WnsGgGO/aM0pFBIVFBMR/lUZo6OLXL14jDXZMgTswpviYLmu1Tp
	wkUPR2c5UOqkoIm+u2X/a2qA5tCWDWjEdYH5e5Jz89StH0l9kzllEjTK6Jl4AhTlNWYcviDLVL6
	PClFUQ5OHO0nuOI9Jyf+rPrbisK4C4rfamnUAHdYH6uDvAj+RTZUKhdYc2ZzrW0t0w6G6wBC0JX
	//fbx8sRQnTd5hlyuDry0CPEDNcy3UHURrEFMAPbRut42Hj5LUQgfzlUeMzGRa8JimXZKlkTNth
	i6hhM9igxYp8IXprXW/k9zod2xEJtLtNyp0nDd2tcWLdd+LRmG87nKek+48Q9tBBDfA7JP9mENY
	tePz6/2/vWqt39MEMIkL/RpXHGy2tAVhvk+PRVlNy0RD9raqt5aOtd7zpFPi37P1lz87i2DHIkk
	YbJ4=
X-Received: by 2002:a05:6000:400e:b0:4a2:6542:989a with SMTP id ffacd0b85a97d-4a265429a6dmr6158924f8f.52.1794867961804;
        Mon, 16 Nov 2026 14:26:01 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Olivier Lambert <olivier.lambert@vates.tech>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>
Subject: [PATCH] tools/ocaml: Fix OoB read in stub_syslog()
Date: Mon, 16 Nov 2026 22:25:59 +0000
Message-Id: <20261116222559.3824604-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1794867963-010C9A5B-05D2536A/0/0
X-purgate-type: clean
X-purgate-size: 1629
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

__syslog_facility_table[] maps Ocaml LOG_* facilities indices to local system
indices.  The final line is intended to initialise 6 entries in the table, but
only initalises one with the logical OR of 6 facilities, making the table 5
entries too short.

This is probably a copy&paste error from Ocaml, where | is right operator to
use for a list of this nature.

Fixes: ea8ddf27e5c8 ("ocaml: add logging bindings.")
Assisted-by: LLM
Reported-by: Olivier Lambert <olivier.lambert@vates.tech>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Andrii Sultanov <andriy.sultanov@vates.tech>
CC: Guillaume Thouvenin <guillaume.thouvenin@vates.tech>

This is only an issue if you modify oxenstored.conf to use one of these
facilities.
---
 tools/ocaml/xenstored/syslog_stubs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/xenstored/syslog_stubs.c b/tools/ocaml/xenstored/syslog_stubs.c
index 760e78ff73dc..16c7202d39ba 100644
--- a/tools/ocaml/xenstored/syslog_stubs.c
+++ b/tools/ocaml/xenstored/syslog_stubs.c
@@ -30,7 +30,7 @@ static int __syslog_facility_table[] = {
 	LOG_AUTH, LOG_AUTHPRIV, LOG_CRON, LOG_DAEMON, LOG_FTP, LOG_KERN,
 	LOG_LOCAL0, LOG_LOCAL1, LOG_LOCAL2, LOG_LOCAL3,
 	LOG_LOCAL4, LOG_LOCAL5, LOG_LOCAL6, LOG_LOCAL7,
-	LOG_LPR | LOG_MAIL | LOG_NEWS | LOG_SYSLOG | LOG_USER | LOG_UUCP
+	LOG_LPR, LOG_MAIL, LOG_NEWS, LOG_SYSLOG, LOG_USER, LOG_UUCP,
 };
 
 value stub_syslog(value facility, value level, value msg)

base-commit: 97bf370375113caf92fccf04e2877fc6b5ff887f
-- 
2.39.5


