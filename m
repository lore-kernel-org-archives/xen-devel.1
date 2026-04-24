Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8BAFED3CD
	for <xen-devel@archiver.kernel.org>; Fri, 24 Apr 2026 13:37:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1293570.1571202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGGiO-0002fX-2E; Fri, 24 Apr 2026 13:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1293570.1571202; Fri, 24 Apr 2026 13:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wGGiN-0002fM-Uk; Fri, 24 Apr 2026 13:37:03 +0000
Received: by outflank-mailman (input) for mailman id 1293570;
 Fri, 24 Apr 2026 13:37:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wGGiM-0002Rg-6C
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 13:37:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wGGiL-000jjh-JA
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2026 15:37:01 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69eb71fa-5cb7-0a2a0a5109dd-0a2a4509da28-20
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 15:37:01 +0200
Received: from [209.85.167.46] (helo=mail-lf1-f46.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69eb71fd-2497-0a2a45090019-d155a72eac6f-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 15:37:01 +0200
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5a0faa0d15cso7756722e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Apr 2026 06:37:01 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a5241f6583sm3649078e87.39.2026.04.24.06.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 06:36:59 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777037820; x=1777642620; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeUlz7Qpf2B9MkICZ3XhoDDRV4QPAj1kbAZBfKIlP24=;
        b=AYM3+x8i1CyqgPAV+spfNGgmteZh8NLrT9c2BjeeihffZ9QTlsoLIgD/jm1G2RZjSp
         8dW3nUGFGmz8bpFRF7GPNXoJvS1aSZgeYx/8cxilkHsDZp8vPEskvmpWNhyCWEUfT3kf
         scMnDXECjyj7uDUeD2Yxyzz5dUDSMfLBI7w5UISBUeXvZqYTGHOA7OZMs31Ux/Smv6Qa
         y9ddyFuhHEZW6H2NP+UnGQfCPQTWom4d9hd9YK68qLRL/UVXE9JHd6RqMsVRJBS5Bdg7
         42+/VQQ6up5FMHQ0b7O4mpmO8NMOlXeOa7XYY3qJkZc9GVWQ0ff7A8iHN5S3LLodMfbb
         qHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777037820; x=1777642620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YeUlz7Qpf2B9MkICZ3XhoDDRV4QPAj1kbAZBfKIlP24=;
        b=oyNe639n0aOTOeoVrmtbHDHoAWR+1ylrLIMzFrtv0zexG9o52rizYs2raQpgEoE/hG
         OxI//jpc2qvrk06oPw7ls4hzvDC/+/cvWIonEkK1RW4Ypkp62aH67XEIQByDxcdEhpiT
         KS/7Pj6sslUzxoXoUVnpGjT7gYL80LbE7uoW/QPxXJI3qqhh4HCUVvEAAEJsk2NGNeCJ
         Oqa6YEHcQFWbYlWNU1DK2bUEylD+3vCzYDXlXoPvI85TxTBMhmne6I4Pkdfw8cup1kCe
         TombQfs9fgXnjU/lW//AxV8MylZYi19VUlL/H8xPLGa5tVyK/mrqzIgiCSPt52Kp7xJJ
         e/Uw==
X-Gm-Message-State: AOJu0Yw8MiTY5pSozOQgwefTNr7lXN2RApB3jF1qqJulxKG7SzWf+RWX
	gn8BdeZK3jXEYM1e0C08QN7YntxZIuzvU7oKiTIrBa4HtwSe/emYfl/Au41ZkA==
X-Gm-Gg: AeBDievO15GWn7UwZ5s8C9HgaTJtvtVBgPX3/6Yf+l4pi74SqD8XSi+59AWsBoc6FmW
	HH/2JB/eIjpQUuZAeAwKSu9oxi5yYjD+Wub6viUutzw33sG5oET9qiRGWQQ8GmIMSYLn+EAXyt1
	UIkPQiYHZHqrs03xrGThv6epNF93Wi5+Ui0qX0P8QhUBaeIpzqGYcMwFzpqFXNFY+2/XohYJMbX
	+tncqWnXZ4xxz3ghrW/K7ueuOUymn1tdlMlzIL8wSzZv/XMA+Ce2/effljEIjJeJLLlrtRxhmuK
	pWhQRx5ORtyeDd0F+zq0drY7Jfr6TAPzA5WatnN7XKFTeGF3ki3AgvaiV3ys+Dv/xw0DTjjDEqd
	2rE8Ifj1JMeW4dEw63G8d71N4yy2VQIiJ8HAyYzyIr10RvPG0CaPEDJ5pbwH5NVM7CWpEbeQTBu
	tEUsLSdW2P0g08KTFLFlXGAw3fSudIBD0/MeJMCLusrMvqWClvl+tJJNEJgx3D5FwZT1j9lByN/
	g8S
X-Received: by 2002:a05:6512:1302:b0:5a3:fe60:471c with SMTP id 2adb3069b0e04-5a4172cb33amr11125558e87.16.1777037820163;
        Fri, 24 Apr 2026 06:37:00 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 1/3] xen/dom0less: introduce next_phandle in struct kernel_info
Date: Fri, 24 Apr 2026 15:36:49 +0200
Message-ID: <5e3ffb41fab84b5f1b59ea81e6d267def89e2d65.1776957840.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776957840.git.oleksii.kurochko@gmail.com>
References: <cover.1776957840.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1777037821-92971A53-E7173810/10/73395122804
X-purgate-type: spam
X-purgate-size: 6206

There are cases where it is necessary to know the next available phandle
number in order to generate phandles for guest device nodes.

When a partial FDT (pfdt) is provided, special care is needed during
initialization of next_phandle, as the pfdt may already contain a dummy
interrupt controller node with a phandle assigned to it. next_phandle
must therefore be initialized to one past the highest phandle already
present in the pfdt, to avoid collisions.

Since next_phandle may be needed for the very first guest node generated,
domain_handle_dtb_boot_module() is moved earlier in prepare_dtb_domU().
The new call site also aligns better with the existing comment stating
that domain_handle_dtb_boot_module() must be called before the rest of
the device tree is generated.

Introduce alloc_phandle() to ensure that phandles allocated for guest
nodes do not overlap the Xen-reserved phandle range.  This helper will
be used by subsequent patches (by RISC-V at the moment).

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Here is an example of generated guest DTB:
    cpus {
    ...
      cpu@0 {
    ...
        interrupt-controller {
          compatible = "riscv,cpu-intc";
          #interrupt-cells = <0x1>;
          interrupt-controller;
          phandle = <0xfdea>;
        };
      };
    };

    /soc/imsics@28000000 {

      interrupts-extended = <0xfdea 0x9 >;

      phandle = <0xfdeb>;
    };

    /soc/aplic@d000000 {
    ...
      msi-parent = <0xfdeb>;
      phandle = <0x1>;
    };

Note that phandle is generated in this example not by get_next_free_phandle().

For non RISC-V people, APLIC is an interrupt controller (something like GIC in
Arm), IMSIC it is interrupt controller which provides MSI and connects to
each CPU.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/interrupt-controller/riscv%2Ccpu-intc.txt
---
Changes in v3:
 - Drop BUG_ON(GUEST_PHANDLE_GIC == 1).
 - Update the comment above declaration of next_phandle field of srtuct
   kernel_info.
---
Changes in v2:
 - s/free_phandle/next_phandle.
 - s/get_next_free_phandle/alloc_phandle.
---
---
 xen/common/device-tree/dom0less-build.c | 43 ++++++++++++++++++-------
 xen/include/xen/fdt-domain-build.h      |  6 ++++
 xen/include/xen/fdt-kernel.h            |  6 ++++
 3 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 840d14419da2..9787ee264975 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -389,6 +389,24 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
     if ( res < 0 )
         goto out;
 
+    /*
+     * Find the highest phandle in the partial FDT so next_phandle starts
+     * above it, avoiding collisions with pfdt's own phandle assignments.
+     */
+    res = fdt_generate_phandle(pfdt, &kinfo->next_phandle);
+    if ( res )
+    {
+        res = (res == -FDT_ERR_NOPHANDLES) ? -EOVERFLOW : -EINVAL;
+        goto out;
+    }
+
+    if ( kinfo->next_phandle >= GUEST_PHANDLE_GIC )
+    {
+        dprintk(XENLOG_ERR, "Phandle allocation overlaps Xen reserved range\n");
+        res = -EOVERFLOW;
+        goto out;
+    }
+
     for ( node_next = fdt_first_subnode(pfdt, 0);
           node_next > 0;
           node_next = fdt_next_subnode(pfdt, node_next) )
@@ -459,6 +477,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     BUILD_BUG_ON(DOMU_DTB_SIZE > SZ_2M);
 
     kinfo->phandle_intc = GUEST_PHANDLE_GIC;
+    kinfo->next_phandle = 1;
 
 #ifdef CONFIG_GRANT_TABLE
     kinfo->gnttab_start = GUEST_GNTTAB_BASE;
@@ -499,6 +518,18 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
+    /*
+     * domain_handle_dtb_boot_module() must be called before the rest of the
+     * device tree is generated because it sets phandle_intc and next_phandle,
+     * which subsequent node generation depends on.
+     */
+    if ( kinfo->dtb )
+    {
+        ret = domain_handle_dtb_boot_module(d, kinfo);
+        if ( ret )
+            goto err;
+    }
+
     ret = make_chosen_node(kinfo);
     if ( ret )
         goto err;
@@ -516,18 +547,6 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-    /*
-     * domain_handle_dtb_boot_module has to be called before the rest of
-     * the device tree is generated because it depends on the value of
-     * the field phandle_intc.
-     */
-    if ( kinfo->dtb )
-    {
-        ret = domain_handle_dtb_boot_module(d, kinfo);
-        if ( ret )
-            goto err;
-    }
-
     ret = make_intc_domU_node(kinfo);
     if ( ret )
         goto err;
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
index 886a85381651..fd2ba01ff0f4 100644
--- a/xen/include/xen/fdt-domain-build.h
+++ b/xen/include/xen/fdt-domain-build.h
@@ -63,6 +63,12 @@ int find_unallocated_memory(const struct kernel_info *kinfo,
                                       unsigned long e_gfn,
                                       void *data));
 
+/* Return 0 (invalid phandle) if the Xen-reserved range has been reached */
+static inline uint32_t alloc_phandle(struct kernel_info *kinfo)
+{
+    return kinfo->next_phandle >= GUEST_PHANDLE_GIC ? 0 : kinfo->next_phandle++;
+}
+
 #endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
 
 /*
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 33a60597bb4d..4d0467bb396a 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -44,6 +44,12 @@ struct kernel_info {
     /* Interrupt controller phandle */
     uint32_t phandle_intc;
 
+    /*
+     * Next free phandle for guest device nodes; do not access directly, use
+     * alloc_phandle().
+     */
+    uint32_t next_phandle;
+
     /* loader to use for this kernel */
     void (*load)(struct kernel_info *info);
 
-- 
2.53.0


