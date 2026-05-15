Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA20CD343F
	for <xen-devel@archiver.kernel.org>; Fri, 15 May 2026 19:21:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1310234.1581169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy5i-0002Uj-Ak; Fri, 15 May 2026 19:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310234.1581169; Fri, 15 May 2026 19:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy5h-0002Sh-Qa; Fri, 15 May 2026 19:20:57 +0000
Received: by outflank-mailman (input) for mailman id 1310234;
 Fri, 15 May 2026 19:20:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3FXIHagYKCW4eQMZVOSaaSXQ.OaYjQZ-PQhQXXUefe.jQZbdaVQOf.adS@flex--seanjc.bounces.google.com>)
 id 1wNy5g-0002C9-JN
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:20:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNy5f-009QAT-V6
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:20:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3FXIHagYKCW4eQMZVOSaaSXQ.OaYjQZ-PQhQXXUefe.jQZbdaVQOf.adS@flex--seanjc.bounces.google.com>)
 id 6a077216-e002-0a2a0a5209dd-0a2a450bb856-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:55 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3FXIHagYKCW4eQMZVOSaaSXQ.OaYjQZ-PQhQXXUefe.jQZbdaVQOf.adS@flex--seanjc.bounces.google.com>)
 id 6a077216-212f-0a2a450b0019-d155d2cae4d1-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:55 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-836d0184333so238837b3a.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:20:55 -0700 (PDT)
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
        d=google.com; s=20251104; t=1778872854; x=1779477654; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0xIKAIujVCN543pIVJIG4PCsIsqHFXWMUqZ1keR+hJo=;
        b=TAvQ3/X2R75dev+9KkpLvgy5TClzlRgTXnyLI8B5HYg1mypS7aTe67GKxjKB81bBTN
         QuYLzolJ6ODnXu+EjY1H4kipGxPzwiVcVKDk9ti60hr57zMouWDsczGfeEW9FYPkesBA
         m/sBBYF1X3aZcqLELd4IvHVWB19/o+6eS6lO4RkgpwLZE9cvIMk+ezSkq0rGAmxXjoq2
         xeINojjy1uZgKHDWsTgjdwU/sTI3EfBPWA6ChmmsrS6FHRZoFUsdQNIaHONvfcdLkDH8
         WxxwchGT88MlR6LBNTe2C9OdzTuL1ECUG0K7ilHP22nL+k+s1uja56MYCScgMgC1ZZpy
         m50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872854; x=1779477654;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xIKAIujVCN543pIVJIG4PCsIsqHFXWMUqZ1keR+hJo=;
        b=QZVrDkYCSFCnS6Ign6/rD0MShQOwJEe6KvOY0lvaTUnt+mA0CgBo6HIc0SihA4Agys
         YxbjZYlDOfy7cVIBHsdrW4IvrLW1C7Zjz6dmvhB8WI7pEeojAIL/KmAibuNWdFHRZPKQ
         A4FH38T2ptFhnjt+XpXvImP8Zy2eUPYDuTP/Q5ZjkNluvO6oOjgVfta/h+KkbKhCDu1f
         /0mBny2bXgxzAcdvk1avrOce+SSuVd0UlCYRUqHDDSrglO09CTyxvU2EFG5vZDpkMMRV
         i8rUSrUrDIf6khP9XVbe24LpcNHRjrziSd+/LNgAN7nMQeh8epxxlAXMgur1HAhgkqtr
         rzsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZBEQ0b7kWXsHa6cq8t8RWZvXfJoFkZEHwQwQklrvccX9HZ6aRxHILUxN7mMmSt7jsNpWNR15dzEs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVAyRY2zGgbX1Q3+KVPTCqA5N694a9JQc3LwBUnLjw1A+r9BiH
	cNDPGHrTxxG2tHJRA6cfKhZama1K875+L+BryXglwnKaQ6bmSZNq7+JA+qdC2MtPsxIVNc4+WtM
	LlhXoUQ==
X-Received: from pfbbd18.prod.google.com ([2002:a05:6a00:2792:b0:82f:75de:5da4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1908:b0:82f:50cd:e586
 with SMTP id d2e1a72fcca58-83f33cb2c40mr5886702b3a.13.1778872853499; Fri, 15
 May 2026 12:20:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:22 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-22-seanjc@google.com>
Subject: [PATCH v3 21/41] x86/pvclock: Mark setup helpers and related various
 as __init/__ro_after_init
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
X-purgate-ID: tlsNG-42698a/1778872855-1B374F3B-647E0ED2/0/0
X-purgate-type: clean
X-purgate-size: 1334

Now that Xen PV clock and kvmclock explicitly do setup only during init,
tag the common PV clock flags/vsyscall variables and their mutators with
__init.

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
2.54.0.563.g4f69b47b94-goog


