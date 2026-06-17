Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E61CD98F0
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2026 11:29:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1340088.1601130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHb-0001zw-5k; Wed, 17 Jun 2026 11:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340088.1601130; Wed, 17 Jun 2026 11:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHa-0001we-RD; Wed, 17 Jun 2026 11:18:10 +0000
Received: by outflank-mailman (input) for mailman id 1340088;
 Wed, 17 Jun 2026 11:18:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHY-0001U4-Od
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHY-008nON-5Q
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:08 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328267-bab6-0a2a0a5309dd-0a2a450bd29e-22
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:08 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32826f-212f-0a2a450b0019-d155802ad5df-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:08 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so39126295e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:08 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695087; x=1782299887; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HM+/Kmq9xfOuTPDTM94hm8AgKViPa+UWHR51aZRBeLo=;
        b=ocgCGgOWNjGQ8BHrDu57ux/+WWUpFczaWZikr6U3+8MB0uSGfjEgsuUnKa6kbi95gB
         41fzniF2TZiEleFhWvKEtSbU5itV/erV5enZjRcBNw/v4YlFIBtwcwlCmzt+FQFE0hVu
         N4WHl6cbcOeB02px2xyVY6DEQf/mDm6mXb6aL+UWbdw0Jc3lbXOKwUOgv1G2cBZI56ZX
         1Sl5oZzzWlxAO/9bOdM/3MAx7LMVGB0WnrCqF4w9cE4QyEOAZUvB405hAEVjIxCO3oFb
         lWV8VVSx9NIpRbx6FyQaNOaUwwdcsk/ea+qMe784BVFsE8KkacG1dp3Ed6sEVEDm/vuE
         pyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695087; x=1782299887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HM+/Kmq9xfOuTPDTM94hm8AgKViPa+UWHR51aZRBeLo=;
        b=d5IU/MpjBd9hCIBw9z0cJmbvWroJssg2Ou5BAhX63hDfN7WADxrnYaVxYYpZCdPqaf
         DKy8wxRk4YNx3wot04Bo1lsjMm2Tc9lhcWOkM790rAtLruCd3d5n9CvlnEnC60QZQt92
         K4HdmI+xU5E7MO0gvVgt1k0nksoAG2gelK2AasL/BUTHM7SC+s42HFSBzBoSukAXhtrR
         rqOv9c8ZjNtrMU0PZWv8TEl+EGq7K1+NNdKS+yX8IJ7htwFKge4KfoMgthT9PySNCF63
         bxTzqNkPYtgpKHy3ESOmfHKzGh9zRuQg6KBeboM9NU8yDgHDb+8dNEPis/Ot26BTYAPW
         je6w==
X-Gm-Message-State: AOJu0YzNMs8AeSifWr1jwU7l4Fc2zzuLheU0BB/655MYTX9L7geEr5wR
	ijd+v8/rN/yXfPH8GYpgqXpFUcJeCwY+dAWy2Q2jQlgTS0bV2t9hT10/ud012A==
X-Gm-Gg: Acq92OEsk8fCOkWZGa3OZFGXU3CXEssEvpiNBw0b6cF4eZd/dZ8Z4B+dlwryzPY95j8
	MMCUZsa3VZwPG+LvLumBueZPm1Q0+iLs3JeQGqKh0mG2GZ801961NDb0fnEHG8Ukw3+8MOAvdPl
	Y8yIRQjyDZiRxlgJpm30rP3WX9lHRDs6W9epJkem/qELuCOIdShcbecUHlTBHPkOScUgJzIoAjT
	+nmIKv7JDPQYEU0mN1dRaNzSy+Aa2X0MqofkaMLkHm2wwWyblkRG7JtMLx0ik9lo0+ViKpogKiN
	dGEVTBH/QSkVQaFy4jsVuPBKzr5DhIPz+h2YPCxZLSnLOjmtb7v3kfwk54SQwcU/NqXpcI8E7Jj
	Mo8POc3gi3Lp3/tYwb6joY+ozxjuO+bs7HsuEYbYmUaw+/W77OsKT+CLiIEzV55fmkCC7hK/qMd
	E/ieFacYv7deL46LQPNNpVIIUPV4GgbmOFYu1OsRgUvNKpp6xLkhtqwTfJXQ==
X-Received: by 2002:a05:600c:a117:b0:492:2e48:81e6 with SMTP id 5b1f17b1804b1-492333a0258mr48820195e9.4.1781695087520;
        Wed, 17 Jun 2026 04:18:07 -0700 (PDT)
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
Subject: [PATCH v3 07/23] xen/riscv: implement make_cpus_node()
Date: Wed, 17 Jun 2026 13:17:35 +0200
Message-ID: <f871fe1a751551e8959554aefa6c6bbcbdbc5ae9.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781695088-23374F3B-CBC788FF/10/73395122804
X-purgate-type: spam
X-purgate-size: 4643

Implement make_cpus_node() to create cpus node for a guest domain.

This function is going to be use by common dom0less code during
construction domain.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Add blank line above make_cpus_node() function definition.
 - Move 'unsigned int cpu' from function-level declarations into the for loop.
 - Drop 'uint32_t reg = cpu_to_fdt32(cpu)'; use fdt_property_cell(fdt, "reg", cpu)
   instead of fdt_property(fdt, "reg", &reg, sizeof(reg)) so byte-order adjustment
   is handled internally.
 - Add matching /* interrupt-controller */ start comment; fix end comment to
   /* end interrupt-controller */.
 - Update d->arch.guest_isa_str to ->isa_str in make_cpus_node() function.
---
Changes in v2:
 - s/u32/uint32_t for timebase_frequency local variable.
 - Drop +1 from BUILD_BUG_ON().
 - return fdt_end_node(fdt); instead of res at the end of the function.
---
---
 xen/arch/riscv/domain-build.c | 106 ++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index 72cccb2c5c22..c1cbc4386312 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -3,8 +3,10 @@
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
 
+#include <asm/cpufeature.h>
 #include <asm/current.h>
 #include <asm/guest_access.h>
 
@@ -48,3 +50,107 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
 
     return 0;
 }
+
+int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
+{
+    int res;
+    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
+    uint32_t timebase_frequency;
+    bool frequency_valid;
+    void *fdt = kinfo->fdt;
+
+    dt_dprintk("Create cpus node\n");
+
+    if ( !cpus )
+    {
+        dprintk(XENLOG_ERR, "Missing /cpus node in the device tree?\n");
+        return -ENOENT;
+    }
+
+    frequency_valid = dt_property_read_u32(cpus, "timebase-frequency",
+                                           &timebase_frequency);
+
+    res = fdt_begin_node(fdt, "cpus");
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#address-cells", 1);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#size-cells", 0);
+    if ( res )
+        return res;
+
+    if ( frequency_valid )
+        res = fdt_property_cell(fdt, "timebase-frequency", timebase_frequency);
+
+    for ( unsigned int cpu = 0; cpu < d->max_vcpus; cpu++ )
+    {
+        char buf[64];
+
+        snprintf(buf, sizeof(buf), "cpu@%u", cpu);
+        res = fdt_begin_node(fdt, buf);
+        if ( res )
+            return res;
+
+        res = fdt_property_cell(fdt, "reg", cpu);
+        if ( res )
+            return res;
+
+        res = fdt_property_string(fdt, "status", "okay");
+        if ( res )
+            return res;
+
+        res = fdt_property_string(fdt, "compatible", "riscv");
+        if ( res )
+            return res;
+
+        BUILD_BUG_ON((sizeof("riscv,") +
+                      sizeof_field(struct gstage_mode_desc, name)) >= sizeof(buf));
+        snprintf(buf, sizeof(buf), "riscv,%s", max_gstage_mode->name);
+        res = fdt_property_string(fdt, "mmu-type", buf);
+        if ( res )
+            return res;
+
+        res = fdt_property_string(fdt, "riscv,isa", d->arch.isa_str);
+        if ( res )
+            return res;
+
+        res = fdt_property_string(fdt, "device_type", "cpu");
+        if ( res )
+            return res;
+
+        /* interrupt-controller */
+        res = fdt_begin_node(fdt, "interrupt-controller");
+        if ( res )
+            return res;
+
+        res = fdt_property_string(fdt, "compatible", "riscv,cpu-intc");
+        if ( res )
+            return res;
+
+        res = fdt_property_cell(fdt, "#interrupt-cells", 1);
+        if ( res )
+            return res;
+
+        res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+        if ( res )
+            return res;
+
+        res = fdt_property_u32(fdt, "phandle", alloc_phandle(kinfo));
+        if ( res )
+            return res;
+
+        /* end interrupt-controller */
+        res = fdt_end_node(fdt);
+        if ( res )
+            return res;
+
+        res = fdt_end_node(fdt);
+        if ( res )
+            return res;
+    }
+
+    return fdt_end_node(fdt);
+}
-- 
2.54.0


