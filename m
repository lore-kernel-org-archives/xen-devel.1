Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE062C44500
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jun 2026 15:47:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1346315.1604903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8m2-00070w-H4; Fri, 26 Jun 2026 15:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346315.1604903; Fri, 26 Jun 2026 15:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8m1-0006vH-34; Fri, 26 Jun 2026 15:47:21 +0000
Received: by outflank-mailman (input) for mailman id 1346315;
 Fri, 26 Jun 2026 15:47:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lr-0004ra-Hc
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:47:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lq-008hTo-SI
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:47:10 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9eed-2eae-0a2a0a5409dd-0a2a4504e35c-38
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:10 +0200
Received: from [209.85.167.52] (helo=mail-lf1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9efc-a01d-0a2a45040019-d155a734a43b-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:08 +0200
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5aea1f4dc7fso1077205e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:47:08 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:47:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488828; x=1783093628; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+nhDaDUJkCW0waY+Zvj1Fm8pm8i//taC/XFR+qPzKk=;
        b=Tljjas2u/Tw+NXK7EKfGLuDIVxm2fBdJSTXze1DwjP0nHErpof1Moy4IvOw6vd6SiN
         QWGoQ9ilD+yn1jg16fdxCiWr7AeR90f2WFjcO90URuPKpaBVALO+b7gx4ZijP2baxrGf
         3ktycjDVUTlJfV20xQv7aLBwQ8k6Z3R5CU1/mfByuUX/g7P+JnQBJRq84tueQa9brQ/5
         InHdOqTATkvjaNWMLFryNfF5uRn0kaLvRWPw/cKc8dSyqjxUauM0DsvnfxV6UQYXfYV4
         VEROcOhCSES70V2hPdMtbh9jK5JZs0hO88E++o5OL/zkvgv6wZTSkB9cRorLh7TnUI7m
         lICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488828; x=1783093628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q+nhDaDUJkCW0waY+Zvj1Fm8pm8i//taC/XFR+qPzKk=;
        b=CuFksLNGor2KCvfoX4/beHh15Z+rW3vtY8pUzl3Ps+mUFQKzpCIHnBlC2RLJb4Dy82
         Dh1Rt299ITO324Zo5MyQoLXxMrf7cd0zx8MJRw+wBqW3YgcXBpo+ZGidbmDyWuB7oesw
         jI03RBXVDvYkYwc08WmbmzOn/dM29cQefO62Fisy+nRCkzSvEX69Yg7eVAfnLgH+wa24
         OwD0KdzC8hSZvLYKSy+GXevuUEPo9QOQHKpiPXVkhNPsTrzmXJDeOw0yw2pyU4RFTWBG
         jY7mVZ8pw3+do6NpqHpuL1NNDc8kKNXNvb4yTU+oB07F5J18xMZbs7FjEVNo6W0pgtQx
         vSGQ==
X-Gm-Message-State: AOJu0Ywwo5qg9n2Ga2BhjPcfOe0BMjqN/5xAgzuIw/FkCAs+8epncVjR
	k5pDnCL3JfXTITwiQ6jwAtxFPJqjKyZ0TILDK62k/B7Fr6iheyjycfKyDZ7nuQ==
X-Gm-Gg: AfdE7cka8PO6vhq+mlaMcAMFfQgXNEAznimQZRNRBPrSUVrbmwfP/Vem48a/UUMlFvC
	VGd1l67izE2Dso5mG5tyy1js5X+C4kTam0EIICMwepkmd/D9MAztgFOq82p0pzOwG3Fh0QnHfgQ
	57yXGqLbJyA6L+kHIc3V+6eDznWQseTQWhnlWOZuD1eVd8D81hnINBhjrBVRaJHF1Dy/Hm8/2D4
	ZFysI2/+nQrzGX345vF6yB0wDh3BBTbSw5tLn4MzrnJH6a5i6ayfKoc5ofEYz9AT1afDoM4/rYJ
	A0ZFncnPXkrPv7esKx4Ri9yJlC9WkQg+z7IOA0S7yvTkYDPaAQUWMWwYz9cu8RzwLGhsWLaE2dR
	p7hZcNUyS4fx9DDrk9BYUvwgICD2ylq1MZoNO1ybH8AcGEyTPTeHz49Akt4C3tJSO1n6+QtxthS
	USSkLT1j6pT2KZke0ix1Z6nBGj1g76MeWz+Fqv2yWSr/fzZkGZClAyZuJqODPe4lnME2SV
X-Received: by 2002:a05:6512:2251:b0:5aa:65a3:468c with SMTP id 2adb3069b0e04-5aea1e246f6mr2021690e87.7.1782488828078;
        Fri, 26 Jun 2026 08:47:08 -0700 (PDT)
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
Subject: [PATCH v4 23/25] xen/riscv: initialize RCU, scheduler, and system domains in start_xen()
Date: Fri, 26 Jun 2026 17:46:32 +0200
Message-ID: <b1b73269c314940b959043dffd2183c180208035.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1782488828-AF32F1CC-AC15FB50/10/73395122804
X-purgate-type: spam
X-purgate-size: 1558

Wire up the missing early-boot initialization steps in start_xen().

The scheduler must be initialized prior to do_initcalls() because
cpupool_create_pool() is called during initcalls; without it,
BUG_ON(IS_ERR(pool)) is triggered inside cpupool_create_pool().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
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


