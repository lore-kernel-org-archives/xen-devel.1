Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC325C5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:42:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385561.1628079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7ir-0004Kt-Rc; Thu, 06 Aug 2026 23:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385561.1628079; Thu, 06 Aug 2026 23:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7ir-0004KJ-MX; Thu, 06 Aug 2026 23:42:01 +0000
Received: by outflank-mailman (input) for mailman id 1385561;
 Thu, 06 Aug 2026 23:42:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3mRp1agYKCfwwierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 1ws7iq-00047c-QD
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:42:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7iq-00EMFx-6l
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:42:00 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3mRp1agYKCfwwierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 6a751ba5-2eae-0a2a0a5409dd-0a2a450a9b14-20
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:42:00 +0200
Received: from [209.85.215.198] (helo=mail-pg1-f198.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3mRp1agYKCfwwierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 6a751a9a-f2d2-0a2a450a0019-d155d7c6c01f-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:59 +0200
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cb5ea36f969so2798106a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:59 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059418; x=1786664218; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=heSuqSIgeH92pLRWbhNi7GYX8HqrNShkMIs22IEn4aI=;
        b=BIIBZnGlGffTWkDS2scCLpiOfDiJwvzTr6PGVhYlq5AWmczdDm77AuAqCHdUnGwYy4
         5OyTPcurT16+KqdtBumy4hMZl5SyOOz2Mw8Nc3InEtinjV7pXtBL4+jKFsqmrY8/FOY3
         qfpTtHc4jDWhZ5ACkz03AFX842sVVG0PtfgVVIRF9kwnnwfrgtpZuBSyLuR9BMrQvDMF
         YOG8B3YhzYawkabeweEikBblZRovSFbBBDTdU39Z30qHe2JNCte2+RWThgpBZXcVCtTg
         4QpAPX7NksJsSX7SrDmyMkCSLS8VZKtx/gX16eABXyC+cauiq7mVZmuT92OWSN2r4bX6
         1M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059418; x=1786664218;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=heSuqSIgeH92pLRWbhNi7GYX8HqrNShkMIs22IEn4aI=;
        b=iAWT92RYLqG13YCmWmpW9XhFdiP4+c+9Cn7u1bL6xjcIsrDF/2HHrSYqMH6vkR6P0U
         wYJzNOQlfBuLcS3kRjnRbcom3O5Mw3px7J6f3TVcDymh4bcTp+WNaCDEutfNuKY2oInX
         /z1IzssBuy+x5Et5UtD1aIyqLvFzcl2nNhTizJArKSQBZSk8aM75U4/fBr8oCY0ke8/W
         wo3rIsSdV2M8+/d6FrSsHJlAowvi9GmbKt5nNDsLLKaMktbU8jJUNXxI6+bxUBEw8WG3
         BFU6Zw5Y218/WHM/RG4C/EAevYDwB7p5oBWw62tE+2CUgGZR6Y1jRK58T821/ja/ZBZc
         s4+g==
X-Forwarded-Encrypted: i=1; AHgh+RqFGQC/U1F3YCDAg55dZZxzVIhwM//TJfBnQcKfSVifl3VwUbrPPMunizee48H/7Pw8sC4oWv0tqng=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2Tt27bUjjFV2olajzLngT9jWedYJ8l2zjis5HW0WkQWR9em0Z
	RIQCevI+FwIEaVON8aRop6W6pRnAGkg/cfwk4yZQx8HRqhicMn+yB/bDrEDHaLG2nVIG4+FQ/zi
	gCL8aHw==
X-Received: from pgmc19.prod.google.com ([2002:a63:1c53:0:b0:c98:2639:852e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7344:b0:3bf:6acf:2940
 with SMTP id adf61e73a8af0-3cb85df0a1bmr20575846637.11.1786059417589; Thu, 06
 Aug 2026 16:36:57 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:44 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-28-seanjc@google.com>
Subject: [PATCH v6 27/51] clocksource: hyper-v: Don't save/restore TSC offset
 when using HV sched_clock
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
X-purgate-ID: tlsNG-4011c0/1786059419-591C5CFC-42B8086B/0/0
X-purgate-type: clean
X-purgate-size: 2763

Now that Hyper-V overrides the sched_clock save/restore hooks if and only
sched_clock itself is set to the Hyper-V reference counter, drop the
invocation of the "old" save/restore callbacks.  When the registration of
the PV sched_clock was done separately from overriding the save/restore
hooks, it was possible for Hyper-V to clobber the TSC save/restore
callbacks without actually switching to the Hyper-V refcounter.

Enabling a PV sched_clock is a one-way street, i.e. the kernel will never
revert to using TSC for sched_clock, and so there is no need to invoke the
TSC save/restore hooks (and if there was, it belongs in common PV code).

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Tested-by: Michael Kelley <mhklinux@outlook.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Acked-by: Wei Liu <wei.liu@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/clocksource/hyperv_timer.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clocksource/hyperv_timer.c b/drivers/clocksource/hyperv_timer.c
index daa8cbfe61ee..220668207d19 100644
--- a/drivers/clocksource/hyperv_timer.c
+++ b/drivers/clocksource/hyperv_timer.c
@@ -544,9 +544,6 @@ static __always_inline void hv_setup_sched_clock(void *sched_clock)
 #include <asm/timer.h>
 
 static u64 hv_ref_counter_at_suspend;
-static void (*old_save_sched_clock_state)(void);
-static void (*old_restore_sched_clock_state)(void);
-
 /*
  * Hyper-V clock counter resets during hibernation. Save and restore clock
  * offset during suspend/resume, while also considering the time passed
@@ -556,8 +553,6 @@ static void (*old_restore_sched_clock_state)(void);
  */
 static void hv_save_sched_clock_state(void)
 {
-	old_save_sched_clock_state();
-
 	hv_ref_counter_at_suspend = hv_read_reference_counter();
 }
 
@@ -570,8 +565,6 @@ static void hv_restore_sched_clock_state(void)
 	 *                - reference counter (time) now.
 	 */
 	hv_sched_clock_offset -= (hv_ref_counter_at_suspend - hv_read_reference_counter());
-
-	old_restore_sched_clock_state();
 }
 
 static __always_inline void hv_setup_sched_clock(void *sched_clock)
@@ -579,10 +572,7 @@ static __always_inline void hv_setup_sched_clock(void *sched_clock)
 	/* We're on x86/x64 *and* using PV ops */
 	paravirt_set_sched_clock(sched_clock);
 
-	old_save_sched_clock_state = x86_platform.save_sched_clock_state;
 	x86_platform.save_sched_clock_state = hv_save_sched_clock_state;
-
-	old_restore_sched_clock_state = x86_platform.restore_sched_clock_state;
 	x86_platform.restore_sched_clock_state = hv_restore_sched_clock_state;
 }
 #else /* !CONFIG_GENERIC_SCHED_CLOCK && !CONFIG_PARAVIRT */
-- 
2.55.0.679.g6767b8d81c-goog


