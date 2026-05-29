Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F17FCD6E4A
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2026 15:08:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1322437.1588700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyoh-0005pj-J4; Fri, 29 May 2026 15:08:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322437.1588700; Fri, 29 May 2026 15:08:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyoh-0005pc-E8; Fri, 29 May 2026 15:08:07 +0000
Received: by outflank-mailman (input) for mailman id 1322437;
 Fri, 29 May 2026 15:08:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <306sZagYKCegcOKXTMQYYQVO.MYWhOX-NOfOVVScdc.hOXZbYTOMd.YbQ@flex--seanjc.bounces.google.com>)
 id 1wSyog-0005pL-2a
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:08:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSyof-001277-FO
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:08:05 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <306sZagYKCegcOKXTMQYYQVO.MYWhOX-NOfOVVScdc.hOXZbYTOMd.YbQ@flex--seanjc.bounces.google.com>)
 id 6a19abcb-bab6-0a2a0a5309dd-0a2a4506ad26-10
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:08:05 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <306sZagYKCegcOKXTMQYYQVO.MYWhOX-NOfOVVScdc.hOXZbYTOMd.YbQ@flex--seanjc.bounces.google.com>)
 id 6a19abd3-7371-0a2a45060019-d155d6cac050-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:08:05 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2bd6aeb3637so313101885ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:08:04 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780067283; x=1780672083; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=A0LUKgY7WdUW5/UN6qkumXlSSdA1avjLrzVcdpZcOlg=;
        b=O/cT0A/F5ESt7G5U6DwIzaehwiwC9QE13NUTcSdP0WJ6xoswNcpzVG7dg+U+jbGGv5
         MsoY/KuYHImphsBEQTvD/Z86zGEbLaeW7iam7/gwhcUapgwwP2RFkqj8922p1izwXgf5
         cXO70Q9epZ4wlkv2vVYFZ+SeeX5uamOyqy/wJm1o8dAw0+f0AbZrgF/UIWxP+cL0A2eS
         eGJeI8mVFZRwu6Z5jGsv3ZHOf7fWdiUpR5dXGjk62EzwKJ6/KHuFsqcBhRxakdKcT4VS
         RSRgnv95VvRjiTgnfilWScaFq9ptJIO8PH5OeaZp6xLWFXTGfGktqQVsIC65SDmoM4TC
         3JXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067283; x=1780672083;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0LUKgY7WdUW5/UN6qkumXlSSdA1avjLrzVcdpZcOlg=;
        b=UhGOJ+2NE+XSOJe0mPkFz0riZhi97JPfJyA9TH0rwP9SzlN5Q1gI8gVfzQknpH18N6
         ciYcqdk5+xFnlZou83FZPzHJfW57qOR76IleF5cMbXbQujzfC1TPkQYzSvLyZTzjAtCn
         Tp+xHIWgMDsC3IkDOdu/4GkYlkGvRBq4EGigxs5oSW8ls8FXnL4gpp6oRpDlmBH4ZMlr
         5Dsx7eJuPVnp5bZt+TE3sTEJof0IUC22IpdFwBuQ9U24ihTyP/du/Rt2/DRtzpR4vQ+y
         icKsGZVuOUwWU0gwehxkyjwNmcO7wPsBODqzOhVMN9QS/uHSOx3KzpNOC2dxc+drHS+q
         RRhA==
X-Forwarded-Encrypted: i=1; AFNElJ8n0YXWW1cRQuegAflMNDOZxcSjv0kmyzQlzXLZ6k/4VG8gDe9cJzTk8kKBoHJfaIb90ndNbQejXd0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKdMyXRPdiJaRRzFJxtexsDYrgooF5m7Kf43sXTJ37YmN3DyD6
	9oINIu9upRTuBQ3xZpqfRwwpPl4YW4HcYWkKb/ibXQIHGgfoIrOshece0ctoi/7a96VZ7Foh6UL
	9G3GpyA==
X-Received: from pldt15.prod.google.com ([2002:a17:903:40cf:b0:2bd:a5da:7a51])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:da84:b0:2bc:8f62:990b
 with SMTP id d9443c01a7336-2bf368d7531mr1933905ad.41.1780067283075; Fri, 29
 May 2026 08:08:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:08:00 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150800.714453-1-seanjc@google.com>
Subject: [PATCH v4 34/47] x86/kvmclock: Move kvm_sched_clock_init() down in kvmclock.c
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
X-purgate-ID: tlsNG-16d1c6/1780067285-8556ED75-E02A47EC/0/0
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
index 05bca2be0df3..6372b4dc7b0c 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -134,20 +134,6 @@ static void kvm_restore_sched_clock_state(void)
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
@@ -303,6 +289,20 @@ static int kvmclock_setup_percpu(unsigned int cpu)
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
2.54.0.823.g6e5bcc1fc9-goog


