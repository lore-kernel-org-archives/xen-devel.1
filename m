Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E44EC43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:32:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350366.1607835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fh-0008Dw-EV; Wed, 01 Jul 2026 19:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350366.1607835; Wed, 01 Jul 2026 19:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fh-0008Dp-Bj; Wed, 01 Jul 2026 19:32:33 +0000
Received: by outflank-mailman (input) for mailman id 1350366;
 Wed, 01 Jul 2026 19:32:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3TGtFagYKCZEDzv84x19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@flex--seanjc.bounces.google.com>)
 id 1wf0ff-0007zs-N1
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:32:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0ff-009wmK-3z
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:32:31 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3TGtFagYKCZEDzv84x19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@flex--seanjc.bounces.google.com>)
 id 6a456b4a-e002-0a2a0a5209dd-0a2a45049d7c-14
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:31 +0200
Received: from [209.85.215.201] (helo=mail-pg1-f201.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3TGtFagYKCZEDzv84x19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@flex--seanjc.bounces.google.com>)
 id 6a456b4d-a01d-0a2a45040019-d155d7c9d5d3-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:30 +0200
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-c890bac374eso1130211a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:30 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934349; x=1783539149; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LIZd+3O3352vjgCRNr7RtXOU8moEkEwJFa5rPF13Bys=;
        b=fWhuJTSH9F0LxNXwM51JmmDSaGne7DlthsbIvNEuy/j2XdAyRqR9wfSwo+I21iBh7l
         alzYdN+y9DKLhH4EMvZYYukJZ/Vxq1cOkBSLeC38n59EE4/lK049AJ+i4N9htV+rwsZj
         vxlkywhlNrYUhnFqumIktWVjxpdWQg+qBF2AID7v8n+Dz9M9BlE3Vr1VmJa2rTaAmZRD
         cJaHNPNG1PJhUfdGbfyChZbNQu+9u36XEc0z3YzNByewonYC7pib9kIrlyBYdNp8beYM
         mbn0oZGkDyE8Iby0HjeuRUMUfZ53hZDsoUx/t6MSTmxDKdkohSSkJoeNWGgl3IUTfX/B
         bNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934349; x=1783539149;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIZd+3O3352vjgCRNr7RtXOU8moEkEwJFa5rPF13Bys=;
        b=LT4edtyzfzfmyUJMZIzFuqrjURWffKZIRhvVTzsEmMynQ3z9gYSWRLw33W1Ca1p6YK
         2EPnA8lc0mM7LDNSDN+ySO2v6Rnevc3p9XyU7kLvqXOBkJIR/2NDQgebUJIozzESCOYg
         S8qGFC5Ibsv9Qy5jy5TaJz14Kfw1dMO4PArR65IKUFiHVKKdRvyQmt8p7myyQ2perG2N
         7ZsWTPLH1/nSC+FJI+UaWH0xaDjAw020vmsBnqjqgqXq3onYU5pwmoXKTnBy27XQlAge
         q6dnHR6m/oK/7xcv5xXn/aqg0L0BnVWJoZTupXwr+gvvJQDv256qO2Z5EqGU93CvkyhX
         LDTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JhS2s1rzK5nRoIedvWNbWj5X9WFe6zdnKzFCFRo+kxYLfp1rT6y2Rp0ivjb3cvU2U8YcKw6uJSdA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfXHD9ClkzEbDct+vo+SXrq5AtVVi+9zrCpykad+EkTdFzOT+i
	DzkNQJQDIYsUMf/I9GGlb4ojJGZFZ9Yp3vlLqIlonstvTn0bBbGlCLkj6C1n7JK2+wOdZOvrnQ5
	4Jcglpw==
X-Received: from pgbcx9.prod.google.com ([2002:a05:6a02:2209:b0:c9a:eb48:4a8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e196:b0:3bf:8604:9a3c
 with SMTP id adf61e73a8af0-3bfed3e9622mr3622600637.28.1782934348718; Wed, 01
 Jul 2026 12:32:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:24 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-4-seanjc@google.com>
Subject: [PATCH v5 03/51] x86/tsc: Ensure that TSC recalibration doesn't run
 if TSC frequency is known
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ebf023/1782934351-AEB2B1CC-6C7722F5/0/0
X-purgate-type: clean
X-purgate-size: 1418

When attempting TSC recalibration post-boot, which is only done for ancient
CPUS (P4 and K7) on SMP=n kernels, assert that the TSC frequency isn't
known (explicitly provided by hardware) by way of MSR or CPUID, and bail if
the impossible happens.  In practice, recalibration and TSC_KNOWN_FREQ are
mutually exclusive, as TSC_KNOWN_FREQ will only be set when running on
hardware that was released decades after recalibration was obsoleted, but
but it's hard to see that, especially when looking at just the TSC code.

Note, the WARN can likely be tripped by running in a virtual machine and
concocting an impossible CPU model, e.g. by combining a P4 signature with
CPUID 0x15.  This is working as intended, as such a virtual CPU model is
wildly out-of-spec and is not supported.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 4d6a446645c0..4393902c0ddd 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -930,6 +930,9 @@ void recalibrate_cpu_khz(void)
 	if (!boot_cpu_has(X86_FEATURE_TSC))
 		return;
 
+	if (WARN_ON_ONCE(cpu_feature_enabled(X86_FEATURE_TSC_KNOWN_FREQ)))
+		return;
+
 	cpu_khz = x86_platform.calibrate_cpu();
 	tsc_khz = x86_platform.calibrate_tsc();
 	if (tsc_khz == 0)
-- 
2.55.0.rc0.799.gd6f94ed593-goog


