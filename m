Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76CBCD6E4A
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2026 14:51:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1322380.1588655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyYa-000809-8v; Fri, 29 May 2026 14:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322380.1588655; Fri, 29 May 2026 14:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyYa-0007zx-4b; Fri, 29 May 2026 14:51:28 +0000
Received: by outflank-mailman (input) for mailman id 1322380;
 Fri, 29 May 2026 14:51:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3gaYZagYKCYw8uq3zsw44w1u.s42Du3-tuBu11y898.Du3574zus9.47w@flex--seanjc.bounces.google.com>)
 id 1wSyYY-0007tP-Lm
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:51:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSyYY-00FwC8-2H
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 16:51:26 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3gaYZagYKCYw8uq3zsw44w1u.s42Du3-tuBu11y898.Du3574zus9.47w@flex--seanjc.bounces.google.com>)
 id 6a19a7e3-e002-0a2a0a5209dd-0a2a450883d6-22
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:51:26 +0200
Received: from [209.85.214.201] (helo=mail-pl1-f201.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3gaYZagYKCYw8uq3zsw44w1u.s42Du3-tuBu11y898.Du3574zus9.47w@flex--seanjc.bounces.google.com>)
 id 6a19a684-63b5-0a2a45080019-d155d6c9c055-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:25 +0200
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2bd6aeb3637so312732715ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 07:45:25 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780065923; x=1780670723; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=n/IQNTw72HzXqO6AWPqeABL90E8LQ8oyD69HI8J1qOQ=;
        b=ojBkpF6W2baqyTeNgqOxc/b5IlAvrH2Ty69XTLsARjbf7hs0DSekHij6xD5QIlK2JN
         tK5xO7xZfmz3HL681xzOgcreyQxr73jLPAY8Fjt00B3Upafx4/exVzNACqGMHb3Gt32N
         mJ2GHGVXINeLEATn+Tv9gyytN/FIe8edWEldphtwWDxbEGfPjr5kOySqcmxE7e2aL4Wp
         nulPHSIa6s0CTEj+S+DoA3ELvcLLzOCWwd0Zq5GIwNzRQr7C4i1RGYuv0E/BT9g4q7lF
         H8Dw8TLFdVFaH50t81JnqaS6O6uZOFm+aNgM0WlOtse+tPlatf8RTZRzoyT0/Z9yHTs7
         p7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065923; x=1780670723;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/IQNTw72HzXqO6AWPqeABL90E8LQ8oyD69HI8J1qOQ=;
        b=Z0Ae5tmPIRjs/7aa/W7udQ57CExp5ZCA5OfxS/Bxy4ivCM7lg0wRu30pVOecH8mVEO
         PIT54+Y7LwK6QysfU84Nb1vOtDxwZD9hSX6P/+dMqSmyttOTwfkfbZIba1+JE5CMpcGX
         2PWoX4mzpkKKy+08x3MmOmKbngUskdQZCM2Pj3j7CnYiEBzYbfE8fD/YaLWhzSfV/jeA
         MrEb8edp1BqKTbSl4DYb/07qVG2NpC7H8KX8/CXZTwhQ6IsJmUuhcZtnP/wgddPCHJD5
         DNVkPaWn9INTzwgxSuAP6iwl+LTIR3Ouen5bNCmc5gyJMECbxJYRNcH3Qaxz042Cc9j4
         wplA==
X-Forwarded-Encrypted: i=1; AFNElJ/Tons1n7rBM2wcanKbZV1JkPD5eB1JR8pjLz96EXwUJn2NiCWYAd2UMnCA12/lqoIP0fh3TZbDiFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxovQNdT2VafnzaaiZE7a9nzsj5R5GqJtOKGj0QtkvJaBB1MbC
	469sclVUk6nevLximkxtoNYsd1jUqk7RN/7Q+2NgJHLSH7p9My2ALW4eIhAZiGFnNLF8hy8QrFn
	m2J/L3w==
X-Received: from plbbj2.prod.google.com ([2002:a17:902:8502:b0:2bf:1b54:1fc4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:906:b0:2bf:13b6:dafd
 with SMTP id d9443c01a7336-2bf367ddeecmr1314895ad.18.1780065921988; Fri, 29
 May 2026 07:45:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:44:12 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-26-seanjc@google.com>
Subject: [PATCH v4 25/47] x86/kvmclock: Setup kvmclock for secondary CPUs iff CONFIG_SMP=y
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c1860d/1780065925-C5784DB1-194D7679/0/0
X-purgate-type: clean
X-purgate-size: 1438

Gate kvmclock's secondary CPU code on CONFIG_SMP, not CONFIG_X86_LOCAL_APIC.
Originally, kvmclock piggybacked PV APIC ops to setup secondary CPUs.
When that wart was fixed by commit df156f90a0f9 ("x86: Introduce
x86_cpuinit.early_percpu_clock_init hook"), the dependency on a local APIC
got carried forward unnecessarily.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 69a15fbfb779..13c728444e12 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -186,7 +186,7 @@ static void kvm_restore_sched_clock_state(void)
 	kvm_register_clock("primary cpu clock, resume");
 }
 
-#ifdef CONFIG_X86_LOCAL_APIC
+#ifdef CONFIG_SMP
 static void kvm_setup_secondary_clock(void)
 {
 	kvm_register_clock("secondary cpu clock");
@@ -326,7 +326,7 @@ void __init kvmclock_init(bool prefer_tsc)
 		x86_init.hyper.get_cpu_khz = kvmclock_get_tsc_khz;
 	x86_platform.get_wallclock = kvm_get_wallclock;
 	x86_platform.set_wallclock = kvm_set_wallclock;
-#ifdef CONFIG_X86_LOCAL_APIC
+#ifdef CONFIG_SMP
 	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
 #endif
 	x86_platform.save_sched_clock_state = kvm_save_sched_clock_state;
-- 
2.54.0.823.g6e5bcc1fc9-goog


