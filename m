Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35692CD37AD
	for <xen-devel@archiver.kernel.org>; Fri,  8 May 2026 14:44:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1303811.1577172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMR8-0003Up-TA; Fri, 08 May 2026 14:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303811.1577172; Fri, 08 May 2026 14:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMR7-0003Pi-Gw; Fri, 08 May 2026 14:44:17 +0000
Received: by outflank-mailman (input) for mailman id 1303811;
 Fri, 08 May 2026 14:44:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMR1-0002Ba-UH
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:44:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMR1-007XaD-9g
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:44:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a5-2eae-0a2a0a5409dd-0a2a4502de26-32
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:11 +0200
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6bb-af86-0a2a45020019-d155da2cd8c6-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:11 +0200
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-bad54961385so338805566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:44:11 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:44:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778251450; x=1778856250; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ertjGZ7ExX36oGia4x9/eFNEbUiupI/fuIemGmFcgEY=;
        b=VGt9nPTk2Xc+KduTDtcjO6CemAQvzMsOwyAA90KbWOPp7YDzI+uzEkfCr/6DmYtjA7
         hIitIcKdv0RlfpInpEaGPA2sgQ5kyO5hIlQVOA+ZFLaPgLfN0D8I8UnMHPMV2EfEuA06
         eDOx6pIFx5dF1zG/tiksO/oXFEov3RRNrIdu20Y6hZqCjrGfYPuBMayqlZDg9s/f/vrD
         5AXhNeva/yGcfu0LPPhn/XhwLRFrcSm1ycRCN+ca1Na5uEGbs/q20MAr7mYqZw47IXLi
         IJxIpL8XeVCeWHYj6n18kEctmYkCpCLYxsmG4k0Ryv/pmUvY/ADOEahIRuWFS2j0zH0D
         LYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251450; x=1778856250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ertjGZ7ExX36oGia4x9/eFNEbUiupI/fuIemGmFcgEY=;
        b=KOahV26yWyUhqI/c2kFTyl2dwWWW71iBb/GDZeQCEQjGPSY7OhFXpwxtZK059K67/0
         NGbeppTfzARETkRq5a0gHT8nyY7j7by8F7fIAdBeIz6bYTpxu1TtAw4vdndQk7loGIgM
         UcRDhc4F7ry6k6NE10y/ys7nyxNOecIGasRTsZCxqV+4+DMued7yCJq0sUtJBZKU3xwU
         rueSHkGltFqYJey1zip0RQWpP1WEA9tc2u9Zgx1wMlXXUWqWKsOjnNvgu+DHDAM3DnkZ
         NuZJ+6pbLscIdmm+9UZ9uTyYc7vZIkgEfZWejsD0ig1BXktpLHVsu/LMqJnThGa90yoG
         Ncxw==
X-Gm-Message-State: AOJu0YxYvjsD1kw1RlysXvxbVu0CLAuQCS0glCK5YFCbeesZBrhS0twX
	8c8qZGz7m8tcvzeimhgkpVKQC+t/y/mhnTAmKoRfNyZADd/uoNSge6cmyfzt9Q==
X-Gm-Gg: AeBDievFQqWARrxi52wjBstJACzmIY0id+9DJq1YeJtL3ZvR+/ipF7kiqZlJlw8VxMH
	yUiGzIBQxWLQO54kwQ+ZQ6fNKGjbWFA1XK32c9SqWbMug9l/lbuj2rG5zU+iS85EtR9RUZetw2y
	VcO4lgmvXJsFUmy7QveM2UOl2aYh+OB14P1TqsmTxWF9rDuUtZjNaFTjC1BLD9P+wB6/JBsdPp/
	bK6zZeNJ39TWqCq/nJg5y3rYSSKhpcVjNDsWGtWt0/NRz0ZW0T3tJIBdTRADgK0l8AdWhOmPrNz
	9LRlyG5wjedti9tM+B53y0aNsyY7Zwsxc63OQjGT6hNfyErVEALuGw0/+eBi44UN/zi4okefPKy
	RGKdZnOtGFZn7ZF18WAmZnfRddYaz6vzfKqJlM/SK6QTb4ifMwRQzpTSOBwD2G/FHo9g0k7yaSa
	k82/KD+es4IBk6tR+wc14eTV571viHaAKX/tGdJ1t6MPZ3l3MNXyYF7HAzLGeqIWbypTYWu+yO9
	ADu
X-Received: by 2002:a17:907:c308:b0:bbe:7709:5a8a with SMTP id a640c23a62f3a-bc56ae2ca2dmr824426166b.7.1778251450322;
        Fri, 08 May 2026 07:44:10 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
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
Subject: [PATCH v2 23/26] xen/riscv: initialize RCU, scheduler, and system domains in start_xen()
Date: Fri,  8 May 2026 16:43:25 +0200
Message-ID: <824f8624bf920d0e7f558a07ace58bfc18a44788.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778251451-80D7F161-705ECF3C/10/73395122804
X-purgate-type: spam
X-purgate-size: 1383

Wire up the missing early-boot initialization steps in start_xen().

The scheduler must be initialized prior to do_initcalls() because
cpupool_create_pool() is called during initcalls; without it,
BUG_ON(IS_ERR(pool)) is triggered inside cpupool_create_pool().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - New patch. Several patches were folded into one.
---
 xen/arch/riscv/setup.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 56a0907a855f..c3e98733ebc3 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -6,9 +6,12 @@
 #include <xen/compile.h>
 #include <xen/console.h>
 #include <xen/device_tree.h>
+#include <xen/domain.h>
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/mm.h>
+#include <xen/rcupdate.h>
+#include <xen/sched.h>
 #include <xen/serial.h>
 #include <xen/shutdown.h>
 #include <xen/smp.h>
@@ -156,12 +159,21 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     timer_init();
 
+    rcu_init();
+
+    setup_system_domains();
+
     local_irq_enable();
 
     console_init_postirq();
 
     guest_mm_init();
 
+    scheduler_init();
+    set_current(idle_vcpu[0]);
+
+    do_initcalls();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.54.0


