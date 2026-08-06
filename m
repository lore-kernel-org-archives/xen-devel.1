Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE7BC5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:41:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385522.1628026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7ia-00021T-QN; Thu, 06 Aug 2026 23:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385522.1628026; Thu, 06 Aug 2026 23:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7ia-000206-Jg; Thu, 06 Aug 2026 23:41:44 +0000
Received: by outflank-mailman (input) for mailman id 1385522;
 Thu, 06 Aug 2026 23:41:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3hxp1agYKCeoeQMZVOSaaSXQ.OaYjQZ-PQhQXXUefe.jQZbdaVQOf.adS@flex--seanjc.bounces.google.com>)
 id 1ws7iZ-0001u2-8S
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:41:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7iY-00H1om-LX
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:41:42 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3hxp1agYKCeoeQMZVOSaaSXQ.OaYjQZ-PQhQXXUefe.jQZbdaVQOf.adS@flex--seanjc.bounces.google.com>)
 id 6a751b81-5cb7-0a2a0a5109dd-0a2a450b92be-16
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:41:42 +0200
Received: from [209.85.210.200] (helo=mail-pf1-f200.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3hxp1agYKCeoeQMZVOSaaSXQ.OaYjQZ-PQhQXXUefe.jQZbdaVQOf.adS@flex--seanjc.bounces.google.com>)
 id 6a751a88-b7e8-0a2a450b0019-d155d2c8a497-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:41 +0200
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-848474825ffso2105024b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:41 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059400; x=1786664200; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kmrkRlf4iOUyRYugkcn9gxIXBFL0cMozIwMb4/CeDNQ=;
        b=WxEH38kt8trdGNMyInAbF5tr2ZeIhc6gKC3b0nC1gjlTOkmEGr8zGh6rlHvqOGqo31
         SBA2xCvvczxNopG3jCVl6MQ2s1xvFMiETO1XNST+HX7kv4JJrMMpPuDk9mjDjUszAg0q
         XqQucByNypUdwm4AWh7162V1j4B3CqjkK3fS6n7ihH78jYrSAzjku35tM3kcTKwQwJPl
         rKYHTcQKZS7W1PHBR9kdM8iFyv82ZZY1OYfTqzNl2x7GaEXQRfJBdsZ04pf13cjHK358
         Tf+njsvjKeQyDb01OhVLdZ4DLIFxrX++b3GKWDe4g+/rGscUNxpkGUhcKCusD36VXUKX
         5vCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059400; x=1786664200;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kmrkRlf4iOUyRYugkcn9gxIXBFL0cMozIwMb4/CeDNQ=;
        b=L/dY02vG3ogMwrTh7AeBk7JvtnNlLY+PKS5uYQahdoS5hEeysL+3euuOKPgKVH9e4M
         SiLTirc7AZbqwC5lLowJXY0Y/355o3jUbOHt6GW8M9n3y3R4HkKyykH0MJujLlhvBsqL
         wMVpdiHa9OfGxixl2wVRXwbQKwLSIdsTuSMsgKIp8mATPfylXGkpd4pn+zgbb2QTtrio
         BQ4X7mTZSZ5de8C91PoAevtwncI8Q9briNl9XqvCyd64gxsd5sRZJcyPztqiywJ6kvAx
         VN2iOz4uLBwNY4R1KrNi+08UIMH3sTuZyIx12tQINs+r5HDyz6JSLshVptTX3D9sUsEb
         W93Q==
X-Forwarded-Encrypted: i=1; AHgh+RoZrF8/hlPQcEmlruUHLlkQN/avZ1P1wBOcw/kr9XggM1GkCaNzEB/NGzDmy3r568/8b7LWHb+758k=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyq97ujbmtdgKd1l4wxcld/rR5bXsY6XkGTxRhTlej4u52MEuRo
	b1m+zZ10vIOlXtUBcYqf+yA5pWlr27f457fcqwN0+x0kr5Xq4VMDqguO8DphNU/C4juzUgv/IHF
	35ubDbQ==
X-Received: from pfbcz9.prod.google.com ([2002:aa7:9309:0:b0:847:aa6c:47fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4648:b0:842:63f5:d097
 with SMTP id d2e1a72fcca58-84f41ba51c5mr11209793b3a.3.1786059399712; Thu, 06
 Aug 2026 16:36:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:30 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-14-seanjc@google.com>
Subject: [PATCH v6 13/51] x86/acrn: Mark TSC frequency as known when using
 ACRN for calibration
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
X-purgate-ID: tlsNG-42698a/1786059402-A9EC69EA-8845AC6D/0/0
X-purgate-type: clean
X-purgate-size: 812

Mark the TSC frequency as known when using ACRN's PV CPUID information.
Per commit 81a71f51b89e ("x86/acrn: Set up timekeeping") and common sense,
the TSC freq is explicitly provided by the hypervisor.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/acrn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index dc71a6fdd461..3818f6ae0629 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -40,6 +40,7 @@ static void __init acrn_init_platform(void)
 	if (acrn_tsc_khz_cpuid) {
 		x86_init.hyper.get_tsc_khz = acrn_get_tsc_khz;
 		x86_init.hyper.get_cpu_khz = acrn_get_tsc_khz;
+		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	}
 }
 
-- 
2.55.0.679.g6767b8d81c-goog


