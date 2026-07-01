Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E8EC43327
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:33:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350378.1607908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0ft-0001yQ-J0; Wed, 01 Jul 2026 19:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350378.1607908; Wed, 01 Jul 2026 19:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0ft-0001xO-90; Wed, 01 Jul 2026 19:32:45 +0000
Received: by outflank-mailman (input) for mailman id 1350378;
 Wed, 01 Jul 2026 19:32:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3WGtFagYKCZ0PB7KG9DLLDIB.9LJUBK-ABSBIIFPQP.UBKMOLGB9Q.LOD@flex--seanjc.bounces.google.com>)
 id 1wf0fr-0001aG-GD
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:32:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0fq-009wqs-TH
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:32:42 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3WGtFagYKCZ0PB7KG9DLLDIB.9LJUBK-ABSBIIFPQP.UBKMOLGB9Q.LOD@flex--seanjc.bounces.google.com>)
 id 6a456b38-e002-0a2a0a5209dd-0a2a450cae0a-46
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:42 +0200
Received: from [209.85.210.201] (helo=mail-pf1-f201.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3WGtFagYKCZ0PB7KG9DLLDIB.9LJUBK-ABSBIIFPQP.UBKMOLGB9Q.LOD@flex--seanjc.bounces.google.com>)
 id 6a456b59-f399-0a2a450c0019-d155d2c9dd31-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:42 +0200
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-84622d6102dso1270894b3a.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:42 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934361; x=1783539161; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ReYT3wow7KWZM4WGFuJpCOGL6Ebh0IHq2felz3Yetls=;
        b=l9Lhx9UESF570Gz6ewNRjf8oOGu5ypXjoNYsvbTHNvSxUGSQXCJCjHnpBiIPNCGNNJ
         +7HCGa9bvp9YY8xxYH/UXHEgyN6mvCtBq5kqvcNcvvOWKnkpJvtRyjn4M200bM12rCie
         XBXAzBP82IosoWBuq62LXvUCjt3XMQgKT34OR4oDAoVJ5HhVBno5gGXGN5wrFGSt+23E
         N154zg3ixOX+PUSAkJcf4R2zc7qb516dG1oO+1Qtw1T275+V7tahqaBbN6eTxAyJzoIx
         uRuJs2zrhsf9YQYhXMV16F7zN7XWcbRRG8HHPcGS7ihFQIuIcueH1ITuvh0B+0CjquY2
         hGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934361; x=1783539161;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ReYT3wow7KWZM4WGFuJpCOGL6Ebh0IHq2felz3Yetls=;
        b=fZ2NW0hKGfQChF7anEk8dibRbQ7jgVSQSx0wC32E+mQmiegrs1gzD3Xpmtao67LfP6
         Jq4vIk/QoOKpXHmTZ9KvGVPZRyzvpkdpViLkNpsCt2Rksd27jjxXpvUR3jdrppv4LpZf
         PtGPtxO/ahBSv6eVtRg+wC4t4dUVPFkP9KKCssCvppmQsyIrzd3wCx4oq9/y1vm9pjxe
         H4zHDmlG1FdVHBD5ExLZ2Bx4DUrjC434j1FCsDUrRv2spL64jb8CeWE3QRRGClg7s0V8
         wFq51563Oa8uVCNP2kUlDl/XMa0IO6iZ/zcJf8lwmf8aznkT7ILhzU7bI/oxetwMoyyi
         VgsA==
X-Forwarded-Encrypted: i=1; AFNElJ+3wMICgmC7CG6fIRA0LgC3r/cnLo18/A7EdpwRuu2J9nfIfJW6qmaAbt/tWB/x3uWPPbSHRggdQtw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiWnhOOW2TeRL197MMAKwQQoFcx1kZNOTo+Pbmi+g4XBabT6Q7
	aFjGPGbeXEhL9kGuIqxiQnl7feOPX1UNftTy8AzgmZIaF3sWutoXrtNBrUrCux1LdCupKYyCvfj
	cFVyqSA==
X-Received: from pfwy27.prod.google.com ([2002:a05:6a00:1c9b:b0:842:8af7:db0d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9a6:b0:845:ccf1:49b6
 with SMTP id d2e1a72fcca58-847c51b72d4mr2049167b3a.45.1782934360386; Wed, 01
 Jul 2026 12:32:40 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:33 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-13-seanjc@google.com>
Subject: [PATCH v5 12/51] x86/acrn: Register TSC/CPU frequency callbacks iff
 frequency is actually in CPUID
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
X-purgate-ID: tlsNG-d25034/1782934362-A84A9D51-78A097DD/0/0
X-purgate-type: clean
X-purgate-size: 1816

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
2.55.0.rc0.799.gd6f94ed593-goog


