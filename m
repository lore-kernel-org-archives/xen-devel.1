Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31C9C5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:37:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385400.1627854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7eg-0007EM-U6; Thu, 06 Aug 2026 23:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385400.1627854; Thu, 06 Aug 2026 23:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7eg-0007EE-Qv; Thu, 06 Aug 2026 23:37:42 +0000
Received: by outflank-mailman (input) for mailman id 1385400;
 Thu, 06 Aug 2026 23:37:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3hhp1agYKCekdPLYUNRZZRWP.NZXiPY-OPgPWWTded.iPYacZUPNe.ZcR@flex--seanjc.bounces.google.com>)
 id 1ws7ef-0007C5-H1
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:37:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7ee-005Ba1-UG
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:37:40 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3hhp1agYKCekdPLYUNRZZRWP.NZXiPY-OPgPWWTded.iPYacZUPNe.ZcR@flex--seanjc.bounces.google.com>)
 id 6a751a9a-5cb7-0a2a0a5109dd-0a2a4507ada8-46
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:40 +0200
Received: from [209.85.216.70] (helo=mail-pj1-f70.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3hhp1agYKCekdPLYUNRZZRWP.NZXiPY-OPgPWWTded.iPYacZUPNe.ZcR@flex--seanjc.bounces.google.com>)
 id 6a751a87-b4ea-0a2a45070019-d155d846e5fb-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:40 +0200
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3811279d51aso4526963a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:40 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059399; x=1786664199; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yV4aOROKwLK4YUA2A0rPmI+8Xp1hkN/OxQzRiMqFKuI=;
        b=Ih1hwm2k2Rkv49kqy7aXuFUm2Xr7H64db2H163AG0uodO0EPKODbA/UZ9gKh/vbVRa
         L7RvN4RKp34VICoQbth75MJ6Ho5qE4meAjBT47lcThaGytdruq4eAwxHRM92nfgqfGdV
         8/YvWFinMeaRoN8hhYcFc/1tltLqp8ON6UdQ8BfcmV6HYhT9cKBQ7b4miGRaKiEp57NX
         fCvBEt3GvdmQPBsC/gpeYIrapXGHWxp1CHFforqky8RF6Wm1lI0OTnIcfnpMOfOmCmUF
         5kfkVa9AJFhok/xxtFiHF67887uP93mxqk3Wl4I2radt1HJwB+Ie0w4gyqUAmNKV9ZdI
         fQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059399; x=1786664199;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yV4aOROKwLK4YUA2A0rPmI+8Xp1hkN/OxQzRiMqFKuI=;
        b=sOFEGUFl9gEr415oPIh+wFA1es+LXUoAfSrs1n6KmEcrw+/dF7BuZDIJmEBdP8a5WC
         HpE1GHq3LlAPocBg9Ij4i/bTfFHurzCEEc+i6ToQka+Z0lWJCthe/FMeOWwurKS7y9Rg
         F8Qx2rm4hCoI13mRAhlwF+jSS9PunDaEspUHw0R3jawG92A/Oox/Fp7XqThXWkEDl0GZ
         17/jOIvVAkw/lPhhfKXwTA8Yh+NPsP73RgvihZLE937VrdRqDfQCftiUuxzqHT5Opi6E
         rz3QvDWKJyVlcNsMGW/jRkoOmPpOxZDUXLu045nrWJNq/kr+zFJv0iJWZ7Rj6dSVAg6B
         FMSA==
X-Forwarded-Encrypted: i=1; AHgh+RqgG2QEPKUv/06J2cXOQFFuJgbE6r+043DWTeAyT5KC0Z+6lovHhyBZ+8jiSvC4H0cKXeT3SieDv0s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTpzjEVN8Pj7cIjstv+vRD8nLBZQ587qjmTf61eUumsxtlWuoy
	DtkLAwaft0CFFi66/io9enMafqq6youWP/oU1DMWz7jwSRLDnrcjJN045MfjIgfpKL799tUYOoQ
	5RF/CdQ==
X-Received: from pjbqa7.prod.google.com ([2002:a17:90b:4fc7:b0:38e:bbd1:f3c8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c88e:b0:38e:488f:7068
 with SMTP id 98e67ed59e1d1-3903c5373b4mr20563002a91.2.1786059398528; Thu, 06
 Aug 2026 16:36:38 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:29 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-13-seanjc@google.com>
Subject: [PATCH v6 12/51] x86/acrn: Register TSC/CPU frequency callbacks iff
 frequency is actually in CPUID
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
X-purgate-ID: tlsNG-ef75cf/1786059400-360C5AE4-60DE75CB/13/0
X-purgate-type: clean
X-purgate-size: 1812

Register ACRN's TSC/CPU frequency overrides if and only if the exact TSC
frequency is actually provided in CPUID.  This will allow marking the TSC
as reliable as appropriate, and avoids relying on the caller to handle
"failure".

For all intents and purposes, no functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/acrn.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index ad8f2da8003b..dc71a6fdd461 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -19,6 +19,8 @@
 #include <asm/idtentry.h>
 #include <asm/irq_regs.h>
 
+static unsigned int acrn_tsc_khz_cpuid __initdata;
+
 static u32 __init acrn_detect(void)
 {
 	return acrn_cpuid_base();
@@ -26,13 +28,19 @@ static u32 __init acrn_detect(void)
 
 static unsigned int __init acrn_get_tsc_khz(void)
 {
-	return cpuid_eax(ACRN_CPUID_TIMING_INFO);
+	return acrn_tsc_khz_cpuid;
 }
 
 static void __init acrn_init_platform(void)
 {
 	/* Install system interrupt handler for ACRN hypervisor callback */
 	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_acrn_hv_callback);
+
+	acrn_tsc_khz_cpuid = cpuid_eax(ACRN_CPUID_TIMING_INFO);
+	if (acrn_tsc_khz_cpuid) {
+		x86_init.hyper.get_tsc_khz = acrn_get_tsc_khz;
+		x86_init.hyper.get_cpu_khz = acrn_get_tsc_khz;
+	}
 }
 
 static bool acrn_x2apic_available(void)
@@ -80,6 +88,4 @@ const __initconst struct hypervisor_x86 x86_hyper_acrn = {
 	.type			= X86_HYPER_ACRN,
 	.init.init_platform     = acrn_init_platform,
 	.init.x2apic_available  = acrn_x2apic_available,
-	.init.get_tsc_khz	= acrn_get_tsc_khz,
-	.init.get_cpu_khz	= acrn_get_tsc_khz,
 };
-- 
2.55.0.679.g6767b8d81c-goog


