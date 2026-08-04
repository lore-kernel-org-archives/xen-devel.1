Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487E8C561F8
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382266.1625638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNT-0007YY-UJ; Tue, 04 Aug 2026 15:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382266.1625638; Tue, 04 Aug 2026 15:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNT-0007WN-PR; Tue, 04 Aug 2026 15:48:27 +0000
Received: by outflank-mailman (input) for mailman id 1382266;
 Tue, 04 Aug 2026 15:48:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNS-0007KO-6m
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNR-009GfZ-Jj
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:25 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209c9-2eae-0a2a0a5409dd-0a2a4507c9be-2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:25 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209c7-b4ea-0a2a45070019-d155802eb8ac-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:23 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-496bb7cdf51so36540035e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:23 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785858503; x=1786463303; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MP/1zoasJWckGByg7jAKnBbEmQnEEwAq1X/Es6dlPOM=;
        b=SP+gnfjuQEudbjUeaC+DElxqkKK4NHG/SdzMh13jcpTvcHHZ4Nk3C1G8WBcR0nzBJ1
         xfGBsC327fKshsOVjXV0oCwymy+cnOGB0IxZzZ1GPuzFZhvz+Dby16YDyveAAsbCyck+
         7mPOlJe7Oug+dRbyZmkLZP8onBSp0JH3Z0mJdF/LXW0mgfuFYRJNQR3R4nS94Ms0ODHT
         lx7vGsNY1p5Vq61TUWPdKjgTk3QFolBqC/l3jdJipkByuZK5C6yyATZSttIuJnjo0D7T
         B3KDwavPa940NO8DwvtdUkYnkY8P0Jo73+oJQQe0NvR6QnHmVsFibSCd+ho9+UOYtztc
         w4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858503; x=1786463303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MP/1zoasJWckGByg7jAKnBbEmQnEEwAq1X/Es6dlPOM=;
        b=Z39tjLd/JiwA9UVlluN6d5LoJyh/VJnMmKP0Q8f9rQP8sGkhUuNC9VStR3Syv8LLpd
         qwrm0IpcbvBwA9ateLRL6j+k6th44NK5M96mPNvjFxZabwxW0g5jZVCTTOCqwd2+4QS7
         ahjrMUaMYRaIxFtznjIez+2wQkd/LgDjgIEpTMMvzXdkzLE2JVnMFcwwq4WYyhT0QWDq
         w0XqfA0w3VWeMu1UTRXZbwb3o0YkbKCVkwi/d26cdvkqbSqnFOzuSJ/mAMESiA5ILaSF
         hyd3lwxF24wOt2CL7ofKNSTk4OAzT3TeTmYONPpQBmcbudW31v+QyZM4/lU3mFkj4h5W
         OGFg==
X-Gm-Message-State: AOJu0YyHZb4byQWXealrac2AEDbxmmGAQgAqktdcqjyZZNs9vNPaojpU
	pgmLy4Lry8MAk0Dx8EtzGDyF7NLPPVJ8HMbijqg6deu7B6pj5VUHzlcbpwmEzQ==
X-Gm-Gg: AR+sD13+U1ZsVOZJ3y6gdcxaN9RoZxTGKhnpcHdf2uIiM9iM2NAv7FeF1J7aWsYGIzJ
	+GSQmYWnrEyc9dC4O+wiGeMPZsrSYnIjziBdeAoU/UA49TMso3lcQiXWNdwAMCUl4Lywv2LT0xm
	tMLObZVM4wKOc70u/3r1kP2xU3tL91XJI512qHhnVoDw3DiZQAB5lknko/bhfTdSx8qKZetrmt9
	S1giWJcl56/MKIKo8Mc0fFu/lG0DSJj8OxN/zr+LqWYNo6hREjOJ1pOZ2eh7PxHa8R1Kk4xGner
	7JfDNZNwJT7CB2dgyCL7yniPiSpzrqX3yHNsHkx/v8X4gcPDqA+efMRk/DwRGrnJRJ6y8lHIUdD
	2PNF1UogGvPeW56cX0U4FwdeTVTeKQQ5J+KmlQquhbKeqsJ8gGSaX/ZOC02tqwrsqoVHB2lBlBJ
	PeefhtqOZcxdOZ9Qnr45HKLfRfcb44v1KEi28xaXD5XGoXu86uwS2nW+YKlv/GzxboQQPmyn16n
	dWsW4k3APnuWhme2CfLX0n29u6f9uztBg==
X-Received: by 2002:a05:600c:8711:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-4980c652515mr416359285e9.11.1785858502781;
        Tue, 04 Aug 2026 08:48:22 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 03/20] xen/riscv: Implement construct_domain()
Date: Tue,  4 Aug 2026 17:47:53 +0200
Message-ID: <f8fab37699ea2cb9eb8cba6414ada57f9f0d0c15.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1785858503-3C610AE4-0BE0FE40/10/73395122804
X-purgate-type: spam
X-purgate-size: 3117

Implement construct_domain() function for RISC-V, which performs initial setup
for the domain's first vCPU, loads the kernel, initrd, and device tree,
and sets up guest CPU registers for boot.

It also creates additional vCPUs up to max_vcpus and assigns the device tree
address and boot cpuid in registers.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5-v7:
 - Only rebase. Nothing changed.
---
Changes in v4:
 - Drop the blank before v%u in the printk() failure message so the output
   matches that of %pv.
 - Restore Acked-by that was lost in v3.
---
Changes in v3:
 - s/%d/%u for printing vCPU index in the failure message.
 - Drop dprintk() for successful vCPU creation.
---
Changes in v2:
 - Rework construct_domain() to print that vCPU1...n are created using %pv.
 - Use true instead of 1 for initialization of v->is_initialised.
 - Drop unnessary BUG_ON() in construct_domain().
 - Add TODO comment above *_load() functions.
---
---
 xen/arch/riscv/Makefile       |  1 +
 xen/arch/riscv/domain-build.c | 50 +++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 xen/arch/riscv/domain-build.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 4fcdcf9e24de..2d24670dfc74 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,6 +1,7 @@
 obj-y += aplic.o
 obj-y += cpufeature.o
 obj-y += domain.o
+obj-y += domain-build.init.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
new file mode 100644
index 000000000000..5f6f4b6248a5
--- /dev/null
+++ b/xen/arch/riscv/domain-build.c
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/fdt-domain-build.h>
+#include <xen/fdt-kernel.h>
+#include <xen/init.h>
+#include <xen/sched.h>
+
+#include <asm/current.h>
+#include <asm/guest_access.h>
+
+int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
+{
+    struct vcpu *v = d->vcpu[0];
+    struct cpu_user_regs *regs = vcpu_guest_cpu_user_regs(v);
+
+    BUG_ON(v->is_initialised);
+
+    /*
+     * At the moment *_load() don't return value and will just panic()
+     * inside.
+     * TODO: it will be good to change that.
+     */
+    kernel_load(kinfo);
+    initrd_load(kinfo, copy_to_guest_phys);
+    dtb_load(kinfo, copy_to_guest_phys);
+
+    regs->sepc = kinfo->entry;
+
+    /* Guest boot cpuid = 0 */
+    regs->a0 = 0;
+    regs->a1 = kinfo->dtb_paddr;
+
+    for ( unsigned int i = 1; i < d->max_vcpus; i++ )
+    {
+        const struct vcpu *tmp_v = vcpu_create(d, i);
+
+        if ( !tmp_v )
+        {
+            printk("Failed to allocate %pdv%u\n", d, i);
+            break;
+        }
+    }
+
+    domain_update_node_affinity(d);
+
+    v->is_initialised = true;
+    clear_bit(_VPF_down, &v->pause_flags);
+
+    return 0;
+}
-- 
2.55.0


