Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3FBC5AC82
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:42:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385555.1628061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7io-0003mb-6D; Thu, 06 Aug 2026 23:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385555.1628061; Thu, 06 Aug 2026 23:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7io-0003lx-20; Thu, 06 Aug 2026 23:41:58 +0000
Received: by outflank-mailman (input) for mailman id 1385555;
 Thu, 06 Aug 2026 23:41:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3lBp1agYKCfcrdZmibfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@flex--seanjc.bounces.google.com>)
 id 1ws7im-0003Uh-Ay
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:41:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7il-00EMEo-OJ
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:41:55 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3lBp1agYKCfcrdZmibfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@flex--seanjc.bounces.google.com>)
 id 6a751b45-e002-0a2a0a5209dd-0a2a450cbd60-46
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:41:55 +0200
Received: from [209.85.215.198] (helo=mail-pg1-f198.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3lBp1agYKCfcrdZmibfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@flex--seanjc.bounces.google.com>)
 id 6a751a95-f479-0a2a450c0019-d155d7c6eddc-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:55 +0200
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-c88cfe287e1so2212099a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:54 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059413; x=1786664213; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gK3sjM001OyHimEt3r9e3MTxT5BkhagjBxMzBV7doNU=;
        b=fciNCWp1Dx0DOh61gLXEdpIpN6AoB9zvLad0YYA5tHxBbineEnVN1fMpe64CvhZPic
         z2br75Z1ZwItMC9hAmcvldKj5N0yQ2ymv5JC2RIYRyK6tlT1goIAOkWpNV+WdaBnGaJc
         H2Q3cL3DrIydLaM9C2lgcB7eJLRkHVj0z76IX7dC8bEixLgpVR5EeS8EsWWJTTFWfRXc
         iOikwNMO2IPhRTMkfXP+x7PwOkQdGmKzubSQI/g6aLlwBqFI2RlWLTDz6QSgB4oKMW5o
         7DcO9WLrWyktw1k8k/NZ9L8RP9/QnRowzA/WMcQwCmtgE8Shxzre20FW7SSqTs0YkZwf
         xIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059413; x=1786664213;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gK3sjM001OyHimEt3r9e3MTxT5BkhagjBxMzBV7doNU=;
        b=aHodXI43os7+Mhn0RISDOuwukRJ+oHk6hgCjSi3ys7JXa/cLSwy0qK37oHupvQ/ZzB
         6LxlcX2k9BtBACkw8rXsc+6kj6dvo2hDr4I7ySrcwyws/9xadxCd+5YGPT02BJ4pzcFU
         NJH9/w7f2X0kcjMrtDtBlltzYlS4jpWBgUeX8AYUkT8zu023fail7jdVthVSHWuB45Q7
         Fod2zO/Md1SP/NgfuWcE2hZuBjx5vgKKtZCSGQwkAh662eW+VYOtsitQUixyRRUozzKp
         YrULZf1+44vC+jmWZLybAkO4dyQuF+cHnoxo/738BSGbWab33XkN2m8sXn+yNzcG8ppI
         WGvg==
X-Forwarded-Encrypted: i=1; AHgh+RrWcFYKG+bTo8Owytd6b46jCy6Xxg0V/vj0TtJ2072NviIFIcIMouOvzj+kOZuBMunA/0hRwvJX/CQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yya0zsFzKNL6T95JS6U3gGKfplK/uEenHlSj3Seb4YDP8ZC7hOU
	l3q6lcQQ12FeodFaJ2qkKr6E8kFtilq4wJIz0gC6XH/4Jruuy5y9vA4waEJ7BdoQXko78EpDqQa
	dLzqwwA==
X-Received: from pglu1.prod.google.com ([2002:a63:1401:0:b0:c99:aff5:7078])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6da8:b0:3c3:bee9:8eec
 with SMTP id adf61e73a8af0-3cbadc10910mr5429156637.19.1786059412806; Thu, 06
 Aug 2026 16:36:52 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:40 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-24-seanjc@google.com>
Subject: [PATCH v6 23/51] x86/tsc: Add standalone helper for getting CPU
 frequency from CPUID
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
X-purgate-ID: tlsNG-d25034/1786059415-01EC2A5B-4D077EA2/0/0
X-purgate-type: clean
X-purgate-size: 2814

Extract the guts of cpu_khz_from_cpuid() to a standalone helper that
doesn't restrict the usage to Intel CPUs.  This will allow sharing the
core logic with KVM-as-a-guest, as KVM generally doesn't restrict CPUID
based on vendor.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tsc.h |  1 +
 arch/x86/kernel/tsc.c      | 31 +++++++++++++++----------------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index c09ec485abcd..cb682f097ea7 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -88,6 +88,7 @@ struct cpuid_tsc_info {
 	unsigned int crystal_khz;
 };
 extern int cpuid_get_tsc_info(struct cpuid_tsc_info *info);
+extern unsigned int __cpu_khz_from_cpuid(void);
 
 extern void tsc_early_init(void);
 extern void tsc_init(void);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index d95e4f059f17..4c5328d19ebe 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -668,6 +668,18 @@ int cpuid_get_tsc_info(struct cpuid_tsc_info *info)
 	return 0;
 }
 
+unsigned int __cpu_khz_from_cpuid(void)
+{
+	unsigned int eax_base_mhz, ebx, ecx, edx;
+
+	if (boot_cpu_data.cpuid_level < CPUID_LEAF_FREQ)
+		return 0;
+
+	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
+
+	return eax_base_mhz * 1000;
+}
+
 /**
  * native_calibrate_tsc - determine TSC frequency
  * Determine TSC frequency via CPUID, else return 0.
@@ -703,12 +715,8 @@ static unsigned long native_calibrate_tsc(void)
 	 * clock, but we can easily calculate it to a high degree of accuracy
 	 * by considering the crystal ratio and the CPU speed.
 	 */
-	if (!info.crystal_khz && boot_cpu_data.cpuid_level >= CPUID_LEAF_FREQ) {
-		unsigned int eax_base_mhz, ebx, ecx, edx;
-
-		cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
-		info.crystal_khz = eax_base_mhz * 1000 * info.denominator / info.numerator;
-	}
+	if (!info.crystal_khz)
+		info.crystal_khz = __cpu_khz_from_cpuid() * info.denominator / info.numerator;
 
 	if (!info.crystal_khz)
 		return 0;
@@ -733,19 +741,10 @@ static unsigned long native_calibrate_tsc(void)
 
 static unsigned long cpu_khz_from_cpuid(void)
 {
-	unsigned int eax_base_mhz, ebx_max_mhz, ecx_bus_mhz, edx;
-
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return 0;
 
-	if (boot_cpu_data.cpuid_level < CPUID_LEAF_FREQ)
-		return 0;
-
-	eax_base_mhz = ebx_max_mhz = ecx_bus_mhz = edx = 0;
-
-	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx_max_mhz, &ecx_bus_mhz, &edx);
-
-	return eax_base_mhz * 1000;
+	return __cpu_khz_from_cpuid();
 }
 
 /*
-- 
2.55.0.679.g6767b8d81c-goog


