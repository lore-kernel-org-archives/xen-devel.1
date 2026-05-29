Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C6DCD6E4A
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2026 15:08:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1322441.1588708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyon-0006Bz-SX; Fri, 29 May 2026 15:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322441.1588708; Fri, 29 May 2026 15:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyon-0006Br-Pt; Fri, 29 May 2026 15:08:13 +0000
Received: by outflank-mailman (input) for mailman id 1322441;
 Fri, 29 May 2026 15:08:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <32qsZagYKCe8jVReaTXffXcV.TfdoVe-UVmVccZjkj.oVegifaVTk.fiX@flex--seanjc.bounces.google.com>)
 id 1wSyon-00069x-55
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:08:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSyom-009KEh-HM
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:08:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <32qsZagYKCe8jVReaTXffXcV.TfdoVe-UVmVccZjkj.oVegifaVTk.fiX@flex--seanjc.bounces.google.com>)
 id 6a19abc2-5cb7-0a2a0a5109dd-0a2a4509b480-48
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:08:12 +0200
Received: from [209.85.215.201] (helo=mail-pg1-f201.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <32qsZagYKCe8jVReaTXffXcV.TfdoVe-UVmVccZjkj.oVegifaVTk.fiX@flex--seanjc.bounces.google.com>)
 id 6a19abdb-2497-0a2a45090019-d155d7c9e8fb-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:08:12 +0200
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-c82ba4715b6so14995163a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:08:11 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780067290; x=1780672090; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4xsn0b4/TuAYVw8d7nIvqzj+ui/IxR9VfuC7re3vJ7o=;
        b=FbxfYU86KBeF6DrXroMRvR539vCVARty3gl1Xo9IrIlf3w+os/s7XKeRLC0SIoesJh
         vTvwDpphdybGEVRLKiJdYietr3lppS7TThOSoWrMBQkXqmWkSve4cZpRQlr381ob+7f0
         BUyfau3CEraiEqhOt/IVz4S13kKaqldkHrk+qAy6OE3oiF4DaiZnCCEeAdweXuu4LRBV
         I1kVZNEPuWn+ZP1daq6TOYEzlv0M4Bnwxz66ylLGUTzCAcZ/idMIi+Yyc74IP3mnEivb
         07RwRZtzAuv+C0ZkTl1kXiwlfcBsA3Y7rSYJX3sr7NBTagukdLJFENW6zfMfp9KI3LPP
         7nrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067290; x=1780672090;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xsn0b4/TuAYVw8d7nIvqzj+ui/IxR9VfuC7re3vJ7o=;
        b=tCRCYDKuO2F2qJ9G/m4ApeX5VIRZFYbqHKq4nsQXHNh5MyelZTSkTWucwj4flI9392
         P+yTQjd6BAz9pqcZ4gDByrrH3MDDlY3fuIxYD55Wns42d6k0A/2FnLpxekH8j2FkkaFQ
         zWwEZHtMSOgm5JbBbhqk1UhB1mLCkdXoZsGQZpyRS/KQ2LpdaxttRDv5is/ASEOO6wqG
         A5DO+sEpH6CXq/IvwkXObelXS4Km6KfFQk1SSUR/++/H2Wep9f8L398mZeWw+0lZS0IL
         Rzky0RcYH3Mxtzpi31N0bHZVV0fs/sHariXDqn76bTXD4UWQLDWYa9zL1K3iQU6OoNmT
         0wYg==
X-Forwarded-Encrypted: i=1; AFNElJ/I/Gi6yCHqkkJ3IWO0PqjzQhhnHaJQPSyYJMBZhMGn3MxfsN96PaSJB56Gt9XMEhFquGezSnIKblo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYmb9MemeKEafXKqqfb4Nh4NkIN94KlnwA3wKYRaBy8C/ZGhX4
	j6UGZWUepncyWdbs0hJpWSE58OIsDZ05Hki8ovtnv1MEitGcle3m+xBoyOW6S7eKZwo8CLr9plt
	iyleOuA==
X-Received: from pgfu20.prod.google.com ([2002:a65:6714:0:b0:c85:82f6:34d1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2452:b0:3b3:24d5:d656
 with SMTP id adf61e73a8af0-3b411deb049mr3990553637.23.1780067290086; Fri, 29
 May 2026 08:08:10 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:08:07 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150807.714538-1-seanjc@google.com>
Subject: [PATCH v4 36/47] x86/pvclock: Mark setup helpers and related various
 as __init/__ro_after_init
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-bad1c0/1780067292-37979A53-5F630D5C/0/0
X-purgate-type: clean
X-purgate-size: 1384

Now that Xen PV clock and kvmclock explicitly do setup only during init,
tag the common PV clock flags/vsyscall variables and their mutators with
__init.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/pvclock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/pvclock.c b/arch/x86/kernel/pvclock.c
index b3f81379c2fc..a51adce67f92 100644
--- a/arch/x86/kernel/pvclock.c
+++ b/arch/x86/kernel/pvclock.c
@@ -16,10 +16,10 @@
 #include <asm/pvclock.h>
 #include <asm/vgtod.h>
 
-static u8 valid_flags __read_mostly = 0;
-static struct pvclock_vsyscall_time_info *pvti_cpu0_va __read_mostly;
+static u8 valid_flags __ro_after_init = 0;
+static struct pvclock_vsyscall_time_info *pvti_cpu0_va __ro_after_init;
 
-void pvclock_set_flags(u8 flags)
+void __init pvclock_set_flags(u8 flags)
 {
 	valid_flags = flags;
 }
@@ -153,7 +153,7 @@ void pvclock_read_wallclock(struct pvclock_wall_clock *wall_clock,
 	set_normalized_timespec64(ts, now.tv_sec, now.tv_nsec);
 }
 
-void pvclock_set_pvti_cpu0_va(struct pvclock_vsyscall_time_info *pvti)
+void __init pvclock_set_pvti_cpu0_va(struct pvclock_vsyscall_time_info *pvti)
 {
 	WARN_ON(vclock_was_used(VDSO_CLOCKMODE_PVCLOCK));
 	pvti_cpu0_va = pvti;
-- 
2.54.0.823.g6e5bcc1fc9-goog


