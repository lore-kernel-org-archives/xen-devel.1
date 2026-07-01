Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E3BC43602
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:33:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350390.1607945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0g0-0003LP-MI; Wed, 01 Jul 2026 19:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350390.1607945; Wed, 01 Jul 2026 19:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fz-0003HJ-F9; Wed, 01 Jul 2026 19:32:51 +0000
Received: by outflank-mailman (input) for mailman id 1350390;
 Wed, 01 Jul 2026 19:32:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3XWtFagYKCaIUGCPLEIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@flex--seanjc.bounces.google.com>)
 id 1wf0fw-0002Zq-Md
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:32:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0fw-00Bw10-25
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:32:48 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3XWtFagYKCaIUGCPLEIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@flex--seanjc.bounces.google.com>)
 id 6a456b5c-bab6-0a2a0a5309dd-0a2a4504ab4a-6
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:48 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3XWtFagYKCaIUGCPLEIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@flex--seanjc.bounces.google.com>)
 id 6a456b5e-a01d-0a2a45040019-d155d6cab5e3-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:47 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2ca3b314193so12001835ad.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:47 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934366; x=1783539166; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3QmXXgqE7aLG5WH8n+yjrFm5ZX7gR61uwM9vT7lFOWU=;
        b=cIHGeXnNB/BmmH+GNcmRmrxqSuhPUsj4rCQu9OHYo8nq+taHAPy1A0NnRBiyLbAeLQ
         e8iNT/9c56Pow9zrTf45hz5c6BGBmoXg0r/6mw0PxdMSnkeP8y5hALC5mYxn7RoGvcCm
         HqeAg0D6sp0LEzpPOQJmIemL03OzzT8AI1UvGT9Mor66o9GA7Sr05XDEsI8ad5ZEZrYh
         crTA0MFmx7dQ269CIHMrJFJpgpZtUcZg7iGUIgXR7y9rGqz96JtlAJscmucRx3ma9hcA
         mgQpuO2aLqyFOhLbWcMRHUtE8fXdsKJS6NbHkR66LSenDnYLZcPA41yzxcqsN5nklsJn
         lmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934366; x=1783539166;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QmXXgqE7aLG5WH8n+yjrFm5ZX7gR61uwM9vT7lFOWU=;
        b=NMQBfi8lamVDkhs2TvQIzGfwVKIuLOvGwIUpvA5QmJjPNOjCehcN2mO1HhUKA6KEOP
         N9ZQn7eiLRiIeJMLjrnQ9ouEtLol2UG2dmXZYlyrDTJFXd1bOEXUN6U/KP88itBx+G9A
         MYIVIq2IujgXtrd8vS2fV0KiQXE9Z6n8FtarA+CWt2xj5SDnux3xgDB90avekxMwEYLU
         EWgZxC/EfAizAJWRjacN5zH50EMiqACrwLAzk1ryj9OdG7UMGgbwL20MhJ7ughkGiXqe
         FmqU6InIrqE9dZfVZ3CV2lyRGjrUXHuNnOrly9+mCB17bYNTLrHKMqoiy+IIoS5HYnKJ
         ymHQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1UIMDcp0ekQsnvBAx3GR/985S21Zdqagjeb0vAwLGgvhK56jxSEaPPpigzw8YiRpi5d2RMjt69Yg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQX2zbiNAQArbsfq2I2DsxiIuX44AgnmBWU5CueGw2cVDnAayN
	QtG9QesKZPCEvbQpblRkpHq1MaaoTnovODoB9dEG3+H9sJwoLt00DSUo6y7akV4WZ3APCVuMfO/
	Cq9bV1w==
X-Received: from plef18.prod.google.com ([2002:a17:902:f392:b0:2c7:eb53:9c06])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:944:b0:2ca:68b1:b64c
 with SMTP id d9443c01a7336-2ca7e75d694mr30967275ad.20.1782934365572; Wed, 01
 Jul 2026 12:32:45 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:37 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-17-seanjc@google.com>
Subject: [PATCH v5 16/51] x86/tsc: Rename pit_hpet_ptimer_calibrate_cpu() => native_calibrate_cpu_late()
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
X-purgate-ID: tlsNG-ebf023/1782934368-2C9AB1CC-B8F08058/0/0
X-purgate-type: clean
X-purgate-size: 1434

Rename the late CPU calibration routine so that its relationship to the
early routine is more obvious and intuitive.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index a877b82d0991..9764ac758081 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -752,7 +752,7 @@ static unsigned long cpu_khz_from_cpuid(void)
  * calibrate cpu using pit, hpet, and ptimer methods. They are available
  * later in boot after acpi is initialized.
  */
-static unsigned long pit_hpet_ptimer_calibrate_cpu(void)
+static unsigned long native_calibrate_cpu_late(void)
 {
 	u64 tsc1, tsc2, delta, ref1, ref2;
 	unsigned long tsc_pit_min = ULONG_MAX, tsc_ref_min = ULONG_MAX;
@@ -927,7 +927,7 @@ static unsigned long native_calibrate_cpu(void)
 	unsigned long tsc_freq = native_calibrate_cpu_early();
 
 	if (!tsc_freq)
-		tsc_freq = pit_hpet_ptimer_calibrate_cpu();
+		tsc_freq = native_calibrate_cpu_late();
 
 	return tsc_freq;
 }
@@ -1472,7 +1472,7 @@ static bool __init determine_cpu_tsc_frequencies(bool early,
 		else
 			tsc_khz = native_calibrate_tsc();
 	} else {
-		cpu_khz = pit_hpet_ptimer_calibrate_cpu();
+		cpu_khz = native_calibrate_cpu_late();
 	}
 
 	/*
-- 
2.55.0.rc0.799.gd6f94ed593-goog


