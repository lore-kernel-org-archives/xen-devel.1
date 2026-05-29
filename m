Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9276FCD6E56
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2026 14:45:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1322204.1588464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySK-0002lt-BC; Fri, 29 May 2026 14:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322204.1588464; Fri, 29 May 2026 14:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySK-0002le-81; Fri, 29 May 2026 14:45:00 +0000
Received: by outflank-mailman (input) for mailman id 1322204;
 Fri, 29 May 2026 14:44:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3aKYZagYKCXMjVReaTXffXcV.TfdoVe-UVmVccZjkj.oVegifaVTk.fiX@flex--seanjc.bounces.google.com>)
 id 1wSySJ-0002eQ-J9
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:44:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSySI-005qKS-W6
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 16:44:59 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3aKYZagYKCXMjVReaTXffXcV.TfdoVe-UVmVccZjkj.oVegifaVTk.fiX@flex--seanjc.bounces.google.com>)
 id 6a19a655-5cb7-0a2a0a5109dd-0a2a450ba186-46
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:44:58 +0200
Received: from [209.85.216.73] (helo=mail-pj1-f73.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3aKYZagYKCXMjVReaTXffXcV.TfdoVe-UVmVccZjkj.oVegifaVTk.fiX@flex--seanjc.bounces.google.com>)
 id 6a19a669-212f-0a2a450b0019-d155d849dcad-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:44:58 +0200
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-36b982ec338so1811706a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 07:44:58 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780065896; x=1780670696; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/Ssx6Evg+apl0YO4v5bDvJ7vmmhU3NWEJgFIU1d/78=;
        b=LhtWt9jkYEK+cdCFgV6fJQphooXitVUnfpijn90NyS/SqqCpvcADA7UJ82LcEg7pXz
         EgpafOZODlLxSwcKKcmnniau/OZLzF7KZLsRd1KtyrTYdA8ouz4/zqUqNPlfsx5eTNVd
         /wTCdn1F57z1rIhJ2Yksf1I1PdRsNYuA6b/QDEuWvjUhYEyNuidR3SCEzqP2HPTreUu3
         K0aGT+PUM6uRoID8PcXhlg0gi8HC4cQG+x1rUbnBwTABAz/IiKZmslaIvUUr2QOAPG4T
         5fjVWMQ5xQkPjIHni0K4CChm29oy+gLTc/eRsTd+95ga6Y0ZhN3VJ/WxqSIzTFKaEVsR
         CLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065896; x=1780670696;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/Ssx6Evg+apl0YO4v5bDvJ7vmmhU3NWEJgFIU1d/78=;
        b=fVmuV7LwZyXifob8HM9eytrDkSawGS/UQoxKNBzpEf4BO/flKEfphLd4JHT69cNMxI
         R69V5kmV8yDU+oRpjMDf1/sUwewWC0ckIBfT0WE3bkMo6xrA68OruMf5nrQFaXA78slt
         Mo0LSH3BkQl7qMtw9yKsuaDUr2pdJ8wMbBrcn155GzdGvqSp0UMWbS+HgNG4teRW6FsL
         ziwalid4xxLF8JA691N4CJblHTbs0gy/wkdeTp5sIQXjz49dsJc2FoyW5iPuIXHWBQ+S
         Tc7x+1D1xmFfANEgdmxeb+gNT80MdOEHSV1b0/fQjM1POCr/IwXsX8jeE1GwKd1jGaGV
         RT2g==
X-Forwarded-Encrypted: i=1; AFNElJ/3OPHo5WxxIRGPQ78JOIzLJ2vTPQC+22BgXfdjHvOpm9eRevqZcLM1eR/D1tYj2LrVLh6RNxattaQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFuGJno49wqVCmsPnbEhAH8VCOU7olHgobbLfbsQjD2XSD6T8b
	KRZbdOGoVh4jgCRA4QUqunGCCop446yp7bXEhSR+SxCmPYZDXqiHpb1ZlfEghk/bnNnuH4e8G44
	TiCP+Og==
X-Received: from pjnu11.prod.google.com ([2002:a17:90a:890b:b0:36b:8d3f:d136])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dd1:b0:368:ac5f:d31b
 with SMTP id 98e67ed59e1d1-36bbd006f90mr3628748a91.24.1780065896168; Fri, 29
 May 2026 07:44:56 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:43:51 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-5-seanjc@google.com>
Subject: [PATCH v4 04/47] x86/sev: Don't override CPU frequency calibration
 for SNP's Secure TSC
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
X-purgate-ID: tlsNG-42698a/1780065898-19F6EF3B-D043C1B6/0/0
X-purgate-type: clean
X-purgate-size: 1454

Don't override the kernel's CPU frequency calibration routine when
registering SNP's Secure TSC calibration routine.  SNP (the architecture)
provides zero guarantees that the CPU runs at the same frequency as the
TSC.  The justification for clobbering the CPU routine was:

  Since the difference between CPU base and TSC frequency does not apply
  in this case, the same callback is being used.

but that's simply not true.  E.g. if APERF/MPERF is exposed to the VM, then
the CPU frequency absolutely does matter.

While relying on heuristics and/or the untrusted hypervisor to provide the
CPU frequency isn't ideal, it's at least not outright wrong.

Fixes: 73bbf3b0fbba ("x86/tsc: Init the TSC for Secure TSC guests")
Cc: Nikunj A Dadhania <nikunj@amd.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/sev/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index ed0ac52a765e..665de1aea0ee 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2046,7 +2046,6 @@ void __init snp_secure_tsc_init(void)
 
 	snp_tsc_freq_khz = SNP_SCALE_TSC_FREQ(tsc_freq_mhz * 1000, secrets->tsc_factor);
 
-	x86_platform.calibrate_cpu = securetsc_get_tsc_khz;
 	x86_platform.calibrate_tsc = securetsc_get_tsc_khz;
 
 	early_memunmap(mem, PAGE_SIZE);
-- 
2.54.0.823.g6e5bcc1fc9-goog


