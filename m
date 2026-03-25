Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD595109C048
	for <xen-devel@archiver.kernel.org>; Wed, 25 Mar 2026 17:02:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1262814.1555182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5RcV-0000r6-4v; Wed, 25 Mar 2026 17:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262814.1555182; Wed, 25 Mar 2026 17:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5RcU-0000pw-WB; Wed, 25 Mar 2026 17:02:14 +0000
Received: by outflank-mailman (input) for mailman id 1262814;
 Wed, 25 Mar 2026 17:02:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1w5RcT-0000o9-Pt
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 17:02:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5RcT-00HVHT-5m
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 18:02:13 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c41509-2eae-0a2a0a5409dd-0a2a4501c680-34
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 18:02:13 +0100
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69c41514-6400-0a2a45010019-d155802fbd6e-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 18:02:12 +0100
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-486ff201041so710935e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 10:02:12 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487117077cbsm138217235e9.6.2026.03.25.10.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 10:02:11 -0700 (PDT)
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
        d=citrix.com; s=google; t=1774458132; x=1775062932; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmcFhx4OSAl5i+MrI+E6cImUT8FkRbryJfKmykppon0=;
        b=b99jg8PqqcZG/RfDEfgzRXhpzsYNcOZ6gblCeW1cSkAaK3Buf/+NjTybFijYABaux+
         f04/xsDPx0hrZLSWt7aJypgLMmyg3bA25RJI6XFIi9bjM9GueLF93+X09ddWmM33YHW6
         GK0B4UndT4exKNEehtwkL3SlRNtwWOK7RA79g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774458132; x=1775062932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LmcFhx4OSAl5i+MrI+E6cImUT8FkRbryJfKmykppon0=;
        b=jbUDp7TfzGGcs/OWrpuzpGXiSGM2qnyqUhnSNnRv26xBAYrXS2JLJzSOqRz1UKfszn
         5VhaW3+tA0OG/82EtMAKcFQn2kHQ2L6IJZsBYsXDmgzHlrDlimU2iUmBs7gsMKnnQFzD
         TqGmju/4pIy0aVmUAPxNnDptvyUpFehsu+DkeqElFU8sp67jhtnWUkHMKOJbBbgBEBJ3
         tMt36Gel815ZxN6MnjIw+kvjpk+OaqsS/+r2GDqYYB0FgZd+ngRdowo1OuOyWCqmd5Zf
         hxjbBCP0SCsO774FKxb8Kugj3Dqgf6W21PpWJpT3xa8Y/OxDGjL69LyS7Xmf//65kQno
         8FhA==
X-Gm-Message-State: AOJu0YwAmKSk5NwDLGwB6Olv5lLlIZkS/3/uIC6s7Y8lMrPWAfjXie4l
	4KB1dAAw6fo+Vb/pJJX1g89OrUXbRDTxUuJh5ciE42fSosSi5rgOLdIWU2Eh0e1/bL5DST8Rr5j
	Kl9/W
X-Gm-Gg: ATEYQzwpHNIKpTLSFqUV3I3xjJZ5uN/e1PgdxM1xrXSnXyCzrZiF+7vGnZcswXQXK1U
	alWbo20q2gDzUf3KrbM9wu0xmQH8QW3LwGjgfcpmZGsNO3GFZl3/cVF5c6Pud2gNo6K+3lHR1Q+
	rB1XP6lX76WUZkb+4wce1UVqD+4KL9iE8mQcYPiOHZ3YiOshJq1+4gSUybOhjoTEwPGlEp4xyyJ
	Zy6dzl47t/z4zY2hgdslpSTuJXJKaPzNuGFBLYuHQxTtSyjXpr78vuVbjk5icJ2yXPj+Lfrsa3h
	Iy6SK0bwNRhbkuUVsVmPqmzaJNlTf8gwQ/yy45QOGnId6bF41GDIZencWccgec4LEv/zmdlgFQI
	C64yaTjE7g8SoBJHWhdb5N64A1g1fcTEP+tKpSQwANOTmF45AjdXbZzyspjoRWYkua45z0noz3Y
	qi8RWXlYKpRCLCAiW7P+0sX5WOezB9d2SWSD9fAy8IJX5zNFK+mT8ci6nwtL4fMegOGRabWTkNg
	b6DEyBpT+ejg8M=
X-Received: by 2002:a05:600d:1c:b0:485:3fe6:2209 with SMTP id 5b1f17b1804b1-48715fd4de3mr53159555e9.11.1774458131958;
        Wed, 25 Mar 2026 10:02:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/2] x86/fred: Fix FRED name in comments
Date: Wed, 25 Mar 2026 17:02:07 +0000
Message-Id: <20260325170208.1115832-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260325170208.1115832-1-andrew.cooper3@citrix.com>
References: <20260325170208.1115832-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1774458133-22AE4DF3-EF2AF4A8/0/0
X-purgate-type: clean
X-purgate-size: 2004

The patch introducing these constants predate the feature being renamed.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/x86-defns.h        | 2 +-
 xen/include/public/arch-x86/cpufeatureset.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index edeb0b4ff95a..6dae36ef8134 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -82,7 +82,7 @@
 #define X86_CR4_PKE        0x00400000 /* enable PKE */
 #define X86_CR4_CET        0x00800000 /* Control-flow Enforcement Technology */
 #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
-#define X86_CR4_FRED       (_AC(1, ULL) << 32) /* Fast Return and Event Delivery */
+#define X86_CR4_FRED       (_AC(1, ULL) << 32) /* Flexible Return and Event Delivery */
 
 #define X86_CR8_VALID_MASK 0xf
 
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 9cd778586f10..3bc4f5cad666 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -310,7 +310,7 @@ XEN_CPUFEATURE(ARCH_PERF_MON, 10*32+8) /*   Architectural Perfmon */
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */
-XEN_CPUFEATURE(FRED,         10*32+17) /*   Fast Return and Event Delivery */
+XEN_CPUFEATURE(FRED,         10*32+17) /*   Flexible Return and Event Delivery */
 XEN_CPUFEATURE(LKGS,         10*32+18) /*   Load Kernel GS instruction */
 XEN_CPUFEATURE(WRMSRNS,      10*32+19) /*S  WRMSR Non-Serialising */
 XEN_CPUFEATURE(NMI_SRC,      10*32+20) /*   NMI-Source Reporting */
-- 
2.39.5


