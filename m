Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7074CC5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:41:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385492.1627980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7iH-0008DB-0O; Thu, 06 Aug 2026 23:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385492.1627980; Thu, 06 Aug 2026 23:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7iG-0008Cz-SH; Thu, 06 Aug 2026 23:41:24 +0000
Received: by outflank-mailman (input) for mailman id 1385492;
 Thu, 06 Aug 2026 23:41:23 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3sBp1agYKCRUDzv84x19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@flex--seanjc.bounces.google.com>)
 id 1ws7iF-000875-K5
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:41:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7iF-00EM9p-0p
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:41:23 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3sBp1agYKCRUDzv84x19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@flex--seanjc.bounces.google.com>)
 id 6a751b43-bab6-0a2a0a5309dd-0a2a4503de86-44
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:41:23 +0200
Received: from [209.85.214.197] (helo=mail-pl1-f197.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3sBp1agYKCRUDzv84x19916z.x97Iz8-yzGz663DED.Iz8AC94zxE.9C1@flex--seanjc.bounces.google.com>)
 id 6a751ab1-fae8-0a2a45030019-d155d6c5dd76-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:22 +0200
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cc640dfde3so31468195ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:22 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059440; x=1786664240; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ITopxW07/FQizEWlsu5JVYhKtG4YNcRGYaSiNeAs44w=;
        b=OEOiy4AadltqPg7dktu1ig2gjTVOJ0LY1Lt0Ni40UNEkqd0+CE1V41tpxoY2jaiul1
         +hF3dJjSmkWxh369YXpBPYEkwstgq3YfsiF0+8od4igD9KchpP71c9YupRc7YhRYcdrf
         34LIBIuzG5UMLBQfwwzhfYw+c0cNLvLXBfxWtz/7SLWQzBZ8ZkyYjlzaBuHH2Ot6LiZf
         naRH33EQ2pDgbdpS7d33OOCO1Z9cFdPF+v4UNPrv6wIN3cOba/PwZcLGs2hmH5snsAJm
         m/1yCOXoqIqSIGYcOvgzRJwhPue5ujtHNzx8YBXM6/QPb+hnmSRt4XB1LVsgtUJwPyAY
         NHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059440; x=1786664240;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITopxW07/FQizEWlsu5JVYhKtG4YNcRGYaSiNeAs44w=;
        b=fHpsTz6TW6asDxr1wL7rvjMdO6UTIvx9J7+VP+FJitTHIdXYDofhiFvLlrIAZrbG/m
         e42afvqdvTVN0Q2+gKuYmEAKNPIbcNPA3BOR6vvTnfW91LtR53EHkGLMIph5MgrmJ1c8
         XtKRLH83YPX9wZbaRZS5yO73Lb7Fyc0hjKyVK70HOHnKDt3951AJlvfB/cMZbIs7Cuow
         eomiFcrcmfDYGP9+CBloHp0CZ1QeK5LqjoXJIF8WbDFll6KQtsagjWBf654p9pF+HXan
         /fsy+PsLJfMGmOnGOT8o9+cYeIU+YDtwOvniRv2E8ns7koxutT0xiv9ACe1xLKoMz2UZ
         y8Tg==
X-Forwarded-Encrypted: i=1; AHgh+RrPln7+KZu6/nyWteNpYj1huCIqnT6XkRGcKX52cwbYoS27EKbm9nV9c09ZxleIN2Ge1+ROLplERes=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAZB4RWFKKaBMhzTm/WIsYsFgqCf/vbx8zfb7Gy5Ew9UaCtrdF
	SFEYLRK3hy6zK72AEJ1V4Ev14LXb1w86tmJ+6qjVM7V/j9PneOL6qI4YRns1EG/3MK6KbqPgpw3
	QmIFGzw==
X-Received: from pljs12.prod.google.com ([2002:a17:903:3bac:b0:2ca:e163:e0c8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41ce:b0:2cf:afa5:b19a
 with SMTP id d9443c01a7336-2d0ca7f8e9amr186517945ad.11.1786059440120; Thu, 06
 Aug 2026 16:37:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:36:02 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-46-seanjc@google.com>
Subject: [PATCH v6 45/51] x86/paravirt: Mark __paravirt_set_sched_clock() as __init
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
X-purgate-ID: tlsNG-33051d/1786059442-6DED24E9-0AC77DE5/0/0
X-purgate-type: clean
X-purgate-size: 2068

Annotate __paravirt_set_sched_clock() as __init, and make its wrapper
__always_inline to ensure sanitizers don't result in a non-inline version
hanging around.  All callers run during __init, and changing sched_clock
after boot would be all kinds of crazy.

No functional change intended.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 10 +++++-----
 arch/x86/kernel/tsc.c        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index e97cd1ae03d1..96ae7feac47c 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -14,12 +14,12 @@ extern int no_timer_check;
 extern bool using_native_sched_clock(void);
 
 #ifdef CONFIG_PARAVIRT
-void __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				void (*save)(void), void (*restore)(void));
+void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				       void (*save)(void), void (*restore)(void));
 
-static inline void paravirt_set_sched_clock(u64 (*func)(void),
-					    void (*save)(void),
-					    void (*restore)(void))
+static __always_inline void paravirt_set_sched_clock(u64 (*func)(void),
+						     void (*save)(void),
+						     void (*restore)(void))
 {
 	__paravirt_set_sched_clock(func, true, save, restore);
 }
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index d4f7cb127235..363145c83919 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -280,8 +280,8 @@ bool using_native_sched_clock(void)
 	return static_call_query(pv_sched_clock) == native_sched_clock;
 }
 
-void __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				void (*save)(void), void (*restore)(void))
+void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				       void (*save)(void), void (*restore)(void))
 {
 	if (!stable)
 		clear_sched_clock_stable();
-- 
2.55.0.679.g6767b8d81c-goog


