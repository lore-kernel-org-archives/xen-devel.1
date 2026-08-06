Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB21C5AC82
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:36:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385268.1627710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dX-0007Cp-Qh; Thu, 06 Aug 2026 23:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385268.1627710; Thu, 06 Aug 2026 23:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dX-0007Ci-Me; Thu, 06 Aug 2026 23:36:31 +0000
Received: by outflank-mailman (input) for mailman id 1385268;
 Thu, 06 Aug 2026 23:36:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3exp1agYKCd4SEANJCGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@flex--seanjc.bounces.google.com>)
 id 1ws7dW-0006wt-B6
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:36:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7dV-00BpFw-OJ
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:36:29 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3exp1agYKCd4SEANJCGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@flex--seanjc.bounces.google.com>)
 id 6a751a68-2eae-0a2a0a5409dd-0a2a4503dca0-12
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:29 +0200
Received: from [209.85.210.200] (helo=mail-pf1-f200.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3exp1agYKCd4SEANJCGOOGLE.COMXEN-DEVELLISTS.XENPROJECT.ORG@flex--seanjc.bounces.google.com>)
 id 6a751a7c-fae8-0a2a45030019-d155d2c8b58b-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:29 +0200
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-8486ffba174so6231388b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:29 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059388; x=1786664188; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2SJsprQma6tQ2oU494vKbTkDMI4EE2yRA8rYyHQJqoI=;
        b=n4Hy1f/s0tj0vRdDTiDRCu5VS4gfXmQLfJcrwbMBZNuQ1kBE1EfSQHspcOCwyptVeh
         51Lzvt8S3VPVfbT1F1KoYQjCe/GhJQG6viwMeGV3xGi+N8MfMTI0ceECgJqTDZkjECtU
         ta+xAIrWdDfw7GN5P1dsBm9AeLTkOX4Z608KT1OZP7r17f/3zmEiC+PpJufshDrPCcL8
         tGKt+doHE/NO9mcYomTCl7se1XT+TxBEY+nSB284+o97Nr8HdRqRYJ+CZuMFPnni1fTm
         THxCHFxaraKTcWIEQNwuh+S5VomxDPy9qjBMt6nWTIB9MqrXBIbjB/ttQV1/o6e3dV3G
         nmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059388; x=1786664188;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2SJsprQma6tQ2oU494vKbTkDMI4EE2yRA8rYyHQJqoI=;
        b=ibixDnDakB/lb5yqDOOHzevpuGGtGIdDaQxW8FPvaeIqVkGWxKD8EIXxhpSIO0gVm0
         m56uSa7nzD0vMWoGt0a9AltgTlUla5KJ9AcART2v5vPiuMZBsDAAncCqX23jFFjGML7t
         79MBakHKYWFf/aTPE4ZU3zSnLIVH3rfdrtdANNyzn9a02MRy2EvW7bzWnqGfN+gJ/88N
         551vMaoztgi5MMyy85StUw6+04UNsj/C41k7WOGI0PppBN5sTl64GdI8H1ejQSPm8gSQ
         mQz/Jhrk8WVIgkckiSRkjnQg15n6yHXqkvQRM4NYlBkKIbS9gLLPNzGhAF4DSY4Ra/Z3
         inKw==
X-Forwarded-Encrypted: i=1; AHgh+RrLYLgL9ESakyj5CZCuWRQ995Lii1QhVLGVwbR4CB7M1A9DWIIago0RWoz3gNsmPF36YLRZSQXXfj4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysDo6Y9Z8pw9wMpQw+qnck42nc+ZdbVbArX7jONWwCm14O+GIr
	vQFkmRZ1zZYhYv19C9zGqQ24hqlINTTNCBzsPVxSZYWgRAfE3C9WU5Lx+JrcN0B4lwLWSMTextw
	KkRimug==
X-Received: from pglr15.prod.google.com ([2002:a63:514f:0:b0:c9a:7d72:c316])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d0c:b0:84e:2382:f4f0
 with SMTP id d2e1a72fcca58-84f2dfc8ed4mr19812672b3a.4.1786059387185; Thu, 06
 Aug 2026 16:36:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:20 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-4-seanjc@google.com>
Subject: [PATCH v6 03/51] x86/tsc: Ensure that TSC recalibration doesn't run
 if TSC frequency is known
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
X-purgate-ID: tlsNG-33051d/1786059389-764FC4E9-10560814/0/0
X-purgate-type: clean
X-purgate-size: 1414

When attempting TSC recalibration post-boot, which is only done for ancient
CPUS (P4 and K7) on SMP=n kernels, assert that the TSC frequency isn't
known (explicitly provided by hardware) by way of MSR or CPUID, and bail if
the impossible happens.  In practice, recalibration and TSC_KNOWN_FREQ are
mutually exclusive, as TSC_KNOWN_FREQ will only be set when running on
hardware that was released decades after recalibration was obsoleted, but
but it's hard to see that, especially when looking at just the TSC code.

Note, the WARN can likely be tripped by running in a virtual machine and
concocting an impossible CPU model, e.g. by combining a P4 signature with
CPUID 0x15.  This is working as intended, as such a virtual CPU model is
wildly out-of-spec and is not supported.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 4392fddd616e..bc4348585194 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -930,6 +930,9 @@ void recalibrate_cpu_khz(void)
 	if (!boot_cpu_has(X86_FEATURE_TSC))
 		return;
 
+	if (WARN_ON_ONCE(cpu_feature_enabled(X86_FEATURE_TSC_KNOWN_FREQ)))
+		return;
+
 	cpu_khz = x86_platform.calibrate_cpu();
 	tsc_khz = x86_platform.calibrate_tsc();
 	if (tsc_khz == 0)
-- 
2.55.0.679.g6767b8d81c-goog


