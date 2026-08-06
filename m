Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48B1C5AC9E
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:37:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385320.1627818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dy-0003N6-KL; Thu, 06 Aug 2026 23:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385320.1627818; Thu, 06 Aug 2026 23:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dy-0003Mh-Dz; Thu, 06 Aug 2026 23:36:58 +0000
Received: by outflank-mailman (input) for mailman id 1385320;
 Thu, 06 Aug 2026 23:36:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3lhp1agYKCfktfbokdhpphmf.dpnyfo-efwfmmjtut.yfoqspkfdu.psh@flex--seanjc.bounces.google.com>)
 id 1ws7dx-00037d-0B
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:36:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7dw-00Gcdg-Cl
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:36:56 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3lhp1agYKCfktfbokdhpphmf.dpnyfo-efwfmmjtut.yfoqspkfdu.psh@flex--seanjc.bounces.google.com>)
 id 6a751a4d-e002-0a2a0a5209dd-0a2a45078cde-42
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:56 +0200
Received: from [209.85.210.197] (helo=mail-pf1-f197.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3lhp1agYKCfktfbokdhpphmf.dpnyfo-efwfmmjtut.yfoqspkfdu.psh@flex--seanjc.bounces.google.com>)
 id 6a751a96-b4ea-0a2a45070019-d155d2c5e556-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:56 +0200
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-84e4ef9a74aso4706560b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:55 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059414; x=1786664214; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RXgfgHNb2M05mbaK7fzwXMNXNJyNMqWfUYS+q8iqpyw=;
        b=n0LdWODQkNSZbGoDZGntD8WKnws5alyJdnc/uxbP/j+r+CdCJeqvgYDQDltEnnErwP
         Ey8JJjM0qHUTEi/HFHzjNvv61q3CpUQZXq0GCM+jpvF7R2UK0HRwtHAit7nzNEMdk89U
         qGg8Ihh7B8pjzS5Fb9ukDY/VRETSXgYMMbsOMwQWSiJ2lvAa9GFd/d9bAwMjB0uwy+mJ
         zC+SwbELrj4bv3Uei9loxb5isZE6l+dFqbUH0H6QAh337ncH+H2LeLY6mXnrkEWSai82
         b3sXi/DD6pZdAZE0MY6O2+MVT91IPObgNI3AWSws+KEA4o4sLhirFwp6Zen2BoaFhuwi
         d41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059414; x=1786664214;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RXgfgHNb2M05mbaK7fzwXMNXNJyNMqWfUYS+q8iqpyw=;
        b=f+EUNDwLQsuv4GPY2eElSzZBzVNsdKNzVxYgqybMjtwU5/Q/H92ehicekPCyC/2LV6
         Rle714ArsDuDjB2RX9zwOgXfKyA8DyV4qOeAFvOeVFcdLobiRXGyprHnhNj1A2wIc+Mz
         8ERWlUNyhjMk8iVherKd14pX/0M3UnXCnAZItKSqbEG0pYBBIrYDQTt2p9UhtmAFMhQT
         D//saACs2ysGuZnCJwo2Sghpm5+hZFG4SYz7KJzoy4a0lohNzpQC1S2BtR2eMZlvjdlK
         aYhjU/CQShYK6wdyRWnjDJ2f5jJfabd7PP6p2j3k/pvGLq+ht+oOdAhNQZ4/A0gA2tmb
         TKLg==
X-Forwarded-Encrypted: i=1; AHgh+Rpq6KWhDx8TcgourNkGdeFapvF2mg1s/Nss16Y/EMMFXVfx9XJHe1nvm4huR8sB8E0PSOBs9sWuDVA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzj2WvDiylOCf7k5j65NCtPSHtpmVgrWCRIR8ycTeGEAZlmDl6A
	CubXjdrCI5t9+n29gMF7het3yooUbox04RpM1h7gYedmfw2TtCI1vncW73vETLmlVPXZZR89zAf
	UnY3RYQ==
X-Received: from pfcy7.prod.google.com ([2002:a05:6a00:93c7:b0:845:e683:1287])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6e81:b0:84e:2bb:2d3e
 with SMTP id d2e1a72fcca58-84f2dfb4e50mr16994834b3a.9.1786059414067; Thu, 06
 Aug 2026 16:36:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:41 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-25-seanjc@google.com>
Subject: [PATCH v6 24/51] x86/kvm: Get CPU base frequency from CPUID when it's available
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
X-purgate-ID: tlsNG-ef75cf/1786059416-A60C5AE4-38FBD5C8/0/0
X-purgate-type: clean
X-purgate-size: 1756

If CPUID.0x16 is present and valid, use the CPU frequency provided by
CPUID instead of assuming that the virtual CPU runs at the same
frequency as TSC and/or kvmclock.  Back before constant TSCs were a
thing, treating the TSC and CPU frequencies as one and the same was
somewhat reasonable, but now it's nonsensical, especially if the
hypervisor explicitly enumerates the CPU frequency.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 255a24a99f28..83b9351f2810 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -50,6 +50,7 @@
 #include <asm/e820/api.h>
 
 static unsigned int kvm_tsc_khz_cpuid __initdata;
+static unsigned int kvm_cpu_khz_cpuid __initdata;
 
 DEFINE_STATIC_KEY_FALSE_RO(kvm_async_pf_enabled);
 
@@ -930,6 +931,11 @@ static unsigned int __init kvm_get_tsc_khz(void)
 	return kvm_tsc_khz_cpuid;
 }
 
+static unsigned int __init kvm_get_cpu_khz(void)
+{
+	return kvm_cpu_khz_cpuid;
+}
+
 unsigned int kvm_arch_para_features(void)
 {
 	return cpuid_eax(kvm_cpuid_base() | KVM_CPUID_FEATURES);
@@ -1043,6 +1049,14 @@ static void __init kvm_init_platform(void)
 		}
 	}
 
+	/*
+	 * Prefer CPUID.0x16 over KVM's PV CPUID when possible, as the base CPU
+	 * frequency isn't necessarily the same as the TSC frequency.
+	 */
+	kvm_cpu_khz_cpuid = __cpu_khz_from_cpuid();
+	if (kvm_cpu_khz_cpuid)
+		x86_init.hyper.get_cpu_khz = kvm_get_cpu_khz;
+
 	/*
 	 * If the TSC counts at a constant frequency across P/T states and in
 	 * deep C-states, treat the TSC reliable, as guaranteed by KVM.
-- 
2.55.0.679.g6767b8d81c-goog


