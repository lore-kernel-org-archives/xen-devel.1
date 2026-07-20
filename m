Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36C9C44531
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:01:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367001.1616892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQG-0001eF-Sa; Mon, 20 Jul 2026 16:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367001.1616892; Mon, 20 Jul 2026 16:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQG-0001bb-C0; Mon, 20 Jul 2026 16:00:52 +0000
Received: by outflank-mailman (input) for mailman id 1367001;
 Mon, 20 Jul 2026 16:00:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqQD-0000xR-Fk
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqQC-00CGmJ-Sf
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4626-bab6-0a2a0a5309dd-0a2a4502b098-36
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:48 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4630-6ca4-0a2a45020019-d155dd29e52f-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:48 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-47f707e5d75so1000345f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:48 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:47 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563248; x=1785168048; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0DFNH29+Q8LihHAoHP3YTwhdjKQRR0o+D4+cY7ApDEY=;
        b=Be0cQ4TAVQ1Izfwzt3aooyFPi5lI9mlenYWHb0xToLZN+q8KpzOAQ7sgpNncpo2n2i
         6O0paRNDovucsA8DGJX61VkKvPMG5EeN3MlHrX9NBhwmZarG76gBrvirPR8W1YcMDnZ7
         OB5ZJjTGBACd56i9JBsK35w/9C36JpNSGsD1Cahe5qQ/Ra/p2qWmbDHyayAHxs5GAc0p
         toR86hUZoTKKutTX4SFcJxKUna2cDKvH5V8kdVWe6NZ6LllQh6pAirFW0pqIF6vnkFJI
         dAjFy1knFzXkG9jd/aUOpUpIY+gYY70Z0MUvj/A9MZs6Sff/HdbQB51XDfb6UQWu/11p
         /0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563248; x=1785168048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0DFNH29+Q8LihHAoHP3YTwhdjKQRR0o+D4+cY7ApDEY=;
        b=stJevZ6cbS/YxcJoEubH57p8iWbtbXbNyHPhIlUi5AGrjaNwx+3fA5fPyCOn163JA2
         7mXoyj+R2GdUREXjZEMLS7fEF4vbYxlGd8jvcgOQX3DG+cz6jAMka8srTdYud1iO7Kam
         VuKlg0Zaqxoqd6r/vcWL99pLij0JPZPBYx1WQ+GB6xPG6RDCaZUeEd2Ie4QaSxyDKtEg
         IuDqkVIPBxFJKQPZuD7C2MC00WlVmGMz0izH8i1Zj6udoK7OwMBflHzfaoJcRy4FnuBQ
         dZKZeLxMrxaNkEZ45W/8IP2P4HPv960SxV9f7B+7ktM+HU+Gt4PuTK27LD7kxX9l9Fir
         vf4g==
X-Gm-Message-State: AOJu0YzwH52Z96McCItz0YBa9whcZmTOREZddPjxqrLXc30Z2gvHNDbK
	3yyuj/ORSExT7MgroZckTCpGpVqFGY6meOY1BTbMaoHO/SaS6jrVTXbhQWY6ig==
X-Gm-Gg: AR+sD10n929O/jm8QerItBQjVR2SZCF/xfE4aYGmhZS0/h2H72WOwMS7KPHKNVxjNJA
	XtSZzIQ/n6NoclDr6ZiJzVZJqNEg1qIZTeR+KgFcxBDU5kudhJQKVb/zpa6gMdtqe9PfqpVwqrh
	nQbB9eCsgWqdRBHrmKB9EoXA/GFFiunDxew4Z9sMRic01QYRkEoAWq8d/D3qqFjcUCjl51RsMEs
	zF+JH6mjOKPjTEhL2nFX5D8GPlxrPe3rRRU2A/JgJxAMbitJI/0s3otDa67YpQHi16syV1okOgK
	cI5kpLtKfflgiotOq3RVMDPYAGElxgsGNDdM9x4jzePL6alpDQd+omJU06D/9PjFw5VPW4Tz2Vl
	dk7/bGqkrBHUO1ylKyta7MBg15MkY5d30bo9J3bgC11aRu6rsu5FCSyS44yYqWCZWoFUFbXMlSY
	rYT9BJDU2TTB1JtsrsKQG/PPEKRrx7FKOsRkxZ1Gj95kcehD3HrPmjLkFlOA==
X-Received: by 2002:a05:6000:29c3:b0:47f:6fbd:8a23 with SMTP id ffacd0b85a97d-47f6fbd8f53mr6199152f8f.9.1784563248103;
        Mon, 20 Jul 2026 09:00:48 -0700 (PDT)
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
Subject: [PATCH v6 19/23] xen/riscv: implement init_intc_phandle()
Date: Mon, 20 Jul 2026 18:00:00 +0200
Message-ID: <e18d2a459314288b13fdd4c8d64bfc3aa96920b9.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1784563248-F26B72AC-9EFBC764/10/73395122804
X-purgate-type: spam
X-purgate-size: 1378

Implement init_intc_phandle() to read phandle of interrupt controller
node and save it in kernel->phandle_intc for the future usage during
creation of guest interrupt controller node.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-6:
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


