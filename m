Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286B9C53219
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 16:16:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1376364.1623134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp6wY-0004kp-1l; Wed, 29 Jul 2026 16:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1376364.1623134; Wed, 29 Jul 2026 16:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp6wX-0004ki-Tw; Wed, 29 Jul 2026 16:15:41 +0000
Received: by outflank-mailman (input) for mailman id 1376364;
 Wed, 29 Jul 2026 16:15:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wp6wW-0004LT-If
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 16:15:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp6wV-008W3G-Vf
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 18:15:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a6a2724-e002-0a2a0a5209dd-0a2a450b88be-12
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 18:15:39 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a6a272b-b7e8-0a2a450b0019-d155802aac94-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 18:15:39 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-495590dde14so12030465e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 09:15:39 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49764d70144sm68720345e9.2.2026.07.29.09.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 09:15:38 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1785341739; x=1785946539; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V1E/kwcJQcDZE8xMeFM4U2KY8usB8x1zGYwTr8JNt5A=;
        b=WYnF/jVqTzZ7bSZFWNjrV5KS4/qo+VaWScX12BLnXK8O0yufdjgsaTDd1SzN57Hlgi
         TlEMyCm50Erbnmdx2ofrN9B1aniRGtN4y6wmNJE2iIiiH1pdD3URJ25KIMmzIu1OkNk3
         QXJU0MyoIgLyvNbF2Ri53n0vixObTetR4FivQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785341739; x=1785946539;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V1E/kwcJQcDZE8xMeFM4U2KY8usB8x1zGYwTr8JNt5A=;
        b=HBT5HcFYSfixsew7e0wRUtAsYJKDXXG7nrFVrnixlpaNWheBtwmh2NKti03bJt75nh
         RYfttLN/aYvw9hf6zdyJZmSGjm6XFIHeskDhHJYG5cfYWAXt4LoN2i6oVW/Oig458zyx
         l7zCesv0jVt+De0qmBCCP6LiGh4Exxff1IG18s98rLzy5kYHKCoWcLB5qhNjSgB2bJ6U
         rAFS2c4MZuaTer2XCl8FhFt4MB+7IqS3TZU0c3TdfVdqNDSVGN/JYh0jsBVWWYG1Of3A
         9STWpdZ1r2LQJvTh9uxyKbVHWWufBD5uCW121NsPwKSG8cqadO/T7kUoKH7cRGZ2PQcr
         YNRA==
X-Gm-Message-State: AOJu0YyGkQziELzryHvY+O4g1TbrpePU9+mchPcg5zQSCKe7QEVegBxR
	/h643PVF3htsfvYr0I1grO99v1bY59U7gK8Id/vO+Cb8nepnqMbWUqGxidpyjCznO7vyDFpeKnF
	H7ZIWevo=
X-Gm-Gg: AR+sD12DeLr5Oqih8oKMy3hrM/T7GDR8He3HqOhlavP1mZ6fWXhYgEIW3axzXpChlS9
	9aHCUHUQ/DVX+Wm6HGrpyXsWRTrICP7rBBb6iO8fnS5yWacb/mcltCkLjxfHtvpDbPmdHDjWKsI
	YqomLeFXKldqexyjQp9yXSOa/aQfbzbzWfcBzHaok/93/WKhTPmscEnddsC3YoxV/+huzpxA06s
	CVUkYS6Ht0bEdqnN6YepDT6ppvKKDkzDv7BYECHx8JLurJE5dMEKLiwkpyczaA9YNaWO82wcUlS
	KysIj3PKFThUgLuO9fbpGD5vjn2B8zI5rvEB1g8evvVgTmrwyOOfJj9IXkdxSL+adWXTUZzIDFE
	hTDzDV3VxvNlDosH9ADbANiK9VNyX7CVZME6IV9h3wYwyuw8KKYF9XkaIx7RkBQ38A59Hg9TGLl
	3vwruOtDw+IYSeRXhnF9yczJCkHh/8oaKLotOsKq0eyvtjz6Yth4kVvcendkpfLnKDn1mz1N7xS
	SgPLNEISaHJ84pv9TIfdVEGjJMF+moLCCEc9vhLVaOUEOETauY=
X-Received: by 2002:a05:600c:3f18:b0:495:4fd4:144b with SMTP id 5b1f17b1804b1-496c656e788mr80254995e9.21.1785341738941;
        Wed, 29 Jul 2026 09:15:38 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/2] SUPPOT: Define support lifetime
Date: Wed, 29 Jul 2026 17:15:29 +0100
Message-Id: <20260729161529.164017-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260729161529.164017-1-andrew.cooper3@citrix.com>
References: <20260729161529.164017-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1785341739-1A0C59EA-9B3C2AAA/10/73395122804
X-purgate-type: spam
X-purgate-size: 1201

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

For 4.22 only.
---
 SUPPORT.md | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 7c42de4c1602..b945fc83afde 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -9,13 +9,13 @@ for the definitions of the support status levels etc.
 
 # Release Support
 
-    Xen-Version: 4.22-rc
-    Initial-Release: n/a
-    Supported-Until: TBD
-    Security-Support-Until: Unreleased - not yet security-supported
+    Xen-Version: 4.22
+    Initial-Release: 2026-07-30
+    Supported-Until: 2029-07-30
+    Security-Support-Until: 2031-07-30
 
 Release Notes
-: <a href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">RN</a>
+: <a href="https://wiki.xenproject.org/wiki/Xen_Project_4.22_Release_Notes">RN</a>
 
 # Feature Support
 
-- 
2.39.5


