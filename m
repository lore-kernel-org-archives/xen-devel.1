Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0241C5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:39:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385440.1627890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7gM-00034P-8s; Thu, 06 Aug 2026 23:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385440.1627890; Thu, 06 Aug 2026 23:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7gM-00034I-5f; Thu, 06 Aug 2026 23:39:26 +0000
Received: by outflank-mailman (input) for mailman id 1385440;
 Thu, 06 Aug 2026 23:39:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3sRp1agYKCRYE0w95y2AA270.yA8J09-z0H0774EFE.J09BDA50yF.AD2@flex--seanjc.bounces.google.com>)
 id 1ws7gK-00033h-ED
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:39:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7gJ-009Hfj-RS
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:39:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3sRp1agYKCRYE0w95y2AA270.yA8J09-z0H0774EFE.J09BDA50yF.AD2@flex--seanjc.bounces.google.com>)
 id 6a751afa-e002-0a2a0a5209dd-0a2a4505b878-20
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:39:23 +0200
Received: from [209.85.216.72] (helo=mail-pj1-f72.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3sRp1agYKCRYE0w95y2AA270.yA8J09-z0H0774EFE.J09BDA50yF.AD2@flex--seanjc.bounces.google.com>)
 id 6a751ab2-4cb1-0a2a45050019-d155d848cc55-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:23 +0200
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-388b404eaa4so3501845a91.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059442; x=1786664242; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+in/CASVMXdQrSwySi/14FWqsmLN6M2d30MjdmJLYfo=;
        b=OtHCkTjQxkkxyfCvqdDCUZdlyaK+F0dFQbQ1rOYrnoNGnxNn5379nb/BfO9c20Rfz5
         4d6Qd47Ldu9xpsSFUAb6N+jE1UqU6r8WlI6tIYsqy6hiaC5KWKiRwRgcID6yBZaMxPxU
         PyeazyC4cvo4FMvnLTJCDGHieClID73xCQHFC1zQd/+Xk8tfRAzA43Fp+r51bycPwDmb
         pJ/gsNklohVYnpBmOr3x0JrNnZGONH/y5fGR73pizyP7WKyFW+uOOVgVXdwqzDiU6XF3
         6XjA3LiKI0pCvFUMqfMzUw/ZBSYiv02MGFwZRJopu+gxa+Ijdy4Mfi+m7dBmqAYkdcdH
         pYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059442; x=1786664242;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+in/CASVMXdQrSwySi/14FWqsmLN6M2d30MjdmJLYfo=;
        b=FCJVi7HTZcGj8sfFd9rynZy4XzqNH9RjOqCU6h0UjW5y25TmrIhPZH4jGSuxW4iJsl
         Wsw/ve0HQr8jipWAVzHSCSekXRd/ZFxmFX7Tz3zmsjwSxv01+DPz7j9fANXR2t5tWbyp
         Ntw3X+WCH50jExI8tODW1twA2HnWr7wvZgLQTiqo8Dr6+xqnj5W6T4wqRMRsKQaxliZ6
         l+KO5+QhnKciBxgBMx0mRm6FlzYOkA+WbodruRc8chRGaDVRY2rlYSDwXE7feJ41UjTx
         BmZ5laBZqMAzlzox0HI5TMGRjzqDhGbAXngHpsn+7EmPU4Pl2h0UUYeuFuAcNwEiITYQ
         tyWg==
X-Forwarded-Encrypted: i=1; AHgh+RpDGKKi6BYMkKksgsogcYhMVpvkHrF3dY9uEoJOzsxvqBl8mlvIN7GNla2svSZviN8UGFr9BrXNn/s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6trUhJps5x5wWXmQzQK3DcaNbleTjWVb+khprWAvrvRSPF5Es
	zYButhdL3TS8ZTKt+v8LxslhcIyyQXk2xE9waxitXYLW0fGyq3FAO32UksCuZl6f+0yQsYr7LSJ
	gdbfJjw==
X-Received: from pgii4.prod.google.com ([2002:a63:2204:0:b0:c8d:62a8:ee35])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7a9c:b0:3bf:983d:e9b4
 with SMTP id adf61e73a8af0-3cb8603af0dmr21846910637.33.1786059441366; Thu, 06
 Aug 2026 16:37:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:36:03 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-47-seanjc@google.com>
Subject: [PATCH v6 46/51] x86/paravirt: Plumb a return code into __paravirt_set_sched_clock()
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, David Woodhouse <dwmw2@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c201ff/1786059443-732B32A1-47A3F831/13/0
X-purgate-type: clean
X-purgate-size: 3365

Add a return code to __paravirt_set_sched_clock() so that the kernel can
reject attempts to use a PV sched_clock without breaking the caller.  E.g.
when running as a CoCo VM with a secure TSC, using a PV clock is generally
undesirable.

Note, kvmclock is the only PV clock that does anything "extra" beyond
simply registering itself as sched_clock, i.e. is the only caller that
needs to check the new return value.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 6 +++---
 arch/x86/kernel/kvmclock.c   | 9 ++++++---
 arch/x86/kernel/tsc.c        | 5 +++--
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index 96ae7feac47c..ca5c95d48c03 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -14,14 +14,14 @@ extern int no_timer_check;
 extern bool using_native_sched_clock(void);
 
 #ifdef CONFIG_PARAVIRT
-void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				       void (*save)(void), void (*restore)(void));
+int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				      void (*save)(void), void (*restore)(void));
 
 static __always_inline void paravirt_set_sched_clock(u64 (*func)(void),
 						     void (*save)(void),
 						     void (*restore)(void))
 {
-	__paravirt_set_sched_clock(func, true, save, restore);
+	(void)__paravirt_set_sched_clock(func, true, save, restore);
 }
 #endif
 
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 2cc3dd2ba355..22e8855fcd4d 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -332,10 +332,13 @@ static int kvmclock_setup_percpu(unsigned int cpu)
 
 static __init void kvm_sched_clock_init(bool stable)
 {
+	/* Ensure the offset is configured before making kvmclock visible! */
 	kvm_sched_clock_offset = kvm_clock_read();
-	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
-				   kvm_save_sched_clock_state,
-				   kvm_restore_sched_clock_state);
+
+	if (__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
+				       kvm_save_sched_clock_state,
+				       kvm_restore_sched_clock_state))
+		return;
 
 	/*
 	 * The BSP's clock is managed via dedicated sched_clock save/restore
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 363145c83919..fcf331ffd874 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -280,8 +280,8 @@ bool using_native_sched_clock(void)
 	return static_call_query(pv_sched_clock) == native_sched_clock;
 }
 
-void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				       void (*save)(void), void (*restore)(void))
+int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				      void (*save)(void), void (*restore)(void))
 {
 	if (!stable)
 		clear_sched_clock_stable();
@@ -289,6 +289,7 @@ void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 	static_call_update(pv_sched_clock, func);
 	x86_platform.save_sched_clock_state = save;
 	x86_platform.restore_sched_clock_state = restore;
+	return 0;
 }
 #else
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
-- 
2.55.0.679.g6767b8d81c-goog


