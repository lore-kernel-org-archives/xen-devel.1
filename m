Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00045606A321
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 22:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FjxzSnP8
Received: from list by lists.xenproject.org with outflank-mailman.1504181.1699695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWhyI-0006KD-6w; Thu, 26 Nov 2026 22:29:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504181.1699695; Thu, 26 Nov 2026 22:29:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWhyI-0006K6-18; Thu, 26 Nov 2026 22:29:42 +0000
Received: by outflank-mailman (input) for mailman id 1504181;
 Thu, 26 Nov 2026 22:29:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 1xWhyG-0006Hd-MT
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 22:29:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWhyG-00BqUv-37
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 23:29:40 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 6b08b288-8faa-0a2a0a5109dd-0a2a4505c8f0-38
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 23:29:40 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 6b08b2d3-4cb1-0a2a45050019-d1558032d98d-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 23:29:40 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4bb64ef5a00so61067255e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:29:40 -0800 (PST)
Received: from bala-Latitude-5580.. ([129.0.189.183])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884b7515sm871972235e9.13.2026.11.26.14.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 14:29:39 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795732179; x=1796336979; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=//JEwSX9kpvmwLIPbNhrHAlejZPixL2IAttbaE9SvKI=;
        b=FjxzSnP8vXOAdqYDyBsb91EB9BxWof4mVy3Siv0C01Qxd6ItcCDmlgFPumZ3IbaBDQ
         GkhMQFC07AbCVvnmWfZStHSY7JJDjBxjpkH7eioPCbVt11vzlCZv+pBdZHly1C+BfpLN
         w7TnPZcoGJZEY8houvQvPc75TFU23gxWQFedOJItVGLU92tFmW2pN+izWWMKRJFnBHkB
         7RgFONoLKyI4MkgL+n9pUARyXqAeh+jsiDHqQiWCq08a6Bo1MgZK95kmGRtCRjfD3iY2
         lRCQ/QZ+UXcCDp5C92seszGjv93o6pQsLIq6X2NUv63nQDQpRvIRJv9faU6HbTzRbN5f
         gVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795732179; x=1796336979;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//JEwSX9kpvmwLIPbNhrHAlejZPixL2IAttbaE9SvKI=;
        b=JpcR/lfE/5GI5bJMlyzaQ9kGCABPHAlJ4Aucf46y9T++esgeeH+6eiJN5ZZlsP5Gxn
         oPZM4KyvfNAZk8XeajhO8wrqMFGYrsJ+jUiR5dZPvKLA0/hHMJIEjSY2H0ahJo36xTzo
         /vwwcZ50qGGTwKObh2tN0TlLyuOll0/8CcUFL5MI5OIX54327tndERdxzWbYYAFmhjFk
         mwraiTkURCWlLae/lzKqiQZb6NjUodWPu9n8c0P86KdN2NkbKlpamB28v2NLNvTzk9ab
         ApjHqB/TZSvFvWL1UGtv81jvPFFHcPxsC/vca3REvHTVjXz5sU0qlFwlrHzGJGTNmmAj
         YdnA==
X-Gm-Message-State: APuU4Z8HDnyjzbaucLLaMberOaJ3M6NK5UaVm0E8NUaUnLRTAQ/tITQK
	U5N7IGGuTOVUx0ccbEFlvGfj44CfsJA7eqXDJuN6oSRtdq3co+HGoCfyQL2ImsiV
X-Gm-Gg: AZFdTZdoUHgjOHcsBVuxf4HQmMH5kjFPmpfroWv+TAqK4FcSiUaPRUulEZyyltYxR9T
	SVbzs/c6/BoZV+p6p7JHKji9xoKRU/drCbwBdg1Fwdp+gxJLQgqSDQkUOsf8I7EoNnAAZlfB/8f
	C/QDdzeoZWnRmhBDXfoC5H84ms4dP3z8vMxRhcUvtwrBUPPTin4i0O40lpnpM8PBxyytXpy23dG
	uXkTIZLYvernuaISidvtr4a/kyyUlsl51SYXYtTJL/eYYlyYGV3imhvmS41gRYbzyjh6DjzNh/7
	kYXkFo5Q0Ql6UsrkaBr83Q8UY+SQBe5+jqJod5pv4JSzk/9lFEnNh5wJsGWAfzTnPtNQ/ffJZax
	Haq4f1ak5SgNM/X6et8KT4OmnnIa5petu1mu0sll3vPnY/cE95Qo2GBGkijjsOrsK0qqDsh/2Aq
	ieucOqCXn849fsY25ElMK7RJteBD4zs4CkxpwXM1fd0zFJg/dMZiK3AjbcN2gFCwk6aswz/J/Uu
	kIoGRa3/86XXquJDFcOHK7H9h8LpS358s8VsZbOIHd6pXmd974lftW+Os6KHNJ4OhSboy+6EaFV
	vrRfb+FqzhxQz/0xYsv6tBfpiNwbu7BLnk4bYiVsCNApM0LpNctrJVpvPmL6lg==
X-Received: by 2002:a05:600c:3508:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4bb88826921mr439344415e9.5.1795732179471;
        Thu, 26 Nov 2026 14:29:39 -0800 (PST)
From: =?UTF-8?q?Bala=20Andegue=20Fran=C3=A7ois=20Lionnel?= <balaandeguefrancoislionnel@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 1/3] docs/man: fix typos in xl.cfg.5
Date: Thu, 26 Nov 2026 23:29:16 +0100
Message-Id: <20261126222918.951621-2-balaandeguefrancoislionnel@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20261126222918.951621-1-balaandeguefrancoislionnel@gmail.com>
References: <20261126222918.951621-1-balaandeguefrancoislionnel@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1795732180-2551A2A1-9A923FE7/0/0
X-purgate-type: clean
X-purgate-size: 1410
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix the misspellings "passt hrough" -> "pass through" in the
description of dtdev=, and "thise mode" -> "this mode" in the
description of hdtype=ide.

While at it, also fix "operation systems" -> "operating systems" in
the same hdtype=ide sentence.

Found with codespell. No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Bala Andegue François Lionnel <balaandeguefrancoislionnel@gmail.com>
---
 docs/man/xl.cfg.5.pod.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index b19c25c8d128..f36288b907b9 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1330,7 +1330,7 @@ The default value is 2048.
 
 =item B<dtdev=[ "DTDEV_PATH", "DTDEV_PATH", ...]>
 
-Specifies the host device tree nodes to passt hrough to this guest. Each
+Specifies the host device tree nodes to pass through to this guest. Each
 DTDEV_PATH is an absolute path in the device tree.
 
 =item B<ioports=[ "IOPORT_RANGE", "IOPORT_RANGE", ...]>
@@ -1874,8 +1874,8 @@ Possible values are:
 
 =item B<ide>
 
-If thise mode is specified B<xl> adds an emulated IDE controller, which is
-suitable even for older operation systems.
+If this mode is specified B<xl> adds an emulated IDE controller, which is
+suitable even for older operating systems.
 
 =item B<ahci>
 
-- 
2.39.2


