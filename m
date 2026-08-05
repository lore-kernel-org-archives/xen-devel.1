Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE79C55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 12:45:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383392.1626684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrb01-0004tX-0G; Wed, 05 Aug 2026 12:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383392.1626684; Wed, 05 Aug 2026 12:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrb00-0004si-Pi; Wed, 05 Aug 2026 12:45:32 +0000
Received: by outflank-mailman (input) for mailman id 1383392;
 Wed, 05 Aug 2026 12:45:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wrazz-0004pu-Sy
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:45:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrazz-004adb-9X
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:45:31 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a73306b-2eae-0a2a0a5409dd-0a2a4509ba4e-0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:45:31 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a73306b-be1a-0a2a45090019-d155dd34c8a3-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:45:31 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47f9ab7ee38so496183f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 05:45:31 -0700 (PDT)
Received: from andrew-laptop.. ([157.231.70.114])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fec23e533sm8779762f8f.28.2026.08.05.05.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 05:45:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1785933931; x=1786538731; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lqsAtBET9oa8FmQopb1o6zNaXAFCZR7+pOGZSxtba0c=;
        b=IB3WkI6/nrEAOvOTS9+gWcGasd54tbrhgFLOVPT+klom1JpCm40QHP50iKno6uSAn3
         9ms495ykJviGATEtbSp9l0gPF//jmm5h9Deby5Q6L0GFNIkt9c6h4zLMBbP1N7DZrRLq
         d9pTgzdE9AMaAdvXcyOoeQx/NcGv8u1NLaAb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785933931; x=1786538731;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lqsAtBET9oa8FmQopb1o6zNaXAFCZR7+pOGZSxtba0c=;
        b=p6MfRnZKcc2x0J3i1FK3TpfDOUeDqyjYTtCZft6WaFzRnh8KlRMbdQudJOvGZtCTed
         XABXAA3wTMR1X7plcrK0QL84+Ed0Qz9GEPoqRqPFnNfkoLuaCtCsYW+Oy9GvbbX+40SU
         O89QWmh8Qc3qOZg6bsP32OoP0PQjLYGLe3Ct0vX3u/Bk0JcS58GwVeebJjDnmgl+VqZp
         sq09+CARwCaqLyHTcDW7G8J3kaUWiCwgslNBPK4ahwd24c/CG17zep+10h2Tfg4+QkYR
         VVRrUStZT35PTaHP6CBI/31Ph9AlurChiITPnbijdoZVcP1I1i4/i0ZpEvDzt16k3Cn8
         ZAog==
X-Gm-Message-State: AOJu0YzCjspTZ5tgmIMd/qSpHh16ucGJ8DgJ1OWB7frFBkFvtwHOkGC/
	rMVCQvEFffjwghKDFFfILsnDZy0TzIL8Y0aeMXCyKbw9W8PaGRQWQRppnny7w7yfIhy3KAcSnLe
	jaRXLIpw=
X-Gm-Gg: AR+sD1016s42HIWxZ/Eo7AQb/amPaBK+I8ewFLn4ZkM11Qnr3ma1U+kvyfJvlyR8Bh0
	x8OJtPIw9sYQOvpPDy2A0dcu42e/VtWcdEFLy7xRsnTDjX6E9B8PkMbRRn+09N0NdLqgnMWJ4BG
	dci7MNCdsMQmRzctj7B+Kuu+pipsPkbTGgXiz9Bfy6M6t9OYqVTVbWdFKLYjr9vCSv2XgzDYV25
	MAaGrzmdnpMfLod6xdUe8aXxKdvG66rjFQwwDXrYVc9yeNGl/J8zsqDPpWxvoKVE73T888ZbvYQ
	Dlxe29f96ftaOM8CHjXCCiiPzPY9S72wkL7fRFVtRCtnNalxB3iOgVHiloot8L2feq7I+NDPOpc
	lmHDGD+73tjWO9NviZMEh6YOy5nHkcBNU/K8i5LMyjuqPYpHiJrBr84ahT3BHl3eNt4XoVNrN28
	Gu37Cc4RqDkFtdAEZaU88DJD9gO7pYhdmW30UtTZQL9BlGoSVLCzrE4izQbMtRy1FnJteW2JkJ
X-Received: by 2002:a05:6000:2489:b0:47f:6f9e:1e86 with SMTP id ffacd0b85a97d-47fec63481dmr10039143f8f.27.1785933930160;
        Wed, 05 Aug 2026 05:45:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 3/5] x86/nmi: Misc style fixes
Date: Wed,  5 Aug 2026 13:45:23 +0100
Message-Id: <20260805124525.105457-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260805124525.105457-1-andrew.cooper3@citrix.com>
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1785933931-BE4DB034-C4BD65E7/0/0
X-purgate-type: clean
X-purgate-size: 5407

 * Drop trailing whitespace
 * Sort includes, dropping asm/mc146818rtc.h and asm/div64.h as unused
 * Brace position, and types

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/nmi.c | 54 ++++++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 113e672c4f15..d9d07870a333 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -13,26 +13,25 @@
  *  Mikael Pettersson : PM converted to driver model. Disable/enable API.
  */
 
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/delay.h>
 #include <xen/init.h>
+#include <xen/irq.h>
+#include <xen/keyhandler.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
 #include <xen/param.h>
-#include <xen/irq.h>
-#include <xen/delay.h>
-#include <xen/time.h>
 #include <xen/sched.h>
-#include <xen/console.h>
 #include <xen/smp.h>
-#include <xen/keyhandler.h>
+#include <xen/time.h>
 #include <xen/watchdog.h>
-#include <xen/cpu.h>
+
+#include <asm/apic.h>
 #include <asm/current.h>
-#include <asm/mc146818rtc.h>
-#include <asm/msr.h>
 #include <asm/mpspec.h>
+#include <asm/msr.h>
 #include <asm/nmi.h>
-#include <asm/div64.h>
-#include <asm/apic.h>
 
 unsigned int nmi_watchdog = NMI_NONE;
 static unsigned int nmi_hz = HZ;
@@ -124,10 +123,10 @@ static int nmi_active;
 #define P4_CCCR_REQUIRED	(3<<16)
 #define P4_CCCR_ESCR_SELECT(N)	((N)<<13)
 #define P4_CCCR_ENABLE		(1<<12)
-/* 
+/*
  * Set up IQ_PERFCTR0 to behave like a clock, by having IQ_CCCR0 filter
  * CRU_ESCR0 (with any non-null event selector) through a complemented
- * max threshold. [IA32-Vol3, Section 14.9.9] 
+ * max threshold. [IA32-Vol3, Section 14.9.9]
  */
 #define P4_NMI_CRU_ESCR0	P4_ESCR_EVENT_SELECT(0x3F)
 #define P4_NMI_IQ_CCCR0	\
@@ -182,7 +181,7 @@ void __init check_nmi_watchdog(void)
      * There's a limit to how slow we can go because writing the perfctr
      * MSRs only sets the low 32 bits, with the top 8 bits sign-extended
      * from those, so it's not possible to set up a delay larger than
-     * 2^31 cycles and smaller than (2^40 - 2^31) cycles. 
+     * 2^31 cycles and smaller than (2^40 - 2^31) cycles.
      * (Intel SDM, section 18.22.2)
      */
     if ( nmi_watchdog == NMI_LOCAL_APIC )
@@ -199,8 +198,9 @@ static void cf_check nmi_timer_fn(void *unused)
 
 void disable_lapic_nmi_watchdog(void)
 {
-    if (nmi_active <= 0)
+    if ( nmi_active <= 0 )
         return;
+
     switch ( boot_cpu_data.vendor )
     {
     case X86_VENDOR_AMD:
@@ -231,9 +231,7 @@ void disable_lapic_nmi_watchdog(void)
 
 static void clear_msr_range(unsigned int base, unsigned int n)
 {
-    unsigned int i;
-
-    for (i = 0; i < n; i++)
+    for ( unsigned int i = 0; i < n; i++ )
         wrmsrns(base + i, 0);
 }
 
@@ -302,7 +300,7 @@ static void setup_p4_watchdog(void)
     uint64_t misc_enable;
 
     rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
-    if (!(misc_enable & MSR_IA32_MISC_ENABLE_PERF_AVAIL))
+    if ( !(misc_enable & MSR_IA32_MISC_ENABLE_PERF_AVAIL) )
         return;
 
     nmi_perfctr_msr = MSR_P4_IQ_PERFCTR0;
@@ -310,15 +308,18 @@ static void setup_p4_watchdog(void)
     if ( boot_cpu_data.x86_num_siblings == 2 )
         nmi_p4_cccr_val |= P4_CCCR_OVF_PMI1;
 
-    if (!(misc_enable & MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL))
+    if ( !(misc_enable & MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL) )
         clear_msr_range(0x3F1, 2);
     /* MSR 0x3F0 seems to have a default value of 0xFC00, but current
        docs doesn't fully define it, so leave it alone for now. */
-    if (boot_cpu_data.model >= 0x3) {
+    if ( boot_cpu_data.model >= 0x3 )
+    {
         /* MSR_P4_IQ_ESCR0/1 (0x3ba/0x3bb) removed */
         clear_msr_range(0x3A0, 26);
         clear_msr_range(0x3BC, 3);
-    } else {
+    }
+    else
+    {
         clear_msr_range(0x3A0, 31);
     }
     clear_msr_range(0x3C0, 6);
@@ -393,7 +394,7 @@ static int cf_check cpu_nmi_callback(
 }
 
 static struct notifier_block cpu_nmi_nfb = {
-    .notifier_call = cpu_nmi_callback
+    .notifier_call = cpu_nmi_callback,
 };
 
 static DEFINE_PER_CPU(unsigned int, last_irq_sums);
@@ -444,15 +445,15 @@ bool nmi_watchdog_tick(const struct cpu_user_regs *regs)
          * before doing the oops ...
          */
         this_cpu(alert_counter)++;
-        if ( this_cpu(alert_counter) == opt_watchdog_timeout*nmi_hz )
+        if ( this_cpu(alert_counter) == opt_watchdog_timeout * nmi_hz )
         {
             console_force_unlock();
             printk("Watchdog timer detects that CPU%d is stuck!\n",
                    smp_processor_id());
             fatal_trap(regs, 1);
         }
-    } 
-    else 
+    }
+    else
     {
         this_cpu(last_irq_sums) = sum;
         this_cpu(alert_counter) = 0;
@@ -512,7 +513,8 @@ bool nmi_watchdog_tick(const struct cpu_user_regs *regs)
 void self_nmi(void)
 {
     unsigned long flags;
-    u32 id = get_apic_id();
+    uint32_t id = get_apic_id();
+
     local_irq_save(flags);
     apic_wait_icr_idle();
     apic_icr_write(APIC_DM_NMI | APIC_DEST_PHYSICAL, id);
-- 
2.34.1


