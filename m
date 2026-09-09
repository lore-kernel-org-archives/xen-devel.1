Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE6CC79FBF
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 15:08:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413252.1643509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JuO-0001ZN-Q6; Wed, 09 Sep 2026 15:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413252.1643509; Wed, 09 Sep 2026 15:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4JuO-0001ZC-ND; Wed, 09 Sep 2026 15:08:20 +0000
Received: by outflank-mailman (input) for mailman id 1413252;
 Wed, 09 Sep 2026 15:08:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4JuN-0001Tv-Bv
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:08:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4JuM-003DHh-Oh
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 17:08:18 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17658-bab6-0a2a0a5309dd-0a2a4503bcf8-28
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:18 +0200
Received: from [74.125.228.140] (helo=mail-ej2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa17662-fae8-0a2a45030019-4a7de48cb13c-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 17:08:18 +0200
Received: by mail-ej2-f12.google.com with SMTP id
 a640c23a62f3a-c254fa663c2so45963866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 08:08:18 -0700 (PDT)
Received: from fedora (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c261f673000sm709991666b.24.2026.09.09.08.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 08:08:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788966498; x=1789571298; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZgRpdRy/E2EC0N94y/FzcJNCbvvQyl1VngGFLh0kH90=;
        b=p9JNTyDHwVirKvvMN/7RpnT1x39acqQ7AXVm0eLPPRPC20KmPeCCb92agyW9Zq/d6r
         tMlC3trRFokr9EUSMN3y/EiLOwfQznfNBVMkigN9qwt24vDmP4Zf1E0Aahe5vnbR+2Co
         uSa6xm8LvR4Wlwa/pjtXAGZ+R4dil2t9UxBv/bQgHkbvoNqkpG+beFETyDdID2d1XkaG
         sa6e0w0eLKkqZe9+juNcIyF2LLo7+4+z0PXC6ClwMBMchDANQgwT7WkiUyXvKw5f9IKA
         ufQDiinWs3GGwHc0Feo4Z3ng9GEf5zoVcSOKa3jthfXz9grfTSygx6uM+Tdz7ZXc+fhl
         ckKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966498; x=1789571298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZgRpdRy/E2EC0N94y/FzcJNCbvvQyl1VngGFLh0kH90=;
        b=b755eauxEsdj62KV587M03d3WqnWMoRiG309GsEa2T2MDyt7rCj/3fozFmXr8xkogM
         XUHgSADPp4kKStsH+tz4p7tweNF97Tmix8+tI8DetN299sbJOesOshrTXfwVBKASXQep
         z2QX39GtWL80PNFhOiX7/k0Z1W71WWGg+PX86qovSmryINguDSk8dyAFCzJrNMjrDl4w
         c83Iq4se/WJp+O6WEyVjtfaimEX8bbZZaScc9VvfQ2oEbOliKwsZsOVV49sPUb4BzXKT
         osUgxe+e7RaNXVaN7VmQBwIyjZYvlSHdJSe2KceR2ccPeGNoM0jlc2ldjuKYMOZWxxp6
         NZcA==
X-Gm-Message-State: AFuF++kUMo3G1TWZE/9ovqRPt4O0nfQG9+De3jhN76iE3Dt0LkAFP3TH
	MRJH+uGPRr0nquy9BGU35W5XTdPdgpaq+mkdUxKSlpxkKb4qGY2KcVflBLXM0Nt6
X-Gm-Gg: AYBFou3WrEGOFrkGn53O822uajv/4hQNUigwmKgiRFaxIe0SnwyZXvhZpG1f5vmOCxe
	YufOfHxAlfbq8cUH+MlV+rBrcu3lozmVs5RfIfzG8swrTiOijlUvUnxjbV0gS6aHVzpxbj/sPCn
	wSxWjqKKquo0Nks2JylQ/gczS6nAe27htuu7LKuKg9++hpYWXlkDj0IU0kijBmWRNYaP2gjLMwb
	/xZXGNH7z/M7QsgxwPhEJokEksiAB+/hyaTvyy82nezyUHI03UUPAoWDwmvTpBFhDY7CCBpRByn
	Xbn6M8JJx74fTZ1A8nM7O8J1r2TEE+UyXD30EPTXOK+uUOk1LmDGNkPC/MNI4xVytnzJ3Ve3B9F
	55VRBu8NGE6OIrCg/tcUhLE9H6XjuahGozkNJ4Xq+8SsXYM59vrNnMbE/mB7yjOEI4Q5T7G1Gd0
	7rxlkk1p53/gxoVb/623xp+BnVuSO1VNGM4DieF3f94VT6v8lTZaN6K+FFqWP14xF465hHq02/X
	+wzHrh35Zt1ZmERluams6wjxY6tjw==
X-Received: by 2002:a17:907:728f:b0:c25:362e:fb8b with SMTP id a640c23a62f3a-c29419f9643mr142637266b.7.1788966498060;
        Wed, 09 Sep 2026 08:08:18 -0700 (PDT)
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
Subject: [PATCH v9 05/20] xen/riscv: implement make_cpus_node()
Date: Wed,  9 Sep 2026 17:07:23 +0200
Message-ID: <123512c9a3686aac6c3c97e5624ae98c4ad26f3d.1788876411.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788876411.git.oleksii.kurochko@gmail.com>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1788966498-6DAD44E9-4DA18F8F/10/73395122804
X-purgate-type: spam
X-purgate-size: 6219

Implement make_cpus_node() to create cpus node for a guest domain.

This function is going to be use by common dom0less code during
construction domain.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v9:
 - Only rebase. Nothing changed.
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


