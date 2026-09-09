Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB263C79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:09:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413308.1643599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JvB-0005y6-Bn; Wed, 09 Sep 2026 15:09:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413308.1643599; Wed, 09 Sep 2026 15:09:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JvB-0005xp-7Q; Wed, 09 Sep 2026 15:09:09 +0000
Received: by outflank-mailman (input) for mailman id 1413308;
 Wed, 09 Sep 2026 15:09:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4JvA-0005pP-HG
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:09:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Jv9-007zEL-U9
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:09:07 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17692-2eae-0a2a0a5409dd-0a2a4503b4d4-10
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:09:07 +0200
Received: from [209.85.218.41] (helo=mail-ej1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17693-fae8-0a2a45030019-d155da29cdaf-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:09:07 +0200
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-c2941f7229dso45907066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:09:07 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:09:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966547; x=1789571347; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2X2VEgPXszXG0oyqHbVR3NMIcSkcalO4zvs2bK/KDwI=;
        b=cUoFw3E7EihKMubAZAa+sRY1cB67G9SxB6stNh6MaeTVbxsdHcxDri9OUSgR56QTsj
         0wzJgFp+53wpniop+7N8iaIm0HyX8uLBw5VPXKrehsJtjxAdX283l1bnFzeUu/U0KKRb
         DluM+GCKs/FX1l5viUyQrSkMHb5HDwfWddJ2DvCYbv7U3wNG2G9Oos+GDuDtCHg3UJDW
         QwkmSqrl4Rzei3Lx15rF8IOReUKLlQWOxlniP6lKmWi3w5ibzAkadzXYx5XwPyHOylFO
         jdE6dXlS42NpQJwTqEAymM9GFZOsB93uEcsl/QaiYHMy4D+NkJw0yi8XNRYDkMftNIQy
         WF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966547; x=1789571347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2X2VEgPXszXG0oyqHbVR3NMIcSkcalO4zvs2bK/KDwI=;
        b=HVoW+i3ld+nfIWrVIT8YRgsvGf8n/04DIRv5WuBgfX0yrvhYCADJrX9Cq3HRGvt+FD
         nueHWZhqCMR5UVnaY8RMV/R8x3rdElp0MaW7gUkO7i4JabIP1U+aJ12yAU7MXUVBmAfo
         lIXV+1/6+K0EBumEs1ihfetVfG9+W3cmgRpIOM+FIopzxwPKlf9M/6kufgivY8dHIORR
         5ON33qbpXuh9cFaBFu/x3vr/ukbGdOH8Q9O/5nPrKAjupWG6cGn026Anqkk1sH98eKEm
         NGZUbu2DyS6BUU7nDexp1w/r4qBPrggQgUsZoJIz6Ylye2Z2AXU4CWZgUCjA550bSnyo
         8joQ==
X-Gm-Message-State: AFuF++nCqfa33KnEKTUr2RW9vnt6PRokJ8ua14ldB2FS/VV/P+C/niCZ
	mQcp8uJ5KpqxAYjT+sWKNoORnqeYRmszzDf9DTt/xJ7ow+m9t1VkiJr+dMGsGh0I
X-Gm-Gg: AYBFou16Aj32WZ1fZpg6lwXOJquLEndyfrg2X+WAB+STEfTV5wZHgEkjLp4PaNGtUby
	jVMxOs3bDvcuiZt6VXa+LhTB9G+fQwF4QwANaBb9p/3660Rt6s9Yb3nV5AMwrIo9sgD194pftbR
	+z9w+sZGBw70rgrhKUdEM8x6AJaGOq/RxWytLG3jqQbWdafwcDVtZWwEa8dtgFR0/3zLxsOCpKm
	kAOEW9x/ufMkLuT0q7W8269nkrjRaecpHAVnHnoUxo+ZxbZvWZvyFnnPUSVQOcPXfadgdEVJLta
	6UmHm10RI6gIGVT2yWjo/dzyDIS4vbsA7YqLoo1qpiFF6Na9pgCktuhuLcLUbH31WSQo9fl5TLd
	dKDIozqsJEqryRJmR+dBSWAT8/SnNrYQopBgdUvuO5mMHvGonoZPKQyXKnThE5SdH5UkrBARAjT
	pxdgsYULwqK+xi72285uF89m+6qMdND0IPrzowj4gJnVph3FU4vndAG++A3CeqzBV6dqoccfFlq
	NJxL6wQr2CYuNzXpEY=
X-Received: by 2002:a17:907:7281:b0:c25:cb7a:12d6 with SMTP id a640c23a62f3a-c260c9972aemr1413358966b.14.1788966547335;
        Wed, 09 Sep 2026 08:09:07 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Zheng Zhang <zhangzheng@iscas.ac.cn>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 17/20] xen/riscv: implement init_intc_phandle()
Date: Wed,  9 Sep 2026 17:07:35 +0200
Message-ID: <cd5ccf8b02a5e281198bddb042fd88e5dd9e46d0.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1788966547-768FA4E9-CDF77EAF/10/73395122804
X-purgate-type: spam
X-purgate-size: 1373

Implement init_intc_phandle() to read phandle of interrupt controller
node and save it in kernel->phandle_intc for the future usage during
creation of guest interrupt controller node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-9:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/dom0less-build.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index 4cc00012aa8d..a1fa51b996a7 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -4,9 +4,26 @@
 #include <xen/device_tree.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 
 #include <asm/p2m.h>
 
+int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
+                             const int node_next, const void *pfdt)
+{
+    if ( dt_node_cmp(name, "intc") == 0 )
+    {
+        uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);
+
+        if ( phandle_intc != 0 )
+            kinfo->phandle_intc = phandle_intc;
+
+        return 0;
+    }
+
+    return 1;
+}
+
 int __init make_arch_nodes(struct kernel_info *kinfo)
 {
     /* No RISC-V specific nodes need to be made, at the moment. */
-- 
2.55.0


