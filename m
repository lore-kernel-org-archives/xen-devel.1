Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78A0C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 14:54:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390132.1630665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuWoe-0005zL-GW; Thu, 13 Aug 2026 14:53:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390132.1630665; Thu, 13 Aug 2026 14:53:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuWoe-0005zE-DB; Thu, 13 Aug 2026 14:53:56 +0000
Received: by outflank-mailman (input) for mailman id 1390132;
 Thu, 13 Aug 2026 14:53:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wuWod-0005z8-EX
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 14:53:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuWoa-0007rv-LJ
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 16:53:52 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7dda7f-e002-0a2a0a5209dd-0a2a450cbb48-8
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 16:53:52 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a7dda80-f479-0a2a450c0019-d155802dd801-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 16:53:52 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-496b7622a83so5826545e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 07:53:52 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a569325sm7522217f8f.14.2026.08.13.07.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 07:53:51 -0700 (PDT)
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
        d=citrix.com; s=google; t=1786632832; x=1787237632; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qP1IXauP7ML7c9SNkCfOyG0xRsXsVlbjOA1DSnkJNLo=;
        b=WWJ6F3+lFLH4jMVvKn4KYKM0nhbvFKgQ6+DDay66JIi/OPJqJMMupuk5hOIxEMZsPI
         /8RFdWEVZlcIu2i2yY8+2GSNYJ5ASuHdy74eN8b6tC+2wRqD/g0KEKuO23Legd0hANaj
         +QZoqG3aEOWDUG4gpeOjXxYz2E8gAEX4BoKNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786632832; x=1787237632;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qP1IXauP7ML7c9SNkCfOyG0xRsXsVlbjOA1DSnkJNLo=;
        b=QRA/61yYvmqkg6QJPpmECd00cnDuoTtHrZXuwQPuITs9FzMSxFijnYkj16GdBGNx9+
         Ee0/vr/vZ+t5DHf18RMm2MIi+cKYp5S9Bkp0GwkSE2Vu/WyAYgSY7gFchBk6mlXwnQ4G
         Z/ab9QtF+trBzpKnbKu182QtUOYLssYGOe8JFm/JVjkvTP9E6StvnpmzVjNB4n75e50l
         umOE7xCcUvnMHwYD4TSlSIQzZ2rX0Pfu2KButq+DRTwxx8SAVIjNV1S+j9cwUzE8WVcM
         XpLM+5OOI1O3uXr27YceOKgbOA8CWlCfi6NjO14OAOWeEddxN3hShkulG1vbGqME8Lg5
         B8Sw==
X-Gm-Message-State: AOJu0YzW3Gpj5RfTFQtkpGzT2G6jGAenE7rXjrHZUUdTgJzdC2wAA9iE
	vt1a70nW4s5DX3IBGX8uz4O4qn74KaSO6mf5WCYRKsMEw6rAP42Xxj0OHA8Q0/aCHlS9MiNziH7
	9p+8d
X-Gm-Gg: AR+sD12MC8SteyNrNz6H9B9ZUUmLHRh8G1t3ZhSbVG2HDsxAaRY4mFKFXBk1rZ65ou9
	61yofQot4A0P6Vl28qNkHI0BXj1nXYvtYwoSUkVV1aWHDVdQESjZ1qEgoVmKdSMpr7bETtSFupr
	kk5lPBTL8inb5k70sOLCCyv6apy/YSl36LorvVM80QquA3rXy5znFsdQXVuDl7by2WPIoew8gWr
	fymZkpsyXFdLwBxhRPqAm6vnGBXsfcI0b2YmtrIk+MR5AhxTXIvrwXjVB9mCP5y4yoFct+K0A88
	R9D5W5Ts/sXeo69pOyPzWs4QRwOww9RoekPzI4Hv0lhve/+gyZqNmt24xOcqgrdBYmSHvQ8YZE7
	vdTRNhp8FABuIlMYx7JBslVrxqRzSpSsF+AvWChj63NSz1tklMhxU+dVKv/D9w1x6nuyL20nyA9
	d5UZDlrZlzeyETKzoBnOG/TLbFPQ3uXDy8yeOdEr6nz/FEslaJ75syMMG8Pnzvl+DBchvkf+aph
	PU+Ffd84tLGfFwp9Q+YoSWazEVUcoONRNwCSIg=
X-Received: by 2002:a05:600c:3e15:b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-499821e8021mr78723355e9.9.1786632831501;
        Thu, 13 Aug 2026 07:53:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/cpu: Rewrite initialize_cpu_data() for clarity
Date: Thu, 13 Aug 2026 15:53:49 +0100
Message-Id: <20260813145349.1656699-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1786632832-012C8A5B-FB4CCADB/0/0
X-purgate-type: clean
X-purgate-size: 1501

Without passing opinion on the behaviour of this function, it is deceptive to
read (I've twice now mistaken it for resetting boot_cpu_data), and
inefficient.

Instead of having a 256 byte object on the stack and a double copy, copy
boot_cpu_data directly, then reset parts of cpu_data[cpu] in place.  Leave
some comments behind explaining what's happening.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

Pulled out of separate series.
---
 xen/arch/x86/smpboot.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 84e9e4beed60..cede2b886f33 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -94,12 +94,14 @@ void *stack_base[NR_CPUS];
 
 void initialize_cpu_data(unsigned int cpu)
 {
-    struct cpuinfo_x86 c = boot_cpu_data;
+    struct cpuinfo_x86 *c = &cpu_data[cpu];
 
-    /* Must not partially clear the BSP's collected data. */
+    /* First, inherit from boot_cpu_data */
+    *c = boot_cpu_data;
+
+    /* Second, reset most of it, except if we're the BSP at early boot. */
     if ( cpu || system_state > SYS_STATE_smp_boot )
-        reset_cpuinfo(&c, true);
-    cpu_data[cpu] = c;
+        reset_cpuinfo(c, true);
 }
 
 static bool smp_store_cpu_info(unsigned int id)
-- 
2.39.5


