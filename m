Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ABAC4450F
	for <xen-devel@archiver.kernel.org>; Fri, 26 Jun 2026 15:47:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1346277.1604782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lc-0001pf-Pq; Fri, 26 Jun 2026 15:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346277.1604782; Fri, 26 Jun 2026 15:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lc-0001oH-Gt; Fri, 26 Jun 2026 15:46:56 +0000
Received: by outflank-mailman (input) for mailman id 1346277;
 Fri, 26 Jun 2026 15:46:55 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lb-0001V4-Ih
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:46:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8la-00D1eP-VG
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:46:54 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ee5-5cb7-0a2a0a5109dd-0a2a45028256-18
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:54 +0200
Received: from [209.85.167.43] (helo=mail-lf1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9eee-5a27-0a2a45020019-d155a72bc5fd-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:46:54 +0200
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5aea367c965so1125147e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:46:54 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:46:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488814; x=1783093614; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+TCKMUSTuyvYICiXP6HL6dmH/uLiRs4XxAzoc6J/CE=;
        b=aFmNTRkeF13lSg79F+24Vw/T0BoRFYokJtbfv017PPU/0/NoFqwMvOE/cwyQqe6v2d
         MC2RYjB5H9Dh3YJC46rGv5WXiVfrSYYl6hu7m3qPf4A9DwDsoYlQWnok2wKJ38Ghp73v
         0I0Zw0M2S6b+VEia1wHeSPLjzQUzFlMC7d/R7Hu9t6ZEjFpx/W9kY5jREfamNGra1DNO
         WrIcQWvFK4uPF1iMJgrdMeaemJj9LD54TZzyAFbKW0GAdlThmwsOuLPahemwskjmfkVU
         63yFj7d1VekI4ZpN8a1NJ7ZufnL/MT5xjdFROVIZ/sWK3Z+4xMNjD1IPAcjcttnjdBK+
         ZXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488814; x=1783093614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0+TCKMUSTuyvYICiXP6HL6dmH/uLiRs4XxAzoc6J/CE=;
        b=l67ECE/NWASE2Jqhs2yEF62r0PoHJy/N3rM98wL+287WdxDc5pmIrtzpn/kWkC16/1
         Y0nFbRHTKUJfo+RHokRIPLS3zdzlr2w+Rq2glRkJZHpFldGl3jlbBW3abeb1E3IlAb5D
         /GhxQxxBkZyGLP69FRtPB+VHdgbHo5JPkIxsvrFhRBIb77t4yM9VgMJV3Om7H3m63OCa
         FIWTkaLaqWBlHGCfVCMrdH5MVOuHrpR3Sd+0qnhyOoRn4/q9aZyydw9O2YSXsgcP2qxT
         Fo+klLaHRDaMiF9ZAHzjFbCOq4x+aoIwlto8c77nav2D0u2oxXfIQu/cTDzW80xkuE0l
         qrsQ==
X-Gm-Message-State: AOJu0YzN5wbv0Z7PTwpL/6jxsp/c3E32Hdcbe2HWAt2xmeeyYS/PjIWk
	PF1TxpWLF96ApMfVlQQRwyGqIGRlJLkLVcFhDgtyoK8TEWZDuV6C+Zh5PlqKaQ==
X-Gm-Gg: AfdE7ckcL0Idn4P3Q4H/I1P5GUlsTJUI7cSxw1FugfLna5C8vezha0W2b6B4CBX4ocO
	8WlJOFOnG7OXWC523fyu3O/M6OUOpw5jQF9ctCQU4KNJZ7sa6mWNzvRpjmE2qpaJvRiw9/adV9B
	nZCnqA/scXRnTfxG0MoH8xWVsg/jeYTJKbFmXh/+O5+XdrrpmWzWE9i7gn4xvBK3IvVWBhQhNeh
	xa2nhKMLdw1Q4bKvSckfEgngb/dEA9eWozEOI/TFaZ/Pats0pZpF7zuzXgV4gUT5Ljb5PRXBHP6
	x+Ml0M3B3krfbnDttfps0raic4dFXe7s9pkhp/ByGHnCQnmH/VVL56wYmaK6oRY9tyBI8yb9ayk
	MlNRU//uqoiIRnFXSSnC3vHnVxemI2nMOm1xILbKMUDqTAUK560j0er5NoIBqy6ZZ3T5spJ2Co9
	r66t5ZsVT2RqB9itXKpWcDn+BU0mzgJMfmCtgchN5b8HrSn78TcT2iKYDErA==
X-Received: by 2002:a05:6512:651c:b0:5ad:317f:a9a6 with SMTP id 2adb3069b0e04-5aea1f3f8demr1909934e87.8.1782488814088;
        Fri, 26 Jun 2026 08:46:54 -0700 (PDT)
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
Subject: [PATCH v4 09/25] xen/riscv: implement make_cpus_node()
Date: Fri, 26 Jun 2026 17:46:18 +0200
Message-ID: <56211b75a05c8738d23caac9273ce40e39e8663f.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1782488814-4F1127C5-113466B4/10/73395122804
X-purgate-type: spam
X-purgate-size: 4834

Implement make_cpus_node() to create cpus node for a guest domain.

This function is going to be use by common dom0less code during
construction domain.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
index 5f6f4b6248a5..198a420f55a7 100644
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
2.54.0


