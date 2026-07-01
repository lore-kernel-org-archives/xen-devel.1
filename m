Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FACC43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:33:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350392.1607950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0g1-0003aJ-Pa; Wed, 01 Jul 2026 19:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350392.1607950; Wed, 01 Jul 2026 19:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0g1-0003XI-64; Wed, 01 Jul 2026 19:32:53 +0000
Received: by outflank-mailman (input) for mailman id 1350392;
 Wed, 01 Jul 2026 19:32:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3XmtFagYKCaMVHDQMFJRRJOH.FRPaHQ-GHYHOOLVWV.aHQSURMHFW.RUJ@flex--seanjc.bounces.google.com>)
 id 1wf0fy-0002yo-3Q
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:32:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0fx-00B3ua-G0
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:32:49 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3XmtFagYKCaMVHDQMFJRRJOH.FRPaHQ-GHYHOOLVWV.aHQSURMHFW.RUJ@flex--seanjc.bounces.google.com>)
 id 6a456b3e-5cb7-0a2a0a5109dd-0a2a4506aae4-46
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:49 +0200
Received: from [209.85.216.73] (helo=mail-pj1-f73.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3XmtFagYKCaMVHDQMFJRRJOH.FRPaHQ-GHYHOOLVWV.aHQSURMHFW.RUJ@flex--seanjc.bounces.google.com>)
 id 6a456b5f-08de-0a2a45060019-d155d849d0a8-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:49 +0200
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-37fa907f98eso892862a91.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:48 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934367; x=1783539167; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=wWnD58giubyrEvhTS3JtzvsAOScPFFHLvCt5ZIn12HI=;
        b=dqIfi1MVbD/oEqcqlx8SVvWcnzIDmsXWRrDyG9v8mwxKwRM92ZiVNdFjukCehYsQ/a
         s62fxqlt/VGzYgYl/4xuxwlz5H70MkpV0mJt85yc+pQw7wz2nAHar9nQf5+/wGD64J63
         rkDb5M+Ov06UYiyEZAn66QkQ6tu2UL6m4FX1XmjhAWSDPc0CUtFXpwo58G3MYNimCzWX
         4UxKrwDhRrpDB205bOt9Md1j/8RWQ3afhlAOfl4ftxu2swE/Ndq/0ei8ewjGZBUs5Bud
         4G8d7QLW3OpjXFlnrOgz4l95TzTSM0nu6RN9lWHPdOD32rJ+0Hzry6a44YuqojilP1er
         z7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934367; x=1783539167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWnD58giubyrEvhTS3JtzvsAOScPFFHLvCt5ZIn12HI=;
        b=XbfBoKTpQI2LMxKivbOdQFl2+oFlpfMKTIzHWjPEOUfwSNbVzTPNpV7v6S1vaPZLns
         aD0gGnaPaPTuxhgNtI5v0PunteU5aosetbKkoHfEbonMEX7pRBxjWDtx2VlRg4iWjFVc
         fb7e3ATCeFkYVD4O6w5FIteBuRhDGp555nMV3mTTGtlFfuvpp2Z6BzFfmGcG4DfBl2jL
         apmH8o2zmpefB8pCglHbAxistZ1rIUyGlV4xH06JKxQazjDYujsnhydRc967va0YT15C
         Xvu9XE0G4aKnbmfDhCf0nUAYcBQPjjGQIem3SCLgoLXAKsxB2v8QkO/ZWP4QcuvDEst6
         mTVg==
X-Forwarded-Encrypted: i=1; AHgh+Roq8xjtFhE4fEIxUERyrhmA4TbeLlyiIfEAzME6jwqwnt9qm8XMSkoIgRYG0yg4NnFT3p0wcPnTjAU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNm/9ZgZxOJ+Q3JmVTBcBtnWKuJxKZeTFtlLMSQKWPSkmbnWP8
	ReMY+YJ+QLchbptXocVAm5F/3+TjA8RuBTKnjFSCJmkG1YVsT6wy/sKcjwWfbfVU8YuR7Adc7XK
	6NajT4A==
X-Received: from pjbms18.prod.google.com ([2002:a17:90b:2352:b0:380:9651:afb9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7ce:b0:37d:8426:40de
 with SMTP id 98e67ed59e1d1-380aa0ad396mr2721883a91.1.1782934366877; Wed, 01
 Jul 2026 12:32:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:38 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-18-seanjc@google.com>
Subject: [PATCH v5 17/51] x86/tsc: Fold native_calibrate_cpu() into recalibrate_cpu_khz()
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-16d1c6/1782934369-43F2C68D-85239273/0/0
X-purgate-type: clean
X-purgate-size: 1497

Fold the guts of native_calibrate_cpu() into its sole remaining caller,
recalibrate_cpu_khz() to eliminate the extra SMP=n #ifdef, and so that it's
more obvious that directly invoking the early vs. late calibration routines
in determine_cpu_tsc_frequencies() is intentional.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 9764ac758081..6ed6f8f012eb 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -918,21 +918,6 @@ static unsigned long native_calibrate_cpu_early(void)
 	return fast_calibrate;
 }
 
-#ifndef CONFIG_SMP
-/**
- * native_calibrate_cpu - calibrate the cpu
- */
-static unsigned long native_calibrate_cpu(void)
-{
-	unsigned long tsc_freq = native_calibrate_cpu_early();
-
-	if (!tsc_freq)
-		tsc_freq = native_calibrate_cpu_late();
-
-	return tsc_freq;
-}
-#endif
-
 void recalibrate_cpu_khz(void)
 {
 #ifndef CONFIG_SMP
@@ -944,7 +929,9 @@ void recalibrate_cpu_khz(void)
 	if (WARN_ON_ONCE(cpu_feature_enabled(X86_FEATURE_TSC_KNOWN_FREQ)))
 		return;
 
-	cpu_khz = native_calibrate_cpu();
+	cpu_khz = native_calibrate_cpu_early();
+	if (!cpu_khz)
+		cpu_khz = native_calibrate_cpu_late();
 	tsc_khz = native_calibrate_tsc();
 	if (tsc_khz == 0)
 		tsc_khz = cpu_khz;
-- 
2.55.0.rc0.799.gd6f94ed593-goog


