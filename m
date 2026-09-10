Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA94C79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 11:28:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414490.1644276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4cxF-0002jV-Kj; Thu, 10 Sep 2026 11:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414490.1644276; Thu, 10 Sep 2026 11:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4cxF-0002jO-IC; Thu, 10 Sep 2026 11:28:33 +0000
Received: by outflank-mailman (input) for mailman id 1414490;
 Thu, 10 Sep 2026 11:28:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08b1386b2000c4f3@swg.vates.tech>)
 id 1x4cxD-0002jI-SW
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 11:28:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4cxD-00AhaB-9H
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 13:28:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08b1386b2000c4f3@swg.vates.tech>)
 id 6aa2944b-8faa-0a2a0a5109dd-0a2a450397dc-24
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 13:28:31 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a08b1386b2000c4f3@swg.vates.tech>)
 id 6aa2945e-fae8-0a2a45030019-b9ff1c12a981-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 13:28:31 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a08b1386b2000c4f3.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 10 Sep 2026 11:28:27 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0F6FE8156D;
 Thu, 10 Sep 2026 13:28:27 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=I4Li6FhKtorbwIWPyH8ZyalImdF8M9BzbYf7VNRwv9o=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=a0YKJ++QNFlFswNyM6cncRa23wsrIRukkZQpOsJKiRjl/a7+Q3ftumqkR2AtxNOKYXXZyVrMg
 r885NvwunyIZm3dgKdeoFczre8Y53zYyFuLE/56Qiz4cH/x9UT1fxylqZi2UHCHhIRGlshnA5Yv
 8tRnafdNnGwzkCWQ7SUDyO1HT+TeJC6AyzUh/elaI0TnOqBKZL8YbWsfPDtBf0IAr9tlMMuodBF
 J5VPJnm+ynvR/WBEd0mPeSSCROCdzLnLVawRHIztPqRk/kSwBPKb+pt/7Lxc/Oh7lUEs/S76DA/
 FBigID6sgOGIs7t6LT7v9F3ynkiB9SexelsoOURab4Ig==
X-Zone-Loop: 4d7ad702b346e774ec6552b5990cff06fbffeeda7521
x-campaign-type: default
x-transaction-id: f52020f1-7f11-401e-9c81-be300d2a6c59
x-swg-uid: 01-b839829c-995c-4b2d-84ad-edaf151487e5
X-Mailer: Sweego
Message-ID:
 <1789039707.8631fc262581453bbf619ec5b2062170.1a08b1386b2000c4f3@vates.tech>
x-swg-bid: 1789039707.8631fc262581453bbf619ec5b2062170.1a08b1386b2000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/6] automation/qtb: add jinja2 device trees for
 riscv64 smoke tests
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Zhang Zheng <zhangzheng@iscas.ac.cn>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <aqJ9MeHe7RWfZekS@iscas-ws>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1050000c4f3@vates.tech>
 <aqJ9MeHe7RWfZekS@iscas-ws>
Date: Thu, 10 Sep 2026 13:28:21 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789039706; l=8250;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=umiA2R5QkSvo3bjwmrRFzVkxUevYKAh7dagfyF5M/mk=;
 b=Xz70Wnw4vTzJfUExQsvlCM8y3bOhq7mXe2Hvkpwjnj0podZMe9z4cvbg5eyyxOg02gGMmd5uJ
 Aw6bHa1qC2rBOZ0BzKcjteuHYsGNjH9lzAUdIaTGxkPiv9lHrc3/pJ5
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789039707155
X-purgate-ID: tlsNG-33051d/1789039711-6EACC4E9-A632833F/0/0
X-purgate-type: clean
X-purgate-size: 8254

On 2026-09-10 18:00 +0800, Zhang Zheng wrote:
> On Thu, Aug 27, 2026 at 11:42:48AM +0200, Baptiste Le Duc wrote:
> > The dom0less RISC-V smoke tests need a host device tree describing the
> > platform (CPUs, APLIC/IMSIC, uart). It varies per machine (hart count, MMU
> > type), so a single static .dts cannot cover the test matrix.
> > 
> > Add dts/qemu-host.dts.j2, a template of the QEMU virt platform in
> > aia=aplic-imsic mode: per-hart cpu/cpu-intc nodes, the M- and S-mode APLIC
> > and IMSIC pairs, CLINT and the ns16550a uart. It takes ncpus, mmu_type and
> > xen_bootargs as arguments.
> > 
> > Values QEMU hardcodes are set as named constants matching their source
> > symbols (QEMU_UART0_IRQ, QEMU_IRQCHIP_NUM_SOURCES, ...) rather than
> > open-coded, so a QEMU-side change is easy to trace.
> > 
> > The template is inert on its own: the generated dtb will be used in next
> > patch.
> > 
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> > ---
> >  .../scripts/qtb/riscv/dts/qemu-host.dts.j2    | 160 ++++++++++++++++++
> >  1 file changed, 160 insertions(+)
> >  create mode 100644 automation/scripts/qtb/riscv/dts/qemu-host.dts.j2
> > 
> > diff --git a/automation/scripts/qtb/riscv/dts/qemu-host.dts.j2 b/automation/scripts/qtb/riscv/dts/qemu-host.dts.j2
> > new file mode 100644
> > index 0000000000..13a8e983ce
> > --- /dev/null
> > +++ b/automation/scripts/qtb/riscv/dts/qemu-host.dts.j2
> > @@ -0,0 +1,160 @@
> > +/dts-v1/;
> > +
> > +{#-
> > + * Jinja2 QEMU "virt" platform device tree for Xen RISC-V tests.
> > + *
> > + * Interrupt controller: APLIC in MSI mode + IMSIC
> > + * (QEMU -M virt,aia=aplic-imsic).
> > + *
> > + * Rendered by xen_dt.py.
> > + *
> > + * Variables:
> > + *   ncpus        - number of physical harts                (int, >= 1)
> > + *   mmu_type     - Xen host MMU type, e.g. "sv39"          (string)
> > + *   xen_bootargs - Xen command line                        (string)
> > + *
> > + * Per-hart nodes are labelled cpu<i> / cpu<i>_intc and referenced with &label.
> > + *
> > + * No `aia-guests=N`, so no VS-mode guest files: IMSIC reg size is
> > + * ncpus * page size.
> > +-#}
> > +{#- Values QEMU hardcodes, need to be described to Xen -#}
> > +{%- set QEMU_TIMEBASE_FREQUENCY = 10000000 %}   {#- RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ -#}
> > +{%- set QEMU_IRQCHIP_NUM_SOURCES = 96 %}        {#- VIRT_IRQCHIP_NUM_SOURCES (virt.h) -#}
> > +{%- set QEMU_IRQCHIP_NUM_MSIS = 255 %}          {#- VIRT_IRQCHIP_NUM_MSIS -#}
> > +{%- set QEMU_UART_CLOCK_FREQUENCY = 3686400 %}  {#- create_fdt_uart() -#}
> > +{%- set QEMU_UART0_IRQ = 10 %}                  {#- UART0_IRQ -#}
> > +{%- set QEMU_IMSIC_PAGE_SZ = 0x1000 %}          {#- IMSIC_MMIO_PAGE_SZ -#}
> > +
> > +{%- set IRQ_TYPE_LEVEL_HIGH = 4 %}
> > +{%- set APLIC_IRQ_CELLS = 2 %}
> > +
> > +{%- set IRQ_M_SOFT = 3 %}
> > +{%- set IRQ_M_TIMER = 7 %}
> > +{%- set IRQ_S_EXT = 9 %}
> > +{%- set IRQ_M_EXT = 11 %}
> > +
> > +/ {
> > +    #address-cells = <0x02>;
> > +    #size-cells = <0x02>;
> > +    compatible = "riscv-virtio";
> > +    model = "riscv-virtio,qemu";
> > +
> > +    memory@80000000 {
> > +        device_type = "memory";
> > +        reg = <0x00 0x80000000 0x00 0x80000000>;
> > +    };
> > +
> > +    cpus {
> > +        #address-cells = <0x01>;
> > +        #size-cells = <0x00>;
> > +        timebase-frequency = <{{ QEMU_TIMEBASE_FREQUENCY }}>;
> > +{% for i in range(ncpus) %}
> > +        cpu{{ i }}: cpu@{{ i }} {
> > +            device_type = "cpu";
> > +            reg = <0x{{ '%x' % i }}>;
> > +            status = "okay";
> > +            compatible = "riscv";
> > +            riscv,cbop-block-size = <0x40>;
> > +            riscv,cboz-block-size = <0x40>;
> > +            riscv,cbom-block-size = <0x40>;
> > +            riscv,isa = "rv64imafdch_zicntr_zicsr_zifencei_zihintpause_zihpm_zba_zbb_zbs_smstateen_svpbmt_smaia_ssaia";
> > +            mmu-type = "riscv,{{ mmu_type }}";
> > +
> > +            cpu{{ i }}_intc: interrupt-controller@{{ i }} {
> > +                #interrupt-cells = <0x01>;
> > +                interrupt-controller;
> > +                compatible = "riscv,cpu-intc";
> > +            };
> > +        };
> > +{% endfor %}
> > +        cpu-map {
> > +
> > +            cluster0 {
> > +{% for i in range(ncpus) %}
> > +                core{{ i }} {
> > +                    cpu = <&cpu{{ i }}>;
> > +                };
> > +{% endfor %}
> > +            };
> > +        };
> > +    };
> > +
> > +    soc {
> > +        #address-cells = <0x02>;
> > +        #size-cells = <0x02>;
> > +        compatible = "simple-bus";
> > +        ranges;
> > +
> > +        serial@10000000 {
> > +            interrupts = <{{ QEMU_UART0_IRQ }} {{ IRQ_TYPE_LEVEL_HIGH }}>;
> > +            interrupt-parent = <&aplic_s>;
> > +            clock-frequency = <{{ QEMU_UART_CLOCK_FREQUENCY }}>;
> > +            reg = <0x00 0x10000000 0x00 0x100>;
> > +            compatible = "ns16550a";
> > +        };
> > +
> > +        aplic_s: aplic@d000000 {
> > +            riscv,num-sources = <{{ QEMU_IRQCHIP_NUM_SOURCES }}>;
> > +            reg = <0x00 0xd000000 0x00 0x8000>;
> > +            msi-parent = <&imsic_s>;
> > +            interrupt-controller;
> > +            #interrupt-cells = <{{ APLIC_IRQ_CELLS }}>;
> > +            compatible = "riscv,aplic";
> > +        };
> > +
> > +        aplic@c000000 {
> > +            riscv,delegate = <&aplic_s 0x01 {{ QEMU_IRQCHIP_NUM_SOURCES }}>;
> 
> It seems like `riscv,delegate` was deprecated in QEMU 9.1 and has been removed in QEMU 11.0. The
> property defined by the APLIC device-tree binding is `riscv,delegation`.
Thanks for this catch, it seems `riscv,delegate` was kept as an alias
until its entire removal in QEMU 11.0.

I will change it to `riscv,delegation` in v3.
> 
> See:
> https://lists.gnu.org/archive/html/qemu-devel/2026-03/msg01459.html
> 
> > +            riscv,children = <&aplic_s>;
> > +            riscv,num-sources = <{{ QEMU_IRQCHIP_NUM_SOURCES }}>;
> > +            reg = <0x00 0xc000000 0x00 0x8000>;
> > +            msi-parent = <&imsic_m>;
> > +            interrupt-controller;
> > +            #interrupt-cells = <{{ APLIC_IRQ_CELLS }}>;
> > +            compatible = "riscv,aplic";
> > +        };
> > +
> > +        imsic_s: imsics@28000000 {
> > +            riscv,num-ids = <{{ QEMU_IRQCHIP_NUM_MSIS }}>;
> > +            reg = <0x00 0x28000000 0x00 0x{{ '%x' % (ncpus * QEMU_IMSIC_PAGE_SZ) }}>;
> > +            interrupts-extended = <
> > +                {%- for i in range(ncpus) %}
> > +                    &cpu{{ i }}_intc {{ IRQ_S_EXT }}
> > +                {%- endfor %}
> > +            >;
> > +            msi-controller;
> > +            interrupt-controller;
> > +            #interrupt-cells = <0x00>;
> > +            compatible = "riscv,imsics";
> > +        };
> > +
> > +        imsic_m: imsics@24000000 {
> > +            riscv,num-ids = <{{ QEMU_IRQCHIP_NUM_MSIS }}>;
> > +            reg = <0x00 0x24000000 0x00 0x{{ '%x' % (ncpus * QEMU_IMSIC_PAGE_SZ) }}>;
> > +            interrupts-extended = <
> > +                {%- for i in range(ncpus) %}
> > +                    &cpu{{ i }}_intc {{ IRQ_M_EXT }}
> > +                {%- endfor %}
> > +            >;
> > +            msi-controller;
> > +            interrupt-controller;
> > +            #interrupt-cells = <0x00>;
> > +            compatible = "riscv,imsics";
> > +        };
> > +
> > +        clint@2000000 {
> > +            interrupts-extended = <
> > +                {%- for i in range(ncpus) %}
> > +                    &cpu{{ i }}_intc {{ IRQ_M_SOFT }} &cpu{{ i }}_intc {{ IRQ_M_TIMER }}
> > +                {%- endfor %}
> > +            >;
> > +            reg = <0x00 0x2000000 0x00 0x10000>;
> > +            compatible = "sifive,clint0", "riscv,clint0";
> > +        };
> > +    };
> > +
> > +    chosen {
> > +        stdout-path = "/soc/serial@10000000";
> > +        xen,xen-bootargs = "{{ xen_bootargs }}";
> > +    };
> > +};
> > 
> 
> Zhang
> 
> 
> 
> 



