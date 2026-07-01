Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4359C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:36:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350719.1608240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iu-0004Kw-8e; Wed, 01 Jul 2026 19:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350719.1608240; Wed, 01 Jul 2026 19:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iu-0004Ko-5e; Wed, 01 Jul 2026 19:35:52 +0000
Received: by outflank-mailman (input) for mailman id 1350719;
 Wed, 01 Jul 2026 19:35:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3YGtFagYKCaUXJFSOHLTTLQJ.HTRcJS-IJaJQQNXYX.cJSUWTOJHY.TWL@flex--seanjc.bounces.google.com>)
 id 1wf0it-0004GA-BM
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:35:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0is-003oa2-OY
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:35:50 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3YGtFagYKCaUXJFSOHLTTLQJ.HTRcJS-IJaJQQNXYX.cJSUWTOJHY.TWL@flex--seanjc.bounces.google.com>)
 id 6a456bfe-bab6-0a2a0a5309dd-0a2a4509b1ae-26
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:35:50 +0200
Received: from [209.85.216.73] (helo=mail-pj1-f73.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3YGtFagYKCaUXJFSOHLTTLQJ.HTRcJS-IJaJQQNXYX.cJSUWTOJHY.TWL@flex--seanjc.bounces.google.com>)
 id 6a456b61-97e6-0a2a45090019-d155d849b474-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:50 +0200
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-37e17ec1940so1078897a91.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:50 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934368; x=1783539168; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+CBMOnR0NQyGIEx0KnXnLe9zyF/J2rmq2NSzuBA4h88=;
        b=XcrJrXfzVwhbQm7arI+4S5/HMO/oIwi1vFSPuB5UxJBgmScUpoALtc3jgjZQQs+Hdx
         XLI4WFqfuLiHvRAAGxUY6PUHZeud93WVHymI18Fzgah7GvGGOrZSlUoSPRSuFYNiQYn0
         BbxFJU31l8dWLGDvxD6j6MkJ51TEb9hAlHQNiQSR31VSDIllLI5qDFyDg4qIsnrNnLdL
         YXkFCr5FkFy465juiTNHMdJKCCR1vxnvzTqoPy7UJt+HZCY1ZAbyIwXZhj8k0rwwEwVu
         /anVp+w8uKc7en2ZkjNBHOryBqLXrT+E0eZdu9MwIKGFotLLlwrV2E9k/XTPrZ81uLHT
         t+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934368; x=1783539168;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CBMOnR0NQyGIEx0KnXnLe9zyF/J2rmq2NSzuBA4h88=;
        b=iMjDkFYr4IFXy0tOMp7WrhrW5Vm40695Cil9KI5rhpdTHZnNQcSC9L9tEwPr5SPsEG
         x7OgZ2F8aaA44iSxVorY6XdHX57Pwca7bLYTSGI1FSYfFd81j+jXu1DzAogQtbzfq0YW
         T4JhLZwGWj3q1W11XoVevz1ukJKs3rXKZnHeLeCWA3iWY6Pos21ccnen6sHx1zufF4Kg
         zXydVLtGiwbQHgPTRMJtuehbam5Z8OkGmjXPUmjuqOJC2tkfA9DzuIZwAETIjYhZbzHE
         Y0iF0OyQlEmX8R6b0pXp+SJ88EutDKucCi4Bo+oxDi7XbVX6s6CI2LqrVveNuQHwPnUj
         rDRg==
X-Forwarded-Encrypted: i=1; AHgh+RooTcgGYc5mqr0Tvdk41lAt7X67dflxa9IDclZDKfUiJfkf1PQcJzrQgKiclvXDEYGLiznjFrtp/J8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzStQAgy/qXsIMFzPaxtIxbeZQMd3NVfV+FyFL229fUzRNlaygF
	7v8D8EPz+sBh7otDHrJbaIJyYGPHaboLBdPvFrTKbWZlmIBG86gwzWNahX9Xkxt4pD6c/8BBaAJ
	jUqqAMQ==
X-Received: from pjbca16.prod.google.com ([2002:a17:90a:f310:b0:37c:9369:8b75])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4acb:b0:37f:d6f3:450d
 with SMTP id 98e67ed59e1d1-380aa1313ecmr3162862a91.14.1782934368170; Wed, 01
 Jul 2026 12:32:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:39 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-19-seanjc@google.com>
Subject: [PATCH v5 18/51] x86/kvmclock: Rename kvm_get_tsc_khz() to kvmclock_get_tsc_khz()
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
X-purgate-ID: tlsNG-bad1c0/1782934370-4532F986-E3E9FB2F/13/0
X-purgate-type: clean
X-purgate-size: 1634

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
2.55.0.rc0.799.gd6f94ed593-goog


