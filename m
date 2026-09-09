Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75973C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:09:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413312.1643609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JvD-0006LW-OU; Wed, 09 Sep 2026 15:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413312.1643609; Wed, 09 Sep 2026 15:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JvD-0006Kq-GO; Wed, 09 Sep 2026 15:09:11 +0000
Received: by outflank-mailman (input) for mailman id 1413312;
 Wed, 09 Sep 2026 15:09:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4JvC-0006DU-HR
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:09:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4JvB-003DYK-UB
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:09:09 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa1768c-8faa-0a2a0a5109dd-0a2a4505e412-24
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:09:09 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17695-4cb1-0a2a45050019-4a7de48c9262-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:09:09 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c294496989aso15988166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:09:09 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:09:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966549; x=1789571349; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRZDx0chfMO39A9GRZrF50iTQKdAjHPK16jqhdN5EMw=;
        b=qe/7EVF5HDwkYa29mb6UMD7aiaNVCK/0OjOmgroXrl+CfQSmbADxq0tAeUo55qV/Nu
         xBSXsn3fZAnRVRoMPRVayAvH3H1oPcL8rpRWQvVMOAf7+coGYWaMY4/UyP8Jp11U+QxS
         /p9c2E+uRsHlWv6H2vaRBg0Bx4FLQ1h6OSTictMvodiEyU55u2lQbMwyDC1Lpr7EmA4L
         VIwvXyjVFi/bC/N3EDT7Stcx2Szpf08GK+gFtga4O9Vx1xE6DQ0sHACM0WqZCE30wibO
         XlnVNYtLAkeQIO0xnepXpPp1yVGy9kHTQ95ZodUmOcVqygSMHpVlBtvVH+lYvPEogLbK
         hJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966549; x=1789571349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NRZDx0chfMO39A9GRZrF50iTQKdAjHPK16jqhdN5EMw=;
        b=fwc+mwFjib9d0t9Pn2OBE9tmHzoRMB3HvuiCUsU+2+oxcjPh0EgxCJynLvqxlEIDLA
         eQe23zOKhqiApVnut1C5FGrl4AsjUerSTmI2lf5B0dTWcS6k+yMoM9RZOJlbBtHYOUkJ
         qQu8xthDGw8quy0lUv/RqNYEWOcbP4wp1tt8O6R6eGaj2ZDw/9tUceRhlHfBTZEdSTYu
         3y+Qfv34372+jHQOp7u1V3mUkT4fB9S3Vl3arTzK+RENksSPmUEnD8QP6+h7dl4mumUt
         yJ64LaqsfksMLHxFKKJnbHjiR4mT1iWy/pJ45DxofpCRBu2kcrWBd3lJrt7pT00GVhle
         PJDw==
X-Gm-Message-State: AFuF++mL/yGQJEaydyMNK05CDKLfPDV3DaeBSfzNQ12iypAQJOphxUti
	iEBkUay5GY85lZZxerdi+ldaZNHxdz/iIC9/6qtBCQWaXr2o6STbXtF9Mf6LDLr3
X-Gm-Gg: AYBFou0SZuMIyE5Fyq2XAbxJUhHxSbdOZKuTJPpis9JBiB+94/SG7RBnpGJPA4lxlei
	KPbGnHDhY3/nRUZIRtvnjHVlaVxRjm48E5jIl/Kglk2Z1V9fCieKip0/pcvaBc+C0csWUlj1PZ1
	ZwsV4R6XeE1gjuvCfYk4+4bNNP6LmQw5g6f2HsLy7wfj1ykh5TagVpoxMz0ec3YeFa5j3AqTD7J
	vQWHv0wbPVT7Jd5CNq5XcQwfESXnNTwbceSe81U9KwVSGOgmaAA0M/ffjEgfTSplQ2FO2tQeX2r
	+RX/4Okcsb5+TfnndK0QZQpjD6TZzhx1VIkubwB21MwO/lIWZcgxtk3xolWO9zdQai+/eSnuV5k
	+rGD9ENWDw73j4/YJHR1ijl6EpAPO8nbBYnHwfEj+pWysabaavd4sedjk9fg+kapC7uStnx1UjW
	KB/U0BOO6MOBSv3dAcCRTvhXr4ACLYlK6K+L2zjSdsoJUCw7JVksXsQK67s4F/V4A1eh27Rt2Pv
	+OFtQSkeG/1svyB68M=
X-Received: by 2002:a17:907:3f16:b0:c25:977e:5377 with SMTP id a640c23a62f3a-c2941866b25mr73624966b.10.1788966549400;
        Wed, 09 Sep 2026 08:09:09 -0700 (PDT)
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
Subject: [PATCH v9 18/20] xen/riscv: initialize RCU, scheduler, and system domains in start_xen()
Date: Wed,  9 Sep 2026 17:07:36 +0200
Message-ID: <8d5aa546940bc94610fb24e90b7ab3868ab18420.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1788966549-72CB02A1-D99ED192/10/73395122804
X-purgate-type: spam
X-purgate-size: 1560

Wire up the missing early-boot initialization steps in start_xen().

The scheduler must be initialized prior to do_initcalls() because
cpupool_create_pool() is called during initcalls; without it,
BUG_ON(IS_ERR(pool)) is triggered inside cpupool_create_pool().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4-9:
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
2.55.0


