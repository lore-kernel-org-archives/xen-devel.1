Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F073CF459F5
	for <xen-devel@archiver.kernel.org>; Fri, 10 Apr 2026 15:55:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1279427.1563911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECY-0000Ps-Tb; Fri, 10 Apr 2026 15:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279427.1563911; Fri, 10 Apr 2026 15:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBECY-0000Pc-M9; Fri, 10 Apr 2026 15:55:22 +0000
Received: by outflank-mailman (input) for mailman id 1279427;
 Fri, 10 Apr 2026 15:55:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wBECX-0008WP-Ia
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:55:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBECW-00Cgsb-UD
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:55:20 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d56-e002-0a2a0a5209dd-0a2a4507d84e-46
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:20 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69d91d68-ba2d-0a2a45070019-d155802fb157-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:55:20 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4888375f735so21725865e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 08:55:20 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5b3c597sm78285605e9.12.2026.04.10.08.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 08:55:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775836520; x=1776441320; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2w7cswF8WNoXf2rJsjt6cpxdm36ufdLhJBaAPtDOQc=;
        b=jaHo8NAkm7wMWRH5gBep5jkdIplGx0IrKAEQTIiwzsiu2VTyHAbSz6LKYYC+6MzwSD
         kI/kYuyhV9qUtpF6w1RfkAWLXNU0FZq5JXADK/j9FcBxfJk0eQ/whibVNPjjpXMd9C5A
         UEP2KqWAOyuidiT6xWfkbZIGbTyOv35FTXpdpNqOpioTPB2+j6ZxAZuyzWKtfLpDdbyF
         K6uAKP0ZvGs2HONoLkuMlfnHPTqzxjgdNGEoaTnItiYPT1GKT6UvyUBqgUba0MWBHxyN
         ZoMU218BpP/xj6h/u/IlpvoEEmhOKTXRtcHCQzNy8Ul+o9sm3sPKXk+QLom+or9Ufl2A
         96oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836520; x=1776441320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p2w7cswF8WNoXf2rJsjt6cpxdm36ufdLhJBaAPtDOQc=;
        b=eTuGk47jVzVPnrNdSp3q5qJw2zs4UbUbV/vM5TMXnvBA38v8CNrkTSxMJMNN2XGlRX
         17oHsWjdHCavSo7pQiRQFlXQAkkakYYYRsXd1bwdv5gavIfeVghAgrh232Jc/HRB/IZo
         wHh7UbCJxQi4RCyQRVP+2bC2qqYSupewfbt0VRZWWSFYpv1ffche198jtELLK/MHbv1H
         3uu5hwvrtMAJdwzbg1s12+ei7km1LG3Kw1o6yzd/ycz7TV1eiSUoAjkFY80Q0xoY1Mz7
         GzjgoqU+cISKed5WhWVnwkBs42Db9yKK/Lzia2DZokwFtn8XRvmW1Ck3sxTdm8Cf/Vye
         xhIA==
X-Gm-Message-State: AOJu0YzlsYbEW63VSXl/2ezUeMR3UgR2x0uBK0jWcOcmzaJhNO9lOsAx
	E3rK+eOa1J6u06Jdbd2YV+ASF4mAltSP0m9ypZ0VySZbCd3Uk7DwOvnmRcZ36w==
X-Gm-Gg: AeBDiesxPNykQ3F+L0Rz7/Ec0+nNBbgCnZv/zmQgFNZF7gQieFPb1L8wyF4df+tgm9g
	/FpEm0ym4McLuiuX+YEerbNJgsB1psjwTZmtL4pByDX8If/CC5ODts00F5W7a5NVgv83pvbeX5Y
	OSddRRw/Q5N3VTGeFSG4nDuf3/QwDQHFwEa9tvZY+3EeD10/rYRtbYZ7sUK7xGIFAkA8sOcl7Of
	OK5dIKIqbeQH+fdPtW+PLVZQJfCUtVN6nsR9cOV2ZAfUKzEfml4a0//FMI4pZCN7w7vOJEpb6HX
	HR++bSJi3/UnUH5vAcloWxcC7MPMULYznugGhlCs65bBo0lm9PHfUFFi4HhQqSMyZRdM35o95R+
	opmqHWD+o0oXBibTLHDMtVQqYyLSLdMXwXrdF5Ww/e3KrIhXdBnJ4dAq/srh4y7us46/RdrxAMd
	b7OI8sNnqe83DcXXlGfrxt/se+UvCx6S+oedESRgfnAYoXXAvuNjSCG86KtsLs41Q6aA==
X-Received: by 2002:a05:600c:45cf:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-488d67b8dddmr46635465e9.6.1775836519900;
        Fri, 10 Apr 2026 08:55:19 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 09/12] xen: rename p2m_ipa_bits to p2m_gpa_bits
Date: Fri, 10 Apr 2026 17:54:55 +0200
Message-ID: <ebfa4d838f0774b0b18addafb6ed2ce90c9eaeef.1775836193.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1775836193.git.oleksii.kurochko@gmail.com>
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1775836520-8B74241E-4D9E4FF8/10/73395122804
X-purgate-type: spam
X-purgate-size: 1710

The IPA terminology is Arm-specific, so rename p2m_ipa_bits to
p2m_gpa_bits to use architecture-neutral naming in
xen/common/device-tree/ code.

No functional changes.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Introduce #define p2m_gpa_bits p2m_ipa_bits for Arm instead of
   renaming of p2m_ipa_bits to p2m_gpa_bits to keep Arm part of
   changes clearer and keep using Arm-specific terminolgy inside
   Arm code.
---
Changes in v2:
 - New patch.
---
 xen/arch/arm/include/asm/p2m.h        | 2 ++
 xen/common/device-tree/domain-build.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 010ce8c9ebbd..7957dbd96e57 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -14,6 +14,8 @@
 /* Holds the bit size of IPAs in p2m tables.  */
 extern unsigned int p2m_ipa_bits;
 
+#define p2m_gpa_bits p2m_ipa_bits
+
 #define MAX_VMID_8_BIT  (1UL << 8)
 #define MAX_VMID_16_BIT (1UL << 16)
 
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index e706a6173ba6..30625a33ef08 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -221,7 +221,7 @@ int __init find_unallocated_memory(const struct kernel_info *kinfo,
     }
 
     start = 0;
-    end = (1ULL << p2m_ipa_bits) - 1;
+    end = (1ULL << p2m_gpa_bits) - 1;
     res = rangeset_report_ranges(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end),
                                  cb, free_regions);
     if ( res )
-- 
2.53.0


