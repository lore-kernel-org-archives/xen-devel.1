Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25DEC5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:42:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385586.1628124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7j6-0006Xe-1G; Thu, 06 Aug 2026 23:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385586.1628124; Thu, 06 Aug 2026 23:42:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7j5-0006XH-Qu; Thu, 06 Aug 2026 23:42:15 +0000
Received: by outflank-mailman (input) for mailman id 1385586;
 Thu, 06 Aug 2026 23:42:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3php1agYKCQs3plyunrzzrwp.nzx8py-op6pwwt343.8py02zupn4.z2r@flex--seanjc.bounces.google.com>)
 id 1ws7j3-0006JR-T4
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:42:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7j3-00EMEo-9g
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:42:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3php1agYKCQs3plyunrzzrwp.nzx8py-op6pwwt343.8py02zupn4.z2r@flex--seanjc.bounces.google.com>)
 id 6a751bae-e002-0a2a0a5209dd-0a2a4503e136-26
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:42:13 +0200
Received: from [209.85.214.198] (helo=mail-pl1-f198.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3php1agYKCQs3plyunrzzrwp.nzx8py-op6pwwt343.8py02zupn4.z2r@flex--seanjc.bounces.google.com>)
 id 6a751aa7-fae8-0a2a45030019-d155d6c6ad5d-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:12 +0200
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2cc5faecf01so51051255ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:12 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059431; x=1786664231; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dLl1t0qRZTm556OBeVqKVx/DHfexmKODeXAiUOaDm4I=;
        b=ln7BlPKUPiOO/cp4dV5mxjLgoz+Vyp23kyPFqwsk+elJtcPFrpcLepHogTzrv3GqRt
         j2JUtiidAiBz4/pMrBPzzdZqoK4dNw3S+Blha7EtBpnF443vs2aT7n2KpIrdAszljvkK
         C5BaGsrYvMlYI3RbhfKb9HtKbaZ24AagDQaKfZJZ1qv86YLnefDX+a0YdPJtkylPh0TX
         AVNKkD9RYbRTuPQiqGvxWUVAzw9R2v0LMOlmPqnFMrqeIWiju1SWviJa7NK+xM5ClBGO
         UdYfKONlGTAbsIDcm1K27/Bgc+whh1G0JIxjiTG3DFvH5w7Mwj4HKDgsaP0ZIYKl85SG
         Y4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059431; x=1786664231;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dLl1t0qRZTm556OBeVqKVx/DHfexmKODeXAiUOaDm4I=;
        b=jiRdE5uef4VzH9yeYjFcXpXov5OSc+eXAuCAp+rJblTbQ+DZNCymotlzEd1mJI3lpT
         1R4wijZ545e5s2M+MgVGEd7+6HHBzHITgxqhM3wn6qx3D0UqaOY0cBZU/RbZIvBEOzE+
         Pz+QGOumkmK4wLt5Z3fEvtoW87hLAhUUiO+lXr1PHfklxfNKCoVhHt288nz7mssTTdJK
         JTyjT5V2Vy0VwdST+m0SSwhk/NfmOsc/2iU815erdSq/hYAbPzYuLZ9l2Y3Awm0djUxc
         jgyghvJTLAjnFz2cwckURDGiRitlDsGKGClfWyHYYz8DhLEujlPHsNk0C+UNRLhn6xcr
         7Zmg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9iegpaXyxjhDozmkhSSzneAg2mniL+pEZGc0bvT+nncByT3iQAMFVHvdYhQUV8L8g0fM2MHyYGys=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlxbnLvdVezlMjlUqO8aZVyW246GdEHsmVrQWz+j3Litjhfmpr
	h4HH1dPRNoR5tzViUNX3iU3rU+rONO0PN91/SF71alOCmLuWbr8OJ3EWOdkPoGojnPkRDlOMvCf
	0as/T1A==
X-Received: from pjzg4.prod.google.com ([2002:a17:90a:e584:b0:38e:b470:e6db])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2590:b0:38f:2168:b9cb
 with SMTP id 98e67ed59e1d1-3903c572a05mr18787499a91.9.1786059430539; Thu, 06
 Aug 2026 16:37:10 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:54 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-38-seanjc@google.com>
Subject: [PATCH v6 37/51] x86/kvmclock: Move kvm_sched_clock_init() down in kvmclock.c
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
X-purgate-ID: tlsNG-33051d/1786059432-77AC44E9-8818F214/0/0
X-purgate-type: clean
X-purgate-size: 2297

Move kvm_sched_clock_init() "down" so that it can reference the global
kvm_clock structure without needing a forward declaration.

Opportunistically mark the helper as "__init" instead of "inline" to make
its usage more obvious; modern compilers don't need a hint to inline a
single-use function, and an extra CALL+RET pair during boot is a complete
non-issue.  And, if the compiler ignores the hint and does NOT inline the
function, the resulting code may not get discarded after boot due lack of
an __init annotation.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 5b9955343199..5220d205abc7 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -155,20 +155,6 @@ static void kvm_restore_sched_clock_state(void)
 	kvm_register_clock("primary cpu clock, resume");
 }
 
-static inline void kvm_sched_clock_init(bool stable)
-{
-	kvm_sched_clock_offset = kvm_clock_read();
-	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
-				   kvm_save_sched_clock_state,
-				   kvm_restore_sched_clock_state);
-
-	pr_info("kvm-clock: using sched offset of %llu cycles",
-		kvm_sched_clock_offset);
-
-	BUILD_BUG_ON(sizeof(kvm_sched_clock_offset) >
-		sizeof(((struct pvclock_vcpu_time_info *)NULL)->system_time));
-}
-
 void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
 {
 	/*
@@ -325,6 +311,20 @@ static int kvmclock_setup_percpu(unsigned int cpu)
 	return p ? 0 : -ENOMEM;
 }
 
+static __init void kvm_sched_clock_init(bool stable)
+{
+	kvm_sched_clock_offset = kvm_clock_read();
+	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
+				   kvm_save_sched_clock_state,
+				   kvm_restore_sched_clock_state);
+
+	pr_info("kvm-clock: using sched offset of %llu cycles",
+		kvm_sched_clock_offset);
+
+	BUILD_BUG_ON(sizeof(kvm_sched_clock_offset) >
+		sizeof(((struct pvclock_vcpu_time_info *)NULL)->system_time));
+}
+
 void __init kvmclock_init(bool prefer_tsc)
 {
 	u8 flags;
-- 
2.55.0.679.g6767b8d81c-goog


