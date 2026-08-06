Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCEBC5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:42:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385540.1628043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7ij-00034B-Ef; Thu, 06 Aug 2026 23:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385540.1628043; Thu, 06 Aug 2026 23:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7ij-00033Z-AH; Thu, 06 Aug 2026 23:41:53 +0000
Received: by outflank-mailman (input) for mailman id 1385540;
 Thu, 06 Aug 2026 23:41:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3kBp1agYKCfMnZVieXbjjbgZ.XjhsZi-YZqZggdnon.sZikmjeZXo.jmb@flex--seanjc.bounces.google.com>)
 id 1ws7ih-0002wK-CD
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:41:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7ig-008OCw-PP
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:41:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3kBp1agYKCfMnZVieXbjjbgZ.XjhsZi-YZqZggdnon.sZikmjeZXo.jmb@flex--seanjc.bounces.google.com>)
 id 6a751ba5-2eae-0a2a0a5409dd-0a2a450a9b14-16
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:41:50 +0200
Received: from [209.85.210.200] (helo=mail-pf1-f200.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3kBp1agYKCfMnZVieXbjjbgZ.XjhsZi-YZqZggdnon.sZikmjeZXo.jmb@flex--seanjc.bounces.google.com>)
 id 6a751a91-f2d2-0a2a450a0019-d155d2c8c457-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:50 +0200
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-84865f326efso3250044b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:49 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059408; x=1786664208; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kOFXKheX158XT5RdBZeZqj6PvfchU0LO18FYNMDj3A4=;
        b=gZd/+F2G6OlP23WLTRA/RMd/lhy3+ox1hcLkW1lN8p3NWHRGsyEGnNR7cJ2tNbcGAW
         smdZvOvZbOxcj7Dl78ycJqVVFfuNN0pHVSuTBwzPY60W6Q0tVmv3cybbHdNlILWHu9f4
         xQrRrPO0jkMS1lni94cmMF3g5N5YNUZtWnlqElhYF3QDnEFXI0ypEZNBsCbXiTss9Uej
         mkXrOkeRvGHGBorhyLzfHCabWi8KxMFcyrhN7RKOihlGcNagtcph4GbHt8rw6oZKFK0Q
         rwrmFQKk0EY0P/rn/uNEBZ9XyA8xizoybwL9M1qj36SO58cEAdRmp+aM6hnFIkU0qjqH
         G0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059408; x=1786664208;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kOFXKheX158XT5RdBZeZqj6PvfchU0LO18FYNMDj3A4=;
        b=jVHNP4Ii/DJCdBU95UK0GsredK2+WXi2uIP9MjpESoXwms36MNAo4Lv0RHOp7ecIAe
         rMofFMMeUKJwvfnrsPiX2vuNkMdmR1M64Q1Y+NNnBy7rEYVqw44+QXZ3q4zouswzzr0j
         AB1EdcgHtSwBYM+HiOVTu5ZWCcPJHVd3QvJBPg1o8XpU8LxUpFEK8uY2ZpizJnZ6pSDW
         gCF6Vqs4Ya5ABmfjXpSYxG6s6tYEZ12vydBIQqcZXS+qUXDHLYgyfBITeIUVWZgapP+p
         Ls0EpNtlCc6aDzDJRy3lWAHXDWNL2LPb6vR2FItclurtD1QjfJR1HYMilKdLfWqtv72W
         i0fw==
X-Forwarded-Encrypted: i=1; AHgh+RphbPeKrUD7Yiy+oLFMgXFDi1Z/xceIYBTVWBz6PAyrHSHYxStaNf+BrSeTTXgXfwgZiNKyi3B9iOs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0AUbxenQEKwk73e+skrhVfUbPhFlxiJn2TPuOcBx43Yy40tLc
	/eF73gVJ4IzXFJlEqvedysWBf3hT9CwiEzNJspyuZ3YI7qJVI5PBJipvIZ4gyU+s4nava/LqTT+
	mSEx4UQ==
X-Received: from pgay6.prod.google.com ([2002:a05:6a02:4966:b0:cbb:8616:5536])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3d4f:b0:847:9188:e492
 with SMTP id d2e1a72fcca58-84f2e04d173mr18898130b3a.22.1786059408172; Thu, 06
 Aug 2026 16:36:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:36 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-20-seanjc@google.com>
Subject: [PATCH v6 19/51] x86/kvmclock: Drop dead check on TSC being unstable
 during kvmclock_init()
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
X-purgate-ID: tlsNG-4011c0/1786059410-53CD3CFC-F03526C2/0/0
X-purgate-type: clean
X-purgate-size: 1729

As pointed out by Sashiko[*], kvmclock_init() runs before __setup() and
thus before notsc_setup() or tsc_setup() can mark the TSC unstable.
kvmclock_init() also runs well before tsc_init(), and even before
tsc_early_init().  Simply delete the check, as it's been dead code since
it was introduced.

Note, odds are good the check_tsc_unstable() call was copied from Xen's
xen_time_init()+xen_tsc_safe_clocksource() logic (as so much of KVM's PV
code was).  However, xen_time_init() runs via x86_init.timers.timer_init(),
which is invoke from x86_late_time_init(), and thus after params have been
parsed.

Alternatively, kvmclock could register itself later on, or tsc_setup()
could be parsed as an early param.  Given that there's zero evidence there
was any meaningful intent or need to actually check for an unstable TSC,
go with the simplest option.

Fixes: 7539b174aef4 ("x86: kvmguest: use TSC clocksource if invariant TSC is exposed")
Link: https://lore.kernel.org/all/20260529181213.0B27A1F00893@smtp.kernel.org [*]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 061a22d31dea..29ca37e9a3bc 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -362,8 +362,7 @@ void __init kvmclock_init(void)
 	 *
 	 */
 	if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
-	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
-	    !check_tsc_unstable())
+	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC))
 		kvm_clock.rating = 299;
 
 	clocksource_register_hz(&kvm_clock, NSEC_PER_SEC);
-- 
2.55.0.679.g6767b8d81c-goog


