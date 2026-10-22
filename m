Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26C3606A319
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 14:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gvBWFzMj
Received: from list by lists.xenproject.org with outflank-mailman.1458229.1670628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJtMr-00026p-Id; Thu, 22 Oct 2026 14:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458229.1670628; Thu, 22 Oct 2026 14:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJtMr-00026i-Fb; Thu, 22 Oct 2026 14:02:05 +0000
Received: by outflank-mailman (input) for mailman id 1458229;
 Thu, 22 Oct 2026 14:02:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xJtMp-00026c-U2
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 14:02:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJtMp-007D7D-Al
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 16:02:03 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ada174e-e002-0a2a0a5209dd-0a2a4503df58-28
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 16:02:03 +0200
Received: from [209.85.208.48] (helo=mail-ed1-f48.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ada175b-fae8-0a2a45030019-d155d030d469-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 16:02:03 +0200
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6af9a9451daso2828540a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 07:02:03 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-67-71.play-internet.pl.
 [109.243.67.71]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b402f2c2dfsm1826889a12.1.2026.10.22.07.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 07:02:00 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792677723; x=1793282523; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QRNX6rUTXBQF2KsfYxNrV+t0oPnCnyHjH/Lci/dShOg=;
        b=gvBWFzMjupYix4NPAGF7dtEnx3S+S7X5Rz5unegYMVQuFiviwgxyxL7lFTezqpfFhE
         0xfR9z5QIsprYvtljI56eML5PTGJqp/Ize554BU7nSvDU9PR0ttRPxK4PrfDKqB/M6i1
         CUkE1mEUbzq1tm0nAiwiTAgBcknoAtZcIiLmfK/tSt/hubgpaPLLs/7QDmH1CwZq492e
         EfrWSxUvzq4waCrEm9S+3drSnH5cyZ3IlJwKDHW/zHOD5Bh0Sn1W9/h1XEDQ7f25XnaA
         UHH3jK9KwM5DS57kRbFi4/d/icRcjEMDitsagOTTsZhMaeIOJpLKGsrPluVDViHvRAHK
         o6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677723; x=1793282523;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRNX6rUTXBQF2KsfYxNrV+t0oPnCnyHjH/Lci/dShOg=;
        b=mhrGLi69haYU2/ShsbOqGA0hnJH2jYk0GESph7VY22IwpL1X1ZOuxoWciLPy3p3zlQ
         NyVWEKWZJ1kgH6alyhMJctZE9jh/7k5poPyIIoM32WbA8/Xo0aY+NkFel6U0vIiQunDX
         JUTUKM1wfesbBpbUYyJVlojcD8msobJyt0Tl7Yx8DTl9T3ZXEGEhGLTwxxFcIurMRUOG
         bHOxx+P418vOE6ry4Wp0Mk373MBRlNATyKpaHY5p0s2bOaOqX23ufBiHBfglUbpzFZKy
         2qM+yqDb3J2KAwJzRLUJZJm2EUJPvOV0IkBQ0PhU4oUE6cVNkKYdKuabIk/iucfJrg5I
         dQOw==
X-Forwarded-Encrypted: i=1; AKwUvBy1fsPzOmY19JV/5rKA6bm5z4tB3LUgv9nYRYl1vmx2k3ugQRLA704cMWMR1RgnQGvuNJbaKo2Z6I4=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKgnVXpTKxJobQiS212aQUD4g3nXtn2DYdlAQ7iE3BuCylPAt/Y
	9rDtSiFOxEeQcqu5w7VGt0ZvuZb4zFOoJZUezG/HCf3CDzhC0Y/jcBlg
X-Gm-Gg: AYBFou2lpL6KPtX6dUqmxwmgKT1axk98GIPbv7z/1cdQPXh9hqepknWzL3siNUfdBZs
	6jPvYSMM+diMISc2DVol0+6RQEMO07a5XQbmVZrCmFqG/2iYfzkMZjozn+DrPnLonJW74a7KocN
	0/r6qEjKttL2T0qkyJaK3dlnz1nmwwkFLQyEHkxEyTec5bI4+FrammVyx6EwQrx88f+AU6kl37Y
	f5Q/d1rBNya1JA88D9CVNWqt1yZj+czl3rkrhRtE3fdMyJ1CMX2FcyActUnqE/9vJ1UWn2/a8ug
	YpBoW84tj1v58Vb5/J9Yo4Mpec0m3Re5UCf/8rZ+wLkGHrm+xr2xpFR5MQuyleYVHVUsXlkCdFN
	ZRfsFZzYi/SRqGuoXOpnWcpEZI06XfUWLsp+iCI9f7Lt0pesXgKKK3EtWvP0Z6BP1ynaqsP73WL
	MnvzRBivKaKk8wlkJ99x2RYJI0tjLYXAxJhVqU1OlWlgPDUmHXbVLl1YeBcZstFXw4hQD7AftuQ
	AL1HS+17H8XZSBgtqzaKp/dxLm0a5cuMyq1m6gTGgfWrq+IL8hDSUZFnDWua2FjgGR5fPMTLO9L
	LXOpDSgaw3CFwyekPxbtqbAqnf/tlMxLquxjrCXXQlK17Lj/Ww==
X-Received: by 2002:a05:6402:11cc:b0:6aa:1112:62f2 with SMTP id 4fb4d7f45d1cf-6b408ea1659mr4951533a12.15.1792677721310;
        Thu, 22 Oct 2026 07:02:01 -0700 (PDT)
Message-ID: <3fd7584a-786a-4742-9f3a-aee8dfa42e43@gmail.com>
Date: Thu, 22 Oct 2026 16:01:59 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] automation/qtb: add jinja2 device trees for
 riscv64 smoke tests
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1787823334.8631fc262581453bbf619ec5b2062170.1a04293255c000c4f3@vates.tech>
 <1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1050000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1787823788.8631fc262581453bbf619ec5b2062170.1a0429a1050000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1792677723-76CF84E9-766C32E8/10/73395122804
X-purgate-type: spam
X-purgate-size: 9571
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 8/27/26 11:42 AM, Baptiste Le Duc wrote:
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

We want to have more strong position why we need a template for host 
instead of using what QEMU could provide with --machinedump. Probably we 
want to double check again if --machinedump isn't enough... But I am 
okay to proceed with template too.

> The template is inert on its own: the generated dtb will be used in next
> patch.

Please describe what the template is for instead of referring to the
next patch: the commit message should stand on its own.

> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> ---
>   .../scripts/qtb/riscv/dts/qemu-host.dts.j2    | 160 ++++++++++++++++++
>   1 file changed, 160 insertions(+)
>   create mode 100644 automation/scripts/qtb/riscv/dts/qemu-host.dts.j2
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

What if virt.h here?

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

Probably, it could also make sense to not hard-code isa property as 
potentiall we could have tests with different set of extensions.

Also, this is a hand-picked subset: Zicbom/Zicboz/Zicbop are missing 
although their block sizes are set just above. I haven't checked what 
will be needed in Xen to support this extension (or if we could count 
them as supported...) until this isn't clarified it seems like it will 
be better to drop:
+            riscv,cbop-block-size = <0x40>;
+            riscv,cboz-block-size = <0x40>;
+            riscv,cbom-block-size = <0x40>;

> +            mmu-type = "riscv,{{ mmu_type }}";

Xen doesn't read mmu-type from the host CPU nodes: it is parsed only
from dom0less domain nodes (arch_parse_dom0less_node()). The host
stage-1 mode is fixed at build time (RV_STAGE1_MODE), and the G-stage
mode is detected at runtime by probing hgatp. So mmu_type has no effect
on Xen, and "It varies per machine (hart count, MMU type)" doesn't hold
for the MMU type.

It also makes the DT inaccurate: per the binding, mmu-type is the
largest translation mode the hart supports, which is sv57 for QEMU's
rv64 (that's what QEMU puts there), while the default here is sv48. If
the intent is to choose a guest's MMU mode, it belongs to the DomU
node.

> +
> +            cpu{{ i }}_intc: interrupt-controller@{{ i }} {

The node has a unit address but no reg, which makes dtc warn
(unit_address_vs_reg). QEMU and the binding use plain
"interrupt-controller".

It seems like removing of "@{{ i }}" could be enough.

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

The binding requires compatible = "qemu,aplic", "riscv,aplic", which is
also what QEMU generates. The same applies to both APLICs, and to the
IMSICs below ("qemu,imsics", "riscv,imsics").

> +        };
> +
> +        aplic@c000000 {
> +            riscv,delegate = <&aplic_s 0x01 {{ QEMU_IRQCHIP_NUM_SOURCES }}>;

The binding names this property riscv,delegation. QEMU emits both
riscv,delegate and riscv,delegation, while the template has only the
former.

~ Oleksii

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


