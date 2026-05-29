Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A450CD6E50
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2026 14:45:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1322234.1588596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySj-0007c5-4y; Fri, 29 May 2026 14:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322234.1588596; Fri, 29 May 2026 14:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySh-0007WI-S6; Fri, 29 May 2026 14:45:23 +0000
Received: by outflank-mailman (input) for mailman id 1322234;
 Fri, 29 May 2026 14:45:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3e6YZagYKCYY2okxtmqyyqvo.myw7ox-no5ovvs232.7oxz1ytom3.y1q@flex--seanjc.bounces.google.com>)
 id 1wSySd-0006W7-D9
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:45:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSySc-00BR7N-PD
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 16:45:18 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3e6YZagYKCYY2okxtmqyyqvo.myw7ox-no5ovvs232.7oxz1ytom3.y1q@flex--seanjc.bounces.google.com>)
 id 6a19a66e-5cb7-0a2a0a5109dd-0a2a450acfc8-48
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:18 +0200
Received: from [209.85.216.74] (helo=mail-pj1-f74.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3e6YZagYKCYY2okxtmqyyqvo.myw7ox-no5ovvs232.7oxz1ytom3.y1q@flex--seanjc.bounces.google.com>)
 id 6a19a67c-56b3-0a2a450a0019-d155d84ad121-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:18 +0200
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-365d4d2fa04so13286064a91.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 07:45:17 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780065916; x=1780670716; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=uWYqy9oq3guwZeX1CT7rpLN1sV47Joj/CY0UrflMOfk=;
        b=A1gf8d4CG/WfznANbJMoCUINHF/WJURwhms7QgjXKsJK+w+ksmVOzvnIOrEuG7d0RV
         LjgCImBssqgDxWjMILVkBoLb/pkuZZ9tQ+TaG/CPapFiSRV48I5M9lqh0ky1y5RUd6/U
         R4PRdlAtbKQbm/C/Zo+0KGpu9HmTcvXFCf+RtoxC7owhkxeu3nTlQBcdDYt7hCU+hzIo
         nvQcVu1SmdlB294L8l+EjeJcviIwqy/1ALTACWv9HgpYWNZlQjT6ynP38tiqqGJ9oFug
         +MAVokxHdgyh2i9phWe+qO152yrQLeQZGy/3g8o8XBOgaaIljXSZI61eyuoVCfIfXLj0
         jmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065916; x=1780670716;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uWYqy9oq3guwZeX1CT7rpLN1sV47Joj/CY0UrflMOfk=;
        b=J46HT6NYnob7b4h7i2QFczGmzm05YDd/II4PzqBVpBsxHJwnu1pDo+IwLFCLf7ad9W
         VzS31mBsjd83C3N+Wwgd9NN/IAhehJIqGnrHQtORIsOTatyvLuZGwZlvyuNmqna1skEm
         VnNsoRQ0sv0XfKj7X8Z8q7FnuUS17CiyOZ/MmOXLDrvu+7faODx8P/pqfIwNVHAu8q6k
         WxuJWMkrFUnhqgoWaAS+1BV6PV+6wVjXB6I/5ZQ6W37s8hwGQkdf1k7EzlSYZ0UllvYZ
         iKi+I0aNjwVba+CICZttS19EcsYJv2b5CO5npvf2SRT0+USv3lMdQ6bErU7EyoLKP4c1
         wDUA==
X-Forwarded-Encrypted: i=1; AFNElJ8YFrxI2acg5IklBELlwhgU7mimql8/27LYZWKFQeIHBn3tRfdHtmiTUdCg41pCszdgULtktyrGjeg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpwuyGKRzhpHCNwj37FcvMxQ9bqMeBmFF9DcnWlXEk5cIfFPTV
	rNQi+Nr9wnIrKO4NTMQrKpI43K5f8UoKjew0+P/7H+6tHrujoSkrm6LtnWyOtOuBtC4o3nkbS5i
	+iurATQ==
X-Received: from pgce4.prod.google.com ([2002:a05:6a02:1c4:b0:c82:7a7f:9bf6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:4d02:b0:39f:aa3:5e56
 with SMTP id adf61e73a8af0-3b412058e7dmr3539717637.14.1780065915613; Fri, 29
 May 2026 07:45:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:44:07 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-21-seanjc@google.com>
Subject: [PATCH v4 20/47] x86/kvm: Get CPU base frequency from CPUID when it's available
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
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
X-purgate-ID: tlsNG-4011c0/1780065918-7DF838B7-0B67A9FC/0/0
X-purgate-type: clean
X-purgate-size: 1789

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
index c1139182121d..c81a24d0efdf 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -50,6 +50,7 @@
 #include <asm/e820/api.h>
 
 static unsigned int kvm_tsc_khz_cpuid __initdata;
+static unsigned int kvm_cpu_khz_cpuid __initdata;
 
 DEFINE_STATIC_KEY_FALSE_RO(kvm_async_pf_enabled);
 
@@ -928,6 +929,11 @@ static unsigned int __init kvm_get_tsc_khz(void)
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
@@ -1049,6 +1055,14 @@ static void __init kvm_init_platform(void)
 #endif
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
          * If the TSC counts at a constant frequency across P/T states, counts
          * in deep C-states, and the TSC hasn't been marked unstable, treat the
-- 
2.54.0.823.g6e5bcc1fc9-goog


