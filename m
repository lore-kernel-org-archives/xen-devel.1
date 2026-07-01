Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E61C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:35:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350669.1608230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iY-0002Fd-Uw; Wed, 01 Jul 2026 19:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350669.1608230; Wed, 01 Jul 2026 19:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iY-0002DX-Jx; Wed, 01 Jul 2026 19:35:30 +0000
Received: by outflank-mailman (input) for mailman id 1350669;
 Wed, 01 Jul 2026 19:35:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3hmtFagYKCcs9vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--seanjc.bounces.google.com>)
 id 1wf0iY-000268-1S
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:35:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0iX-003oUT-EB
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:35:29 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3hmtFagYKCcs9vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--seanjc.bounces.google.com>)
 id 6a456bf3-e002-0a2a0a5209dd-0a2a450484fc-28
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:35:29 +0200
Received: from [209.85.216.74] (helo=mail-pj1-f74.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3hmtFagYKCcs9vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--seanjc.bounces.google.com>)
 id 6a456b87-a01d-0a2a45040019-d155d84aec65-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:33:29 +0200
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-380a638fb5bso818894a91.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:33:28 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934407; x=1783539207; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BBdglu7Hd/NWIo80QzRStfEHhLuTnQAY4zgBWN5WaBQ=;
        b=jc2ZPFfFL3VHNSXDjsIuCDmBbhn10cDWcvWpfI+pYjHvbJkfZE7gyuAzXDYT1MVC4B
         UjkmL9GD9ZW/rjozdXbOnLVYi3WKc8DHlWMDxVDhyyzQxjrasnsXleuUgGtT5bM8IXfv
         sAuWo3kEX6Izb++Ay7HMIvuf2wK4RvZPgGRbyvZutVd7cHSVSafYwUr5TKNrh/nMQmaV
         W5RvRUF1QHvUPx+e0kmX4H/jp0YsWNgb3PBQhDhQbd9PTYLsaXAZlfVykTliqhjqUJLW
         f7eXFMshdXDodLzDYVQ+VDhZN6rDDuUQbL8I/zj2ii6mnfq4b7g4o7+KXRrgvesXCMMn
         /Z2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934407; x=1783539207;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BBdglu7Hd/NWIo80QzRStfEHhLuTnQAY4zgBWN5WaBQ=;
        b=pQRQxRYHwLJuchGbIl34J3W+155xrW7loBMjNXC3tAgMkBHUdrezZ1kcbU12o9AR4T
         xaFIBXljC86gRzavp+NZQRyAi6hCQWcJBlBIk5+8vD02sla4pUCQPzrCUiHEc9//ogbJ
         3ijdwdAYEDdo/qf1ND3H+weHfaoheFBi/MT6ArTbWvg3BuuUK7EJHUjZyCN4EEzB8K+l
         DtEzFugctEkGyznmmE5bGopo0lJGlFRONK2MmFUiw46KHDqrqVl4bhkIMUjXHl3qa7hP
         Fsp7n2MFCf4qIk0mwCCw1sHOQ+J2Pd7tZmXFXLm6yjEK6sNrzKl1IhG0bj/fAmk3I0Rt
         eBTQ==
X-Forwarded-Encrypted: i=1; AHgh+RqeHtLfCthZGbujIAkUVxn+8jCsjo1bQAKh84SWIJeHnJiQxKt1IcJH/Mk/Z/g6l4SX14vA545G4NI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqOEP+5zHE/acWYEioNc3+Un/4oYk+O3ST8kkKIdYdl41S4WWk
	E+kxT72Y1eaI1JStWXdlLLvgTxU0gPRAroebyflg0e+aIa0EUwDrFDWqd0V+Vxl3DkIUsWl+1vd
	SmIAhcA==
X-Received: from pjbmt23.prod.google.com ([2002:a17:90b:2317:b0:380:79f2:a916])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3a47:b0:37e:2005:6507
 with SMTP id 98e67ed59e1d1-380ba84865cmr1899432a91.15.1782934406994; Wed, 01
 Jul 2026 12:33:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:32:11 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-51-seanjc@google.com>
Subject: [PATCH v5 50/51] x86/paravirt: Move using_native_sched_clock() stub
 into timer.h
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
X-purgate-ID: tlsNG-ebf023/1782934409-ADB331CC-A683ADBA/13/0
X-purgate-type: clean
X-purgate-size: 1714

Now that timer.h ended up with CONFIG_PARAVIRT #ifdeffery anyways, move the
PARAVIRT=n using_native_sched_clock() stub into timer.h as a "free"
optimization.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 6 ++++--
 arch/x86/kernel/tsc.c        | 2 --
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index ca5c95d48c03..a52388af6055 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -11,9 +11,9 @@ extern void recalibrate_cpu_khz(void);
 
 extern int no_timer_check;
 
-extern bool using_native_sched_clock(void);
-
 #ifdef CONFIG_PARAVIRT
+extern bool using_native_sched_clock(void);
+
 int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 				      void (*save)(void), void (*restore)(void));
 
@@ -23,6 +23,8 @@ static __always_inline void paravirt_set_sched_clock(u64 (*func)(void),
 {
 	(void)__paravirt_set_sched_clock(func, true, save, restore);
 }
+#else
+static inline bool using_native_sched_clock(void) { return true; }
 #endif
 
 /*
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index a146fc7b5e74..564be4faa5a0 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -302,8 +302,6 @@ int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 }
 #else
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
-
-bool using_native_sched_clock(void) { return true; }
 #endif
 
 notrace u64 sched_clock(void)
-- 
2.55.0.rc0.799.gd6f94ed593-goog


