Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE34C43458
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 15:58:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355489.1610297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliE-0007Bm-BH; Mon, 06 Jul 2026 15:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355489.1610297; Mon, 06 Jul 2026 15:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliE-0007As-2M; Mon, 06 Jul 2026 15:58:26 +0000
Received: by outflank-mailman (input) for mailman id 1355489;
 Mon, 06 Jul 2026 15:58:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliD-00075S-07
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliC-003COz-DE
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd092-2eae-0a2a0a5409dd-0a2a4502b80a-22
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:24 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0a0-5a27-0a2a45020019-d1558029cd01-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:24 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-493c55d5c7aso31169935e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:24 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783353504; x=1783958304; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaNFNH9DRDfcOheNP7RGDgs9zgSwZrJZXL9nPPgLQm0=;
        b=kOSVRxzUlbhWSMCWuFpo0O9m7oqOtFASB7zb9f/fa/HNKSm373R3nvZ7etVgqZhsaA
         YwoVNVW4+EZ9p1GhvkngzQH4CdE8xG4w4KmAi1vnrlBLf1Jkm8GA9xx+kIQRid+CC9jj
         5q8sc3tccSy/dabsDuSMYwUKB2VevXsHJPvDXzjVO1vhpyIuzi9jGE4Lr/ziwDvHOSQ2
         MXgTAUi66kkFszTi1jhLVUjzN9iMc4SooFmbRk4IokQn864g0b6rxIk13O7lHio5u1ah
         hQYen24ZylC7OfMVdzghDmvp4JXDL04L9eDg9rohD141JaRX8KcIPJJLLlme/o72MJuL
         /nOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353504; x=1783958304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UaNFNH9DRDfcOheNP7RGDgs9zgSwZrJZXL9nPPgLQm0=;
        b=mWX17722e3dcMcvchVSW1OUxyXXe9fWyV0ZbSP96D9niIh+y/pbe2Zt4bXZeAcNpaD
         OW2WwNSC+9J+pb05GaU8Fj5Vf3obdHvz+dMr6oCmL7p2rq5II5fJvz+pKWhfMkvWoE1S
         zOyW1HV8fKlPu/7GZvCO9Iz/CHfhrMmWKMy4NMyqjZfOS23qh66OiGdP1gC/yd6RBNxk
         GAY+4LdpWcpu3hDBsNheUo6jfcPzmlsAFSamOU4elmVUr6CYCbfbMfPngOB4eG2FsHQE
         2ENO8qPpdiOnhZ1e4kwVkc7p5bSAAAonuuCdO9QdYG8Rljg5GAfS/ro5Axln05nyB3V1
         ZfDg==
X-Gm-Message-State: AOJu0YxqiefhKsNbPbyZuBAszWy2qyOHQmlm+VowDxwhErkOyZMU6zKX
	oCmwdbuqH8HFTrWGtQ7/l82fi+oLxojG8h2nw3+0DykeByhj1IuxmV3pCsmPUA==
X-Gm-Gg: AfdE7cneY3fsBfWJegmFYPKhJUse72/GeJMbfnrRr1PuaQOmmHZsYWTkNU16AjdE+Aq
	cJbY+dVqFKz7gfObo3jSSi4zPn65wAw9MnFBL9jBtc7RjhJp4F9XIRPJJxMjfDJtVv4ubyGovc3
	YIh4J/xG6TjaDeDnSWth34TrsHi1I/on08ChWxB5Wf4YABbq0X1Ms67VjV6KByyvXaauNBF0cKv
	vWnh09ZpleMK+LLtnqIFm2Oh4KJffgGgqorlC0naxSCpOJtc9KNN/i3UO6+KfcEbIVtZHpMFSLQ
	9UMFtJQL+W45of99g/Iy3ot/YF3Hp0mP4tOnxZjImzMfwesWYRbAqF3xklG6klt9CIL0tsfL+cU
	PkOf4Sx4MVsfCVHZXh1UJweLkzC4f7ITh+iqDyihyqGjOpIpT4wvNo+yfzVtbEf5Of3V1hUIjfG
	QAvILQUAusueKpkzGeUFJHh+RfVJ0TUSt32F4WJf7FqWHddZSxYLAkezm7Fg==
X-Received: by 2002:a05:600c:5309:b0:490:d38c:7836 with SMTP id 5b1f17b1804b1-493df082feemr14569175e9.3.1783353503768;
        Mon, 06 Jul 2026 08:58:23 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 04/26] xen/Kconfig: introduce HAS_STATIC_MEMORY
Date: Mon,  6 Jul 2026 17:57:45 +0200
Message-ID: <39f6e7414696acad4a1257afaf067a832b165cc4.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1783353504-4D90E7C5-5340CAF2/10/73395122804
X-purgate-type: spam
X-purgate-size: 1962

Introduce HAS_STATIC_MEMORY so that STATIC_MEMORY can be enabled or
disabled on a per-architecture basis. ARM selects the new flag; RISC-V
does not, so CONFIG_STATIC_MEMORY is unavailable on RISC-V and
randconfig builds no longer require an explicit STATIC_MEMORY=n override
to avoid a compilation error.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v5:
 - Add R-by: Jan and Michal.
---
Changes in v4:
 - Reword the commit message to explain that HAS_STATIC_MEMORY allows
   STATIC_MEMORY to be {en,dis}abled per-arch, dropping the reference to
   guest_physmap_add_pages().
 - Split the STATIC_MEMORY dependency into two separate "depends on"
   lines.
---
Changes in v3:
 - New patch.
---
---
 xen/arch/arm/Kconfig | 1 +
 xen/common/Kconfig   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 683ab7d25a1e..d748404e82da 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -22,6 +22,7 @@ config ARM
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_SHARED_INFO
 	select HAS_STACK_PROTECTOR
+	select HAS_STATIC_MEMORY
 	select HAS_UBSAN
 
 config ARCH_DEFCONFIG
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 8b48d84c79e8..5b289e444fa5 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -161,6 +161,9 @@ config HAS_SCHED_GRANULARITY
 config HAS_SHARED_INFO
 	bool
 
+config HAS_STATIC_MEMORY
+	bool
+
 config HAS_SOFT_RESET
 	bool
 
@@ -196,6 +199,7 @@ config NUMA
 
 config STATIC_MEMORY
 	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
+	depends on HAS_STATIC_MEMORY
 	depends on DOM0LESS_BOOT && HAS_DEVICE_TREE_DISCOVERY
 	help
 	  Static Allocation refers to system or sub-system(domains) for
-- 
2.54.0


