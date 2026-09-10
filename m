Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC922C79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 10:14:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414330.1644131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bn8-0006dh-MW; Thu, 10 Sep 2026 10:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414330.1644131; Thu, 10 Sep 2026 10:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4bn8-0006da-Js; Thu, 10 Sep 2026 10:14:02 +0000
Received: by outflank-mailman (input) for mailman id 1414330;
 Thu, 10 Sep 2026 10:00:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <zhangzheng@iscas.ac.cn>) id 1x4ba1-0004uR-6p
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 10:00:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4ba0-0050qw-Jb
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 12:00:28 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6aa27fb7-2eae-0a2a0a5409dd-0a2a4508a918-24
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 12:00:25 +0200
Received: from [159.226.251.21] (helo=cstnet.cn)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <zhangzheng@iscas.ac.cn>)
 id 6aa27fb6-f659-0a2a45080019-9fe2fb15b84c-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 12:00:25 +0200
Received: from iscas-ws (unknown [36.110.52.2])
 by APP-01 (Coremail) with SMTP id qwCowAAX7O+0f6JqWJeYBw--.31307S2;
 Thu, 10 Sep 2026 18:00:21 +0800 (CST)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
Date: Thu, 10 Sep 2026 18:00:52 +0800
From: Zhang Zheng <zhangzheng@iscas.ac.cn>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/6] automation/qtb: add jinja2 device trees for
 riscv64 smoke tests
Message-ID: <aqJ9MeHe7RWfZekS@iscas-ws>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1050000c4f3@vates.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1050000c4f3@vates.tech>
X-CM-TRANSID:qwCowAAX7O+0f6JqWJeYBw--.31307S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WFyDur4ftr1DWrW5GF17ZFb_yoWxGFyDpw
	srG39ruFs7tr47Kws8Wa1UGrn7CanYkFWrur1UJryUAryqgr40vrnxKw48Cr4xKr1kJ342
	vF4ruF1j9wsxJ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8Jr0_Cr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2Iq
	xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
	106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
	xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
	GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5ksqtUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: x2kd0wx2kh0w46lvutnvoduhdfq/
X-purgate-ID: tlsNG-c1860d/1789034425-CED4087B-D1700052/0/0
X-purgate-type: clean
X-purgate-size: 7629

On Thu, Aug 27, 2026 at 11:42:48AM +0200, Baptiste Le Duc wrote:
> The dom0less RISC-V smoke tests need a host device tree describing the
> platform (CPUs, APLIC/IMSIC, uart). It varies per machine (hart count, MMU
> type), so a single static .dts cannot cover the test matrix.
> 
> Add dts/qemu-host.dts.j2, a template of the QEMU virt platform in
> aia=aplic-imsic mode: per-hart cpu/cpu-intc nodes, the M- and S-mode APLIC
> and IMSIC pairs, CLINT and the ns16550a uart. It takes ncpus, mmu_type and
> xen_bootargs as arguments.
> 
> Values QEMU hardcodes are set as named constants matching their source
> symbols (QEMU_UART0_IRQ, QEMU_IRQCHIP_NUM_SOURCES, ...) rather than
> open-coded, so a QEMU-side change is easy to trace.
> 
> The template is inert on its own: the generated dtb will be used in next
> patch.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
>  .../scripts/qtb/riscv/dts/qemu-host.dts.j2    | 160 ++++++++++++++++++
>  1 file changed, 160 insertions(+)
>  create mode 100644 automation/scripts/qtb/riscv/dts/qemu-host.dts.j2
> 
> diff --git a/automation/scripts/qtb/riscv/dts/qemu-host.dts.j2 b/automation/scripts/qtb/riscv/dts/qemu-host.dts.j2
> new file mode 100644
> index 0000000000..13a8e983ce
> --- /dev/null
> +++ b/automation/scripts/qtb/riscv/dts/qemu-host.dts.j2
> @@ -0,0 +1,160 @@
> +/dts-v1/;
> +
> +{#-
> + * Jinja2 QEMU "virt" platform device tree for Xen RISC-V tests.
> + *
> + * Interrupt controller: APLIC in MSI mode + IMSIC
> + * (QEMU -M virt,aia=aplic-imsic).
> + *
> + * Rendered by xen_dt.py.
> + *
> + * Variables:
> + *   ncpus        - number of physical harts                (int, >= 1)
> + *   mmu_type     - Xen host MMU type, e.g. "sv39"          (string)
> + *   xen_bootargs - Xen command line                        (string)
> + *
> + * Per-hart nodes are labelled cpu<i> / cpu<i>_intc and referenced with &label.
> + *
> + * No `aia-guests=N`, so no VS-mode guest files: IMSIC reg size is
> + * ncpus * page size.
> +-#}
> +{#- Values QEMU hardcodes, need to be described to Xen -#}
> +{%- set QEMU_TIMEBASE_FREQUENCY = 10000000 %}   {#- RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ -#}
> +{%- set QEMU_IRQCHIP_NUM_SOURCES = 96 %}        {#- VIRT_IRQCHIP_NUM_SOURCES (virt.h) -#}
> +{%- set QEMU_IRQCHIP_NUM_MSIS = 255 %}          {#- VIRT_IRQCHIP_NUM_MSIS -#}
> +{%- set QEMU_UART_CLOCK_FREQUENCY = 3686400 %}  {#- create_fdt_uart() -#}
> +{%- set QEMU_UART0_IRQ = 10 %}                  {#- UART0_IRQ -#}
> +{%- set QEMU_IMSIC_PAGE_SZ = 0x1000 %}          {#- IMSIC_MMIO_PAGE_SZ -#}
> +
> +{%- set IRQ_TYPE_LEVEL_HIGH = 4 %}
> +{%- set APLIC_IRQ_CELLS = 2 %}
> +
> +{%- set IRQ_M_SOFT = 3 %}
> +{%- set IRQ_M_TIMER = 7 %}
> +{%- set IRQ_S_EXT = 9 %}
> +{%- set IRQ_M_EXT = 11 %}
> +
> +/ {
> +    #address-cells = <0x02>;
> +    #size-cells = <0x02>;
> +    compatible = "riscv-virtio";
> +    model = "riscv-virtio,qemu";
> +
> +    memory@80000000 {
> +        device_type = "memory";
> +        reg = <0x00 0x80000000 0x00 0x80000000>;
> +    };
> +
> +    cpus {
> +        #address-cells = <0x01>;
> +        #size-cells = <0x00>;
> +        timebase-frequency = <{{ QEMU_TIMEBASE_FREQUENCY }}>;
> +{% for i in range(ncpus) %}
> +        cpu{{ i }}: cpu@{{ i }} {
> +            device_type = "cpu";
> +            reg = <0x{{ '%x' % i }}>;
> +            status = "okay";
> +            compatible = "riscv";
> +            riscv,cbop-block-size = <0x40>;
> +            riscv,cboz-block-size = <0x40>;
> +            riscv,cbom-block-size = <0x40>;
> +            riscv,isa = "rv64imafdch_zicntr_zicsr_zifencei_zihintpause_zihpm_zba_zbb_zbs_smstateen_svpbmt_smaia_ssaia";
> +            mmu-type = "riscv,{{ mmu_type }}";
> +
> +            cpu{{ i }}_intc: interrupt-controller@{{ i }} {
> +                #interrupt-cells = <0x01>;
> +                interrupt-controller;
> +                compatible = "riscv,cpu-intc";
> +            };
> +        };
> +{% endfor %}
> +        cpu-map {
> +
> +            cluster0 {
> +{% for i in range(ncpus) %}
> +                core{{ i }} {
> +                    cpu = <&cpu{{ i }}>;
> +                };
> +{% endfor %}
> +            };
> +        };
> +    };
> +
> +    soc {
> +        #address-cells = <0x02>;
> +        #size-cells = <0x02>;
> +        compatible = "simple-bus";
> +        ranges;
> +
> +        serial@10000000 {
> +            interrupts = <{{ QEMU_UART0_IRQ }} {{ IRQ_TYPE_LEVEL_HIGH }}>;
> +            interrupt-parent = <&aplic_s>;
> +            clock-frequency = <{{ QEMU_UART_CLOCK_FREQUENCY }}>;
> +            reg = <0x00 0x10000000 0x00 0x100>;
> +            compatible = "ns16550a";
> +        };
> +
> +        aplic_s: aplic@d000000 {
> +            riscv,num-sources = <{{ QEMU_IRQCHIP_NUM_SOURCES }}>;
> +            reg = <0x00 0xd000000 0x00 0x8000>;
> +            msi-parent = <&imsic_s>;
> +            interrupt-controller;
> +            #interrupt-cells = <{{ APLIC_IRQ_CELLS }}>;
> +            compatible = "riscv,aplic";
> +        };
> +
> +        aplic@c000000 {
> +            riscv,delegate = <&aplic_s 0x01 {{ QEMU_IRQCHIP_NUM_SOURCES }}>;

It seems like `riscv,delegate` was deprecated in QEMU 9.1 and has been removed in QEMU 11.0. The
property defined by the APLIC device-tree binding is `riscv,delegation`.

See:
https://lists.gnu.org/archive/html/qemu-devel/2026-03/msg01459.html

> +            riscv,children = <&aplic_s>;
> +            riscv,num-sources = <{{ QEMU_IRQCHIP_NUM_SOURCES }}>;
> +            reg = <0x00 0xc000000 0x00 0x8000>;
> +            msi-parent = <&imsic_m>;
> +            interrupt-controller;
> +            #interrupt-cells = <{{ APLIC_IRQ_CELLS }}>;
> +            compatible = "riscv,aplic";
> +        };
> +
> +        imsic_s: imsics@28000000 {
> +            riscv,num-ids = <{{ QEMU_IRQCHIP_NUM_MSIS }}>;
> +            reg = <0x00 0x28000000 0x00 0x{{ '%x' % (ncpus * QEMU_IMSIC_PAGE_SZ) }}>;
> +            interrupts-extended = <
> +                {%- for i in range(ncpus) %}
> +                    &cpu{{ i }}_intc {{ IRQ_S_EXT }}
> +                {%- endfor %}
> +            >;
> +            msi-controller;
> +            interrupt-controller;
> +            #interrupt-cells = <0x00>;
> +            compatible = "riscv,imsics";
> +        };
> +
> +        imsic_m: imsics@24000000 {
> +            riscv,num-ids = <{{ QEMU_IRQCHIP_NUM_MSIS }}>;
> +            reg = <0x00 0x24000000 0x00 0x{{ '%x' % (ncpus * QEMU_IMSIC_PAGE_SZ) }}>;
> +            interrupts-extended = <
> +                {%- for i in range(ncpus) %}
> +                    &cpu{{ i }}_intc {{ IRQ_M_EXT }}
> +                {%- endfor %}
> +            >;
> +            msi-controller;
> +            interrupt-controller;
> +            #interrupt-cells = <0x00>;
> +            compatible = "riscv,imsics";
> +        };
> +
> +        clint@2000000 {
> +            interrupts-extended = <
> +                {%- for i in range(ncpus) %}
> +                    &cpu{{ i }}_intc {{ IRQ_M_SOFT }} &cpu{{ i }}_intc {{ IRQ_M_TIMER }}
> +                {%- endfor %}
> +            >;
> +            reg = <0x00 0x2000000 0x00 0x10000>;
> +            compatible = "sifive,clint0", "riscv,clint0";
> +        };
> +    };
> +
> +    chosen {
> +        stdout-path = "/soc/serial@10000000";
> +        xen,xen-bootargs = "{{ xen_bootargs }}";
> +    };
> +};
> 

Zhang


