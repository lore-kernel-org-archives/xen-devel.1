Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DAAC43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:33:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350384.1607924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fw-0002Uz-By; Wed, 01 Jul 2026 19:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350384.1607924; Wed, 01 Jul 2026 19:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fv-0002Sq-Mn; Wed, 01 Jul 2026 19:32:47 +0000
Received: by outflank-mailman (input) for mailman id 1350384;
 Wed, 01 Jul 2026 19:32:46 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3W2tFagYKCaASEANJCGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@flex--seanjc.bounces.google.com>)
 id 1wf0fu-00027L-9J
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:32:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0ft-00Bw10-M1
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:32:45 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3W2tFagYKCaASEANJCGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@flex--seanjc.bounces.google.com>)
 id 6a456b5c-bab6-0a2a0a5309dd-0a2a4504ab4a-2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:45 +0200
Received: from [209.85.215.202] (helo=mail-pg1-f202.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3W2tFagYKCaASEANJCGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@flex--seanjc.bounces.google.com>)
 id 6a456b5c-a01d-0a2a45040019-d155d7caccd0-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:45 +0200
Received: by mail-pg1-f202.google.com with SMTP id
 41be03b00d2f7-c85798977dcso829847a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:45 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934363; x=1783539163; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JEJEfFzkyRhChopEv3/Eo+3SUmzyKJlolrUUxvPFGQs=;
        b=PAgkNZum8jPxRZz9+ydbw+bfUj3MHsLFJsyQaqR1J0b+EjqdM80kH2xDwCx3uAvkhW
         +uGmCuVpSrvmvLd+Qnr2p41NXAfeU8zuWoKSmC4+569uo7sE1/ulR1RiXglbBtI4AFRu
         woISm3v4ZHLsIUiCTdjAY7ZyBeDnyK+XNpe0ixP/uai40awtttk+8vvd/yZxeed1Hckt
         cPaumKYB6fOiUj8vWFqfSiFUslOxtyV1orulkJcxFzANEuUjfoSJKKgCVjkjC2lkUdMs
         Ci32VSkmh5deWRIGFgA1gYCSLUHwmQXc4wJGNHGTYlFANYiLoOHTNFzFyHFX53bwW2wU
         r5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934363; x=1783539163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEJEfFzkyRhChopEv3/Eo+3SUmzyKJlolrUUxvPFGQs=;
        b=lVAomjB5FkP0QcXTTdn3NXHXRtDLRmUAzdMQaOy1zsHpwIOosi+1sBPbmzli2qZM6w
         181Av7X0c0WaONtUwv/05TH/NgkP1pqgLQ7tvo9PHR73AlrMrMoGv1qq6rIiCsr8RGxC
         8OiD0VMJSEAqfDjrSTfDdHAfbLBh54Dha2rt9LTG/eDdXMUz/id8UPbpzOjUITa/O5u5
         02zOahZy/3HL2whTY+euCNIp7jR2vVqcn9Rc+L35nUcEhcHo3SYItcC08BuAVWyO29uK
         PvW/eeVcz5FpY6Oz84KoCMm/Yg74qHWSZ3QHyIJSki2FoxVdxC+96h9Oqg3M4xFf2Tx0
         1gvA==
X-Forwarded-Encrypted: i=1; AFNElJ82qQUj5LXqbK0G65tIjNSRqr69qKA6I/N82+fMQqo7cSFBmyTO+/aQIsBJ5el/9wUWlbzPzwTE2Rw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzd60iw5S7N9f6tETp+RxLJVak2vsKee/mM8VB5YBy9k9RBkC8D
	SGAhkapTHCtAPRGfnkJjCWbqVxnToRaCWZpcsQ1e0Qjm4a4ZzJPh0nOWbcOh4bOR/DPoh436HEL
	dIpQeSA==
X-Received: from pgbda6.prod.google.com ([2002:a05:6a02:2386:b0:c99:7baf:125f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7288:b0:3bf:b1f4:747b
 with SMTP id adf61e73a8af0-3bfed0e2904mr3197752637.12.1782934363113; Wed, 01
 Jul 2026 12:32:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:35 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-15-seanjc@google.com>
Subject: [PATCH v5 14/51] x86/tsc: Consolidate forcing of X86_FEATURE_TSC_KNOWN_FREQ
 for PV code
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
X-purgate-ID: tlsNG-ebf023/1782934365-AFD241CC-914DEE1A/0/0
X-purgate-type: clean
X-purgate-size: 5872

Now that all paravirt code that explicitly specifies the TSC frequency
also sets X86_FEATURE_TSC_KNOWN_FREQ, replace all of the one-off code
and simply set X86_FEATURE_TSC_KNOWN_FREQ if the TSC frequency is known.

Do NOT force set TSC_KNOWN_FREQ if the "known" TSC frequency was provided
by the user.  Per commit bd35c77e32e4 ("x86/tsc: Add tsc_early_khz command
line parameter"), one of the goals of the param is to allow the refined
calibration work "to do meaningful error checking".

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/sev/core.c       |  1 -
 arch/x86/coco/tdx/tdx.c        |  1 -
 arch/x86/kernel/cpu/acrn.c     |  1 -
 arch/x86/kernel/cpu/mshyperv.c |  1 -
 arch/x86/kernel/cpu/vmware.c   |  2 --
 arch/x86/kernel/jailhouse.c    |  1 -
 arch/x86/kernel/kvmclock.c     |  1 -
 arch/x86/kernel/tsc.c          | 13 ++++++++++---
 arch/x86/xen/time.c            |  1 -
 9 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index bc5ae9ef74da..72313b36b6f5 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2027,7 +2027,6 @@ unsigned int __init snp_secure_tsc_init(void)
 
 	secrets = (__force struct snp_secrets_page *)mem;
 
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
 
 	rdmsrq(MSR_AMD64_GUEST_TSC_FREQ, tsc_freq_mhz);
diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index ae2d35f2ef33..94682aca188b 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -1205,7 +1205,6 @@ unsigned int __init tdx_tsc_init(void)
 
 	/* TSC is the only reliable clock in TDX guest */
 	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 
 	return info.crystal_khz * info.numerator / info.denominator;
 }
diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index 3818f6ae0629..dc71a6fdd461 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -40,7 +40,6 @@ static void __init acrn_init_platform(void)
 	if (acrn_tsc_khz_cpuid) {
 		x86_init.hyper.get_tsc_khz = acrn_get_tsc_khz;
 		x86_init.hyper.get_cpu_khz = acrn_get_tsc_khz;
-		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	}
 }
 
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index f9bc1c2d8c93..e03c69a4db33 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -575,7 +575,6 @@ static void __init ms_hyperv_init_platform(void)
 	    ms_hyperv.misc_features & HV_FEATURE_FREQUENCY_MSRS_AVAILABLE) {
 		x86_init.hyper.get_tsc_khz = hv_get_tsc_khz;
 		x86_init.hyper.get_cpu_khz = hv_get_tsc_khz;
-		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	}
 
 	if (ms_hyperv.priv_high & HV_ISOLATION) {
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 3cb473cae462..0a3bd90576d4 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -390,8 +390,6 @@ static void __init vmware_set_capabilities(void)
 {
 	setup_force_cpu_cap(X86_FEATURE_CONSTANT_TSC);
 	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
-	if (vmware_tsc_khz)
-		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMCALL)
 		setup_force_cpu_cap(X86_FEATURE_VMCALL);
 	else if (vmware_hypercall_mode == CPUID_VMWARE_FEATURES_ECX_VMMCALL)
diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index e24c05ab4fae..ff173052cdce 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -255,7 +255,6 @@ static void __init jailhouse_init_platform(void)
 	pr_debug("Jailhouse: PM-Timer IO Port: %#x\n", pmtmr_ioport);
 
 	precalibrated_tsc_khz = setup_data.v1.tsc_khz;
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 
 	pci_probe = 0;
 
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 4f8299303a19..35a879d33e9e 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -138,7 +138,6 @@ static inline void kvm_sched_clock_init(bool stable)
  */
 static unsigned int __init kvm_get_tsc_khz(void)
 {
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	return pvclock_tsc_khz(this_cpu_pvti());
 }
 
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 1dca9464b41c..676910292af7 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1541,11 +1541,18 @@ void __init tsc_early_init(void)
 	if (!known_tsc_khz && x86_init.hyper.get_tsc_khz)
 		known_tsc_khz = x86_init.hyper.get_tsc_khz();
 
+	/*
+	 * Mark the TSC frequency as known if it was obtained from a hypervisor
+	 * or trusted firmware.
+	 */
+	if (known_tsc_khz)
+		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
+
 	/*
 	 * Ignore the user-provided TSC frequency if the exact frequency was
-	 * obtained from trusted firmware or the hypervisor, as the user-
-	 * provided frequency is intended as a "starting point", not a known,
-	 * guaranteed frequency.
+	 * obtained from trusted firmware or the hypervisor, and don't mark the
+	 * frequency as known, as the user-provided frequency is intended as a
+	 * "starting point", not a known, guaranteed frequency
 	 */
 	if (!known_tsc_khz)
 		known_tsc_khz = tsc_early_khz;
diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 1adb44fdddb2..487ad838c441 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -43,7 +43,6 @@ static unsigned int __init xen_tsc_khz(void)
 	struct pvclock_vcpu_time_info *info =
 		&HYPERVISOR_shared_info->vcpu_info[0].time;
 
-	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	return pvclock_tsc_khz(info);
 }
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


