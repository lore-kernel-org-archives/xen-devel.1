Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A96CD343F
	for <xen-devel@archiver.kernel.org>; Fri, 15 May 2026 19:21:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1310265.1581182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy5u-0004Jn-R1; Fri, 15 May 2026 19:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310265.1581182; Fri, 15 May 2026 19:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy5u-0004Im-L4; Fri, 15 May 2026 19:21:10 +0000
Received: by outflank-mailman (input) for mailman id 1310265;
 Fri, 15 May 2026 19:21:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3InIHagYKCXsrdZmibfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@flex--seanjc.bounces.google.com>)
 id 1wNy5u-0004Dh-5d
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:21:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNy5t-007OSl-I3
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:21:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3InIHagYKCXsrdZmibfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@flex--seanjc.bounces.google.com>)
 id 6a077201-bab6-0a2a0a5309dd-0a2a45069cfa-40
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:21:09 +0200
Received: from [209.85.216.74] (helo=mail-pj1-f74.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3InIHagYKCXsrdZmibfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@flex--seanjc.bounces.google.com>)
 id 6a077223-7371-0a2a45060019-d155d84ae4bd-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:21:09 +0200
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-36781927b4dso293420a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:21:08 -0700 (PDT)
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
        d=google.com; s=20251104; t=1778872867; x=1779477667; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=czryuinsQM/bDv8Ei5QNsAEKCG27pLCUAiJBy5nMgao=;
        b=ioBG3FpYifFwK0k+9ALiE6+r5xflJwOZ0HodUmJB49g9WNifKrp5c5Gcb6TIxdowCg
         UtHrRJU4k7YqEzlt+6TJj1aafcZC6dSNmqt35Ey8rByGPVQkJJ8TZ/GE/98Vpp6VpoBV
         dd6jj+UYYa34yK4b/VgOHDU4JMjpZAuZLGVkU6WpgSkTnpsYaTVjdocyG46kkeRmZ2AY
         tLRz8dWyBH9aiLz7hS3iLCXP0DCwgDBk8f9HYPYuRFwrn5XMaDa7dNRRVYwydPQO9Z3q
         bjrvDcmVeKt++v5StfV9x0NAg155KvncyAL0ND7/KomVOX96kRPOhXbzQThJDcyeTdAu
         ORWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872867; x=1779477667;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czryuinsQM/bDv8Ei5QNsAEKCG27pLCUAiJBy5nMgao=;
        b=F1nNKnAOn+O2Az8YH7UfZTdwUUtXKagMAxaj8k6+3MuQL44wycdH9tKftPjRgdnqTp
         nKoKRWUInGyMgGR4njQeAiCXwxBffpHNL7G7CouyuThyH5PIjw6MK8l8MUYi9A4tbPab
         TuSzTWfrWg1JF7j98AAQOLHh38vvOWr92O0rTIMK0p5z0LTW1DHRW8nZdNtJ906aAT8O
         sDlMwP/igXo9snRKhaj+IxTSKKSi0o4hJwJPzPGw0baRSi2SVvgOoNJxeXB/us3km+EA
         8EyQDvTLKiYow71ZWxRCttBAr8I1H8tidW+bU3aDBs6dY4tGNHcza5IOIudR9OFYWyq0
         CraQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dWNBuukIgjDp82pSL8fjdw54Pg75xZum+GGlxmEPsujNIjsZouM5/OeBCqbBAaE456SuTWphefyY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlkCX9eyFVvtfkdg9OT/wdxF8R+0eJGUbr1enls9vM4UnrBOBt
	vP7Ddm1zTxQTXzgHgivknxFTLqsuMfN/QUTVqZdh/gzC63RDvwmKY0VJPiPCwQSvyomXQPHFfB0
	lK2cCCg==
X-Received: from pjbiw14.prod.google.com ([2002:a17:90b:420e:b0:365:df9b:ae96])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:4ca4:b0:369:69f8:ad6b
 with SMTP id 98e67ed59e1d1-36969f8b046mr1344290a91.0.1778872866654; Fri, 15
 May 2026 12:21:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:29 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-29-seanjc@google.com>
Subject: [PATCH v3 28/41] x86/paravirt: Mark __paravirt_set_sched_clock() as __init
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-16d1c6/1778872869-8DF81D75-27A9D64E/0/0
X-purgate-type: clean
X-purgate-size: 2018

Annotate __paravirt_set_sched_clock() as __init, and make its wrapper
__always_inline to ensure sanitizers don't result in a non-inline version
hanging around.  All callers run during __init, and changing sched_clock
after boot would be all kinds of crazy.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 10 +++++-----
 arch/x86/kernel/tsc.c        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index e97cd1ae03d1..96ae7feac47c 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -14,12 +14,12 @@ extern int no_timer_check;
 extern bool using_native_sched_clock(void);
 
 #ifdef CONFIG_PARAVIRT
-void __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				void (*save)(void), void (*restore)(void));
+void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				       void (*save)(void), void (*restore)(void));
 
-static inline void paravirt_set_sched_clock(u64 (*func)(void),
-					    void (*save)(void),
-					    void (*restore)(void))
+static __always_inline void paravirt_set_sched_clock(u64 (*func)(void),
+						     void (*save)(void),
+						     void (*restore)(void))
 {
 	__paravirt_set_sched_clock(func, true, save, restore);
 }
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 0114c63dfdd9..4a48b8ba5bea 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -280,8 +280,8 @@ bool using_native_sched_clock(void)
 	return static_call_query(pv_sched_clock) == native_sched_clock;
 }
 
-void __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				void (*save)(void), void (*restore)(void))
+void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				       void (*save)(void), void (*restore)(void))
 {
 	if (!stable)
 		clear_sched_clock_stable();
-- 
2.54.0.563.g4f69b47b94-goog


