Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF02C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:32:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350383.1607919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fv-0002NJ-Ax; Wed, 01 Jul 2026 19:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350383.1607919; Wed, 01 Jul 2026 19:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fu-0002LA-Uc; Wed, 01 Jul 2026 19:32:46 +0000
Received: by outflank-mailman (input) for mailman id 1350383;
 Wed, 01 Jul 2026 19:32:45 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3WmtFagYKCZ8RD9MIBFNNFKD.BNLWDM-CDUDKKHRSR.WDMOQNIDBS.NQF@flex--seanjc.bounces.google.com>)
 id 1wf0ft-0001tg-2q
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:32:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0fs-004o0g-FF
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:32:44 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3WmtFagYKCZ8RD9MIBFNNFKD.BNLWDM-CDUDKKHRSR.WDMOQNIDBS.NQF@flex--seanjc.bounces.google.com>)
 id 6a456b58-2eae-0a2a0a5409dd-0a2a450882ba-4
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:44 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3WmtFagYKCZ8RD9MIBFNNFKD.BNLWDM-CDUDKKHRSR.WDMOQNIDBS.NQF@flex--seanjc.bounces.google.com>)
 id 6a456b5a-edec-0a2a45080019-d155d2caad9e-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:44 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-847a2509456so1135787b3a.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:43 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934362; x=1783539162; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=FaUjTU3QKJy+ktbmudl/+1GzmAqwQnS7of3spvtM7gQ=;
        b=OauO9YQj8/DIduPXV9LtGQlmHJnxfKxLMXTbb/WZ+PMTU+rJkiMniiSHaCWYrb91SZ
         GOqSfHDBqVviFJ86XJxg/n3bYKhiR9NO3qT3qyrbBypQPCZAxdflrI0xW4olETsjVicp
         DbfPBIbmDz457EmmWwSHHD6hJoYX8BX0dgwY2J/PpWfiEN+Vp8WeJOL0zxgvdRUPpeRL
         SVetb3GFTFP2UQR0tHaJUE29AvEnq/J+kJnbMnanmddgbnrdzcHiD8TDxgCfoF3kGxBT
         Flb0xgFvOLE6OGnb8/8xp57AG+AfGMKKwPuL5A38Ylx1gE28yRj3u2jshwVq2OmQqSGL
         iUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934362; x=1783539162;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaUjTU3QKJy+ktbmudl/+1GzmAqwQnS7of3spvtM7gQ=;
        b=c+Z5x/52goRc5BE6Ua8dI24LduCwtN/R07BVOv0lL0xXQL8m/7ipSDDDI6yn1AnG5D
         RWFb9JSQxwxqvzJEYlyuoN/sGmLE/5321McCpB51MrN7azJ4NFvPrtKYRmsx6qAr3qyW
         eorqeq+bDXUnmtjBjq7Exa9A4GqB3rNF/7RNNbE9tSfaCrwdprI7cvJyccB1A471H/zV
         LsIabfyfPf4qkDU+oq+tbSU78BohsoksLtY4hiRonN64vJ6rd4hBQkIl5bUnY1anOA7e
         ri5WOjyuxK0/k62g/phLSJKZitwvvQrFM/VfzBmTgcae1QA7gBSuQHWWlJLhd75suOcr
         P1Zg==
X-Forwarded-Encrypted: i=1; AFNElJ+viXaHJtNx77uDc7JxnQRT+5IfKkwW2hemedZomEQkQqU663KuEBPmpQWmJc4IYF2VwAfud5/hZ/o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjlbG21uC59fl37RTvgkMH9iF67yq4cjNWS+jNKB0xsLhnJqzh
	cJh/Z7+hXTzLCSyWHCJYrNz/reySadf6PUxZJGNoDz6r3seSo6FqUW4yKtrBwrmq4vd2GUr2vTR
	lR/lUVg==
X-Received: from pghx17.prod.google.com ([2002:a63:f711:0:b0:c9a:53ea:434a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1b84:b0:398:9b42:69f7
 with SMTP id adf61e73a8af0-3bfed3b19b0mr3536321637.39.1782934362055; Wed, 01
 Jul 2026 12:32:42 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:34 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-14-seanjc@google.com>
Subject: [PATCH v5 13/51] x86/acrn: Mark TSC frequency as known when using
 ACRN for calibration
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
X-purgate-ID: tlsNG-c1860d/1782934364-A0D2B3FC-5AFC5710/0/0
X-purgate-type: clean
X-purgate-size: 816

Mark the TSC frequency as known when using ACRN's PV CPUID information.
Per commit 81a71f51b89e ("x86/acrn: Set up timekeeping") and common sense,
the TSC freq is explicitly provided by the hypervisor.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/acrn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index dc71a6fdd461..3818f6ae0629 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -40,6 +40,7 @@ static void __init acrn_init_platform(void)
 	if (acrn_tsc_khz_cpuid) {
 		x86_init.hyper.get_tsc_khz = acrn_get_tsc_khz;
 		x86_init.hyper.get_cpu_khz = acrn_get_tsc_khz;
+		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	}
 }
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


