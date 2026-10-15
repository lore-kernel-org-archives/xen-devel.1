Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D183CCA46A
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 21:05:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451120.1666319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHSdu-0001sU-0X; Thu, 15 Oct 2026 21:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451120.1666319; Thu, 15 Oct 2026 21:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHSdt-0001qj-OQ; Thu, 15 Oct 2026 21:05:37 +0000
Received: by outflank-mailman (input) for mailman id 1451120;
 Thu, 15 Oct 2026 21:05:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHSds-0001dc-Kj
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 21:05:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHSds-003e3Q-1l
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 23:05:36 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ad13fea-2eae-0a2a0a5409dd-0a2a450b9c44-28
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 23:05:36 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ad1401f-b7e8-0a2a450b0019-d155dd29c165-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 23:05:36 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48df4f540ebso707800f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 14:05:35 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f8bd9sm501163f8f.35.2026.10.15.14.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:05:35 -0700 (PDT)
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
        d=citrix.com; s=google; t=1792098335; x=1792703135; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TQRAOxA1ogjKOw3/7hZOaSEV5B0G11dKuvdmnA2zrg4=;
        b=mKk+bcT7omrbQwyrXm4u/BTSJ9EI6B3Rr1lCm+Ku7PsXd4zrYKJLfN+eSerbiq0Fh8
         diKDSoyP7ytmUMI9czZMYvBmqkRvdbBFX4FthEpOeBlHaOfrv6IxY7RQmPu92aCZO9vq
         tdbrWvaDlKgQD8ynY+HOT3XbyrMWhWy1IgHlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098335; x=1792703135;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQRAOxA1ogjKOw3/7hZOaSEV5B0G11dKuvdmnA2zrg4=;
        b=BRKdYCdr0TT4ki/V3NxNOs2tDu7vmuDs4C3m8qCPmVxpRPyg4ZfUhZv4ZOzKvSBcuz
         bV/UyR19NXtGilGlAH3sVUWX1fZTb314TtxTsjvfOJ+CXSsZPZ/uDWFCn7XJ13mFvq4Q
         t1UnWRCzBsw8KNGi5V0CKrq2kAtt7J08RRbQWJvYPYN7LqnLVMHa6gIjXjYXx3OgO1aY
         kIgN0Ft0aESPVrFRYkWC/RH8n/x8uncwA8VhMVOxRkHmX7KqbiWrK7jpZjXfuNZxjaqj
         eDOwTI4dbbGwtBlvmEaDrNr9kJbohq7lsN9TJDRRZEwMiyIetP8Z8VAGb5T3MkZOdGDO
         kXZg==
X-Gm-Message-State: AFq9FYLWpEOy1NPYdI2UMQfNxmJHUqGyoe2oxK1DLCs6cJ7pqUQ5BiiW
	zN4KurZyQ4ywzCiZP0QSawYBxugbqil5T9xL4r10LoHiuyUFa7J3FnxQl+K/4LkRZm3dHd59P+N
	kP1vBhuc=
X-Gm-Gg: AYBFou1Ux5iby+LPRl6Nd45wAzo1jk2EqL9RWoKTyrfA25PeNttP8U8O6FOR7LMChd9
	OSqjBqX+u/cie9eC/w5qIVzq1KimtatwKMWzP6vTcbTAerPcQMXkkZsRQB394RbZ+aU0+amJyLy
	IegznF9LSOa8jM3I4Yte4yUsjK6zoDTQURN1lTb+x+Ggdtmt+JpryYhWdQtmX+NQIXu5rQAlexN
	mJXfVZsAryetZ3c71kl1b7J9mc86LV2WZ/xbqOy6GxzUQaYTyIZ1zWy0M8S2sR0Odbc0+4aAR1H
	qxQiqk7YapSX072UrNerW1PnseGPwi5lEXaaaHq+z3Tq17IuQFKNMZZ3Fx+eJBujhWBFmbwGdT4
	yi2300OuAwZCQCGTiQ1//czL9X3ryI/2kBcMOZMYZFvZWchC6OvIc1+gwoV/hgGcVSZtrdkXbF9
	usd2rgKmNjDOXRG5nJF7bUjMA4F93bG3Jje4gx+8W341hhDFs9/9nE1WbWP4EOfKcvx4GbV3P4g
	lHYSzy0JccZhEvyfFCsuVCUJUh1Gins4xKynwlpZemyEf5N
X-Received: by 2002:a5d:5381:0:b0:488:8931:b1b2 with SMTP id ffacd0b85a97d-48dbacdbc17mr29360393f8f.28.1792098335271;
        Thu, 15 Oct 2026 14:05:35 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 3/5] x86/alternative: Walk all replacements during self tests
Date: Thu, 15 Oct 2026 22:05:28 +0100
Message-Id: <20261015210530.786604-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261015210530.786604-1-andrew.cooper3@citrix.com>
References: <20261015210530.786604-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1792098336-AB0DD9EA-AB6A1C02/10/78276251493
X-purgate-type: spam
X-purgate-size: 2976

When self tests are active, walk all alternative replacements with
x86_decode_lite().

This checks that we can decode all instructions, and also lets us check that
disp8's don't leave the replacement block as such a case will definitely
malfunction.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <JBeulich@suse.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

v2:
 * Rebase over API changes in patch 1
 * Use +%lu and drop casts
 * Swap to CONFIG_SELF_TESTS
---
 xen/arch/x86/alternative.c | 52 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index a4cadd9b0b79..6b5f9c94f6dd 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -16,6 +16,7 @@
 #include <asm/stubs.h>
 #include <asm/system.h>
 #include <asm/traps.h>
+#include <asm/x86_emulate.h>
 
 #define MAX_PATCH_LEN (255-1)
 
@@ -578,6 +579,57 @@ static void __init _alternative_instructions(unsigned int what)
 void __init alternative_instructions(void)
 {
     arch_init_ideal_nops();
+
+    /*
+     * Walk all replacement instructions with x86_decode_lite().  This checks
+     * both that we can decode all instructions within the replacement, and
+     * that any near branch with a disp8 stays within the alternative itself.
+     */
+    if ( IS_ENABLED(CONFIG_SELF_TESTS) )
+    {
+        struct alt_instr *a;
+
+        for ( a = __alt_instructions;
+              a < __alt_instructions_end; ++a )
+        {
+            void *repl = ALT_REPL_PTR(a);
+            void *ip = repl, *end = ip + a->repl_len;
+
+            if ( !a->repl_len )
+                continue;
+
+            for ( x86_decode_lite_t res; ip < end; ip += res.len )
+            {
+                const int8_t *d8;
+                const void *target;
+
+                res = x86_decode_lite(ip, end);
+
+                if ( res.len == 0 )
+                {
+                    printk("Alt for %ps [%*ph]\n",
+                           ALT_ORIG_PTR(a), a->repl_len, repl);
+                    panic("  Unable to decode instruction at +%lu in alternative\n",
+                          ip - repl);
+                }
+
+                if ( res.rel_sz != 1 )
+                    continue;
+
+                d8 = res.rel;
+                target = ip + res.len + *d8;
+
+                if ( target < repl || target > end )
+                {
+                    printk("Alt for %ps [%*ph]\n",
+                           ALT_ORIG_PTR(a), a->repl_len, repl);
+                    panic("  'JMP/Jcc disp8' at +%lu leaves alternative block\n",
+                          ip - repl);
+                }
+            }
+        }
+    }
+
     _alternative_instructions(ALT_INSNS);
 }
 
-- 
2.39.5


