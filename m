Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3B6C43458
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 15:59:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355560.1610462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglim-0005fP-Fc; Mon, 06 Jul 2026 15:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355560.1610462; Mon, 06 Jul 2026 15:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglik-0005Wk-Vw; Mon, 06 Jul 2026 15:58:58 +0000
Received: by outflank-mailman (input) for mailman id 1355560;
 Mon, 06 Jul 2026 15:58:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wglid-0003vU-N6
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wglid-00AcZM-2N
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:51 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0ae-5cb7-0a2a0a5109dd-0a2a4506c18e-26
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:51 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0b9-08de-0a2a45060019-d1558034ddb3-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:49 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-493c2c0b9a8so28898005e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:49 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:48 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353529; x=1783958329; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HewRHJTZRQ+nFOINwAOu6Y1DjcWg4/eeN41dA4C7d8=;
        b=Idf7NBF2lXqiSqVXI0YGxX06/k8w2L90hEi9wa4UHBgBPvSBrhrZQ+JCNWOKjLv6R4
         ETIk4LzOBRKCdw2dBNRX4WowqGPrvKgeU53gUli/vXJSd3lCCXCl9w6PQUgM0EIz0e8I
         ppw56QuSk3x/+65jZHLg8RXjLgM2ijTpYw5xh6o2WNnXXImDOPXMi4iUQN87a3+ubSKr
         uNTu0JRstJVMgctezpA5en2U4JHV02xRZxRmz4pAMjSovLgAhQNgio2I/GavzogzgynJ
         dSowT9gBBDfgU0aWF8g0ass7feeWIH/YPp28VN47xUnELHAPM6ziY47s8u5BeHWhSh7A
         1uJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353529; x=1783958329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HewRHJTZRQ+nFOINwAOu6Y1DjcWg4/eeN41dA4C7d8=;
        b=juZTujgOkSeepRflR4PgiGc2sxnT0hISXaw7GAnaGSR1FgUOg0is36LVU02fjWzR1t
         JxHWgWfZgicWXtLOIdezRUW23YR1/CmP1WN4vHJ0LbVY9vNCQlWbp9hze3prV3Ohql/w
         amiVhCenT88lJyOmwfNAGbVdbRG38xplDsjr5AYMwqxUzQ4guWYtyllUQPh1JEdom7jY
         2UKJHH30LFgFliN45hrVfqUCNvPocXfO+bswRjFhiz6vxfKaJOWYrVg+OpFwvWC3Jpv3
         k+CJmAFcvDmXcAFaQroahlA0MnwJUzT7Q4UycwCZsvbOkAw3OBU370z5WUceNHOlq9EX
         yQpQ==
X-Gm-Message-State: AOJu0YwbeMQwZR4IHkQSLF+2vY7T6BHp6rJyRVk3AoSwUG7HgQsgVAPX
	rgR6yLI/1NH4PlyPLbOuCga38wOqgC8vgw/z+9J6dPb+v+AaF4mZhcDINFHsMw==
X-Gm-Gg: AfdE7cnAMj31o14Z0t9X4V8V3Np2uzE/bMMYSk+WkKuR6Cag88e1oZ9o4uz3L7KHCZp
	9e7OkMOcHFaIsAVnivkTejvgL19YaW/CvI4woA4xS0FHK5Ms8A6+j+8QGZb5ASeLHciEdUFirrC
	tHXOYKt7DseCycJlQMIidwwZ75Rro0fQqbkkkhurGWUlx1HHpvzqKpX20aNIsaRdJJxLCNPIOaI
	3K8IyMSBiRyulMpvlAjgnjE6V4JW2/Yd29rFRBEF62wTcNEYUoUpXxZg4/FjHJS8KOqcmSah9l6
	OxQFDrGrICFTQLCOHpskfcMh8I1riORQXxF0raXYdHyB8fW9Q9p738fcAR3ylsDUR/jDjwatESa
	L5sqLa/ngc40QoJeR/Fb4rUnGQKGzGhQ5x9gm/roLlUpn0uplpbY4LdDF/saiFgOmcIbvbGDQ3a
	Sg+af+iT2+vrbtgMmGinqKprsLODNAtGi7t70RBoXN76XbLUlzI97IzTlaLxC60ABKOAUI
X-Received: by 2002:a05:600c:37cd:b0:493:9661:f55d with SMTP id 5b1f17b1804b1-493df09a412mr13882195e9.30.1783353528691;
        Mon, 06 Jul 2026 08:58:48 -0700 (PDT)
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
Subject: [PATCH v5 23/26] xen/riscv: initialize RCU, scheduler, and system domains in start_xen()
Date: Mon,  6 Jul 2026 17:58:04 +0200
Message-ID: <b23f11169c454389ac2e71e7973a095ff56f6735.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1783353529-C5F3C68D-59DF2D02/10/73395122804
X-purgate-type: spam
X-purgate-size: 1560

Wire up the missing early-boot initialization steps in start_xen().

The scheduler must be initialized prior to do_initcalls() because
cpupool_create_pool() is called during initcalls; without it,
BUG_ON(IS_ERR(pool)) is triggered inside cpupool_create_pool().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-5:
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


