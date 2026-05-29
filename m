Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17203CD6E50
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2026 15:13:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1322550.1588861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSytc-0008A1-Jr; Fri, 29 May 2026 15:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322550.1588861; Fri, 29 May 2026 15:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSytc-00089p-GQ; Fri, 29 May 2026 15:13:12 +0000
Received: by outflank-mailman (input) for mailman id 1322550;
 Fri, 29 May 2026 15:13:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <31qsZagYKCesfRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 1wSyta-000831-SQ
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:13:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSyta-00EPhQ-9E
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:13:10 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <31qsZagYKCesfRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 6a19acea-bab6-0a2a0a5309dd-0a2a450bcd4c-28
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:13:10 +0200
Received: from [209.85.214.201] (helo=mail-pl1-f201.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <31qsZagYKCesfRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 6a19abd7-212f-0a2a450b0019-d155d6c9e57c-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:08:09 +0200
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2b4530a90fdso105002475ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:08:09 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780067287; x=1780672087; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=juhHvibOKBbL5R/8TYL0oDxVwG80NiQFMLoZ+aO+Nyo=;
        b=C7kK3rEzPkTSQwbbdTOEFjONUhRioLW3n5Xga4D/eEGJxTydGtZZ/QJxcBRpkGgYls
         g8iHc1obY1uWwigWDUwfz8vRBjKUg8/LepCz5soke76hm9z5+slkNRkWH+rDje00u/yt
         TE1O9VDJxAVTGCCxke5BuFXTPsJ4zY+f5DkWpsv2sTADU/6W4mU8jYI4BPzOoFA2N/Th
         UjF+jQwNP0WvFsqXsY/cHGO+f7JC1YfpwghlMnW0TxJCIEHsvcOT/VUB2ckiorn/a02w
         rTtsuW5rwj0FN7vok3yIs3f6oKATfhclZYcPwCyuCyiRQxPZMXknpPi0eSQlvAf3C2Jk
         0IqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067287; x=1780672087;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=juhHvibOKBbL5R/8TYL0oDxVwG80NiQFMLoZ+aO+Nyo=;
        b=l56AJKk7SyqvHvLc2+ky1hbnDVr0Yb4Fao9eCVcz1KQ/THueGwCCzYCV4Va7Wxsze1
         4MSJUs+h0mk+uXzQUwp0cgeCmuOLGCBvVV7uAAieB0WGxSwzsmYXNdxFo4Llx4O1avR/
         h+H5Yt+6cjHLD3306UEWcVu5bEAx7cvtPU9s7L5eqxYZlY1ezZleaoohiqUWK6na6I/J
         vBSdlGExwYVk5wEDPtnNVFh7rLD8dQkrktzEgSfXWbL0/go6XdZFZMl1f10sEhPyZnND
         vJ7TCFLo+ya5B6DvOisGKWsMl9Lgh75T7oWgu/WQsnFMCTcdUBHJGX9co5YxIqQJvjhs
         Mf3A==
X-Forwarded-Encrypted: i=1; AFNElJ/OGHjogEEkVq1GGkd2WFTn5FDt+UzQIfXnSitnSCptugNPsTO1xLlZHqgnsppxU1ahSG9NuBfGBlc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUyNBtmmuNlkZC0LT7CxnYGCmvAYw2tI4r7GupO4oEBySK1zdS
	v8QfcBLlzggEoxogwhUifbeW4r+lvSFCwhofZkYAvNV7MnFlM7otdHiTYmfJxT6C7hKJs9lUrsZ
	qQn9jeA==
X-Received: from plrf5.prod.google.com ([2002:a17:902:ab85:b0:2b0:5538:b55b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e88c:b0:2bf:2188:a90f
 with SMTP id d9443c01a7336-2bf3687a3f3mr2296425ad.32.1780067286623; Fri, 29
 May 2026 08:08:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:08:03 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150803.714504-1-seanjc@google.com>
Subject: [PATCH v4 35/47] x86/xen/time: Mark xen_setup_vsyscall_time_info() as __init
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-42698a/1780067289-12573F3B-A54021A6/13/0
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
index 91ef83b1e540..8f4511f91d16 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -454,7 +454,7 @@ void xen_restore_time_memory_area(void)
 	xen_sched_clock_offset = xen_clocksource_read() - xen_clock_value_saved;
 }
 
-static void xen_setup_vsyscall_time_info(void)
+static void __init xen_setup_vsyscall_time_info(void)
 {
 	struct vcpu_register_time_memory_area t;
 	struct pvclock_vsyscall_time_info *ti;
-- 
2.54.0.823.g6e5bcc1fc9-goog


