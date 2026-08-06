Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B91C5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:41:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385486.1627944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7hx-00074g-Tg; Thu, 06 Aug 2026 23:41:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385486.1627944; Thu, 06 Aug 2026 23:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7hx-00074Z-QB; Thu, 06 Aug 2026 23:41:05 +0000
Received: by outflank-mailman (input) for mailman id 1385486;
 Thu, 06 Aug 2026 23:41:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3nRp1agYKCQIugcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@flex--seanjc.bounces.google.com>)
 id 1ws7hw-000747-Hs
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:41:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7hv-008OCw-V3
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:41:03 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3nRp1agYKCQIugcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@flex--seanjc.bounces.google.com>)
 id 6a751b54-2eae-0a2a0a5409dd-0a2a4501e234-26
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:41:03 +0200
Received: from [209.85.210.200] (helo=mail-pf1-f200.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3nRp1agYKCQIugcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@flex--seanjc.bounces.google.com>)
 id 6a751a9e-5984-0a2a45010019-d155d2c8b455-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:03 +0200
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-848568a6f62so4588798b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:03 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059422; x=1786664222; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3J0zUIaWZrZleLZttsrL9ykC8Y4xnIiv8MkXpJdWFpw=;
        b=sdwf+hdnPk8M/0AF0lBHccc4p6Y9Ik5dPM0XPEuzGms0GaXsNtIfI+xnYuATdYKmb1
         FVLtZTBP+pT40BUnlVkYj39XCkQcHw82Z2kVKGZIQHyDjlo2WpS/OB0exHrfHo4/7/xR
         fMjCoM52OmQC0E0mubLNOJ9cuSx0upgRK1Fgg1H8KYRqyonpSQ5C59fWOB42h/m4adHw
         DbbrBmaNjW/PA5yD8HNI+lCEiQAh4T36yIIUcVHvbsUV3X4LvGm+dMH+CP0UMdLLHTpC
         8EmXFPJR/A30ajTM9BeOypvgqBzowb8Y+IUX2DptsN0CQYmKUn4fdtTaJYjFa8ipN97i
         Js/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059422; x=1786664222;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3J0zUIaWZrZleLZttsrL9ykC8Y4xnIiv8MkXpJdWFpw=;
        b=NVHMznmnYgi0wOicAkbFPXv0iJQmb3kCDTRWe+FKMHYfl0TmBSiQsVyq1Gx1dbUmAD
         F6+kgSNudSRlfTw+Lv+pUfmxttaKMAc0cRdFis3rC9JC1bkZr7intzl4u15CzyRYtafk
         8LpgYy6RHr2kS67Fh4paFLIzQbd/SCONiWqtXZXOwGsNO0OWaKgBXxyffB1nmZRz0WUk
         TuguapvyG+JsEkfjo0pG/91Dsa0hNPeZ5uSKvP9MaOHIZo50D9Ih6J7hv0CnsQXz5I6J
         9qn8VvUAGH6KtLiFYUiXuARLSIPTupbQjq5t0bxxN9wXFUE6/TdSBeLXcr8yitkLFOTM
         zRhA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/0aATLLG60Lft9v7prygMxyoV1MIY05jSP4Bc366Lb/RP42jxF+cNXHgvYWXB7VxAw9073VfR12g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyM6Q3s+hYRWJywn4pvHxrY3Wj+lUsnhbHUfsyi0Kgnoz5XrDr9
	kCbqNCoQcMiYD4jzIu2YGYiHIU0IQEluTC2nCKLDDPw/AvRix6tcQ3yerE56OleYg5qZchdUOu4
	BPfNa3g==
X-Received: from pfbcz13.prod.google.com ([2002:aa7:930d:0:b0:848:2e05:6161])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a58f:b0:848:3fe2:c88b
 with SMTP id d2e1a72fcca58-84f2dfc8fa4mr23126519b3a.6.1786059421552; Thu, 06
 Aug 2026 16:37:01 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:47 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-31-seanjc@google.com>
Subject: [PATCH v6 30/51] x86/paravirt: Remove unnecessary PARAVIRT=n stub for paravirt_set_sched_clock()
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
X-purgate-ID: tlsNG-d62444/1786059423-C475B757-413D17DB/0/0
X-purgate-type: clean
X-purgate-size: 1570

Remove the unnecessary paravirt_set_sched_clock() stub for PARAVIRT=n, as
all callers are gated by PARAVIRT=y.  Eliminating the stub will avoid a
pile of pointless churn as the "real" implementation evolves.

No functional change intended.

Fixes: 39965afb1151 ("x86/paravirt: Move paravirt_sched_clock() related code into tsc.c")
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 3 +++
 arch/x86/kernel/tsc.c        | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index fda18bcb19b4..c71b466d6ace 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -12,7 +12,10 @@ extern void recalibrate_cpu_khz(void);
 extern int no_timer_check;
 
 extern bool using_native_sched_clock(void);
+
+#ifdef CONFIG_PARAVIRT
 void paravirt_set_sched_clock(u64 (*func)(void));
+#endif
 
 /*
  * We use the full linear equation: f(x) = a + b*x, in order to allow
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 4c5328d19ebe..e0bea58b6658 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -288,7 +288,6 @@ void paravirt_set_sched_clock(u64 (*func)(void))
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
 
 bool using_native_sched_clock(void) { return true; }
-void paravirt_set_sched_clock(u64 (*func)(void)) { }
 #endif
 
 notrace u64 sched_clock(void)
-- 
2.55.0.679.g6767b8d81c-goog


