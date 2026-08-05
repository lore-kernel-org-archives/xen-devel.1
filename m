Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE2FC55ABF
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 12:45:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383393.1626696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrb03-0005KG-BQ; Wed, 05 Aug 2026 12:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383393.1626696; Wed, 05 Aug 2026 12:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrb03-0005K9-8h; Wed, 05 Aug 2026 12:45:35 +0000
Received: by outflank-mailman (input) for mailman id 1383393;
 Wed, 05 Aug 2026 12:45:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wrb01-0004qQ-A6
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:45:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrb00-009h29-1B
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:45:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a733064-e002-0a2a0a5209dd-0a2a45029942-18
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:45:31 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a73306b-6ca4-0a2a45020019-d155dd2cbcf9-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 14:45:31 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47f96c5b722so540548f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 05:45:31 -0700 (PDT)
Received: from andrew-laptop.. ([157.231.70.114])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fec23e533sm8779762f8f.28.2026.08.05.05.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 05:45:30 -0700 (PDT)
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
        bh=gfNjW9ZQ4iFlwv+IcWbWGLC4if7o3p4HypcYr/O3FIo=;
        b=j4nb/rXoyPeZIvZcycFCLsHvSo8ggmdJdpITXFhun2a5v9dRXpGQL2A2NxMpt/Qn9W
         N9DLKzOUBQGYqdEE0d/RBGvr+IdX5cRyX4JwviLRX//uP6X2mAImuJL4uEdM9DacYhmx
         XGI/pVoUGgaquKL0xrLMyEb+v9fwwHbBDiNVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785933931; x=1786538731;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfNjW9ZQ4iFlwv+IcWbWGLC4if7o3p4HypcYr/O3FIo=;
        b=KAoo6+Itq4TOJ3gJ1u/KPPUvk3VoVb0WIEwo26IBBbdVMjxYynCETrq355IcRPAv92
         m90Q2eoyN8ocmGP7B5dN9LDnxrmiLmnE23SpRS861PxVpEhIxeK16eYOr8xY4BbLcHCK
         JyoUPu0I6R7hvgn1h+JmVMp/5I+RSVloiPb4r0w4JwZy/z8SR7MP8lnD38XJ+Lnupjvh
         jllPq5dlqa5NVSFuZuLe02EN6og76q0WfxdLxbArI3dxF8YWU0hTotsjIeJjIKhlNfoY
         ahI2ZIB2undMe6id1YknLLYL5aoa8xvbf+ioE2Vxcz16itmxUUtkxwEBoS7Ma/iogEZy
         CrGw==
X-Gm-Message-State: AOJu0YzxChSpPl1v8167gI4X0BFzEttrU8RrgizWsRzoOwKksnCOTrFh
	GjpEwHQYB1dc3kszCEww7HYLOsVhgDnqHvTemu3x2mde9pDrJ8XEtMp6Jaz8sFdHXa0xk+F7x5p
	rpJ8ceRk=
X-Gm-Gg: AR+sD11RTdq1lVtRH1x9Xv3nE+TKTYDE2TMO+qn8fN8Suu0x6FMo9e6FrS2cXxcyV3E
	IZn3Oo9t2vqsRaOF9w+sXJKW43ahJG4vEErGwhvPdy4Sdinp0JqRr3R5FZtB3DJ78PyStXUbXyz
	FcWZeRNr86g37stLirw5D5nU6IheuOX06SBgi32cv1rLp5+rF/4PsIzVvNuc82Zuh+0F28J2SBf
	ESyBeXHbVrN2Jr9TtiFcf1IyCICI21XApbZX9gkRzXzyw1N9kltRZwATr05qL67HleERFyGQwaB
	qX/K01OdPLBODhN9VnhFAcHTpSpwWD+WPBA+Kn/zcDKoDjmMLV9I5gYaRyFRgRDt8bd2AscoscW
	eChd1+tBDQG9tvUXKlq5xuJMV272afE3UcZ4BlAt6f4TlArRJ1ULKmI96oJkLbBKkfq8eGEXSKD
	b51I31Tfn2PRc5Wubai2vNgKBTUR+l09RBNcXEfNZonzq0JPu1LeaxligIaDXg8MORwNZnsxLD
X-Received: by 2002:adf:f311:0:b0:46e:7f72:b6fe with SMTP id ffacd0b85a97d-47fec523d07mr8462161f8f.19.1785933931038;
        Wed, 05 Aug 2026 05:45:31 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 4/5] x86/nmi: Check MSR_MISC_ENABLE for all Intel platforms
Date: Wed,  5 Aug 2026 13:45:24 +0100
Message-Id: <20260805124525.105457-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260805124525.105457-1-andrew.cooper3@citrix.com>
References: <20260805124525.105457-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1785933931-F1EAB2AC-CB6B44DA/0/0
X-purgate-type: clean
X-purgate-size: 2470

Right now it's only checked in setup_p4_watchdog(), and not in
setup_p6_watchdog().

Perform the check in the common Intel path in
setup_apic_nmi_watchdog(), and pass misc_enable as a parameter into
setup_p4_watchdog() to aoid reading it twice.

Fixes: 0dfba864fbff ("NMI watchdog support in Xen.")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

I presume this bug went unnoticed because watchdog is off-by-default.
---
 xen/arch/x86/nmi.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index d9d07870a333..a8b0d79c7cf2 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -295,14 +295,8 @@ static void setup_p6_watchdog(unsigned counter)
     wrmsrns(MSR_P6_EVNTSEL(0), evntsel);
 }
 
-static void setup_p4_watchdog(void)
+static void setup_p4_watchdog(uint64_t misc_enable)
 {
-    uint64_t misc_enable;
-
-    rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
-    if ( !(misc_enable & MSR_IA32_MISC_ENABLE_PERF_AVAIL) )
-        return;
-
     nmi_perfctr_msr = MSR_P4_IQ_PERFCTR0;
     nmi_p4_cccr_val = P4_NMI_IQ_CCCR0;
     if ( boot_cpu_data.x86_num_siblings == 2 )
@@ -337,6 +331,8 @@ static void setup_p4_watchdog(void)
 
 void setup_apic_nmi_watchdog(void)
 {
+    uint64_t misc;
+
     if ( nmi_watchdog == NMI_NONE )
         return;
 
@@ -347,6 +343,14 @@ void setup_apic_nmi_watchdog(void)
         break;
 
     case X86_VENDOR_INTEL:
+        misc = rdmsr(MSR_IA32_MISC_ENABLE);
+
+        if ( !(misc & MSR_IA32_MISC_ENABLE_PERF_AVAIL) )
+        {
+            printk(XENLOG_WARNING "Intel Perfmon unavailable\n");
+            goto disable;
+        }
+
         switch ( boot_cpu_data.family )
         {
         case 6:
@@ -355,7 +359,7 @@ void setup_apic_nmi_watchdog(void)
                               : CORE_EVENT_CPU_CLOCKS_NOT_HALTED);
             break;
         case 15:
-            setup_p4_watchdog();
+            setup_p4_watchdog(misc);
             break;
         }
         break;
@@ -363,6 +367,7 @@ void setup_apic_nmi_watchdog(void)
 
     if ( nmi_perfctr_msr == 0 )
     {
+    disable:
         printk(XENLOG_WARNING "Failed to configure NMI watchdog\n");
         nmi_watchdog = NMI_NONE;
         return;
-- 
2.34.1


