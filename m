Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08209C5AC82
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:41:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385493.1627988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7iJ-0008V2-9o; Thu, 06 Aug 2026 23:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385493.1627988; Thu, 06 Aug 2026 23:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7iJ-0008U8-5M; Thu, 06 Aug 2026 23:41:27 +0000
Received: by outflank-mailman (input) for mailman id 1385493;
 Thu, 06 Aug 2026 23:41:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3shp1agYKCRcF1xA6z3BB381.zB9K1A-01I1885FGF.K1ACEB61zG.BE3@flex--seanjc.bounces.google.com>)
 id 1ws7iH-0008Nb-Rw
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:41:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7iH-00H1om-8Y
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:41:25 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3shp1agYKCRcF1xA6z3BB381.zB9K1A-01I1885FGF.K1ACEB61zG.BE3@flex--seanjc.bounces.google.com>)
 id 6a751b6a-5cb7-0a2a0a5109dd-0a2a45058b62-16
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:41:25 +0200
Received: from [209.85.210.198] (helo=mail-pf1-f198.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3shp1agYKCRcF1xA6z3BB381.zB9K1A-01I1885FGF.K1ACEB61zG.BE3@flex--seanjc.bounces.google.com>)
 id 6a751ab3-4cb1-0a2a45050019-d155d2c6b8a6-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:24 +0200
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-84e375d9736so3450990b3a.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:24 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059443; x=1786664243; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NcgEnPBxyGviYS1Y0BEogKtyt4exk2sJiTd88Re19eg=;
        b=gk79UyMXWHbVx8Tg7IcacASgySWpa/8r9P+UNNN10lXzRr0rRCNjsZ241i87iur94m
         kXlpfambj0vZ4aDfXBL3hYXwf5mKnZ2E4g2HeCALcLv8PjZiz3azvG9X6Kny5FclVUjL
         5B0Yl1up8lStw3KDb4u6h/ZLNXrnipkOimgf86rICGHF5aCo/BQxDn7G0KcSsgIQUBh+
         /8wZDNsoNBkHtz8MXYUxzcfyfVbxSBl2fuMgVUx2aa5DiRHw5QDjGcX2R9xQqgLstMV5
         gXwXP0F7y0nvA51e0Nh1jCtyb1jThSomHSkr7x00z7HT4dgpY+JHzv76Z/cjrdqK+2V0
         Vuig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059443; x=1786664243;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcgEnPBxyGviYS1Y0BEogKtyt4exk2sJiTd88Re19eg=;
        b=VjNkqZFhRQoZMrBfNT7KNRa1r5jsW8V0VFXUn9a1+PIThyoE5SyZBd1/PNAkuBKJ6p
         uWM6HfKIBroMcFShj1edGoezLU1zVsBr0JnIFYKqzjhXb9y5f9ZYysPHoT6s7Ul6+AZi
         bgph83kxDKKXt3/i8pa0fzg9VC5ThGiEfsEgUQI66CSBk1ChS3L/musn2g0gFX0Ccxx5
         85XylLC8W0DPBIaoVybYKsVb1nkkGahLaVpGpmxRUOJJPTkGn4BPD2S5vJtV0FFz8xGY
         M/xSoLHfYBSMY3tRxoQDlYuG0fgZNTmRQIDUOBXF9ryiQLiG1fxhXHnpVeAvohTbbbtT
         LNTg==
X-Forwarded-Encrypted: i=1; AHgh+RoFvNBDNGWUwZJHIN8zbhFn779uCQM809fUfj6m/JBfhm5lO1mKJpvRRfsGbnyTvMtxoCAINonAtNQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXB72d8kGe9B7dVIPWZW/42lrYKvX/h2Gag9h3gtBolp9EUKWI
	hk/nZFBt1DyK+p7hqH1E/Om1pA6jwG1eBo/K4k7ZY3Hmnk2dWciHDp2+uv7AomVyFymoAonHouL
	1XvZ5yA==
X-Received: from pfbcw11.prod.google.com ([2002:a05:6a00:450b:b0:848:51a7:e8bb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2999:b0:848:67ca:bfd
 with SMTP id d2e1a72fcca58-84f2dff1913mr22778991b3a.16.1786059442569; Thu, 06
 Aug 2026 16:37:22 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:36:04 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-48-seanjc@google.com>
Subject: [PATCH v6 47/51] x86/paravirt: Don't use a PV sched_clock in CoCo
 guests with trusted TSC
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
X-purgate-ID: tlsNG-c201ff/1786059444-71EA92A1-D7CF7710/0/0
X-purgate-type: clean
X-purgate-size: 1384

Silently ignore attempts to switch to a paravirt sched_clock when running
as a CoCo guest with trusted TSC.  In hand-wavy theory, a misbehaving
hypervisor could attack the guest by manipulating the PV clock to affect
guest scheduling in some weird and/or predictable way.  More importantly,
reading TSC on such platforms is faster than any PV clock, and sched_clock
is all about speed.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Nikunj A Dadhania <nikunj@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index fcf331ffd874..c0e4485484f2 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -283,6 +283,15 @@ bool using_native_sched_clock(void)
 int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 				      void (*save)(void), void (*restore)(void))
 {
+	/*
+	 * Don't replace TSC with a PV clock when running as a CoCo guest and
+	 * the TSC is secure/trusted; PV clocks are emulated by the hypervisor,
+	 * which isn't in the guest's TCB.
+	 */
+	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC) ||
+	    boot_cpu_has(X86_FEATURE_TDX_GUEST))
+		return -EPERM;
+
 	if (!stable)
 		clear_sched_clock_stable();
 
-- 
2.55.0.679.g6767b8d81c-goog


