Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEAFC43602
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2026 19:34:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1350549.1608060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0h8-0002eq-QP; Wed, 01 Jul 2026 19:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350549.1608060; Wed, 01 Jul 2026 19:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0h8-0002ej-MC; Wed, 01 Jul 2026 19:34:02 +0000
Received: by outflank-mailman (input) for mailman id 1350549;
 Wed, 01 Jul 2026 19:34:01 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3amtFagYKCa8hTPcYRVddVaT.RdbmTc-STkTaaXhih.mTcegdYTRi.dgV@flex--seanjc.bounces.google.com>)
 id 1wf0h7-0002MV-4b
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:34:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0h6-003oMF-Hz
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:34:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3amtFagYKCa8hTPcYRVddVaT.RdbmTc-STkTaaXhih.mTcegdYTRi.dgV@flex--seanjc.bounces.google.com>)
 id 6a456b8a-2eae-0a2a0a5409dd-0a2a4506ddcc-24
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:34:00 +0200
Received: from [209.85.215.201] (helo=mail-pg1-f201.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3amtFagYKCa8hTPcYRVddVaT.RdbmTc-STkTaaXhih.mTcegdYTRi.dgV@flex--seanjc.bounces.google.com>)
 id 6a456b6a-08de-0a2a45060019-d155d7c9c056-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:33:00 +0200
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-c88ad1558f4so1256399a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:59 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934378; x=1783539178; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=m4IxRx7fOhcWBmMrJhtIUc/shJhrGyqdre87YRmUR5M=;
        b=oTg6PAOC/FL6P0Upjw8OG+i0hWOQe8Eia4QqrupxR/mEFB6T6kGZ8IRaGwPIFwKYj6
         8UCF4ZJFUWTZZXMbCVF8qnNqCIgkdYMSPFXNHAcnRkpOu1uDgNJottZqIGbF4ZdC0ZFd
         MrPF3T2siWeIjDF8rNKE+TB6/2OredC+ywVa2shfxM53U/utPGQJjlblpUn8697v1kjj
         4HfBVG35L7xwO7xmOqA+FDmmJmqPHDNHbYrtm0ZNdMVu5OcH9cSCneHyOStzcbVM0qjc
         fc/vLOTWAAPR7uH5fj6fPDXe4qlT4An5tYnZMPJ+0NZ3qSr2z6YpJkeog1/NQ8HirvY/
         sL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934378; x=1783539178;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4IxRx7fOhcWBmMrJhtIUc/shJhrGyqdre87YRmUR5M=;
        b=aVpfSRmBDciU6EXBDSOxr9wg+NebSDvukWgXoJwkC3i8X1gvUXQMndGwv2ssDpTg65
         gyoTqWmGhrptP1sbI4x4gGFEX5io2SQME3XiGneJOUiqrtYZz7Ev354RGt840By5gyuw
         GwDnN1A3DVzBPdNw9gqgb4NUrVxiBtRzZsaOG1EO+LvZ5fxRcOZvn8TL/h6nZ0S6m7Z5
         ZQA5+1Mw03BucKnVfI64jyHbzym8hkYNmrfOdd8wxjvtwv7g7H3bp0N/HaNksqSHREsp
         rSWOqDbU5q5SYUAzO2JqARj0Uduh1NtK9jOm+GcJf0Voixbx4dwTSQL0GXwaQMR4NAsW
         DjWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8SWoT77RS7zoiOmHl9gLOoesJlm0K5RDpGzkYmAoF362d+JbVXntSXytLW7XP1apwHsrhZd6itV4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxtzj6ksoubWSesilwJR5pXUb1XAWymfsqjW6rVKRLUFx9HOZOs
	/NCTDqIO1cmFqjVaz9LlvGZsYe7KryOW3H7W70ei5VdhRlUkcENp/5hpVZWpuaJuS3MmiBLXlbu
	KtQEcpg==
X-Received: from pgbda6.prod.google.com ([2002:a05:6a02:2386:b0:c99:7baf:126d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6b01:b0:3b4:931c:3c7c
 with SMTP id adf61e73a8af0-3bfed50b68fmr3305567637.44.1782934378058; Wed, 01
 Jul 2026 12:32:58 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:47 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-27-seanjc@google.com>
Subject: [PATCH v5 26/51] clocksource: hyper-v: Drop wrappers to sched_clock
 save/restore helpers
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
X-purgate-ID: tlsNG-16d1c6/1782934380-C7D2D68D-25AF23C0/13/0
X-purgate-type: clean
X-purgate-size: 3436

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
2.55.0.rc0.799.gd6f94ed593-goog


