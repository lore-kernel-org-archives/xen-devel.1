Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D842BCD6E4A
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2026 15:11:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1322501.1588790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyrq-00048V-Bt; Fri, 29 May 2026 15:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322501.1588790; Fri, 29 May 2026 15:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyrq-00048O-7l; Fri, 29 May 2026 15:11:22 +0000
Received: by outflank-mailman (input) for mailman id 1322501;
 Fri, 29 May 2026 15:11:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <34asZagYKCfYqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@flex--seanjc.bounces.google.com>)
 id 1wSyrp-00046L-70
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:11:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSyro-009Kty-K0
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:11:20 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <34asZagYKCfYqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@flex--seanjc.bounces.google.com>)
 id 6a19ac90-5cb7-0a2a0a5109dd-0a2a4507abd8-22
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:11:20 +0200
Received: from [209.85.216.73] (helo=mail-pj1-f73.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <34asZagYKCfYqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@flex--seanjc.bounces.google.com>)
 id 6a19abe2-229c-0a2a45070019-d155d849e42a-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:08:20 +0200
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-36781927b4dso8581659a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:08:19 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780067298; x=1780672098; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=tzOZYRAyrYNaAuUvG5/Y5SZS8EF8Fxjy2/uxgYTIQuI=;
        b=moqTaH6gclapPR5HEYVN+GRZ9f5bQ8c37bpPsgqI3kJUvDNszwmFNlugup8SeZL1Rz
         xMQhqnEd/9Qt01aHaFwkuL9v73+ckvewMUXtAV9EI+MlAns2SGy7evjsv1g7JrGyS/1c
         hMEhYZq3NQtkz233tVFOtyGClVjsoKBSq9OZgVAJzrdbIw8WRHLKEKH/v6Q+kRgSXhEW
         PGfheYdXhGxVlCmP8Q6tDRD1P62dTmXs/chkKOoUokn8OkaVX8KXRHUxGXIalBpyiqIe
         kWdZ6uCxxCZk5QQMvHaA2alOMVnGMA6jAJAno9agIJh/eN6cFEBKY3Fv9yunfbLOgd6o
         pkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067298; x=1780672098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzOZYRAyrYNaAuUvG5/Y5SZS8EF8Fxjy2/uxgYTIQuI=;
        b=g6OwW3yzYKjiMdmMXARErWrSfJoPqWM/DKym+7hB19GKstrMS8DrYCpOjk0+ggkzJP
         Hb6wuVJtxnWoT+tCFdmlhJB+RDGaOzechKQaWE8jG6vbDrkKz0EPGyCI3X1gxgqcu8bu
         D+cRV+rHdX9y81PyoQxY+gYsqKI7uoPFSbrkD0dmjosTmT9ohGkQL31FxFh+dTOqumO6
         lIJY8tK/sFmkg33JAbPqua+x9sD1udjbzndzJ0qlpnyCF2QIhDPDqqzkT+xIcnLFO/n9
         VHybEuj9sjL7/9A3A/Q25ZO9Nh6ER2aCloIAUqLRKZlcTEzeApF7cnGi0VrQaS64EkBu
         Tz4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9LkUobs/AR8JQrOqbuYTPV+gO12E3bU4vVOiUekP7Wlt9nUFG7KPYx/z90ZCr2IRjWjZXxULyZfCM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw23/NVYhbdfz84P5KuP8UyTdYAk/adTNcfJsn65yezeB7SJZbB
	sq5RZ0u2XtxzeS6Ci8Lu1XXJvPFWC/FNBBdFLkYCiB4UOqXYlwOadDS6bSbFEImXY6mv3hmngLF
	ycKjqOw==
X-Received: from pgbbz16.prod.google.com ([2002:a05:6a02:610:b0:c82:253f:d5e6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5281:b0:36b:293:68d1
 with SMTP id 98e67ed59e1d1-36bbcfd8de4mr3965602a91.16.1780067297895; Fri, 29
 May 2026 08:08:17 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:08:14 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150814.714658-1-seanjc@google.com>
Subject: [PATCH v4 39/47] timekeeping: Resume clocksources before reading
 persistent clock
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ef75cf/1780067300-22D77C48-A08B5CBF/0/0
X-purgate-type: clean
X-purgate-size: 1667

When resuming timekeeping after suspend, restore clocksources prior to
reading the persistent clock.  Paravirt clocks, e.g. kvmclock, tie the
validity of a PV persistent clock to a clocksource, i.e. reading the PV
persistent clock will return garbage if the underlying PV clocksource
hasn't been enabled.  The flaw has gone unnoticed because kvmclock is a
mess and uses its own suspend/resume hooks instead of the clocksource
suspend/resume hooks, which happens to work by sheer dumb luck (the
kvmclock resume hook runs before timekeeping_resume()).

Note, there is no evidence that any clocksource supported by the kernel
depends on a persistent clock.

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 kernel/time/timekeeping.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index c493a4010305..26f3291a814d 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -2098,11 +2098,16 @@ void timekeeping_resume(void)
 	u64 cycle_now, nsec;
 	unsigned long flags;
 
-	read_persistent_clock64(&ts_new);
-
 	clockevents_resume();
 	clocksource_resume();
 
+	/*
+	 * Read persistent time after clocksources have been resumed.  Paravirt
+	 * clocks have a nasty habit of piggybacking a persistent clock on a
+	 * system clock, and may return garbage if the system clock is suspended.
+	 */
+	read_persistent_clock64(&ts_new);
+
 	raw_spin_lock_irqsave(&tk_core.lock, flags);
 
 	/*
-- 
2.54.0.823.g6e5bcc1fc9-goog


