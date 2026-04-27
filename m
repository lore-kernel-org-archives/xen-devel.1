Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E284CFF885E
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2026 08:43:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1294717.1571414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHHYe-0003Vc-0z; Mon, 27 Apr 2026 08:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294717.1571414; Mon, 27 Apr 2026 08:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHHYd-0003VV-Ti; Mon, 27 Apr 2026 08:43:11 +0000
Received: by outflank-mailman (input) for mailman id 1294717;
 Mon, 27 Apr 2026 08:43:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wHHYb-0003VP-VK
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 08:43:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHHYb-00EztE-By
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 10:43:09 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ef219d-5cb7-0a2a0a5109dd-0a2a450cc00a-0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 10:43:09 +0200
Received: from [209.85.167.43] (helo=mail-lf1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ef219c-62f1-0a2a450c0019-d155a72bac60-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 10:43:09 +0200
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5a0faa0d15cso9676813e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 01:43:09 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.216])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187ec0c2sm8027602e87.82.2026.04.27.01.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 01:43:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777279388; x=1777884188; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xe+fE5KPwB/3Y8w5gbIYm2q2Fibz2TAb4eEd+2pPodk=;
        b=CrtCQuYZVrxs+0qiablk2CUtU7Db587ARg/YXVgFCNQ9v9ytpD9qle/YOyEGwKA7+q
         agLI87CepaV3CHyRf4l8Uzg+Hq/STXRONWKqHqZbAo6Er4wA51ZMOF7nZuR+iJIVYdc8
         NcPx+9cn98xR7Uy8fE1gqEMP+nhkpetGRKx0spVIhjFkuA43iRiX4WsSclVY5jmfdj+b
         BfOR1mq/4b7mBdtHyn3NemCKSQbo+1guulh/IL738vf3tjVZkEgSBiLDAEbFPN2ygPkq
         OpwEEgGmd8y25kR6OggAaPd9Qa4mys0V6H9fvLnQkEy62T+fqVu5Id9JcddQStuil9Ij
         w1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777279388; x=1777884188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xe+fE5KPwB/3Y8w5gbIYm2q2Fibz2TAb4eEd+2pPodk=;
        b=YfeQNnKjj/dre4ZqIMExjrD6LkzAbsYYqgAtvqTn4VKBfKBZJIk3iCBGsl5UTzKrUi
         TSJLXmEur/6hYjtxieKBKSJg6OI6U9gmhOLhbhmdlhjjurq94N494KOoijfEQQ8BDqPI
         t3qpqc47VGXkc5vKO15ZpavUhZOH5iAU7W/hGDT+lEJSeK0eZdIdlug5vOzISsOpMmJM
         W4w6vcvj98658Lcz4yvoNP+Mz5FP3e/B1p61Qr2jQhfmTl4Zb8k/+dv7/4+ktzrgAxna
         cKSmizTcew9DkWmqxSz7qVBBqF0/u1GQAjimZhtpsPAjH6xyOgstDzwEt2HuFh6MGMLc
         JXWg==
X-Gm-Message-State: AOJu0YxVNFUpjs54WXR9IcDi39iOPRyWwH/hnoxbplmdi3PCxJAhvGPT
	MlG15ixvvJHXPxSF3hEi52eMWbH0lUf2k77MdMtKbMxVceS/oOB6mKefxV217Q==
X-Gm-Gg: AeBDiet6U2zNDYReeumbEIegcFUYAIHQf5kck5ZLkCMtN6mjdGSUe6Qsy0ruPUeOm4B
	LJ9Q9YGRvOD1uinulrCrqgFrI2ECfn7rLgt6UYmIhFWKeq7AEEDB6/ktZNN4pHLe6uD5OatQ2ei
	ROvlK+btQfxQ+UF/hRrRyjolcbxp6ciEP5Y404IbUaxLp8U/QF6vgJu1yZ4ZF5/h6SbHn4l3UF7
	R7EjbzvmwpkzqneQ/f6vEGDWF3Me1XYtsf/LDyDQpWYey+flpv3VP2AgusGeF/l2B0de9KKjJd5
	ytmzV9FDHT/jJVa20XiYG2hHeLqZ1zc9RmpAiWtx7Ua9wWuZnSwxUZAHVSlaTA+XQjySziklaBy
	jtzGR/zyXFABWeLCJMgKpZRsqDppySNUWooERQ3mhvJ56Tv57FDx7u8sYO0gmdBmBEg2uZuXiSj
	GR7iITvu2gWhVpXW1FIaqq1A++qF7l1hnDOb0p5w==
X-Received: by 2002:a05:6512:3c9d:b0:5a3:fd83:13f7 with SMTP id 2adb3069b0e04-5a4172ba690mr12876454e87.6.1777279387877;
        Mon, 27 Apr 2026 01:43:07 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH v3] arm/gicv3: Decode cacheability fields before comparing
Date: Mon, 27 Apr 2026 11:37:31 +0300
Message-ID: <5da34f44edab55c50163addc6b52c680ea1ce2f7.1777278902.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1777279389-F40FDCF5-797E97ED/0/0
X-purgate-type: clean
X-purgate-size: 2490

From: Mykola Kvach <mykola_kvach@epam.com>

GITS_BASER_INNER_CACHEABILITY_MASK and
GICR_PROPBASER_INNER_CACHEABILITY_MASK are shifted masks. Comparing the
masked but unshifted values against GIC_BASER_CACHE_nC, which is an
unshifted enum value, leads to incorrect detection of non-cacheable
GITS_BASER tables and GICR_PROPBASER mappings.

Use MASK_EXTR() to decode these cacheability fields before comparing
against GIC_BASER_CACHE_nC, so the backing memory is flushed when
required.

Fixes: 05238012b86d ("ARM: GICv3 ITS: allocate device and collection table")
Fixes: c9b939863c89 ("ARM: GICv3: allocate LPI pending and property table")
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v3:
- drop CBASER command queue hunk (separate functional change, not the
  same shifted-mask bug)

Changes in v2:
- use MASK_EXTR() instead of open-coding the BASER field shift
- fix the analogous PROPBASER cacheability comparison in
  gicv3_lpi_set_proptable()
- fix the CBASER command queue cacheability check as well
---
 xen/arch/arm/gic-v3-its.c | 3 ++-
 xen/arch/arm/gic-v3-lpi.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index e38aa87117..9005ce8ce5 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -496,7 +496,8 @@ retry:
         }
         attr = regc & BASER_ATTR_MASK;
     }
-    if ( (regc & GITS_BASER_INNER_CACHEABILITY_MASK) <= GIC_BASER_CACHE_nC )
+    if ( MASK_EXTR(regc, GITS_BASER_INNER_CACHEABILITY_MASK) <=
+         GIC_BASER_CACHE_nC )
         clean_and_invalidate_dcache_va_range(buffer, table_size);
 
     /* If the host accepted our page size, we are done. */
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index de5052e5cf..9ee338edc2 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -351,7 +351,8 @@ static int gicv3_lpi_set_proptable(void __iomem * rdist_base)
     }
 
     /* Remember that we have to flush the property table if non-cacheable. */
-    if ( (reg & GICR_PROPBASER_INNER_CACHEABILITY_MASK) <= GIC_BASER_CACHE_nC )
+    if ( MASK_EXTR(reg, GICR_PROPBASER_INNER_CACHEABILITY_MASK) <=
+         GIC_BASER_CACHE_nC )
     {
         lpi_data.flags |= LPI_PROPTABLE_NEEDS_FLUSHING;
         /* Update the redistributors knowledge about the attributes. */
-- 
2.43.0


