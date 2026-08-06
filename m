Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0C1C5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:40:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385467.1627934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7hH-00068X-Ha; Thu, 06 Aug 2026 23:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385467.1627934; Thu, 06 Aug 2026 23:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7hH-00068O-Eu; Thu, 06 Aug 2026 23:40:23 +0000
Received: by outflank-mailman (input) for mailman id 1385467;
 Thu, 06 Aug 2026 23:40:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3rhp1agYKCRMBxt62vz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@flex--seanjc.bounces.google.com>)
 id 1ws7hG-00066O-6k
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:40:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7hF-009HnE-Jv
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:40:21 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3rhp1agYKCRMBxt62vz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@flex--seanjc.bounces.google.com>)
 id 6a751b63-e002-0a2a0a5209dd-0a2a4506acd4-2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:40:21 +0200
Received: from [209.85.210.200] (helo=mail-pf1-f200.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3rhp1agYKCRMBxt62vz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@flex--seanjc.bounces.google.com>)
 id 6a751aaf-195a-0a2a45060019-d155d2c8b1ac-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:21 +0200
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-84a3514f912so4400199b3a.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:20 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059439; x=1786664239; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+wCYK2twR3W1N/eNELl9D0JNBeD1Zbsv+o0OdDwvKek=;
        b=bXA5lh07ACzBAI6MdJBK8aiPQlJNNE8vJ90Lvl2817WkJcLPJaC/aihGFacbAy9/zh
         nk0DiViZVxb4CFgJppNC7vTx4NalXtLocbrA98Ndkc6Rsh89LDGYp9O6XLJ4zkpup0r2
         tq1xbdLGBBBDmCZmk+ix/Bg4pB3vWIM+R/iINeRDsrMf8I7ZRMWTFQ7JazfacAxWK/48
         P5BYkLdZQOZ83Htw0jZ+VY5O31f3C2z+T+RyS8xwcdm/Ypd/12xkjInxnj3sbmU1+GIz
         917J4Qc/6cchBlJRHtODlPPUYQz2Uy5G7VeBcrlc5QhSEm6aIvUxsndNHV77atWUIwce
         hcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059439; x=1786664239;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+wCYK2twR3W1N/eNELl9D0JNBeD1Zbsv+o0OdDwvKek=;
        b=OMShWt/yzAmdFwvH+STbsLxolBlBmK2KGwQCXmIg8xWSecVc5vq9oqXcaeYLjJjdNp
         X5SByMhPLIP7/g5cdUnUGcreWqczCohRImPu98hlnfV9UHWNLAh+vnzNUBIjstjLPHF7
         4OLxiK4zPvztvB8MjRbsIyE1qsySR4D8Gr3kBZv+R4Nj6KKpXjv4K4TcBuX+vDqHwMOS
         q2LbYFj7SuzbpfKfq5R1xQYpnNi2wPMBxIZ7XyrrJl39Dvo6V6mvLRzjDobT92i78dkQ
         /15iRLSJNIjCdVoC1cUG3Ug/+5J2oa0gcvLHYlWlv0LcMk2CNtw/kt8CPqAvIhYnlY8p
         Xniw==
X-Forwarded-Encrypted: i=1; AHgh+RrIQlS5O/uOMbetS1Z1UWIebl7lIrjavg9JQ+PToAyAjKfeaKiKhRmxET5vSJlK4/oWffJLuHLHAoA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyphl5Sb5f7vVIbg2USZ9jfx7YiILU4LQjhfzQppfH2h4LKHvul
	dPxD1bVEH8IvZDh4EB42159N1QYXsvT/YlTudLbMvkNqZgfYs4KBtHY113CQWMXWSNjQGGQ2nbl
	bvwFGJg==
X-Received: from pfn34.prod.google.com ([2002:a05:6a00:a222:b0:84a:31b0:7544])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3d4b:b0:84e:89a:b8f7
 with SMTP id d2e1a72fcca58-84f2dff69eemr17547973b3a.11.1786059438943; Thu, 06
 Aug 2026 16:37:18 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:36:01 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-45-seanjc@google.com>
Subject: [PATCH v6 44/51] x86/kvmclock: WARN if wall clock is read while
 kvmclock is suspended
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
X-purgate-ID: tlsNG-16d1c6/1786059441-F5A0C77B-106E8E26/0/0
X-purgate-type: clean
X-purgate-size: 2065

WARN if kvmclock is still suspended when its wallclock is read, i.e. when
the kernel reads its persistent clock.  The wallclock subtly depends on
the BSP's kvmclock being enabled, and returns garbage if kvmclock is
disabled.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 41aff709b90a..2cc3dd2ba355 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -53,6 +53,8 @@ static struct pvclock_vsyscall_time_info *hvclock_mem;
 DEFINE_PER_CPU(struct pvclock_vsyscall_time_info *, hv_clock_per_cpu);
 EXPORT_PER_CPU_SYMBOL_GPL(hv_clock_per_cpu);
 
+static bool kvmclock_suspended;
+
 /*
  * The wallclock is the time of day when we booted. Since then, some time may
  * have elapsed since the hypervisor wrote the data. So we try to account for
@@ -60,6 +62,7 @@ EXPORT_PER_CPU_SYMBOL_GPL(hv_clock_per_cpu);
  */
 static void kvm_get_wallclock(struct timespec64 *now)
 {
+	WARN_ON_ONCE(kvmclock_suspended);
 	wrmsrq(msr_kvm_wall_clock, slow_virt_to_phys(&wall_clock));
 	preempt_disable();
 	pvclock_read_wallclock(&wall_clock, this_cpu_pvti(), now);
@@ -140,6 +143,7 @@ static void kvm_save_sched_clock_state(void)
 	 * to the old address prior to reconfiguring kvmclock would clobber
 	 * random memory.
 	 */
+	kvmclock_suspended = true;
 	kvmclock_disable();
 }
 
@@ -152,16 +156,19 @@ static void kvm_setup_secondary_clock(void)
 
 static void kvm_restore_sched_clock_state(void)
 {
+	kvmclock_suspended = false;
 	kvm_register_clock("primary cpu, sched_clock resume");
 }
 
 static void kvmclock_suspend(struct clocksource *cs)
 {
+	kvmclock_suspended = true;
 	kvmclock_disable();
 }
 
 static void kvmclock_resume(struct clocksource *cs)
 {
+	kvmclock_suspended = false;
 	kvm_register_clock("primary cpu, clocksource resume");
 }
 
-- 
2.55.0.679.g6767b8d81c-goog


