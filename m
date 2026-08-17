Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4C5C5DF66
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 16:25:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393124.1632018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww08i-0003gM-4F; Mon, 17 Aug 2026 16:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393124.1632018; Mon, 17 Aug 2026 16:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww08i-0003gF-1K; Mon, 17 Aug 2026 16:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1393124;
 Mon, 17 Aug 2026 16:24:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1ww08g-0003g9-DB
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 16:24:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ww08f-006VoA-DG
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 18:24:41 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a833596-bab6-0a2a0a5309dd-0a2a45018ae6-34
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 18:24:41 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a8335c9-5984-0a2a45010019-d155dd2ded97-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 18:24:41 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so3684274f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 09:24:41 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a7c568sm5176015f8f.18.2026.08.17.09.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 09:24:39 -0700 (PDT)
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
        d=citrix.com; s=google; t=1786983881; x=1787588681; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jE5KjnNcwYC3J+TyGV7Y75JAuXasrwsc9h5J/vaOkf0=;
        b=Ii3/9G6z5ZrFnzHUpSJ1FQnfVRV8cGgHoFdTjmoZfQy805h7zGJpJweGtiY/SiTOFx
         Ls3Jo0g9FFKa2ZqttFW4LJs2b8+F9LDDIdt1U6wgJWOD/4BM9jbDmDpzrM+HSAgYdBKb
         T4utxmRdxsrMDC5y1ssc6kcLfFZMt2bT3wQys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786983881; x=1787588681;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jE5KjnNcwYC3J+TyGV7Y75JAuXasrwsc9h5J/vaOkf0=;
        b=UGKAl7a0rI/p5SpXjmkc4NaFD2mi4MTmTN1AUbMg+AcXQyk18qCO94GWOm6oojJX3B
         dspu+hQzL8zVxUsPDuAys2TapLhk0DayjxQrQ+ge7r9x2BTK5rgfjw+ljnmfCFQF6GaJ
         I3M08gKVG72E9u3Gg9k5T/b5snGK8lVWuMEIkWuLSPEhTcyOpYORTnzzB3Hk9ZVB8NK2
         v4WwN3AKjqiqVwLZUVA9T8bcpiVGHxhrbwwoZnSbaVvkl+OseJtyvsnLeb+abC0A4LxV
         Yea/Na7E6voCtOqE6t34lT2TH0kgueUWNELf3PxlrzKehYqTcOjA8QdUOpsmf6hCOCPX
         MkbQ==
X-Gm-Message-State: AOJu0Yy0DnVNvOSMRZX/JPpDcqLGK+/ARuRupfQtKSrgwjKXfq/NQoHa
	YcbXvpEriOO42nVVcE2UHsVL6nOsHDztTJSWJ9VZ+nh8aa41HgJiHL8O7hm3VOmW1NaxMdwG5Hc
	/I91ggWE=
X-Gm-Gg: AR+sD10LVLaCb/YGnAnE6IZHe+nfwWjVKtSSdhvKuDkZAtAKtq/yGxWHU4TwehE1FUq
	e88RcfZUrH2NdnB/+nCE/1wxAVZqusPw0U6MxEySIWzc6x0kzLpAiDE0xM0Fa8kokcfBi/c9EMh
	XfRSYBzHN8XFLAncdP4ToOPwmcIpsajGtFUBxpG+WmzsCUaip2XoxcqHjt9NPefAZL7d7b326S2
	41PY2SRjBsq9+sE2rHiSxvqv1dThzExB6RkeO7XwBYEyPrqQ7+u8Z138BcXf1KV6SC+oQWnjcLG
	R8f4NUGRRYsRAKHmQziKz0R7lpbi5CwLo19hSQRo3pQuJGjm2Cw6I28E1gSqcn4XmLAjtY5ltkz
	S8S1ghssKv0IjBbLmogJFP33runQUOBvrA59MZCCm+B7u+zHiUemYsvuwIy25HSl/HRUU6BNR5c
	tjsKRX7WbXf6DC9FwY78mA8tLIs9ojdQuhNRzuCF0HgEmq3aw9D/eQgdfD+ewEVSQCiR0yNWqBo
	r/bfb/K3sk2uwjTDN7X2iUpYL/cavgdxJRpgz8=
X-Received: by 2002:a05:6000:46cc:b0:47f:f3f9:ae37 with SMTP id ffacd0b85a97d-48160705704mr28763963f8f.7.1786983880510;
        Mon, 17 Aug 2026 09:24:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 2.5/5] x86/nmi: Remove logic for pre-64bit Pentium 4 CPUs
Date: Mon, 17 Aug 2026 17:24:32 +0100
Message-Id: <20260817162432.1833803-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260805124525.105457-3-andrew.cooper3@citrix.com>
References: <20260805124525.105457-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1786983881-C5540757-78FDC8B9/0/0
X-purgate-type: clean
X-purgate-size: 1264

Model 3 was the first 64bit-capable P4.  Xen won't be booting on anything
older, so remove the condition.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/nmi.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index b71bf4363586..d614641386c7 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -314,13 +314,9 @@ static void setup_p4_watchdog(void)
         clear_msr_range(0x3F1, 2);
     /* MSR 0x3F0 seems to have a default value of 0xFC00, but current
        docs doesn't fully define it, so leave it alone for now. */
-    if (boot_cpu_data.model >= 0x3) {
-        /* MSR_P4_IQ_ESCR0/1 (0x3ba/0x3bb) removed */
-        clear_msr_range(0x3A0, 26);
-        clear_msr_range(0x3BC, 3);
-    } else {
-        clear_msr_range(0x3A0, 31);
-    }
+    /* MSR_P4_IQ_ESCR0/1 (0x3ba/0x3bb) removed */
+    clear_msr_range(0x3A0, 26);
+    clear_msr_range(0x3BC, 3);
     clear_msr_range(0x3C0, 6);
     clear_msr_range(0x3C8, 6);
     clear_msr_range(0x3E0, 2);
-- 
2.39.5


