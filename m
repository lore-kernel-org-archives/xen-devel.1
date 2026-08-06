Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE70C5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:40:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385459.1627917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7h1-0005MG-4o; Thu, 06 Aug 2026 23:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385459.1627917; Thu, 06 Aug 2026 23:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7h1-0005Lb-0F; Thu, 06 Aug 2026 23:40:07 +0000
Received: by outflank-mailman (input) for mailman id 1385459;
 Thu, 06 Aug 2026 23:40:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3nxp1agYKCQQwierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 1ws7h0-0005Ip-4K
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:40:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7gz-008O38-HU
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:40:05 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3nxp1agYKCQQwierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 6a751b32-2eae-0a2a0a5409dd-0a2a4506abfa-32
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:40:05 +0200
Received: from [209.85.210.198] (helo=mail-pf1-f198.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3nxp1agYKCQQwierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 6a751a9f-195a-0a2a45060019-d155d2c6d4bf-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:05 +0200
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-84eee2147ffso3479047b3a.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:04 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059423; x=1786664223; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vn6W6kHEL1s4RiTIjTKhQPQXVLtQ6/4gpgI7E1htjZ4=;
        b=L+lNhrIiLPPkrx9RhTXHgKpvAT8p1sItqamBUWfrX2xvWk3lLOs7XTlq+piC9SQNz3
         nnkdSsknXF2qnBCK6kp4Ejrj9wlD15lMSHPUxFvLduy4auSofNxJRCeeQcS8g3wvRF6N
         OTwYl37lmpHoGboe+cRTrYnpMrym4+lPiI+K9YRMHAPHlYNMbxntdRuju/NcFBj+J/c/
         LQkVftSXJ+7/8Jhg7vCCgostOmAzjZMyQiiyViOjm3C4USbhlEobSeztEu24X26OzKe1
         ZLEXp0sqmS69ms5DUGtuatdsmLuOedEkOkh2DsxXuJ/F8RsVjwM8VBPqcIHRoS1rRfXe
         eVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059423; x=1786664223;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vn6W6kHEL1s4RiTIjTKhQPQXVLtQ6/4gpgI7E1htjZ4=;
        b=sUB/3jO4ke7db79uU3aHqqZg00ow/al4n0c9Bww7ECkAy1dPcg6x8fOuFB/wq8gjaV
         sZTtbTWMhtvr1ypWSepS32n8Lhu/2mEXUMrk6mzeyiR3/R3xejEyT/jVy4HV6lv8FWvC
         kTxcGgQlOH3pmSb7zgECE43A3+8m9onyDASdv9NrxemlHXtCZPrdHndtSUMKaEi5y/LN
         tF/WNkOPPiHrHOxozADBKM4NE7tEKsnSB3BOWO9j7/n+1WdUF9kbI0h3Wdc1dsIjq8OC
         Yo9yaroM/4d37V+fueL6cqWGM8W4SuP0U5zc/GHxuJ/A8k2hlmP1uhsK2dPom8sTpLjd
         dCGg==
X-Forwarded-Encrypted: i=1; AHgh+Rrm/b1JUdNzrGZKXysurfUr9FnuzKCxIk3dWlBnQmdPsj9TMMhS9Ky3/sOEeSpXE73HFhGCOaR3QsQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQp18155z5eXyWRUwrPsQy9pWyWJJErVE15X6u6YOuSbVUZ5tt
	STdxygpzb+CGK+oZR9gVcIoblc5Vz5BkdbtV2bUwahwLItViBT1L9YDDvKOkzFinowbh6Ermj4c
	qpYsBew==
X-Received: from pfbbx10.prod.google.com ([2002:a05:6a00:428a:b0:848:2e0e:62e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1daa:b0:848:401c:98e
 with SMTP id d2e1a72fcca58-84f2e0432a7mr20883954b3a.15.1786059423013; Thu, 06
 Aug 2026 16:37:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:48 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-32-seanjc@google.com>
Subject: [PATCH v6 31/51] x86/paravirt: Move handling of unstable PV clocks
 into paravirt_set_sched_clock()
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
X-purgate-ID: tlsNG-16d1c6/1786059425-F4A0477B-06BBC8DE/0/0
X-purgate-type: clean
X-purgate-size: 2569

Move the handling of unstable PV clocks, of which kvmclock is the only
example, into paravirt_set_sched_clock().  This will allow modifying
paravirt_set_sched_clock() to keep using the TSC for sched_clock in
certain scenarios without unintentionally marking the TSC-based clock as
unstable.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 7 ++++++-
 arch/x86/kernel/kvmclock.c   | 5 +----
 arch/x86/kernel/tsc.c        | 5 ++++-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index c71b466d6ace..fe41d40a9ae6 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -14,7 +14,12 @@ extern int no_timer_check;
 extern bool using_native_sched_clock(void);
 
 #ifdef CONFIG_PARAVIRT
-void paravirt_set_sched_clock(u64 (*func)(void));
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable);
+
+static inline void paravirt_set_sched_clock(u64 (*func)(void))
+{
+	__paravirt_set_sched_clock(func, true);
+}
 #endif
 
 /*
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index a3ec298d56d7..4bc0495f1f9e 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -12,7 +12,6 @@
 #include <linux/hardirq.h>
 #include <linux/cpuhotplug.h>
 #include <linux/sched.h>
-#include <linux/sched/clock.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/set_memory.h>
@@ -115,10 +114,8 @@ static noinstr u64 kvm_sched_clock_read(void)
 
 static inline void kvm_sched_clock_init(bool stable)
 {
-	if (!stable)
-		clear_sched_clock_stable();
 	kvm_sched_clock_offset = kvm_clock_read();
-	paravirt_set_sched_clock(kvm_sched_clock_read);
+	__paravirt_set_sched_clock(kvm_sched_clock_read, stable);
 
 	pr_info("kvm-clock: using sched offset of %llu cycles",
 		kvm_sched_clock_offset);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index e0bea58b6658..964f3d6c2c71 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -280,8 +280,11 @@ bool using_native_sched_clock(void)
 	return static_call_query(pv_sched_clock) == native_sched_clock;
 }
 
-void paravirt_set_sched_clock(u64 (*func)(void))
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable)
 {
+	if (!stable)
+		clear_sched_clock_stable();
+
 	static_call_update(pv_sched_clock, func);
 }
 #else
-- 
2.55.0.679.g6767b8d81c-goog


