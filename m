Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC8AC5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:42:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385550.1628052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7im-0003W6-Tc; Thu, 06 Aug 2026 23:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385550.1628052; Thu, 06 Aug 2026 23:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7im-0003Vt-Pp; Thu, 06 Aug 2026 23:41:56 +0000
Received: by outflank-mailman (input) for mailman id 1385550;
 Thu, 06 Aug 2026 23:41:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3kxp1agYKCfYqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@flex--seanjc.bounces.google.com>)
 id 1ws7il-0003Oy-1v
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:41:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7ik-00H1om-Eo
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:41:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3kxp1agYKCfYqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@flex--seanjc.bounces.google.com>)
 id 6a751b81-5cb7-0a2a0a5109dd-0a2a450b92be-26
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:41:54 +0200
Received: from [209.85.214.199] (helo=mail-pl1-f199.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3kxp1agYKCfYqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@flex--seanjc.bounces.google.com>)
 id 6a751a94-b7e8-0a2a450b0019-d155d6c7d513-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:53 +0200
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2cca5e0a0c9so47575325ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:53 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059412; x=1786664212; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9lHEbI53WDwynue0wsp+pOzdIE1KL/OlJm0qjHY+exI=;
        b=SFr28XEaSt6UgjRIJoKY55daRUKXCrTvedZjMBPb5ELN8tdLyF99ykPorQrN4PunXf
         lWb2SctUmfzZtPhw9pc74mHAMbS+onyvOdtY2igX8QeGYCfJ2BBGGQzzRf794R2DFC1Q
         XuKDyH0s2G3U+VTY4iLvydW6/QwOJCMLx2SMjB/DBceU1Irc3hJSwhsJil5iGRiLA8v0
         oegUVkoJpLQi6PSwOsPcR14PANswABwTYkTEErJ+fh+nVu9v0AXpx3Qi/+XVl4u6q3td
         IAarnfYbq7wSaV15TTAv8u+tAtmmkRk1Pw79v/mH1T8Jm5BncZ2TeJ5FmgzKsF3mzWPL
         eufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059412; x=1786664212;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9lHEbI53WDwynue0wsp+pOzdIE1KL/OlJm0qjHY+exI=;
        b=r5saDU2HOuzbTPEpvpc3D4FlpoLURxL6U3GuReQ5V+R/as/05fe2IwBB5Zi/oO/JGK
         aGq2osKChExJ85V0NKCON74DRJtZQE4AqZGVNmnW3PoU4kdN5hEc4Z/5AqmYk5slFaa4
         i2UERrr9VmXXIvmtu5oZeDgKvyPUEVMClKLxmTKAU8rzSBARW+brK0rWqsOihECH+wNR
         hzCJmlMim0uYrVvc4xWQ/PGa+dAewbLh2XdAg06SnjlQem+6rZ1i4eQfJf1RbLE0lvzd
         pz4eBPfZYCZoKrAOOnCn/p9EQBSowxJx0bIlqtT4U/NpLYnEjCTl3yHIjJhjuCR6c9tP
         Lorg==
X-Forwarded-Encrypted: i=1; AHgh+RrKKNzvrFmim61+43g7QgSrA2wU1ZNC4TDLodZd13Usb2XTgh67o24Fx7++b0ABqW7VJSM26/38NnM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGVtV1I7NJhCACMPe9xa5WkBPLG7Np+54UB0wafDgpQ1aNnTvc
	aD3OD6AEGpZ2+1uMOGFwA2T97HoTBcVqNgZ8vHnYs3vm4T6J2fSWPu2179/PHqFKrk+wSmtTIg8
	5PFL64Q==
X-Received: from plpn24.prod.google.com ([2002:a17:902:9698:b0:2cc:ae2b:c324])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3d0d:b0:2d0:4021:bb6b
 with SMTP id d9443c01a7336-2d0ca15c87amr222771235ad.0.1786059411603; Thu, 06
 Aug 2026 16:36:51 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:39 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-23-seanjc@google.com>
Subject: [PATCH v6 22/51] x86/kvm: Mark TSC as reliable when it's constant and nonstop
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
X-purgate-ID: tlsNG-42698a/1786059413-194C39EA-07710684/0/0
X-purgate-type: clean
X-purgate-size: 3764

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
index 8ed02f4f5775..255a24a99f28 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -980,6 +980,7 @@ static void __init kvm_init_platform(void)
 		.mask_hi = (BIT_ULL(boot_cpu_data.x86_phys_bits) - 1) >> 32,
 	};
 	u32 timing_info_leaf;
+	bool tsc_is_reliable;
 
 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
 	    kvm_para_has_feature(KVM_FEATURE_MIGRATION_CONTROL)) {
@@ -1042,7 +1043,16 @@ static void __init kvm_init_platform(void)
 		}
 	}
 
-	kvmclock_init();
+	/*
+	 * If the TSC counts at a constant frequency across P/T states and in
+	 * deep C-states, treat the TSC reliable, as guaranteed by KVM.
+	 */
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
2.55.0.679.g6767b8d81c-goog


