Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C47606AAE1
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 16:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=o0exFcdZ
Received: from list by lists.xenproject.org with outflank-mailman.1454547.1668103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIpmQ-0004zU-DI; Mon, 19 Oct 2026 16:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454547.1668103; Mon, 19 Oct 2026 16:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIpmQ-0004z1-AU; Mon, 19 Oct 2026 16:00:06 +0000
Received: by outflank-mailman (input) for mailman id 1454547;
 Mon, 19 Oct 2026 16:00:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xIpmO-0004YH-C4
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 16:00:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIpmN-0024ZI-Dd
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 18:00:03 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ad63e68-8faa-0a2a0a5109dd-0a2a450190a6-44
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 18:00:03 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ad63e83-5984-0a2a45010019-d155802fece8-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 18:00:03 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4a1cef0439aso25018485e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 09:00:03 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4e28bcsm24218617f8f.23.2026.10.19.09.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 09:00:01 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1792425603; x=1793030403; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXku0uSS7cetVaB1RhHYmZ4LzWZiZ0jJSJfMyr9JCAQ=;
        b=o0exFcdZDl889rR3yyiY+YHUvmt9oIgWbp3PRkXS5jmKwZ2xepLX3fpLgq5UpZ+ANv
         4JywiOu0A5DGZcH9WzGsyUddrBpbU63bKvF8T277rziBNhYESAJgxqe3pU42CzC0qkmE
         mkxSMaTbLuxuOQsYVZo2QXhip3eZM7W/rv5aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792425603; x=1793030403;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rXku0uSS7cetVaB1RhHYmZ4LzWZiZ0jJSJfMyr9JCAQ=;
        b=xYrBUTa3LjQYYbG82kMtm4u9B9oYfq4F9M2kXunuvst3WkVAwBOYfBNP60QdFkB/3X
         8J7/qBJ7a5GI3kmafhCe9JGPLtcDdxzIzdCkx0AAMpz6AwSfMCOtdN5BIiOgDywELev0
         wXVgt96mKYgMAnV6q6cRkA5OdPHxY1PfJvh42W9hpliemYTCsFJIjiwMVKEkb5iVXnnu
         hPqHe7LHkpX4YrsSfCQdOf9qZLyi1XiHOEZVm2YbbD/PH9lus/VGi/uJ9ZWgOVX/gz9q
         FSX0fKI5JxlSOxhTeOT2an8j5lBKf9AwBvC0MI4JwYmqJP4MVkEcf2Yq69gB1vZ6DlNL
         UgNw==
X-Gm-Message-State: AFq9FYJ1CwQtByMV5CFHam/fJshO+l4pK165wjEMd4YCXmZ4C3Xv/xm1
	UuoshjijEXXjUQHb+lx5/UmLcw5Zc4/MfWjUvlHx1J8GIS/EbSbSbE0a8Do21rAYyzLaC7VFqlI
	u3qsb
X-Gm-Gg: AYBFou2JvlLpM+Ervhj8OXuyMxlfJxs2b/5Ux1ADDenXZr2XxusBofqQUyiWLpVQ9ZM
	J5bSTsCwpS5TQlMV/+95VqyTWA9rqMUswC7WmQQe7xv00bCVmLh/ICwI0oTFFm4e5n5TnP4z+S4
	+TO4naptRkS5L05nSn5Rv/8aSi5r7X96lzGQ7Z/hJGo6uKIfE351Hv/QdYELXpU8tbzYOxt7cJs
	Sy0OJWcYLlJRwiBCeCa9jEyATUdvYZZcfhfBE6Meq5lbtUNLeUx015Z07jFMR4Cs9YkYaJA2iTt
	jpTOaIwENodAZ6ca14VCit8nVLuZGZUlj34HOdrtpK/IeX/SJNHVrxsvSsv2f+D/7zgU/dl8h5A
	U9RpfXVNuuUUOSg7c4w36ziaxgdVNzK1LYVwYZSlij2QCwThfwCS5ngY4LKN/5d4p5vu53hssOC
	qPHFrGwgx5HFh1qxV6X4UnPi1OIGmNoiofB5wuOhbftLABbmhg2GsdopF6TiXGO1xsh1XBmN/Cb
	hvaVWxPmFF+5hnNNZss4q5jN79BSeiGU5IYis6qrn224bzJ
X-Received: by 2002:a05:600c:3b13:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a1d75ad08amr206887475e9.4.1792425602167;
        Mon, 19 Oct 2026 09:00:02 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/shstk: Fix possible crash while enabling Shadow Stacks
Date: Mon, 19 Oct 2026 16:59:59 +0100
Message-Id: <20261019155959.883789-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1792425603-1FC69757-A7A6712D/10/78276251493
X-purgate-type: spam
X-purgate-size: 3785
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Between writing MSR_S_CET.SHSTK_EN and establishing SSP using RSTORSSP or
SETSSBSY, there must not be any CALL or RET instructions.

Building Xen with -fno-early-inlining causes wrmsr() to become out-of-line,
and thus suffers #DF during boot.

Make the MSR and shstk helpers always_inline.  They ought to have been this
way all along.

Reported-by: Roger Pau Monné <roger@xenproject.org>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

No change in the compiled binary at -O2, except for the line numbers embedded
into *_param() names.

With -fno-early-inlining, the resulting delta is:
  add/remove: 8/9 grow/shrink: 13/50 up/down: 360/-736 (-376)
---
 xen/arch/x86/include/asm/msr.h   | 8 ++++----
 xen/arch/x86/include/asm/shstk.h | 4 ++--
 xen/arch/x86/setup.c             | 5 +++++
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 1377d156f4e1..d5cec5509faa 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -47,7 +47,7 @@ static always_inline uint64_t rdmsr(unsigned int msr)
        val = a__ | ((u64)b__<<32); \
 } while(0)
 
-static inline void wrmsr(unsigned int msr, uint64_t val)
+static always_inline void wrmsr(unsigned int msr, uint64_t val)
 {
     uint32_t lo = val, hi = val >> 32;
 
@@ -56,7 +56,7 @@ static inline void wrmsr(unsigned int msr, uint64_t val)
 #define wrmsrl(msr, val) wrmsr(msr, val)
 
 /* Non-serialising WRMSR, when available.  Falls back to a serialising WRMSR. */
-static inline void wrmsrns(uint32_t msr, uint64_t val)
+static always_inline void wrmsrns(uint32_t msr, uint64_t val)
 {
     uint32_t lo = val, hi = val >> 32;
 
@@ -72,7 +72,7 @@ static inline void wrmsrns(uint32_t msr, uint64_t val)
 }
 
 /* rdmsr with exception handling */
-static inline int rdmsr_safe(unsigned int msr, uint64_t *val)
+static always_inline int rdmsr_safe(unsigned int msr, uint64_t *val)
 {
     uint64_t lo, hi;
 
@@ -113,7 +113,7 @@ static inline int rdmsr_safe(unsigned int msr, uint64_t *val)
 }
 
 /* wrmsr with exception handling */
-static inline int wrmsr_safe(unsigned int msr, uint64_t val)
+static always_inline int wrmsr_safe(unsigned int msr, uint64_t val)
 {
     uint32_t lo = val, hi = val >> 32;
 
diff --git a/xen/arch/x86/include/asm/shstk.h b/xen/arch/x86/include/asm/shstk.h
index 9160fe9f0e99..22bbbb2faf37 100644
--- a/xen/arch/x86/include/asm/shstk.h
+++ b/xen/arch/x86/include/asm/shstk.h
@@ -15,7 +15,7 @@
  */
 #define SSP_NO_SHSTK 1
 
-static inline unsigned long rdssp(void)
+static always_inline unsigned long rdssp(void)
 {
     unsigned long ssp;
 
@@ -24,7 +24,7 @@ static inline unsigned long rdssp(void)
     return ssp;
 }
 
-static inline void wrss(unsigned long val, unsigned long *ptr)
+static always_inline void wrss(unsigned long val, unsigned long *ptr)
 {
     asm ( "wrssq %[val], %[ptr]"
           : [ptr] "=m" (*ptr)
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index fef3c2dd4423..446cd8127693 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -915,6 +915,11 @@ static void __init noreturn reinit_bsp_stack(void)
          */
         local_irq_disable();
 
+        /*
+         * There must be no CALL or RET instructions between writing
+         * MSR_S_CET.SHSTK_EN and establishing SSP with RSTORSSP or SETSSBSY
+         * below.  All helpers must be forced inline.
+         */
         wrmsrl(MSR_S_CET, xen_msr_s_cet_value());
 
         /*

base-commit: 7e020a4dd6ed30eb6c91a9abe2767034e2bb270a
-- 
2.39.5


