Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57BEC61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 09:43:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400480.1636141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWdf-0005gE-Vj; Thu, 27 Aug 2026 09:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400480.1636141; Thu, 27 Aug 2026 09:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzWdf-0005g7-Rb; Thu, 27 Aug 2026 09:43:15 +0000
Received: by outflank-mailman (input) for mailman id 1400480;
 Thu, 27 Aug 2026 09:43:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a1050000c4f3@swg.vates.tech>)
 id 1wzWde-0005Td-FO
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 09:43:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzWdd-00B8Qw-S7
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 11:43:13 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a1050000c4f3@swg.vates.tech>)
 id 6a9006a5-8faa-0a2a0a5109dd-0a2a4506caa8-26
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:43:13 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0429a1050000c4f3@swg.vates.tech>)
 id 6a9006b1-195a-0a2a45060019-b9ff1c2295af-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 11:43:13 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0429a1050000c4f3.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Aug 2026 09:43:08 +0000
Received: from leducb.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 16CE283B2D;
 Thu, 27 Aug 2026 11:43:07 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=sbEkocC2EuCtg3d1VQNUGSyKIv15JnFJv8WCsyhEZIU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=t2DyFejTbgi9masF0k9lA2VrdJpmtdqwdkwebJSSyrbdrv5mT+Lj0o0IAShKPkfp8p/wFXkmT
 aonTBkB/GS12Q/6nWrjn7Mf9V+S7Pquru+HAHxzXCVcwr+kpsoC2a8NWCr1k/HTqsQo6VIkQHx1
 HdGvadcW2gNnnhxTAa0jqSUBCJR//pmmdiiCzSO1WOIF5R94TsBxDoj+tzyxhI1BVsRs5NxGmz9
 w37uRsjGxAuc1apmBgpnucy7VVL3yg7Z5QzLNO9cYkz5dwSXAvlFOGzptbdE/nCoX+fOiecT1eY
 f8zwRnI0WrufqBDpekvUBgVJD6Bjeec5KVxIvSOTJVtA==
X-Zone-Loop: 52ebf5fdabd5f7c4a8336b4b7b4a14c75c1fc4a217c0
x-campaign-type: default
x-transaction-id: 604569c2-b308-4713-b81c-144e4520ef14
x-swg-uid: 01-17b6331a-b3e4-4096-9bcc-a833dfc66e74
X-Mailer: Sweego
Message-ID:
 <1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1050000c4f3@vates.tech>
x-swg-bid: 1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1050000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/6] automation/qtb: add jinja2 device trees for riscv64 smoke tests
Date: Thu, 27 Aug 2026 11:42:48 +0200
In-Reply-To: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787823787186
X-purgate-ID: tlsNG-16d1c6/1787823793-F440377B-4AF80189/0/0
X-purgate-type: clean
X-purgate-size: 6917

The dom0less RISC-V smoke tests need a host device tree describing the
platform (CPUs, APLIC/IMSIC, uart). It varies per machine (hart count, MMU
type), so a single static .dts cannot cover the test matrix.

Add dts/qemu-host.dts.j2, a template of the QEMU virt platform in
aia=aplic-imsic mode: per-hart cpu/cpu-intc nodes, the M- and S-mode APLIC
and IMSIC pairs, CLINT and the ns16550a uart. It takes ncpus, mmu_type and
xen_bootargs as arguments.

Values QEMU hardcodes are set as named constants matching their source
symbols (QEMU_UART0_IRQ, QEMU_IRQCHIP_NUM_SOURCES, ...) rather than
open-coded, so a QEMU-side change is easy to trace.

The template is inert on its own: the generated dtb will be used in next
patch.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
---
 .../scripts/qtb/riscv/dts/qemu-host.dts.j2    | 160 ++++++++++++++++++
 1 file changed, 160 insertions(+)
 create mode 100644 automation/scripts/qtb/riscv/dts/qemu-host.dts.j2

diff --git a/automation/scripts/qtb/riscv/dts/qemu-host.dts.j2 b/automation/scripts/qtb/riscv/dts/qemu-host.dts.j2
new file mode 100644
index 0000000000..13a8e983ce
--- /dev/null
+++ b/automation/scripts/qtb/riscv/dts/qemu-host.dts.j2
@@ -0,0 +1,160 @@
+/dts-v1/;
+
+{#-
+ * Jinja2 QEMU "virt" platform device tree for Xen RISC-V tests.
+ *
+ * Interrupt controller: APLIC in MSI mode + IMSIC
+ * (QEMU -M virt,aia=aplic-imsic).
+ *
+ * Rendered by xen_dt.py.
+ *
+ * Variables:
+ *   ncpus        - number of physical harts                (int, >= 1)
+ *   mmu_type     - Xen host MMU type, e.g. "sv39"          (string)
+ *   xen_bootargs - Xen command line                        (string)
+ *
+ * Per-hart nodes are labelled cpu<i> / cpu<i>_intc and referenced with &label.
+ *
+ * No `aia-guests=N`, so no VS-mode guest files: IMSIC reg size is
+ * ncpus * page size.
+-#}
+{#- Values QEMU hardcodes, need to be described to Xen -#}
+{%- set QEMU_TIMEBASE_FREQUENCY = 10000000 %}   {#- RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ -#}
+{%- set QEMU_IRQCHIP_NUM_SOURCES = 96 %}        {#- VIRT_IRQCHIP_NUM_SOURCES (virt.h) -#}
+{%- set QEMU_IRQCHIP_NUM_MSIS = 255 %}          {#- VIRT_IRQCHIP_NUM_MSIS -#}
+{%- set QEMU_UART_CLOCK_FREQUENCY = 3686400 %}  {#- create_fdt_uart() -#}
+{%- set QEMU_UART0_IRQ = 10 %}                  {#- UART0_IRQ -#}
+{%- set QEMU_IMSIC_PAGE_SZ = 0x1000 %}          {#- IMSIC_MMIO_PAGE_SZ -#}
+
+{%- set IRQ_TYPE_LEVEL_HIGH = 4 %}
+{%- set APLIC_IRQ_CELLS = 2 %}
+
+{%- set IRQ_M_SOFT = 3 %}
+{%- set IRQ_M_TIMER = 7 %}
+{%- set IRQ_S_EXT = 9 %}
+{%- set IRQ_M_EXT = 11 %}
+
+/ {
+    #address-cells = <0x02>;
+    #size-cells = <0x02>;
+    compatible = "riscv-virtio";
+    model = "riscv-virtio,qemu";
+
+    memory@80000000 {
+        device_type = "memory";
+        reg = <0x00 0x80000000 0x00 0x80000000>;
+    };
+
+    cpus {
+        #address-cells = <0x01>;
+        #size-cells = <0x00>;
+        timebase-frequency = <{{ QEMU_TIMEBASE_FREQUENCY }}>;
+{% for i in range(ncpus) %}
+        cpu{{ i }}: cpu@{{ i }} {
+            device_type = "cpu";
+            reg = <0x{{ '%x' % i }}>;
+            status = "okay";
+            compatible = "riscv";
+            riscv,cbop-block-size = <0x40>;
+            riscv,cboz-block-size = <0x40>;
+            riscv,cbom-block-size = <0x40>;
+            riscv,isa = "rv64imafdch_zicntr_zicsr_zifencei_zihintpause_zihpm_zba_zbb_zbs_smstateen_svpbmt_smaia_ssaia";
+            mmu-type = "riscv,{{ mmu_type }}";
+
+            cpu{{ i }}_intc: interrupt-controller@{{ i }} {
+                #interrupt-cells = <0x01>;
+                interrupt-controller;
+                compatible = "riscv,cpu-intc";
+            };
+        };
+{% endfor %}
+        cpu-map {
+
+            cluster0 {
+{% for i in range(ncpus) %}
+                core{{ i }} {
+                    cpu = <&cpu{{ i }}>;
+                };
+{% endfor %}
+            };
+        };
+    };
+
+    soc {
+        #address-cells = <0x02>;
+        #size-cells = <0x02>;
+        compatible = "simple-bus";
+        ranges;
+
+        serial@10000000 {
+            interrupts = <{{ QEMU_UART0_IRQ }} {{ IRQ_TYPE_LEVEL_HIGH }}>;
+            interrupt-parent = <&aplic_s>;
+            clock-frequency = <{{ QEMU_UART_CLOCK_FREQUENCY }}>;
+            reg = <0x00 0x10000000 0x00 0x100>;
+            compatible = "ns16550a";
+        };
+
+        aplic_s: aplic@d000000 {
+            riscv,num-sources = <{{ QEMU_IRQCHIP_NUM_SOURCES }}>;
+            reg = <0x00 0xd000000 0x00 0x8000>;
+            msi-parent = <&imsic_s>;
+            interrupt-controller;
+            #interrupt-cells = <{{ APLIC_IRQ_CELLS }}>;
+            compatible = "riscv,aplic";
+        };
+
+        aplic@c000000 {
+            riscv,delegate = <&aplic_s 0x01 {{ QEMU_IRQCHIP_NUM_SOURCES }}>;
+            riscv,children = <&aplic_s>;
+            riscv,num-sources = <{{ QEMU_IRQCHIP_NUM_SOURCES }}>;
+            reg = <0x00 0xc000000 0x00 0x8000>;
+            msi-parent = <&imsic_m>;
+            interrupt-controller;
+            #interrupt-cells = <{{ APLIC_IRQ_CELLS }}>;
+            compatible = "riscv,aplic";
+        };
+
+        imsic_s: imsics@28000000 {
+            riscv,num-ids = <{{ QEMU_IRQCHIP_NUM_MSIS }}>;
+            reg = <0x00 0x28000000 0x00 0x{{ '%x' % (ncpus * QEMU_IMSIC_PAGE_SZ) }}>;
+            interrupts-extended = <
+                {%- for i in range(ncpus) %}
+                    &cpu{{ i }}_intc {{ IRQ_S_EXT }}
+                {%- endfor %}
+            >;
+            msi-controller;
+            interrupt-controller;
+            #interrupt-cells = <0x00>;
+            compatible = "riscv,imsics";
+        };
+
+        imsic_m: imsics@24000000 {
+            riscv,num-ids = <{{ QEMU_IRQCHIP_NUM_MSIS }}>;
+            reg = <0x00 0x24000000 0x00 0x{{ '%x' % (ncpus * QEMU_IMSIC_PAGE_SZ) }}>;
+            interrupts-extended = <
+                {%- for i in range(ncpus) %}
+                    &cpu{{ i }}_intc {{ IRQ_M_EXT }}
+                {%- endfor %}
+            >;
+            msi-controller;
+            interrupt-controller;
+            #interrupt-cells = <0x00>;
+            compatible = "riscv,imsics";
+        };
+
+        clint@2000000 {
+            interrupts-extended = <
+                {%- for i in range(ncpus) %}
+                    &cpu{{ i }}_intc {{ IRQ_M_SOFT }} &cpu{{ i }}_intc {{ IRQ_M_TIMER }}
+                {%- endfor %}
+            >;
+            reg = <0x00 0x2000000 0x00 0x10000>;
+            compatible = "sifive,clint0", "riscv,clint0";
+        };
+    };
+
+    chosen {
+        stdout-path = "/soc/serial@10000000";
+        xen,xen-bootargs = "{{ xen_bootargs }}";
+    };
+};

