Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA58C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 20:34:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393290.1632104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww420-00056I-Uj; Mon, 17 Aug 2026 20:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393290.1632104; Mon, 17 Aug 2026 20:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ww420-00056B-S7; Mon, 17 Aug 2026 20:34:04 +0000
Received: by outflank-mailman (input) for mailman id 1393290;
 Mon, 17 Aug 2026 20:34:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1ww41z-000565-Is
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 20:34:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ww41y-009Yc6-SM
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 22:34:02 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a836ff4-e002-0a2a0a5209dd-0a2a450685c4-46
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 22:34:02 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a83703a-195a-0a2a45060019-d1558034ed93-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 22:34:02 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so31927075e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 13:34:02 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a7c55bsm6213951f8f.20.2026.08.17.13.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 13:34:01 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1786998842; x=1787603642; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NdcOM830pkGFrMyGyV5CVvecsj2tsUbGgnES/OJNsnQ=;
        b=XKF5fR+IUHRdfxY0yai0uUU8TXbksQgiF5N0Kk5UpCkFZMz6Sw+Fj9VnvM4BAG9EWV
         iT1qsCRrI6smcrb1LSwf2y7qy/zlwT65m42ctkFet7zaox96YhzW15Ejq2SRRYH2qMQ1
         +PKtXJkaDd+32Nie+znzh4ahUfmvI/QZtJNsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786998842; x=1787603642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdcOM830pkGFrMyGyV5CVvecsj2tsUbGgnES/OJNsnQ=;
        b=Q4YTkJw2+QX37qfbNLIHOFHRKk+AhP9PrQtER6oky7M2CV6NpQaSUcbtdHjTLdCJ8s
         GKSqF9j7Ooj+gFVPMxMV6GMBenFK7RYSXVra0Yfxb00MBIg0RULtOwdtgBvRkQGnoRoY
         gumMITBS5R0QOSaD043dHKh2M0njJpUiQpzJH3Ltf7PorpUab5dwspD9YkJegAsiIJks
         piL2JuGWJp2Zq0obEdXSt9dtRr673e0rvSH6CC1jF0xawbeZQXcUXuMIRMlbKGBTyAYN
         nf+IKmChhzmYYVi8yfJevH2SGgSrg0hj6hE6Jpm8ZjxQI2tNDFQzlnfZxd1Sh9c1wKGY
         Ipsg==
X-Gm-Message-State: AOJu0YxvT8j+GMe1XQifwkzI4rr1HASKIgUW+VJ6M58eJWBKMUgPjCnm
	AlLbHVNOj8m8QnZ7jcse5PmvZDcLSocRsFwcdzZKYRlEnTCEKtLSXztMz1Wq9g89f0M+A1ai4N9
	ru7k01qU=
X-Gm-Gg: AR+sD13DHzxJnWW0YaGvxAxAE5DZzx8bKKCP0/dDPmx0SRD0t0SHIqzhOnbTp8uE0kH
	rQRdubxBizxtBf2hmhPGkrYM0GoHMDRenREU87rCYYVlQrjKKCfvDvGfZz5fq9Jm4FE7UGDq9sP
	tN/WOZraCUAOjvR1aWplHJXdgPQPox7eG0KOpiHl/q/pRzLFK/AHr0jksvW19Jh+ap/GUJA3GRK
	WrWmzzntJZg5+Z8D5F2YJyQ5basEdVTHBpOM4xaACf2WX1GKiAqaR2spMdKJnAh8Wi0IQYKOQ0X
	kIMoT9QfD+aB77zV6jOET2aS6ykydm/vyEY9HMSreaCPROS4zZIQm/FdZ4HQw8JeLGui2clr9Vf
	GSsJKuClyPdmnDRRW0IWISl6V9W8HhFjc+LY+0LYiLh4sVgfJ3tVdV7b9VEg6SRR2Av2dOxqtNP
	cjGm6fHS9WvV0LsuO2FiwWTCoyKZjf58e3+BoS0hQvgKod4mj+5iHXcMmIQ3/BYDO9Lmivl6Emo
	rBDK+sevohIKgDMCMJnAKeDjZ0mO4hH5Vs/GKA=
X-Received: by 2002:a05:600c:8714:b0:499:8704:242c with SMTP id 5b1f17b1804b1-499878ca13bmr498099745e9.0.1786998841777;
        Mon, 17 Aug 2026 13:34:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] ARM/vgic: Clean up vgic_v2_setup_hw()
Date: Mon, 17 Aug 2026 21:33:59 +0100
Message-Id: <20260817203359.1881963-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1786998842-FC20077B-D0A61DE3/0/0
X-purgate-type: clean
X-purgate-size: 1726

vgic_v2_setup_hw()'s callers are __init, so it should be too.  vgic_v2_hw is
written once during init and unmodified thereafter, so make it
__ro_after_init.  Reposition 'bool enabled' to fit in the tail padding,
removing 8 bytes from the structure.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

Found when looking at the code while reviewing something else.  Only compile
tested.
---
 xen/arch/arm/vgic-v2.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
index 642407fd5b05..3446d521de2d 100644
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -25,7 +25,6 @@
 #include <asm/vreg.h>
 
 static struct {
-    bool enabled;
     /* Distributor interface address */
     paddr_t dbase;
     /* CPU interface address & size */
@@ -36,10 +35,12 @@ static struct {
 
     /* Offset to add to get an 8kB contiguous region if GIC is aliased */
     uint32_t aliased_offset;
-} vgic_v2_hw;
+    bool enabled;
+} vgic_v2_hw __ro_after_init;
 
-void vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,
-                      paddr_t vbase, uint32_t aliased_offset)
+void __init vgic_v2_setup_hw(
+    paddr_t dbase, paddr_t cbase, paddr_t csize, paddr_t vbase,
+    uint32_t aliased_offset)
 {
     vgic_v2_hw.enabled = true;
     vgic_v2_hw.dbase = dbase;

base-commit: ebc00c30c65023bd1498ae20dc511c4e39f6c0f7
-- 
2.39.5


