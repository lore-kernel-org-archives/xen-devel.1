Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E182BC43602
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:32:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350370.1607858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fm-0000Pg-IU; Wed, 01 Jul 2026 19:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350370.1607858; Wed, 01 Jul 2026 19:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fm-0000Nv-AK; Wed, 01 Jul 2026 19:32:38 +0000
Received: by outflank-mailman (input) for mailman id 1350370;
 Wed, 01 Jul 2026 19:32:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3UWtFagYKCZYI40D926EE6B4.2ECN4D-34L4BB8IJI.N4DFHE942J.EH6@flex--seanjc.bounces.google.com>)
 id 1wf0fk-0008Vj-MH
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:32:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0fk-004o0g-38
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:32:36 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3UWtFagYKCZYI40D926EE6B4.2ECN4D-34L4BB8IJI.N4DFHE942J.EH6@flex--seanjc.bounces.google.com>)
 id 6a456b44-2eae-0a2a0a5409dd-0a2a4509ddee-42
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:36 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3UWtFagYKCZYI40D926EE6B4.2ECN4D-34L4BB8IJI.N4DFHE942J.EH6@flex--seanjc.bounces.google.com>)
 id 6a456b52-97e6-0a2a45090019-d155d6cab14e-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:35 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2ca0d4fb061so13562385ad.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:35 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934354; x=1783539154; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=evwxLM71EsC76xUKnJUsM6sZDhf4kmGP6xo/jdNLobw=;
        b=lxUVIHgq8AO7SvMwRCNuRvewFIS2NKjniwRvFBiMfw0yUR0tAHTzcVH1C7PzXzWBXI
         +YK8tgKQmr8tCHCMYtmPWDFpwp0Op673LizsMvi6kXAOROZGlAb54h/NStk8yxuIw0Ca
         noUGaNHSz+vcxkQAZDVTNz/GsYFoVDukSR0Vycg8GjlWimY+meKsFyuHjZiK2JF+QXkG
         S7p6Sygfgqrh1E534KDf11rDel7r8iLHn+yO7MZNxtvyxe+PiwiqOvm2DgQMxGl8hxuW
         x9smr1AAGmtTM64SWNQ3pnv4SrihYzgfz2yc1Mq5gHfcI2U5KXq2QyAnMS039xVUyJ7N
         xGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934354; x=1783539154;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evwxLM71EsC76xUKnJUsM6sZDhf4kmGP6xo/jdNLobw=;
        b=hPYRXzSMQTZ0iW8Myo3EIm6UaoXCMqzwJPSDDkhSRQZ3/2Cq+ZN+9KY089shlIdvXx
         tPURrKNtn1OU1ReMlHfl1Z+YfoxbyWofYhWkpw+Q9y/Fx7TY8jdfCDAz6hQ/OrExctoc
         HgE81m7wqyKbc7GiwNxiXAewiRfmaCu+IenlpYlJDXIp5nIYwvWQ62MplWTZL5Oyc54r
         uRiLXW6+nHXlqgFrHb+0rSxHEmO6RKMQFLvGbQlD4IjBY+z8Akq6pkY4GW6nr0T48ZZS
         muXc7XtNa77dScJnJVLXgdfuolpePjF1RZ3f6+Sdzt2Mkd3hHxW20I9BuIpsUjFKpMpE
         ATBQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1+1VaaBmBh+bPkzfdBrxHVtWnCPwUNtjEUWvMJHIOHHg8ETNAm5ZTYx1QCgo/ubo0HzH8J4OCP7s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzR+TorBNVTaCe05tRk4CSoTfXmnhUHsyTx3cRkpEHEdFAYxXsw
	7tTSKTQWGpZ/KRxZVSubrv7niTWSFNLNyX3LGyAPE0upT7IE4p4D+21itQGmE7fXH+pT+vvvldR
	gUQEK2g==
X-Received: from plha8.prod.google.com ([2002:a17:902:ecc8:b0:2c6:a75b:2129])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:f8c:b0:2c7:d603:117f
 with SMTP id d9443c01a7336-2ca7e754b82mr34808385ad.26.1782934353608; Wed, 01
 Jul 2026 12:32:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:27 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-7-seanjc@google.com>
Subject: [PATCH v5 06/51] x86/sev: Don't override CPU frequency calibration
 for SNP's Secure TSC
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
X-purgate-ID: tlsNG-bad1c0/1782934356-4512E986-3CC5EFD8/0/0
X-purgate-type: clean
X-purgate-size: 1458

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
2.55.0.rc0.799.gd6f94ed593-goog


