Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316D0C5DF85
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 17:27:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396831.1634476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6XO-0006aL-Vp; Thu, 20 Aug 2026 17:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396831.1634476; Thu, 20 Aug 2026 17:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx6XO-0006aE-Ra; Thu, 20 Aug 2026 17:26:46 +0000
Received: by outflank-mailman (input) for mailman id 1396831;
 Thu, 20 Aug 2026 17:26:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wx6XN-0006a8-0q
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 17:26:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx6XM-00DOP2-E4
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 19:26:44 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a8738be-8faa-0a2a0a5109dd-0a2a450a9f1a-16
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 19:26:44 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a8738d4-f2d2-0a2a450a0019-d155dd2cec96-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 19:26:44 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-476a130c138so198986f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 10:26:44 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1450e54sm15723147f8f.11.2026.08.20.10.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 10:26:43 -0700 (PDT)
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
        d=citrix.com; s=google; t=1787246804; x=1787851604; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgLPlbFuKEHfiYq/TVIyUa+qi/9cDify939NcBfcSmk=;
        b=cS51ea0NEyiGgKKZu3uiJ+mccPhml18/9gitSgJFgVcoCqvjmr/i9OvpkLKZ4z9p2M
         vP+z2YwZcVIaFD+Qy1qDCtDG+ylq1/ZiLSUV+ysk/eVfV9aWkWBOUEheCd7XpRIlP13k
         5YcPBySymzGbtY5e86HlxjymM+F/5rQMaKGwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787246804; x=1787851604;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wgLPlbFuKEHfiYq/TVIyUa+qi/9cDify939NcBfcSmk=;
        b=gl/t9cKAILA/zu3FKfdtmwG3+Q6I1razXc0dwXRscxAzh2f0rMr5mQfqo1uhSg/UaR
         XjkBj8ruG35usm5MWcIZ3j7TokszkuZvC12gy+BPzSf1aQx4pg24UNFtuV31M6itp+zU
         k2Zy9JPnuwHQae8U7CIag75OsTZMcxYqDk3Y/NjmJ4cfKwqF+BAsQVjxHr10Hn7BSrG0
         4bjclhcAY7I2DHr7clnOkKFeUxIOJFDwtvnZ8G97Btd+KRg7bsOT8sZedFg9kQN6UQg1
         0Fd+6OlyqGXD7Y5MV/yOatBZWBL5/h3JLtiEqTTjDqeEBI+ilS/E+LBy9hlmiUBlHiwp
         c/8Q==
X-Gm-Message-State: AFuF++k/sApqxnL5T22S9rZDzhcLFz8CFdXYpBZV7Qdi1wXTgaRwsXnq
	Kf8kG4cQLZ/FtvCraATwXp4WiB0ADlM8WCXh9Qw8gPj+7Fhuop7p4AGctYW222/fMvahmSQ9pme
	Zv/6RBwM=
X-Gm-Gg: AR+sD10+ySDNsyeobjqF8mtoRHImLn+fkbHUJL6uBDrMzv5vS4imBGDtIrT8cOP9Z1s
	QxcS8e0sZr3suWNWcTy5FSMLrfxk61mJLKPNl0fryqZ5GM+qHZOIpZX1s++ypt6nYcE9oCeeDs6
	twKggoEQ+8vEXvN0Vo6cjoj+h35boIb4AjLLKV9whh/CHGOfy/zKNHBJCTB8HcQQqyqd7R5Ve4M
	D/eKPJ2VbO+Td/6cWsgWsq1tBmeODb8eEgZX6lDC3ys1ccx1HcfQsOgYo6V8XCda4T/z1Vd1GY1
	6sfMxTqkqivyY9wAb2HtSI5Fgk7pUR7fPEPSjhMPL+yOvA54iknehKE4yAHUVXU5a9fc/XuGGmM
	qF0uY3qNROLkEledzQl1RzXl2Dd93SGfwhr1amv6K3P0U182r7kbuLMYUvF6Ghxl2yaULh5kVj+
	wsreb/S3CpzzDYDo6HBsl72AjKpkhu709hMPyN+owIPpX90qtYNC0pj1X99ZGUsI4rT28FHgJRt
	CWYzUOh8jL96iu3Huw6krlBlj8bN8+GfUphQrU=
X-Received: by 2002:a05:6000:1884:b0:47f:9557:8d77 with SMTP id ffacd0b85a97d-482c0b97893mr408001f8f.10.1787246803560;
        Thu, 20 Aug 2026 10:26:43 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/amd: Expand comment about NullSelectorClearsBase
Date: Thu, 20 Aug 2026 18:26:40 +0100
Message-Id: <20260820172640.2072049-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1787246804-52ADCCFC-8F8EEF42/0/0
X-purgate-type: clean
X-purgate-size: 2497

Rework detect_zen2_null_seg_behaviour() to use the new MSR infrastructure.

Zen2 doesn't have WRMSRNS so don't bother relaxing the write.  All it will do
is insert a useless alternative.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

Naming Zen2/3 in init_hygon() isn't ideal, but the early hygons really were
not far removed from the AMD microarchitectures.
---
 xen/arch/x86/cpu/amd.c   | 17 ++++++++---------
 xen/arch/x86/cpu/hygon.c |  5 ++++-
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 70783c9a0af0..ddd73f64c2d5 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -828,15 +828,11 @@ void amd_init_spectral_chicken(void)
 
 void __init detect_zen2_null_seg_behaviour(void)
 {
-	uint64_t base;
-
-	wrmsrl(MSR_FS_BASE, 1);
-	asm volatile ( "mov %0, %%fs" :: "r" (0) );
-	rdmsrl(MSR_FS_BASE, base);
-
-	if (base == 0)
-		setup_force_cpu_cap(X86_FEATURE_NSCB);
+    wrmsr(MSR_FS_BASE, 1);
+    asm volatile ( "mov %0, %%fs" :: "r" (0) );
 
+    if ( rdmsr(MSR_FS_BASE) == 0 )
+        setup_force_cpu_cap(X86_FEATURE_NSCB);
 }
 
 static void cf_check fam17_disable_c6(void *arg)
@@ -1110,7 +1106,10 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	if (c->family == 0x17)
 		amd_init_spectral_chicken();
 
-	/* Probe for NSCB on Zen2 CPUs when not virtualised */
+	/*
+	 * Zen3 and later enumerate NullSelectorClearsBase.  Zen2 has this
+	 * behaviour but doesn't enumerate it.  Probe when not virtualised.
+	 */
 	if (!cpu_has_hypervisor && !cpu_has_nscb && c == &boot_cpu_data &&
 	    c->family == 0x17)
 		detect_zen2_null_seg_behaviour();
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index 7a9fc25d3157..ef19c2b36783 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -39,7 +39,10 @@ static void cf_check init_hygon(struct cpuinfo_x86 *c)
 
 	amd_init_ssbd(c);
 
-	/* Probe for NSCB on Zen2 CPUs when not virtualised */
+	/*
+	 * Zen3 and later enumerate NullSelectorClearsBase.  Zen2 has this
+	 * behaviour but doesn't enumerate it.  Probe when not virtualised.
+	 */
 	if (!cpu_has_hypervisor && !cpu_has_nscb && c == &boot_cpu_data &&
 	    c->family == 0x18)
 		detect_zen2_null_seg_behaviour();
-- 
2.39.5


