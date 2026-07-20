Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FD8C4452E
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 16:00:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366954.1616792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPt-0005jA-PV; Mon, 20 Jul 2026 16:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366954.1616792; Mon, 20 Jul 2026 16:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlqPt-0005iM-LY; Mon, 20 Jul 2026 16:00:29 +0000
Received: by outflank-mailman (input) for mailman id 1366954;
 Mon, 20 Jul 2026 16:00:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wlqPs-0005TP-HB
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:00:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlqPr-00HTTh-UK
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 18:00:27 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e4612-e002-0a2a0a5209dd-0a2a450abd5a-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:27 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a5e461b-f2d2-0a2a450a0019-d155dd2bc516-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 18:00:27 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47640541585so5210877f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 09:00:27 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63edd7d3sm30084673f8f.25.2026.07.20.09.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 09:00:25 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784563227; x=1785168027; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcKzxBSEA3zmGWed+Cw9No+MDgy3l+QGW15O4E+abXs=;
        b=oAxT/Z1T0CBfYC5xnr0p4IN1SJwiDAiqvTSGJHXVCgatFHLvLHgJ1KwDY5VID0EiF8
         gR5ZogEZtjak1FlxMqHzg0W2V0Ar7ub71SdjEBcRZq+C2CJYxy4CDQx2joxmBvWbcAft
         gf9dMj14W8BnGcQZRRdzwmtc8bl+o8XZO8dtilXTnX1gXo6Ry016RHG7Xx6LXDxma/6Z
         gvFzackoWvnsM4QpIUvR6sFsUYyZ6Y1r+2JKaXXat0cKdqN129p/d5By+Msp8VdtWgp7
         rsHSsmPahb0p3CTBNfb2EttdKvQogYlUMgksFIhvQhc/WwZw81bXxhgTLla84v7MFItb
         L2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563227; x=1785168027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jcKzxBSEA3zmGWed+Cw9No+MDgy3l+QGW15O4E+abXs=;
        b=gkOVG/nCcGXINpvTKo3rTM//IAPrKi8+ssBkBjHOEvJixZrUpdHMdj1mwIz9aPi2Tt
         M8MibfkEuUIZw2v1lT6AhwSxAJu3rCDpwIFasrSAEzXNXZY6cMrd/x0k3znruzgbHJWp
         Fu0gN7RRvYoRsRQslqReZik9RaGFDadh7jJxUetlbVTtkX/YLgPbVpkLJC8AtQti2AZj
         3za7vhoF1cCfcf7QLisLa7CLxRssfY8RjrGOto6eXTOQUVzGWvPK5X6uBZo48hrdunNS
         ZFexk2PD6yJfg2w1yHBluDQOUyQVk0XtTpBUJ6Jh3kFy32cxN1N+SS0yQ3MuAbBpiRk+
         Jpjw==
X-Gm-Message-State: AOJu0YyWUL2y4R8514rITXy8ImCbUZdh4VAAQD4qlcUohJva/+pBgQSD
	/Nj1qcSdGcvhzz3ZkJoxcX0LOXk9KOarDd2y2HZnJfIHGcENhVRfCE/suZ6hkA==
X-Gm-Gg: AR+sD12cPFbvdXvO8N3orJ9isQbsr0ZZouu0vh+Fs3edMNxlxuPqvmLL3FZFxp56Z4+
	kZDuRMiihdTcvrVBQuje+Ld8gIK21VPnD/PEF6rJfAZJvlKLZ8R9UIOKkS3j8MzJ5iVDiM93E6C
	CCRB3SI91Nh5ulyUfyWCny9FRHnB6+cq8JdUIVM5ZZlk5QtMymVL7umDiJoXxvoftVn5G2r3KTl
	k6v6CzTtSDn7K6fr8Cy1fJvXsjoAoiYbhLvwBFiiiLULgq5zTLQUMqBmPkGlZL2ZO17/QlgbZT6
	KH3I38HT9177CI4wnGH+EY5/T9hjRZ2MP19XaAUXUCjD8k0EerXOSYabF7YMSHPicA9j6rZ9tOW
	VbZHeFZnkM+hJ/r5yeLHq2ZtE+QjjbWNiBEgbOu4yeRs8tEzs4VxmktsxY1B1ARtmckJzTMakMj
	7G4swNDHcVRBhKSrlVUSgh+EjgpxppwIe0ZQy2VMXekXyiz0I=
X-Received: by 2002:a05:6000:4310:b0:47d:ecaa:3f97 with SMTP id ffacd0b85a97d-47f6233db68mr17060164f8f.45.1784563226487;
        Mon, 20 Jul 2026 09:00:26 -0700 (PDT)
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
Subject: [PATCH v6 07/23] xen/riscv: implement make_cpus_node()
Date: Mon, 20 Jul 2026 17:59:48 +0200
Message-ID: <4d7eba7501a43727cdc30efcff56f422c1bc376d.1784559209.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1784559209.git.oleksii.kurochko@gmail.com>
References: <cover.1784559209.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1784563227-593C4CFC-F13F8CD8/10/73395122804
X-purgate-type: spam
X-purgate-size: 5924

Implement make_cpus_node() to create cpus node for a guest domain.

This function is going to be use by common dom0less code during
construction domain.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
 xen/arch/riscv/domain-build.c | 125 ++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/xen/arch/riscv/domain-build.c b/xen/arch/riscv/domain-build.c
index 5f6f4b6248a5..8be29d9331d2 100644
--- a/xen/arch/riscv/domain-build.c
+++ b/xen/arch/riscv/domain-build.c
@@ -3,8 +3,11 @@
 #include <xen/fdt-domain-build.h>
 #include <xen/fdt-kernel.h>
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
+#include <xen/xvmalloc.h>
 
+#include <asm/cpufeature.h>
 #include <asm/current.h>
 #include <asm/guest_access.h>
 
@@ -48,3 +51,125 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
 
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
+    char *isa_str;
+    int len;
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
+    if ( (len = build_guest_isa_str(NULL, 0, d)) < 0 )
+        return len;
+
+    if ( !(isa_str = xvmalloc_array(char, len + 1)) )
+        return -ENOMEM;
+
+    if ( build_guest_isa_str(isa_str, len + 1, d) != len )
+    {
+        res = -EINVAL;
+        goto out;
+    }
+
+    res = fdt_begin_node(fdt, "cpus");
+    if ( res )
+        goto out;
+
+    res = fdt_property_cell(fdt, "#address-cells", 1);
+    if ( res )
+        goto out;
+
+    res = fdt_property_cell(fdt, "#size-cells", 0);
+    if ( res )
+        goto out;
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
+            goto out;
+
+        res = fdt_property_cell(fdt, "reg", cpu);
+        if ( res )
+            goto out;
+
+        res = fdt_property_string(fdt, "status", "okay");
+        if ( res )
+            goto out;
+
+        res = fdt_property_string(fdt, "compatible", "riscv");
+        if ( res )
+            goto out;
+
+        BUILD_BUG_ON((sizeof("riscv,") +
+                      sizeof_field(struct gstage_mode_desc, name)) >= sizeof(buf));
+        snprintf(buf, sizeof(buf), "riscv,%s", max_gstage_mode->name);
+        res = fdt_property_string(fdt, "mmu-type", buf);
+        if ( res )
+            goto out;
+
+        res = fdt_property_string(fdt, "riscv,isa", isa_str);
+        if ( res )
+            goto out;
+
+        res = fdt_property_string(fdt, "device_type", "cpu");
+        if ( res )
+            goto out;
+
+        /* Start of interrupt-controller */
+        res = fdt_begin_node(fdt, "interrupt-controller");
+        if ( res )
+            goto out;
+
+        res = fdt_property_string(fdt, "compatible", "riscv,cpu-intc");
+        if ( res )
+            goto out;
+
+        res = fdt_property_cell(fdt, "#interrupt-cells", 1);
+        if ( res )
+            goto out;
+
+        res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+        if ( res )
+            goto out;
+
+        res = fdt_property_u32(fdt, "phandle", alloc_phandle(kinfo));
+        if ( res )
+            goto out;
+
+        /* End of interrupt-controller */
+        res = fdt_end_node(fdt);
+        if ( res )
+            goto out;
+
+        res = fdt_end_node(fdt);
+        if ( res )
+            goto out;
+    }
+
+    res = fdt_end_node(fdt);
+
+ out:
+    xvfree(isa_str);
+    return res;
+}
-- 
2.54.0


