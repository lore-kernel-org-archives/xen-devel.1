Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729D2C5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:38:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385420.1627872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7fA-0001fu-LW; Thu, 06 Aug 2026 23:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385420.1627872; Thu, 06 Aug 2026 23:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7fA-0001fn-Ij; Thu, 06 Aug 2026 23:38:12 +0000
Received: by outflank-mailman (input) for mailman id 1385420;
 Thu, 06 Aug 2026 23:38:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3pBp1agYKCQk1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@flex--seanjc.bounces.google.com>)
 id 1ws7f9-0001bN-1H
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:38:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7f8-005Ba1-ET
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:38:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3pBp1agYKCQk1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@flex--seanjc.bounces.google.com>)
 id 6a751aa4-5cb7-0a2a0a5109dd-0a2a450adfc0-34
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:38:10 +0200
Received: from [209.85.216.70] (helo=mail-pj1-f70.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3pBp1agYKCQk1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@flex--seanjc.bounces.google.com>)
 id 6a751aa4-f2d2-0a2a450a0019-d155d846e865-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:10 +0200
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-38ec0f510a9so5941233a91.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:09 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059428; x=1786664228; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aQ8musMrPFB3W7GZXrEzufcFO/9G0XUPjz13+bRyF/M=;
        b=UayW8GJqxBg5VG1/3FkRkdLbU/2Q1/1qHyI5vIVC/GbO5PPRtRDKjWLyMghueaSpKl
         tIBca+4/VLzOePgFa64RrbfAk8Wx28TjH5GgQ0MCkPzLJKsq2ZW9sDgQ6yVdJk935OZm
         9CKbJXpIXGhyUr6oHG7BeOhdCeCjCCjyjVdB7SmtLJI2h2Ly0AKm7Y2c5rCTRH/6ANaN
         v72Brr4zf60WJ3d6yArfwjZQwVPeA+15qxyWwHi9IuS/HJBs61JVPVHqM32t2X2L7V6Q
         /qE4eW3xZ5h9GSbln+eHUpOTLi8hmy68ww2bxVFWAKaJGOFARCo0sxigvGjRjkVd58qR
         9weQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059428; x=1786664228;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aQ8musMrPFB3W7GZXrEzufcFO/9G0XUPjz13+bRyF/M=;
        b=qPRsFaIMFfzAsy/lpq4ksJWyzM3RpNEs47upMXraBuV0xPuDNv3gzp7LFowgBco6RS
         D03CZoLNlDd6kDvZ08Rno5Zj9HgfAS/VAntTqfuvX+Eiub8wWHMuuHfnu41b8pQnj1g9
         6M4xcs3m7xJ0wC1tmno0lPSTVPWc/4JgdFnuKl5u4HFPeaDUJtEw3XZ6vibYR83epYsH
         +eQuWDT7X0DbHeryWBmT2TmFFIKKTGT6OLMjZth9gwi2VLzFhPIpc6FcYeO4qNUnuGp7
         IJ6xI8lpnsbPX+VN0q0XRdAJHI3E4UqUQf2penOKegUzZPSPQC1keelNKBLnM4oHVXtm
         FE1g==
X-Forwarded-Encrypted: i=1; AHgh+RqV3WM3YMlzA9Fs/fTJ8sT5+Ry653AxlUMsqk5FwRN5s8LFJ3jF1XQFTavtzuiKUAxDZrTXDT5OLkU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQPgCrl6wuG+TG4Pn3MHIqVkcGazOQbpO5t3z7EDOFSIXlvJ/U
	eSDb7klEwevVQdRCblOeWY0WNhITYeKs3knZE+XTdE61IygtHcJwgkhp4ktFdhX479oTMj8XnLO
	mTliHhw==
X-Received: from pjpq20.prod.google.com ([2002:a17:90a:a014:b0:38e:befb:90c6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:264b:b0:38a:c3f:3b87
 with SMTP id 98e67ed59e1d1-3903c58a6femr19988163a91.12.1786059428057; Thu, 06
 Aug 2026 16:37:08 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:52 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-36-seanjc@google.com>
Subject: [PATCH v6 35/51] x86/tsc: WARN if TSC sched_clock save/restore used
 with PV sched_clock
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
X-purgate-ID: tlsNG-4011c0/1786059430-514C7CFC-831FA0FF/13/0
X-purgate-type: clean
X-purgate-size: 1422

Now that all PV clocksources override the sched_clock save/restore hooks
when overriding sched_clock, WARN if the "default" TSC hooks are invoked
when using a PV sched_clock, e.g. to guard against regressions.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 964f3d6c2c71..60fcc3020792 100644
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
2.55.0.679.g6767b8d81c-goog


