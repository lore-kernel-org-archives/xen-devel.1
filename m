Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262B9C5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:41:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385489.1627962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7iB-0007dy-Bx; Thu, 06 Aug 2026 23:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385489.1627962; Thu, 06 Aug 2026 23:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7iB-0007dr-8a; Thu, 06 Aug 2026 23:41:19 +0000
Received: by outflank-mailman (input) for mailman id 1385489;
 Thu, 06 Aug 2026 23:41:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3qxp1agYKCRA8uq3zsw44w1u.s42Du3-tuBu11y898.Du3574zus9.47w@flex--seanjc.bounces.google.com>)
 id 1ws7iA-0007d6-HU
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:41:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7i9-008OCw-Ue
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:41:17 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3qxp1agYKCRA8uq3zsw44w1u.s42Du3-tuBu11y898.Du3574zus9.47w@flex--seanjc.bounces.google.com>)
 id 6a751b54-2eae-0a2a0a5409dd-0a2a4501e234-32
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:41:17 +0200
Received: from [209.85.210.198] (helo=mail-pf1-f198.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3qxp1agYKCRA8uq3zsw44w1u.s42Du3-tuBu11y898.Du3574zus9.47w@flex--seanjc.bounces.google.com>)
 id 6a751aac-5984-0a2a45010019-d155d2c6c949-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:17 +0200
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-84870e7f498so2971196b3a.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:17 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059436; x=1786664236; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DfVsK4/eNAzlqgTkif/k+3bkJqkVsqeG8riFv7GGWx4=;
        b=bSzLM4/00PB1CxAEp+IcCxGjD269tSdqycIW8zekVxv/OHABbdfOVwmR21q1fU72Gu
         xWG0asr0bVIqogTS9CAp6hKw4Er6job4QcWphqUaAqrJ0v7w6tRDhsDApgiFWux61LeX
         Xo/m5u6OdwsRkK2gk3Dch3TrdC26HLeGXmarzNiFFDuZzTlpAWYM8z8V4QuTOaIUqkst
         bbycINGQ8Ttc51/A8YmosKo2uXXY/uapTFHHq6kwSDhuq5LDu4MPqYcRusVZYQAKoBgN
         uneXgX8i+tn9c8fvpfzzrevbid5x45eHtze6qLRYT6Ycz/l+Qw34saXgBiS3demKloU1
         0AjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059436; x=1786664236;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DfVsK4/eNAzlqgTkif/k+3bkJqkVsqeG8riFv7GGWx4=;
        b=XrVylOJaUFaH0HD4BLoBkL3anAzv6QnXRw5rM+invhm9YL5q82TSoWSEHTmomyfN3Q
         fs0bBCTEhLngJXrhkkdAeRyYbJKqBOy2V6tC9NvanuOrnL1AZ/tfyM/A0PPe5tIyMojf
         L+b5YZQLhkrmeUrzAN3Ke5w2OVK/piztWuNhhOP53qD2XYV1kC2IMcNvrDuM7ynfElD7
         JlBx9lceW4gsYddXOBhCeSd4kM6k2T7wxtUTA/+J6NOLiBD5KCjGCQjyA6RM9jzJGLvr
         zpebVJ9P9+OcnljFBxpnA397F3k8rqWUFPeGnonU28iK7HRU3PU4PCusoJ+ElMW/JfR1
         fP5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqN63UmZBGi/fEqUt03MJMG0USpSWvFIAbBWzGc4OV0SsVESxCMx6wxFHZjbyv67FT6xZIsMzWALJM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/9uVhU+JKFAssWnuBEDzjoWO4GAPzDlcrI7lO0hCWV5wtzuUT
	Akdecpif2+7spua3OfUM2dnTtoxFc/CDZlSNZMij3vUNCvw8UeGVo8fEBNk08Z8HZL99SROAT/D
	3P7nMdA==
X-Received: from pfbko19.prod.google.com ([2002:a05:6a00:4613:b0:847:926b:dc17])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1886:b0:847:99a7:c751
 with SMTP id d2e1a72fcca58-84f2e05d02dmr18083285b3a.25.1786059435385; Thu, 06
 Aug 2026 16:37:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:58 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-42-seanjc@google.com>
Subject: [PATCH v6 41/51] x86/kvmclock: Refactor handling of
 PVCLOCK_TSC_STABLE_BIT during kvmclock_init()
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
X-purgate-ID: tlsNG-d62444/1786059437-BF063757-6D3BDBFE/0/0
X-purgate-type: clean
X-purgate-size: 1894

Clean up the setting of PVCLOCK_TSC_STABLE_BIT during kvmclock init to
make it somewhat obvious that pvclock_read_flags() must be called *after*
pvclock_set_flags().

Note, in theory, a different PV clock could have set PVCLOCK_TSC_STABLE_BIT
in the supported flags, i.e. reading flags only if
KVM_FEATURE_CLOCKSOURCE_STABLE_BIT is set could very, very theoretically
result in a change in behavior.  In practice, the kernel only supports a
single PV clock.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 5220d205abc7..61d4d943fe74 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -327,7 +327,7 @@ static __init void kvm_sched_clock_init(bool stable)
 
 void __init kvmclock_init(bool prefer_tsc)
 {
-	u8 flags;
+	bool stable = false;
 
 	if (!kvm_para_available() || !kvmclock)
 		return;
@@ -354,11 +354,18 @@ void __init kvmclock_init(bool prefer_tsc)
 	kvm_register_clock("primary cpu clock");
 	pvclock_set_pvti_cpu0_va(hv_clock_boot);
 
-	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE_STABLE_BIT))
+	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE_STABLE_BIT)) {
 		pvclock_set_flags(PVCLOCK_TSC_STABLE_BIT);
 
-	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
-	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
+		/*
+		 * Check if the clock is stable *after* marking TSC_STABLE as a
+		 * valid flag.
+		 */
+		stable = pvclock_read_flags(&hv_clock_boot[0].pvti) &
+			 PVCLOCK_TSC_STABLE_BIT;
+	}
+
+	kvm_sched_clock_init(stable);
 
 	if (!x86_init.hyper.get_tsc_khz)
 		x86_init.hyper.get_tsc_khz = kvmclock_get_tsc_khz;
-- 
2.55.0.679.g6767b8d81c-goog


