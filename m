Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2C2CD6E4A
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2026 15:11:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1322500.1588780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyrn-0003sT-4N; Fri, 29 May 2026 15:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322500.1588780; Fri, 29 May 2026 15:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyrn-0003sM-1C; Fri, 29 May 2026 15:11:19 +0000
Received: by outflank-mailman (input) for mailman id 1322500;
 Fri, 29 May 2026 15:11:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <33qsZagYKCfMnZVieXbjjbgZ.XjhsZi-YZqZggdnon.sZikmjeZXo.jmb@flex--seanjc.bounces.google.com>)
 id 1wSyrl-0003qr-J2
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:11:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSyrk-009Kty-W7
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:11:17 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <33qsZagYKCfMnZVieXbjjbgZ.XjhsZi-YZqZggdnon.sZikmjeZXo.jmb@flex--seanjc.bounces.google.com>)
 id 6a19ac90-5cb7-0a2a0a5109dd-0a2a4507abd8-16
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:11:16 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <33qsZagYKCfMnZVieXbjjbgZ.XjhsZi-YZqZggdnon.sZikmjeZXo.jmb@flex--seanjc.bounces.google.com>)
 id 6a19abde-229c-0a2a45070019-d155d6cad061-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:08:16 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2bd5b20aaa6so149415145ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:08:15 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780067294; x=1780672094; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IXSUk0zrc0SOIpzpc8N9Re3bKO3sQJVctQ52bfDdTtc=;
        b=XoEnfvuuezmXXm+Dh3N9C3lNQ/Ga6e/9phhrVBoYdvLMVHD5AKp4GiPzLXkAC867td
         cgUgTcZSUWfscls0uQ8txehA268EUiGxMR7DCmqiPgalDB/V18TvScdfKiUJIYQ62Tb1
         CkGoF8alHZLBPhwtOiRQ1I23mN3guyQ/6i+4Yb/jzJm25h9RCTXFBB+eSq/QGYKfPIC1
         PJIWCE2yiofOc/ZxobfglpOYGp/i0Q//qZlLCPzFK1+j2d64gGohS4Z3tk1+kK+lXph+
         ni9RjRL9p6J7JIjGWrSpGCVHO20+k1/FqXU2VxKE9cALFc61sA36Ko4+SPNWKbJVqvSp
         VK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067294; x=1780672094;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXSUk0zrc0SOIpzpc8N9Re3bKO3sQJVctQ52bfDdTtc=;
        b=et7KNJ08dspUiuXsVHGkVFDY0sDdu98/bVo/AXcQ3OpF70/AlApbAW4hKWPkA/gMVP
         aWMn7tV7PXm9LKmVBpNdLO+j/++frx7Sw9R7teDguAg58p25kRy2SNzodPMvnxvy7Gb6
         T0L/XZd3bBbXhNm4GjPLHSxmKGdVX5ZiOqUbOASBYufa4G3WLw3SVd92paUVXG77tCe4
         V5QQPRC+6c0/WmG3PJ4sZnnn+vfYk7akWvNtwiitoULAcuhKMIHe3v6xdGkC7hIje4Am
         0DV4Gv3vplHtkj6gWOXo57Mq14KiEp3PkAzu33k5Xyz55D+Q4sXhFAN4RRVzmVK0QnUw
         swxA==
X-Forwarded-Encrypted: i=1; AFNElJ8Bi7tsPZvnRgPop7s3tF7KpZFiT+X+l7ztjtT8lM1G3lSVul/47ScF2ksiTtzAG3Vic+1j8VRXsLY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzLQleTIbpCtmQ5Q/LlEGAyiTsrHS1dKo6EBbsz8MGfzXJCeaoP
	fREEBo986ienRHVnuktLVW3p4vSok6iktow6NEy1zBVzQR5T2IqAygcYdMQj28EzSKf6DyYRr76
	LteW2ZA==
X-Received: from plblh4.prod.google.com ([2002:a17:903:2904:b0:2ae:ceb3:f968])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e842:b0:2ba:6ebe:4897
 with SMTP id d9443c01a7336-2bf367b37demr2834085ad.3.1780067294027; Fri, 29
 May 2026 08:08:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:08:12 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150812.714604-1-seanjc@google.com>
Subject: [PATCH v4 38/47] x86/kvmclock: Refactor handling of
 PVCLOCK_TSC_STABLE_BIT during kvmclock_init()
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
X-purgate-ID: tlsNG-ef75cf/1780067296-21969C48-BE91FD98/0/0
X-purgate-type: clean
X-purgate-size: 1894

Clean up the setting of PVCLOCK_TSC_STABLE_BIT during kvmclock init to
make it somewhat obvious that pvclock_read_flags() must be called *after*
pvclock_set_flags().

Note, in theory, a different PV clock could have set PVCLOCK_TSC_STABLE_BIT
in the supported flags, i.e. reading flags only if
KVM_FEATURE_CLOCKSOURCE_STABLE_BIT is set could very, very theoretically
result in a change in behavior.  In practice, the kernel only supports a
single PV clock.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 6372b4dc7b0c..4e304f1c887d 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -305,7 +305,7 @@ static __init void kvm_sched_clock_init(bool stable)
 
 void __init kvmclock_init(bool prefer_tsc)
 {
-	u8 flags;
+	bool stable = false;
 
 	if (!kvm_para_available() || !kvmclock)
 		return;
@@ -332,11 +332,18 @@ void __init kvmclock_init(bool prefer_tsc)
 	kvm_register_clock("primary cpu clock");
 	pvclock_set_pvti_cpu0_va(hv_clock_boot);
 
-	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE_STABLE_BIT))
+	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE_STABLE_BIT)) {
 		pvclock_set_flags(PVCLOCK_TSC_STABLE_BIT);
 
-	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
-	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
+		/*
+		 * Check if the clock is stable *after* marking TSC_STABLE as a
+		 * valid flag.
+		 */
+		stable = pvclock_read_flags(&hv_clock_boot[0].pvti) &
+			 PVCLOCK_TSC_STABLE_BIT;
+	}
+
+	kvm_sched_clock_init(stable);
 
 	if (!x86_init.hyper.get_tsc_khz)
 		x86_init.hyper.get_tsc_khz = kvmclock_get_tsc_khz;
-- 
2.54.0.823.g6e5bcc1fc9-goog


