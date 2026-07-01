Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACF9C43602
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:32:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350365.1607825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fg-00080K-7V; Wed, 01 Jul 2026 19:32:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350365.1607825; Wed, 01 Jul 2026 19:32:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fg-00080D-4O; Wed, 01 Jul 2026 19:32:32 +0000
Received: by outflank-mailman (input) for mailman id 1350365;
 Wed, 01 Jul 2026 19:32:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3S2tFagYKCZACyu73w08805y.w86Hy7-xyFy552CDC.Hy79B83ywD.8B0@flex--seanjc.bounces.google.com>)
 id 1wf0fe-0007vn-Nh
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:32:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0fe-004o0g-4Z
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:32:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3S2tFagYKCZACyu73w08805y.w86Hy7-xyFy552CDC.Hy79B83ywD.8B0@flex--seanjc.bounces.google.com>)
 id 6a456b30-2eae-0a2a0a5409dd-0a2a4503b1b4-16
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:30 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3S2tFagYKCZACyu73w08805y.w86Hy7-xyFy552CDC.Hy79B83ywD.8B0@flex--seanjc.bounces.google.com>)
 id 6a456b4c-ec1a-0a2a45030019-d155d6cab929-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:29 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2c9960cf96cso12682655ad.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:29 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934348; x=1783539148; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=t7xFvhsXyUl34us7SMoRDgC7NN8K9lGkg6/G6zp7sLk=;
        b=uDgtrHaJ6ZBuPOkMrZLDVdCcpygN6+1xPMKD3qnf9JAU3vNFS69xLZDPEfT4C9CAcO
         roT0NWYcs0n7KfI2EZ08ijqTEcDfrg2PwATjpdwThh8Xg/wnN135gQUlrS3GDWaRTVt0
         9D6BzSm1dfKTTRixyGbg3k803jhT2S0u+AKdMTe7K9vuiabe4OriVJeX4l3HB3QpWAYn
         b/H9scq8Ehlir0V4F3eUMUINw9YN4K2jtOm1mW7oQccLpg8eDwD0tX3fX5UjSLOm9MeF
         Hk9ZdaHnMJ1KOGh2taskaqQIqEv7tlSdENbIJEdySWQp9OtcK8SMtzntmc6eMivgjHz0
         fsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934348; x=1783539148;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7xFvhsXyUl34us7SMoRDgC7NN8K9lGkg6/G6zp7sLk=;
        b=YrKSEftd2pq4hZQF6oK10bBwzKyGcbIb7seO/9ZELyhb05GP6eoymYhoC/vA6epTec
         7QFdlvJNrSbjPOJoEdWjhk6Y1Q6MGC3JA+myKzQl+Lu9AL5nt5LlcY6MZyxE1ax02xrI
         XQgU54aN74ut01hb9+xAhEw+OKMxxOjli+FregI29yahh1zALVvqi4ETFqwQusW5IhKM
         jk5pGe/AYEgYgOV2RR5vMvz6Xjmu74Km70YTynBBTTYBZU4RcTVDrHqtvgcB1RHjUl0F
         TtxEPV+WeugNPhfBjXfnvc3ugoXLhjDAZzktLBXs1gJjkB/yCaVFkiq8CDH8Pi1jIfT7
         vEkA==
X-Forwarded-Encrypted: i=1; AHgh+RqbFCEdd8JhaoUSuo3/AZ9XGNgbxk+oJyckGBf7zxXw34Bx4SCttxfCe/sBYgDokLglKIIgROwEQek=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPTlOK5mplBXHpBWw8KApJZ+oDIjKvj21VX/g4T2Myy5eIXR92
	3fqLNPiqisX3wd+s/hvTRKaBJwUK2Ilg3jGdhjauiWraxpUevsh7YAdprCaA8QobnUmu0TYn0Yj
	Hi/3aBg==
X-Received: from plbmk12.prod.google.com ([2002:a17:903:2bcc:b0:2c8:219a:17e8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19d0:b0:2ca:53e9:1277
 with SMTP id d9443c01a7336-2ca7e714f7fmr32655485ad.1.1782934347423; Wed, 01
 Jul 2026 12:32:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:23 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-3-seanjc@google.com>
Subject: [PATCH v5 02/51] x86/apic: Add CONFIG_X86_LOCAL_APIC=n stubs for apic_set_timer_period_{,k}hz()
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
X-purgate-ID: tlsNG-33051d/1782934350-077265D1-D715471B/0/0
X-purgate-type: clean
X-purgate-size: 3082

Add stubs for the apic_set_timer_period_{,k}hz() APIs when the kernel is
built without support for a local APIC, and drop #ifdefs in callers that
don't need to check CONFIG_X86_LOCAL_APIC for other reasons.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/apic.h  | 2 ++
 arch/x86/kernel/cpu/vmware.c | 2 --
 arch/x86/kernel/tsc.c        | 2 --
 arch/x86/kernel/tsc_msr.c    | 2 --
 4 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index cd84a94688a2..035998555e99 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -189,6 +189,8 @@ static inline void disable_local_APIC(void) { }
 # define setup_boot_APIC_clock x86_init_noop
 # define setup_secondary_APIC_clock x86_init_noop
 static inline void lapic_update_tsc_freq(void) { }
+static inline void apic_set_timer_period_hz(u64 period_hz, const char *source) { }
+static inline void apic_set_timer_period_khz(u64 period_khz, const char *source) { }
 static inline void init_bsp_APIC(void) { }
 static inline void apic_intr_mode_select(void) { }
 static inline void apic_intr_mode_init(void) { }
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 36f779dd311d..13b97265c535 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -422,10 +422,8 @@ static void __init vmware_platform_setup(void)
 		x86_platform.calibrate_tsc = vmware_get_tsc_khz;
 		x86_platform.calibrate_cpu = vmware_get_tsc_khz;
 
-#ifdef CONFIG_X86_LOCAL_APIC
 		/* Skip lapic calibration since we know the bus frequency. */
 		apic_set_timer_period_hz(ecx, "VMware hypervisor");
-#endif
 	} else {
 		pr_warn("Failed to get TSC freq from the hypervisor\n");
 	}
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index f9ecc9256863..4d6a446645c0 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -710,7 +710,6 @@ unsigned long native_calibrate_tsc(void)
 	if (boot_cpu_data.x86_vfm == INTEL_ATOM_GOLDMONT)
 		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
 
-#ifdef CONFIG_X86_LOCAL_APIC
 	/*
 	 * The local APIC appears to be fed by the core crystal clock
 	 * (which sounds entirely sensible). We can set the global
@@ -718,7 +717,6 @@ unsigned long native_calibrate_tsc(void)
 	 * timer later.
 	 */
 	apic_set_timer_period_khz(crystal_khz, "CPUID 0x15/0x16");
-#endif
 
 	return crystal_khz * ebx_numerator / eax_denominator;
 }
diff --git a/arch/x86/kernel/tsc_msr.c b/arch/x86/kernel/tsc_msr.c
index 7e990871e041..aece062aee7e 100644
--- a/arch/x86/kernel/tsc_msr.c
+++ b/arch/x86/kernel/tsc_msr.c
@@ -210,9 +210,7 @@ unsigned long cpu_khz_from_msr(void)
 	if (freq == 0)
 		pr_err("Error MSR_FSB_FREQ index %d is unknown\n", index);
 
-#ifdef CONFIG_X86_LOCAL_APIC
 	apic_set_timer_period_khz(freq, "MSR_FSB_FREQ");
-#endif
 
 	/*
 	 * TSC frequency determined by MSR is always considered "known"
-- 
2.55.0.rc0.799.gd6f94ed593-goog


