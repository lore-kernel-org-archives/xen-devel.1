Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794E7C43602
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:34:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350546.1608042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0h5-00029f-VQ; Wed, 01 Jul 2026 19:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350546.1608042; Wed, 01 Jul 2026 19:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0h5-00029V-Sj; Wed, 01 Jul 2026 19:33:59 +0000
Received: by outflank-mailman (input) for mailman id 1350546;
 Wed, 01 Jul 2026 19:33:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3ZmtFagYKCasdPLYUNRZZRWP.NZXiPY-OPgPWWTded.iPYacZUPNe.ZcR@flex--seanjc.bounces.google.com>)
 id 1wf0h3-00024S-P7
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:33:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0h3-004oBL-5t
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:33:57 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3ZmtFagYKCasdPLYUNRZZRWP.NZXiPY-OPgPWWTded.iPYacZUPNe.ZcR@flex--seanjc.bounces.google.com>)
 id 6a456b9c-2eae-0a2a0a5409dd-0a2a4509e6b8-10
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:33:57 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3ZmtFagYKCasdPLYUNRZZRWP.NZXiPY-OPgPWWTded.iPYacZUPNe.ZcR@flex--seanjc.bounces.google.com>)
 id 6a456b67-97e6-0a2a45090019-d155d6cad1f5-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:56 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2c9b1b608e2so14564545ad.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:56 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934375; x=1783539175; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XQAPpCEE/BDkXN3dIWP18HQMEopEl3zLKZ2PUcc2V5o=;
        b=jJD3qt1qn8jrOaa+zPI23+YU6E5Ch1uvWC+U9lDfIxEqSklZd7D9q9F6kuofM9NR47
         aaUHOLhQcG5vJHqLU9pPCb0QDmenV+S0HQtdKB4XSezidMRC4UcpCDQb3clabMEjlhxz
         o3jjT9/d8btZ9pAScMkpgK+g2yiHaTHAqCBBfZjMZ3iZVkI6hgwn0oqbEQtwuNLZU76w
         KH+1cv+3ZqNR5baOn7/OqMSs+WCqSoHMBm6Qo5FwRHdKxT8DbziVaEjLMZs5sghf6eiR
         heHt2SMc9E2S1E/N1rDXE+a9UR+3oQN9+/hFCALfPDV6OvdYNwxnMgOEla2qDP7wI7Ds
         JyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934375; x=1783539175;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQAPpCEE/BDkXN3dIWP18HQMEopEl3zLKZ2PUcc2V5o=;
        b=cS4iezeTRToYY+0red1zCSzUNFVNt6zMu3UVif4Pr0AZodpbHiEXUr0+TpCZ1QWNpm
         PuIegVGgDmAJhqpya1iRICm6eJ4Fu/clAjovzsJyPhWqz9rGlHhZhI7fFuax0FzB5WpG
         AdTHhTHFylcZXbbqJzkCE/5WuPPr9s483gnVuABbJBZVPBm+3AevwosSXhXPQsXviQPi
         T5o+v+wo9Pz4CeN/aS5Gb/rFiVB/0mFSmMv0zKvbjRg5NggN0eYEDTOsX5/Tb8Posd8a
         Y1yfpqyl5ODuFaHanwVyRADyrVbnmBHjGkPauXZDyfPOGinxZePJPwEE+mPEqIsGEQsX
         eR6w==
X-Forwarded-Encrypted: i=1; AHgh+RqipQhwvE+c8CsMstcL5yNhNac64b1w7iolx/lh3cpFcw8FyHY351rBCGCxzJ+VoNcAIzDEmuZANhM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMPYBMlJlD76URF+ySm1mTUmA6rwUQ8Sydu7O40YbduI/kl+2a
	U4VFiqdt34s5lcGPAskmN0yQLE0HBE8btmaxkIqW6Rq0dSFakdP8gw53w/hOP/8Snrpe9GSRPZb
	EmrvO+w==
X-Received: from plpl11.prod.google.com ([2002:a17:903:3dcb:b0:2b0:46bd:4fe5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce02:b0:2ca:62e:cc4f
 with SMTP id d9443c01a7336-2ca7e7645d1mr34535395ad.23.1782934374801; Wed, 01
 Jul 2026 12:32:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:44 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-24-seanjc@google.com>
Subject: [PATCH v5 23/51] x86/tsc: Add standalone helper for getting CPU
 frequency from CPUID
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
X-purgate-ID: tlsNG-bad1c0/1782934377-55D90986-6A5EA88F/13/0
X-purgate-type: clean
X-purgate-size: 2818

Extract the guts of cpu_khz_from_cpuid() to a standalone helper that
doesn't restrict the usage to Intel CPUs.  This will allow sharing the
core logic with KVM-as-a-guest, as KVM generally doesn't restrict CPUID
based on vendor.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tsc.h |  1 +
 arch/x86/kernel/tsc.c      | 31 +++++++++++++++----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index c09ec485abcd..cb682f097ea7 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -88,6 +88,7 @@ struct cpuid_tsc_info {
 	unsigned int crystal_khz;
 };
 extern int cpuid_get_tsc_info(struct cpuid_tsc_info *info);
+extern unsigned int __cpu_khz_from_cpuid(void);
 
 extern void tsc_early_init(void);
 extern void tsc_init(void);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 6ed6f8f012eb..56e73e96920a 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -668,6 +668,18 @@ int cpuid_get_tsc_info(struct cpuid_tsc_info *info)
 	return 0;
 }
 
+unsigned int __cpu_khz_from_cpuid(void)
+{
+	unsigned int eax_base_mhz, ebx, ecx, edx;
+
+	if (boot_cpu_data.cpuid_level < CPUID_LEAF_FREQ)
+		return 0;
+
+	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
+
+	return eax_base_mhz * 1000;
+}
+
 /**
  * native_calibrate_tsc - determine TSC frequency
  * Determine TSC frequency via CPUID, else return 0.
@@ -703,12 +715,8 @@ static unsigned long native_calibrate_tsc(void)
 	 * clock, but we can easily calculate it to a high degree of accuracy
 	 * by considering the crystal ratio and the CPU speed.
 	 */
-	if (!info.crystal_khz && boot_cpu_data.cpuid_level >= CPUID_LEAF_FREQ) {
-		unsigned int eax_base_mhz, ebx, ecx, edx;
-
-		cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
-		info.crystal_khz = eax_base_mhz * 1000 * info.denominator / info.numerator;
-	}
+	if (!info.crystal_khz)
+		info.crystal_khz = __cpu_khz_from_cpuid() * info.denominator / info.numerator;
 
 	if (!info.crystal_khz)
 		return 0;
@@ -733,19 +741,10 @@ static unsigned long native_calibrate_tsc(void)
 
 static unsigned long cpu_khz_from_cpuid(void)
 {
-	unsigned int eax_base_mhz, ebx_max_mhz, ecx_bus_mhz, edx;
-
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return 0;
 
-	if (boot_cpu_data.cpuid_level < CPUID_LEAF_FREQ)
-		return 0;
-
-	eax_base_mhz = ebx_max_mhz = ecx_bus_mhz = edx = 0;
-
-	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx_max_mhz, &ecx_bus_mhz, &edx);
-
-	return eax_base_mhz * 1000;
+	return __cpu_khz_from_cpuid();
 }
 
 /*
-- 
2.55.0.rc0.799.gd6f94ed593-goog


