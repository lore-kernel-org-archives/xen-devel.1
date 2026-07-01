Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7135DC43327
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:35:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350660.1608196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iO-0000og-1M; Wed, 01 Jul 2026 19:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350660.1608196; Wed, 01 Jul 2026 19:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iN-0000np-Qz; Wed, 01 Jul 2026 19:35:19 +0000
Received: by outflank-mailman (input) for mailman id 1350660;
 Wed, 01 Jul 2026 19:35:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3e2tFagYKCcAykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 1wf0iM-0000bx-UJ
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:35:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0iM-003ap0-Az
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:35:18 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3e2tFagYKCcAykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 6a456bbe-bab6-0a2a0a5309dd-0a2a45079ec8-30
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:35:18 +0200
Received: from [209.85.210.201] (helo=mail-pf1-f201.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3e2tFagYKCcAykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@flex--seanjc.bounces.google.com>)
 id 6a456b7c-9c8e-0a2a45070019-d155d2c9c472-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:33:18 +0200
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-8479c6c6cbeso868238b3a.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:33:17 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934396; x=1783539196; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=w419X+lYiD/kBIvhKaeAU2oxypXcdz+V5rg+/s/ZS+Q=;
        b=DjjcZzSR+k9Oz5zDcrL+fukPK1cHkSDwacxEyo8ZNr/Djo5z2qM8nZchCPU2qA65X5
         O5npMzQmAxvHEc3Y8RqKWsQC/xsg+EwPZmaxRKosEmTXT2FJspDNj2FcwfN8Gst6jK52
         GoNr5FJm6H1idCuYdDlPg+8WqcMlS59WVgrV0pVCxnES/7n54CQmJ50fyjIOV5+Zx/KH
         LIJgajKCDda02OTa8Rvpaq5TlvqMTp8iVvJH7BdFZSQPVil+QSmLPvsqC21MRLeKoW5k
         zGL6lcZdTmGo/Ix1JXl8kz/wfqi/l/w0qK0Nqf2ajpkL/6WEjcjpVybGyLObfYZ4mXGI
         hEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934396; x=1783539196;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w419X+lYiD/kBIvhKaeAU2oxypXcdz+V5rg+/s/ZS+Q=;
        b=Qc4kxRR6+9YiUgBMKk3JbF62NAPp41ZNtMyabEoynrqdpnRpBV0kc0YOmK7fFO9YM3
         AdbBm3JiNYTI6YFONh8IGoXw9+MPMjuQ9gI7p2wyMQ5IivWYCgXnTYbHZuiifvSNslN+
         uC2Ckc7AqveBSWaG9fY8AvbzVMg7Ccl4RsZYgmkAqD3w39fSEYrem2Lex4eTTecYqg4r
         RNLvn0I509TpexqWWIqHGLRYb8hBAFiJtObNzTfPk8/IDbMVNFxyKnwux5l8YPp0Qecb
         z0cEGT6M4i7U3tKdWo/kEaqXRI9mWOxWd8utr0cC6GSlOJpo8eRFcrDp9U95/be9aAbm
         IPVw==
X-Forwarded-Encrypted: i=1; AFNElJ940w30XK1lGfE9vlXzIub6kOzm2LMXTMe6LnhHJvq+2GBg4tETQ9izzyGrn+WvNPqnihL0qGsAIcQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy05ZMXNa4wZe0HvYWjTltK8OE+HVQ9tubKaSVxoVetYyz+EJ4H
	4USy/NXu2LcHS/adkWeY+XeVW8tkYsGk8Zl8ZhF1gt68Fo9T8VB2hPEUWKu0AFyyIcVlH/b5yGb
	wQbW5uQ==
X-Received: from pfbdf8.prod.google.com ([2002:a05:6a00:4708:b0:847:a13f:28e2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a112:b0:847:8f7c:fa10
 with SMTP id d2e1a72fcca58-847c0894ebamr2717987b3a.35.1782934395673; Wed, 01
 Jul 2026 12:33:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:32:01 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-41-seanjc@google.com>
Subject: [PATCH v5 40/51] x86/pvclock: WARN if pvclock's valid_flags are overwritten
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
X-purgate-ID: tlsNG-ef75cf/1782934398-7C52825E-B5FC3110/13/0
X-purgate-type: clean
X-purgate-size: 784

WARN if the common PV clock valid_flags are overwritten; all PV clocks
expect that they are the one and only PV clock, i.e. don't guard against
another PV clock having modified the flags.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/pvclock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/pvclock.c b/arch/x86/kernel/pvclock.c
index a51adce67f92..8d098841a225 100644
--- a/arch/x86/kernel/pvclock.c
+++ b/arch/x86/kernel/pvclock.c
@@ -21,6 +21,7 @@ static struct pvclock_vsyscall_time_info *pvti_cpu0_va __ro_after_init;
 
 void __init pvclock_set_flags(u8 flags)
 {
+	WARN_ON(valid_flags);
 	valid_flags = flags;
 }
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


