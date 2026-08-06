Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0ADC5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:41:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385494.1627998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7iK-0000Mf-Li; Thu, 06 Aug 2026 23:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385494.1627998; Thu, 06 Aug 2026 23:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7iK-0000Lt-Ej; Thu, 06 Aug 2026 23:41:28 +0000
Received: by outflank-mailman (input) for mailman id 1385494;
 Thu, 06 Aug 2026 23:41:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3sxp1agYKCRgG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 1ws7iI-0008T8-W7
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:41:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7iI-00EM9p-D4
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:41:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3sxp1agYKCRgG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 6a751b54-bab6-0a2a0a5309dd-0a2a450297c0-18
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:41:26 +0200
Received: from [209.85.215.199] (helo=mail-pg1-f199.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3sxp1agYKCRgG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 6a751ab4-6ca4-0a2a45020019-d155d7c7b07f-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:25 +0200
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-cb733fc5024so3799739a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:25 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059444; x=1786664244; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZEuUzNS+h+uJbnucj4BSLPHP7Njp50j+oXkHsgjPk/g=;
        b=L6L5D/GQ3gaL/LVb4vPxChzBzNid+DgXTN5AY8HZiN9dR+uGu6op0q1L8Q0GR21wd3
         rQ6AgC2JasMNQ0Ui75vzttHkhcOkXynjG8okz7vSWrV1ro5SMxw7QilFAUrOHRykWbjG
         H5F6npHvSPRyC6gmkfuGPbfRuHJciEanKtS7++SJxFDZI/6vOjJ6HMMFeUKI4LXbcHEK
         Wij7OqV6yM0U0tlUyrre4x6q7tf5gIchSsqCICTXRSE1PL8iMopd/wC1K9Suoq9EJjUD
         Iplv5T6lXlSr94GG1mu/z4JiMjcgXsnLIQy88NiJBBhM8Eh19iv4M7OmDNaklChYMbSV
         h/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059444; x=1786664244;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZEuUzNS+h+uJbnucj4BSLPHP7Njp50j+oXkHsgjPk/g=;
        b=KOyo6VN4wwQmVBmhR9zKHObQSuAzn1rQ4jXlYcpG7A2qBGyXpirqfvcxCRR6mgJaCA
         mgv+S2iwAIroB2jpVSzUYH4t38IiQk+MjV3AVXL3rgEw4lg0oHhR7NAb9gcVq8M0X+Hb
         nuck6YbcdbzXYMHkb8QuCUtLIkWKMdecwwYe5UztYKMkP1Jw8IS7Af1ViI6aluPuYbtn
         ex2S7g3s+OjGG4BLbNl4r5f8FNo9ob5YM/yvvQLh4NvoZc5y0slj2IMU16sqdY7e4GgP
         4NeJkrCWRQuL//1mdGYbHbFz5n4+qY1NDCXUjsDykV+YxYswfsbMd25Dqro7H0d7iKnN
         Zb1g==
X-Forwarded-Encrypted: i=1; AHgh+RpB54QCTu930IlnMc0AaUIMkXWEWb2PV2fhCrxjhOAqSvRmFdS/cZQhsJjtNXHI1msYth4xvnrGfxs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzrH40Sr805+PNleITevinm9W+lyRpTzwzuikwSoCyv4pNrqoSl
	QBxEHZ2/lQugKf/OO/mzZF4OvI7Hf0+w7kgPCOlIBwscj+WEo9c1PIyS8TYp14j6VDNBAFG0kwO
	j1WHCgg==
X-Received: from pgng29.prod.google.com ([2002:a63:375d:0:b0:c9a:c533:8329])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4309:b0:3c8:ead5:bf7b
 with SMTP id adf61e73a8af0-3cb85ded991mr21268446637.4.1786059443651; Thu, 06
 Aug 2026 16:37:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:36:05 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-49-seanjc@google.com>
Subject: [PATCH v6 48/51] x86/kvmclock: Use TSC for sched_clock if it's
 constant and non-stop
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
X-purgate-ID: tlsNG-720697/1786059446-67ABD2AC-0AC34026/13/0
X-purgate-type: clean
X-purgate-size: 2191

Prefer the TSC over kvmclock for sched_clock if the TSC is constant and
nonstop.  I.e. use the same criteria as tweaking the clocksource rating so
that TSC is preferred over kvmclock.  Per the below comment from
native_sched_clock(), sched_clock is more tolerant of slop than
clocksource; using TSC for clocksource but not sched_clock makes little to
no sense, especially now that KVM CoCo guests with a trusted TSC use TSC,
not kvmclock.

        /*
         * Fall back to jiffies if there's no TSC available:
         * ( But note that we still use it if the TSC is marked
         *   unstable. We do this because unlike Time Of Day,
         *   the scheduler clock tolerates small errors and it's
         *   very important for it to be as fast as the platform
         *   can achieve it. )
         */

The only advantage of using kvmclock is that doing so allows for early
and common detection of PVCLOCK_GUEST_STOPPED, but that code has been
broken for over two years with nary a complaint, i.e. it can't be
_that_ valuable.  And as above, certain types of KVM guests are losing
the functionality regardless, i.e. acknowledging PVCLOCK_GUEST_STOPPED
needs to be decoupled from sched_clock() no matter what.

Link: https://lore.kernel.org/all/Z4hDK27OV7wK572A@google.com
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 22e8855fcd4d..bc98ebb8587d 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -396,7 +396,6 @@ void __init kvmclock_init(bool prefer_tsc)
 			 PVCLOCK_TSC_STABLE_BIT;
 	}
 
-	kvm_sched_clock_init(stable);
 
 	if (!x86_init.hyper.get_tsc_khz)
 		x86_init.hyper.get_tsc_khz = kvmclock_get_tsc_khz;
@@ -416,6 +415,8 @@ void __init kvmclock_init(bool prefer_tsc)
 	 */
 	if (prefer_tsc)
 		kvm_clock.rating = 299;
+	else
+		kvm_sched_clock_init(stable);
 
 	clocksource_register_hz(&kvm_clock, NSEC_PER_SEC);
 	pv_info.name = "KVM";
-- 
2.55.0.679.g6767b8d81c-goog


