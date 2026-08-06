Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD0FC5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:42:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385563.1628087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7it-0004em-Ak; Thu, 06 Aug 2026 23:42:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385563.1628087; Thu, 06 Aug 2026 23:42:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7it-0004dr-4R; Thu, 06 Aug 2026 23:42:03 +0000
Received: by outflank-mailman (input) for mailman id 1385563;
 Thu, 06 Aug 2026 23:42:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3mhp1agYKCf0xjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 1ws7is-0004OP-6c
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:42:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7ir-00EMEo-JB
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:42:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3mhp1agYKCf0xjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 6a751b7b-e002-0a2a0a5209dd-0a2a4507ba7e-30
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:42:01 +0200
Received: from [209.85.215.199] (helo=mail-pg1-f199.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3mhp1agYKCf0xjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 6a751a9b-b4ea-0a2a45070019-d155d7c7e533-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:00 +0200
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-cb4cdf95b5aso4647022a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:00 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059419; x=1786664219; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IDybt2K9QzXIIF0RtAPpPcNbJv3nyQQRnp+0cGRBepM=;
        b=U8zn6oj+pXJ4i7lMeXnmYvIAyYJ8t5d1ncj+BkYYksenQJB87we/ljatLfLlEpLjpW
         1kkcaJ/b+1Kv6/uPDGPjz1m4eaoMR4+PeeLejCauvmQ2yjKRRJIISybf5zd3KtNt441a
         +tpIpzPOrdKvPr5pxx2ZvlY7KFgl0X30ELsDeUZkS1ivDszQ8rbpOfDCELg+OoCHLDFs
         Wb5H6aeRz9FG+BCHEoCpNSaqD78+d+3syeg/LHEoDOU5kYRtR7Kg/zPwHYQDvqAtYmCS
         gOx2kFCp8o22y8ZBVLp+4ETojLRfQL5YcGTAP5M1/6BA8rW5h7HyusMtYUv5F2/aoR7q
         Shxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059419; x=1786664219;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IDybt2K9QzXIIF0RtAPpPcNbJv3nyQQRnp+0cGRBepM=;
        b=fdAcdOcx6nlYcKjQgKUDaw/3HnDSxjNRCRcPo1v8N+pKxxw0kubViUnwcj1O72jFVe
         kL/un9HkVF+mPZ8GRYov1vU8W+2Z0NgX6b90sbkbxaT8eRCrBWk5e6YpRbq4WPmjbS44
         TEcvvSEysCuHUnbqFhI6kG8WkC9ijdmbnUOeqLt2OeoIGy6dSfWAd/knqcDTBFbLncpp
         ReBLwMcE5MUDtM4VUnBpt6kUJTWKMutW8l9Ex6PmMbRl8gZOHrI5lRiVTtumfCCdAjgK
         H6vo9vAvV0E+yNEG4Z+uvZQX79iAoAQ8WFwOvDl2T8thz1KT2r9DGQncDpBjKC2stGm8
         Q/Gw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+1eEzdwbjlIRtiZ3mEJK67j/JstHIbotRWnNzLAVVqkaono5FO85WxFMOANcAnHpqbtvQJkngzG8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqBMytgyFZqs1AINCBwPOj4ynFkmebec6V/loqSnuIcQtqSowT
	E5pUu3K1dd/MzKNeJ1iOQAEfoupFEAKwGGQfwawCrGCWtiwD6oxwdpuyGFZpNzlD6oRGHZMIBwd
	lcvVxOQ==
X-Received: from pgbcp2.prod.google.com ([2002:a05:6a02:4002:b0:c8b:fa4f:f001])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4314:b0:3c3:89ce:b5bc
 with SMTP id adf61e73a8af0-3cb85e28fd0mr22042606637.15.1786059418706; Thu, 06
 Aug 2026 16:36:58 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:45 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-29-seanjc@google.com>
Subject: [PATCH v6 28/51] x86/kvmclock: Setup kvmclock for secondary CPUs iff CONFIG_SMP=y
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
X-purgate-ID: tlsNG-ef75cf/1786059421-356C2AE4-6803097E/0/0
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
index 2e7ab54cb9dc..b0c871ba8232 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -208,7 +208,7 @@ static void kvm_restore_sched_clock_state(void)
 	kvm_register_clock("primary cpu clock, resume");
 }
 
-#ifdef CONFIG_X86_LOCAL_APIC
+#ifdef CONFIG_SMP
 static void kvm_setup_secondary_clock(void)
 {
 	kvm_register_clock("secondary cpu clock");
@@ -348,7 +348,7 @@ void __init kvmclock_init(bool prefer_tsc)
 		x86_init.hyper.get_cpu_khz = kvmclock_get_tsc_khz;
 	x86_platform.get_wallclock = kvm_get_wallclock;
 	x86_platform.set_wallclock = kvm_set_wallclock;
-#ifdef CONFIG_X86_LOCAL_APIC
+#ifdef CONFIG_SMP
 	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
 #endif
 	x86_platform.save_sched_clock_state = kvm_save_sched_clock_state;
-- 
2.55.0.679.g6767b8d81c-goog


