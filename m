Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8595FC5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:37:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385403.1627864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7em-0007x0-AS; Thu, 06 Aug 2026 23:37:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385403.1627864; Thu, 06 Aug 2026 23:37:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7em-0007w3-5V; Thu, 06 Aug 2026 23:37:48 +0000
Received: by outflank-mailman (input) for mailman id 1385403;
 Thu, 06 Aug 2026 23:37:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3ixp1agYKCe4iUQdZSWeeWbU.SecnUd-TUlUbbYiji.nUdfheZUSj.ehW@flex--seanjc.bounces.google.com>)
 id 1ws7ek-0007la-Rq
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:37:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7ek-009HY2-4A
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:37:46 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3ixp1agYKCe4iUQdZSWeeWbU.SecnUd-TUlUbbYiji.nUdfheZUSj.ehW@flex--seanjc.bounces.google.com>)
 id 6a751aa4-e002-0a2a0a5209dd-0a2a4503b82a-16
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:46 +0200
Received: from [209.85.216.69] (helo=mail-pj1-f69.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3ixp1agYKCe4iUQdZSWeeWbU.SecnUd-TUlUbbYiji.nUdfheZUSj.ehW@flex--seanjc.bounces.google.com>)
 id 6a751a8c-fae8-0a2a45030019-d155d845c026-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:45 +0200
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-38ce7fabf76so4358982a91.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:45 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059404; x=1786664204; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VAfqOqpweyKvsFpq/agEYC9CEWnfcmlui4k8L8ZR5pE=;
        b=l8v/bFCH5DueBriRFBLsBOvg00nFAJB1SYanY2hZ0S51HjAOZSeZcZzMAJSXKw60b5
         ZQqEkG0nLm43ahHa02+ZXd86NibWujsh6PEouC3li5X5QZB6q8RZlWS/221/IfoNW2Yb
         xZSHiCmSQxxG7Y/Zc0xXbI6JRg7NPsbFKhwCgy0un/4cnV9f2w25e2Nx84WE7PGEg9FL
         HEg5tVPkMXp6JvtUq8fdBbreljIsgyp//3q/cmCcRVw42ECTiEjLTQtI/+QVPpriPW5G
         sdRhqrZCD7Vk2fO8TXDMwvYOqM3SWkw7yLyanEsb2G+Fcry6wiQ3mIvED5rzA/KqEyd3
         j74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059404; x=1786664204;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VAfqOqpweyKvsFpq/agEYC9CEWnfcmlui4k8L8ZR5pE=;
        b=hTEKz2SBgBT/9LDb45Qm1dWH5PGYsTlQ/V0KzAWFvtV+Dmr7M2av5isoo6GDoEDzyQ
         SqEEB0bm3WNcU50GvqyGRMP1utVBAWI9OV4nbz6P/YxzpcjHYELjljTQTsCQOtQ4oWHs
         k5pQ8ooHXPMz71+0tNeVkmF1TdG0A9sG4hC/dKRknkVs9kN7R9Jns4hKtkxDMjYOn+ce
         n9T2ppfhbX+EvDhF5O0XtLDO6zP4HiMeL74RQFbpFkqYsohBd1A2RhPv4OPJAyN1AvlU
         YTAcV1inC4DpgY6Fg/GYVwwfxbaO4ltsMLiKJeJsT4BOMT6wB3+4pFGJzAzCd/epOEYo
         G0Pg==
X-Forwarded-Encrypted: i=1; AHgh+RrISvcwfZAvUTl5UmR9J848KKtuOR0UvSBrWDPxa7TzkUgUULzDXLU8l0XAuh2kSk81DieEaoYspUw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxsd2U6QacbHWYWiRHYcn2H55q40HSsE2ggVVPAaH+cK6ixku2q
	nFNeb6rJAjMdb5gqNH5Bys1LBFPo41doJfqbynpDuBj0P6Ttyk82rj514k7JuLVyLJrp0phnYCR
	gywRr+A==
X-Received: from pjbcu4.prod.google.com ([2002:a17:90a:fa84:b0:381:7fb0:5a60])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:288b:b0:38e:8300:af51
 with SMTP id 98e67ed59e1d1-3903c54d040mr19813478a91.8.1786059403683; Thu, 06
 Aug 2026 16:36:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:33 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-17-seanjc@google.com>
Subject: [PATCH v6 16/51] x86/tsc: Rename pit_hpet_ptimer_calibrate_cpu() => native_calibrate_cpu_late()
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
X-purgate-ID: tlsNG-33051d/1786059406-6F6C64E9-EC6DA9E6/13/0
X-purgate-type: clean
X-purgate-size: 1430

Rename the late CPU calibration routine so that its relationship to the
early routine is more obvious and intuitive.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 1d41ef1db27c..dd9e04e325d6 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -752,7 +752,7 @@ static unsigned long cpu_khz_from_cpuid(void)
  * calibrate cpu using pit, hpet, and ptimer methods. They are available
  * later in boot after acpi is initialized.
  */
-static unsigned long pit_hpet_ptimer_calibrate_cpu(void)
+static unsigned long native_calibrate_cpu_late(void)
 {
 	u64 tsc1, tsc2, delta, ref1, ref2;
 	unsigned long tsc_pit_min = ULONG_MAX, tsc_ref_min = ULONG_MAX;
@@ -927,7 +927,7 @@ static unsigned long native_calibrate_cpu(void)
 	unsigned long tsc_freq = native_calibrate_cpu_early();
 
 	if (!tsc_freq)
-		tsc_freq = pit_hpet_ptimer_calibrate_cpu();
+		tsc_freq = native_calibrate_cpu_late();
 
 	return tsc_freq;
 }
@@ -1472,7 +1472,7 @@ static bool __init determine_cpu_tsc_frequencies(bool early,
 		else
 			tsc_khz = native_calibrate_tsc();
 	} else {
-		cpu_khz = pit_hpet_ptimer_calibrate_cpu();
+		cpu_khz = native_calibrate_cpu_late();
 	}
 
 	/*
-- 
2.55.0.679.g6767b8d81c-goog


