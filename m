Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFEDC43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:35:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350654.1608168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iJ-0008SC-3S; Wed, 01 Jul 2026 19:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350654.1608168; Wed, 01 Jul 2026 19:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iI-0008Rq-Si; Wed, 01 Jul 2026 19:35:14 +0000
Received: by outflank-mailman (input) for mailman id 1350654;
 Wed, 01 Jul 2026 19:35:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3dWtFagYKCboxjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 1wf0iG-0008CK-Vb
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:35:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0iG-00BwWE-CE
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:35:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3dWtFagYKCboxjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 6a456be5-5cb7-0a2a0a5109dd-0a2a4509a272-10
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:35:12 +0200
Received: from [209.85.210.201] (helo=mail-pf1-f201.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3dWtFagYKCboxjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 6a456b76-97e6-0a2a45090019-d155d2c9cc4a-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:33:12 +0200
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-847a90cc5e2so1365548b3a.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:33:11 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934390; x=1783539190; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=bEdSCU5mjiDv3GADlP0fC3hWLpC5/Jr71iPsXhxCK9Y=;
        b=wdevGvroHRkQ3LBPn8LO/8Q4/dbwUPa0fQHgC2hH4FLtVNFDnb9Ni99iX3z0t+mE3D
         qOjR17AqEyBxoqluFq6vG86t20Q06VpufcJ8psHLRCPjhOzO1VW9yCKfDGgDoH7cL2gu
         iX1DSW2gUu4J1cmCj7jFKRaQ4POpvv/Te6N6qO4IL03uDsedlCQMyUBZvQy0BFAkjIAT
         MoAG/S4oH/1gqw6RzaPXaZi7VQ04qblXZiFVV6I8BM7zgRAOxrFeDxlAYHAros/0tnsx
         QbPsr4vR4nsVJ/t+mBu9Khh+BirGE55G6zjjdF5i4gaWy20bEj8cKYH+fHC4ICUiVi0L
         H1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934390; x=1783539190;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEdSCU5mjiDv3GADlP0fC3hWLpC5/Jr71iPsXhxCK9Y=;
        b=MjB2iEASi6y3yprTDdo3iVEoD2PBItiezdrbIBmi1/DHgDkpsgrS7T3UA43/ENSQjv
         buO9fI1eyVX+nn0vVv28b56Di87lkf3ue58dC1nuCrw/z+uPuHDtfewv5xS7aEXbberU
         pCw1NSmEE9EtkdqTPh5qKVlJUpG4Pzu0bDTo3DwjWz2ZCLaO+iEciEDI7vWYUAtJqe1p
         HF/rClvzmboeqjUZfRchgBU88xSilL6tmqLLUDgxh3yJ627LMAFareFekKrR9gXjFAmt
         9JgvIYgrEWeXVAtVhXBN7ejQB0S8QMp4h+Be6li/f34tjWRdizUMZ5yKzOaQT9awNSoL
         65kw==
X-Forwarded-Encrypted: i=1; AFNElJ9cCcgdlP19wYcydxmaFh88YIjaH3iij11dB49BLUEVTmv1ACuyfvdnbrjiBFuldLV5SbxB/AJ5wAM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlZXA2GV+Y7BPHtjSKsM3A2GaH0k3oqcVex5ftn48b28Zy8SiG
	gacIfXjZKlET5KwXOfkqEsN2m6q2ZQev+eqDmSb/g/9iafnCEQKqrmgWYYVWeGACJS01DbRhR3L
	LsPJu4g==
X-Received: from pgh6.prod.google.com ([2002:a05:6a02:4e06:b0:c8b:19f4:6228])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4320:b0:3bf:6c08:fb88
 with SMTP id adf61e73a8af0-3bfed4b9441mr3531733637.56.1782934389876; Wed, 01
 Jul 2026 12:33:09 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:56 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-36-seanjc@google.com>
Subject: [PATCH v5 35/51] x86/tsc: WARN if TSC sched_clock save/restore used
 with PV sched_clock
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
X-purgate-ID: tlsNG-bad1c0/1782934392-573AB986-DA0568FE/13/0
X-purgate-type: clean
X-purgate-size: 1426

Now that all PV clocksources override the sched_clock save/restore hooks
when overriding sched_clock, WARN if the "default" TSC hooks are invoked
when using a PV sched_clock, e.g. to guard against regressions.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index a762cb5cec0f..7473dcab4775 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -947,9 +947,17 @@ EXPORT_SYMBOL_FOR_MODULES(recalibrate_cpu_khz, "p4-clockmod,powernow-k7");
 
 static unsigned long long cyc2ns_suspend;
 
+static __always_inline bool tsc_is_save_restore_needed(void)
+{
+	if (WARN_ON_ONCE(!using_native_sched_clock()))
+		return false;
+
+	return static_branch_likely(&__use_tsc) || sched_clock_stable();
+}
+
 void tsc_save_sched_clock_state(void)
 {
-	if (!static_branch_likely(&__use_tsc) && !sched_clock_stable())
+	if (!tsc_is_save_restore_needed())
 		return;
 
 	cyc2ns_suspend = sched_clock();
@@ -969,7 +977,7 @@ void tsc_restore_sched_clock_state(void)
 	unsigned long flags;
 	int cpu;
 
-	if (!static_branch_likely(&__use_tsc) && !sched_clock_stable())
+	if (!tsc_is_save_restore_needed())
 		return;
 
 	local_irq_save(flags);
-- 
2.55.0.rc0.799.gd6f94ed593-goog


