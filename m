Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A10C61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 15:20:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400814.1636395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbt9-00048X-Uv; Thu, 27 Aug 2026 15:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400814.1636395; Thu, 27 Aug 2026 15:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzbt9-00048P-SA; Thu, 27 Aug 2026 15:19:35 +0000
Received: by outflank-mailman (input) for mailman id 1400814;
 Thu, 27 Aug 2026 15:19:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wzbt8-0003gq-94
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 15:19:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzbt7-00Fhjf-MK
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 17:19:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905555-e002-0a2a0a5209dd-0a2a4508e812-40
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:33 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a905585-f659-0a2a45080019-d155dd2fb982-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 17:19:33 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47f84023916so784137f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 08:19:33 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28f5d01sm10049148f8f.32.2026.08.27.08.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 08:19:32 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1787843973; x=1788448773; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xQsUVTTJIfUyEn5waDQw6z9DwE5RwUDFgt9SnUa9c8=;
        b=j8lukQxuS/NO9x/TTrEJNMWAV3bS8kNaez5NAmJ4QQ96xvicFQ5qGGJQtxoEaHiOBk
         BtTLzcjzkT3gJtGc0R8ZYXxmq62EGSXgi5mpXp2gaktiISn/4bVJiQg+w36dBwv7/Vmd
         LJGxnsBsNhQbFUB9GufKU4yM/PnZ0rnXbypxFC0O/1eDOW3EZcIPbE9L9yPhYwSvdb2v
         V/TDOdYK8Kq8+Z7AO8aikI6KQAWUftmSvczdS+6baIqYAolTRtiGs51186Liz8sPrQcl
         h8ssAo1HtOxc5OqTmGrSlzjWfn1F1pxSIckUnF6ZDBn/JVk1Mese+oI8/JbRS4Z73FR6
         FRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843973; x=1788448773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7xQsUVTTJIfUyEn5waDQw6z9DwE5RwUDFgt9SnUa9c8=;
        b=Fia9Cj7sK0+k8g5XZ7cQwzNCvynw+GVCDMoXDwYz+lIEIpBImtHiYA3CG2+vhdfDuZ
         CGFB5zQONFjvResTujJ2LgzAXrJIVUEdWYo34CpZDJ5mGpiUvmR1mvbKuAVgEtsqKiSW
         HJkiAjkJEe9uHMUAwDV8YwNLbz0+xt5UgSsu64Om+taBlN69nqmRtDvVK5qkuZh+K064
         UtWxpFCgQ7qHPb4/TcZ0lBFJcB0g7nDj1bBFl0WvINzv7tQXrj1hpd9+KUeKLzyPR3gt
         M747gXeyp2u4tQgp3cH1SX6GmpTmWzqWzw6p8xu0CTY5+XhEuFD16xUomAzaEhWEpO6w
         kuQg==
X-Gm-Message-State: AFuF++l9nXudgzsxfn95fLfyBsbys/eMLStEuyTOCo2Z4DYYktq2+uxi
	7/o/H6BkuiUn2Q9X/1qoE34WvCAYxntEp2wi2ZB9ZUiXuyiFE9TPZN6q5hEKUg==
X-Gm-Gg: AR+sD13gx1y9QxPKYgj8grEww2L1z8US3Vtknz4JzvPoD7+IQThUHIEJgLAZ6wodVUW
	G+O+yK0RquaeqxbcI8tZfMdljA9e7TYFs83p0zyaOodTgNCY4ziMZDfBikYxvtf8Af5b5bSlNV2
	itGsqG4eJSi2t5QaajYtIsfv525K112S2Hk0A2QtyJAPPTDiDv5stSfXc7OM55xlQqHeCMTzdKu
	jpw1jzroDlP/7k/Nz2+z4VBcgn5BzLV1rB/6o20JxLDwkFoSdwFIuHSm/1Z5I5uRhm5y+kW71Dd
	Lu5cMDI0Emuuh3jBlLSEINn/u/dEWZUQg7It5TK5cFyKOeK9ZeTnQ453i6LRygFK4fomOF+Xq6p
	kgEDMyn8pwzCr4uUjvmT6nioITofVP8oTskZfKhTGYkholAY2E8fkJAFaAuUWYqPajDNXFNKGDQ
	v+Yq/tD1yEyw+ZkqbPu1CWo/MUVxeCO5uA+pVYbODVfGsECvnNBUov7bWf3dSfOPp3U/oZsbDua
	Hb0ycxl2MntiGvEYnMzjqLg3iaKUMakAeV0TCF2v7o=
X-Received: by 2002:a5d:6f09:0:b0:47f:d0fb:ea40 with SMTP id ffacd0b85a97d-482e271392emr23378946f8f.21.1787843972623;
        Thu, 27 Aug 2026 08:19:32 -0700 (PDT)
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
Subject: [PATCH v8 05/20] xen/riscv: implement make_cpus_node()
Date: Thu, 27 Aug 2026 17:18:58 +0200
Message-ID: <05b604b2cb8449c538f64fe56dbfff985dd003dd.1787836900.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787836900.git.oleksii.kurochko@gmail.com>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1787843973-CC57487B-196DC0FF/10/73395122804
X-purgate-type: spam
X-purgate-size: 6164

Implement make_cpus_node() to create cpus node for a guest domain.

This function is going to be use by common dom0less code during
construction domain.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v8:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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


