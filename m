Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12123C79F82
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 19:21:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1409071.1641266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2ZTe-0000d7-00; Fri, 04 Sep 2026 19:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1409071.1641266; Fri, 04 Sep 2026 19:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2ZTd-0000d0-Tg; Fri, 04 Sep 2026 19:21:29 +0000
Received: by outflank-mailman (input) for mailman id 1409071;
 Fri, 04 Sep 2026 19:21:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1x2ZTc-0000cu-Io
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 19:21:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1x2ZTb-005NUe-28;
 Fri, 04 Sep 2026 19:21:27 +0000
Received: from 2a01cb08929da000b174d1b7ad985933.ipv6.abo.wanadoo.fr
 ([2a01:cb08:929d:a000:b174:d1b7:ad98:5933])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1x2ZTa-00Co0D-0n;
 Fri, 04 Sep 2026 19:21:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Zwsb2vulpDjYukfWgtMuZHAe4zYpD2FqWIcPvD8JMUE=; b=ehoVHju0pfdt5X7ZapC+4FXxnY
	KjkMbk38QsZq7dmfzASioMaP7vcbDg6/QfnttQ77BIDayns+BusgRJ0nOcSy76J4P80TAswiJh+cz
	jMQsfmNcqM31EEvSXnXkXP9B0adMb476NKWb8c437H4kNWgTkI+Bwf7P3N72bCLdDoCs=;
Message-ID: <7d6ffbc7-83e7-4254-9cc2-f2a7113088ab@xen.org>
Date: Fri, 4 Sep 2026 21:21:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for 4.23] Add GIC SGI boot/self tests in Xen
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger@xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20260529170956.49797-1-ayan.kumar.halder@amd.com>
 <20260828102933.2853627-1-ayan.kumar.halder@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260828102933.2853627-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

It is usually preferred to send a new version in its own thread rather 
than in-reply-to an existing version.

On 28/08/2026 12:29, Ayan Kumar Halder wrote:
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index b7afd3e58c..71f177824b 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -24,6 +24,7 @@ obj-y += domctl.o
>   obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>   obj-y += efi/
>   obj-y += gic.o
> +obj-$(CONFIG_BOOT_SELFTEST) += gic-test.o
>   obj-$(CONFIG_GICV2) += gic-v2.o
>   obj-$(CONFIG_GICV3) += gic-v3.o
>   obj-$(CONFIG_HAS_ITS) += gic-v3-its.o
> diff --git a/xen/arch/arm/gic-test.c b/xen/arch/arm/gic-test.c
> new file mode 100644
> index 0000000000..9ddd47cad2
> --- /dev/null
> +++ b/xen/arch/arm/gic-test.c
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */

The preferred license for Xen is GPLv2-only (see COPYING). Can you 
confirm the use of GPL2+ is intended?

> +
> +#include <xen/atomic.h>
> +#include <xen/cpumask.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/param.h>
> +#include <xen/percpu.h>
> +#include <xen/smp.h>
> +#include <xen/time.h>
> +#include <asm/gic.h>
> +#include <asm/processor.h>
> +#include <asm/setup.h>
> +
> +static bool __initdata opt_gic_test;
> +boolean_param("gic-test", opt_gic_test);
> +
> +static DEFINE_PER_CPU(unsigned int, sgi_test_count);
> +
> +void gic_sgi_test_interrupt(void)
> +{
> +    this_cpu(sgi_test_count)++;

In sgi_count(), you are using ACCESS_ONCE() to read the content of the 
variable, but I am not entirely sure this_cpu(...)++ is guarantee to be 
a single write.

As this happen on different CPU, don't we also need to use ACCESS_ONCE() 
here too or atomically increment?

[...]

> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 078049e741..6a132c64e1 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -330,6 +330,11 @@ static void do_static_sgi(struct cpu_user_regs *regs, enum gic_sgi sgi)
>       case GIC_SGI_CALL_FUNCTION:
>           smp_call_function_interrupt();
>           break;
> +#ifdef CONFIG_BOOT_SELFTEST
> +    case GIC_SGI_TEST:
> +        gic_sgi_test_interrupt();
> +        break;
> +#endif
>       default:
>           panic("Unhandled SGI %d on CPU%d\n", sgi, smp_processor_id());
>           break;
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
> index ee2c26adb4..40635a9d32 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -306,6 +306,9 @@ enum gic_sgi {
>       GIC_SGI_EVENT_CHECK,
>       GIC_SGI_DUMP_STATE,
>       GIC_SGI_CALL_FUNCTION,
> +#ifdef CONFIG_BOOT_SELFTEST
> +    GIC_SGI_TEST,
> +#endif
>       GIC_SGI_STATIC_MAX,
>   };
>   
> @@ -321,6 +324,11 @@ extern void send_SGI_one(unsigned int cpu, enum gic_sgi sgi);
>   extern void send_SGI_self(enum gic_sgi sgi);
>   extern void send_SGI_allbutself(enum gic_sgi sgi);
>   
> +#ifdef CONFIG_BOOT_SELFTEST
> +/* Record a GIC_SGI_TEST delivered to this CPU (see arch/arm/gic-test.c). */

I would suggest to remove (see ...). One can easily find 
gic_sgi_test_interrupt() and this reduces the risk of stale file name.

> +void gic_sgi_test_interrupt(void);
> +#endif
> +
>   /* print useful debug info */
>   extern void gic_dump_info(struct vcpu *v);
>   extern void gic_dump_vgic_info(struct vcpu *v);
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 0adfa4993a..2fdf5da526 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -50,6 +50,15 @@ void setup_mm(void);
>   extern uint32_t hyp_traps_vector[];
>   void init_traps(void);
>   
> +#ifdef CONFIG_BOOT_SELFTEST
> +#define __initcallboottest(fn) \
> +    static const initcall_t __initcall_##fn __init_call("boottest") = (fn)
> +
> +void do_init_boottests(void);
> +#else
> +static inline void do_init_boottests(void) {}
> +#endif
> +
>   int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>                     struct rangeset *iomem_ranges, struct rangeset *irq_ranges);
>   
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 6310a47d68..c7abbdb04e 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -83,6 +83,24 @@ static void __init init_idle_domain(void)
>       /* TODO: setup_idle_pagetable(); */
>   }
>   
> +#ifdef CONFIG_BOOT_SELFTEST
> +extern const initcall_t __initcall_boot_test_start[],
> +    __initcall_boot_test_end[];
> +
> +void do_init_boottests(void)
> +{
> +    const initcall_t *call;
> +
> +    printk("CPU%u: boot self-tests start\n", smp_processor_id());
> +
> +    for ( call = __initcall_boot_test_start; call < __initcall_boot_test_end;
> +          call++ )
> +        (*call)();
> +
> +    printk("CPU%u: boot self-tests done\n", smp_processor_id());
> +}
> +#endif /* CONFIG_BOOT_SELFTEST */
> +
>   static const char * __initdata processor_implementers[] = {
>       ['A'] = "ARM Limited",
>       ['B'] = "Broadcom Corporation",
> @@ -470,6 +488,8 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
>       enable_errata_workarounds();
>       enable_cpu_features();
>   
> +    do_init_boottests();
> +
>       /* Create initial domain 0. */
>       if ( !is_dom0less_mode() )
>           create_dom0();
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 1806c47a08..97d8b19cf4 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -28,6 +28,7 @@
>   #include <asm/gic.h>
>   #include <asm/procinfo.h>
>   #include <asm/psci.h>
> +#include <asm/setup.h>

Style: I think this wants to go after asm/tee/tee.h (acpi.h seems to be 
misplaced).

>   #include <asm/acpi.h>
>   #include <asm/tee/tee.h>
>   
> @@ -413,6 +414,8 @@ void asmlinkage noreturn start_secondary(void)
>   
>       printk(XENLOG_DEBUG "CPU %u booted.\n", smp_processor_id());
>   
> +    do_init_boottests();
> +
>       startup_cpu_idle_loop();
>   }
>   
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 2d5f1c516d..14f64a856c 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -146,6 +146,10 @@ SECTIONS
>          *(.initcall1.init)
>          __initcall_end = .;
>   
> +       __initcall_boot_test_start = .;
> +       *(.initcallboottest.init)
> +       __initcall_boot_test_end = .;
> +
>          . = ALIGN(4);
>          __alt_instructions = .;
>          *(.altinstructions)

Cheers,

-- 
Julien Grall


