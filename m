Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ABAC982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 11:14:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428667.1651555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yRm-0003eP-Ul; Tue, 22 Sep 2026 11:14:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428667.1651555; Tue, 22 Sep 2026 11:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8yRm-0003eI-Rz; Tue, 22 Sep 2026 11:14:02 +0000
Received: by outflank-mailman (input) for mailman id 1428667;
 Tue, 22 Sep 2026 11:14:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c8d2938d00072c4@swg.vates.tech>)
 id 1x8yRl-0003e9-Ot
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 11:14:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8yRl-00H0l9-5d
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:14:01 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c8d2938d00072c4@swg.vates.tech>)
 id 6ab262f1-2eae-0a2a0a5409dd-0a2a4505c8aa-20
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:14:01 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c8d2938d00072c4@swg.vates.tech>)
 id 6ab262f8-4cb1-0a2a45050019-b9ff1c128281-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 13:14:01 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0c8d2938d00072c4.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 22 Sep 2026 11:13:58 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id D0B1681EE1;
 Tue, 22 Sep 2026 13:13:57 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Bc983mqIN/OhEzDtgmkssTtzYaGestV8BVI0ZDrJsxk=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=BsYiyI9yhNcvUiSPbQaj4luzL8s58y269IOjh5RHsljL9IQhFJfNLIXyDHhtApA/zS1oYOt4E
 qWvD9SKDmYMvnM29Z5hzH6znWX3QycZontwEQGqjxDpLqInktYiRUcCkoXJBkdC1u3sB+6o7cOV
 sMw8R73pyi1AN/whCXY+IR1mLaVkMzNoBEUOFq0Xe1J5P7F1TzlYqQmi119OBgqYf6Z+KmffaRc
 zpIU75FTcD1vymdKc088E/LQvQOfeMQ4etmdpV/PKf/yvFq8Oub7OfAhYHtbxMavjlCHPvApr/f
 VChcWpKp+1PBoyMecP3dnn0Id1rKifeDJZ7NxltXDFiA==
X-Zone-Loop: a7de05ac8a73b9eed75b57e0408ce8ac93261dbce1b1
x-campaign-type: default
x-transaction-id: f2216b80-86cd-4816-b31b-8a38f2e3bd66
x-swg-uid: 01-80e48890-03ee-44e2-8077-504920db1cb1
X-Mailer: Sweego
Message-ID:
 <1790075638.8631fc262581453bbf619ec5b2062170.1a0c8d2938d00072c4@vates.tech>
x-swg-bid: 1790075638.8631fc262581453bbf619ec5b2062170.1a0c8d2938d00072c4
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
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <DLL1XT72ENNK.1JVZY0R4A671X@amd.com>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1050000c4f3@vates.tech>
 <DLL1XT72ENNK.1JVZY0R4A671X@amd.com>
Date: Tue, 22 Sep 2026 13:13:52 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790075632; l=8595;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=h+kSThFqulh0xhQbSa4PKy+YKm1jgEnMVYDMs03cUOg=;
 b=qqjCzbr1Nnq+cY8JsHPAGCi3nBFHQ3lD043vdSe5Ib1cnpIpCht6IQOhhJ5NvWBcZyW1UNA8H
 xyY0p1zn2tEDYPgcicIskbTzbF+ubPA46IdU2nSya5ozCyTJ1yfRURU
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790075637953
X-purgate-ID: tlsNG-c201ff/1790075641-F5EA92A1-A8744F0E/0/0
X-purgate-type: clean
X-purgate-size: 8599

On 2026-09-21 16:08 +0200, Alejandro Vallejo wrote:
> On Thu Aug 27, 2026 at 11:42 AM CEST, Baptiste Le Duc wrote:
> > The dom0less RISC-V smoke tests need a host device tree describing the
> > platform (CPUs, APLIC/IMSIC, uart). It varies per machine (hart count, MMU
> > type), so a single static .dts cannot cover the test matrix.
> >
> > Add dts/qemu-host.dts.j2, a template of the QEMU virt platform in
> > aia=aplic-imsic mode: per-hart cpu/cpu-intc nodes, the M- and S-mode APLIC
> > and IMSIC pairs, CLINT and the ns16550a uart. It takes ncpus, mmu_type and
> > xen_bootargs as arguments.
> 
> Alternatively, why not query it from qemu itself? See
> "-machine dumpdtb=dump.dtb" in "qemu-smoke-dom0less-arm64.sh"
This matches what we had originally downstream. We found it easier
because using a template avoids a series of fdtput calls to add
passthrough nodes such as fakedevice nodes that will be introduced in
next patch series which are used to assert a manually triggered irq
reached the expected smp.

> 
> Then you can use fdtput to add nodes as needed, with all hardware being
> consistent with QEMU without undue magic replacements. Having a
> configurable .dts seems like a silent mistake about to happen.
> 
> Check out that file of arm automation for DTB manipulation. I think it's
> best if all DTB ports behave the same way.
> 
> Cheers,
> Alejandro
> 
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
> 
> 
> 



