Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA30C5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:36:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385269.1627715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dY-0007Em-49; Thu, 06 Aug 2026 23:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385269.1627715; Thu, 06 Aug 2026 23:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dX-0007E0-TO; Thu, 06 Aug 2026 23:36:31 +0000
Received: by outflank-mailman (input) for mailman id 1385269;
 Thu, 06 Aug 2026 23:36:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3fBp1agYKCd8TFBOKDHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@flex--seanjc.bounces.google.com>)
 id 1ws7dX-000791-D8
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:36:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7dW-00GcaU-QT
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:36:30 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3fBp1agYKCd8TFBOKDHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@flex--seanjc.bounces.google.com>)
 id 6a751a49-bab6-0a2a0a5309dd-0a2a4501d568-32
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:30 +0200
Received: from [209.85.214.200] (helo=mail-pl1-f200.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3fBp1agYKCd8TFBOKDHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@flex--seanjc.bounces.google.com>)
 id 6a751a7d-5984-0a2a45010019-d155d6c8f1f5-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:30 +0200
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2cfc52ddc55so34439545ad.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:30 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059389; x=1786664189; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bl6f0kmYO+QvCHyY9ZYfUQzYrQcYJLjL3x7Z6ExdFrE=;
        b=Z+aQxQiE+OE1I3dn5dzeeW95DU07hYNTCDlCxjhYO+Aq6aPRS2RNr/2klJwuC+E4/x
         ftWoVyu/tz0Lb5p5trYqxrefnuqxmAPLuys0tsQNmUc8O9TEM4uQ2kqDWdXTJjIGpWeZ
         in5zUOHqVdgEBr56INMLsc79On8vJWHIGiI1yBfh+D/5A729uwtac9xfMdhtJsFofvys
         kjWroSa9NWPmsvak+Mm+bnXpbGt3Iq2j4PQwu0nA21rYUDWMV2zyw+B+mcCjgIVahJl9
         tKVwvrZARasr9fVInvqmhj3+0e1/EZEJ3T/aczJDP4zCxVK2fvk7e/zgWMdGcEbOqP4d
         +R1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059389; x=1786664189;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bl6f0kmYO+QvCHyY9ZYfUQzYrQcYJLjL3x7Z6ExdFrE=;
        b=rrfebHGB4boAlvbqG3TrCdJj6XBNdiWhphIGVZwILC02WTPUNts2T6ARI/n4i62AdH
         wLlwjXhN3oyhDPdSBeTkfLDrrXunRj07HjHvMIBpOSfB1vJI9BKEtWdZs8CPKJL/2rRR
         VzaKY3KVjL/FO8hpWctDoVZBx+vHPcbtpgjMOh2MxYukUPd1WjWu+DCaruZ+IFmE9Ugt
         5DVhtuTxdPUixHADkQXQP5p7C3MfJMQNJEafpCepR97MCvapIQa6DFtDtXnFvkGsonQz
         XMSe/7aL6TeW3h/1quRu2sFC2qZ3a+X4iDw8GdqdkgLu1JN4tLkBsP7gqczxfmzO+01F
         1ZRg==
X-Forwarded-Encrypted: i=1; AHgh+RrtFcl/L/ifj9/+w2Wdu35WGtEEKCvO69d6wRHt52dGO1j9cZERVjZFE4zMJSCgK+I+t32JZtw3Hrg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoK51m8zmU8itLWqjEfP5u7DJdKiwdt2Ze543xRr6TO7SUlETY
	lzJPsKh4v2ruDxIpUKyBsfeMHjlc2FM953+P3THHKbnk+CGLWQFf/2QGpyKSJOgOy3sCU0EnoX5
	z80ihaA==
X-Received: from pgav2.prod.google.com ([2002:a05:6a02:2dc2:b0:c85:9dd2:d11e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7349:b0:3c6:3c5b:f2e1
 with SMTP id adf61e73a8af0-3cbadcfcacfmr5222309637.32.1786059388428; Thu, 06
 Aug 2026 16:36:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:21 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-5-seanjc@google.com>
Subject: [PATCH v6 04/51] x86/tsc: Restrict recalibrate_cpu_khz() export to
 p4-clockmod and powernow-k7
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
X-purgate-ID: tlsNG-d62444/1786059390-BCB45757-AB75D175/0/0
X-purgate-type: clean
X-purgate-size: 833

Export recalibrate_cpu_khz() only for its two users, p4-clockmod.ko and
powernow-k7.ko, to help document that recalibration is relevant only to
ancient CPUs.

For all intents and purposes, no functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index bc4348585194..09bf10f322ba 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -943,7 +943,7 @@ void recalibrate_cpu_khz(void)
 						    cpu_khz_old, cpu_khz);
 #endif
 }
-EXPORT_SYMBOL_GPL(recalibrate_cpu_khz);
+EXPORT_SYMBOL_FOR_MODULES(recalibrate_cpu_khz, "p4-clockmod,powernow-k7");
 
 
 static unsigned long long cyc2ns_suspend;
-- 
2.55.0.679.g6767b8d81c-goog


