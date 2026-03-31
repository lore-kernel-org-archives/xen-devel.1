Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98911FF60ED
	for <xen-devel@archiver.kernel.org>; Tue, 31 Mar 2026 08:41:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1268746.1557956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Uem-0005U7-Rb; Tue, 31 Mar 2026 08:41:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268746.1557956; Tue, 31 Mar 2026 08:41:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Uem-0005U0-P4; Tue, 31 Mar 2026 08:41:04 +0000
Received: by outflank-mailman (input) for mailman id 1268746;
 Tue, 31 Mar 2026 08:41:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1w7Uem-0005Tu-0E
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:41:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7Uel-00Fjih-1h
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:41:03 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69cb8890-e002-0a2a0a5209dd-0a2a450c9a10-24
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:41:02 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69cb889e-f93d-0a2a450c0019-d155802bec64-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:41:02 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-486507134e4so62287075e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 01:41:02 -0700 (PDT)
Received: from andrew-laptop.home ([2a01:cb15:80df:da00:ec5b:e128:36bf:56b1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e93cf2dsm17613825e9.11.2026.03.31.01.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 01:41:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1774946461; x=1775551261; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TS8VSazZTzGwbY386Zmn1pdmyaz5X0QAPZsATvifGeY=;
        b=l91yvC5g5T2op+ID4FklrOqhxiWKoYMZESyuJZLttzoeHMpdS2kcE5Uu4xuJ3HM9g8
         6KRgUQ5Lt79x3DouYKSVxLQeJcggATOyRmoW83cNV9kx78C44A4TwznXNZQlblGNEvYT
         0mURhq5tfYOTvXqm1G6HWY3tovbCyzc1MP1bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774946461; x=1775551261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TS8VSazZTzGwbY386Zmn1pdmyaz5X0QAPZsATvifGeY=;
        b=YKEaiBgMPldfQVnlsYs3ublizbCwHAINoVa0uhdFKNzaMW9WWRSg2KdIg0dEiHi7Cz
         sO5hjeqH1CfpxBum1O8auS2zSpevAJlk9bRHZdX9ltA20PR4xdsXdcIyvRWCMfZlI6oa
         q/foZBk/9yajJkPrUgDNPrecLUoB8OyzKsncpSKKGbmeXRKKy7pYJLoRULKiyQFuHbeW
         0EAqaoYsoNFROHDWCZ0WfYDJcdAcRSkFAXPYC/BAKPqcg0HoDwCXkaesTM7XBMWVrHmV
         IolIfe4QswV34A2DxvH4qV85whWTtxoWFFAZ9oRfVhe40922QQr9tqzK5fzEvmI2hU88
         2TNw==
X-Gm-Message-State: AOJu0Yyn16SdnN6TA71ZGV6wwAgB5yqjor4UOtjS8Vemb4nir6rXJ7JC
	0di5B+AO9hJ0n0ucUxqWgQsVjJEEiBs0PBkogod5miNmeWbQ9E9P+KbhvKaZ6ZKRbJdGnYUt3yt
	75ACV
X-Gm-Gg: ATEYQzzm6iD784JbFEXBSI7kx8c0KR4eEwEtiIjO90a9aMpTTWGbVD3Sp+rdWv/ofev
	ghIcz4hLCW6C2gUWL+LSpkyK3KOSeeHzJP9lGL8APk7lDVrIhko9jlXNrFKiGdXKQlWTdbtBaH4
	giEHop6NwsQPeBuPdPDZbWUNEOA3i4A3LQLuMvd7EdOXG7B7rg9aHYzdNRrUAMTp0+b6osa+MF6
	8QvTYqhZLaY/x74gY1FjUE7lZhLKJiiXUQsqK8n7klhgT2K09PTtPhzlAQzfAHuRoNgPD/6JsEX
	oKZKenWWCQKVbX9sOEnYWk3Vl4GPuZtQst4zhu5b89j3zimf/nBZvsSvml3r5AP8h3BV0+0kB07
	RQ19lXEIAvFRp2khOszESZqABHkAatgLDgVsgCeGBibCbPW46Bgi1+6aV7VV1O82b2zLEJWjg4w
	5mUSd0bJWPW4kfNb9XHYBlTVLFakMGUREIMbomn9FSd/R0
X-Received: by 2002:a05:600c:3d87:b0:486:5f71:5829 with SMTP id 5b1f17b1804b1-48727d5a307mr258017995e9.5.1774946460702;
        Tue, 31 Mar 2026 01:41:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] docs/hypercall-abi: Add a footnote about SYSCALL
Date: Tue, 31 Mar 2026 09:40:59 +0100
Message-Id: <20260331084059.20053-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774946462-F4EBB734-3AFC7084/0/0
X-purgate-type: clean
X-purgate-size: 1639

Given that we explicitly support guests making hypercalls without the
use of the hypercall page (for CFI and speculative safety reasons), note
explicitly that %rcx/%r11 need preserving/clobbering around SYSCALL.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I've avoided mentioning FRED seeing as Xen (now) maintains legacy
behaviour.
---
 docs/guest-guide/x86/hypercall-abi.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/guest-guide/x86/hypercall-abi.rst b/docs/guest-guide/x86/hypercall-abi.rst
index e52ed453bcab..ffcf9b1b6d84 100644
--- a/docs/guest-guide/x86/hypercall-abi.rst
+++ b/docs/guest-guide/x86/hypercall-abi.rst
@@ -62,7 +62,7 @@ between virtualisation mode and hardware vendor.
      - INT 0x82
 
    * - 64bit PV
-     - SYSCALL
+     - SYSCALL [#syscall]_
 
    * - Intel HVM
      - VMCALL
@@ -138,6 +138,10 @@ means.
    kernel, hypercalls issues from such a mode will be interpreted with the
    32bit ABI.  Such a setup is not expected in production scenarios.
 
+.. [#syscall] The ``SYSCALL`` instruction modifies ``%rcx`` and ``%r11``.
+   These registers want spilling or marking as clobbered if invoking the
+   hypercall without the use of the hypercall page.
+
 .. [#iret] ``HYPERCALL_iret`` is special.  It is only implemented for PV
    guests and takes all its parameters on the stack.  This stub should be
    ``jmp``'d to, rather than ``call``'d.  HVM guests have this stub
-- 
2.34.1


