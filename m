Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEF1C43602
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 15:58:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355504.1610370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliQ-0001Hw-Q3; Mon, 06 Jul 2026 15:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355504.1610370; Mon, 06 Jul 2026 15:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliQ-0001H0-II; Mon, 06 Jul 2026 15:58:38 +0000
Received: by outflank-mailman (input) for mailman id 1355504;
 Mon, 06 Jul 2026 15:58:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliO-0000ra-JW
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliN-00AcZM-TF
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:35 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd081-5cb7-0a2a0a5109dd-0a2a450a953e-32
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:35 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0ab-e40e-0a2a450a0019-d155802be9ef-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:35 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493c5220cb7so24616975e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:35 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:34 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353515; x=1783958315; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zPPT5yH4g3srmqRgr/MmJI9wmQx9NN5+pUlXZUXu18=;
        b=Al+T4YoEWiQ/7CIdwwh3JcAjYPAxbsYvOrxOZmOwOdsWbqoMRPtz2eZDn3fSnpDT0v
         dXLzZNkhrXG2ko1leutgpH8YQWJuvC1Yj8MeV0NcLBO0T0mfhelF8XyMdy3sN2Z4/vk6
         bSGeWGQK580v351KREkD2cWI14Z8T9qU3scueoh5clzIaXG3cUGi+AgoNmh8gergCzUL
         9SBUh592BtGwM04Nd6LNhcT6Hj3jlbJdxC+sKff8dlX8g5c9ZoqJY69mbm/dGR0C/l11
         qEL90idaVBxo+yLLFWy4l8P8kVvh0lxzbtEWGKwrMq3epVZbeBZb0x6wAjXKrCbZ+V0g
         4fQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353515; x=1783958315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zPPT5yH4g3srmqRgr/MmJI9wmQx9NN5+pUlXZUXu18=;
        b=kt6lctsszAhjl/3GSB4iPtN/PQ+NNTnSeMDYAVMNiM+HyVE5SJ7r/ingM1dkstSpih
         J2BkGyySskp1LC2al49asnEfUDWLKwu9MPXri9tWe9wrZdKBbnDR6HhrmUbulTLd/IM6
         SBPF7A8KDjLpWzLoq3uRfh3ww1AQgF46tqqk0qPEk38qVbfVHQbhFUharfKOXFxPOIJb
         v7mjnoLIipjqPubPOwGcULtNwjiZouGlcSsbs4E30Ib2z0qCxqPaUia0crVIMmVNOl9m
         p7dWtv32flN7vkdaiG+0EypTtdRaj0gnFEmPhohjUdqepWyUjcOPB4fj1VWrLwCIIvhN
         A4cA==
X-Gm-Message-State: AOJu0YzTj1pIqsEl68rCSIZjeItUSqS3WOEvtvlKHplHvNYMAyYQ9jYG
	LY/Xsng4Zc1mcal08EMJsOdIkpBn8YANyDFajOGfqBYBYYuqIHk7aQVn2cqSiA==
X-Gm-Gg: AfdE7cmYjEWsiQIWXoXSXV7Ckjx7z9IVVMyuxO+oMaQfM9lto/gXTlwsdSk006ivtTh
	qg2+D8Kt5tOXSpTRxSQ9/CsoMjN0uPfdoe6hMvrFviq9a4XvbAedrnoEukkprAgF+khiAGlV2eL
	5N7Col0F6z42QZyxcfG11qlezLsz+rYaz5nX44nAF1r3MUKzvjY6enLwbiqLglCyCmhIYCg6SxI
	pPXe1+hU1cpkXTySXokHU1rwZqbO6S4xRrFk4afZmU6XCpRkI0GQkLSr0HLJlnRqF3Xcgw5r0+F
	6x+UQ3yQ8wxgszqvF1mtfdDCqddhmpm39lctC08AMl5X+OQSpM2eJVDgCApcCcOoT+ng+Yk47nD
	1sNniPrFT8S761FM5Osp23Uxy4tMB6xNOKBTrLivf7TDxi84lkt9c89jace4K9Yf+b0H8rTIyVG
	jsXBqCTUl8uH9NoMVpgUAiYCAl66JVAgFiy3TSWmz/mzASmiAVm+0H1Ykuyg==
X-Received: by 2002:a05:600c:818f:b0:493:b750:bd20 with SMTP id 5b1f17b1804b1-493df041d26mr14237625e9.15.1783353515285;
        Mon, 06 Jul 2026 08:58:35 -0700 (PDT)
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
Subject: [PATCH v5 12/26] xen/riscv: implement make_arch_nodes()
Date: Mon,  6 Jul 2026 17:57:53 +0200
Message-ID: <982cafc2caaa2977d0a51dece7c6e92b9001a745.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1783353515-D4B2CDDE-E068D889/10/73395122804
X-purgate-type: spam
X-purgate-size: 1386

No RISC-V-specific nodes need to be created at the moment,
so make_arch_nodes() is implemented to simply return 0.

It is placed in dom0less-build.c as make_arch_nodes() is
only used in the dom0less code path. In the future, it will
be extended to create an emulated UART node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Drop "Add" before Acked-by above the footer.
---
Change in v4:
 - Add lost Acked-by.
---
Changes in v3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - Update the commit message.
---
---
 xen/arch/riscv/dom0less-build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/riscv/dom0less-build.c b/xen/arch/riscv/dom0less-build.c
index a683972e9235..4cc00012aa8d 100644
--- a/xen/arch/riscv/dom0less-build.c
+++ b/xen/arch/riscv/dom0less-build.c
@@ -2,10 +2,18 @@
 
 #include <xen/bootfdt.h>
 #include <xen/device_tree.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
 
 #include <asm/p2m.h>
 
+int __init make_arch_nodes(struct kernel_info *kinfo)
+{
+    /* No RISC-V specific nodes need to be made, at the moment. */
+
+    return 0;
+}
+
 int __init arch_parse_dom0less_node(struct dt_device_node *node,
                                     struct boot_domain *bd)
 {
-- 
2.54.0


