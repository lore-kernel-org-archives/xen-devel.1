Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E459CC44520
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:01:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367005.1616903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQJ-0002Cd-H4; Mon, 20 Jul 2026 16:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367005.1616903; Mon, 20 Jul 2026 16:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqQJ-0002BH-37; Mon, 20 Jul 2026 16:00:55 +0000
Received: by outflank-mailman (input) for mailman id 1367005;
 Mon, 20 Jul 2026 16:00:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqQE-0001Jn-Ug
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqQE-00CGmJ-Ak
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:50 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4621-bab6-0a2a0a5309dd-0a2a4506c59a-34
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:50 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4632-195a-0a2a45060019-d155dd2edc8b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:50 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-474560436c3so5222406f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:50 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:49 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563250; x=1785168050; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mI0eMyl2MrsS1GuuBY8meRpdR0WpNCgvj7HrpxOkMfE=;
        b=WdN/wMiovVW8ObONqG1EywjV5c/ud53OpbbxFPLmd1x5aomV/M49IuAaJBFmYvOOmd
         U2AebZKxPe1VdLQVsCTbNPIHzvpKFK6rf7+usF4r5qaygk9fCbP/FvGtn8YCrsXVhawM
         70pHZEaMrH1vgUrQEZy5RHKkJkjSBulPKkmRS1/mrbKmpnnVKicK9C86D5ZSllt+CJzH
         N2qzYi9feMOkAYkHAcbUbWYijnHGlxtSJva6DVqR75iN+bxiX+42iaKMqCQCIC7Gl+/X
         nusbxahSirRdYUMTAbaLPhuF8V4Ezx42HeU38BUWrUuzk+G7Tv9b2Zjh9GBPXCEp0GeB
         xKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563250; x=1785168050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mI0eMyl2MrsS1GuuBY8meRpdR0WpNCgvj7HrpxOkMfE=;
        b=GhyXv1XCw8giy35EdrB7jabJfXVE68jtjGk15gptcn0mVGDF//yJIUw0dDcT1Y24dw
         L5XRPXKubuj0SI8mtqrzS5EQ8zMwGG3BcZfID0Moqu+gvkkGcvfIS5Wa8NQWIom12C+E
         APoYgQjSceUf6wnQxihF6R8apB+LCfeuy+X/G922SlD6HWsgpmKi2H+4ObB6QtyK/b7J
         qIHVyxrBtoYYGxQjNaQCAE/z7tEBWol2vRojGAjYKoDW0Hs7VX0DXAXWGXZ/S8yGc53W
         AKBDRwkyCAqYCBhsiTOROEJZB9aObFr7CGlDMQQCMNzwstiFB32NkrCVQSz2uJC/B5Il
         N07Q==
X-Gm-Message-State: AOJu0YyAdkmcPRfVtCU31wGvJ6llePTBZX45hT2PLlvSdXei4nWcvbLa
	lg6mWbz81xmshfAWR7ZSHVLcxyF2FDoCgvPCHV04SUOuOBPTHZMtKqh9+wem2g==
X-Gm-Gg: AR+sD13k5oCKsDO038JBoyxhtM1PVIg9G+hQCph5SwVFPMcOxJVE2HtF4cWAEF1W9bd
	UUbzqxeqT68eSTIERQ3UjPHI8B9Qa90HyDGwyx85vyB3fGhTIy/X0GtgsZ5c9KwNmz5g1KST7Q3
	07v6V0XxzmbgIa0RE6iHUNIlG+7WjAFTxe6H91sWNmBjX33hiGTxt4PJr6f1wcWh3fP1dumQDdZ
	rde1l1ngQuDzv4sqTDrrEI01UJywjGA6jZjK5VxP/I48zCOFFN/jgfLQtIlUqAPIOpQn9sbO3zx
	LL0SWPZ+JcjsgdQFXnQar7N9GWxcsNYFZpAlxN/JJV00wYLzC46PsHilFJReXGMp4dKnQiW8Fag
	qBxXZmre0RxpzJqLY2ZGx0SGLezjXO0hL2W1AcW6cF2luF1EpVgdtpv+J4W9q2Q48t34XNnC+pP
	Ob9PdL4kLOaOlQAZt7FFrm8K9oGO/+Pgg50nv13RCQQYerrtA=
X-Received: by 2002:a05:6000:230c:b0:47f:5289:5606 with SMTP id ffacd0b85a97d-47f622f2a76mr18145104f8f.12.1784563249622;
        Mon, 20 Jul 2026 09:00:49 -0700 (PDT)
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
Subject: [PATCH v6 20/23] xen/riscv: initialize RCU, scheduler, and system domains in start_xen()
Date: Mon, 20 Jul 2026 18:00:01 +0200
Message-ID: <5f586849014347c550ae1be90ef620a66cec9efd.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1784563250-F4C0777B-05D18F42/10/73395122804
X-purgate-type: spam
X-purgate-size: 1560

Wire up the missing early-boot initialization steps in start_xen().

The scheduler must be initialized prior to do_initcalls() because
cpupool_create_pool() is called during initcalls; without it,
BUG_ON(IS_ERR(pool)) is triggered inside cpupool_create_pool().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-6:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - New patch. Several patches were folded into one.
---
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


