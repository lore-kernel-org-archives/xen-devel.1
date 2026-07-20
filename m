Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954CFC44524
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366951.1616774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPq-0005Av-8k; Mon, 20 Jul 2026 16:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366951.1616774; Mon, 20 Jul 2026 16:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPq-0005Ag-3X; Mon, 20 Jul 2026 16:00:26 +0000
Received: by outflank-mailman (input) for mailman id 1366951;
 Mon, 20 Jul 2026 16:00:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqPo-00057U-PT
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqPo-00CGfz-6M
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:24 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4617-bab6-0a2a0a5309dd-0a2a4507ca5a-2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:24 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4618-b4ea-0a2a45070019-d155dd2ad4e4-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:24 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47f7444576cso1008605f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:24 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:22 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563223; x=1785168023; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALyLLkJ/FueWGNpU6AdvBuLz9jp+wMzaqsUT95MAEFA=;
        b=htaIcNgLnZXiqy5j+OrYU822uiNoKhJOC9eItJFBg7tM1tjWCqlVdFXEXhR0ExmwvZ
         p6aJfN1i709NGfV369VNu+HJrOqcT8Y4EJRACLQDNm/7ha+yi/HG4IcBZWGxgo71W+5D
         lJivWHdCeh27zi0KSc/KJPhFX/vytgKJ7NakKzaGH0U5YpRENlVwaizvqW0W9d8bBYt0
         +sH2mqs5ilAcPDCCEUebKsPorqqIXjC43Keg53KdIJGE+5+q/5ZL+b1oBpVXQD5fCP3z
         Wak1zVo+ziQeLTxS8UetA50PjPohdL2d5j+EDlUnqVpZnZRDGW71nfM1Fq4Z5XrbNmtJ
         +YwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563223; x=1785168023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ALyLLkJ/FueWGNpU6AdvBuLz9jp+wMzaqsUT95MAEFA=;
        b=Oo3ba/6uYh3tN40n9La5WAYOKh/PhNJ3u9ELqJcTncn111W/+FOmrIiZgzDdZ95Ljc
         PHuC/dCOjFhZT/D2P3Q50nw99fIdJa+3UwgBPtQd9Iltn06flArW71kz1Ag1wm5Y2AdR
         9CVE8V9+BmVnVkVvNiptENlRcZm3oVDIxjQaSHHq9DBu1YrOMSZqiYKVynqxshkFF8Sf
         +P1TNGOAji7zXaTIYpjIcrwQPM+yCwC1Q8hfndSBI5rbzcFUJ7YMWCYk6+EMGyZ6legP
         4pZUQ4bLTFVjoNCfz40jk9RO7qZhOAavqdYGus2BoLQsmR0tAuUyyXspKZXgNMrcx1qr
         MSfA==
X-Gm-Message-State: AOJu0Yzb8Y2kp/64WRZqfPMNQ597kUINA2W2KJCnhaMEeNwwfSuSs7KL
	3IcmZS+WFmk7tfxmeIIQ2BXXK3xeoJkI4AZchHaywpD43F0exHd1rRVvtZpGqw==
X-Gm-Gg: AR+sD127EPyLOQo8qirHQJ0rTxlMCH7+TreSNbHGq0mVhJ67RNyrxMoUgbSrZRJkRFZ
	0fT49cn4FVDRhLPR9ACLHReJtKEUqd+R4q+jmofnWV2fy02brFgY8CKe9N7Uogdk+BWzvLo0nCh
	Vpd1a3Jl3J8i8FiCx86BCMQxhGKI+z7c0FAqzNiqI9bxV97sUacS+bGmwi891wTFA1Wb/BD8Yp4
	t28SZJHJxwUV9auDbwOLlz/gwVG2lAbtTonwzwKdSWwq5cUEGrj5x4YotnJrysjzOVVGyrgGGKb
	dH+oFpYYynO5XWqdCgQ930Ae8OZzq8QYSCHGuf3yS+veviyQLG/zdA0hAz3/RmOM2HOtgBc3YKX
	alzCTDAnT8fC7cN72F7myp0Eapf5XTNbKsFgHx+441DfEKC6ZJgfJWJ9urbLotWZmzBp18U0JlS
	t8M/hCYow6tMnxDQN9+e0ybF4ph0ncxIHkZYavOyui7xhPxgQK99zBtB+OnQ==
X-Received: by 2002:a5d:6285:0:b0:47e:f4c:508e with SMTP id ffacd0b85a97d-47f62330d27mr12254241f8f.46.1784563223545;
        Mon, 20 Jul 2026 09:00:23 -0700 (PDT)
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
Subject: [PATCH v6 05/23] xen/riscv: Implement construct_domain()
Date: Mon, 20 Jul 2026 17:59:46 +0200
Message-ID: <a44f12eb7b2a7c50248da5ef7e16bb88584554bf.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1784563224-A62C4AE4-4C6512DF/10/73395122804
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
Changes in v5-v6:
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
index 8f7fd625dddd..fd5e499eb4b9 100644
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
2.54.0


