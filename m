Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555FAE99051
	for <xen-devel@archiver.kernel.org>; Fri, 10 Apr 2026 07:50:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1278423.1563265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB6cr-0006iG-7m; Fri, 10 Apr 2026 07:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278423.1563265; Fri, 10 Apr 2026 07:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB6cr-0006i9-5I; Fri, 10 Apr 2026 07:50:01 +0000
Received: by outflank-mailman (input) for mailman id 1278423;
 Fri, 10 Apr 2026 07:49:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wB6cp-0006i1-Nf
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 07:49:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB6co-00EiYD-Ig
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 09:49:58 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d8ab9e-2eae-0a2a0a5409dd-0a2a450b909e-38
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 09:49:58 +0200
Received: from [209.85.208.42] (helo=mail-ed1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69d8aba6-bca8-0a2a450b0019-d155d02ac8a0-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 09:49:58 +0200
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-66bf6aa4858so3072959a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 00:49:58 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.25.238])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-67070815a42sm368027a12.20.2026.04.10.00.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 00:49:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775807397; x=1776412197; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n+EXbWGUDwbEcBGBEf2DzWW8z16Qu56Rn+KZMcPNwyI=;
        b=L2S/5qN+luWgJ5ftZP6IJLLa6JMib7VpP8cIUhlJA0nEGDtqEVc6BrAvE2Ti6VcHno
         Qeyuv4CXzy5xJeQ6i2YSjYDj+e8wcin/OkceeH/NThHOXRPbrBiGW09BCutvXrN3Z6Af
         V6l8VPuku3xj3ESIKZXRFNl/LRxihWthqyZ827sme++zwmGs0YHIzK7m9E5BeK7vr9ev
         yjO4krgc6nNMuG95CucDhOGtnv0EsgYkLB19jM9yt38ZZi4dZ0H9L/qH6pCZsQ4PLLzC
         YNqeu5O8k2wQbmZWa5Ba4554uM8Tniv2/M3vWboxh3fZJQmT/7u95dDDS61h5pBDsw+t
         9jUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775807397; x=1776412197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+EXbWGUDwbEcBGBEf2DzWW8z16Qu56Rn+KZMcPNwyI=;
        b=BanY7LcTFpvB4hprsFsoyaKtTRWAJ6WsN0aE+ZPWd37Tjzk5ZmHcxf5MCk3bvxkpH7
         YbqKXrOV9/8sfQpcgxKioAZd0j1QMmTXMhThmd+iM7EKqbI3Zv5EtJ1+fyblAll+oCmn
         69S6EZ0cTPPegyOYX5tmP9isod4Z3RVMgO9clfsRtjxTgSQzLagV/k2ZiXsQtJorujJw
         52Nf9RJiVr7mVY3qMi3Bceto0dYBjhH247LeaXHpILJND3T76Gqu3lXDy0kRuSvn1tn6
         iGOuUuk/FaTOXy4+35JaEcx7Mrmkd6igcUP4BR11xxOVIzbkrEyspj3kr8ORKil44Hl+
         DY9A==
X-Gm-Message-State: AOJu0YyD79osz1REe7HR8VxXVwF8Yj/w2EmvcJ6y5sDgC5NmouzBAwNk
	cDdSUJ/9sa8vdqGEpl9Y6OY2ACgP7BZepKXjZpbGPWm4zpGuWYsWzEV2Qq3dn02t
X-Gm-Gg: AeBDietXhRCUWxuaYhSe2oVDT72Sfpny8+c+PT3U+/qfCVwk1JLtPyp0SYnbToClgtw
	9zkjzM6+6CcmRBE0pvKX0vdawQF4sss/Bg8+YfC2u4sXuTWOAd8uSUbKsM5t7D2uTK2wkR+9ZYb
	L3GA0wSVJE6TciYZmpuyhpocdX+Yf3zmpcmE9GBVoY5sWoR3tz56RwdtHgsGC7EAI0E1K6d9qnr
	E57yfnBuk7mPvodSijSqCxKJFi6x/DZN+/TLE9kmWRMAU6YXm2oTmzGvHv1VsY8jjmxnP+UolNm
	zNuoflufLa+G19kc6bcMfbWC5TXWhGTBWULm+b8K9PcLo8oSWcyTJ1OYpNMCfxe59Yj9PGq6kBV
	aPVIdSrwhrSKq+XuIS4PQkAV0u1kJokCAJ9orAI/BJvJrueWqxzs2eBfbjzVJDXD2iRZF8dPPKq
	2nJb2aTZLq7lzF3HHpmxaqg5EJZUA=
X-Received: by 2002:a05:6402:24d0:b0:66e:8ca6:e79f with SMTP id 4fb4d7f45d1cf-6707a854df2mr723439a12.13.1775807397222;
        Fri, 10 Apr 2026 00:49:57 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: gic-v3: disable Group 1 before CPU power-down
Date: Fri, 10 Apr 2026 10:47:45 +0300
Message-ID: <1952e52fd60fdd762862e74dbd522fcd7c65284a.1775804338.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1775807398-F63C62A1-978ACB81/0/0
X-purgate-type: clean
X-purgate-size: 1278

From: Mykola Kvach <mykola_kvach@epam.com>

gicv3_cpu_disable() currently writes 0 to ICC_CTLR_EL1. Unlike
GICC_CTLR in the GICv2 path, ICC_CTLR_EL1 does not enable or disable
physical Group 1 interrupt signalling, so this write only clears
EOImode.

The GICv3 power management rules require the physical group enables in
the CPU interface to be cleared before the redistributor is driven into
ProcessorSleep, otherwise behaviour is UNPREDICTABLE. Xen only enables
Group 1 interrupts on this path, so disable the interface by clearing
ICC_IGRPEN1_EL1 instead.

This appears to be a copy of the GICv2 pattern where the enable control
lives in CTLR, but for GICv3 the enable moved to ICC_IGRPEN1_EL1.

Fixes: bc183a0235e ("xen/arm: Add support for GIC v3")
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/gic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index bc07f97c16..4f0852be2f 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1028,7 +1028,7 @@ static int gicv3_cpu_init(void)
 
 static void gicv3_cpu_disable(void)
 {
-    WRITE_SYSREG(0, ICC_CTLR_EL1);
+    WRITE_SYSREG(0, ICC_IGRPEN1_EL1);
     isb();
 }
 
-- 
2.43.0


