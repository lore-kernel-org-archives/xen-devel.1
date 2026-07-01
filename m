Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD60C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:34:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350582.1608104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0hR-0004wl-PM; Wed, 01 Jul 2026 19:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350582.1608104; Wed, 01 Jul 2026 19:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0hR-0004wE-L4; Wed, 01 Jul 2026 19:34:21 +0000
Received: by outflank-mailman (input) for mailman id 1350582;
 Wed, 01 Jul 2026 19:34:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3fmtFagYKCcM1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@flex--seanjc.bounces.google.com>)
 id 1wf0hR-0004tu-79
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:34:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0hQ-003oMF-Jj
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:34:20 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3fmtFagYKCcM1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@flex--seanjc.bounces.google.com>)
 id 6a456b8a-2eae-0a2a0a5409dd-0a2a4506ddcc-40
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:34:20 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3fmtFagYKCcM1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@flex--seanjc.bounces.google.com>)
 id 6a456b7f-08de-0a2a45060019-d155d6cadd4e-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:33:20 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2c8284701c2so12109495ad.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:33:20 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934398; x=1783539198; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=E0Ky72UXh2AIoPVqIZkO5elKJbkXgXhRlg1eH2WcetI=;
        b=GFyGpFcTx6NJOCSfhaCac676LFfEbVdEv79OwSkQ2jclux4tFeJxL6d3KzgbMyRsjd
         49bqjq9n+xk2O7dzT0el3Ms1dsvq9Eaj/3wE78OPVH8M74nHYDfCF6rKTvBsERWj1Tqx
         pW3ao0CApqyFTeIMh9y3+4U5KgZ3oIXu37n3gPEXCxGFaXyP9+UuP73XbkonS24hT1O6
         +PbmjtTJo/kFgqDBt4PImShS+LfnGF7HccQSCbOtvD3lmEtPvBBHT0WR7pzqA7P0CuAr
         QyyVj+rAlg7Av2os5MvmWEFuHg//aYeeJUFCLwla2q0idtBmh6DruMQSAY+4Di/OlCmN
         DrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934398; x=1783539198;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E0Ky72UXh2AIoPVqIZkO5elKJbkXgXhRlg1eH2WcetI=;
        b=rGwPa1leg52sdn3/t0fIsf73bSJ0h3c0n/lr9Cu3/vpy1zEPGlbdtkyDv7tLviV53O
         PMghVcWeCk2GBXtA40GrdZTUXVaB0yPA9VVU7tpRT0Say1g5A6Rs94Uhtk1JSbIOOLgK
         renkl7iiUEsGDsBNRyOmPDuqMz9V9o/Xme9F64I4t76JOwsfvGrfSglhIqxjpp6C3I1Z
         Hk29ZlKL1f+Ne2RBqmniPfHsKq5nvOlWuNl6YG/ctgzDuOfySiOlm4iq8g7qtrl9W/Pu
         TnR6cxPqPptmk8xNd9TqsqqJURJgNNH1aiwfsuDd2pZ7NdpCYnlJEB6drgoorDkkPi+J
         Mi5A==
X-Forwarded-Encrypted: i=1; AHgh+RpJOViCMPufv0+d3RkhHqSLkHfZIqJsVD4tjqKLnb3HC5O85ebUvxSYIWL+GOvC8CVsm3EydRTJjsM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkcTVCLzod+8wLbTn9S7xWo5dUdBRBoQEnrnYCDsDn4p6HWPZ7
	ulDwhP/tOPKOHUOIHiqieSRITajGyxaYJSc1UunEHbzWodhsfzrBc8dKxg38ghcH1iNFnD7FvUc
	H2UOdew==
X-Received: from pleu6.prod.google.com ([2002:a17:903:41c6:b0:2c8:5a:8056])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3885:b0:2ca:17a8:cfce
 with SMTP id d9443c01a7336-2ca911d341fmr20775345ad.29.1782934398119; Wed, 01
 Jul 2026 12:33:18 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:32:03 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-43-seanjc@google.com>
Subject: [PATCH v5 42/51] timekeeping: Resume clocksources before reading
 persistent clock
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
X-purgate-ID: tlsNG-16d1c6/1782934400-F9B9068D-CC4BD5CC/13/0
X-purgate-type: clean
X-purgate-size: 1671

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
index b1b5ec43c0f2..5bc77d36c7a3 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -2180,11 +2180,16 @@ void timekeeping_resume(void)
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
2.55.0.rc0.799.gd6f94ed593-goog


