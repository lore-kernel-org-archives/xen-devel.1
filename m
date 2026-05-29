Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00718CD6E50
	for <xen-devel@archiver.kernel.org>; Fri, 29 May 2026 15:07:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1322429.1588681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSynh-0004ee-2o; Fri, 29 May 2026 15:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322429.1588681; Fri, 29 May 2026 15:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyng-0004eX-VM; Fri, 29 May 2026 15:07:04 +0000
Received: by outflank-mailman (input) for mailman id 1322429;
 Fri, 29 May 2026 15:07:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3k6sZagYKCagaMIVRKOWWOTM.KWUfMV-LMdMTTQaba.fMVXZWRMKb.WZO@flex--seanjc.bounces.google.com>)
 id 1wSynf-0004dK-EY
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:07:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSyne-00Fyrx-HD
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:07:02 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3k6sZagYKCagaMIVRKOWWOTM.KWUfMV-LMdMTTQaba.fMVXZWRMKb.WZO@flex--seanjc.bounces.google.com>)
 id 6a19ab8e-2eae-0a2a0a5409dd-0a2a4505ad12-28
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:07:02 +0200
Received: from [209.85.215.201] (helo=mail-pg1-f201.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3k6sZagYKCagaMIVRKOWWOTM.KWUfMV-LMdMTTQaba.fMVXZWRMKb.WZO@flex--seanjc.bounces.google.com>)
 id 6a19ab94-aaa8-0a2a45050019-d155d7c9cc69-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:07:02 +0200
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-c85798977dcso406674a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:07:01 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780067220; x=1780672020; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xaVkfsA2sOgFELwC+9kgheEWN7jnZ1tVtkSLe6gYY/I=;
        b=FuB4ZC1axNwZoIZvrLnLzzsnhFj0j0sofU1qpw57UV6dkOSDc1G5Gw6KHIpr+nb4Rp
         fNBKAui3BZeFch9cbjucDHzvYGnJRbdYk8pdW8CC8fILes+pDqf6ZyU+oT2fx3G3lx2c
         sTJSXwGJFyY+FStyuDQuRbWgXUZf+/6h3CGVtLJOUjNlCN3AXAseZ5CLGbhy47qLM3PE
         mJ59KpMT2zwVhy2TdBKBIPjkD2iC5QlZT4c/zZ4yugwmfaH19btl5F2ZWGYIsoMWSaoe
         Ef0Gkos4kFpAl2lvP5R7AtVXb15+0KVR/Gz4U4/shDpMTfuuvBVN/RprglTrA8GHhXvi
         DxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067220; x=1780672020;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xaVkfsA2sOgFELwC+9kgheEWN7jnZ1tVtkSLe6gYY/I=;
        b=lSOJ2H4+BP7LjJ3PoDXexZhveJc4WSz6vmLsn+YLwG5m8vqhk3xaMLXv9QW214C0M1
         DURiYt1uq/fP4Z6+xpw3l0LgUKZag3NaD0PFsJDUMImrkaQpptu1/JFkekNf5SgWl5gc
         O8rhbmWAoFvORq8gHhEuzhe7h1ivNj34QTC/yRlLlcIJ1tA9iTnikdNi2A4KhFNyWgns
         SUq7E+xRmjPnJQY8yX9AJBNA4arizVSJk4SgH3O29EXC9svO8oUMhSGaylDyu/+hxEWB
         Jlone18iwjCoQzbNe8a/c3SOBtVFvnV3hBhroldzXJB9O3BBZ+Fgeb39hkTY+lBa+V72
         GfsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Z5kpQYr7AAn7mHsA+B6jb+eTgDQhzR4+5wM0F4LNKnCrDhfWh4579Mgv1DWc2ZtIrIV95A0B20FY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzq0jaLHWFBt0iydnLPNsISjPhEW9pDvX3tIUv2YSDYX70UFNcQ
	DCHUnRiO1+k54On43RIxg2t9yg9mmlil297b4ue1Xl9PTwA6hyvXe+h7l0kescwJyg61spGN5XG
	x/qD1hQ==
X-Received: from pfkk14.prod.google.com ([2002:aa7:90ce:0:b0:82f:6245:a6ec])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8088:b0:838:c01a:7a50
 with SMTP id d2e1a72fcca58-84212ce8ccamr3369227b3a.30.1780067219938; Fri, 29
 May 2026 08:06:59 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:06:31 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150631.713818-1-seanjc@google.com>
Subject: [PATCH v4 27/47] x86/paravirt: Remove unnecessary PARAVIRT=n stub for paravirt_set_sched_clock()
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
X-purgate-ID: tlsNG-c201ff/1780067222-D3D67443-91E7D5EE/0/0
X-purgate-type: clean
X-purgate-size: 1570

Remove the unnecessary paravirt_set_sched_clock() stub for PARAVIRT=n, as
all callers are gated by PARAVIRT=y.  Eliminating the stub will avoid a
pile of pointless churn as the "real" implementation evolves.

No functional change intended.

Fixes: 39965afb1151 ("x86/paravirt: Move paravirt_sched_clock() related code into tsc.c")
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 3 +++
 arch/x86/kernel/tsc.c        | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index fda18bcb19b4..c71b466d6ace 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -12,7 +12,10 @@ extern void recalibrate_cpu_khz(void);
 extern int no_timer_check;
 
 extern bool using_native_sched_clock(void);
+
+#ifdef CONFIG_PARAVIRT
 void paravirt_set_sched_clock(u64 (*func)(void));
+#endif
 
 /*
  * We use the full linear equation: f(x) = a + b*x, in order to allow
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index bdff8c988866..888bd1cbd9bc 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -288,7 +288,6 @@ void paravirt_set_sched_clock(u64 (*func)(void))
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
 
 bool using_native_sched_clock(void) { return true; }
-void paravirt_set_sched_clock(u64 (*func)(void)) { }
 #endif
 
 notrace u64 sched_clock(void)
-- 
2.54.0.823.g6e5bcc1fc9-goog


