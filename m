Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354E2C79FB6
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:08:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413250.1643490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JuK-00013Z-43; Wed, 09 Sep 2026 15:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413250.1643490; Wed, 09 Sep 2026 15:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JuK-00013Q-17; Wed, 09 Sep 2026 15:08:16 +0000
Received: by outflank-mailman (input) for mailman id 1413250;
 Wed, 09 Sep 2026 15:08:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4JuJ-0000xL-0L
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:08:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4JuH-002k9M-Vc
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:08:13 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa1765c-8faa-0a2a0a5109dd-0a2a4508a5c0-8
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:13 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa1765d-f659-0a2a45080019-4a7de48ca10e-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:13 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c254f8694aeso186304066b.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:08:13 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:08:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966493; x=1789571293; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1oo8fqOn/g4Do2VHXYk4O/g0/dgS+YsUhtfJgbBmh8=;
        b=J7PuxVxCvCFogSroI+hEUxacjogC3onZyTiqd7EJi6IqSq0bDSdCNLtC3xspKlGH2i
         Il16esjFMbRE14XVtwnMXV2kPna9t9FIcOxH69HhXzsIHl3xi9EHoJfWTkpczIsL+cS2
         k8kISxcHN5xzEU0ETur6uE7rbNVX1fl/2U3OI6k/JP594Qleo2+Eb04KPK8RD6OIiI40
         OCJ/KTIO2EllaOIGmmcNq/glNLtaZtcG29r3IH4Gh+i4PcZnRiEg4NrI4O4XZz5YT5vo
         jYxl4nlQTGbqE6jm7v4KqK8aBr/+gyTGyVv6tqhBHbqfH/z4aiDT56QOqIUmCa6enC1N
         h7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966493; x=1789571293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1oo8fqOn/g4Do2VHXYk4O/g0/dgS+YsUhtfJgbBmh8=;
        b=SBwD9wSDLzfyP0HyjBD/dBAncW0PC/vo6gghGSIakA5sW6FvgAeYdGLhIvmdJg/bjK
         +oJCRlSS/ER+DsVvWNi4YH7nA8WAjNmn5qUjAX6Q347WZneWa7ASSeZNXX5kPRE2Io2s
         34mOqFVltIHRFTeEAC/5oaAnf7NNb59u61s6RC96p9G9LlMNgKbS8JQsd/LWHoTXTWQr
         abYTT7phfMPwYWjczExVSOjy/49E4klpFfcl7p++U2g2hD9g+y2p1fXowY0bgUFG5BPp
         ZYWHFMUo47+ZZ05ugGrH987hCFDEY2Ff59Dy/uP69PFzeHSuHg//oS4dZVWNKMDzG3yE
         M0WQ==
X-Gm-Message-State: AFuF++k2K4LNmRNswB8GyhgDUI2+yOzOAZLVfhqWAtaY0wKIhdXZrP8e
	cqhqWT9r17V/QsW6wciIFhi7DfPFp4Gj2irlZCAm17ylpdyIHTANyh0ukyiZcmoP
X-Gm-Gg: AYBFou1qnlT+Z+Str+OhZXVBJMN0cePynA+jb060rmvgDKH3YYTX74Qm1ZWiJ4YHzDq
	I2Doomp5aIAbWfAX3htwmMcrkfVb/OOTQx1dt4EIY4+KiglKGqnIFjFubaF4wx6Q/ktqn4PJmI3
	tPg9ImUKEkxdjj0Lvwqkk/quN3DiK1Tl1/OyLR+kvgVeg6mYVX3+eFw6n3ZHrYhLwL8D1Fs/22U
	oDAb1TTbQpGtpKVf7pF40MeX0pdGLvXbpCXN33tU0yXsABR6W7y0as2HRTcXIwK+2Ii76Vgtiy1
	PLHkoOVNsiJfFvWdrW0fhE13j+Y/5i+gT6+x2TqrUz5I9XnTijoPh5frMhK0l8kiyhxw0DjZ0tH
	Hx/vXnFSmaNIdsADenWF91m883pNWeYvJLxd72yI64C5OUc6F5peZpNBTAZWYQs8ZdtIAl9RXL1
	YNjDG8souJexD4NUM3laqBU1BZw6FblR7AsTBOysXWzSRroSEXSydVEIflstp8MHGqvKxDKfj9X
	G+yEHGx8YIMAOQNgD+ovTIE+kjZSA==
X-Received: by 2002:a17:907:3e0c:b0:c25:f7db:4bef with SMTP id a640c23a62f3a-c2904519fdamr700357866b.21.1788966493404;
        Wed, 09 Sep 2026 08:08:13 -0700 (PDT)
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
Subject: [PATCH v9 03/20] xen/riscv: Implement construct_domain()
Date: Wed,  9 Sep 2026 17:07:21 +0200
Message-ID: <5e84ec86b5144a7387638fea98548a83db2ee03f.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1788966493-D5F4787B-83A6C472/10/73395122804
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
Changes in v5-v9:
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


