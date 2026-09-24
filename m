Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BB0C98317
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 12:24:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432187.1653691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9iUm-0000uA-86; Thu, 24 Sep 2026 12:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432187.1653691; Thu, 24 Sep 2026 12:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9iUm-0000u3-5V; Thu, 24 Sep 2026 12:24:12 +0000
Received: by outflank-mailman (input) for mailman id 1432187;
 Thu, 24 Sep 2026 12:24:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewprecious388@gmail.com>) id 1x9iUl-0000tx-1T
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 12:24:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9iUk-00CQqP-ED
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 14:24:10 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6ab51666-8faa-0a2a0a5109dd-0a2a4502ed92-14
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 14:24:10 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewprecious388@gmail.com>)
 id 6ab5166a-6ca4-0a2a45020019-4a7de18ca80a-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 14:24:10 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d8239so14945175e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 05:24:10 -0700 (PDT)
Received: from andrew-B650M-DS3H.. ([102.213.49.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-488684864c8sm14470407f8f.13.2026.09.24.05.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 05:24:09 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790252650; x=1790857450; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AdoDR5Hj3NTMNdxF4g8rScZTo2XPuPXeKc9btLdTOZc=;
        b=DeAriSlRexWrCgp7GJC6YyeokPeqNrfZVZXat22sYkfqWIPwUnYG8XIEExdFcn+NHr
         oUhdmXMe857IC4tZGJzXdYOJCemcbpWFFJeFQRevfsy34u/5XJe0JyoM95Ffhniljt+j
         htLMe0ik+kMIRXQBvky6IAO6ZQzy7973zxgL8snCX4tlB86z9na/DLKi2LPNVw3R3BIK
         uKPBbKEvCByWcjo8Dhrv5TZ/mwoE8JI7JF1XMqU2cixCWA1ZzEoJ/LUdPGnhNurT3AzX
         dcgY3f+2ZiHx+yEVnRgLrS429nTEYzL36tmU24vXyDzYdxHyNPU0PQHeOBPfwTKhW6fJ
         7mgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790252650; x=1790857450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AdoDR5Hj3NTMNdxF4g8rScZTo2XPuPXeKc9btLdTOZc=;
        b=rGnhati4pXhXyRgadRW1fr1AbXg6h9y19Qp1dyaUgtsobyqBA3laUTyEHArjt+lAud
         sA6voZdZgfQfbBObpo0/ICoKXJPx1GTKYkPTmcoAOixKGf/A+RRAwSZ+W9WmlKvZ9Fo7
         Y1VFcOm35XgXNM0lE300GgUO7jdfaa7nKavQREEWcYMgjRy0rab5xpNKlhd7m/G7Rg3D
         PeEzaJjuYrnl0Yz44VAT9djKlMqV+oVJZ9GeupU6QeDEB4W/AK8jIhifkUGCCBWITnQd
         YKuSa6fboWnvOzQbyHRYXDe8QBRHUt1ou1/WZxKbOh/wOzHn+U83QSCgapLiNtbSrbrK
         DMsw==
X-Gm-Message-State: AFuF++npw6PN7hsxVYRNtooBMnzK84sPIiccfBq3OGtZmx8vwszynVJj
	Ij/V5IcD3/tG1qpa2asMsy8/+1TER8wdCY1xk4X2ZEuxqkcE6SWB2vhuQmOP5Yai32A=
X-Gm-Gg: AYBFou30kfTSPGmF+y0V0v/Ov6NXeWlIimcF8y/7G3EB8uNZHQV2pNivKZml5Z03vzv
	+v3R6GWGGYOCQg9VLXSZAl12B6TvOZdcsoZJDgbLwxgbAwuWpVR6o77toEkRf0lzEfGRDwZ6UOA
	f4fW/CrnwG8T59nbCQ924eoBFvkr64dtN39vr4brpzs6PovFdaAImxJzHVMLwHam99ISWzUHyzi
	59Y+ThPmL4Is6P6kNdcJ7yua+7SSMLp59QcBbiw2Jmv28EgXojgFuyDlBgXcfijNZ/+E/WsoJE4
	Q4PrY8AE2i5jkvrFrsHvCoM9mdbWKHiRAo67GlWIhsqJlfs9/dCtlDHNAHX55tKgi/gYHe3Fwc7
	PvfYd/sHuUFd/iXkJWE+KSuEAdS+2zz/qVBomjU6l1qnTBWLCybExni2Wj3eyrAGELvUCI5eMA1
	+FLrl3e2TAFGE9Levkd7y98wsmXlq1rii/3uv5i1hEloab76Hx3hNdpxaiG22XMTKaP6sj8NzRc
	16/xNzHnEWG1DtbsQ==
X-Received: by 2002:a05:600c:6287:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fe7babaadmr31595605e9.20.1790252649792;
        Thu, 24 Sep 2026 05:24:09 -0700 (PDT)
From: Andrew Mbugua <andrewprecious388@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger@xenproject.org,
	sstabellini@kernel.org,
	Andrew Mbugua <andrewprecious388@gmail.com>
Subject: [PATCH] xen/common: fix MISRA R7.2 violations in crc32/unlzma/bunzip2
Date: Thu, 24 Sep 2026 15:24:03 +0300
Message-ID: <20260924122403.214738-1-andrewprecious388@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1790252650-31FD62AC-2CC344FA/0/0
X-purgate-type: clean
X-purgate-size: 1582

Adding the U suffix. No functional change.

MISRA C Rule 7.2 demands a "u" or "U" suffix on all
integer constants with unsigned type. On 32-bit int targets
constants >= 0x80000000 (e.g. 0xEDB88320, 0xFFFFFFFF,
0x80000000, 0x04C11DB7) must be written explicitly unsigned.


Signed-off-by: Andrew Mbugua <andrewprecious388@gmail.com>
---
diff --git a/xen/common/bunzip2.c b/xen/common/bunzip2.c
index 79f17162b1..6345a064cd 100644
--- a/xen/common/bunzip2.c
+++ b/xen/common/bunzip2.c
@@ -650,7 +650,7 @@ static int __init start_bunzip(struct bunzip_data **bdp, void *inbuf, int len,
 	for (i = 0; i < 256; i++) {
 		c = i << 24;
 		for (j = 8; j; j--)
-			c = c&0x80000000 ? (c << 1)^0x04c11db7 : (c << 1);
+			c = c&0x80000000U ? (c << 1)^0x04c11db7U : (c << 1);
 		bd->crc32Table[i] = c;
 	}
 
diff --git a/xen/common/unlzma.c b/xen/common/unlzma.c
index 56359420aa..bd42984f15 100644
--- a/xen/common/unlzma.c
+++ b/xen/common/unlzma.c
@@ -106,7 +106,7 @@ static inline void __init rc_init(struct rc *rc,
 	rc->ptr = rc->buffer;
 
 	rc->code = 0;
-	rc->range = 0xFFFFFFFF;
+	rc->range = 0xFFFFFFFFU;
 }
 
 static inline void __init rc_init_code(struct rc *rc)
diff --git a/xen/common/xz/crc32.c b/xen/common/xz/crc32.c
index 092a74fbab..0368d8793f 100644
--- a/xen/common/xz/crc32.c
+++ b/xen/common/xz/crc32.c
@@ -19,7 +19,7 @@ XZ_EXTERN uint32_t __initdata xz_crc32_table[256];
 
 XZ_EXTERN void __init xz_crc32_init(void)
 {
-	const uint32_t poly = 0xEDB88320;
+	const uint32_t poly = 0xEDB88320U;
 
 	uint32_t i;
 	uint32_t j;

