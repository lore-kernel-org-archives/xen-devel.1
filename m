Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10BED19502
	for <xen-devel@archiver.kernel.org>; Mon, 26 Jan 2026 17:54:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1213833.1524300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmi-0004qw-Hq; Mon, 26 Jan 2026 17:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213833.1524300; Mon, 26 Jan 2026 17:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmi-0004pK-8k; Mon, 26 Jan 2026 17:53:56 +0000
Received: by outflank-mailman (input) for mailman id 1213833;
 Mon, 26 Jan 2026 17:53:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQmh-0004HX-JX
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:53:55 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa3b9054-fadf-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 18:53:53 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4801c1ad878so53447625e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:53:53 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:53:51 -0800 (PST)
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
X-Inumbo-ID: fa3b9054-fadf-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450032; x=1770054832; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsIV3GSMS2OCjsSf5BdBf2D2nbqVVoqe/FAvijXoOlA=;
        b=Dimz2o6IP30qbChwn9FSVKkJRXwqn6l5pEezSjPIhlB0rsHPYWtsKC9ZQbDfxD2RKr
         kAlviDslBgwal05Fl+4aVoCnhQRJv6D55PVh/Rxt2cDA/flOO59Suu5fbLwHI1JpRi4O
         21U8llMdBZrWHBRI4ROphIbJhhHRUCquR+uFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450032; x=1770054832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wsIV3GSMS2OCjsSf5BdBf2D2nbqVVoqe/FAvijXoOlA=;
        b=FxsPntkiUvKBqE+/2fWKst5GJYbeItDhTEAhMJoYODmqcC6GqrcXv9DyJ5GQD34dFX
         lUTRf1tT47c6m+5sBRhA9s9zf/QbL47DBXm3KUOSQ7IrGDccyUEGj6YxQ4x0AzRw9++u
         V25ictWw6Xb1NV7lgDka5qhRhvz0VsUksCoduPLAh8UAz2arR1Epp+1IwdLYXETD9I12
         3acg1vTfS5TikGgH+jBfc0BnywRUIHpu9Lvu7Ohiu7tObn+2GPWLefzoNtknsf534EGC
         WQZoBxKe6q1FhHQGgvSaylZ75FXKLkbDqNcj+xM1WqCzAJ4d9hzUwiZR7hywEzSwmPOT
         KGeQ==
X-Gm-Message-State: AOJu0YwK0/QhksK3FHwy0KBX3l4FG8Avgtska0sKWNAEn7FFf4TEDejl
	iQZ62507S1XEeWOQdgdVnYLuL3m2Z5Xlmg/JfE8idhZ/dn9uWRbhiraWwKwH6F9OMsd74S5Zx+F
	olb5y
X-Gm-Gg: AZuq6aKr7K04PYbwrZJ9pnbunzAad3oWhlBZvathkl/wuxsh+AWOYku3mfnutgnwJyd
	Vp8CV59VQowAyYwdqy/HYz1uSdOwAj3Z75zG2M+u/AOpDiqIkTLZ0FvhJb5jE6oFnmD4Vbm/6qS
	10oPhqUuDzt0vGZle7lPAtTHmjAYG9bowYfFO/dtFsUkhQs+Z+ynJneS/UKzVEXL5VPlRXHL05L
	ELQ/kSI+EAAl3nrtI7m9SXaK8u+Dfsxdt4ExPxHSupFbZIpODh/fWtO9VWaRMkJM49TxDQf0nvn
	Ie5Au6Afvi+VBAJ4UfssD8ZAhKyrra5UvJahPhPidjBoEQfJyCG1XFYuCtOfaqGWqYA6mYe7gXX
	a5BYwZHS8+n5TNk3B3Inj8ZZZ1Sd0gwV1AWIcXeYz/Oh+93yYc+fboG77gggHkmk0pQEKaukkGp
	nItEj7xfTFdy2a/O4tkNsHCr8ia4z68il065UfSElP4TDcDl0fM7JnJnSkPTW7Pw==
X-Received: by 2002:a05:600c:b95:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-4805ce3fccamr78919025e9.4.1769450031770;
        Mon, 26 Jan 2026 09:53:51 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 04/16] x86/cpu: Fold generic_identify() into its single caller
Date: Mon, 26 Jan 2026 17:53:33 +0000
Message-Id: <20260126175345.2078371-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This makes the correctness of future changes more obvious.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpu/common.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index dda0d5d39c92..89b58e6182b9 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -455,10 +455,13 @@ void reset_cpuinfo(struct cpuinfo_x86 *c, bool keep_basic)
     CPU_DATA_INIT((*c));
 }
 
-static void generic_identify(struct cpuinfo_x86 *c)
+void identify_cpu(struct cpuinfo_x86 *c)
 {
 	uint64_t val;
 	u32 eax, ebx, ecx, edx, tmp;
+	int i;
+
+	reset_cpuinfo(c, false);
 
 	/* Get vendor name */
 	cpuid(0, &c->cpuid_level, &ebx, &ecx, &edx);
@@ -550,17 +553,6 @@ static void generic_identify(struct cpuinfo_x86 *c)
 		c->x86_capability[FEATURESET_m10Al] = val;
 		c->x86_capability[FEATURESET_m10Ah] = val >> 32;
 	}
-}
-
-/*
- * This does the hard work of actually picking apart the CPU stuff...
- */
-void identify_cpu(struct cpuinfo_x86 *c)
-{
-	int i;
-
-	reset_cpuinfo(c, false);
-	generic_identify(c);
 
 #ifdef NOISY_CAPS
 	printk(KERN_DEBUG "CPU: After vendor identify, caps:");
-- 
2.39.5


