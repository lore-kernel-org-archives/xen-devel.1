Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A851C61DCD
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:19:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400812.1636377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbt8-0003h2-8o; Thu, 27 Aug 2026 15:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400812.1636377; Thu, 27 Aug 2026 15:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbt8-0003gt-63; Thu, 27 Aug 2026 15:19:34 +0000
Received: by outflank-mailman (input) for mailman id 1400812;
 Thu, 27 Aug 2026 15:19:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbt5-0003SX-Sm
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbt5-00C6eJ-9B
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:31 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a90556f-8faa-0a2a0a5109dd-0a2a45029182-36
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:31 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905583-6ca4-0a2a45020019-d155802bc416-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:31 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-49a97714f5dso12076085e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:31 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787843971; x=1788448771; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSHoAtU8dddLTKoCSKrkez3cQvXSaxG/ZVd2XecEP58=;
        b=jigSFwHCz6gnwy62YTDDCbpStYHF4ILjdNP0zqE6x8Ey2VBtHjW8lVtFEfhso6NzG0
         sg9cqIXbb8gH1DRMXDPR8KfEmXvOlyx1SFtdrqUSHi+LvekUnI+tc02KfC3B0pcO6oJe
         JYy1vXo8bKaXUyVu3AggDPDMdNY1PiTU0wD8sfR1v9xgJ6zL2pLgiLtBKxiqhNs+93Q3
         8BCYuC6SV//FN4GxmbTK2txpIFuOcLEa1Hg6zWKgYwmPIBP0/3jCKvWW+mErRx5izSm8
         zu2g9sJvwcYG++/BoBTAS5tbLFt2kj3/hsX1LDqdG+oerOJjXmPvkpN/LNUavRDOrWOB
         qu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843971; x=1788448771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSHoAtU8dddLTKoCSKrkez3cQvXSaxG/ZVd2XecEP58=;
        b=pz6FDjTNhfFQKVqz3Vm78GUejxW2gRX3+GnRLyatRZH+uwBId6KJ49ZQQrdfL18Keb
         cAaZLP6Qy9fuQ1THkWOZsDDMTmSDGcnGN8aXluRl8t5T8tO22h4OCZbacmnk28WqABH0
         xfqGaxyX48Pz87b52c6hpbcGbhJMYiUYDJVLzohHOtK7f3SOEd7tHR3YzbQWCxekqdMf
         v+aogVhY9CLn7r8Ynn/WYl13moFLJmJMPr714eYZ9fUfGB4YeKy4d19amod5x0nWMxIA
         x2iERH27svGN8G+oBQSrULosLZZu0K0AFXDCofa4sIAW8roC/J28mQW25yc6RnEIasZ8
         cO0Q==
X-Gm-Message-State: AFuF++mlBLQGVPYxErDeGcraaPn/htRWqNnirLmzneGvo5qhx66rHRVs
	Nf91UpX8o1N8h3KwUbI/vhNH5X/5gy/95sob2JgzJHftmdpclBA23U9FzDlMXg==
X-Gm-Gg: AR+sD11QWlvjwhbRF8nUxEOrlRh9Lp2e/+o+8rMS8R/ee1wcHoGQCC6Od7ry+27wa2g
	sZ6pgdlxBiPnnx5u22NO9XfQRCiFDdxOGxdvRImKGvEU4Zu9Jn2wbm5MRHRdLIfJPJ8b0fQQUMo
	lgIIhef5X4rYa4qeJzz44xdLHbJI7OTsQEOmrPqZhSV0DbRo20hTG7+7d7hepKGbPTCQu8PVyU3
	lHthLiIyOj1Qg9myc7r8FU8qoDuVrU+Ioe4aCq1+y72uAW36w6pqf2MGSf8FfMtpyaMtSNrp1WK
	JRb60ri0iD2Yuxl6hDMC1dRrMDOGNMN2VHKRsho0Dxu50BVpqwu25GfayfG8X1sMxZf/tzzDsjB
	tCPkutyUNlL/eTeJSj5X031aPIqmdrWMFWs9KzHS9OGEiRSlROoV1HNAZrvE/K2Qc0nF4s4zl8P
	YkA3FwA+tV4Cubo1liIZpjPDcTD/mBRrbjVOd/Skox3bXtGa0ZX/h4PQkyLv/XYYmrWGHO/On+3
	ivnOWNDwzOMS0zgeTQyZzMOkw2SW5qrGQ==
X-Received: by 2002:a05:600c:5252:b0:49b:9113:e04a with SMTP id 5b1f17b1804b1-49b9113e19amr17664215e9.1.1787843970099;
        Thu, 27 Aug 2026 08:19:30 -0700 (PDT)
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
Subject: [PATCH v8 03/20] xen/riscv: Implement construct_domain()
Date: Thu, 27 Aug 2026 17:18:56 +0200
Message-ID: <90ebd418b376cd7b3dc7f234f76f131072417bd9.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787836900.git.oleksii.kurochko@gmail.com>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1787843971-F06A72AC-F38FE7D6/10/73395122804
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
Changes in v5-v8:
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


