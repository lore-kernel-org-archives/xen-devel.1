Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8663CC5ACA8
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:36:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385271.1627737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dc-0007we-M6; Thu, 06 Aug 2026 23:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385271.1627737; Thu, 06 Aug 2026 23:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dc-0007wT-IX; Thu, 06 Aug 2026 23:36:36 +0000
Received: by outflank-mailman (input) for mailman id 1385271;
 Thu, 06 Aug 2026 23:36:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3fxp1agYKCeIWIERNGKSSKPI.GSQbIR-HIZIPPMWXW.bIRTVSNIGX.SVK@flex--seanjc.bounces.google.com>)
 id 1ws7da-0007gB-Mn
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:36:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7da-00GcaU-3n
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:36:34 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3fxp1agYKCeIWIERNGKSSKPI.GSQbIR-HIZIPPMWXW.bIRTVSNIGX.SVK@flex--seanjc.bounces.google.com>)
 id 6a751a70-bab6-0a2a0a5309dd-0a2a450ae97a-10
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:34 +0200
Received: from [209.85.210.199] (helo=mail-pf1-f199.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3fxp1agYKCeIWIERNGKSSKPI.GSQbIR-HIZIPPMWXW.bIRTVSNIGX.SVK@flex--seanjc.bounces.google.com>)
 id 6a751a80-f2d2-0a2a450a0019-d155d2c7ed64-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:33 +0200
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-8484f26852dso3084112b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:33 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059392; x=1786664192; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tcL8w1SVbwtFzoahyKqy3HGwkprj7A9nnDUrJsX64pM=;
        b=DgFqVJTosbcOR4sDQQ29htYcgOWEzPZte/iAOYmjWIG7mDh/jCAcfKdpEU1WPqXEfW
         uzlYtZZTbPUGuKzQ5p4DTKIvYsa/qWOJ2feqFnsGE60Vrjf++givTPJBx4vIFQ/s1++m
         15bJYnVFP0nO7WJYVShFD+vE5qvah1xnLNTNmLijiBGPSaBFPm038qagJ+BLXK/lryY+
         ZStvDzWPy1fbwiMmpqhvg/3YDasTXNbQFtcUyYZcWFPZX/ZMP9yxkemEpAxgnSLx4s+a
         4uu0a1jRF6M5SmetfaoN+QiGvUDstlrfdJ5tNHdeXC5CRiURfXZo4NqVnd4vHdvzXtg6
         YBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059392; x=1786664192;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tcL8w1SVbwtFzoahyKqy3HGwkprj7A9nnDUrJsX64pM=;
        b=UTTijzli51J1/FrMrWRJLvi1OtkPHxXBEBrgMeMs52Q2FXOtpZYNa8ePWVRAdh8kKv
         xWliQ485rSWlTCtehZniitUQnPnOp97KT8vGha6PPqEYW/BKnnM/gNT5WSdi5+NB8XZI
         bYMtglH/+Tu9H7/q2lg0aCQ2l+p6aDD2s9vVmvydmqkfG6wosrOvNCehJwPtvFrHMWOb
         2vJooTfLovoogWMZ9XnMeES5UMLmiyEmrLq9Mt4EKklpwJ3jGag9Xn3UBr6kg9ti63zM
         /V5aX6hQYPjNK85B49aPMPUC9PtjYIaH2PBDUYuLQnJcXPIphLRSDFq7XGmvqe6kBSvz
         wFZg==
X-Forwarded-Encrypted: i=1; AHgh+RoMuNLEXsoD8oLR7S8pbCTqXq1ZmKaDxuu4DR71chipMQq/876Ze5/HDCjuDp1SPY7vIB213mR6q4M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjKRyfwq0ZYndv3+PbQJyM5je+eDCqcFkOYLZeU3ZuvZG3L30d
	cgzOfs+iQCj3ZFrChdyHbyto3K/RnyWyeUgi5bpZL9Wo8FfGRElZIScfFS9KaIMMPc+ZHhJ/zqX
	yWheV8Q==
X-Received: from pgmc14.prod.google.com ([2002:a63:1c4e:0:b0:cbb:8a1e:efa4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:10cd:b0:848:8445:6956
 with SMTP id d2e1a72fcca58-84f4fe9f90emr5350899b3a.18.1786059391731; Thu, 06
 Aug 2026 16:36:31 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:23 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-7-seanjc@google.com>
Subject: [PATCH v6 06/51] x86/sev: Don't override CPU frequency calibration
 for SNP's Secure TSC
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
X-purgate-ID: tlsNG-4011c0/1786059394-53ED2CFC-FFA6726C/0/0
X-purgate-type: clean
X-purgate-size: 1503

Don't override the kernel's CPU frequency calibration routine when
registering SNP's Secure TSC calibration routine.  SNP (the architecture)
provides zero guarantees that the CPU runs at the same frequency as the
TSC.  The justification for clobbering the CPU routine was:

  Since the difference between CPU base and TSC frequency does not apply
  in this case, the same callback is being used.

but that's simply not true.  E.g. if APERF/MPERF is exposed to the VM, then
the CPU frequency absolutely does matter.

While relying on heuristics and/or the untrusted hypervisor to provide the
CPU frequency isn't ideal, it's at least not outright wrong.

Fixes: 73bbf3b0fbba ("x86/tsc: Init the TSC for Secure TSC guests")
Cc: Nikunj A Dadhania <nikunj@amd.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Nikunj A Dadhania <nikunj@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/sev/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index ed0ac52a765e..665de1aea0ee 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2046,7 +2046,6 @@ void __init snp_secure_tsc_init(void)
 
 	snp_tsc_freq_khz = SNP_SCALE_TSC_FREQ(tsc_freq_mhz * 1000, secrets->tsc_factor);
 
-	x86_platform.calibrate_cpu = securetsc_get_tsc_khz;
 	x86_platform.calibrate_tsc = securetsc_get_tsc_khz;
 
 	early_memunmap(mem, PAGE_SIZE);
-- 
2.55.0.679.g6767b8d81c-goog


