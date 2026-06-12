Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53224CD98CF
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2026 23:09:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1337050.1598704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0F-0001vw-5L; Fri, 12 Jun 2026 23:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337050.1598704; Fri, 12 Jun 2026 23:09:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0E-0001vp-Uk; Fri, 12 Jun 2026 23:09:30 +0000
Received: by outflank-mailman (input) for mailman id 1337050;
 Fri, 12 Jun 2026 23:09:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wYB0E-0001mf-0B
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 23:09:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYB0D-006h7V-DO
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 01:09:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c9156-2eae-0a2a0a5409dd-0a2a4506c6f0-36
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:29 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c91a9-7371-0a2a45060019-d155dd33cce0-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:29 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-45ef41adbc1so1129729f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:09:29 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0d28sm10035907f8f.20.2026.06.12.16.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 16:09:28 -0700 (PDT)
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
        d=citrix.com; s=google; t=1781305769; x=1781910569; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHgMJ5pAsBWt/gfP5CP2XcHY/YX5Ol4rY08M9vS2knc=;
        b=jVhGXagrp83OVG74s+7K30m92Pr1HcxAtjAdfssafop5ofZqgnsxwcB8Hks7fTzz5G
         hu1XWq1TT1SttM3lOy1Gt2QAxwIHf/gZt8MPS9c9yz1orsuGb0dZU3d6GiC4UBpkOpKn
         7YLFUxrJMEgaQaSeP1Ni7wgg8r/VATh23E1l4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781305769; x=1781910569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iHgMJ5pAsBWt/gfP5CP2XcHY/YX5Ol4rY08M9vS2knc=;
        b=S38jrfOxxM+BwyX7oKh5Ze+eptzj6KpS/Kqjqf9IH9kbyCq672g9J0NnvcfrIlcjmI
         iLj4CdKci17EKVeZ1RW7t188le0xowJi5fEvAwRzyijcy1lH10FJq/0Vo9OCLx/+X+mi
         TAKJuXcXfxkyF9u6tE1UTxlw6QdVPvHEqJErYfxM7MULg6bMDEH827l72xvA4LzQpd/E
         op0h8TTg8N7OHTcH9kPCbQKCGzUz6RWEh8QpwsWiLbeXGBAg2k2vDvTZ5UYcJPS1evvL
         hTCM3eu+qYoPYLGD7O1sdY0/eFX/WjyTTKggnMKWzuQCWsV69P+kL/iNPJ4HKv1Efh+m
         iFkw==
X-Gm-Message-State: AOJu0YwlQu56ep9tRQxYuQT8XFN/A91Cn08GA9//EfZS3dgC6KwIbz39
	UvqaeeELfqe9oRAVerRKWA+PWaITaxSPd8I315HdCU02ouRlZmS1BtEAxKmAZHzR3ebqQI3ZVsn
	Ir9Wv
X-Gm-Gg: Acq92OG33iIqUjhYVvaX/U0I/AMrB+6WALwRvXiT3IPEH/w61k7vyyHTf1eSKQPciY9
	7SkNrleNntEQqAfxUiuDBJPK26j30QcvsRU8EFmuExl1ngmZsgeIsU+hUMNnsyMnotiIjIhf1EU
	ptUch9mKz6YFtgbHgYMmpORWOA2jWjAOIdTS7WlTgO0nACc/GP+xicjjdwE0jsGnA2YOxvGgl0/
	UfetaZyFdfLH4IOdwWriva1TvKJkV9x0L/HLQ5wLxKymtvwIpVTVyC7zO1X2LxAkzg4UwMfYNth
	ezqP71IudL7UdfcD0nHbPDlE8INxYAsIv8fYiysCnXw+L3SGRppJLIvIKH+FxVZ2a68Hbxm+OZf
	YaR2rJc+XLa6kd76LCR8siabfnL03SAIXNgkRQnRsZVri061n/a5AhTOlu5nIOrsM9o5nyQGmTI
	s/Dn/p0O4DZEzabCyMac1tVp6ZGRZT2t30rrrDfNF04CDWQ5Htonkefsw2Jxl895pZCl5s82I9P
	vSb
X-Received: by 2002:a05:6000:4615:b0:45e:f381:cd8c with SMTP id ffacd0b85a97d-4607e90eab5mr1337429f8f.30.1781305768402;
        Fri, 12 Jun 2026 16:09:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/7] Config.mk: Update QEMU to include pip-25.2 bugfix
Date: Sat, 13 Jun 2026 00:09:19 +0100
Message-Id: <20260612230924.3181154-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
References: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1781305769-86369D75-3B12E332/10/73395122804
X-purgate-type: spam
X-purgate-size: 1690

Specifically:

  commit 6ad034e71232c2929ed546304c9d249312bb632f
  Author: Sv. Lockal <lockalsash@gmail.com>
  Date:   Mon Aug 11 20:01:59 2025

      mkvenv: Support pip 25.2

      Fix compilation with pip-25.2 due to missing distlib.version

      Bug: https://gitlab.com/qemu-project/qemu/-/issues/3062

which cherrypicks cleanly onto qemu-xen.git master

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

This needs putting into main qemu-xen.git first, and then the override of
QEMU_UPSTREAM_URL dropping.
---
 Config.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.mk b/Config.mk
index 86a4999246d1..11fb39154b73 100644
--- a/Config.mk
+++ b/Config.mk
@@ -213,8 +213,8 @@ endif
 OVMF_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/ovmf.git
 OVMF_UPSTREAM_REVISION ?= ba91d0292e593df8528b66f99c1b0b14fadc8e16
 
-QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/qemu-xen.git
-QEMU_UPSTREAM_REVISION ?= e064f42c80be6f6ff8c12dcb2a663bdf70f965f6
+QEMU_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/people/andrewcoop/qemu-xen.git
+QEMU_UPSTREAM_REVISION ?= 8ac4f8f52db8943ca389f6040d61d4d98a4c072c
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
 MINIOS_UPSTREAM_REVISION ?= b6f79f5f44cf69044079c042b88fe9d75367642e
-- 
2.39.5


