Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9DCC9830B
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 10:27:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430102.1652681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9KBr-0002Hr-QZ; Wed, 23 Sep 2026 10:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430102.1652681; Wed, 23 Sep 2026 10:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9KBr-0002G5-N1; Wed, 23 Sep 2026 10:27:03 +0000
Received: by outflank-mailman (input) for mailman id 1430102;
 Wed, 23 Sep 2026 10:27:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9KBq-00023I-Pp
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 10:27:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9KBq-007MAJ-6X
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 12:27:02 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3a968-8faa-0a2a0a5109dd-0a2a45099624-14
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 12:27:02 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab3a976-be1a-0a2a45090019-4a7de18c8dcb-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 12:27:02 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49d097b4939so3821375e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 03:27:02 -0700 (PDT)
Received: from fedora (user-109-243-71-234.play-internet.pl. [109.243.71.234])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe0c50da7sm32786515e9.3.2026.09.23.03.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 03:27:01 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790159222; x=1790764022; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4vFq/LEYOvho2Vznc9H6m0hLeL8wfPz9BeDI8XZDT0=;
        b=BBrJ+HWItGxxNhR01VY6fHbdWvWiQ18l/qw+U7cdUshN/W8VWhrRyBDe9gQwRE59HJ
         MNyi8swF6yQAs7wLLcLSX/uhICe+sMn1ZUB0mQFKGGNWRavAfxmboBeRjp8hWU1SRSrA
         OEhrNKZPuprfj84jvq9xQjhwzALe+CaJ+cZVEDWcsdxSErVH3avGuLOArMY6w+NmYPmc
         TzPFmF6cXi2Wn/d0ilmUM/wMv8CgV2wj1tsfY8ZzbyNTD9nUIggLsSB1tC9Cldxfl/Pd
         y4UHNRj1pga49o5bWm07r87dMsFo1/C4cWEkBn/kre3i06vh2Flm9Wjuc1rDjIHue2LF
         sPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159222; x=1790764022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q4vFq/LEYOvho2Vznc9H6m0hLeL8wfPz9BeDI8XZDT0=;
        b=0PD2CgMZJE7sKzuvkeAaWqJznaGghupV/jmkBQu+y/ueiA8UsClhZgNGSSwX5iIAc9
         XtFCKXQlb+sZ7mPWYBQeGbe4OupyGBDOB0kYVuuuqn7J4qrkCIJ/7OqfvjMTVpD6Hnmf
         hXA2ak0NWrY0b6eCptEYK4BEO0YtUEwhTmpZEwffiELZ2zJoQ+qlDt0ah/v9ZpbKnk0e
         RHNObGHa1GmgMeop9M1XFgMKyOCJClejie03LXO1NT9rosA2aJoILpAbWARlnGYEV5KV
         8GO0XFomDYsM9zh3wPOzMODeqc9KFnSBfDCPkdC6NrI7hUbtHaI7lYt4jQin2lezVVui
         1x6w==
X-Gm-Message-State: AFuF++nn8/yFVeeBegszRgL8432BDh/cN+dxgAm7HrA1SkF3KqE+SWSk
	p772fdKlOhbp9l3ybG+xbcCNRCryieXedkXT+xPqfzIBwqmPxmDjPQGvCcH2VQ==
X-Gm-Gg: AYBFou3lf8t7uWZLdDY438pmvaz81u/S62iq9AUian7j6mKcaK+DUE+nmA4zVcG4fKP
	DF8Hs4le01n4R7Fxo1ybkMQGHzJuToMnzdDyVRo1xhfDTloKrBRcZyyPq59Czc/Jvuq19KolvgE
	oc4RpTUO8LmTsiBRhzYYLQFYXAzUbOJjRdi4pcZDpBXZrPcHNpHsrNXZdM1CDDS4ljBJvm5H07L
	yuNryWtcvciEz4QR9tqxBypPPqF74hAk0pnzTWbwpKzFYX4nb1jUqt+6udWBakVYw4jlJ+iEbu1
	k6t/FM1WQb1xBpSfMF9JVWEaCitMmb1w2T2ET0iXmhJBO4WB3R3lq34Lm/U5yRlSD+tDRZv3yUC
	y8TucWuTDU2AG+5rBSV/wW3IAvJ8yS9G5X1e+xi60+JSMaveQ1RAoamSbvCfq4ELlUPV89hQXM5
	U5hREWDvwAK/SbLiD4U/Rm+2vgNFYC9DvfmpzXmO8TYgh43eTwlnxBbE8k0EH6AlV+DE/YOp2+X
	IPperWReF5afcpPbfZJ3fwhjGZbzVPUOcjE2j4g
X-Received: by 2002:a05:600c:8a0a:20b0:49e:719e:e215 with SMTP id 5b1f17b1804b1-49fdf13b2f2mr18342355e9.26.1790159221661;
        Wed, 23 Sep 2026 03:27:01 -0700 (PDT)
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
Subject: [PATCH v10 3/5] xen/riscv: initialize RCU, scheduler, and system domains in start_xen()
Date: Wed, 23 Sep 2026 12:26:47 +0200
Message-ID: <715c9d8947e99d50cd09aace8aff8eaf3cd4a2f0.1790158750.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790158750.git.oleksii.kurochko@gmail.com>
References: <cover.1790158750.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790159222-BE6DA034-A0385B0D/10/73395122804
X-purgate-type: spam
X-purgate-size: 1561

Wire up the missing early-boot initialization steps in start_xen().

The scheduler must be initialized prior to do_initcalls() because
cpupool_create_pool() is called during initcalls; without it,
BUG_ON(IS_ERR(pool)) is triggered inside cpupool_create_pool().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-10:
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
index 07f46ac3ce27..05f93a74c9d3 100644
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
@@ -160,12 +163,21 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
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
2.55.0


