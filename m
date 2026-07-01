Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F0D5C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:35:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350651.1608150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iF-0007yl-BT; Wed, 01 Jul 2026 19:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350651.1608150; Wed, 01 Jul 2026 19:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iF-0007yc-8n; Wed, 01 Jul 2026 19:35:11 +0000
Received: by outflank-mailman (input) for mailman id 1350651;
 Wed, 01 Jul 2026 19:35:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3c2tFagYKCbgqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@flex--seanjc.bounces.google.com>)
 id 1wf0iE-0007yG-Mf
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:35:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0iE-00BwWE-3I
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:35:10 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3c2tFagYKCbgqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@flex--seanjc.bounces.google.com>)
 id 6a456be5-5cb7-0a2a0a5109dd-0a2a4509a272-8
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:35:10 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3c2tFagYKCbgqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@flex--seanjc.bounces.google.com>)
 id 6a456b74-97e6-0a2a45090019-d155d2cae192-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:33:09 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-8423f544944so787918b3a.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:33:09 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934388; x=1783539188; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=qFfbhUmYyCU6tRW/uev50JnnPJRuq59CtmTnO4qaTps=;
        b=AxzzU/WWBFxM1ih4hQFfuPffcBmt54/E4Kri07Z6dfJKSxnSX+PHuSwRkaGbNDkoe+
         d582W/KvOKR4aBCwT0fXAySLmEgSilaZx6pXyZBUBFGthUTmPVIQQb+X7tWsd1B7Wpuk
         wcTi+rD1R2ZgAAOzcujS6adKUVZc9GRRTQ8rDbmaRFapTcNi73hthu58AY9HLVjSg/YF
         eXb+luqEa0sBliPLHhY6tcamIWAcEJnCwV8cnt4MiIInlIM0Kkuy+Zf4DF30Co/73E1v
         RxwwLNaqDwP6QSwHlpm2FFIu0tfGJMIcSPIoxCsJNt/cNW8Or0Bke6UXs1fKlrjozu0W
         hpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934388; x=1783539188;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFfbhUmYyCU6tRW/uev50JnnPJRuq59CtmTnO4qaTps=;
        b=ZbklHBViHJf7CrpuJhfV26iz2sGbSIL9N4VOG4qtdNVDkDESp0xfTiYMu5zKCJmdfT
         6uAczrwWFdGUoLPw+Zun8WPROnLSVfcionVqO65QlcFNXMoisah0snJIGx78Nr6pm2ey
         e3EYriSyEsN6jIWRDSfEvQcg0j4GLH0LdAUIIiQEnoAHK/aEjdgn8aKQPbpmL1XlHneh
         sc/xC6bYoj+4zcQOK4Mth0jXExe1DSmCX9UxUFRy9DSrGkY59a5Q8eMDUFwtbdQ5QpEz
         JaKAAoTJ8/keaf0dTN3jOdAW1QJUZnKY2+2pri4lLqMdK6eL5mrsR4YYoliUeainMYGa
         WYew==
X-Forwarded-Encrypted: i=1; AFNElJ9BBYIMutAaDQPt5oDZFqvKAKCfpX/JVjs9zn7/qSrH3VvaYV8uMR/2VVMpiPi5qw2QLxNXJ6D8xjk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybiqK6h1ASpIcR0VBRfL8fzqCpAjmi94GDKBaWUnnbllmZhH3Q
	nWRxAQkEAoarPKVoznk8z+/EjjrQnQg0Ks0jOI45OUbVSXvwb5M51JoMZWr0eOCY92EswNi+McD
	+lntN2g==
X-Received: from pfvx7.prod.google.com ([2002:a05:6a00:2707:b0:847:8f34:1b76])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8f0a:b0:847:86d8:5937
 with SMTP id d2e1a72fcca58-847c51e4a35mr1955201b3a.50.1782934387701; Wed, 01
 Jul 2026 12:33:07 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:54 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-34-seanjc@google.com>
Subject: [PATCH v5 33/51] x86/xen/time: NOP-ify x86_platform's sched_clock
 save/restore hooks
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
X-purgate-ID: tlsNG-bad1c0/1782934390-46739986-C55DB5E4/13/0
X-purgate-type: clean
X-purgate-size: 1157

NOP-ify the x86_platform sched_clock save/restore hooks when setting up
Xen's PV clock to make it somewhat obvious the hooks aren't used when
running as a Xen guest (Xen uses a paravirtualized suspend/resume flow).

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/xen/time.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 487ad838c441..477441752f40 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -567,6 +567,12 @@ static void __init xen_init_time_common(void)
 	xen_sched_clock_offset = xen_clocksource_read();
 	static_call_update(pv_steal_clock, xen_steal_clock);
 	paravirt_set_sched_clock(xen_sched_clock);
+	/*
+	 * Xen has paravirtualized suspend/resume and so doesn't use the common
+	 * x86 sched_clock save/restore hooks.
+	 */
+	x86_platform.save_sched_clock_state = x86_init_noop;
+	x86_platform.restore_sched_clock_state = x86_init_noop;
 
 	x86_init.hyper.get_tsc_khz = xen_tsc_khz;
 	x86_platform.get_wallclock = xen_get_wallclock;
-- 
2.55.0.rc0.799.gd6f94ed593-goog


