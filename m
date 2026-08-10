Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DACC5B571
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 16:10:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387635.1628894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSZw-0003Tb-Hf; Mon, 10 Aug 2026 16:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387635.1628894; Mon, 10 Aug 2026 16:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtSZw-0003TR-B3; Mon, 10 Aug 2026 16:10:20 +0000
Received: by outflank-mailman (input) for mailman id 1387635;
 Mon, 10 Aug 2026 16:10:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec70581a000e099@swg.vates.tech>)
 id 1wtSZu-0003Qj-Oj
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:10:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtSZt-008NAc-Sr
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 18:10:17 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec70581a000e099@swg.vates.tech>)
 id 6a79f7dd-bab6-0a2a0a5309dd-0a2a45049fd2-26
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:10:17 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec70581a000e099@swg.vates.tech>)
 id 6a79f7e9-b57f-0a2a45040019-b9ff1c128dc1-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 18:10:17 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fec70581a000e099.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 16:10:13 +0000
Received: from leducb (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9AB75836CA;
 Mon, 10 Aug 2026 18:10:12 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=0V35KKyCyWU/Pb/pFIo83QM223XPnac1kuZzpR5VrJw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=QWbdslD1TykVDm7ZCK6mB87orQiy+XeG9IQ9BRqhFO1t1CTlxu2zCEzbMzPhmoQcWA5j7PS8n
 9Zq7c5RD+NPoHoJ8p8/n7qA6tSTjVJwIwTLpxy/QC91NN3vS0ZXs0GKcJbpH/H9VE2jIdiR6mCS
 n7MAvlJePywnAYtmFjVJ2EAlRlkQTPa7laFkwXrJpjVaUySq0V2G+VXBdwJ6SEBx6rT7TmMgwag
 U9oqF2+Fa1/+iDseQFr4vZ0xGAnSsLtQQftjJc3GBTPDp9hxxAvNN6YLvbGWTba7Pqmf25+28BC
 Q8nCWfX1DP2oUsMASMuOKxJ/QId20FayXpqQzQqKqFgQ==
X-Zone-Loop: c24006a88a476bd7b77c74e0bbcfebe1aa929b85d8b1
x-campaign-type: default
x-transaction-id: 05a9d833-b609-4159-b82d-147cbcfeed1a
x-swg-uid: 01-de0d33b5-f43e-4c41-bd42-d2c4f0d67d31
X-Mailer: Sweego
Message-ID:
 <1786378213.8631fc262581453bbf619ec5b2062170.19fec70581a000e099@vates.tech>
x-swg-bid: 1786378213.8631fc262581453bbf619ec5b2062170.19fec70581a000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/6] automation/qtb: add jinja2 device trees for riscv64 smoke tests
Date: Mon, 10 Aug 2026 18:09:52 +0200
In-Reply-To: <20260810155543.927954-1-baptiste.le-duc@vates.tech>
References: <20260810155543.927954-1-baptiste.le-duc@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2049.93281b3fe6baf6b5.19fec705570.451b9a4538daf6f6=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786378212720
X-purgate-ID: tlsNG-ebf023/1786378217-C32CCB50-25BB999F/0/0
X-purgate-type: clean
X-purgate-size: 7543

---=Part.2049.93281b3fe6baf6b5.19fec705570.451b9a4538daf6f6=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The dom0less RISC-V smoke tests need a host device tree describing the
platform (CPUs, APLIC/IMSIC, uart)=2E It varies per machine (hart count, M=
MU
type), so a single static =2Edts cannot cover the test matrix=2E

Add dts/qemu-host=2Edts=2Ej2, a template of the QEMU virt platform in
aia=3Daplic-imsic mode: per-hart cpu/cpu-intc nodes, the M- and S-mode APL=
IC
and IMSIC pairs, CLINT and the ns16550a uart=2E It takes ncpus, mmu_type a=
nd
xen_bootargs as arguments=2E

Values QEMU hardcodes are set as named constants matching their source
symbols (QEMU_UART0_IRQ, QEMU_IRQCHIP_NUM_SOURCES, =2E=2E=2E) rather than
open-coded, so a QEMU-side change is easy to trace=2E

The template is inert on its own: the generated dtb will be used in next
patch=2E

Assisted-by: Claude:claude-opus-5
Signed-off-by: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
---
 =2E=2E=2E/scripts/qtb/riscv/dts/qemu-host=2Edts=2Ej2    | 160 +++++++++++=
+++++++
 1 file changed, 160 insertions(+)
 create mode 100644 automation/scripts/qtb/riscv/dts/qemu-host=2Edts=2Ej2

diff --git a/automation/scripts/qtb/riscv/dts/qemu-host=2Edts=2Ej2 b/autom=
ation/scripts/qtb/riscv/dts/qemu-host=2Edts=2Ej2
new file mode 100644
index 0000000000=2E=2E13a8e983ce
--- /dev/null
+++ b/automation/scripts/qtb/riscv/dts/qemu-host=2Edts=2Ej2
@@ -0,0 +1,160 @@
+/dts-v1/;
+
+{#-
+ * Jinja2 QEMU "virt" platform device tree for Xen RISC-V tests=2E
+ *
+ * Interrupt controller: APLIC in MSI mode + IMSIC
+ * (QEMU -M virt,aia=3Daplic-imsic)=2E
+ *
+ * Rendered by xen_dt=2Epy=2E
+ *
+ * Variables:
+ *   ncpus        - number of physical harts                (int, >=3D 1)
+ *   mmu_type     - Xen host MMU type, e=2Eg=2E "sv39"          (string)
+ *   xen_bootargs - Xen command line                        (string)
+ *
+ * Per-hart nodes are labelled cpu<i> / cpu<i>_intc and referenced with &=
label=2E
+ *
+ * No `aia-guests=3DN`, so no VS-mode guest files: IMSIC reg size is
+ * ncpus * page size=2E
+-#}
+{#- Values QEMU hardcodes, need to be described to Xen -#}
+{%- set QEMU_TIMEBASE_FREQUENCY =3D 10000000 %}   {#- RISCV_ACLINT_DEFAUL=
T_TIMEBASE_FREQ -#}
+{%- set QEMU_IRQCHIP_NUM_SOURCES =3D 96 %}        {#- VIRT_IRQCHIP_NUM_SO=
URCES (virt=2Eh) -#}
+{%- set QEMU_IRQCHIP_NUM_MSIS =3D 255 %}          {#- VIRT_IRQCHIP_NUM_MS=
IS -#}
+{%- set QEMU_UART_CLOCK_FREQUENCY =3D 3686400 %}  {#- create_fdt_uart() -=
#}
+{%- set QEMU_UART0_IRQ =3D 10 %}                  {#- UART0_IRQ -#}
+{%- set QEMU_IMSIC_PAGE_SZ =3D 0x1000 %}          {#- IMSIC_MMIO_PAGE_SZ =
-#}
+
+{%- set IRQ_TYPE_LEVEL_HIGH =3D 4 %}
+{%- set APLIC_IRQ_CELLS =3D 2 %}
+
+{%- set IRQ_M_SOFT =3D 3 %}
+{%- set IRQ_M_TIMER =3D 7 %}
+{%- set IRQ_S_EXT =3D 9 %}
+{%- set IRQ_M_EXT =3D 11 %}
+
+/ {
+    #address-cells =3D <0x02>;
+    #size-cells =3D <0x02>;
+    compatible =3D "riscv-virtio";
+    model =3D "riscv-virtio,qemu";
+
+    memory@80000000 {
+        device_type =3D "memory";
+        reg =3D <0x00 0x80000000 0x00 0x80000000>;
+    };
+
+    cpus {
+        #address-cells =3D <0x01>;
+        #size-cells =3D <0x00>;
+        timebase-frequency =3D <{{ QEMU_TIMEBASE_FREQUENCY }}>;
+{% for i in range(ncpus) %}
+        cpu{{ i }}: cpu@{{ i }} {
+            device_type =3D "cpu";
+            reg =3D <0x{{ '%x' % i }}>;
+            status =3D "okay";
+            compatible =3D "riscv";
+            riscv,cbop-block-size =3D <0x40>;
+            riscv,cboz-block-size =3D <0x40>;
+            riscv,cbom-block-size =3D <0x40>;
+            riscv,isa =3D "rv64imafdch_zicntr_zicsr_zifencei_zihintpause_=
zihpm_zba_zbb_zbs_smstateen_svpbmt_smaia_ssaia";
+            mmu-type =3D "riscv,{{ mmu_type }}";
+
+            cpu{{ i }}_intc: interrupt-controller@{{ i }} {
+                #interrupt-cells =3D <0x01>;
+                interrupt-controller;
+                compatible =3D "riscv,cpu-intc";
+            };
+        };
+{% endfor %}
+        cpu-map {
+
+            cluster0 {
+{% for i in range(ncpus) %}
+                core{{ i }} {
+                    cpu =3D <&cpu{{ i }}>;
+                };
+{% endfor %}
+            };
+        };
+    };
+
+    soc {
+        #address-cells =3D <0x02>;
+        #size-cells =3D <0x02>;
+        compatible =3D "simple-bus";
+        ranges;
+
+        serial@10000000 {
+            interrupts =3D <{{ QEMU_UART0_IRQ }} {{ IRQ_TYPE_LEVEL_HIGH }=
}>;
+            interrupt-parent =3D <&aplic_s>;
+            clock-frequency =3D <{{ QEMU_UART_CLOCK_FREQUENCY }}>;
+            reg =3D <0x00 0x10000000 0x00 0x100>;
+            compatible =3D "ns16550a";
+        };
+
+        aplic_s: aplic@d000000 {
+            riscv,num-sources =3D <{{ QEMU_IRQCHIP_NUM_SOURCES }}>;
+            reg =3D <0x00 0xd000000 0x00 0x8000>;
+            msi-parent =3D <&imsic_s>;
+            interrupt-controller;
+            #interrupt-cells =3D <{{ APLIC_IRQ_CELLS }}>;
+            compatible =3D "riscv,aplic";
+        };
+
+        aplic@c000000 {
+            riscv,delegate =3D <&aplic_s 0x01 {{ QEMU_IRQCHIP_NUM_SOURCES=
 }}>;
+            riscv,children =3D <&aplic_s>;
+            riscv,num-sources =3D <{{ QEMU_IRQCHIP_NUM_SOURCES }}>;
+            reg =3D <0x00 0xc000000 0x00 0x8000>;
+            msi-parent =3D <&imsic_m>;
+            interrupt-controller;
+            #interrupt-cells =3D <{{ APLIC_IRQ_CELLS }}>;
+            compatible =3D "riscv,aplic";
+        };
+
+        imsic_s: imsics@28000000 {
+            riscv,num-ids =3D <{{ QEMU_IRQCHIP_NUM_MSIS }}>;
+            reg =3D <0x00 0x28000000 0x00 0x{{ '%x' % (ncpus * QEMU_IMSIC=
_PAGE_SZ) }}>;
+            interrupts-extended =3D <
+                {%- for i in range(ncpus) %}
+                    &cpu{{ i }}_intc {{ IRQ_S_EXT }}
+                {%- endfor %}
+            >;
+            msi-controller;
+            interrupt-controller;
+            #interrupt-cells =3D <0x00>;
+            compatible =3D "riscv,imsics";
+        };
+
+        imsic_m: imsics@24000000 {
+            riscv,num-ids =3D <{{ QEMU_IRQCHIP_NUM_MSIS }}>;
+            reg =3D <0x00 0x24000000 0x00 0x{{ '%x' % (ncpus * QEMU_IMSIC=
_PAGE_SZ) }}>;
+            interrupts-extended =3D <
+                {%- for i in range(ncpus) %}
+                    &cpu{{ i }}_intc {{ IRQ_M_EXT }}
+                {%- endfor %}
+            >;
+            msi-controller;
+            interrupt-controller;
+            #interrupt-cells =3D <0x00>;
+            compatible =3D "riscv,imsics";
+        };
+
+        clint@2000000 {
+            interrupts-extended =3D <
+                {%- for i in range(ncpus) %}
+                    &cpu{{ i }}_intc {{ IRQ_M_SOFT }} &cpu{{ i }}_intc {{=
 IRQ_M_TIMER }}
+                {%- endfor %}
+            >;
+            reg =3D <0x00 0x2000000 0x00 0x10000>;
+            compatible =3D "sifive,clint0", "riscv,clint0";
+        };
+    };
+
+    chosen {
+        stdout-path =3D "/soc/serial@10000000";
+        xen,xen-bootargs =3D "{{ xen_bootargs }}";
+    };
+};


-- 
Baptiste Le Duc | Vates Hypervisor & Kernel Engineer

XCP-ng & Xen Orc=
hestra - Vates solutions

web: https://vates=2Etech
---=Part.2049.93281b3fe6baf6b5.19fec705570.451b9a4538daf6f6=---

