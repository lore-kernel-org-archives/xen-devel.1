Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71D8C5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:41:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385491.1627971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7iE-0007vt-In; Thu, 06 Aug 2026 23:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385491.1627971; Thu, 06 Aug 2026 23:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7iE-0007vh-FN; Thu, 06 Aug 2026 23:41:22 +0000
Received: by outflank-mailman (input) for mailman id 1385491;
 Thu, 06 Aug 2026 23:41:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3rRp1agYKCRIAws51uy66y3w.u64Fw5-vwDw330ABA.Fw57961wuB.69y@flex--seanjc.bounces.google.com>)
 id 1ws7iD-0007sA-1P
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:41:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7iC-00EM9p-El
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:41:20 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3rRp1agYKCRIAws51uy66y3w.u64Fw5-vwDw330ABA.Fw57961wuB.69y@flex--seanjc.bounces.google.com>)
 id 6a751b54-bab6-0a2a0a5309dd-0a2a450297c0-16
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:41:20 +0200
Received: from [209.85.214.197] (helo=mail-pl1-f197.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3rRp1agYKCRIAws51uy66y3w.u64Fw5-vwDw330ABA.Fw57961wuB.69y@flex--seanjc.bounces.google.com>)
 id 6a751aae-6ca4-0a2a45020019-d155d6c5ac6e-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:19 +0200
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2ce7dfd33ffso32943235ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:19 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059438; x=1786664238; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LM+bFo6oZyT6hMjeOJv5/5C5Sfvue9FfV0H+MNWzQd0=;
        b=bwdii+XOuYFQh4W5s+gsVBsTZlabSvuKjQ7targ/TP2zDDQ29IqcxdMYeWzQOol/kO
         YovjPed21L0/DoJSf1iMqruWYB4ppxFfBpj0cA3FsUXLVuqyJgnivh3lcdK8jZVAbrjU
         eLW88Iy/7lk89HGbBFcVUIdCqzPk00OPU+O2XMBB7f8+hPO0h+yISxMtkakbWFQ1L0gB
         ZDLrPbelxa+1qMDXX3sgO1qd7ESAkrJ8+efgy1JiBrSyfSz2wb5E04EGRdW6WK4SrRbx
         U0kyfBtefF6bR8roiyH+iUnMIVN/QJjmLLDzUzqNQTwOjMqf9Vw9y+XRtDoQYfn/59Yt
         sgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059438; x=1786664238;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LM+bFo6oZyT6hMjeOJv5/5C5Sfvue9FfV0H+MNWzQd0=;
        b=E3Fd3WsSUxfm4bzQWFRnTD+r1cWem2efhi3I9tG5ylNlaZdpw8wfDmx8APZBio5tap
         0iI6/SLJ/59B0AkVSNWZSXd7LIShXYEsE7Iu/d0eb2M6hSC9CrJWjaWi9TCQH+hYigDh
         Ke7OdtXIqKw/kaSYJlUm4ncbsb8UHPXcExv1+NwTm1mf7nMd7iNqQZD/g6gsk5cRmo7Z
         RArMv8usgwnN27HbR8pzFouS/Ia4jYTnGsqA1VDs1YwOZ/09gwgM4Ry5dh9VII15Qnbz
         7Tfx0i5wDqhD0sQ+PoAAMrulepmnL5MPwQySEG199Qw7WQqU3ZYnbM0zKY7t8k6tC5jH
         1wuA==
X-Forwarded-Encrypted: i=1; AHgh+RoHQeaPcC8nKZDBR2S/rGJkgSWFGMozsdFjua6XYqBu5wk+uoxclvA2XakCy2VqGGNhgIkz7skuOCg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3LKCPX17aaspYoI0/WKPI/tnLafwevWYGmguMp7++vMAzcwhE
	0RhNHzgJybzkcQy/68yNn+isIURL4f75Xjj+MCf1Pokj7bYtvsWjyrDNk5CLyATfDxVuz1zXBoX
	qRuy5vQ==
X-Received: from pjuf1.prod.google.com ([2002:a17:90a:ce01:b0:38e:aa86:7cac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5447:b0:380:83fc:4315
 with SMTP id 98e67ed59e1d1-3903c66b3bfmr20385633a91.21.1786059437671; Thu, 06
 Aug 2026 16:37:17 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:36:00 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-44-seanjc@google.com>
Subject: [PATCH v6 43/51] x86/kvmclock: Hook clocksource.suspend/resume when
 kvmclock isn't sched_clock
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
X-purgate-ID: tlsNG-720697/1786059440-30BC02AC-D92D305D/0/0
X-purgate-type: clean
X-purgate-size: 2030

Save/restore kvmclock across suspend/resume via clocksource hooks when
kvmclock isn't being used for sched_clock.  This will allow using kvmclock
as a clocksource (or for wallclock!) without also using it for sched_clock.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 61d4d943fe74..41aff709b90a 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -152,7 +152,17 @@ static void kvm_setup_secondary_clock(void)
 
 static void kvm_restore_sched_clock_state(void)
 {
-	kvm_register_clock("primary cpu clock, resume");
+	kvm_register_clock("primary cpu, sched_clock resume");
+}
+
+static void kvmclock_suspend(struct clocksource *cs)
+{
+	kvmclock_disable();
+}
+
+static void kvmclock_resume(struct clocksource *cs)
+{
+	kvm_register_clock("primary cpu, clocksource resume");
 }
 
 void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
@@ -223,6 +233,8 @@ static struct clocksource kvm_clock = {
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.id		= CSID_X86_KVM_CLK,
 	.enable		= kvm_cs_enable,
+	.suspend	= kvmclock_suspend,
+	.resume		= kvmclock_resume,
 };
 
 static void __init kvmclock_init_mem(void)
@@ -318,6 +330,15 @@ static __init void kvm_sched_clock_init(bool stable)
 				   kvm_save_sched_clock_state,
 				   kvm_restore_sched_clock_state);
 
+	/*
+	 * The BSP's clock is managed via dedicated sched_clock save/restore
+	 * hooks when kvmclock is used as sched_clock, as sched_clock needs to
+	 * be kept alive until the very end of suspend entry, and restored as
+	 * quickly as possible after resume.
+	 */
+	kvm_clock.suspend = NULL;
+	kvm_clock.resume = NULL;
+
 	pr_info("kvm-clock: using sched offset of %llu cycles",
 		kvm_sched_clock_offset);
 
-- 
2.55.0.679.g6767b8d81c-goog


