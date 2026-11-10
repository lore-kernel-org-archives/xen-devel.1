Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11DD606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 04:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TtL+85E5
Received: from list by lists.xenproject.org with outflank-mailman.1480633.1684396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQdvr-0003sn-89; Tue, 10 Nov 2026 04:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480633.1684396; Tue, 10 Nov 2026 04:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQdvr-0003sf-52; Tue, 10 Nov 2026 04:58:07 +0000
Received: by outflank-mailman (input) for mailman id 1480633;
 Tue, 10 Nov 2026 04:58:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 1xQdvp-0003sZ-Du
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 04:58:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQdvo-00BQ09-Cc
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 05:58:04 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 6af2a408-8faa-0a2a0a5109dd-0a2a4501b79c-48
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 05:58:04 +0100
Received: from [209.85.128.178] (helo=mail-yw1-f178.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <balaandeguefrancoislionnel@gmail.com>)
 id 6af2a45b-5984-0a2a45010019-d15580b2e4d7-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 05:58:04 +0100
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-8b31261e8a9so12124607b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 20:58:04 -0800 (PST)
Received: from bala-Latitude-5580.. ([41.190.227.250])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b3933a06c0sm11585217b3.13.2026.11.09.20.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 20:58:02 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286683; x=1794891483; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SK/6LHmaequHmsxieO7lbFh/5uPaBdJlkU34obL4mhQ=;
        b=TtL+85E5xI7EyHbZE/naclu2yBOTfyElE4/xAfQrdZFmiLYoUAK3vNCYdzBgLr7wWx
         +ZlFpEF4hK0f/bvroY8oH0ZBU5E3vGJp+bAgxm8jDOLfXqJMwVhbix/RNn+B9JwTq1AU
         0cyCfaeGh+ulh4GrQb7nM60zxDWHDmHzGpDoyleu0KYebNDHK/PtyL5c07cqdDUrUMyI
         XSZW1v90lrJqkS9Sc1QchcelYMRp7E0XWD0icFrZFbj0R2/UXwlqMEkBbFLj5XL6c9T1
         DRlSz8T0TGqPapsTPKUKLoSrkVqNfX+ZvFDhD2mkGyMumUIly4u7XzchKO3l9QuHizSH
         mrjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286683; x=1794891483;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SK/6LHmaequHmsxieO7lbFh/5uPaBdJlkU34obL4mhQ=;
        b=iFJeAvW24oO3xTOQjU7voRkLu/LxRJsuuMu4PXRxiCefFYjLc7UXtwgh5MEbNd/5jC
         7VBJEZfC1JquZ6ie1yQ24qupbmy50TzaYoAOGgg8ryzSUOsOQ+0rPeQ5NI7H6nTMqsKE
         8Gi9FcNR4qAUFldm2pDf4vwuqnDUtypAVeKB94YHvOpQIp+4+Jc+P3jDLfMVhurxBze1
         0nrUzUSMEhY6tHxWU1prPDg6Ul05ZjKt4mw0npam7TG7K0aEHZ60kRWwcVBIXC5BKOlD
         Njk5ckyyYdgcc6E2ycjH/E3Opq6JCMYETkdtigvYY8Xra4XXIfE015anpkvSK+xfvlaO
         qfjw==
X-Gm-Message-State: APuU4Z8kq1U+SJzRqAu5EMoHWLWUbh3AtxkcNq/Oyqz2V0fMQ6Eg1b7p
	Wo1dKRlAWJfplcpSfB7NmIroKLBX/VwsnshNCU5dqiaPMcri164TFNWHjK3n/Q==
X-Gm-Gg: AYBFou1OJXpwjza0ahyjb4aWgXoqBP7dvyQE9wZYhp744zTeyfJBq358FOHmtPyhwXv
	xlsMmFLaYM+aFekVSLxj57zFMEV8Zqb0nxF0D8quPL+QhUECwgYXcJZaHyR5U0C5wjn4ePb2veC
	gCJH44whTaOUZdRzDZAXW/MHLT2y/azfGi3PwwuBlPbEer4mP9hps0K60VDn+/D3g+9sCv3K++c
	VA/VrVwlaYqe2Qz2tTyZ1DCn3Rq50u0Pwp2yrIM2gL7YZAqEcyRQLXz6yTPaaL2Ov1eRXQIStMg
	QdG+HIYyuuwjR0IbHogHp+UhM2csI5Inoh67YaqlQXuoCvO8kNrSPCkPY4vPwPUMmhuU0EQdxvJ
	O/j7LCA0xAmwIeBtMaahhHP00npd5/2298KsGQv+0Sqhb+15hpl2e8lKb0YKI2AG2eQ5iUoGfVv
	yFOmsZVHk6nYS1wu2YOm2GLMNfpm+4ljtA9Tos7iBryKIR8QMXnLl+bpwgQtkjhHEjH7yztpnyX
	n33eiXWPvUtPzauEPZuVUtRL0WMTG8hi3Svkii5MzQesIU3M0sdh4k+Q6kEspNjpJOQaHnS/cb7
	5eQ1PLuohZArYNLPOimcxAVqblM3rxOu/zVaxi1s+gSzBtzDAIh3MunE+2GQ+8U=
X-Received: by 2002:a05:690c:c4e6:b0:8b3:1390:fc1a with SMTP id 00721157ae682-8b39280fdd0mr11748127b3.2.1794286682823;
        Mon, 09 Nov 2026 20:58:02 -0800 (PST)
From: =?UTF-8?q?Bala=20Andegue=20Fran=C3=A7ois=20Lionnel?= <balaandeguefrancoislionnel@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH] docs/man: fix typo in xl.1
Date: Tue, 10 Nov 2026 05:57:30 +0100
Message-Id: <20261110045730.433737-1-balaandeguefrancoislionnel@gmail.com>
X-Mailer: git-send-email 2.39.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1794286684-1FC69757-F617DCBB/0/0
X-purgate-type: clean
X-purgate-size: 1477
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix the misspelling "coniguration" -> "configuration" in the
description of the -D option of both "xl migrate" and "xl save".

Found with codespell. No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Bala Andegue François Lionnel <balaandeguefrancoislionnel@gmail.com>
---
 docs/man/xl.1.pod.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index 51405f4e3341..8964811e8917 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -494,7 +494,7 @@ Leave the domain on the receive side paused after migration.
 
 =item B<-D>
 
-Preserve the B<domain-id> in the domain coniguration that is transferred
+Preserve the B<domain-id> in the domain configuration that is transferred
 such that it will be identical on the destination host, unless that
 configuration is overridden using the B<-C> option. Note that it is not
 possible to use this option for a 'localhost' migration.
@@ -707,7 +707,7 @@ Leave the domain paused after creating the snapshot.
 
 =item B<-D>
 
-Preserve the B<domain-id> in the domain coniguration that is embedded in
+Preserve the B<domain-id> in the domain configuration that is embedded in
 the state file such that it will be identical when the domain is restored,
 unless that configuration is overridden. (See the B<restore> operation
 above).

base-commit: a5c26d0e73d4cde7c4620ea43cbd82ba7b2af02e
-- 
2.39.2


