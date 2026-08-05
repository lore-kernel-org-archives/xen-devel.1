Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2FCC55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 12:45:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383394.1626703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrb03-0005NH-PI; Wed, 05 Aug 2026 12:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383394.1626703; Wed, 05 Aug 2026 12:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrb03-0005M5-GC; Wed, 05 Aug 2026 12:45:35 +0000
Received: by outflank-mailman (input) for mailman id 1383394;
 Wed, 05 Aug 2026 12:45:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wrb01-00059f-TT
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:45:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrb01-009h29-A2
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:45:33 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a733064-e002-0a2a0a5209dd-0a2a45029942-28
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:45:33 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a73306d-6ca4-0a2a45020019-d155dd2addd7-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:45:33 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47f7854678cso591338f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 05:45:33 -0700 (PDT)
Received: from andrew-laptop.. ([157.231.70.114])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fec23e533sm8779762f8f.28.2026.08.05.05.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 05:45:31 -0700 (PDT)
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
        d=citrix.com; s=google; t=1785933933; x=1786538733; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7770vZRJ4ZFGBtmI51IRg/58qd/H6KqbB1Rxt63P7kE=;
        b=s304l9ZBXdbG+N90oKjzRFvQmwbyWj3DNzRlz0DMfQbu+SGg5uNeROz1Di0mbsY17P
         vzz95s/g3mC+b3eZBevM6NbnAueDYHVD5vbpn3vpL604j6HPOUEkKcnLpDCFG3axPKX0
         csPDP/lj3vVfRWdOjn/OCrnA/+e73FIOvxqx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785933933; x=1786538733;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7770vZRJ4ZFGBtmI51IRg/58qd/H6KqbB1Rxt63P7kE=;
        b=a7imZzMVvmwPOexWyxoOz0rHNwS9BLKu+veWRkWG7G1eARk7SU//48VTHsYwKbHH+A
         6V2mHK/2oqR+jdoF4iWylfT8hv5Edg7Jpwby73eQkiONGtAImG/LDpvW9F3hH4lkTiJ8
         xpaIqs86XASxUh6SSO92QVxi9lHtH6xEbt5r/t7i5JcRIeo3TwyzhUPr66DzjpvqTBIE
         6BNoScfRnOcUA5cV2dc1u/1YUJJMnKh2hcip8vAXOdh/sVnxiEtS0o38FVucuk0tz2Zs
         wv3ef8byUYeX5oUWaxgJj/+floIaj7TSOcijjwDScjLoE5KK5Hv4LoNrSlxyOo+3jjGF
         AU1g==
X-Gm-Message-State: AOJu0Yw3Ijxhg/Lzd+iWM9d+nAvYfjS4Hvk7lZEjq92VlGxyfC5VVEc3
	fLrqO5OqB8na8Rbq6FpJ9dD6fhBpRSOCdB1i4s7A+PEC0Jzh16Bex4hVLqeXQFwFq4Ohq+ZxyON
	AzyP8
X-Gm-Gg: AR+sD12+Wl6Yke9FX6SLwmYr8qt7TjYkamDLyS5rbrZS6SEksDSHIfFFB3Xw/cuHAVG
	ZNepcxHS2p2q11MoNs3Gsrrl97Kpo9xMnZ+jLwdscRLd4MQIHpa9yxI5JHl+LGHW38uuqWiUvm2
	PN801DMn40+kUuI1e40W3RuVPM5qr9q+Nas6zN0jsH/Bc3MWLNbvlpTCI54BgC4shRx1puLlJWP
	ueaKfmYZuVmixwg/jnLFXzrE55mqPTryWoqNKU4RmhjML5JYpvkbEyLhJbntAmHiIcHC5ou5cCB
	wNCPTxl3xlsBRKPHgHju7JMywDdFGOOAHRAzrkXWW8vVByRUXm8mbB5VmPSznBvSBEzoqLQGF7d
	m5pZwvD8sm2uSX0DanNh5HlhBL2vpjQbsHjEFJ92af7qYAjXPap7IGOwEx8zOnfx+EhG1YZ+qlW
	wbqf/QIJzSZT5zbslif80pjdfbP7WcKHeif9lg+t4nPRCLthTg5oW8j0g7T5Azr9QEt6K6Twr2
X-Received: by 2002:a05:6000:25ca:b0:47f:9568:ebf0 with SMTP id ffacd0b85a97d-47fec52786bmr10833838f8f.23.1785933932021;
        Wed, 05 Aug 2026 05:45:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 5/5] x86/nmi: Don't configure EvtSel repeatedly
Date: Wed,  5 Aug 2026 13:45:25 +0100
Message-Id: <20260805124525.105457-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260805124525.105457-1-andrew.cooper3@citrix.com>
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1785933933-F38BC2AC-84BF9D56/0/0
X-purgate-type: clean
X-purgate-size: 3266

In both setup_{k7,p6}_watchdog(), EvtSel0 is first zeroed, then written with
everything but the enable bit, then written with the enable bit.

setup_p4_watchdog() is slightly more complicated, owing to what
appears to be a bug introduced by commit 2a2bd8de16b6 ("Clean up NMI
watchdog handler."), which causes a second bit to be temporarily
different too.

The middle of the three writes is useless in all cases.  Drop it.

While doing this, rename the 'counter' parameter for
setup_p6_watchdog().  It is the event which is passed in; the counter
is always counter 0.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/nmi.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index a8b0d79c7cf2..a697486b834d 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -246,29 +246,20 @@ static inline void write_watchdog_counter(const char *descr)
 
 static void setup_k7_watchdog(void)
 {
-    unsigned int evntsel;
-
     nmi_perfctr_msr = MSR_K7_PERFCTR0;
 
     clear_msr_range(MSR_K7_EVNTSEL0, 4);
     clear_msr_range(MSR_K7_PERFCTR0, 4);
 
-    evntsel = K7_EVNTSEL_INT
-        | K7_EVNTSEL_OS
-        | K7_EVNTSEL_USR
-        | K7_EVENT_CYCLES_PROCESSOR_IS_RUNNING;
-
-    wrmsrns(MSR_K7_EVNTSEL0, evntsel);
     write_watchdog_counter("K7_PERFCTR0");
     apic_write(APIC_LVTPC, APIC_DM_NMI);
-    evntsel |= K7_EVNTSEL_ENABLE;
-    wrmsrns(MSR_K7_EVNTSEL0, evntsel);
+    wrmsrns(MSR_K7_EVNTSEL0,
+            K7_EVNTSEL_ENABLE | K7_EVNTSEL_INT | K7_EVNTSEL_OS |
+            K7_EVNTSEL_USR | K7_EVENT_CYCLES_PROCESSOR_IS_RUNNING);
 }
 
-static void setup_p6_watchdog(unsigned counter)
+static void setup_p6_watchdog(unsigned int event)
 {
-    unsigned int evntsel;
-
     if ( !nmi_p6_event_width && current_cpu_data.cpuid_level >= 0xa )
         nmi_p6_event_width = MASK_EXTR(cpuid_eax(0xa), P6_EVENT_WIDTH_MASK);
     if ( !nmi_p6_event_width )
@@ -283,16 +274,11 @@ static void setup_p6_watchdog(unsigned counter)
     clear_msr_range(MSR_P6_EVNTSEL(0), 2);
     clear_msr_range(MSR_P6_PERFCTR(0), 2);
 
-    evntsel = P6_EVNTSEL_INT
-        | P6_EVNTSEL_OS
-        | P6_EVNTSEL_USR
-        | counter;
-
-    wrmsrns(MSR_P6_EVNTSEL(0), evntsel);
     write_watchdog_counter("P6_PERFCTR0");
     apic_write(APIC_LVTPC, APIC_DM_NMI);
-    evntsel |= P6_EVNTSEL0_ENABLE;
-    wrmsrns(MSR_P6_EVNTSEL(0), evntsel);
+    wrmsrns(MSR_P6_EVNTSEL(0),
+            P6_EVNTSEL0_ENABLE | P6_EVNTSEL_INT | P6_EVNTSEL_OS |
+            P6_EVNTSEL_USR | event);
 }
 
 static void setup_p4_watchdog(uint64_t misc_enable)
@@ -323,7 +309,6 @@ static void setup_p4_watchdog(uint64_t misc_enable)
     clear_msr_range(MSR_P4_BPU_PERFCTR0, 18);
 
     wrmsrl(MSR_P4_CRU_ESCR0, P4_NMI_CRU_ESCR0);
-    wrmsrl(MSR_P4_IQ_CCCR0, P4_NMI_IQ_CCCR0 & ~P4_CCCR_ENABLE);
     write_watchdog_counter("P4_IQ_COUNTER0");
     apic_write(APIC_LVTPC, APIC_DM_NMI);
     wrmsrl(MSR_P4_IQ_CCCR0, nmi_p4_cccr_val);
-- 
2.34.1


