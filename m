Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34FAC43327
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:34:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350590.1608123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0hY-0005mf-9e; Wed, 01 Jul 2026 19:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350590.1608123; Wed, 01 Jul 2026 19:34:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0hY-0005mU-5E; Wed, 01 Jul 2026 19:34:28 +0000
Received: by outflank-mailman (input) for mailman id 1350590;
 Wed, 01 Jul 2026 19:34:26 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3g2tFagYKCcg6so1xqu22uzs.q20Bs1-rs9szzw676.Bs1352xsq7.25u@flex--seanjc.bounces.google.com>)
 id 1wf0hW-0005aj-UO
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:34:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0hW-00BqTu-BP
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:34:26 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3g2tFagYKCcg6so1xqu22uzs.q20Bs1-rs9szzw676.Bs1352xsq7.25u@flex--seanjc.bounces.google.com>)
 id 6a456bb3-bab6-0a2a0a5309dd-0a2a45098636-18
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:34:26 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3g2tFagYKCcg6so1xqu22uzs.q20Bs1-rs9szzw676.Bs1352xsq7.25u@flex--seanjc.bounces.google.com>)
 id 6a456b84-97e6-0a2a45090019-d155d6cacdc6-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:33:26 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2ca3b3141a6so13440615ad.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:33:25 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934404; x=1783539204; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=KILxImADtcVlkoacCtqYmxEGcZEGxD9ytdtd9JfAHyU=;
        b=ncRycgCj5OPlbhp+ae2uH2ajcL9c9iwIOIwLxgbN3tnrXCBjsFksgkDjy/gneFlbag
         o2hsOMCxFo38XVzjhixcCVKfoICFrRVH7xcpJ6e8xdMiC6848r0O3W8fBOxIrFjF0bTI
         lnbj9brXTP1UeE1ThWI3nYTjrj0JWMS9NLeVzJHfxw9gC6R531Q9MEtbmmXfjcQ0Sw/9
         Z8TkLabQjzAMg1wLmhlydWWIVuUOW4q6IM+ZpxWk2G+M7nABgRxg1NfImqZxtceS+hMw
         631qfCSHDIpaG7MJm44QvxcfRnaL5VPKB2rHhzWNxFZIQzWktxxFB8iZ5b8s2fZWVOy5
         DM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934404; x=1783539204;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KILxImADtcVlkoacCtqYmxEGcZEGxD9ytdtd9JfAHyU=;
        b=aEwfw/nznqYlzYLTadi5NaF/TioDylMwM0W9zK/N0n1QiA29K5GbJVi8tFBSqQm/16
         Xc0qoTHcs2lCcne8Rel6VX7iLWwVGkvny3ix53tIBIWsSOs1SEIl1kxoRWvtNzadtBBj
         bZkjYrovdKo9LqKxEbHd4I+FYUezdn9l4wa6MP25XEtIITy2OSwsJotK2caauOP89nLP
         2xCO2yKcgaADBn1enLTFkBkb5teQ3+6A9tr7aXlNY9TlVBOPzHPudXl0VRHak3YdL9Cb
         vrOASLWPWiQk6chUzExPanKc8wUENTWRMJ30zJbc5chP6YSX7UsUXLuYAMdk3dX9QXJN
         lW4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr/UVqL+sLYIdYEsfK4XzMrv5nafd266eaI/tpHs5eg5EdBZaKT+H2BGu8ojLIX1DnNwRwR9TeD/5s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyomWv/aFH4qOQCW9JSJbRHe3+IOs77zlpYsMCeuxY9aArn07X1
	8EOlOvzO/EBk7Gm+l/rKi8rV9iWvE/IlJP6v0107Xi213DYxqZRvCqwiOMLLQXlH838JalCEdye
	FHePRag==
X-Received: from pltf1.prod.google.com ([2002:a17:902:74c1:b0:2c7:5af7:37a3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c952:b0:2c9:c169:7483
 with SMTP id d9443c01a7336-2ca7e87dc6bmr34187285ad.37.1782934403691; Wed, 01
 Jul 2026 12:33:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:32:08 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-48-seanjc@google.com>
Subject: [PATCH v5 47/51] x86/paravirt: Don't use a PV sched_clock in CoCo
 guests with trusted TSC
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
X-purgate-ID: tlsNG-bad1c0/1782934406-5519A986-4C00B53B/13/0
X-purgate-type: clean
X-purgate-size: 1339

Silently ignore attempts to switch to a paravirt sched_clock when running
as a CoCo guest with trusted TSC.  In hand-wavy theory, a misbehaving
hypervisor could attack the guest by manipulating the PV clock to affect
guest scheduling in some weird and/or predictable way.  More importantly,
reading TSC on such platforms is faster than any PV clock, and sched_clock
is all about speed.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 012321fed5e5..a146fc7b5e74 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -283,6 +283,15 @@ bool using_native_sched_clock(void)
 int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 				      void (*save)(void), void (*restore)(void))
 {
+	/*
+	 * Don't replace TSC with a PV clock when running as a CoCo guest and
+	 * the TSC is secure/trusted; PV clocks are emulated by the hypervisor,
+	 * which isn't in the guest's TCB.
+	 */
+	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC) ||
+	    boot_cpu_has(X86_FEATURE_TDX_GUEST))
+		return -EPERM;
+
 	if (!stable)
 		clear_sched_clock_stable();
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


