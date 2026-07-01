Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20958C43602
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:35:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350659.1608186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iM-0000Za-KS; Wed, 01 Jul 2026 19:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350659.1608186; Wed, 01 Jul 2026 19:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iM-0000Ye-GV; Wed, 01 Jul 2026 19:35:18 +0000
Received: by outflank-mailman (input) for mailman id 1350659;
 Wed, 01 Jul 2026 19:35:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3emtFagYKCb8xjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 1wf0iL-0000Om-RX
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:35:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0iL-003oQR-8A
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:35:17 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3emtFagYKCb8xjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 6a456bbc-2eae-0a2a0a5409dd-0a2a450aa144-40
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:35:17 +0200
Received: from [209.85.215.202] (helo=mail-pg1-f202.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3emtFagYKCb8xjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 6a456b7b-e40e-0a2a450a0019-d155d7cad925-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:33:16 +0200
Received: by mail-pg1-f202.google.com with SMTP id
 41be03b00d2f7-c916d17dd43so1230778a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:33:16 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934395; x=1783539195; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gy5b+9Ie1Ki1M0iB4wQwCtkzcjH6HRhEeykN2jC/eJ8=;
        b=rWmBnnBCYRZ4Oc21boEFED1J2x0B1UJGWEeE1ot96PznZdbNEtpnLmoBOMI0jvcB7O
         RNcuGFeG4GB2oeSiN8PhrIEkb0IyB4MDOdnOSQOPv4i3xbHFc1zZSkJN3V2T/LYOgiFx
         pT9GpoeQGCg1VkrFSb5zQ/q9piHFNQTeSmuVdJScsFKDSC5APEfaCnhDuYoNnguDyS7u
         v0g8Su8B8JZuhXzVT03s8iqrpbANsZ6xBHKaI6LQcXHElSkBD8wTdbFy2q7e+rZ2L+bE
         RcvoSq24554CiWE25RlIZSy+3IZVdpW/LeqE4lfvxVI5XgwbpV5LZoV3OMn8AbKl+/gZ
         R9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934395; x=1783539195;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gy5b+9Ie1Ki1M0iB4wQwCtkzcjH6HRhEeykN2jC/eJ8=;
        b=FbNsNHdLOqmx5ZLTlBbLdYXFu2ngBRxvbxv3jdwCJ8M/6gZQE8gGfoPQHFQOr8G2OK
         7bxbJF0y4F/U4aFg56oqEPFqj5JE2+ViOxKKIBBN5vh49bRb+ntjyOVomyddCJj4xiXd
         /dvsA/9IqwDS0uABD8GJblfre8v10bNizAgD437Oyi0lBotAhW2709RzeN6EA/+OVDl0
         sjJ3+aBb2JiO9uVd2gAWrkHiKMif5hYU0r4YTAMLcpP592/FT7KgPfM0Ny8VihEjlZ42
         vAEgb4T1/Mn7jo3/LXrDrCZKUsI4M44BzpQ78ii5HmZlMu6JdnkstSg/lF1T3uTfQKzA
         TiKA==
X-Forwarded-Encrypted: i=1; AHgh+RrX2hcZbUflFUhJjV+ixfLlofW6/MBH1Z2b3EraNT5dUBcdOnPczZPMokGE9UimM1hnpJSDdCnrBaA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJLHmu5xX8EAsm11hLMbrQYCa+ToroG9ctSJWj5glGSzZIQm2E
	r+SaBAbfdUd8TZdd7UZ2CdLKrH6jI4laemvWo1jvn3kHxf/zUPkudfrmwcQG3g6sxIZkv4Ojauf
	fWL7xXA==
X-Received: from pfbbk23.prod.google.com ([2002:aa7:8317:0:b0:846:7503:7350])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3d56:b0:845:36a0:9eb2
 with SMTP id d2e1a72fcca58-847c096d1f0mr2944243b3a.34.1782934394416; Wed, 01
 Jul 2026 12:33:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:32:00 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-40-seanjc@google.com>
Subject: [PATCH v5 39/51] x86/pvclock: Mark setup helpers and related various
 as __init/__ro_after_init
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
X-purgate-ID: tlsNG-4011c0/1782934397-D472EDDE-E6EA5604/13/0
X-purgate-type: clean
X-purgate-size: 1388

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
2.55.0.rc0.799.gd6f94ed593-goog


