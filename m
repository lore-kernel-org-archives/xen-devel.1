Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53996C43602
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:35:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350657.1608177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iL-0000IV-B0; Wed, 01 Jul 2026 19:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350657.1608177; Wed, 01 Jul 2026 19:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iL-0000IH-7E; Wed, 01 Jul 2026 19:35:17 +0000
Received: by outflank-mailman (input) for mailman id 1350657;
 Wed, 01 Jul 2026 19:35:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3eWtFagYKCb4wierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 1wf0iK-0000G4-CG
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:35:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0iJ-00BwWE-PH
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:35:15 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3eWtFagYKCb4wierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 6a456bcf-5cb7-0a2a0a5109dd-0a2a4506e1aa-36
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:35:15 +0200
Received: from [209.85.214.201] (helo=mail-pl1-f201.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3eWtFagYKCb4wierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 6a456b7a-08de-0a2a45060019-d155d6c9b97d-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:33:15 +0200
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2c9960cf96cso12694165ad.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:33:15 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934393; x=1783539193; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=webyAG7YP8cSF0fuLH5JBcVLeBtJwYsS/eijECri5dU=;
        b=OKXqgrGZQFKq4YulmQwZSpjjqpuNeBTc1pQbh5eMBcCkxDLOqdt1oyXBOJY2rWwgEv
         q/1WCNCMGS5WNGCVzl0PA8i26PM7a/bICuNlzi6i+i7Xx+wEfCekH7AZZ8WbcEkYqdwQ
         MPiPmV1kckR8XalKjGtIRiuJUsSk98NPcjlH0sdNEtKLSkFwfb212af+uR7POKRHs7Ut
         JF+N8Q5PeT/t5WlAkc3jj31kLbGhuiKfBRnt0Nwh/FOK6UQRWHyQF7QoozGif1lxvHBZ
         bpNDmzaAtMxzOAwprG3ktdM9+aTQyNoX7SFQ2KjSpjupdpduz3f+akv2bSaF4eujo5JI
         IabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934393; x=1783539193;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=webyAG7YP8cSF0fuLH5JBcVLeBtJwYsS/eijECri5dU=;
        b=OuRLhE2gMPVdsYMy4T1+712VmMU5LS7Oq+Dkqg7E9AWmAFETzVLVgFzP5GNQ1KRFdi
         nYEAI3qQ4J1pv4vxQ/g2kXBZLsuPDG14h2/kbvEIVQzryJ+uR0ldV4NAsRvxs5txGTTB
         FTdrkgJfAOPkldM5bcoBiVGD+BUBY5T9+FZJTDIUIIq5nEX513XR8GFgTyqob7ekhx+h
         vcQBksnLrv2h+ay3Kvrikm7pY/CAgOc7P3vgksqJppeNw+tpY3Jxdk6kT68H2SlqWHaS
         zibVelB2AJTQaOnIH5QFJxngdODj4+rfpZT7H1NNcGy/V031hcEwZK1vG6xUhYTVnI5m
         Ohfw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0g2pRXCYtn6TstVNPdRaRWIh4rpg/xu88JCfC+bSOp/uW7lQUSIDXvnkydq49kyDCA5jeX52P0f4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwO7b2edzjpOridun9c53Bl16cjkxs09seqHwNx6ExKeOBqdi53
	3BPTL3tBw6SjXk3baSkIz7TvkqtYE1YZYbg/otrjMP7OuzfMRo19/5oPuGczfLEOxa3vHlxhv0c
	p5t1MIg==
X-Received: from plq6.prod.google.com ([2002:a17:903:2f86:b0:2bd:c5f9:e27b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d48b:b0:2c9:feea:4e50
 with SMTP id d9443c01a7336-2ca7e71111emr31590225ad.10.1782934393274; Wed, 01
 Jul 2026 12:33:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:59 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-39-seanjc@google.com>
Subject: [PATCH v5 38/51] x86/xen/time: Mark xen_setup_vsyscall_time_info() as __init
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
X-purgate-ID: tlsNG-16d1c6/1782934395-C473068D-A2936141/13/0
X-purgate-type: clean
X-purgate-size: 883

Annotate xen_setup_vsyscall_time_info() as being used only during kernel
initialization; it's called only by xen_time_init(), which is already
tagged __init.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/xen/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 8cd8bfaf1320..bc26f00fc53e 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -443,7 +443,7 @@ void xen_restore_time_memory_area(void)
 	xen_sched_clock_offset = xen_clocksource_read() - xen_clock_value_saved;
 }
 
-static void xen_setup_vsyscall_time_info(void)
+static void __init xen_setup_vsyscall_time_info(void)
 {
 	struct vcpu_register_time_memory_area t;
 	struct pvclock_vsyscall_time_info *ti;
-- 
2.55.0.rc0.799.gd6f94ed593-goog


