Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0196DCD98DA
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2026 23:09:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1337054.1598747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0J-00035P-HH; Fri, 12 Jun 2026 23:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337054.1598747; Fri, 12 Jun 2026 23:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0J-00035F-CO; Fri, 12 Jun 2026 23:09:35 +0000
Received: by outflank-mailman (input) for mailman id 1337054;
 Fri, 12 Jun 2026 23:09:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wYB0H-0002mH-Ni
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 23:09:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYB0H-00HIs8-4i
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 01:09:33 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c91a7-5cb7-0a2a0a5109dd-0a2a45098b92-4
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:33 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c91ac-2497-0a2a45090019-d155dd31d98c-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:33 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-45fd464d51fso833554f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:09:33 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0d28sm10035907f8f.20.2026.06.12.16.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 16:09:32 -0700 (PDT)
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
        d=citrix.com; s=google; t=1781305772; x=1781910572; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mc80mIuKgxZeSbtKq/Po/qNpxB8HPK61c4YM83MbXes=;
        b=VjLFMpBfqmD8FUFjju2iNN+pkMxOL/5I3PQILWqgrclVm6Dix/Vu5AxqIl5nbBDpy3
         /eCQjY5oySoHMPhD2dinIoXWAHIQ0ekcj6555BzmW/VhwEfM+xn0tsCTfwY0iwVbtSTp
         XWrLkcF9vC7iUtZrjRP/WSjyAr6JHOy2naO14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781305772; x=1781910572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mc80mIuKgxZeSbtKq/Po/qNpxB8HPK61c4YM83MbXes=;
        b=HiDsHGjf9HEzUsbvqA3nOwtJzHYfbFztHiPM70NEyWisnpV43j7Zm2Y+9q8n2TvOTM
         V+43mGnfuk0FHOfHUD2V8vFOZPjRQwXjqMZcFKJ3fiWnQl6WGg7s1t0/JSz+4eyiMJse
         tfKwSZdLy3VSDA355+KhHx7CwjXG5MXf2jWjmMuDVgOFceQcBe6DrBr694+j1TMqwe7v
         LiPGQ3uJ8aEGIlT/BIFICgpng+S/pn7I4b7FPruVn75TcCof8n+qS8wdwbIPQWJOKQHy
         YzULs8icf5irUFXrfOqBTaepetJz3mdH79peI0jfFgvLSpY3SK6aObdw5YV3mPTgCHbT
         +48A==
X-Gm-Message-State: AOJu0Yzp1Xg+Xz5iNvg/X+B1kvYW50lAGJomZdIZFo+/Q8BBdadYA/ln
	rNxhA1NWwhMleN/P/qGy5BCmgyYCficRtuaTS3VCxKqVH9ni5YGU9Mlhxym9YHBItyB/AMXg/9X
	gPmxv
X-Gm-Gg: Acq92OHLXIhfKhrYoZI084pYC9cPlUaPfekeNUNL1hHYciwEH+CumFbTOkOwz4nU+Ld
	WVQjI3XzhE5IdJ+Z0MZtlhMxpnpsN9gUsoa39ZhTWxW2+0hoHOsm4kq03kgx25MbHW7TBWUWjtV
	Rz58c3yHwCajXb61fkI7+nCT01xm+MNDHAwXUnyw7intvQhcqSrQoPys0xJ8qjtvQTRJrr4qrlD
	thLX3hVpnWcAlSMSKefe+PMDlvER/4Nc+Oi6o4UA1fN5ze+f601OJsEm7wCRWEOFAU6yBikbolW
	7rL8C4i7/LQ1NpQ6P+xmvlGzHAytIQgIp/wtseESAsfuAbffIxqo+8QfBm2Qc7oAyULqO8vnBPs
	317kfZxVa7DDXik7N0q2QeC+Ak1SV8YPIVezzHeKsK+2dZWMjFpvcgkhJktVwCDezSocer43DDs
	zuAdwcgItSkZUmutiDqqyefpPSND78NnKQRt3jKxAkUXibLProduxBw6hb30rxhhnShi0FhcC10
	2VO
X-Received: by 2002:a05:6000:4602:b0:460:edd:ca89 with SMTP id ffacd0b85a97d-460769303demr1212047f8f.26.1781305772429;
        Fri, 12 Jun 2026 16:09:32 -0700 (PDT)
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
Subject: [PATCH 7/7] CI: Remove x86 microcode from arm32 jobs
Date: Sat, 13 Jun 2026 00:09:24 +0100
Message-Id: <20260612230924.3181154-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
References: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1781305773-42B70A53-B74FE3B7/10/73395122804
X-purgate-type: spam
X-purgate-size: 1270

All build containers are non-root now.  Complete the todo by dropping the
workaround.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/gitlab-ci/test.yaml | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index fa3f776fc785..4d5831f9ffcf 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -14,12 +14,7 @@
     ref: $ARTIFACTS_BRANCH
 
 .arm32-test-needs: &arm32-test-needs
-  # Bodge to ensure binaries/ is non-root.  Can be any artefact which comes
-  # from a non-root container, and microcode-x86 is the smallest.  Remove when
-  # all build containers have become non-root.
-  - project: $ARTIFACTS_REPO
-    job: microcode-x86
-    ref: $ARTIFACTS_BRANCH
+  -
 
 .x86_64-test-needs: &x86_64-test-needs
   - project: $ARTIFACTS_REPO
-- 
2.39.5


