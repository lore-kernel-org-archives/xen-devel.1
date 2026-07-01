Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF107C43458
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:35:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350652.1608159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iH-0008DK-JB; Wed, 01 Jul 2026 19:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350652.1608159; Wed, 01 Jul 2026 19:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0iH-0008D6-GF; Wed, 01 Jul 2026 19:35:13 +0000
Received: by outflank-mailman (input) for mailman id 1350652;
 Wed, 01 Jul 2026 19:35:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3dGtFagYKCbkrdZmibfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@flex--seanjc.bounces.google.com>)
 id 1wf0iG-000852-7J
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:35:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0iF-003oQR-9c
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:35:11 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3dGtFagYKCbkrdZmibfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@flex--seanjc.bounces.google.com>)
 id 6a456bbc-2eae-0a2a0a5409dd-0a2a450aa144-36
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:35:11 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3dGtFagYKCbkrdZmibfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@flex--seanjc.bounces.google.com>)
 id 6a456b75-e40e-0a2a450a0019-d155d6cac1a5-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:33:10 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2c7cfa17fe6so22393605ad.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:33:10 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934389; x=1783539189; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Vvd9sO5KFA4UCvVy/DPb0p6l2OFovCFuh6GrZNkoHew=;
        b=rUW7+yPq06Rfq50laibByGCSRLoDu4D+V1JdWI1Xom3I5MCiPrF7SoS7xKDu5oSAg7
         Og51WatP2oTdd6MGmQc3dJYfUA3Kb1IXbYXmiGmxjDhK3xyQNmn8lx0jPlr8vy39jG6U
         t0S9xF0RZcHAT04hMjiKvJLSGls16OVqVEOu3IiMf89HgPGqYzE/q4Xu58Vp+l3aa0mN
         4Ysm2ffoQCZyZ89hh9lvrzc7Moqt/8LCiABHquzMnmQ/v1Ao1eDKrX7iUVYeuuI7RdQJ
         cCZntdhi534BHDMOtr/nvbqR+FJdmG2svOWlOISOhz+rckpUE0MQMckPvl8Qc1/mGjVo
         nrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934389; x=1783539189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vvd9sO5KFA4UCvVy/DPb0p6l2OFovCFuh6GrZNkoHew=;
        b=jjOKiEV5nX9oY6SFr88X7X1dUp1+ikoUEXQFcMp9uC9wdNBCnqLuoVttfu9qFvTX6l
         gRRj26a/QYED1V6uvejNoOWTCnRgMkv8Ait8v9XoSZkJ8BLAdjj8OFWgcWSYb28OydQc
         7sFup02+EkSZN9pUraDRdKaJw5Er0qUQwQg6L6uJJsbRdOFVaCvvQkjbihWww6Zeoi0a
         tLluppF6eMWv4mmIDbVDiQKiltF0xzbLNE1QoyIuepVJyPDv1HM5dPqC0dh8vNaiNbDn
         OFvkeu3k2N1F8tjLAB84nWel/O5tXs+jQhg03D/yfk3fBHG/F5z3jfVl5yhrz45g7Xqu
         N7cw==
X-Forwarded-Encrypted: i=1; AFNElJ/XdURVaByPF805H7kvNMDjghfhvxs65LHN+hTg57fZVUthHyiISwxy0/cXQ4IaC2crzmxdS4SmM9o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNAxJ+rzmDS3fJ4ePsUTiPiu2S3rHkw591TI+9+IZl3X9rlP3R
	DXovz1VmqlInnoauLuOJdwpW2+mpnJBp2m82nTJrkFxMeXSws3Rmvm0DD5fjvRTJXlt74lhUtRC
	GtgBbKg==
X-Received: from plho13.prod.google.com ([2002:a17:903:23cd:b0:2bf:1274:c8f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41c7:b0:2c9:c46b:129b
 with SMTP id d9443c01a7336-2ca7e67c028mr32017335ad.5.1782934388785; Wed, 01
 Jul 2026 12:33:08 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:55 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-35-seanjc@google.com>
Subject: [PATCH v5 34/51] x86/vmware: NOP-ify save/restore hooks when using
 VMware's sched_clock
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
X-purgate-ID: tlsNG-4011c0/1782934391-3DA71DDE-5ECD9829/13/0
X-purgate-type: clean
X-purgate-size: 1267

NOP-ify the sched_clock save/restore hooks when using VMware's version of
sched_clock.  This will allow extending paravirt_set_sched_clock() to set
the save/restore hooks, without having to simultaneously change the
behavior of VMware guests.

Note, it's not at all obvious that it's safe/correct for VMware guests to
do nothing on suspend/resume, but that's a pre-existing problem.  Leave it
for a VMware expert to sort out.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/vmware.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 0a3bd90576d4..5c1ccaf4a25e 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -347,8 +347,11 @@ static void __init vmware_paravirt_ops_setup(void)
 
 	vmware_cyc2ns_setup();
 
-	if (vmw_sched_clock)
+	if (vmw_sched_clock) {
 		paravirt_set_sched_clock(vmware_sched_clock);
+		x86_platform.save_sched_clock_state = x86_init_noop;
+		x86_platform.restore_sched_clock_state = x86_init_noop;
+	}
 
 	if (vmware_is_stealclock_available()) {
 		has_steal_clock = true;
-- 
2.55.0.rc0.799.gd6f94ed593-goog


