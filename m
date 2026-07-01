Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052FCC43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:35:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350668.1608221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iX-0001zO-Cs; Wed, 01 Jul 2026 19:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350668.1608221; Wed, 01 Jul 2026 19:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iX-0001yo-7V; Wed, 01 Jul 2026 19:35:29 +0000
Received: by outflank-mailman (input) for mailman id 1350668;
 Wed, 01 Jul 2026 19:35:27 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3hGtFagYKCck7tp2yrv33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@flex--seanjc.bounces.google.com>)
 id 1wf0iV-0001ta-RW
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:35:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0iV-003oUT-8M
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:35:27 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3hGtFagYKCck7tp2yrv33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@flex--seanjc.bounces.google.com>)
 id 6a456bf3-e002-0a2a0a5209dd-0a2a450484fc-26
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:35:27 +0200
Received: from [209.85.216.74] (helo=mail-pj1-f74.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3hGtFagYKCck7tp2yrv33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@flex--seanjc.bounces.google.com>)
 id 6a456b85-a01d-0a2a45040019-d155d84ad9d1-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:33:27 +0200
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-38096521198so1608365a91.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:33:26 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934405; x=1783539205; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=sbysuOQKV7W7YbruNHYRSyCV0jaRsBQX5EoVXm1Gq/A=;
        b=uvoPGw+ss6c1ymsKriG1EYMp26JD7cuS6otDiI2Fleq2T8ydNxb5qBJ9WKODRmfumm
         A7ZmTDZPNBiU8YwNGeUnmkM3CeC2lu4Gvvni2bq+I1g5w+XcSVBYTVqOa5/uiB254XsL
         INgeATlHz3eq9GCXyeEkvoCaOKH53tG17TwBw7+aFqnL4pYRgtSpRHuKUqL1IlLW8pcJ
         eEJwF/A1sji0FZA2P/sOLTyr1CJR5YrK5//n/oc2XL1Ppip66dIgBx6OzaaJgjoaBZiH
         OVGCZCf7LNdrtOCIT423YN1kO9tWw413OB6pXp9H0b089qT4vGJLeWUOkC5KeEaBqMp/
         TfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934405; x=1783539205;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbysuOQKV7W7YbruNHYRSyCV0jaRsBQX5EoVXm1Gq/A=;
        b=srfNoMnpYjpZdc9JlR7YFY7wFraMnMCvfVMNjjhpWROkR/nVFrPnl60ds2y/Nv/oo8
         lxCbxghdFrFLZbeo/0BxEEx68gnkrC3FxbiV8Y0B29eq4kvoyiueuPfBw5pLyRx53tGz
         QrG4KvNXyUUP7P4NEAF7pkwwp21ncG4bwQB23PtXoxgPTfJDyiHovzw2kl4iJQ3C47BS
         yhSXsRgPxLU5mBZRFmll5aoYKF6pCYGAR1ZDYTNNDLXgt4qm1lOg7Yu5sUF1hJosDQh7
         0c3iSvY/hqt4vknNYwcwGsX++g5D35H1jMxlcn+46+wxNxExAi4Dra8zGLp2Sl761Dht
         F/Bg==
X-Forwarded-Encrypted: i=1; AHgh+Rru35dzXfjlXANzbpnGdGQspC+q0oXdfXTXA8hgx0F/vpJ5iO7754q1er5IrHYuthOzQZyqE445Wg4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZpz1C6gsi1K6jQQmXddcYCRsic5Om0Mc42+hOAwPAAW+gQNK8
	gybwbHYnIjxt6+KlMWjd/qyemUFz9uZfY0w/i4MgUkL6xLA7D/qVnn6Cut9bB41nd9Thot/XGM+
	kfO5IYw==
X-Received: from pjbbf15.prod.google.com ([2002:a17:90b:b0f:b0:37d:e898:7cd8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2886:b0:36a:f612:e6a3
 with SMTP id 98e67ed59e1d1-380aa18d2b1mr3062418a91.17.1782934404832; Wed, 01
 Jul 2026 12:33:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:32:09 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-49-seanjc@google.com>
Subject: [PATCH v5 48/51] x86/kvmclock: Use TSC for sched_clock if it's
 constant and non-stop
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
X-purgate-ID: tlsNG-ebf023/1782934407-AFB231CC-E5E0692C/0/0
X-purgate-type: clean
X-purgate-size: 2195

Prefer the TSC over kvmclock for sched_clock if the TSC is constant and
nonstop.  I.e. use the same criteria as tweaking the clocksource rating so
that TSC is preferred over kvmclock.  Per the below comment from
native_sched_clock(), sched_clock is more tolerant of slop than
clocksource; using TSC for clocksource but not sched_clock makes little to
no sense, especially now that KVM CoCo guests with a trusted TSC use TSC,
not kvmclock.

        /*
         * Fall back to jiffies if there's no TSC available:
         * ( But note that we still use it if the TSC is marked
         *   unstable. We do this because unlike Time Of Day,
         *   the scheduler clock tolerates small errors and it's
         *   very important for it to be as fast as the platform
         *   can achieve it. )
         */

The only advantage of using kvmclock is that doing so allows for early
and common detection of PVCLOCK_GUEST_STOPPED, but that code has been
broken for over two years with nary a complaint, i.e. it can't be
_that_ valuable.  And as above, certain types of KVM guests are losing
the functionality regardless, i.e. acknowledging PVCLOCK_GUEST_STOPPED
needs to be decoupled from sched_clock() no matter what.

Link: https://lore.kernel.org/all/Z4hDK27OV7wK572A@google.com
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 22e8855fcd4d..bc98ebb8587d 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -396,7 +396,6 @@ void __init kvmclock_init(bool prefer_tsc)
 			 PVCLOCK_TSC_STABLE_BIT;
 	}
 
-	kvm_sched_clock_init(stable);
 
 	if (!x86_init.hyper.get_tsc_khz)
 		x86_init.hyper.get_tsc_khz = kvmclock_get_tsc_khz;
@@ -416,6 +415,8 @@ void __init kvmclock_init(bool prefer_tsc)
 	 */
 	if (prefer_tsc)
 		kvm_clock.rating = 299;
+	else
+		kvm_sched_clock_init(stable);
 
 	clocksource_register_hz(&kvm_clock, NSEC_PER_SEC);
 	pv_info.name = "KVM";
-- 
2.55.0.rc0.799.gd6f94ed593-goog


