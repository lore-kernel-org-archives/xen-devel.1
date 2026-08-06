Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9CEC5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:37:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385295.1627792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dr-0001tl-CF; Thu, 06 Aug 2026 23:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385295.1627792; Thu, 06 Aug 2026 23:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dr-0001so-2g; Thu, 06 Aug 2026 23:36:51 +0000
Received: by outflank-mailman (input) for mailman id 1385295;
 Thu, 06 Aug 2026 23:36:49 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3jhp1agYKCfElXTgcVZhhZeX.VhfqXg-WXoXeeblml.qXgikhcXVm.hkZ@flex--seanjc.bounces.google.com>)
 id 1ws7dp-0001fJ-7C
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:36:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7do-00GcaU-KN
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:36:48 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3jhp1agYKCfElXTgcVZhhZeX.VhfqXg-WXoXeeblml.qXgikhcXVm.hkZ@flex--seanjc.bounces.google.com>)
 id 6a751a70-bab6-0a2a0a5309dd-0a2a450ae97a-20
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:48 +0200
Received: from [209.85.210.198] (helo=mail-pf1-f198.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3jhp1agYKCfElXTgcVZhhZeX.VhfqXg-WXoXeeblml.qXgikhcXVm.hkZ@flex--seanjc.bounces.google.com>)
 id 6a751a8f-f2d2-0a2a450a0019-d155d2c6c9e2-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:48 +0200
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-84870e7f498so2970699b3a.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:48 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059406; x=1786664206; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bafmbn4x7WGy8QY/EzYypINgs3wQBC6UPHmanD+knFs=;
        b=rNz8Q677rJoZ53N2qPQKXwQ4hihCKOhYUY0cOKrxQCTX9Sv4UtbSK8zEcLdS0x5dOx
         T2xb4CBhnfLY02gHuc07ZH71Rypw4KgmKocMe3LutsWkBY7sd2SvJfZVO7YEUjrsk6z4
         u99+lEP4h5AmoxeFSSxhmvlf0HvdDsByL5MtKQh56Q8TT9dh5tlh9EzPE/0YMtZAjrmK
         vzKEYupH+3jWbRaHa8ItwDpPi5WcyBqPz8cS/v6hmBbkfL9yGpeiXEF8+7v5DnhkRURZ
         PQppwq2wiGHAiKAFR0i3ptxJdVBoW9BPr52oompLchMKyuj1pMlIOaDCjeauPxlg5Qfj
         ZYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059406; x=1786664206;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bafmbn4x7WGy8QY/EzYypINgs3wQBC6UPHmanD+knFs=;
        b=II875WJVKpdRzEtpR9yD6JVz+pW1GHLdCAI9iFgnHvB1YdY8igW6zLYZqsrC+1YbwB
         zbyv158JDlaECfww9tySMqLS2PwLsn9KoEfwtK1lrYTnXi2z6PriwJKfO9Iqf0tZePzo
         bhWlAePf3AH5yoWs2UDeE3Q/RId268AJBB7SoJZfvZNhVh4v5Y+IUzrR2CA2JjeV8zqG
         9zBSX7r54rng+Y/kSCBRN61q9uvFTzeqDxEv9EduFituVavHZbnbb3Y2tS94PNBl2cRE
         /uLU71mxHlloRC+Dm3D8evJ0fhbgzD9Rgz9YWLRF1wxijrcbSxcMFuo36ygEKwtXBhVF
         IOnQ==
X-Forwarded-Encrypted: i=1; AHgh+RobKBeDVUH67WbiI62fAP+DbH0Fk7wnF9ceDVzVwsow4+YpSzzZUKPUETs/VJnsA8+RKjzlLrTGoPI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcAlwINBmIij8UKpae1EU5T2tNBB5l0GSpxfDrOCNP0zXwuxyX
	wepC5m2ge3NMUfmQRybnoEicQ+q6l5hr9ubCbNBQ5uJdaDsXxknxE3gcOPXl959ifSkIKupHQD4
	Z9ti3UA==
X-Received: from pfks7.prod.google.com ([2002:a05:6a00:1947:b0:84e:2400:dc7d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:409b:b0:842:5b63:6112
 with SMTP id d2e1a72fcca58-84f2e12d036mr22581852b3a.32.1786059406261; Thu, 06
 Aug 2026 16:36:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:35 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-19-seanjc@google.com>
Subject: [PATCH v6 18/51] x86/kvmclock: Rename kvm_get_tsc_khz() to kvmclock_get_tsc_khz()
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
X-purgate-ID: tlsNG-4011c0/1786059408-508CDCFC-68200CFA/0/0
X-purgate-type: clean
X-purgate-size: 1630

Rename kvm_get_tsc_khz() to kvmclock_get_tsc_khz() in anticipation of
adding support for getting TSC info from PV CPUID, i.e. in a KVM specific
way, but without non-kvmclock.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 35a879d33e9e..061a22d31dea 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -136,7 +136,7 @@ static inline void kvm_sched_clock_init(bool stable)
  * poll of guests can be running and trouble each other. So we preset
  * lpj here
  */
-static unsigned int __init kvm_get_tsc_khz(void)
+static unsigned int __init kvmclock_get_tsc_khz(void)
 {
 	return pvclock_tsc_khz(this_cpu_pvti());
 }
@@ -146,7 +146,7 @@ static void __init kvm_get_preset_lpj(void)
 	unsigned long khz;
 	u64 lpj;
 
-	khz = kvm_get_tsc_khz();
+	khz = kvmclock_get_tsc_khz();
 
 	lpj = ((u64)khz * 1000);
 	do_div(lpj, HZ);
@@ -342,8 +342,8 @@ void __init kvmclock_init(void)
 	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
 	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
 
-	x86_init.hyper.get_tsc_khz = kvm_get_tsc_khz;
-	x86_init.hyper.get_cpu_khz = kvm_get_tsc_khz;
+	x86_init.hyper.get_tsc_khz = kvmclock_get_tsc_khz;
+	x86_init.hyper.get_cpu_khz = kvmclock_get_tsc_khz;
 	x86_platform.get_wallclock = kvm_get_wallclock;
 	x86_platform.set_wallclock = kvm_set_wallclock;
 #ifdef CONFIG_X86_LOCAL_APIC
-- 
2.55.0.679.g6767b8d81c-goog


