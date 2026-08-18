Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D69DC5DF7E
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 13:07:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394156.1632991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwJXc-0002Sa-3K; Tue, 18 Aug 2026 13:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394156.1632991; Tue, 18 Aug 2026 13:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwJXb-0002ST-WD; Tue, 18 Aug 2026 13:07:44 +0000
Received: by outflank-mailman (input) for mailman id 1394156;
 Tue, 18 Aug 2026 13:07:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wwJXa-0002SL-1m
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 13:07:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwJXZ-00H1ud-El
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 15:07:41 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a845913-bab6-0a2a0a5309dd-0a2a450298c4-16
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 15:07:41 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a84591d-6ca4-0a2a45020019-d155dd2df147-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 15:07:41 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47f7872abb6so2604507f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 06:07:41 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482aa084a64sm6663200f8f.17.2026.08.18.06.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 06:07:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1787058461; x=1787663261; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XWB74GLQjah/HiO+IV8IQxonLXtBV9EkrjdxoXyQbgc=;
        b=TUur1ftU7U8ffrZnky49+/gwBHcO6U9EuZEkVYjtx3Izd1Nho7OYs9dZrR12R6tMtO
         jkEJo3/Q3X6t6+eFGf4vdQu+GZgD4ouXiu2vQOOanTFqkssrdfM7RVThmbeLfcfPpMYx
         +gSTNdHkLdRFpusiTrZ9NQhhc7AprJ3lek9Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058461; x=1787663261;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XWB74GLQjah/HiO+IV8IQxonLXtBV9EkrjdxoXyQbgc=;
        b=Ci2jhOvqjxQZKJdUD5afUkuZvtXvws0zJhT66fJ6v4s3cYUJcH4ZrdsgueW7FxN2Ee
         6nyDzrmNHGfVw4rR3c/JLrFZU9V39FXeAehnHfFpf4hgRJQpbl60g+RumWrcUGMYHRVV
         7SjNVgEa9FMjZG8w5hqvMtaC5FG7WRFUyUq/txP3OAYTyQUC9jD2rB7oFKzWNk6W/2Oh
         KldrQdASeKgnb5aGnuwdsM0z4yuQFwYsFolXOhQUqkRlNLCilR1RewvEY2z+QrSYlF3Y
         2h2CXJ2i+368pcHH1e69kyIPRVNPKfQflkr7n0BwtexEFvShiXnAdWm8jsRzsZJZulVa
         vJTw==
X-Gm-Message-State: AOJu0YwmagaYNv/veKAdyVWHLPJ6K/ZYpSHjVMLEtaC2PTxoZooIQIEc
	uIblXW189qzQeZdjltnpe39JeIl3pBMIOQw6AuJwosbiDX/FKjwGcxixwjH373vd7BynC5BxODm
	MG3kOIIg=
X-Gm-Gg: AR+sD11ffmiXIwuRYY5fj6gC03WtGSLP/50JiBzQscKyTnf2/4B77QQxqlr/buDJrha
	xCo/RSblusFnWbEJ9n+l5XOplMGr53bSNTjSsvCX0el6vLPWBWE6fheY016/T3HpUEgUlgEGgoB
	RyQX+ZVTIg1Ev3avdmlQ3efxKSoN4txNTHnGxEQ3xIu31v3t0yDgtskExDXQbYOHzO6Mfx1Dc09
	Z5QTzzimBnM8CG7bw0HX+qpHjlSZTGJE9EuD7LCwrDxGr80Wrp0+c/00Zj9jS9Uh05BiTHertLO
	zSk5oNiSzqLqvVVlS7DMlSf4G2JvEl/ggok0Xh0T+cjVjvViSNi9Sm18GQLAPC84bADamAFmRKp
	ibUb77dowZWmSXfLKPn5JP3dFC07OARkUhyj1idrdlVx9jf+sCCZZ8yywdHfYVtp1kTR3jP2EGz
	tK7bt/wxyJ6BP6wJzyjITkizG1YsV3sFnToS6EYZFRB8jLd2JUfEVZqKWunA+a0teKwT104jtoB
	eM4Mf6ObKnSun4x/dAuGBZAEaeuwM/5xZ/I/+0=
X-Received: by 2002:a05:6000:29cc:b0:47f:773f:2d68 with SMTP id ffacd0b85a97d-48160738c19mr41645267f8f.16.1787058460644;
        Tue, 18 Aug 2026 06:07:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/ucode: Remove MICROCODE_UPDATE_TIMEOUT and associated panic()
Date: Tue, 18 Aug 2026 14:07:38 +0100
Message-Id: <20260818130738.1911850-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787058461-67ABD2AC-8B0246B9/0/0
X-purgate-type: clean
X-purgate-size: 2541

Panicing in the case of a timeout turns out to be about the worst possible
action Xen can take.  It leaves all other APs waiting on the condition
variable, some in NMI context.  As a result, they fail to be shot down and
dump state for kexec crash analysis.

Microcode Loading on Granite Rapids takes about 4.5s of wallclock time, far in
excess of the of the arbitrary 1s Xen allows.  This time is spent in the WRMSR
to load the blob, and there's nothing the system can do but to sit and wait.
Despite the delay, the system as a whole does survive.

Microcode loading occures through admin operation only, so get rid of the
timeout completely.  It does nothing but make a bad sitaution worse.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpu/microcode/core.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 9b8d1e09cb98..12edd52fee87 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -52,12 +52,6 @@
  */
 #define MICROCODE_CALLIN_TIMEOUT_US 30000
 
-/*
- * Timeout for each thread to complete update is set to 1s. It is a
- * conservative choice considering all possible interference.
- */
-#define MICROCODE_UPDATE_TIMEOUT_US 1000000
-
 static bool __initdata __maybe_unused ucode_mod_forced;
 static unsigned int nr_cores;
 
@@ -422,17 +416,7 @@ static int control_thread_fn(const struct microcode_patch *patch,
     /* Wait for primary threads finishing update */
     while ( (done = atomic_read(&cpu_out)) != nr_cores )
     {
-        /*
-         * During each timeout interval, at least a CPU is expected to
-         * finish its update. Otherwise, something goes wrong.
-         *
-         * Note that RDTSC (in wait_for_condition()) is safe for threads to
-         * execute while waiting for completion of loading an update.
-         */
-        if ( wait_for_condition(wait_cpu_callout, (done + 1),
-                                MICROCODE_UPDATE_TIMEOUT_US) )
-            panic("Timeout when finished updating microcode (finished %u/%u)\n",
-                  done, nr_cores);
+        cpu_relax();
 
         /* Print warning message once if long time is spent here */
         if ( tick && rdtsc_ordered() - tick >= cpu_khz * 1000 )
-- 
2.39.5


