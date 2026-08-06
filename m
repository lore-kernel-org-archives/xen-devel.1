Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACF6C5AC9E
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:36:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385270.1627728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7db-0007hN-Ao; Thu, 06 Aug 2026 23:36:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385270.1627728; Thu, 06 Aug 2026 23:36:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7db-0007hC-6f; Thu, 06 Aug 2026 23:36:35 +0000
Received: by outflank-mailman (input) for mailman id 1385270;
 Thu, 06 Aug 2026 23:36:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3fhp1agYKCeEVHDQMFJRRJOH.FRPaHQ-GHYHOOLVWV.aHQSURMHFW.RUJ@flex--seanjc.bounces.google.com>)
 id 1ws7dZ-0007dT-KO
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:36:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7dZ-00GcVS-1I
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:36:33 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3fhp1agYKCeEVHDQMFJRRJOH.FRPaHQ-GHYHOOLVWV.aHQSURMHFW.RUJ@flex--seanjc.bounces.google.com>)
 id 6a751a81-e002-0a2a0a5209dd-0a2a450c8794-0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:33 +0200
Received: from [209.85.214.198] (helo=mail-pl1-f198.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3fhp1agYKCeEVHDQMFJRRJOH.FRPaHQ-GHYHOOLVWV.aHQSURMHFW.RUJ@flex--seanjc.bounces.google.com>)
 id 6a751a7f-f479-0a2a450c0019-d155d6c6e99d-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:32 +0200
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2caf4173b1cso48599815ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:32 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059391; x=1786664191; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JiQKL/d/a0vrWgDwSPI6P4lMZN4rNkkCCv7n67xdKiQ=;
        b=LR3ZngN0m0wafXvHznKSeHMsej0U8P7i0l+F9WvFiM2vXPABkAhlt2exRf4LiG2hC6
         xge3aKkxCuAV3HkitlFMidsda69rjtPVNJz7WLh2k87ANrpOmluGxtrWewEt/+CswuBC
         GK21YW9wMpW9KGsQ5D7aI+1TOEmmguXmhjQaWV2cBNIalMIdDTlWXovVgqYCWxyixJ3J
         lE1dqeuPFpluWyzD2rgxSj2QdU+ywu688/t6azOfRWdHWWSVOd1S4C3qYCV8t6NwgVk+
         iS9jnv3JcKW8IlZUwptc0DKPqDPWpFMmGdK7Kx7I4KcCfYdxBJRQ3htQ1ps9NLE/Pfsk
         DLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059391; x=1786664191;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JiQKL/d/a0vrWgDwSPI6P4lMZN4rNkkCCv7n67xdKiQ=;
        b=iPR9EyKUNXVQD4LIwKmhD2YotvBCEdSMcXec48rEuk8Lv8VLYI+pxDjhkj9FH7O5lo
         CCcaNTkFR7acMnxSP4iWXJQhE3Mt0LLyeP/mXG3++FPfgogfC89Hnse7ZzaUXpjk+1aF
         6QoHBu8ZL4JXI3OXxDJ6cX9Vk7c/V0Xvu6y2dyA5RcXx+TDYBVeRR7P7vYU+Fo1T6n6j
         u64pZT8Ap/sqO88OV2Y0EfDLBM0GGPevGjvm9kZfKGNDjKD6EKp76KkgsjNkKegFkcxp
         IwLuc+AAnDfo3lnjGZqrO1qv4vcJ46ZGS7nOQ1T2/PPRDZZmutJDC2EpRnPsMA9yGmCt
         5tXw==
X-Forwarded-Encrypted: i=1; AHgh+RqvHo0k1SY5K3AzkZwDIQRinMBD52hifIomn2awZaTSvAPfdlzmflinyo2oIxrcCLnpZvr+PTZBUBE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmIGeV4JylSUyFChQ8A63TY0hu4ATt7DjPInf0EV4ET2Nc3znv
	8USV5lgSf0BeOuJVjrnwa7xGvBes1ua/QJz/ioXMnxzhOM9uL5dj7EskE2NRHd6N926XoBgQvzc
	Q7M9OGg==
X-Received: from pjbsr12.prod.google.com ([2002:a17:90b:4e8c:b0:383:a728:1317])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:ec86:b0:38e:bbf1:de34
 with SMTP id 98e67ed59e1d1-3903c537a12mr20234960a91.7.1786059390540; Thu, 06
 Aug 2026 16:36:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:22 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-6-seanjc@google.com>
Subject: [PATCH v6 05/51] x86/sev: Mark TSC as reliable when configuring
 Secure TSC
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
X-purgate-ID: tlsNG-d25034/1786059393-024DFA5B-0FE27686/0/0
X-purgate-type: clean
X-purgate-size: 1723

Move the code to mark the TSC as reliable from sme_early_init() to
snp_secure_tsc_init().  The only reader of TSC_RELIABLE is the aptly
named check_system_tsc_reliable(), which runs in tsc_init(), i.e.
after snp_secure_tsc_init().

This will allow consolidating the handling of TSC_KNOWN_FREQ and
TSC_RELIABLE when overriding the TSC calibration routine.

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Nikunj A Dadhania <nikunj@amd.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/sev/core.c      | 2 ++
 arch/x86/mm/mem_encrypt_amd.c | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index ecd77d3217f3..ed0ac52a765e 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2037,6 +2037,8 @@ void __init snp_secure_tsc_init(void)
 	secrets = (__force struct snp_secrets_page *)mem;
 
 	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
+	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
+
 	rdmsrq(MSR_AMD64_GUEST_TSC_FREQ, tsc_freq_mhz);
 
 	/* Extract the GUEST TSC MHZ from BIT[17:0], rest is reserved space */
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index 2f8c32173972..6c3af974c7c2 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -535,9 +535,6 @@ void __init sme_early_init(void)
 		 */
 		x86_init.resources.dmi_setup = snp_dmi_setup;
 	}
-
-	if (sev_status & MSR_AMD64_SNP_SECURE_TSC)
-		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
 }
 
 void __init mem_encrypt_free_decrypted_mem(void)
-- 
2.55.0.679.g6767b8d81c-goog


