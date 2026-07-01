Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0377EC43602
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:34:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350559.1608096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0hG-0003qx-Bs; Wed, 01 Jul 2026 19:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350559.1608096; Wed, 01 Jul 2026 19:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0hG-0003po-5l; Wed, 01 Jul 2026 19:34:10 +0000
Received: by outflank-mailman (input) for mailman id 1350559;
 Wed, 01 Jul 2026 19:34:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3cWtFagYKCbYoaWjfYckkcha.Ykitaj-Zarahheopo.tajlnkfaYp.knc@flex--seanjc.bounces.google.com>)
 id 1wf0hE-0003WA-GG
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:34:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0hD-00BqTu-TS
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:34:07 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3cWtFagYKCbYoaWjfYckkcha.Ykitaj-Zarahheopo.tajlnkfaYp.knc@flex--seanjc.bounces.google.com>)
 id 6a456b8d-bab6-0a2a0a5309dd-0a2a450b89ee-34
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:34:07 +0200
Received: from [209.85.214.201] (helo=mail-pl1-f201.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3cWtFagYKCbYoaWjfYckkcha.Ykitaj-Zarahheopo.tajlnkfaYp.knc@flex--seanjc.bounces.google.com>)
 id 6a456b72-ac48-0a2a450b0019-d155d6c9e4d6-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:33:07 +0200
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2c81c7421abso19964455ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:33:07 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934386; x=1783539186; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=E6ig/L0f6Bi8iYQ5fSK4jpuHUho56x4PQqpcZJJeUg4=;
        b=k6si1nXEP9jsax29d2Ai1DzSnZ1UEnEv9lA0DySdekTMnbxH3lXtKcN94ls48mbuwp
         dDT37+rzjj8M0AD4U7S08OPDZfkQ6YFjvd7WV4hmMy3Y+8JSFlVqFqJ6kjgq0ysdvWP0
         bjxZvCIDZC066TP7K//HtwE3eJXerHg24iFc+FJr4LZqAGncglB9OCYuzPHZ/VCHYlpE
         nkVMQOzEN/no9grl31LFMTLf8y+20LMJVWLWuTaJ8rppIL8iWg1VnP/SXh3WiclDUGaf
         eaXL9jA/uGJvMHJVx3aaoNtKL5DWdMWNwTMHOSG9hxddsqaA6tClbOTqh00FRuXqfxrZ
         H19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934386; x=1783539186;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6ig/L0f6Bi8iYQ5fSK4jpuHUho56x4PQqpcZJJeUg4=;
        b=ZKrnDZp9gV724NqNspv2N0UAwSZhL/sVDmpFBNnSANh+1dG39d/sHKtBsBQER7rkhH
         PZZ6OoA6RI6luS1qjflDa5GnwJ7j90ARY3eM3JsVmpBQzF9hO41Yl7y99A/QL4FhlSxD
         l4B+RCtkobOtEsuJJg8JfeASxZAsxIG/Gbutak8z1u1fVawVHhNo0CItuqDnUoBFtToM
         M4TZXSeM2jV9bYYqldYk40il4ssftnxI2UBBi6bq7yrHLj3ybheAE+CGTWj6dk8waxES
         o3FgNH1Xd5sz+kyLnetnEJfsPMUKEiGE3/qWpalUiejyGYW5VMdorixDdahj5T+pWMSL
         oW+A==
X-Forwarded-Encrypted: i=1; AHgh+RrquGFB+Q8e3cM9oVqB7+W4o1xIsNRRuO7KPEUEgP2ztQTS9+d8EXWZ7Lh2Lmes3tsf1aB6z+TRz5w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymyOF5vXAivBOmblT5dMuWvbUQwo4j+izQs4jVYxpUlHVvKvQn
	JNhpK/1UEpaWbRIBybkapQiEDwtQQWCm4bPuezKsGRADILwCCiZest5A83RibYCzwHvos2KvCDM
	1BIcTWg==
X-Received: from plbmt13.prod.google.com ([2002:a17:903:b0d:b0:2c6:b7bd:4804])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1acb:b0:2c9:c54a:7915
 with SMTP id d9443c01a7336-2ca91140306mr23508775ad.14.1782934385462; Wed, 01
 Jul 2026 12:33:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:52 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-32-seanjc@google.com>
Subject: [PATCH v5 31/51] x86/paravirt: Move handling of unstable PV clocks
 into paravirt_set_sched_clock()
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
X-purgate-ID: tlsNG-42698a/1782934387-A6B38220-66DF81F0/13/0
X-purgate-type: clean
X-purgate-size: 2573

Move the handling of unstable PV clocks, of which kvmclock is the only
example, into paravirt_set_sched_clock().  This will allow modifying
paravirt_set_sched_clock() to keep using the TSC for sched_clock in
certain scenarios without unintentionally marking the TSC-based clock as
unstable.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 7 ++++++-
 arch/x86/kernel/kvmclock.c   | 5 +----
 arch/x86/kernel/tsc.c        | 5 ++++-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index c71b466d6ace..fe41d40a9ae6 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -14,7 +14,12 @@ extern int no_timer_check;
 extern bool using_native_sched_clock(void);
 
 #ifdef CONFIG_PARAVIRT
-void paravirt_set_sched_clock(u64 (*func)(void));
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable);
+
+static inline void paravirt_set_sched_clock(u64 (*func)(void))
+{
+	__paravirt_set_sched_clock(func, true);
+}
 #endif
 
 /*
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index a3ec298d56d7..4bc0495f1f9e 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -12,7 +12,6 @@
 #include <linux/hardirq.h>
 #include <linux/cpuhotplug.h>
 #include <linux/sched.h>
-#include <linux/sched/clock.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/set_memory.h>
@@ -115,10 +114,8 @@ static noinstr u64 kvm_sched_clock_read(void)
 
 static inline void kvm_sched_clock_init(bool stable)
 {
-	if (!stable)
-		clear_sched_clock_stable();
 	kvm_sched_clock_offset = kvm_clock_read();
-	paravirt_set_sched_clock(kvm_sched_clock_read);
+	__paravirt_set_sched_clock(kvm_sched_clock_read, stable);
 
 	pr_info("kvm-clock: using sched offset of %llu cycles",
 		kvm_sched_clock_offset);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 375b0279df66..a762cb5cec0f 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -280,8 +280,11 @@ bool using_native_sched_clock(void)
 	return static_call_query(pv_sched_clock) == native_sched_clock;
 }
 
-void paravirt_set_sched_clock(u64 (*func)(void))
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable)
 {
+	if (!stable)
+		clear_sched_clock_stable();
+
 	static_call_update(pv_sched_clock, func);
 }
 #else
-- 
2.55.0.rc0.799.gd6f94ed593-goog


