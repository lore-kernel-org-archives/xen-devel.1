Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA0AC5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:39:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385441.1627900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7gQ-0003KW-GI; Thu, 06 Aug 2026 23:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385441.1627900; Thu, 06 Aug 2026 23:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7gQ-0003KP-CC; Thu, 06 Aug 2026 23:39:30 +0000
Received: by outflank-mailman (input) for mailman id 1385441;
 Thu, 06 Aug 2026 23:39:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3thp1agYKCRsJ51EA37FF7C5.3FDO5E-45M5CC9JKJ.O5EGIFA53K.FI7@flex--seanjc.bounces.google.com>)
 id 1ws7gP-0003JY-0u
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:39:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7gO-008NwO-E3
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:39:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3thp1agYKCRsJ51EA37FF7C5.3FDO5E-45M5CC9JKJ.O5EGIFA53K.FI7@flex--seanjc.bounces.google.com>)
 id 6a751ae6-5cb7-0a2a0a5109dd-0a2a4501dcf8-16
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:39:28 +0200
Received: from [209.85.216.72] (helo=mail-pj1-f72.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3thp1agYKCRsJ51EA37FF7C5.3FDO5E-45M5CC9JKJ.O5EGIFA53K.FI7@flex--seanjc.bounces.google.com>)
 id 6a751ab6-5984-0a2a45010019-d155d848bc7f-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:28 +0200
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-38e22137fb3so3727924a91.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:27 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059446; x=1786664246; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yUUzKej44hzjMWM7byUMUm3T8+/2OB7FMHfj7k4gSDk=;
        b=QZI/nV7PAFv/pPThl5nZ4RPWlJsnkOb7y6J7quwQbDi7/wn5/47jyI+C89Lk123cLW
         gd8Q6y8cRwJajOs0bwx3ZanhJ4g0FCFi9tS3/DvgANYrqEO7Th2J+rOenzzYmB1Ptxeo
         JrA+TQJ7wkbOzGv36YqZKfOmaxjB2Lvu75ud32X8UYJMTv2cZWvTOVuy+0GXSjsR/uiU
         tWBVR+vdJSAC7bh6Qv+mh3rY0FCkrVcnvUpPc+/ElPgQYVpvT0kNONS5Ui4PApqS8HYy
         Wh8o/00pcrhYddpAbkOX9tiyC6nw0O6GerycAR2PHT0d8j54zyVSbI+ltkZsRHdUrd0X
         eeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059446; x=1786664246;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yUUzKej44hzjMWM7byUMUm3T8+/2OB7FMHfj7k4gSDk=;
        b=B4W/3kg5C3w86yDh48zk/PPI+9pDp8xMXRBV2gOQDbCSWKIMf3zSD4clDGS+StuXFS
         CsJZF4+AvfW731soMeJmD5fQsZrX/FR9Whg99TuoFLUlHfuNU4xkHLGqDEz5EuaGD1IF
         rWFAuQ9ci+ufx15u01E0YWAeUpCCFU2zyY0xugmNbuiNavcdV66pM/K/6C7N7A9R+Rhr
         k+lsYOEyXMBO2zqsXqb2c1eiwlQTETtXr1YtvdOEYNcwqq3KQNeEPIY6bke8nLScR0/k
         nU53twn+h56mSacWhNYzJmbqzKno+rMTpV3USDaEoPghfqbZL59Kf2n89KQ1hi6LYPNK
         Ek5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoygyQERN3NgLw7YsnBAGpNR+tTy6zTd+v6kUdzvNFGRH1P3R4hyrLTb14xN5QUGV8I//hr2nZY0Hg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGhKK97N07ygs7xiHIRPP4/NA8+NmX5g1LHhHpXrNbcosDpsx/
	TGQmHzv2Q2UwkEQUq1X5f9bwUb/wZPWb1ctwRznPRImptjP/5Gy+YDPfp7X2D/vo6WChJjmI4Ap
	LJXZYfg==
X-Received: from pjzp16.prod.google.com ([2002:a17:90b:110:b0:382:7fcd:a18a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:520a:b0:38f:5828:a40c
 with SMTP id 98e67ed59e1d1-3903c59a6eemr19079453a91.10.1786059446038; Thu, 06
 Aug 2026 16:37:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:36:07 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-51-seanjc@google.com>
Subject: [PATCH v6 50/51] x86/paravirt: Move using_native_sched_clock() stub
 into timer.h
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
X-purgate-ID: tlsNG-d62444/1786059448-1E867757-C00BCBAE/13/0
X-purgate-type: clean
X-purgate-size: 1710

Now that timer.h ended up with CONFIG_PARAVIRT #ifdeffery anyways, move the
PARAVIRT=n using_native_sched_clock() stub into timer.h as a "free"
optimization.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 6 ++++--
 arch/x86/kernel/tsc.c        | 2 --
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index ca5c95d48c03..a52388af6055 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -11,9 +11,9 @@ extern void recalibrate_cpu_khz(void);
 
 extern int no_timer_check;
 
-extern bool using_native_sched_clock(void);
-
 #ifdef CONFIG_PARAVIRT
+extern bool using_native_sched_clock(void);
+
 int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 				      void (*save)(void), void (*restore)(void));
 
@@ -23,6 +23,8 @@ static __always_inline void paravirt_set_sched_clock(u64 (*func)(void),
 {
 	(void)__paravirt_set_sched_clock(func, true, save, restore);
 }
+#else
+static inline bool using_native_sched_clock(void) { return true; }
 #endif
 
 /*
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index c0e4485484f2..74298e8ffa1f 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -302,8 +302,6 @@ int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 }
 #else
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
-
-bool using_native_sched_clock(void) { return true; }
 #endif
 
 notrace u64 sched_clock(void)
-- 
2.55.0.679.g6767b8d81c-goog


