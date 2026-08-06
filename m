Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480BFC5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:42:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385577.1628106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7j0-0005eF-5b; Thu, 06 Aug 2026 23:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385577.1628106; Thu, 06 Aug 2026 23:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7iz-0005dt-Uw; Thu, 06 Aug 2026 23:42:09 +0000
Received: by outflank-mailman (input) for mailman id 1385577;
 Thu, 06 Aug 2026 23:42:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3oRp1agYKCQYykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 1ws7iy-0005YJ-Nj
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:42:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7iy-00EMFx-4g
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:42:08 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3oRp1agYKCQYykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 6a751ba5-2eae-0a2a0a5409dd-0a2a450a9b14-32
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:42:08 +0200
Received: from [209.85.210.197] (helo=mail-pf1-f197.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3oRp1agYKCQYykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 6a751aa2-f2d2-0a2a450a0019-d155d2c5a962-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:07 +0200
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-84a251c2e3eso1816043b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:07 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059426; x=1786664226; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7lbZxAdhwKhuj6TvbAGr7x+TgvyyRrRPdrrP8vwGefI=;
        b=gb840K9NfEn/C6h5FHraJYb1bYxHmL0lL+af7n2/IFou3Kddqy4nMf5Ls0/rzrR+Rh
         O57JCe6jNvrDt2PxW9Ntz/Jnnk14mue4Ky9ZMMlfbdVyBUCaHE/Vw4QjJe3XhmHquu10
         H6UOmZyctytwi238Kt7fvPObnMYSMjvMWkf8B1flf/zQXnUWiGpsv8h9RBpvbovbpZrB
         vTFbLPQM0cz8azR/0xmxg/TBTFcLGflRK5w8wMly5OYTl9inaOsayMykDjYkEfBu3IgT
         DryCKtvmQZ6icLzs/KBXjTDeaOLFLBNWNwZmi8P/9JVHcr9dETHo9pvVqZbnQdq7tRF3
         Dh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059426; x=1786664226;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7lbZxAdhwKhuj6TvbAGr7x+TgvyyRrRPdrrP8vwGefI=;
        b=j8CWkRjmb5WyasPnc+QPuULC+T+L2Y6u56UwPnFK5Zxj2CZ2fQ1graYNYyqFj0BV8F
         SHj4908dJCK2izyyCKamZXuSCPjIu8/V8r53L1vUn15LFCImNm3CtV8xMaPCx806UnR0
         ydLC9EiL6oUQILMizJxCpqsi9BkWdbDF8d8nEYGkWKmVU5rkAkQ/DiazSBBpWLWZs7yi
         OOdmKjtvsfLJv2VwmMt/TabmfPacFcmZDcYLivnY1S8f0pnmiWRKDO9g5JOAyLduOnlU
         mMriHQ1gpC1N5ZmMNYMsyH+qFZcnjgWMbzdpAgeXzZ/c0v4p/vEuWfkcW0w4HACA8jaf
         MK5w==
X-Forwarded-Encrypted: i=1; AHgh+RrkXt6iv5Dy51jvtrZA+b6E+kLKTlSz1LQQvAfdufIee1L5uBPMHvjgjPrNb05Eu47CrXz12F+zYyo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywxkui/WVTwdm/W9p9Q//zVB6WD/BDAhNQclStWIJHtQru8A8B2
	jhZ3uzP4hrkzHB0Hxx4WAS/rcSwmzfWf8rc7x4RbodH5kjNp+oHbmz4/W0ynQFtuDPCbeejcN6W
	N5Z3dAA==
X-Received: from pgmt23.prod.google.com ([2002:a63:2257:0:b0:c86:61a1:3390])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7105:b0:3bf:651d:fee0
 with SMTP id adf61e73a8af0-3cba2b5d6a7mr10015839637.19.1786059425491; Thu, 06
 Aug 2026 16:37:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:50 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-34-seanjc@google.com>
Subject: [PATCH v6 33/51] x86/xen/time: NOP-ify x86_platform's sched_clock
 save/restore hooks
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
X-purgate-ID: tlsNG-4011c0/1786059427-51EC2CFC-B6E954E2/0/0
X-purgate-type: clean
X-purgate-size: 1153

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
2.55.0.679.g6767b8d81c-goog


