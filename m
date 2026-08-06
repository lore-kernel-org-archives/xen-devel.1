Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03795C5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:37:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385307.1627807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dv-0002fV-4a; Thu, 06 Aug 2026 23:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385307.1627807; Thu, 06 Aug 2026 23:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7du-0002en-UD; Thu, 06 Aug 2026 23:36:54 +0000
Received: by outflank-mailman (input) for mailman id 1385307;
 Thu, 06 Aug 2026 23:36:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3khp1agYKCfUpbXkgZdlldib.Zljubk-absbiifpqp.ubkmolgbZq.lod@flex--seanjc.bounces.google.com>)
 id 1ws7dt-0002Ml-FF
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:36:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7ds-00Gcdg-SP
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:36:52 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3khp1agYKCfUpbXkgZdlldib.Zljubk-absbiifpqp.ubkmolgbZq.lod@flex--seanjc.bounces.google.com>)
 id 6a751a4d-e002-0a2a0a5209dd-0a2a45078cde-40
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:52 +0200
Received: from [209.85.210.197] (helo=mail-pf1-f197.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3khp1agYKCfUpbXkgZdlldib.Zljubk-absbiifpqp.ubkmolgbZq.lod@flex--seanjc.bounces.google.com>)
 id 6a751a93-b4ea-0a2a45070019-d155d2c5e5a2-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:52 +0200
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-84e4ef9a74aso4706501b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:52 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059411; x=1786664211; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:reply-to:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbCVidvwQkuTYRlTXFKmfz6LBshlnXLBUNEqveo1L6E=;
        b=CSCErPHu++GbfzI1KqY2HMp3e75UFu3AB5KOlsWAiRQTbuPqmt+lmQSiUGA/61iJtl
         J5fh5giRXJbwBgjcfI9RkXhsPlFnjfJEvxBfsJWyyreULgT8Mpz4VAabaepS+G73xuEM
         Y3QkqWD4RcxEG1vkthJUggExzKUXcNWk440LHra7kW/Snl2uER9dcLP6pXdDhh01Jk7u
         ljaCGbAJLI/UrGV6tOsQN9m9trzNzsUngAqqwiXmXLgxS5Gl7LzUtxRQhfGDR9vkCox7
         Salk9YHE2TxAHmKgEmZlymHjp92YZ983s8K6a+fEqFbFMdme+s19nHCaf4bjWXZJPO8C
         ujuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059411; x=1786664211;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GbCVidvwQkuTYRlTXFKmfz6LBshlnXLBUNEqveo1L6E=;
        b=MMJUd3+Mb4i9+oIwHhTE6oakdUR3BiyYKBhLI8KvnSsGZFQ1fy8bzfg911QeOmM66V
         /D6kFQjBTWQOkKXygJi0N9TOEYDWbTNC22Ybec+ZcShE/fC6bwEX3/G4xpjI9DlAD7td
         tYj2x8XNdmEbIqDw7DDsdRnYRJGj1jqYDLp2IksmABAZ0NylIr5QcqX4WCWjkCa8b9G7
         diwHBoX7rZP8JEL7dq+UhrZI69sRLIt06A9dftzEGgVd16CKy0NvyelvNgzqFYJjutai
         WtuZBsizVDM7rp05F9NgtSui4TL4wGvLpNcZV4peCHK+ZfVduoz0s/fLohXr7OV42atq
         40/A==
X-Forwarded-Encrypted: i=1; AHgh+RonBZB76IHxKDosIlXJMTlZKWKJVdVVB4H+Cic+SZRW+UrbCpiaUKIh1o1mUqF9y817No/DZGtDyzc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSAQDp1YBXPwXNtp0uRcLtz1eoQbazySYmiFJ+5amaZKpM+Iqa
	1rELmb4Rsi985GKjxDF+1jSPM+WglFVBu7gHiNNMdyyTQTh+PplEexdtW5crzRMubdJqhjuXLNX
	+BOHzRQ==
X-Received: from pfbll6.prod.google.com ([2002:a05:6a00:7286:b0:84e:a25:1e6b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3a12:b0:848:354f:4f8f
 with SMTP id d2e1a72fcca58-84f2dff3015mr20822585b3a.22.1786059410525; Thu, 06
 Aug 2026 16:36:50 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:38 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-22-seanjc@google.com>
Subject: [PATCH v6 21/51] x86/kvm: Obtain TSC frequency from PV CPUID if present
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
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1786059412-354C3AE4-331BC121/0/0
X-purgate-type: clean
X-purgate-size: 5045

From: David Woodhouse <dwmw@amazon.co.uk>

In https://lkml.org/lkml/2008/10/1/246 a proposal was made for generic
CPUID conventions across hypervisors. It was mostly shot down in flames,
but the leaf at 0x40000010 containing timing information didn't die.

It's used by XNU and FreeBSD guests under all hypervisors=C2=B9=C2=B2 to de=
termine
the TSC frequency, and also exposed by the EC2 Nitro hypervisor (as
well as, presumably, VMware). FreeBSD's Bhyve is probably just about
to start exposing it too.

Use it under KVM to obtain the TSC frequency more accurately, instead of
reverse-calculating the frequency from the mul/shift values in the KVM
clock.  Use the information to get the CPU frequency as well (kvmclock
feeds in kvm_get_tsc_khz() for both TSC and CPU calibration), as the info
from CPUID is superior in every way; whether or not kvmclock should be
overriding CPU calibration in the first place is an entirely different
question.

Use the info from CPUID even if the user explicitly disables kvmclock, or
if it's unsupported.  The PV CPUID leaf has no dependency on kvmclock, and
is in fact more useful if kvmclock is disabled since the kernel won't be
able to use kvmclock to derive a derive the TSC frequency.

Before:
[    0.000020] tsc: Detected 2900.014 MHz processor

After:
[    0.000020] tsc: Detected 2900.015 MHz processor

$ cpuid -1 -l 0x40000010
CPU:
   hypervisor generic timing information (0x40000010):
      TSC frequency (Hz) =3D 2900015
      bus frequency (Hz) =3D 1000000

Note!  *Independently* query for non-null get_{cpu,tsc}_khz() overrides so
that kvmclock doesn't clobber x86_init.hyper.get_cpu_khz() if/when KVM adds
support for getting the CPU frequency separately from the TSC frequency.

=C2=B9 https://github.com/apple/darwin-xnu/blob/main/osfmk/i386/cpuid.c
=C2=B2 https://github.com/freebsd/freebsd-src/commit/4a432614f68

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvm.c      | 33 +++++++++++++++++++++++++++++++++
 arch/x86/kernel/kvmclock.c |  6 ++++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 5b554e480c0e..8ed02f4f5775 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -49,6 +49,8 @@
 #include <asm/svm.h>
 #include <asm/e820/api.h>
=20
+static unsigned int kvm_tsc_khz_cpuid __initdata;
+
 DEFINE_STATIC_KEY_FALSE_RO(kvm_async_pf_enabled);
=20
 static int kvmapf =3D 1;
@@ -913,6 +915,21 @@ bool kvm_para_available(void)
 }
 EXPORT_SYMBOL_GPL(kvm_para_available);
=20
+static u32 __init kvm_cpuid_timing_info_leaf(void)
+{
+	u32 base =3D kvm_cpuid_base();
+
+	if (!base || cpuid_eax(base) < (base | KVM_CPUID_TIMING_INFO))
+		return 0;
+
+	return base | KVM_CPUID_TIMING_INFO;
+}
+
+static unsigned int __init kvm_get_tsc_khz(void)
+{
+	return kvm_tsc_khz_cpuid;
+}
+
 unsigned int kvm_arch_para_features(void)
 {
 	return cpuid_eax(kvm_cpuid_base() | KVM_CPUID_FEATURES);
@@ -962,6 +979,7 @@ static void __init kvm_init_platform(void)
 		.mask_lo =3D (u32)(~(SZ_4G - tolud - 1)) | MTRR_PHYSMASK_V,
 		.mask_hi =3D (BIT_ULL(boot_cpu_data.x86_phys_bits) - 1) >> 32,
 	};
+	u32 timing_info_leaf;
=20
 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
 	    kvm_para_has_feature(KVM_FEATURE_MIGRATION_CONTROL)) {
@@ -1009,6 +1027,21 @@ static void __init kvm_init_platform(void)
 			wrmsrq(MSR_KVM_MIGRATION_CONTROL,
 			       KVM_MIGRATION_READY);
 	}
+
+	/*
+	 * If KVM advertises the frequency directly in CPUID, use that instead
+	 * of reverse-calculating it from the KVM clock data, or worse, trying
+	 * to calibratate the TSC using an emulated device.
+	 */
+	timing_info_leaf =3D kvm_cpuid_timing_info_leaf();
+	if (timing_info_leaf) {
+		kvm_tsc_khz_cpuid =3D cpuid_eax(timing_info_leaf);
+		if (kvm_tsc_khz_cpuid) {
+			x86_init.hyper.get_tsc_khz =3D kvm_get_tsc_khz;
+			x86_init.hyper.get_cpu_khz =3D kvm_get_tsc_khz;
+		}
+	}
+
 	kvmclock_init();
 	x86_platform.apic_post_init =3D kvm_apic_init;
=20
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 29ca37e9a3bc..f55d0305d1f3 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -342,8 +342,10 @@ void __init kvmclock_init(void)
 	flags =3D pvclock_read_flags(&hv_clock_boot[0].pvti);
 	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
=20
-	x86_init.hyper.get_tsc_khz =3D kvmclock_get_tsc_khz;
-	x86_init.hyper.get_cpu_khz =3D kvmclock_get_tsc_khz;
+	if (!x86_init.hyper.get_tsc_khz)
+		x86_init.hyper.get_tsc_khz =3D kvmclock_get_tsc_khz;
+	if (!x86_init.hyper.get_cpu_khz)
+		x86_init.hyper.get_cpu_khz =3D kvmclock_get_tsc_khz;
 	x86_platform.get_wallclock =3D kvm_get_wallclock;
 	x86_platform.set_wallclock =3D kvm_set_wallclock;
 #ifdef CONFIG_X86_LOCAL_APIC
--=20
2.55.0.679.g6767b8d81c-goog


