Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68818C5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:42:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385600.1628134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7jB-0007Dh-E5; Thu, 06 Aug 2026 23:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385600.1628134; Thu, 06 Aug 2026 23:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7jB-0007D1-5l; Thu, 06 Aug 2026 23:42:21 +0000
Received: by outflank-mailman (input) for mailman id 1385600;
 Thu, 06 Aug 2026 23:42:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3rBp1agYKCRE9vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--seanjc.bounces.google.com>)
 id 1ws7jA-00077X-06
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:42:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7j9-00H1om-DF
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:42:19 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3rBp1agYKCRE9vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--seanjc.bounces.google.com>)
 id 6a751b6a-5cb7-0a2a0a5109dd-0a2a45058b62-42
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:42:19 +0200
Received: from [209.85.215.199] (helo=mail-pg1-f199.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3rBp1agYKCRE9vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@flex--seanjc.bounces.google.com>)
 id 6a751aad-4cb1-0a2a45050019-d155d7c7c87d-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:18 +0200
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-cbe62e01567so2346093a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:18 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059437; x=1786664237; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qISz6FBmFt+Rjc4N/P+Kp805/IDsq2ZStMxtEE1uDRQ=;
        b=khAI2sx07TzbmQEw6txieutghq3rpZ+AQVw90UMqkHZhFed1yn/lwVe1KoASch7LR6
         kgXrdwQ/QHM5lheLbgs1O99YVOZizjfxGkdhJ0rf46PBrmLZdrsEa9zlu5qOsENd4Y3y
         YVlcMIh/j2nEo3XDHvqJ4tYT51cLVr6bLVhvf0QiA5XunPOUssF2ukbfuD8mKfvM32D6
         T0l5l/EkJWYRr6neF1E786kEmtGV2tHRuY6BcpWxgq9c4hj/wEwzt81iInHIsw0g1VHk
         tGbv8fJqko+cznyBtjt3w3efNsWPjjSjV9fgYG8MSAVviVVIrfbykAUoBHR9//9ZPsIa
         cskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059437; x=1786664237;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qISz6FBmFt+Rjc4N/P+Kp805/IDsq2ZStMxtEE1uDRQ=;
        b=a4gDH3zilvz6psJlPfimaccTRWt4FSGU9Ixdq5gxQOQCG16h0/Ec1jaPtW4z4yCMZU
         fupSt3HjLpmybbvwOBeQ5RWnESdOeqjW1tQvQtQ/pf8GzVdjbD0/u4gwqB5AxXwXDu7/
         hYZ/PXCpTJzrMYCYL4/hzLmdsUOf9sOFYrHa1ecZa9lkugBmLc0M6JY2abSfSBvdeeS1
         cp70a2oRmS3ajwmYeO3CgdaXFeLfrjqQEqzoDMkIfhQQM9lZGhFSOLnjk4F+S9t9zdMi
         2v+8QQBxUOkW18Tr1Df0G4Li/+RU+pxAn0cBEo/IMsf35+rRcG3ciGKwuB23CWKdaaAx
         HfHg==
X-Forwarded-Encrypted: i=1; AHgh+Rpcjmqouk2srAGMannHyFL81UuKPtQ7SFBX/JN2sQo3beGoQzeBhIRG7R8hxaYL/baDdFQS59tPqCM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxE1zeLni3+dnu/NlJOvYX1SpDYDLNt+s05AJXOxEEMkB+7u7n1
	QczARDNgk0g4YzK2h0x9YuBHCq9R5aMcczGww7M7FuMdGm1cPNowJRDq8/Q/sOLL0fdOOsMvZlR
	utbFUVQ==
X-Received: from pgbep6.prod.google.com ([2002:a05:6a02:2646:b0:c99:90dc:7b3f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6112:b0:3b4:e4f6:4f15
 with SMTP id adf61e73a8af0-3cb85e9922cmr22668021637.5.1786059436589; Thu, 06
 Aug 2026 16:37:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:59 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-43-seanjc@google.com>
Subject: [PATCH v6 42/51] timekeeping: Resume clocksources before reading
 persistent clock
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
X-purgate-ID: tlsNG-c201ff/1786059438-F6AB72A1-D1235742/13/0
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
index 97db2e9393f9..585525f5c1f6 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -2226,11 +2226,16 @@ void timekeeping_resume(void)
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
2.55.0.679.g6767b8d81c-goog


