Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBACC5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:42:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385603.1628141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7jC-0007VZ-QY; Thu, 06 Aug 2026 23:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385603.1628141; Thu, 06 Aug 2026 23:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7jC-0007VH-Ie; Thu, 06 Aug 2026 23:42:22 +0000
Received: by outflank-mailman (input) for mailman id 1385603;
 Thu, 06 Aug 2026 23:42:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3qhp1agYKCQ87tp2yrv33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@flex--seanjc.bounces.google.com>)
 id 1ws7jB-0007C8-1p
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:42:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7jA-00EMFx-Ey
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:42:20 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3qhp1agYKCQ87tp2yrv33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@flex--seanjc.bounces.google.com>)
 id 6a751ba5-2eae-0a2a0a5409dd-0a2a450a9b14-44
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:42:20 +0200
Received: from [209.85.210.199] (helo=mail-pf1-f199.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3qhp1agYKCQ87tp2yrv33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@flex--seanjc.bounces.google.com>)
 id 6a751aab-f2d2-0a2a450a0019-d155d2c7e928-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:16 +0200
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-84e3d575d6eso4633580b3a.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:16 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059434; x=1786664234; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gswAR/5wSepHR0W/S6/oLzBYH0wiOXioT7kjM1AQclw=;
        b=ditBFt2pCyTk3Lwqeow5V9ILHsm3qtTn0mOvL72447NgS25l7p2yLkWXNAXeCwUu/c
         B0BqLBaYRI/7PxK9Vtq1qT69Wub2AjDSLTrHVbUzss90rE3KIzkxgtBqHNkjxgJf7tXv
         uFyK5nC09ZyFlkVePY8eP+y9Jxlea3aL/645AmHsfLTkzUWB69xuei4gtlZKBd6Gw5bs
         hPoydVOX8MniXlOZhpfCQBw0AbucCNZmFckVZrEvBD1NX5b40T0MIdpP+u3cdM8FLhtk
         9eRnzJQo9Mu4Y16N0OWOHCrAOFyWwc3qJ0y9GiwR1SkmbYVhR81gIWy+F3t+gJP66yqY
         tmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059434; x=1786664234;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gswAR/5wSepHR0W/S6/oLzBYH0wiOXioT7kjM1AQclw=;
        b=KVyIwsJWS45tCncstCMLiuaGwKqUQ0u97XDioZr+vswXtR/pQ4EyA2tUINqDL7liE5
         sRR9kZTBQQ8bCN7n1lZlZ7vabAfw5Ld0+kBUXMmrQ8oAJBlhILF48uNppkZVDhKNK2Rx
         ur1dqpcERHqxhfOEWbUwPIrQkOlIgQwvCaIPzgFK1lrZNPk2+FNDITAhoT27rN1cW/TX
         8w9NM5bi4PWTCZ5PCkUAPFxXUu9+ijz3Wx8+IHpr7sC8RX3u/7PUYKzMl+AZwohuqfbJ
         P+N0bN2eYz4D3Mpu2b47hTj2zpAzTl7qGJakHOcWm145a5dF0EZJzuEVmJ5Tk0kZEyNm
         /bLA==
X-Forwarded-Encrypted: i=1; AHgh+RqHi0L2msiSVT29fORRrIRzV87igwW1xJ1Y++EIWAXlPP0VdbO003eGehNtRf4XfJ1YXmTBZ8vymeA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzsq2sXIJbs6xGM55XG29cpMsV5z2mnqKyMPEngGm9RNrjQaoXv
	H+vQypukfCsxPP/i81JoiuE7f6nTOzZSrwMN0NFcvv2rj24ppk7ghZiFCTGIRifrctmIPrZc9Wc
	RvOg3EQ==
X-Received: from pfjt11.prod.google.com ([2002:a05:6a00:21cb:b0:84e:2062:2edb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9506:b0:84a:29a7:f64c
 with SMTP id d2e1a72fcca58-84f2de45511mr20003910b3a.0.1786059434181; Thu, 06
 Aug 2026 16:37:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:57 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-41-seanjc@google.com>
Subject: [PATCH v6 40/51] x86/pvclock: WARN if pvclock's valid_flags are overwritten
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
X-purgate-ID: tlsNG-4011c0/1786059436-524DFCFC-23BCB0E7/13/0
X-purgate-type: clean
X-purgate-size: 780

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
2.55.0.679.g6767b8d81c-goog


