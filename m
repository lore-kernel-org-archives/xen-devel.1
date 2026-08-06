Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315C0C5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:41:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385503.1628016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7iN-0000wk-FK; Thu, 06 Aug 2026 23:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385503.1628016; Thu, 06 Aug 2026 23:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7iN-0000vE-8F; Thu, 06 Aug 2026 23:41:31 +0000
Received: by outflank-mailman (input) for mailman id 1385503;
 Thu, 06 Aug 2026 23:41:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3txp1agYKCRwK62FB48GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@flex--seanjc.bounces.google.com>)
 id 1ws7iM-0000k9-Er
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:41:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7iL-00EM9p-Ra
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:41:29 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3txp1agYKCRwK62FB48GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@flex--seanjc.bounces.google.com>)
 id 6a751b7a-bab6-0a2a0a5309dd-0a2a4504bd98-24
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:41:29 +0200
Received: from [209.85.215.200] (helo=mail-pg1-f200.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3txp1agYKCRwK62FB48GG8D6.4GEP6F-56N6DDAKLK.P6FHJGB64L.GJ8@flex--seanjc.bounces.google.com>)
 id 6a751ab8-b57f-0a2a45040019-d155d7c8b14a-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:29 +0200
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-ca8aee88725so3901087a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:28 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059447; x=1786664247; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WG6tzs8/D5vUVAMD7J6BXfy7SNaM+XPXtfc+RTelhM8=;
        b=uilflh9oNcI4wX1XQh3mgOAdnBE24/Vkfwf1yWU7PcpqnqFe/kuZbMpRi1pLfb2KZ0
         VZ/LwfvIbGr73tCz8kC9XDoP4N0aL7L1e/lfHrCAK/sJ/CNF/ejoaiHDbv14ZZmsR+Qi
         0akxKxKPHK6tNL4fzdTwl7wdvSb2PahL+HPR6675LOh+Geqya/hbBQjlJqwcGq/ZvXKW
         NxCY6munzfMmtwwiEu714ucw9sj+5PcGW+jlA/GefI5t1B62/7jQhRcfu4ZhJvrM4fIq
         nuyrXU/spECm3FpJo4AkqFiS14fSP+4ADS3yoBCQm4ap8b0lGKt3Kb6Xc4puF3yeATII
         z3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059447; x=1786664247;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WG6tzs8/D5vUVAMD7J6BXfy7SNaM+XPXtfc+RTelhM8=;
        b=fUOnWZXl9RGTuQtHKDL3QLa22mkfWAuhmYhlgtxAn4vFoiTWSFtkqX4foOxS1zR1Kd
         OwDB52Uxa7q3U8MSVDCkEWc0yv66xLTOmnHp3z3kiKhAw4mplXp5tQMM4EiqN/mNxe2u
         wj0+eELNirKDqfTp73vaUa5pNOPvHMFHPLHuCDi1zYllBUBw9t73kXR5lrKA8bXCnBiF
         3GvdG8ysiSgT+BPZTQw+aU7e/kUs3C3fTOznQKyUEf7hl4j9JSgBphAbKjuXyWxUUt1K
         igJpmnoPs6njjS0DGV/WLbxbb0YueZhGpH/wwntUfT4SGd/TZCnXzjnGjdv9TkcBTtfl
         GkpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqpu1q9OfFdUa8n/Gtrq3JOWx3bUVKLY5vx1YjDRDZ/2wA7HJzHNWg2u9HHrRMSKyJt/CEnEJEspdI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhT79nc8LkzpxtycXFq4cT+jFMNHCgivAamPwH57Hkmnw0w5kT
	RzMB3Sdun9HXl21ZVO8Kz7oTPQ//0lq0ZFUVr7iBNvhBKgIsm6Oe47ehehSOOfRtvv2pO8VkwaL
	4QWXmlw==
X-Received: from pjgg14.prod.google.com ([2002:a17:90b:57ce:b0:380:f969:825e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2590:b0:38f:2168:b9cb
 with SMTP id 98e67ed59e1d1-3903c572a05mr18788898a91.9.1786059447175; Thu, 06
 Aug 2026 16:37:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:36:08 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-52-seanjc@google.com>
Subject: [PATCH v6 51/51] x86/kvm: Get local APIC bus frequency from PV CPUID
 Timing Info
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
X-purgate-ID: tlsNG-ebf023/1786059449-C24CBB50-6CCD359A/13/0
X-purgate-type: clean
X-purgate-size: 1406

When running as a KVM guest with PV timing info provided by the host,
stuff the APIC timer period/frequency with the local APIC bus frequency
reported in CPUID.0x40000010.EBX instead of trying to calibrate/guess the
frequency.

See Documentation/virt/kvm/x86/cpuid.rst for details.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index b954238b09fc..edeff41c03c2 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -992,7 +992,7 @@ static void __init kvm_init_platform(void)
 		.mask_lo = (u32)(~(SZ_4G - tolud - 1)) | MTRR_PHYSMASK_V,
 		.mask_hi = (BIT_ULL(boot_cpu_data.x86_phys_bits) - 1) >> 32,
 	};
-	u32 timing_info_leaf;
+	u32 timing_info_leaf, apic_khz;
 	bool tsc_is_reliable;
 
 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
@@ -1054,6 +1054,11 @@ static void __init kvm_init_platform(void)
 			x86_init.hyper.get_tsc_khz = kvm_get_tsc_khz;
 			x86_init.hyper.get_cpu_khz = kvm_get_tsc_khz;
 		}
+
+		/* The leaf also includes the local APIC bus/timer frequency.*/
+		apic_khz = cpuid_ebx(timing_info_leaf);
+		if (apic_khz)
+			apic_set_timer_frequency_khz(apic_khz, "KVM hypervisor");
 	}
 
 	/*
-- 
2.55.0.679.g6767b8d81c-goog


