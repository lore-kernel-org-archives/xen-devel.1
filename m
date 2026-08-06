Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4F0C5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:39:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385450.1627907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7gi-0003vs-Rp; Thu, 06 Aug 2026 23:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385450.1627907; Thu, 06 Aug 2026 23:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7gi-0003vl-Ot; Thu, 06 Aug 2026 23:39:48 +0000
Received: by outflank-mailman (input) for mailman id 1385450;
 Thu, 06 Aug 2026 23:39:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3jRp1agYKCfAkWSfbUYggYdW.UgepWf-VWnWddaklk.pWfhjgbWUl.gjY@flex--seanjc.bounces.google.com>)
 id 1ws7gi-0003u5-6G
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:39:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7gh-008O38-Jc
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:39:47 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3jRp1agYKCfAkWSfbUYggYdW.UgepWf-VWnWddaklk.pWfhjgbWUl.gjY@flex--seanjc.bounces.google.com>)
 id 6a751b32-2eae-0a2a0a5409dd-0a2a4506abfa-14
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:39:47 +0200
Received: from [209.85.214.197] (helo=mail-pl1-f197.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3jRp1agYKCfAkWSfbUYggYdW.UgepWf-VWnWddaklk.pWfhjgbWUl.gjY@flex--seanjc.bounces.google.com>)
 id 6a751a8d-195a-0a2a45060019-d155d6c5bdc7-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:47 +0200
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cca3673560so40738305ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:46 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059405; x=1786664205; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=as+YzjPRM0DAZztxhbx3Raa/ax9+dW0ZzZ4Dw8q0B68=;
        b=kWfa/AsaHAaOPijm2y8OJA5bnjUNwAVvFc2FCCHiOfYHYxYau4I6t8DRERbCxhIL4C
         KovV1Z8rv7f09cwCN1BvnhH4b3oWB7BoQh55xgPJeL2h+QLJ2l3zdMfnFcalfOCo0anO
         qkqCbCpddeWtMMBR+h1FXUrf9rlvHIgy0rmidcqkQ6k+zJ6krhnmQB965ZaXrgSGb6sr
         /GOkVO5X79wL4eOWSgYalsbg6nDCq11U5wvKuaPoq1sbInlElaBOiQCgwwBWHfBFMS4/
         P9plgmNFfGKUJ5ZI5E7j/n2+wNAm82UHzxOCSTV9N02X+RN/YLFbufdo4SiWuou174QN
         HSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059405; x=1786664205;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=as+YzjPRM0DAZztxhbx3Raa/ax9+dW0ZzZ4Dw8q0B68=;
        b=YsjkKpmc+hwYoRm2sRI8yyrzGzIi6OFaYv9Uz5tzQmyqzVZrs+kKDCGdVqn2MOrQSd
         I7vvkAnTE/LbanNsKkeZVzSexKQd3GnbIGCLudEXHydapG7dghd6WzrHBsvg1OUV9dy7
         5DBKPyOg30m9xmyT8YPnYKyEORw38Gn3Plx9XT88iwhaOdTdxCjd8r/bF4n49yXizc/p
         cwjxiAL9CHDQX9Y1V7WAsN1PTGY+4TmsvGjnM58b+7RhGeGkKl5lwopNwzICKDvDLSDS
         SM5d0MPGX8HyxtpmcraqdmnJGg+XJOSGJ3dtY1zaWJz2qqLHdB7RHtNvrZEXJcz4K8qx
         LCzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr23BhP8yqt3AE8tmwpbtvsCxCIS5h2cCbWiDFz+BNtwF467ylp3uWFWdfXrsEPBitN+P84Jnb2ey0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyoPnfZX8rSbjTwnrsPo/Q7m4CxCOWswD/LEEf9HHUj/GzEqpsg
	LKzo2X06eTIIfiyWR68N0aqm0/CqjpPzJNzCXJRvYjrta3EBOiWZ/Op/ZxhTARK+EBlye9Cfs4c
	RrXEbHA==
X-Received: from plblh12.prod.google.com ([2002:a17:903:290c:b0:2cf:277e:c60c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f708:b0:2ba:6518:a6d4
 with SMTP id d9443c01a7336-2d0ca9624bdmr224800085ad.20.1786059405010; Thu, 06
 Aug 2026 16:36:45 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:34 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-18-seanjc@google.com>
Subject: [PATCH v6 17/51] x86/tsc: Fold native_calibrate_cpu() into recalibrate_cpu_khz()
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
X-purgate-ID: tlsNG-16d1c6/1786059407-1ECC577B-EE81E4AE/0/0
X-purgate-type: clean
X-purgate-size: 1493

Fold the guts of native_calibrate_cpu() into its sole remaining caller,
recalibrate_cpu_khz() to eliminate the extra SMP=n #ifdef, and so that it's
more obvious that directly invoking the early vs. late calibration routines
in determine_cpu_tsc_frequencies() is intentional.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index dd9e04e325d6..d95e4f059f17 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -918,21 +918,6 @@ static unsigned long native_calibrate_cpu_early(void)
 	return fast_calibrate;
 }
 
-#ifndef CONFIG_SMP
-/**
- * native_calibrate_cpu - calibrate the cpu
- */
-static unsigned long native_calibrate_cpu(void)
-{
-	unsigned long tsc_freq = native_calibrate_cpu_early();
-
-	if (!tsc_freq)
-		tsc_freq = native_calibrate_cpu_late();
-
-	return tsc_freq;
-}
-#endif
-
 void recalibrate_cpu_khz(void)
 {
 #ifndef CONFIG_SMP
@@ -944,7 +929,9 @@ void recalibrate_cpu_khz(void)
 	if (WARN_ON_ONCE(cpu_feature_enabled(X86_FEATURE_TSC_KNOWN_FREQ)))
 		return;
 
-	cpu_khz = native_calibrate_cpu();
+	cpu_khz = native_calibrate_cpu_early();
+	if (!cpu_khz)
+		cpu_khz = native_calibrate_cpu_late();
 	tsc_khz = native_calibrate_tsc();
 	if (tsc_khz == 0)
 		tsc_khz = cpu_khz;
-- 
2.55.0.679.g6767b8d81c-goog


