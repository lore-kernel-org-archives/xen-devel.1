Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDB9C5CFCF
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 17:43:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390372.1630811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuZSg-000616-7H; Thu, 13 Aug 2026 17:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390372.1630811; Thu, 13 Aug 2026 17:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuZSg-00060z-4E; Thu, 13 Aug 2026 17:43:26 +0000
Received: by outflank-mailman (input) for mailman id 1390372;
 Thu, 13 Aug 2026 17:43:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wuZSe-00060t-VI
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 17:43:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuZSd-0076Yx-P2
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 19:43:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7e0213-2eae-0a2a0a5409dd-0a2a4505a17e-44
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 19:43:23 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7e023b-4cb1-0a2a45050019-d155802aacdb-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 19:43:23 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-495590dde14so2725585e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 10:43:23 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49987779a11sm3878065e9.2.2026.08.13.10.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 10:43:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1786643003; x=1787247803; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YMFuJMms+V3nzbvUzla9kD+AeHM+vlytqXfkk0/IRs=;
        b=Zdfm+8MQF0VEja0J3JPBRLP8vf1Qj30g76YIFjvgGsFpxI5moMUB+g3gfBpscY7hmN
         CBppsr+F77WAo9Z3uCHVjpBbtweomRBFPBwYt6s6CGPi4Dyw3P/sLjsXfdbkGDF+cKVY
         haWlMpSVyUZJRpHwKJVw3j+HlCyRU8flHbZKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786643003; x=1787247803;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7YMFuJMms+V3nzbvUzla9kD+AeHM+vlytqXfkk0/IRs=;
        b=k4Bpycur29aBBnrpns/kcAU+csF+YQ95LUPP5wDKhpK4Z+oZdz0i62GLeHKGQjYp3B
         xoSch1lx5EhmWMdKyRdPGLXJgfL17pRId1vHNApgGvmXCi6CPTi1XwVyEFiGNxuVi8mb
         /Mc1kE4FnHN3+8WTvuTItjMJWv5xAIrhjVrm+nWES/njDwC7PvWhhokTniElHu41v7p6
         oGpxfTEjfVg9S3WIQlgaxn080bZcHqPovsCejfXkvMYrT0zoFxt2cTn7nBXHh0u6ExIL
         5eNaEyKPFqHUmeGB3bcODZRY0/Ro6MhUr0Y9kt4ylGZykHFfSMdXAofSlH2oguw8jEAn
         FJLw==
X-Gm-Message-State: AOJu0YyD39PthZlPNWyXq3v/uwLw5tBqH+1yWYagAxqd3coOsY5X4DPR
	oqpvDc72QHh8Q7YkMovQc5y+/bBSLFwPVrtrZ9xjjfH1IK1FjPYjEnpyPBhjeUH59yFT5VasLZu
	/bAIE/94=
X-Gm-Gg: AR+sD1128hn85A26n/QkOMAkbBsEvO4wJMtJn/w2ZMkffDFkaF/MAKloMXraMVAT5bC
	sMlsztVGXWmSiBYzwy88pCbBySOLUAdDueQWrWrV9RBfzi03VlG+61lV6ciSbbwJ7tz67Yw7fYv
	FvqyjZzluIBEZvYSEz6sCCROpoLb2ZEi4mEZwQlfivwZZOYjT9rYjAnAztRAlTwEhnMnbmu3BPP
	JuMvBde8JiYFr4hGAd4GAGC+hoev1/siit6hPQA0QvBOYLzFrXDCvVfpgKJ39z+vxHzSNltNfXD
	CCTtoLrlhCHsMbNPsyiM3WAPe5IZi4yl9qR2pMLZnjRw1dAYue8nKJRHIz5JvNRtgSv1C+buqB0
	gNPIeufu+lb6Na7KxPnjO/sUB1mgsw4XsgQrpDrHTa6ULxRnNPKHjmKlD4NG+73WkdUaMrEj+p7
	6z5d0ECS3qrDrtypMpVcR0fuzh6isLYH6WDPKPnE429h4MGWoIIeO2BLQyo+kP18dhEy5isXWdX
	deWIcERsAMMVWfqtIyy6wINkdkrKyZSdXSTWmU=
X-Received: by 2002:a05:600c:1d89:b0:499:726a:117c with SMTP id 5b1f17b1804b1-499879bf7d0mr780895e9.19.1786643002850;
        Thu, 13 Aug 2026 10:43:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/nmi: Fix mis-classification of watchdog NMIs
Date: Thu, 13 Aug 2026 18:43:19 +0100
Message-Id: <20260813174319.1682009-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1786643003-F70B22A1-D099A82B/0/0
X-purgate-type: clean
X-purgate-size: 3211

It used to be the case that cpu_data[] inherited the BSP's cpuid_level until
the AP had calculated it itself.  Following the rework, cpuid_level has a
placeholder 1 until it is caluclated propely.

setup_apic_nmi_watchdog() happens to be called on the BSP after SMP bringup,
meaning that the first call is on CPU1.  It is also positioned in the window
where cpu_data[] is garbage.

As a result, setup_p6_watchdog()'s one-time calculation of the performance
counter width falls back into Pentium compatibility mode assuming 32bit
counters.  This causes a watchdog NMI which is delayed a little (e.g. from an
SMI), to appear as if it hadn't overflowed, and therefore be (mis)classifed as
not a watchdog NMI.  On systems where unknown NMIs are treated as fatal, this
results in a spurious crash.

Switch setup_p6_watchdog() to use boot_cpu_data.cpuid_level, which is how this
is checked almost everywhere else.

core2_vpmu_init() used the same pattern to look at leaf 0xa.  Despite being
init code and only running on the BSP, {boot,current}_cpu_data are different
objects, so switch it over to checking boot_cpu_data.cpuid_level too.

Fixes: 7126b7f806d5 ("x86/CPU: re-work populating of cpu_data[]")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

Found on a system where:

   [root@box ~]# time xen-ucode ./blob

   real    0m9.166s
   user    0m0.001s
   sys     0m9.165s

is changing several expectations, and spurious crashes from mis-classified
watchdog NMIs is just one part of the problem.

I hate this fix, but it's the only thing which I consider remotely safe to
backport.  Recent attempts to alter CPUID ordering have 0 success at being
bug-free.

I have not investigated what else was broken by the cpu_data[] change, owing
to a lack of time on my part.  I would be amazed if this is the only thing.
---
 xen/arch/x86/cpu/vpmu_intel.c | 2 +-
 xen/arch/x86/nmi.c            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index ed9f62b9366d..af6cb0a85cdd 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -896,7 +896,7 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
     unsigned int version = 0;
     unsigned int i;
 
-    if ( current_cpu_data.cpuid_level >= 0xa )
+    if ( bsp_cpu_data.cpuid_level >= 0xa )
         version = MASK_EXTR(cpuid_eax(0xa), PMU_VERSION_MASK);
 
     switch ( version )
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 91f95fe6d080..ec85516609b0 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -321,7 +321,7 @@ static void setup_p6_watchdog(unsigned counter)
 {
     unsigned int evntsel;
 
-    if ( !nmi_p6_event_width && current_cpu_data.cpuid_level >= 0xa )
+    if ( !nmi_p6_event_width && boot_cpu_data.cpuid_level >= 0xa )
         nmi_p6_event_width = MASK_EXTR(cpuid_eax(0xa), P6_EVENT_WIDTH_MASK);
     if ( !nmi_p6_event_width )
         nmi_p6_event_width = P6_EVENT_WIDTH_MIN;
-- 
2.39.5


