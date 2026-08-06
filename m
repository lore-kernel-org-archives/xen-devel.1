Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF83C5AC67
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:37:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385367.1627835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7eH-0005E1-EI; Thu, 06 Aug 2026 23:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385367.1627835; Thu, 06 Aug 2026 23:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7eH-0005Dq-At; Thu, 06 Aug 2026 23:37:17 +0000
Received: by outflank-mailman (input) for mailman id 1385367;
 Thu, 06 Aug 2026 23:37:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3qRp1agYKCQ46so1xqu22uzs.q20Bs1-rs9szzw676.Bs1352xsq7.25u@flex--seanjc.bounces.google.com>)
 id 1ws7eF-00056Z-VC
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:37:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7eF-00Gchi-CG
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:37:15 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3qRp1agYKCQ46so1xqu22uzs.q20Bs1-rs9szzw676.Bs1352xsq7.25u@flex--seanjc.bounces.google.com>)
 id 6a751aa2-bab6-0a2a0a5309dd-0a2a4505a808-16
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:15 +0200
Received: from [209.85.216.70] (helo=mail-pj1-f70.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3qRp1agYKCQ46so1xqu22uzs.q20Bs1-rs9szzw676.Bs1352xsq7.25u@flex--seanjc.bounces.google.com>)
 id 6a751aa9-4cb1-0a2a45050019-d155d846b569-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:37:15 +0200
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-38f5ac7354dso3867268a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:37:14 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059433; x=1786664233; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rt852L9wHdv0bDRlKJAMITX85TrVIH1oxytQu/w6xUg=;
        b=hB1cuZKpyyowQkIuPIQPK4SDD3mNXcl+F3g0EdPblRujk6bQ6RazudGIEWHYIcZtgo
         sIMC2Cqxg5QFcEi7nwmq7Y9ACLV8OUHwqovnj/Ey3b8eY50flNmugiB+24pDA6I8YJcf
         NHf8TctOk5YPbVDomx7BJ8KxYa7y0/pR0DPMYLuN8YyWn3fi8B8rVU3iqsBGoP+zE6IV
         yx6EGhn0qSrooSOUiInhsdSPGWt7Wd84kQt1kVvsb26qWjPuDZmOylfQcHQfs6YXgfeC
         CA8gtN1RtiODWWbMqZnHkxVhLFlccxwlsMKQdJ3KylbjOAzqHW3tL/bAlY8rSFhUFeIi
         S9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059433; x=1786664233;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rt852L9wHdv0bDRlKJAMITX85TrVIH1oxytQu/w6xUg=;
        b=daDMgkg9YrrssARbkmqGLyFrDHPb6Js6uCb7ektGKD2hmL6hczZrqRnVvDSmPBMlLi
         Ak803lbErSVzGPQAL7ficTzY4HZta3dTrsVasUeqxKdXpE/D2SOmK4l/Dj5aZdaOSxTy
         P9UGEEUz6Py+casuPqOjevbEq10PqRKldoZXCitf8q6Nsl25NegQmAa47UohTeOwWJjo
         rJnYoKe9n9VXtClSQvXc9L/WSYXUARbEb950NyO3S+WUOS5jCzFsY1bFN1ss781Id/yx
         cojWbWlHk9U5kct5wfgfolnJ2yGgPZa8iZn/NiWXbngz0beXFTy/t1T0o4qI8UAmDNje
         t95Q==
X-Forwarded-Encrypted: i=1; AHgh+RrF30tF+Z4W+fml7WgPHbKrPibBg7yOEdrF+Hairo4bSKf7RZTgJGBXui1W8LW6AYhkGTI88Lwuso4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzy1PesDviqwhZeAAltjENPqzSZ3jQYOF1fuVZ6m795kuqBiHpY
	G0LW3n7e4VHyvHLfOgRWN4OrO+yfIaJoD3MT9SbeGkoKWFuQnWbIQ1KDdIEBFgHOqHRGgUBZAUn
	QgDO1sA==
X-Received: from pgkd23.prod.google.com ([2002:a63:f257:0:b0:cbe:7907:901])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d52c:b0:3c3:812a:2198
 with SMTP id adf61e73a8af0-3cb85df190amr24070365637.4.1786059433092; Thu, 06
 Aug 2026 16:37:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:56 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-40-seanjc@google.com>
Subject: [PATCH v6 39/51] x86/pvclock: Mark setup helpers and related various
 as __init/__ro_after_init
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
X-purgate-ID: tlsNG-c201ff/1786059435-F62AB2A1-C6F9C289/0/0
X-purgate-type: clean
X-purgate-size: 1384

Now that Xen PV clock and kvmclock explicitly do setup only during init,
tag the common PV clock flags/vsyscall variables and their mutators with
__init.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/pvclock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/pvclock.c b/arch/x86/kernel/pvclock.c
index b3f81379c2fc..a51adce67f92 100644
--- a/arch/x86/kernel/pvclock.c
+++ b/arch/x86/kernel/pvclock.c
@@ -16,10 +16,10 @@
 #include <asm/pvclock.h>
 #include <asm/vgtod.h>
 
-static u8 valid_flags __read_mostly = 0;
-static struct pvclock_vsyscall_time_info *pvti_cpu0_va __read_mostly;
+static u8 valid_flags __ro_after_init = 0;
+static struct pvclock_vsyscall_time_info *pvti_cpu0_va __ro_after_init;
 
-void pvclock_set_flags(u8 flags)
+void __init pvclock_set_flags(u8 flags)
 {
 	valid_flags = flags;
 }
@@ -153,7 +153,7 @@ void pvclock_read_wallclock(struct pvclock_wall_clock *wall_clock,
 	set_normalized_timespec64(ts, now.tv_sec, now.tv_nsec);
 }
 
-void pvclock_set_pvti_cpu0_va(struct pvclock_vsyscall_time_info *pvti)
+void __init pvclock_set_pvti_cpu0_va(struct pvclock_vsyscall_time_info *pvti)
 {
 	WARN_ON(vclock_was_used(VDSO_CLOCKMODE_PVCLOCK));
 	pvti_cpu0_va = pvti;
-- 
2.55.0.679.g6767b8d81c-goog


