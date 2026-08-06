Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E63C5AC82
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:36:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385267.1627700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dW-0006zf-I0; Thu, 06 Aug 2026 23:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385267.1627700; Thu, 06 Aug 2026 23:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dW-0006zW-F0; Thu, 06 Aug 2026 23:36:30 +0000
Received: by outflank-mailman (input) for mailman id 1385267;
 Thu, 06 Aug 2026 23:36:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3eRp1agYKCdwQC8LHAEMMEJC.AMKVCL-BCTCJJGQRQ.VCLNPMHCAR.MPE@flex--seanjc.bounces.google.com>)
 id 1ws7dV-0006aA-8Y
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:36:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7dU-00GcVS-D4
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:36:28 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3eRp1agYKCdwQC8LHAEMMEJC.AMKVCL-BCTCJJGQRQ.VCLNPMHCAR.MPE@flex--seanjc.bounces.google.com>)
 id 6a7519b9-e002-0a2a0a5209dd-0a2a450cbaea-48
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:28 +0200
Received: from [209.85.210.200] (helo=mail-pf1-f200.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3eRp1agYKCdwQC8LHAEMMEJC.AMKVCL-BCTCJJGQRQ.VCLNPMHCAR.MPE@flex--seanjc.bounces.google.com>)
 id 6a751a7a-f479-0a2a450c0019-d155d2c8dcb1-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:28 +0200
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-8487ed7f7beso3066060b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:27 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059386; x=1786664186; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lGVITa15iYf7ywTb6PznrnwE5mV86GVcr9KZACd8UjM=;
        b=P5Mmiu0kxT8zdJ6oMfjjzlKWJroER5Z8qJszJtCnI2Jxz7iUDBTB3K8wrQxURhee4y
         TFvC3RmcKkPExJwp7RL8zPWMmRCiodcOQYp4hnzVMwn8pK7jmpiYsFXsvvlfnBrRE/bG
         q9ce8HmgSIuFqBWD3UpxgqiMSioNTTffVV1fNp7bmaM2s3UjuZ+jqI/yN5S8U1sQPSxr
         4z0UGnN4goFFn0TNpGEVfs3W+obqbRGp3g+wh5pTEVqhM1cYZXDCQnQRR9JWTTfwBPon
         hz9vbrWXQElGSmTbtYWChUBSJxIdNuPZTOMU7MW5bm+Zo5it2ypgdqSccpeS7FAr4KT1
         9lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059386; x=1786664186;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lGVITa15iYf7ywTb6PznrnwE5mV86GVcr9KZACd8UjM=;
        b=oYjhB2ufCvUpRN6n9DsIcH7pg4iNIqQhpMsBiDymnoHD35lFLWHQ2MTWDkdjIMYMSY
         PU44GNzi0qivY1e1q41wTUchIwxgxajhrI2IStJLiRfka4tdMYx70VFEvL1PC3Oa8JFO
         AMSSATUfkveQYVqSgEfu9kh5s2WjZrRveCuvgvo2KSc3YrSF8JzQqxXS5MhU0JhRWpWM
         BLxJUply9SUGlyfRXblEy4OxjTYlfaVO0xl/aMbsh8HgoLHP2Vp0cE1HoQuIYpKuEVO0
         R37E6tdjW+WVqlF6z45e6YfZCRTW26d/uhIUeZzbNm5W9+R+G330RcOInG/58hklljY6
         3CDw==
X-Forwarded-Encrypted: i=1; AHgh+RqR3Z+eXpPjXcO1wdYD5FBGRDSIrqNWByrDds3nyojF24++tQOQpIrU+K74uCdvpY6JszardIfzgns=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxA284ru0lfGMc+tHOqqMJamVLF7AlI+9LCYSHVvFKum5GfTsYC
	Kx62gZs6B515tGmK87ZZNZGiDa2AD4q31HkW4AVumKsr/OBwel+5XEO54FuxKWKbrQXgLqdQ6DI
	wWptxAQ==
X-Received: from pgnc18.prod.google.com ([2002:a63:7252:0:b0:c9e:6c82:64e8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1310:b0:84e:216d:7e52
 with SMTP id d2e1a72fcca58-84f2e03175emr20642138b3a.14.1786059385989; Thu, 06
 Aug 2026 16:36:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:19 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-3-seanjc@google.com>
Subject: [PATCH v6 02/51] x86/apic: Add CONFIG_X86_LOCAL_APIC=n stubs for APIC
 timer frequency APIs
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
X-purgate-ID: tlsNG-d25034/1786059388-52530A5B-E5B61271/0/0
X-purgate-type: clean
X-purgate-size: 3092

Add stubs for the apic_set_timer_frequency_{,k}hz() APIs when the kernel is
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
index 6946220a6008..9c5084f3317f 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -189,6 +189,8 @@ static inline void disable_local_APIC(void) { }
 # define setup_boot_APIC_clock x86_init_noop
 # define setup_secondary_APIC_clock x86_init_noop
 static inline void lapic_update_tsc_freq(void) { }
+static inline void apic_set_timer_frequency_hz(u64 freq_hz, const char *source) { }
+static inline void apic_set_timer_frequency_khz(u64 freq_khz, const char *source) { }
 static inline void init_bsp_APIC(void) { }
 static inline void apic_intr_mode_select(void) { }
 static inline void apic_intr_mode_init(void) { }
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 22842bf5b59e..2225df67d45f 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -422,10 +422,8 @@ static void __init vmware_platform_setup(void)
 		x86_platform.calibrate_tsc = vmware_get_tsc_khz;
 		x86_platform.calibrate_cpu = vmware_get_tsc_khz;
 
-#ifdef CONFIG_X86_LOCAL_APIC
 		/* Skip lapic calibration since we know the bus frequency. */
 		apic_set_timer_frequency_hz(ecx, "VMware hypervisor");
-#endif
 	} else {
 		pr_warn("Failed to get TSC freq from the hypervisor\n");
 	}
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 63e26805f8dd..4392fddd616e 100644
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
 	apic_set_timer_frequency_khz(crystal_khz, "CPUID 0x15/0x16");
-#endif
 
 	return crystal_khz * ebx_numerator / eax_denominator;
 }
diff --git a/arch/x86/kernel/tsc_msr.c b/arch/x86/kernel/tsc_msr.c
index 4bd5f2ae656b..179e3a331ef9 100644
--- a/arch/x86/kernel/tsc_msr.c
+++ b/arch/x86/kernel/tsc_msr.c
@@ -211,9 +211,7 @@ unsigned long cpu_khz_from_msr(void)
 	if (freq == 0)
 		pr_err("Error MSR_FSB_FREQ index %d is unknown\n", index);
 
-#ifdef CONFIG_X86_LOCAL_APIC
 	apic_set_timer_frequency_khz(freq, "MSR_FSB_FREQ");
-#endif
 
 	/*
 	 * TSC frequency determined by MSR is always considered "known"
-- 
2.55.0.679.g6767b8d81c-goog


