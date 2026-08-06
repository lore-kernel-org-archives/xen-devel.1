Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B01C5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:41:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385528.1628034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7id-0002Ot-39; Thu, 06 Aug 2026 23:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385528.1628034; Thu, 06 Aug 2026 23:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7ic-0002Nb-TD; Thu, 06 Aug 2026 23:41:46 +0000
Received: by outflank-mailman (input) for mailman id 1385528;
 Thu, 06 Aug 2026 23:41:45 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3iBp1agYKCesfRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 1ws7ia-00021x-V2
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:41:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7ia-00EMEo-Bf
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:41:44 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3iBp1agYKCesfRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 6a751b7b-e002-0a2a0a5209dd-0a2a4507ba7e-24
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:41:44 +0200
Received: from [209.85.210.198] (helo=mail-pf1-f198.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3iBp1agYKCesfRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 6a751a89-b4ea-0a2a45070019-d155d2c6c536-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:43 +0200
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-84f0d3ab2f4so2320951b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:42 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059401; x=1786664201; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xHY7WhZzoR4x+WtFqsSoEfBU4PaM9Rhz3R83jbux6ZU=;
        b=l3AxvYlcIv5t4p50ACKgOr8BmfXFznkGjO5XzZmRCFmzcGJq3TSAPfjGHop+KsftGV
         kTKG6IdfHqwUDcy4EJyLFd98+3NdcqEnL+9scHbYGCu15m6NQQ6GdVabg5T0chaQKLuN
         i/Q6tU/MJuYI1DTZPYUqlyqZxHkqhmj/qmrPrkNbxaMCt1gEQmrf36QGq8PKMoIWEtG1
         Ke1BAcIkU93DqZFd7UPXpEaPccAk1xpK5fBr06eGQU4yTR47oT6W7uZCnIZljhUTMlhv
         9bFy3PlZXzyKnUYVY+McaJqB+KkSnz+P7Z0HwZ3XxgAOqGU4Ib0MNzM2FicFnijUzbVx
         TykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059401; x=1786664201;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xHY7WhZzoR4x+WtFqsSoEfBU4PaM9Rhz3R83jbux6ZU=;
        b=TcgjIMVicxErgAmMoOcd3icYrz/FER5Hi5DAmOHGPieLjVRf72NZdsqCweDz4PVbim
         GNCQz/bJhio2c0fsXdPJuUKH48/KE91Os80s6p93I1/uemsDnW4UmzrWxZTkQWvgQHVG
         EAqa/sqstbxZW4cFT2IurULTAMQZ5cynCqoInAnKh+hRxv9DpC2o2ZFCJtz51bPJhXs/
         U+aZ+YaEIwnMEzZVBfFrTH0GEUIMk99PB3WPOQ4SK4l+iSliq20BKFbUvwad/90NcUHd
         1L0hYFBRTf+c65HFP3KYM9Dk+/1ABsDQUUew09lNgc7VKjR9/2BonBGxIv2/sE/iWoPd
         kt/g==
X-Forwarded-Encrypted: i=1; AHgh+RqaWv1QSgaOPxyuzXfUuA1V91XGUinzCJKMZOI6M6V4Wvs/rDJtFL7eWEpdgXoOC21dGMFlY0gz00A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3RhHNuXPlQdI6Sl8ypKy6H/RkexgUAiPqhIBW9R9Ecsm0JvCY
	9nsseWsu+rQL5hIFW+RWrbUpjS4yDts9Z+zrNNYNJeZqy0KIMdSm9/wEbj0fSigb4uSGywcdpqQ
	aBoBkdg==
X-Received: from pfbbu11.prod.google.com ([2002:a05:6a00:410b:b0:848:8b16:23d6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2383:b0:842:5b66:3c7f
 with SMTP id d2e1a72fcca58-84f2dedf356mr20263411b3a.0.1786059400868; Thu, 06
 Aug 2026 16:36:40 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:31 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-15-seanjc@google.com>
Subject: [PATCH v6 14/51] x86/tsc: Consolidate forcing of X86_FEATURE_TSC_KNOWN_FREQ
 for PV code
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
X-purgate-ID: tlsNG-ef75cf/1786059403-A50CDAE4-3B769141/0/0
X-purgate-type: clean
X-purgate-size: 5920

Now that all paravirt code that explicitly specifies the TSC frequency
also sets X86_FEATURE_TSC_KNOWN_FREQ, replace all of the one-off code
and simply set X86_FEATURE_TSC_KNOWN_FREQ if the TSC frequency is known.

Do NOT force set TSC_KNOWN_FREQ if the "known" TSC frequency was provided
by the user.  Per commit bd35c77e32e4 ("x86/tsc: Add tsc_early_khz command
line parameter"), one of the goals of the param is to allow the refined
calibration work "to do meaningful error checking".

No functional change intended.

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
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
index ec28a15e26ac..21a574e60e0f 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -1203,7 +1203,6 @@ unsigned int __init tdx_tsc_init(void)
 
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
index 4a0cdda0c49e..3bca987e05c3 100644
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
index 3f1dab69d90e..cbe8b59ab79f 100644
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
index 595cd28f9a9f..8107c28eb2bc 100644
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
index 7f1ca6df0004..f42872c9ae99 100644
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
2.55.0.679.g6767b8d81c-goog


