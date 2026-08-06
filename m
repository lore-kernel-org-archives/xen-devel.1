Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005D7C5AC82
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:40:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385463.1627926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7h5-0005jq-B3; Thu, 06 Aug 2026 23:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385463.1627926; Thu, 06 Aug 2026 23:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7h5-0005jh-8F; Thu, 06 Aug 2026 23:40:11 +0000
Received: by outflank-mailman (input) for mailman id 1385463;
 Thu, 06 Aug 2026 23:40:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3ohp1agYKCQczlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 1ws7h3-0005ir-Vh
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:40:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7h3-008O38-Cc
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:40:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3ohp1agYKCQczlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 6a751b32-2eae-0a2a0a5409dd-0a2a4506abfa-34
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:40:09 +0200
Received: from [209.85.214.197] (helo=mail-pl1-f197.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3ohp1agYKCQczlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 6a751aa3-195a-0a2a45060019-d155d6c5e826-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:08 +0200
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2cfa4e4684bso67531345ad.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:08 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059427; x=1786664227; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f+UXuTD6z7zajVoSPLixW+N3kzbQtDvz4+hCO4pCJ+c=;
        b=pT6jUOebSWW9nxnOIAVPDQrEqpOFzWNjRwR1nXVUasyB6WDZ7hb7tKIY5doc33hl8u
         AuhAb3Zk0o1DYfPs3/n3pvBAO/WM/LXyHwST9k9r+2XM/KyetHSmftWIONPH+CNV/lZX
         YMaF23Bh42ShopbgkEZdFs24i+XNqoSagY2H5ch0bUMxI6XlBO5HVGPR+TtgUfvx/s3h
         l5kZklvVZMhLKDeAspINDjDpYeQM67VmElHfVFO7GPTbJx3bXHyJfs3WOKXtjj6ghpYz
         DMX5QxLApLCbWBt1/Emx8AkWRHDw0U+H/6dWjgorT6iRPq6NHubWHF3od5IHpDnhKvRi
         IMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059427; x=1786664227;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+UXuTD6z7zajVoSPLixW+N3kzbQtDvz4+hCO4pCJ+c=;
        b=V910eu6cD3/8AHTLn44d3bPSB05HBuCjOuADf+hzm2xc8IpnYNKoqlj3x0vGVbOBcU
         3ujPOsrD+/ikRKhc2lBUvSVOVTPAYjkOO1FbAq16NWITIa7B8oTKpaWVj4HzqjxRn3IQ
         tE1r04wG5bBZ5ewxW4x3ZbaR6Tf+GpLjRvFUQ6mIA0qXMNf2UxUU8QMnc0Bx2re0Wots
         DxfjHzEjlPLe2yy/4/Z7SekiZihIELeenjckGNzieEghenCSgNvjdd1xogmp57TdGbI5
         BuIagvp/QQGoQPFa8uQCgz9g2Ib54x/wUq+USOotkxcv6qXtPa/V2wXx0D0nmFJmVIeJ
         73JQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrqah0YF/OR58460WB0WpZ7xkMelmPOunoNRIt9INoy5t4GTxgNHOB04biEYsQWmUzxb9FZ647Oksw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxyOz6XD2cWNp/AIGE0d4JYvTU9/fHEx/Kabhadbyqv+KW1uXxd
	DwbcCpdqWUgjXQl/TJ/bIYTf0iZOqQ9YuhimSeDVbu4cd7mlC5fL9VDpagh28H0848NRJG5ubDE
	DLWEcBQ==
X-Received: from plbi11.prod.google.com ([2002:a17:903:20cb:b0:2cc:6da3:442d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f546:b0:2cc:aa36:c046
 with SMTP id d9443c01a7336-2d0ca77ece3mr197228075ad.14.1786059426608; Thu, 06
 Aug 2026 16:37:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:51 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-35-seanjc@google.com>
Subject: [PATCH v6 34/51] x86/vmware: NOP-ify save/restore hooks when using
 VMware's sched_clock
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
X-purgate-ID: tlsNG-16d1c6/1786059429-F687577B-A5130C9C/0/0
X-purgate-type: clean
X-purgate-size: 1263

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
index cbe8b59ab79f..94fec990a02c 100644
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
2.55.0.679.g6767b8d81c-goog


