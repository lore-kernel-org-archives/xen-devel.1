Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762A1C5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:41:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385487.1627953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7i5-0007LH-4U; Thu, 06 Aug 2026 23:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385487.1627953; Thu, 06 Aug 2026 23:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7i5-0007L6-1L; Thu, 06 Aug 2026 23:41:13 +0000
Received: by outflank-mailman (input) for mailman id 1385487;
 Thu, 06 Aug 2026 23:41:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3pRp1agYKCQo2okxtmqyyqvo.myw7ox-no5ovvs232.7oxz1ytom3.y1q@flex--seanjc.bounces.google.com>)
 id 1ws7i4-0007KV-Cv
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:41:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7i3-008OCw-Q5
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:41:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3pRp1agYKCQo2okxtmqyyqvo.myw7ox-no5ovvs232.7oxz1ytom3.y1q@flex--seanjc.bounces.google.com>)
 id 6a751b54-2eae-0a2a0a5409dd-0a2a4501e234-30
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:41:11 +0200
Received: from [209.85.214.198] (helo=mail-pl1-f198.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3pRp1agYKCQo2okxtmqyyqvo.myw7ox-no5ovvs232.7oxz1ytom3.y1q@flex--seanjc.bounces.google.com>)
 id 6a751aa6-5984-0a2a45010019-d155d6c6ad1b-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:11 +0200
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2cc5faecf01so51050895ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:10 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059429; x=1786664229; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bZd2/vTLw6kP6aan4oVP2ByAHPA3GmOMxUTn1c9gmLc=;
        b=JwPsMS2qePbuLpzxHWVdn8VaL8zbSDsTDuvkoD7xlWQyw13kHqKVLpdhbptw+HsRYY
         m1Ey/HsdQMsonzyBppLMgyXePpjjFsCgK9d2Pa4NbM0dMJL6r1436kNF733cLrg9qvR7
         JgZ1NQo3B2QJ/WlgyKA9Y9/ICIeW6NKRoprz5+TyP8OfNeDknekzFFmLfBlkQO+mGl0m
         MLOmpd44lko0zLcNwQCFHfgxnmUCxgK9GF6+z0pGakvEwGwakTLKd3uyzjCM6U/+GDma
         R0oh6Zw1n6Sy3vuNOgMZu1VxKy6YUw6cSx2riEkyqQ9uhAafzzDjikM72hTQ/383dftp
         80Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059429; x=1786664229;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bZd2/vTLw6kP6aan4oVP2ByAHPA3GmOMxUTn1c9gmLc=;
        b=rphPptBVjmGjeewxawFUOm8qxfUwfVfTy+XybJxyJVvspABKLK9vKl/cUCal8V6Fws
         7cnMos9eO1jPIY+ovskMT4yx2qUZ0aRwkDu8v6xC7rZWacfGipppvzWNjDgKvdLOX6W/
         3xOckocujP/s4sJlzd6MKZm7Fbdc4pbvamlNC2vW1vvoyxLDe5ZbrfskCBSRwHq7dNR1
         viEzAIjv5TO/BIDH/YRg04LTzSmoG/EyaXkwjGMZ/lDp08EsaeyItOfF25gcjSFc18lA
         sFdMbODhO+L/ErSqBk73u3dNdN3Gbcd0gLs7zF5vfuC7zcAnJZ8BPk3WoUhQN/pWCN5h
         qVgw==
X-Forwarded-Encrypted: i=1; AHgh+RogyYbq65Q3wW7SPjjNTMkdhR4zV8OrTeJ9x0X+MFliyp5vQIpluUxXkiIbvUelk/nfMEZleQn+iJ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxurvRWL+YNBynMez2zFmofEdNqjXkg0xv3g9Z0e5gKCP4SYfyO
	ElTBJJJg3uPOGLoO68z0FL8F6CFrR1nLe7nBEFUejm8pGUQs3utsuaxt/32OKRll3nEXv9WVdp5
	UYGWUEA==
X-Received: from pjtz20.prod.google.com ([2002:a17:90a:cb14:b0:36b:7f07:6fcd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c84:b0:38f:1e1a:515e
 with SMTP id 98e67ed59e1d1-3903c5b1688mr16494071a91.14.1786059429092; Thu, 06
 Aug 2026 16:37:09 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:53 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-37-seanjc@google.com>
Subject: [PATCH v6 36/51] x86/paravirt: Pass sched_clock save/restore helpers
 during registration
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
X-purgate-ID: tlsNG-d62444/1786059431-BF46D757-901C4318/0/0
X-purgate-type: clean
X-purgate-size: 5767

Pass in a PV clock's save/restore helpers when configuring sched_clock
instead of relying on each PV clock to manually set the save/restore hooks.
In addition to bringing sanity to the code, this will allow gracefully
"rejecting" a PV sched_clock, e.g. when running as a CoCo guest that has
access to a "secure" TSC.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h       | 9 ++++++---
 arch/x86/kernel/cpu/vmware.c       | 8 +++-----
 arch/x86/kernel/kvmclock.c         | 6 +++---
 arch/x86/kernel/tsc.c              | 5 ++++-
 arch/x86/xen/time.c                | 5 ++---
 drivers/clocksource/hyperv_timer.c | 6 ++----
 6 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index fe41d40a9ae6..e97cd1ae03d1 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -14,11 +14,14 @@ extern int no_timer_check;
 extern bool using_native_sched_clock(void);
 
 #ifdef CONFIG_PARAVIRT
-void __paravirt_set_sched_clock(u64 (*func)(void), bool stable);
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				void (*save)(void), void (*restore)(void));
 
-static inline void paravirt_set_sched_clock(u64 (*func)(void))
+static inline void paravirt_set_sched_clock(u64 (*func)(void),
+					    void (*save)(void),
+					    void (*restore)(void))
 {
-	__paravirt_set_sched_clock(func, true);
+	__paravirt_set_sched_clock(func, true, save, restore);
 }
 #endif
 
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 94fec990a02c..3598de5297f8 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -347,11 +347,9 @@ static void __init vmware_paravirt_ops_setup(void)
 
 	vmware_cyc2ns_setup();
 
-	if (vmw_sched_clock) {
-		paravirt_set_sched_clock(vmware_sched_clock);
-		x86_platform.save_sched_clock_state = x86_init_noop;
-		x86_platform.restore_sched_clock_state = x86_init_noop;
-	}
+	if (vmw_sched_clock)
+		paravirt_set_sched_clock(vmware_sched_clock,
+					 x86_init_noop, x86_init_noop);
 
 	if (vmware_is_stealclock_available()) {
 		has_steal_clock = true;
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 07e875738c39..5b9955343199 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -158,7 +158,9 @@ static void kvm_restore_sched_clock_state(void)
 static inline void kvm_sched_clock_init(bool stable)
 {
 	kvm_sched_clock_offset = kvm_clock_read();
-	__paravirt_set_sched_clock(kvm_sched_clock_read, stable);
+	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
+				   kvm_save_sched_clock_state,
+				   kvm_restore_sched_clock_state);
 
 	pr_info("kvm-clock: using sched offset of %llu cycles",
 		kvm_sched_clock_offset);
@@ -367,8 +369,6 @@ void __init kvmclock_init(bool prefer_tsc)
 #ifdef CONFIG_SMP
 	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
 #endif
-	x86_platform.save_sched_clock_state = kvm_save_sched_clock_state;
-	x86_platform.restore_sched_clock_state = kvm_restore_sched_clock_state;
 	kvm_get_preset_lpj();
 
 	/*
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 60fcc3020792..d4f7cb127235 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -280,12 +280,15 @@ bool using_native_sched_clock(void)
 	return static_call_query(pv_sched_clock) == native_sched_clock;
 }
 
-void __paravirt_set_sched_clock(u64 (*func)(void), bool stable)
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				void (*save)(void), void (*restore)(void))
 {
 	if (!stable)
 		clear_sched_clock_stable();
 
 	static_call_update(pv_sched_clock, func);
+	x86_platform.save_sched_clock_state = save;
+	x86_platform.restore_sched_clock_state = restore;
 }
 #else
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 477441752f40..8cd8bfaf1320 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -566,13 +566,12 @@ static void __init xen_init_time_common(void)
 {
 	xen_sched_clock_offset = xen_clocksource_read();
 	static_call_update(pv_steal_clock, xen_steal_clock);
-	paravirt_set_sched_clock(xen_sched_clock);
+
 	/*
 	 * Xen has paravirtualized suspend/resume and so doesn't use the common
 	 * x86 sched_clock save/restore hooks.
 	 */
-	x86_platform.save_sched_clock_state = x86_init_noop;
-	x86_platform.restore_sched_clock_state = x86_init_noop;
+	paravirt_set_sched_clock(xen_sched_clock, x86_init_noop, x86_init_noop);
 
 	x86_init.hyper.get_tsc_khz = xen_tsc_khz;
 	x86_platform.get_wallclock = xen_get_wallclock;
diff --git a/drivers/clocksource/hyperv_timer.c b/drivers/clocksource/hyperv_timer.c
index 220668207d19..8ee7a9de0f4f 100644
--- a/drivers/clocksource/hyperv_timer.c
+++ b/drivers/clocksource/hyperv_timer.c
@@ -570,10 +570,8 @@ static void hv_restore_sched_clock_state(void)
 static __always_inline void hv_setup_sched_clock(void *sched_clock)
 {
 	/* We're on x86/x64 *and* using PV ops */
-	paravirt_set_sched_clock(sched_clock);
-
-	x86_platform.save_sched_clock_state = hv_save_sched_clock_state;
-	x86_platform.restore_sched_clock_state = hv_restore_sched_clock_state;
+	paravirt_set_sched_clock(sched_clock, hv_save_sched_clock_state,
+				 hv_restore_sched_clock_state);
 }
 #else /* !CONFIG_GENERIC_SCHED_CLOCK && !CONFIG_PARAVIRT */
 static __always_inline void hv_setup_sched_clock(void *sched_clock) {}
-- 
2.55.0.679.g6767b8d81c-goog


