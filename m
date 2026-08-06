Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCF3C5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:38:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385424.1627880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7fD-0001wt-UF; Thu, 06 Aug 2026 23:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385424.1627880; Thu, 06 Aug 2026 23:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7fD-0001wm-RV; Thu, 06 Aug 2026 23:38:15 +0000
Received: by outflank-mailman (input) for mailman id 1385424;
 Thu, 06 Aug 2026 23:38:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3pxp1agYKCQw4qmzvos00sxq.o0y9qz-pq7qxxu454.9qz130vqo5.03s@flex--seanjc.bounces.google.com>)
 id 1ws7fC-0001vM-Ib
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:38:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7fB-009HY2-W0
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:38:13 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3pxp1agYKCQw4qmzvos00sxq.o0y9qz-pq7qxxu454.9qz130vqo5.03s@flex--seanjc.bounces.google.com>)
 id 6a751a81-e002-0a2a0a5209dd-0a2a450c8794-30
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:38:13 +0200
Received: from [209.85.216.71] (helo=mail-pj1-f71.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3pxp1agYKCQw4qmzvos00sxq.o0y9qz-pq7qxxu454.9qz130vqo5.03s@flex--seanjc.bounces.google.com>)
 id 6a751aa8-f479-0a2a450c0019-d155d847e594-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:13 +0200
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3811279d51aso4527477a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:13 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059432; x=1786664232; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4ag8yTwNbmjHFkBZxZL+JA4uvidx3vZA6IwgDKjMnAQ=;
        b=Piom0kQr4Kh+m63x/ZDynnRPc3ANRDeOmA8b5i3ynVjtawdp6zNesqbmKdBBckGXlE
         FEBmzy5g6Q9GgCIvoWgxzw/KDt3aztVW0MuXULpub0v2dlnqzxo+w2pIRdAggZRyY32y
         uccTRGfIgs7SQNRJ/xiPNwwkd+eG9LILp062arAvUkYQxayO+wi+GeeBFG34XNt1miHm
         5N72PBq9xhkMWuqkR7YBSEWUoZiXqPymjlSxkbeuWhSQO8niEzjaQq2pb9ApPCjRXO/w
         +nobWh0e5euzsYaxfPqvY4vMEQOOSKWdQBHEYFIzFFjGsYtOJA8hM8O07wYz6uIWLpsP
         XVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059432; x=1786664232;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ag8yTwNbmjHFkBZxZL+JA4uvidx3vZA6IwgDKjMnAQ=;
        b=kFcGcf7mDmof3Szcu0toB/lJ4Sy6cCmNEFDrSWOixmOD1FoCozLawuSmk6KzanJo22
         NfDeLHx+XuSSVXcGRQHYF6PwKB2B95zafUAqrOGBiGc8zA9t70L79agCba5EDLQf0ZjE
         fcrMkEpR+W7AXOpsTXvEgKi14oMuBnIebv0Q5Fi8pRRGd4Zuo0tHjazaZJtjQL7BvEZG
         OVmhHLDsQmBtcJpEjmX5XRAYldwutuM1dV27W3qSm1jj71jJbLSf8ArPjLJJ9IuPO1sG
         d1BuGxqiHPlXWn9dW+mtHkkmL8PsuuovH0cAIKMqWvnwvX+QXDKIk0VuSvVq79h0uNGJ
         Oe+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqIGLQCqMDY9UKRuXHfGptwxBZdDZqtogpM5OnRr8ZsBqEnlpiZ9YcGM4Bq/ZanHHKi8rdrsoDsQJQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxvf1tkChgyLxhk9HKxFyfyTa+bVreFjKa6tPX3iR8fID38O3Cx
	KKSoA3OJFK/VAh1zm6FrzLuOOZ0Mi02psffd+umP4bjYRCdDnsxCbGQEknsZF904xTe2qHjXSst
	R98eRXw==
X-Received: from pjbqb12.prod.google.com ([2002:a17:90b:280c:b0:38f:2874:84ed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c88e:b0:38e:488f:7068
 with SMTP id 98e67ed59e1d1-3903c5373b4mr20565740a91.2.1786059431685; Thu, 06
 Aug 2026 16:37:11 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:55 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-39-seanjc@google.com>
Subject: [PATCH v6 38/51] x86/xen/time: Mark xen_setup_vsyscall_time_info() as __init
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
X-purgate-ID: tlsNG-d25034/1786059433-51D34A5B-46BCA67A/13/0
X-purgate-type: clean
X-purgate-size: 879

Annotate xen_setup_vsyscall_time_info() as being used only during kernel
initialization; it's called only by xen_time_init(), which is already
tagged __init.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/xen/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 8cd8bfaf1320..bc26f00fc53e 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -443,7 +443,7 @@ void xen_restore_time_memory_area(void)
 	xen_sched_clock_offset = xen_clocksource_read() - xen_clock_value_saved;
 }
 
-static void xen_setup_vsyscall_time_info(void)
+static void __init xen_setup_vsyscall_time_info(void)
 {
 	struct vcpu_register_time_memory_area t;
 	struct pvclock_vsyscall_time_info *ti;
-- 
2.55.0.679.g6767b8d81c-goog


