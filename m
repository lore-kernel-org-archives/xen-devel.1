Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADCCC55822
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 15:48:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382265.1625636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNT-0007TP-Md; Tue, 04 Aug 2026 15:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382265.1625636; Tue, 04 Aug 2026 15:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrHNT-0007Qz-DD; Tue, 04 Aug 2026 15:48:27 +0000
Received: by outflank-mailman (input) for mailman id 1382265;
 Tue, 04 Aug 2026 15:48:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wrHNS-0007KG-25
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 15:48:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrHNR-009GfZ-F6
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 17:48:25 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209b0-2eae-0a2a0a5409dd-0a2a450cd344-36
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:25 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7209c9-f479-0a2a450c0019-d1558032ad18-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 17:48:25 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-49558ce01afso26773375e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 08:48:25 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49949fcb46esm116430355e9.5.2026.08.04.08.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 08:48:24 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1785858505; x=1786463305; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtCr8wU2t2GJWhHJ8VA4gfjPYB+rOSURYzxYVnJJT30=;
        b=Ks6kTuoOKfbkOPaqFnIMGRYHtWGNOL5PZdg9hLvfUylqpaC5qVz3RP2x4Z42TI875k
         Tr0fppbdAUwUVq4zU186c3UBIfmr4SfvtbkEYhW9i747ytaEDADTB3Zrm0uX9QqBxaOZ
         03sLgVZuj/bpLyFtHA4anvYHeScykWsh3YyHFBERcd8qvkn7+F59tg8yEbu3r0f34wcj
         jyi44PjNxZ6aTLVLMes5P8HFOt17xBJAzdA8S/BfmcsWiO8ZpWDEB7gkl0rxb31P6KW/
         X85B3RHKeeCywUnzwLGwOuoc4Ag8rz0ARrhERHOg/vMEZyR5E99XyHkhkfwZ0dfyypPW
         pLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785858505; x=1786463305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtCr8wU2t2GJWhHJ8VA4gfjPYB+rOSURYzxYVnJJT30=;
        b=Z2H/rPGbEDzOAUDuI2mdcOsL4DJyIPkD5lctirG02Rk5I9n539aV8sTYVXdBoraehx
         9S3JyQQ2J+x9UpMpe2gPv8rd3Ii6IKj3Iye3HJxi9kJpN3iHu5uBl27vaQzMSFwKI0ED
         DiaS1KcuaSJf1NkB3l1uufHvNIfSxx5g7c/P49v0azjwPYmwm1NB83uxLL/aEL3mocCV
         pzytKDBf0dMnhZr1sq2kBp5TN8xVsJUaUqnHjc3XM+Uw3Zmn4ySeDlVm4e6JYH87rg3z
         2gPPskBjM8rczrGqBJiV6qo93DdCXWj0jHdCHCIPJ+kvkys3tVIiBxhuJ7QDMr+txKQI
         WM+Q==
X-Gm-Message-State: AOJu0YytdCqg9lxqVpAh8z0XXoYkBMByw/6oD6rhUKmVu81A+fXbJk2t
	BQHggT7S+Pbu6I/UY2lJiCakSZ4jmIB+jQMSJjCoEVp5xjTJ11I8Y/wZ556TmQ==
X-Gm-Gg: AR+sD13GTTpOQ+AB0R1mea0O2+WUoMpx23LnsfC5CO0iKl9rC5aFhnGebZtxaKEEO5+
	ArByreEMrbs6kpgn7UGY7Tfa9g2mYCWzStFEhNlv+qUzfMyIVOCgIiD23/p3pm850tSUZbBov5V
	Kv0VnoXSm05yPd/9VP9JKoRu21M9wtdCD115d2cf5hHz/+s+agMLsdEJkIX4hWfYP44d2SiohVW
	H6XLbRxHiDSXQVJwafpoeUFK13zPRWRQu5ksZg5J5UlI6jB2p1DI7sqyqb0d/TamCS2suscZ/qn
	qgMNqqV4Ol1V+xjy9qOnFy5FYOPsdl7s3Rz0ONLABPKMwGqJR8btPw070jdzd7ZpR9eebYE3aLc
	c2JgsJEv9Xp64uG+cb0RRZ4XrfESKCEJUEANotnBM7t4Yc7jW7jpFSb9GeVTSaQjxA4ZX1iV4Gd
	s5o9U0X0YEUIC2A20fmngOHjAx1Hb4k9ccFEm+JoC2qEEIIh2VNk9qCKZOvXUZvbcFdV3N3QOv6
	StonN0onK+o+/1gZ/OCwPFxIXOsRaP72Q==
X-Received: by 2002:a05:600c:c490:b0:494:596e:e8c4 with SMTP id 5b1f17b1804b1-4980c67d1cbmr317723855e9.17.1785858504857;
        Tue, 04 Aug 2026 08:48:24 -0700 (PDT)
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
Subject: [PATCH v7 05/20] xen/riscv: implement make_cpus_node()
Date: Tue,  4 Aug 2026 17:47:55 +0200
Message-ID: <4df84f91703588ca55c2c0fa73cadb9f94437571.1785836421.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785836421.git.oleksii.kurochko@gmail.com>
References: <cover.1785836421.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1785858505-02CDBA5B-A8231C93/10/73395122804
X-purgate-type: spam
X-purgate-size: 6049

Implement make_cpus_node() to create cpus node for a guest domain.

This function is going to be use by common dom0less code during
construction domain.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v7:
- use get_guest_isa_str() for the "riscv,isa" property instead of building
  the string per domain.
- as a consequence, drop the isa_str/len local variables, the
  xvmalloc_array()/xvfree() pair and the <xen/xvmalloc.h> inclusion; with no
  resource left to release, the error paths now return res directly and the
  "out" label is gone.
- s/sizeof/ARRAY_SIZE for snprintf's argument.
- Drop Acked-by: Jan B. as some changes were done so it would be nice if
  Jan B. will review them again.
---
Changes in v6:
 - Update the two build_guest_isa_str() call sites for its new
  `const struct domain *d` signature.
 - Drop build/tools/fixdep from the patch.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v5:
- Drop Acked-by: Jan Beulich <jbeulich@suse.com> as extra changes were done
  because of the changed in prev. patch.
- Move isa_str allocation and construction out of arch_domain_create() and
  into make_cpus_node() as a local variable, since the string is only
  needed during FDT generation. Use a two-call build_guest_isa_str()
  pattern (size probe, then fill) with xvmalloc_array, and convert all
  post-allocation error returns to goto out so xvfree() runs on every path.
---
Changes in v4:
 - Update the comment in make_cpus_node() to match code style.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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
index 5f6f4b6248a5..1af4c48fb30c 100644
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
+        snprintf(buf, ARRAY_SIZE(buf), "cpu@%u", cpu);
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
+        snprintf(buf, ARRAY_SIZE(buf), "riscv,%s", max_gstage_mode->name);
+        res = fdt_property_string(fdt, "mmu-type", buf);
+        if ( res )
+            return res;
+
+        res = fdt_property_string(fdt, "riscv,isa", get_guest_isa_str());
+        if ( res )
+            return res;
+
+        res = fdt_property_string(fdt, "device_type", "cpu");
+        if ( res )
+            return res;
+
+        /* Start of interrupt-controller */
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
+        /* End of interrupt-controller */
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
2.55.0


