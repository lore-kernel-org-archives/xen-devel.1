Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9FFC5AC7A
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:37:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385330.1627827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7e1-0003oo-Vo; Thu, 06 Aug 2026 23:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385330.1627827; Thu, 06 Aug 2026 23:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7e1-0003oc-Q6; Thu, 06 Aug 2026 23:37:01 +0000
Received: by outflank-mailman (input) for mailman id 1385330;
 Thu, 06 Aug 2026 23:36:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3mBp1agYKCfsvhdqmfjrrjoh.frp0hq-ghyhoolvwv.0hqsurmhfw.ruj@flex--seanjc.bounces.google.com>)
 id 1ws7dz-0003Va-EL
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:36:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7dy-005BVk-Ra
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:36:58 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3mBp1agYKCfsvhdqmfjrrjoh.frp0hq-ghyhoolvwv.0hqsurmhfw.ruj@flex--seanjc.bounces.google.com>)
 id 6a751a9a-5cb7-0a2a0a5109dd-0a2a4507ada8-0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:58 +0200
Received: from [209.85.215.197] (helo=mail-pg1-f197.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3mBp1agYKCfsvhdqmfjrrjoh.frp0hq-ghyhoolvwv.0hqsurmhfw.ruj@flex--seanjc.bounces.google.com>)
 id 6a751a99-b4ea-0a2a45070019-d155d7c5c430-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:58 +0200
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-cb11535e6a1so2334989a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:58 -0700 (PDT)
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
        d=google.com; s=20251104; t=1786059417; x=1786664217; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mGO2RWCI+1OC1QgQlwRZRpcTYMYFszJFieAT3RQjORg=;
        b=E12iinLPKW0UPbyF7VCB8n5hfuuRtfdwFrg9iU/wapa7Q9dCWo4alPhYiw7A0xXwoL
         6pOZgajVAaF7i5HzK9rTaUBXJB/jhshj+5fUGV13O41fexyzGrNySi2KpLErs3cNtrmM
         KZqwhUG9meUtzNPnT36BoIYdMKfh9l4NaULqtRgfrBiaurXgOVZQAjocUH+PMp/r7nI9
         GNFmQUubVoM6phDJBNDuWJgIL7a4j7+2kWGK1Hh58GRyFIxCT1nhQ/6wMzbb4nVltiq1
         oO7t3QlXe8t3hG3+EvKOdyGK9WWLQ5DG2Zz94AhMpqkAW4TuBdyVB+6SjAP8J/QFFr0B
         tyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059417; x=1786664217;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mGO2RWCI+1OC1QgQlwRZRpcTYMYFszJFieAT3RQjORg=;
        b=P/dXzTyyDX2V4dHwUMfBWRtdHOmmlR6fRFXPHQx0OA56W0CzbqDH4aN9L9qEz3tMko
         Z7LUVXQdljd09Sa84IGMjZ4var2+EAElJtpZwLJV9VrPv3HLZK+PFDEhstyeVPFZLd0K
         A1Jr6QPh4w2lLSHGGHYQaHz+Opi2oon//XhUbgN9egGCGzSQC+4G36V5B7p7Q5VrtBhq
         bUrnpvq2+ObgngYlrrcj7pxhRlbcc/93gcZL6eZjiFnRx4fWq+4zpUX5+ZXiwnLtTNi7
         X/Eg4NebNXIespVgx100H8pMH+An1rYRRG/H7avyxQU8AZfRJl6IjJkFMHYX/k0U7Cd+
         RpyQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzZzQoPb7p2MJf89ByKSyVgbvVj6Ai/DjGfynbNk+N8/rl8St6BTXtxRRgHahf+o3vCrjUTQZo5x8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOTdsxwvCX475/20fxShqiXq9tyz6RRZ2f9BxL65vt/RQtfF3S
	oQOjayOzRTS+VFI48sIaVA3p7LuWpe+nwEJoZWPwMPN35pFcI7JY3RCcJKvSaeWgYVp1BQsRXjU
	3qmNDYw==
X-Received: from pgmj25.prod.google.com ([2002:a63:5959:0:b0:c9e:364c:61a2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:329c:b0:3c3:8315:80b7
 with SMTP id adf61e73a8af0-3cb85e9757amr21773483637.9.1786059416350; Thu, 06
 Aug 2026 16:36:56 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:43 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-27-seanjc@google.com>
Subject: [PATCH v6 26/51] clocksource: hyper-v: Drop wrappers to sched_clock
 save/restore helpers
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
X-purgate-ID: tlsNG-ef75cf/1786059418-A76D2AE4-D9FCF316/0/0
X-purgate-type: clean
X-purgate-size: 3432

Now that all of the Hyper-V reference counter sched_clock code is located
in a single file, drop the superfluous wrappers for the save/restore flows.

No functional change intended.

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Tested-by: Michael Kelley <mhklinux@outlook.com>
Acked-by: Wei Liu <wei.liu@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/clocksource/hyperv_timer.c | 34 +++++-------------------------
 include/clocksource/hyperv_timer.h |  2 --
 2 files changed, 5 insertions(+), 31 deletions(-)

diff --git a/drivers/clocksource/hyperv_timer.c b/drivers/clocksource/hyperv_timer.c
index 4293173c3a27..daa8cbfe61ee 100644
--- a/drivers/clocksource/hyperv_timer.c
+++ b/drivers/clocksource/hyperv_timer.c
@@ -488,17 +488,6 @@ static void resume_hv_clock_tsc(struct clocksource *arg)
 	hv_set_msr(HV_MSR_REFERENCE_TSC, tsc_msr.as_uint64);
 }
 
-/*
- * Called during resume from hibernation, from overridden
- * x86_platform.restore_sched_clock_state routine. This is to adjust offsets
- * used to calculate time for hv tsc page based sched_clock, to account for
- * time spent before hibernation.
- */
-void hv_adj_sched_clock_offset(u64 offset)
-{
-	hv_sched_clock_offset -= offset;
-}
-
 #ifdef HAVE_VDSO_CLOCKMODE_HVCLOCK
 static int hv_cs_enable(struct clocksource *cs)
 {
@@ -565,12 +554,14 @@ static void (*old_restore_sched_clock_state)(void);
  * based clocksource, proceeds from where it left off during suspend and
  * it shows correct time for the timestamps of kernel messages after resume.
  */
-static void save_hv_clock_tsc_state(void)
+static void hv_save_sched_clock_state(void)
 {
+	old_save_sched_clock_state();
+
 	hv_ref_counter_at_suspend = hv_read_reference_counter();
 }
 
-static void restore_hv_clock_tsc_state(void)
+static void hv_restore_sched_clock_state(void)
 {
 	/*
 	 * Adjust the offsets used by hv tsc clocksource to
@@ -578,23 +569,8 @@ static void restore_hv_clock_tsc_state(void)
 	 * adjusted value = reference counter (time) at suspend
 	 *                - reference counter (time) now.
 	 */
-	hv_adj_sched_clock_offset(hv_ref_counter_at_suspend - hv_read_reference_counter());
-}
-/*
- * Functions to override save_sched_clock_state and restore_sched_clock_state
- * functions of x86_platform. The Hyper-V clock counter is reset during
- * suspend-resume and the offset used to measure time needs to be
- * corrected, post resume.
- */
-static void hv_save_sched_clock_state(void)
-{
-	old_save_sched_clock_state();
-	save_hv_clock_tsc_state();
-}
+	hv_sched_clock_offset -= (hv_ref_counter_at_suspend - hv_read_reference_counter());
 
-static void hv_restore_sched_clock_state(void)
-{
-	restore_hv_clock_tsc_state();
 	old_restore_sched_clock_state();
 }
 
diff --git a/include/clocksource/hyperv_timer.h b/include/clocksource/hyperv_timer.h
index d48dd4176fd3..a4c81a60f53d 100644
--- a/include/clocksource/hyperv_timer.h
+++ b/include/clocksource/hyperv_timer.h
@@ -38,8 +38,6 @@ extern void hv_remap_tsc_clocksource(void);
 extern unsigned long hv_get_tsc_pfn(void);
 extern struct ms_hyperv_tsc_page *hv_get_tsc_page(void);
 
-extern void hv_adj_sched_clock_offset(u64 offset);
-
 static __always_inline bool
 hv_read_tsc_page_tsc(const struct ms_hyperv_tsc_page *tsc_pg,
 		     u64 *cur_tsc, u64 *time)
-- 
2.55.0.679.g6767b8d81c-goog


