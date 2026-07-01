Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1373C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:33:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350417.1607974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0g7-0004v2-PG; Wed, 01 Jul 2026 19:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350417.1607974; Wed, 01 Jul 2026 19:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0g7-0004rz-2f; Wed, 01 Jul 2026 19:32:59 +0000
Received: by outflank-mailman (input) for mailman id 1350417;
 Wed, 01 Jul 2026 19:32:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3ZWtFagYKCaocOKXTMQYYQVO.MYWhOX-NOfOVVScdc.hOXZbYTOMd.YbQ@flex--seanjc.bounces.google.com>)
 id 1wf0g4-0004MT-PW
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:32:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0g4-00B3ua-5r
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:32:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3ZWtFagYKCaocOKXTMQYYQVO.MYWhOX-NOfOVVScdc.hOXZbYTOMd.YbQ@flex--seanjc.bounces.google.com>)
 id 6a456b66-5cb7-0a2a0a5109dd-0a2a4506dc64-4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:56 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3ZWtFagYKCaocOKXTMQYYQVO.MYWhOX-NOfOVVScdc.hOXZbYTOMd.YbQ@flex--seanjc.bounces.google.com>)
 id 6a456b66-08de-0a2a45060019-d155d6cab971-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:55 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2c9960cf96cso12691805ad.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:55 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934374; x=1783539174; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=h0seWmgtqawiMKFH9SI3lPf42xnOLUsMbO7m+HkPiqQ=;
        b=eZKpDRRbIXRxpJ1l4xvUHXk2fBB3j8zllqvdZ/jRD61RfZ8tl8sEGy7SCOt/DwyYV+
         a/hwLYCZFj9Ng/rRT06g5L9Thot6ucxjIOoB0vTNT5Er6t9Z3JD7siPB3ejIBLlV78ME
         GhRgURfUt0ACNR5/xzfnFLjyvoe+dw1KrufNTHKBRjYMWmns/04M+vKL8svXtD1Djjq+
         dMPgSF0T1VbWCMuhvj6lSYq5zPydSbV9pGNzL4PdXw5wejNR8o/rLcxpzeA6ns5w/1xt
         nRbqdjurbJmsUZP6xBClp1xsd45J5jAds8ruJ6qwnjipZNb8X7QCsxT0Ms8oMIIqYXj8
         kufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934374; x=1783539174;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0seWmgtqawiMKFH9SI3lPf42xnOLUsMbO7m+HkPiqQ=;
        b=iPGvGeAqtsmJMBsEQ0GDqKZGV9ZdRO/jj9fCBIJsKMpipADU/tEKdIsQrwsiPmtyKx
         jhSF7DJDKFhKxizIbkF6ODwsbqLRto7mIvs0+yTLjWVkAI5UkifoahcSEYZJy694VAL/
         naE4dpSddnZDPkF+0KtMEwMFUFTpN4lgUONcE/Mf1MSUL/i7nKTkiPzkNGRwRT3Uxoe2
         rTJbbZxp8pFaFuZJSQ2wipUuacFftMyRvyCuG1xE1r4AOIpGwqrzVa8YhKn6LlOMfnFi
         chDumqGGnoTbi5vDPkU5hDhpzeBZfFllR5ljd3QS+3CWnIkV/N7NrLBqPANItwTnmp1R
         jS+w==
X-Forwarded-Encrypted: i=1; AHgh+RrdAN5/25dWIQTHYh69IKlgg22f6s6L+N3BT/V4oeAMDm47p21gHQl/7f+I3wVaoEICIPl/3/iUtH0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxbOlqNbCUsE2vPCgYvP5BHt2s0oiVzfAstMsxZ69x8rTlQ7CPR
	lygURhPxMyTTWAADje+KJrZ5ERmcf+hB3HwhrupEWs8BKfKJfl/qMT2HpjI2NUmh7bvYV/A7SUb
	v4YIdeQ==
X-Received: from plll3.prod.google.com ([2002:a17:902:d043:b0:2c7:ed23:f47c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4cd:b0:2c8:1f58:55dd
 with SMTP id d9443c01a7336-2ca7e710f10mr31641185ad.9.1782934373673; Wed, 01
 Jul 2026 12:32:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:43 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-23-seanjc@google.com>
Subject: [PATCH v5 22/51] x86/kvm: Mark TSC as reliable when it's constant and nonstop
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
X-purgate-ID: tlsNG-16d1c6/1782934376-F89E968D-6525BB46/0/0
X-purgate-type: clean
X-purgate-size: 3796

Mark the TSC as reliable if the hypervisor (KVM) has enumerated the TSC
as constant and nonstop.  Like most (all?) virtualization setups, any
secondary clocksource that's used as a watchdog is guaranteed to be less
reliable than a constant, nonstop TSC, as all clocksources the kernel uses
as a watchdog are all but guaranteed to be emulated when running as a KVM
guest.  I.e. any observed discrepancies between the TSC and watchdog will
be due to jitter in the watchdog.

This is especially true for KVM, as the watchdog clocksource is usually
emulated in host userspace, i.e. reading the clock incurs a roundtrip
cost of thousands of cycles.

Marking the TSC reliable addresses a flaw where the TSC will occasionally
be marked unstable if the host is under moderate/heavy load.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_para.h |  2 +-
 arch/x86/kernel/kvm.c           | 12 +++++++++++-
 arch/x86/kernel/kvmclock.c      | 14 +++++---------
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/kvm_para.h b/arch/x86/include/asm/kvm_para.h
index 4a47c16e2df8..4a49fc286b4c 100644
--- a/arch/x86/include/asm/kvm_para.h
+++ b/arch/x86/include/asm/kvm_para.h
@@ -118,7 +118,7 @@ static inline long kvm_sev_hypercall3(unsigned int nr, unsigned long p1,
 }
 
 #ifdef CONFIG_KVM_GUEST
-void kvmclock_init(void);
+void kvmclock_init(bool prefer_tsc);
 void kvmclock_disable(void);
 bool kvm_para_available(void);
 unsigned int kvm_arch_para_features(void);
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 909d3e5e5bcd..1cef54e1e7d9 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -978,6 +978,7 @@ static void __init kvm_init_platform(void)
 		.mask_hi = (BIT_ULL(boot_cpu_data.x86_phys_bits) - 1) >> 32,
 	};
 	u32 timing_info_leaf;
+	bool tsc_is_reliable;
 
 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
 	    kvm_para_has_feature(KVM_FEATURE_MIGRATION_CONTROL)) {
@@ -1040,7 +1041,16 @@ static void __init kvm_init_platform(void)
 		}
 	}
 
-	kvmclock_init();
+        /*
+         * If the TSC counts at a constant frequency across P/T states and in
+         * deep C-states, treat the TSC reliable, as guaranteed by KVM.
+         */
+	tsc_is_reliable = boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
+			  boot_cpu_has(X86_FEATURE_NONSTOP_TSC);
+	if (tsc_is_reliable)
+		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
+
+	kvmclock_init(tsc_is_reliable);
 	x86_platform.apic_post_init = kvm_apic_init;
 
 	/*
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index f55d0305d1f3..2e7ab54cb9dc 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -307,7 +307,7 @@ static int kvmclock_setup_percpu(unsigned int cpu)
 	return p ? 0 : -ENOMEM;
 }
 
-void __init kvmclock_init(void)
+void __init kvmclock_init(bool prefer_tsc)
 {
 	u8 flags;
 
@@ -356,15 +356,11 @@ void __init kvmclock_init(void)
 	kvm_get_preset_lpj();
 
 	/*
-	 * X86_FEATURE_NONSTOP_TSC is TSC runs at constant rate
-	 * with P/T states and does not stop in deep C-states.
-	 *
-	 * Invariant TSC exposed by host means kvmclock is not necessary:
-	 * can use TSC as clocksource.
-	 *
+	 * If TSC is preferred over kvmlock, drop kvmclock's rating so that TSC
+	 * is chosen as the clocksource (but still register kvmclock in case
+	 * the kernel doesn't want to use TSC for whatever reason).
 	 */
-	if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
-	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC))
+	if (prefer_tsc)
 		kvm_clock.rating = 299;
 
 	clocksource_register_hz(&kvm_clock, NSEC_PER_SEC);
-- 
2.55.0.rc0.799.gd6f94ed593-goog


