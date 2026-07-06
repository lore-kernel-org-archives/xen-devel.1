Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82804C44502
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 15:59:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355551.1610445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglii-0004sQ-Hk; Mon, 06 Jul 2026 15:58:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355551.1610445; Mon, 06 Jul 2026 15:58:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglih-0004m2-FP; Mon, 06 Jul 2026 15:58:55 +0000
Received: by outflank-mailman (input) for mailman id 1355551;
 Mon, 06 Jul 2026 15:58:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wglia-0003MT-N7
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wglia-00AcZM-2Y
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:48 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0ae-5cb7-0a2a0a5109dd-0a2a4506c18e-16
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:48 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0b7-08de-0a2a45060019-d155dd32ed34-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:48 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so1296415f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:47 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:47 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353527; x=1783958327; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ic0zHniYCoxw7zx7ppkCijfRbsYL+qDQtIqh4IRQM0=;
        b=KxzKMkqIgwLHRhdy8jeNA9ssd5rUT7CW6v22OfHGjl6C/UTrakGwspxjZYUSoD4fot
         dqSDL9oBrlawDv0anJXa0DcNPt1uGwOP5j0lJHAUXcSRP4OIUEUwKC8V12/Kc1VC9pC3
         3EO9k3PjAjV7D71Uo9wI7aq9q9NyTUx8ghth3cEoTqFtiC8yYpKqOpqMr3O7IkfbB+m/
         Z0n6U/MhQOSJTB1Y4R2Z1TOv2DyDTlSAcj8sRsjPzBZkK6iQSy1kTc6YbgnenAc13KcI
         SDFx9jXX59hTmPrsaEDSN0kDnAozG1EKwBJIEcMOB9Qs28jyr/p2D8nOCGO+FPUwz7ju
         uT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353527; x=1783958327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Ic0zHniYCoxw7zx7ppkCijfRbsYL+qDQtIqh4IRQM0=;
        b=GK79lLaGpXBO/wJVIN+gnrX7qF0wWVY8d33yC/iLlvczGJxO9zZHjMl97EpqlnaIOT
         sVU8x/Myc2MUKJbBWpTIJnw11DZM7P5CPR8kblA5hbbAVavNsj/3ZEfB+EHRCJnHaL5f
         E+YQO2Ys2ZuieCNLGP38vpnHxMuTZz3wrGQSiGLIZWzg52RDo+nZRE63VTwkcazlGvcm
         mKmnAnTd5mJBaaJw6o6QNkxGeVrjvOSQ/N61LOvpSiVtpXZDAqbLYVKI1IFsNFRGW6Es
         sNtdZXL37PQAeOuFOCUHJe35va5y0oRHli90Vd8YRbHMsJ0HlXJMgX//njJkYVOPQxI/
         OWig==
X-Gm-Message-State: AOJu0YxZflmP9BLlIFbNaQeBVu7zVlVPqR2hA2S9nbsuGJaLCdhky6wJ
	zjsq7eQ5BrvE1w+xzZZ1Pyq0TGEQnL6K+RefKsmdYjuXqFW4ruuvkjsnCU+R5g==
X-Gm-Gg: AfdE7cm0a3QqHkHK1grxVNHP2GFyS0lC5qY2geWd/g2Y37qNSgovYEeqQVKPI0TWnAO
	Su153qUm0PZkpZXX9bV4b2Jdn4N2/ZcUn8jY5u/1eSen9phLhC9OpcN1nLW573GtDNKcVoR46vO
	9xDTH/Orda0d+5/tDnUIllyr0yGO11bCccO0sVKmqeoz1R6ni217FLECl8M6mUCWJPoQtbvC+rd
	Bb+wRuyV2+qAYul0UFyrP7sYwyW/C+STb02nJS06IR5sJ1FjWZtT/H+0H6F9wETnhRQLkcq0BZJ
	JozqwA9tlVZbFkCUNU1VCqFthlr7AFh160KQwXwTUBIv4phGDK9eO96L+xuUTlgqHqK7TcgGYtD
	NEGxe1pYCS3enWwDJyqCiMXUQRWLryX+A/yITmlLpehZoRs2N2r6o46OIhAzFABBzSX/dQWCB8O
	oUl4nrKkiMcluc5bMozGjGZWRlT8LcJLqmpKp6Sm6bZDgUbXhWfvAWGiqlDGoDLCLgmEza
X-Received: by 2002:a05:600c:218d:b0:492:465c:56f6 with SMTP id 5b1f17b1804b1-493df05f8c2mr9276095e9.10.1783353527496;
        Mon, 06 Jul 2026 08:58:47 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 22/26] xen/riscv: implement init_intc_phandle()
Date: Mon,  6 Jul 2026 17:58:03 +0200
Message-ID: <3a8dfc37dddf0737ac830149ac78ab0bb1677739.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1783353528-C712768D-1103B545/10/73395122804
X-purgate-type: spam
X-purgate-size: 1378

Implement init_intc_phandle() to read phandle of interrupt controller
node and save it in kernel->phandle_intc for the future usage during
creation of guest interrupt controller node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-5:
 - Nothing changed. Only rebase.
---
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
2.54.0


