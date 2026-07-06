Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89419C43458
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 22:30:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355818.1610554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgrp3-0001Bd-9m; Mon, 06 Jul 2026 22:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355818.1610554; Mon, 06 Jul 2026 22:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgrp3-0001BW-62; Mon, 06 Jul 2026 22:29:53 +0000
Received: by outflank-mailman (input) for mailman id 1355818;
 Mon, 06 Jul 2026 22:29:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gabi.qs.mail@gmail.com>) id 1wgrp1-0001BN-R6
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 22:29:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgroz-003ivo-BN
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 00:29:49 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6a4c2be1-bab6-0a2a0a5309dd-0a2a450ce122-34
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 00:29:49 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <gabi.qs.mail@gmail.com>)
 id 6a4c2c5d-f399-0a2a450c0019-d155802ae0f8-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 00:29:49 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-493d92b7db3so18554125e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 15:29:49 -0700 (PDT)
Received: from fedora ([212.231.230.22]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493df702209sm18166295e9.0.2026.07.06.15.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 15:29:47 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783376988; x=1783981788; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FRuZmDHwkDGLc9NxbvfS5kXZcmOh7wMG80qZSsqArm8=;
        b=TAVY6369n8Aw+JtaY9gW9oehteHOTaRGiop+sn0OUnct+CCCEdNi3mjL5YFoW2TBcg
         DamWW/MKgBZHav3JPa1wD5EWtqtbSnu5QJxAv+60VpYoUtKO4vj4CJcsgLMRaA2Hehnv
         I32kvPr3ZVPShekXx57eeKCfDbLy8ogM8Mm9wrwuA6G0ZdHspINTpNCUHewO+vjaITNz
         XMoo5wxSngcMUqqLrGBMeVCIDLpaRQpwijI8KScTUVxmux9AJ3lwxi9MlzL9WlPNyaVv
         qQe4CNVmZBXt2DlqrVxdSqfxjh3xhkho+LRDzjoVDD2jE1cRVCpK66QQpLcFeitNXxzb
         o96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783376988; x=1783981788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FRuZmDHwkDGLc9NxbvfS5kXZcmOh7wMG80qZSsqArm8=;
        b=ZkA4RIzjWE39IDDIaJ3LJYGRgUkaI9ul+1dsIpUg/Jgc0Casfzgk8r9Nw9208rXV4I
         jDqrwJ5JTSTXWhdeJjdQW6DcNVq1hNsHODQIbWbVzhYstXP5IXHwOBqGBT51iwWgzCxe
         dQ8RtZS+zh+LNcw8c+nJbdSqkraNXD3NvYPt0LS+Cc9tSQq98W94quq02amS8NFA8I6C
         lYlHGnj0GfSTXXzhe5lDdivayMx7gEJY4IUVaBGtQT+QQxnt3GvYbRtjk4OSYot2/LUp
         xiIqL00BnECa2+HMcG+cmI5Rv6ahwNR5MMbq/c0t8Ad6DHmG6WEH4DpbZmRP0x2jCtZK
         XGnA==
X-Gm-Message-State: AOJu0YwY8PkNfHk9eRsq1FAdZqmbEiXGyiGSG92mMun8YZsFxUxR+ZN2
	QVaxIEEYOXcxxJrZSvd3thr7+X4lR4B30YWp+T6CNfGtjoTn1v/yqFDBFMk00is7dTA=
X-Gm-Gg: AfdE7cmXLhzuY4iO1c48U0GylRNbkJBTKVw67XimCNCrpBfeiMp73A2vxkmUW0y5wGl
	L6csA32xkMiUKJ4uUXKjPAHXWc62tf94bWEx7KaRXQmcRzkHuNA6xR9yCAAD51zNKAgb+Gs/o+5
	AIk/+I11gIJi8G2k8D2KKTWjZJcOkaVHkhKQI/vkDDTyCV/eTIVMQ2SnbYVFpRKk6sh6DmxqJXd
	l7p+/vjUp5dj0Q5vOFSIWq8lq5H2RpzXRByqyO2O+UVgYoyuFh+ap2Qa3/wrPHvxqvcz8rztdE+
	huqL04+3DhLQLzg849kmp/NZo35MQyL8UF1l5RRR8yowaJk24tt4w8jxsIXHgOuEkE0+R8TfCyw
	cJcQa0W4d3Wqs/ClisorK3V0LczJgUN/rLXRn40H++sFh5ZpnRzdxCfvoLGQKH7GvxsN48VOyHj
	K6tmjcQvELew==
X-Received: by 2002:a05:600c:2d88:b0:492:3773:a230 with SMTP id 5b1f17b1804b1-493df092b86mr16398595e9.27.1783376988486;
        Mon, 06 Jul 2026 15:29:48 -0700 (PDT)
From: mixx86 <gabi.qs.mail@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	mixx86 <gabi.qs.mail@gmail.com>
Subject: [PATCH] xen/arm: mmu: avoid transient mapping of page tables when a directmap is available
Date: Tue,  7 Jul 2026 00:29:34 +0200
Message-ID: <20260706222934.221182-1-gabi.qs.mail@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1783376989-0DF23D51-78984FDA/0/0
X-purgate-type: clean
X-purgate-size: 980

---
 xen/arch/arm/mmu/pt.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index 621b47d..735847e 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -42,7 +42,11 @@ static lpae_t *xen_map_table(mfn_t mfn)
     if ( system_state == SYS_STATE_early_boot )
         return pmap_map(mfn);
 
+#if defined(CONFIG_ARM_64)
+    return __va((mfn_to_maddr(mfn)));
+#else
     return map_domain_page(mfn);
+#endif
 }
 
 static void xen_unmap_table(const lpae_t *table)
@@ -52,9 +56,14 @@ static void xen_unmap_table(const lpae_t *table)
      * but the PMAP.
      */
     if ( system_state == SYS_STATE_early_boot )
+    {
         pmap_unmap(table);
-    else
-        unmap_domain_page(table);
+        return;
+    }
+
+#if !defined(CONFIG_ARM_64)
+    unmap_domain_page(table);
+#endif
 }
 
 void dump_pt_walk(paddr_t ttbr, paddr_t addr,
-- 
2.54.0


