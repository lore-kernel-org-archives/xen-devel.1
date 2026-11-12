Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA59606A330
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zkUp9b1R
Received: from list by lists.xenproject.org with outflank-mailman.1486069.1688998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRWpQ-0004Ik-1b; Thu, 12 Nov 2026 15:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486069.1688998; Thu, 12 Nov 2026 15:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRWpP-0004Id-VG; Thu, 12 Nov 2026 15:35:07 +0000
Received: by outflank-mailman (input) for mailman id 1486069;
 Thu, 12 Nov 2026 15:35:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRWpN-0004IX-S4
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 15:35:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRWpN-007MHX-8m
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 16:35:05 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af5dca7-e002-0a2a0a5209dd-0a2a450ce00c-8
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 16:35:05 +0100
Received: from [209.85.218.53] (helo=mail-ej1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af5dca9-f479-0a2a450c0019-d155da35e8a9-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 16:35:05 +0100
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-c3f04e0e65fso664082166b.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 07:35:05 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a628c6bsm364094766b.56.2026.11.12.07.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 07:35:03 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497705; x=1795102505; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92kvEt8eBig87CcucWfBJAX+dedWdGzGzxvecPr3yR0=;
        b=zkUp9b1RCF79Gm04SKlKbj1OQ6zeTDWDK+NJGk0IC/916LTBmwIdGlLXN6gZVqGzrf
         gZDFnVsibqkwQZjz4EBgU9J6MFyYHG7+V23W5spiBYY+sH1f+mQuFXZZOE7ClkSrRS8m
         LUlpIYdfO3+z/LfFkPfuRxiIAFiT2k1PUTzmYymhxCOBtRCz7lDqmbTBnU2dZuG+n71w
         tNsHfyUhpD0GrAFdF+RMI2nPag/gZvkzHMSiLVPfRUBMSkhsZMCdYO895hIkFU0oufRT
         ppn1VqbZFJK5H96s161YIxY3X0c92vm69+wUq7PJU4ed1nBJXcAuzWpxY9YZqId3jfKR
         WkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497705; x=1795102505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92kvEt8eBig87CcucWfBJAX+dedWdGzGzxvecPr3yR0=;
        b=I7jXWhfI6D5SPl1PZ/Ek9gzLuMRU1VgfgDXDf8/vY/4Pqv9BRUQ7unGTGiRreBjYNi
         3Bi3WzJB7cc8l0uKbcw4aWE0pDEq8wy96njqJ8eK8iRNSFB1N7J7SQVJ8o5UeiErSJxC
         MY5WSDhZp/8lhC4BZv6dnMzF/hlHmclmXE09f7wh/7gi2mfEyNe55UREeZKL1kFFZ05Y
         8/KWl+ty1tm4BRim4nBgi5wy0HHfvVX/xOVwU9rPrOj9Cu8n67BMOTHUyRKdxpCPWKt5
         6LivCKjqzX0Wokvru0Y9uFb2+b31NUiYKER5OXBXrMptxV31XQIAmkyK/Y7d1nhZ1iQY
         DXuw==
X-Forwarded-Encrypted: i=1; AL+hErHk8+c+BB5Ckbc7ObN94Z+IrWhRJBq+cVh7LyA+dFWe2DMUde2z8i5P7gSMz8Ne66/hmN/1pwXcvQQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9hpzya6O+edR8KgghU0/FOKQsCuC+IatnV6l2BTtEXpOQ5FONe
	ym8O4TVseiCuAYzGY9EWED9ysbnTCcOMTbQ/+MGmbag0N8mHieP91Fnz
X-Gm-Gg: AYBFou3Be6Eky9RShhCwIdeXoLMUcqHOGwmZ/tWMvPK47DriAsT77DaG5WIC9LEHmq7
	1v9FTkw9wAVmmPucmDi+NSosWbkF3gama+f7LTgCvIJQcsgMrc7phsILvp+sx+jy+O01sVzltYU
	vtF1HSWY2H7Nd3eQtNR3THTzbzVvoPzxqL+AD+mT+mQcV9dC6FoiwoWHj7d57a3VDjudI1Xxco4
	Hx6Dk4UpQgGLhNtzUA7nUlBz/Qpy3t4pKcgu3qevuc2gRZDUsco4d/4MKXjM4/3V9mFTQZZijGs
	LY3dv4IQSZoH1/xX3L9XQ5ReXnMqllhKGANzZVTfPvjafOStK4+bGzs1/KJ69+FFaeRDGlg07Pd
	8pFooff617ShNOaAGO54cDJ6Ol0Va5tpubemqHttIgcKbYq3J6TvsTa2i34p65yceD9EgqzQN8Q
	T25PT+z+JhydjhPdlE8ppzI0vkm3kalZRgWaTDl5ebvBwH7gXk8LQnec/hFZzVqtrDT4pmBJSfx
	sDivClgYvz3pX2UENThOSzXbh814tx+mVMxAMTUgiPTT2wnT/D1hMdmqlOgzCPnSEYqu6gLIfFA
	LyoPXqiuOP8Va2bYOPuyCWFRQJ+LxzBEYgUnWl2/Bm6K9/ldZHaqPBVUJ2oiMr9fB64I1bK1HXb
	6FFEOLXE+PVpQwuwyYFBKDsA=
X-Received: by 2002:a17:907:9455:b0:c50:576f:b3a8 with SMTP id a640c23a62f3a-c5066de1e00mr626681266b.48.1794497704289;
        Thu, 12 Nov 2026 07:35:04 -0800 (PST)
Message-ID: <8d070a71-74a2-43f8-8f6b-ef7f225ca419@gmail.com>
Date: Thu, 12 Nov 2026 16:35:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/26] emul/vuart: introduce framework for UART
 emulators
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-2-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1794497705-5093EA5B-1F8531A4/10/73395122804
X-purgate-type: spam
X-purgate-size: 17388
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/11/26 8:47 PM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce a driver framework to abstract UART emulators in the hypervisor.
> 
> That allows for architecture-independent handling of virtual UARTs in
> the console driver and simplifies enabling new UART emulators.
> 
> The framework is built under CONFIG_VUART_FRAMEWORK, which will be
> automatically enabled once the user enables any UART emulator.
> 
> Current implementation supports maximum of one vUART of each kind per
> domain.

d->console->vuart is a single pointer and vuart_init() returns -EBUSY
if it is already set, so it is one vUART per domain in total, not one
of each kind.

> 
> Use new domain_has_vuart() in the console driver code to check whether
> to forward console input to the domain using vUART.
> 
> Enable console forwarding over vUART for hardware domains with a vUART.
> That enables console forwarding to dom0 on x86, since console can be
> forwarded only to Xen, dom0 and pvshim on x86 as of now.
> 
> Note: existing vUARTs are deliberately *not* hooked to the new framework
> to minimize the scope of the patch: vpl011 (i.e. SBSA) emulator and
> "vuart" (i.e.  minimalistic MMIO-mapped dtuart for hwdoms on Arm) are
> kept unmodified.
> 
> No functional changes for non-x86 architectures.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/arch/arm/xen.lds.S           |   1 +
>   xen/arch/ppc/xen.lds.S           |   1 +
>   xen/arch/riscv/xen.lds.S         |   1 +
>   xen/arch/x86/xen.lds.S           |   1 +
>   xen/common/Kconfig               |   2 +
>   xen/common/Makefile              |   1 +
>   xen/common/emul/Kconfig          |   6 ++
>   xen/common/emul/Makefile         |   1 +
>   xen/common/emul/vuart/Kconfig    |   6 ++
>   xen/common/emul/vuart/Makefile   |   1 +
>   xen/common/emul/vuart/ns165x50.c |   0

This adds an empty file whose name looks like a typo of ns16x50.c.
Please drop it.

>   xen/common/emul/vuart/vuart.c    | 173 +++++++++++++++++++++++++++++++
>   xen/common/keyhandler.c          |   3 +
>   xen/drivers/char/console.c       |   6 +-
>   xen/include/xen/sched.h          |   5 +
>   xen/include/xen/serial.h         |   5 +
>   xen/include/xen/vuart.h          | 115 ++++++++++++++++++++
>   xen/include/xen/xen.lds.h        |  10 ++
>   18 files changed, 337 insertions(+), 1 deletion(-)
>   create mode 100644 xen/common/emul/Kconfig
>   create mode 100644 xen/common/emul/Makefile
>   create mode 100644 xen/common/emul/vuart/Kconfig
>   create mode 100644 xen/common/emul/vuart/Makefile
>   create mode 100644 xen/common/emul/vuart/ns165x50.c
>   create mode 100644 xen/common/emul/vuart/vuart.c
>   create mode 100644 xen/include/xen/vuart.h
> 

[...]

> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index f69d47d18934..60f2d9087589 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_DEVICE_TREE_PARSE) += device-tree/
>   obj-$(CONFIG_IOREQ_SERVER) += dm.o
>   obj-y += domain.o
>   obj-y += domid.o
> +obj-y += emul/

I think this doesn't make much difference at the moment, but it might be 
useful to make this conditional so that architectures that don't need 
any emulators can exclude them and save some space.

[...]

> diff --git a/xen/common/emul/vuart/ns165x50.c b/xen/common/emul/vuart/ns165x50.c
> new file mode 100644
> index 000000000000..e69de29bb2d1

This adds an empty file whose name looks like a typo of ns16x50.c.
Please drop it.

> diff --git a/xen/common/emul/vuart/vuart.c b/xen/common/emul/vuart/vuart.c
> new file mode 100644
> index 000000000000..bd3b756fb4d6
> --- /dev/null
> +++ b/xen/common/emul/vuart/vuart.c
> @@ -0,0 +1,173 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * UART emulator framework.
> + *

Is this line with only one start really needed?

> + */
> +
> +#include <asm/types.h>

Nit: xen/ headers usually come before asm/ ones.

Also, I think it will be better to use xen/types.h to avoid depenendcy 
in common code from arch-specific headers.

> +
> +#include <xen/err.h>
> +#include <xen/resource.h>
> +#include <xen/sched.h>
> +#include <xen/vuart.h>
> +#include <xen/xvmalloc.h>
> +
> +#define for_each_emulator(e) \
> +    for ( e = vuart_array_start; e < vuart_array_end; e++ )
> +
> +extern const struct vuart_emulator vuart_array_start[];
> +extern const struct vuart_emulator vuart_array_end[];
> +
> +static const struct vuart_emulator *
> +vuart_match_by_compatible(const struct domain *d, const char *compat)
> +{
> +    const struct vuart_emulator *emulator;
> +
> +    for_each_emulator(emulator)
> +        if ( emulator->compatible &&
> +             !strncmp(compat, emulator->compatible,
> +                      strlen(emulator->compatible)) )
> +            return emulator;

This is a prefix match: "ns16550foo" matches "ns16550", and if one
emulator's compatible is a prefix of another's, whichever is linked
first wins. Is that intended? If not, a plain strcmp() would do.

Also, d is unused, and struct vuart_emulator documents compatible as
"Cannot be NULL or empty", so the NULL check either isn't needed or the
comment should say otherwise, or just ASSERT() will be enough here.

> +
> +    return NULL;
> +}
> +
> +const static struct vuart *

Nit: static const.

> +vuart_find_by_flags(const struct domain *d, unsigned int flags)
> +{
> +    const struct vuart *vuart = d->console->vuart;
> +
> +    if ( vuart && (vuart->info->flags & flags) )
> +        return vuart;
> +
> +    return NULL;
> +}
> +
> +struct vuart *vuart_find_by_resource(const struct domain *d,
> +                                     unsigned int type,
> +                                     unsigned long addr,
> +                                     unsigned long size)
> +{
> +    struct vuart *vuart = d->console->vuart;
> +
> +    if ( vuart &&
> +         (type & vuart->info->base_type) &&
> +         addr >= vuart->info->base_addr &&
> +         addr + size <= vuart->info->base_addr + vuart->info->size )
> +        return vuart;

This has no user in this patch; Wouldn't it better to introduce together 
with its first user? Also, base_addr is paddr_t while addr/size are 
unsigned long, and addr + size can wrap; checking "size <= base_addr + 
vuart->info->size - addr" after the lower bound avoids that.

> +
> +    return NULL;
> +}
> +
> +int vuart_init(struct domain *d, const struct vuart_info *info)
> +{
> +    const struct vuart_emulator *emulator;
> +    struct vuart *vuart;
> +    int rc;
> +
> +    if ( !info )
> +        return 0; /* Nothing to do */
> +
> +    if ( d->console->vuart )
> +        return -EBUSY;
> +
> +    emulator = vuart_match_by_compatible(d, info->compatible);
> +    if ( !emulator )
> +        return -ENODEV;
> +
> +    vuart = xzalloc(typeof(*vuart));
> +    if ( !vuart )
> +        return -ENOMEM;
> +
> +    vuart->info = xvzalloc(typeof(*vuart->info));
> +    if ( !vuart->info )
> +    {
> +        rc = -ENOMEM;
> +        goto err_out1;
> +    }
> +    memcpy(vuart->info, info, sizeof(*info));

vuart comes from xzalloc() but is released with xvfree() here and with
XVFREE() in vuart_deinit(). That works, since xvfree() falls back to
xfree(), but please pair the allocators. Also, why a separate
allocation for info? Embedding a struct vuart_info in struct vuart
would drop one allocation, one error path and the memcpy().

> +
> +    vuart->vdev = emulator->alloc(d, vuart->info);
> +    if ( IS_ERR(vuart->vdev) )
> +    {
> +        rc = PTR_ERR(vuart->vdev);
> +        goto err_out2;
> +    }
> +
> +    vuart->emulator = emulator;
> +    vuart->owner = d;
> +
> +    d->console->input_allowed = true;
> +    d->console->vuart = vuart;

input_allowed is set regardless of VUART_CONSOLE_INPUT, whereas
vuart_put_rx() and domain_has_vuart() act only on a vUART with that
flag. For a vUART without the flag, the domain becomes selectable with
CTRL-a, but all input to it is dropped silently. Should this be
conditional on info->flags & VUART_CONSOLE_INPUT?

> +
> +    return 0;
> +
> + err_out2:
> +    xvfree(vuart->info);
> + err_out1:
> +    xvfree(vuart);
> +
> +    return rc;
> +}
> +
> +/*
> + * Release any resources taken by UART emulators.
> + *
> + * NB: no flags are cleared, since currently exit() is called only during
> + * domain destroy.

s/exit()/vuart_deinit()/ ?

> + */
> +void vuart_deinit(struct domain *d)
> +{
> +    struct vuart *vuart = d->console->vuart;
> +
> +    if ( vuart )
> +    {
> +        vuart->emulator->free(vuart->vdev);
> +        xvfree(vuart->info);
> +    }
> +
> +    XVFREE(d->console->vuart);
> +}
> +
> +/*
> + * Print emulated UART state on the console.
> + *
> + * Must be called under rcu_lock_domain().

The only caller, dump_domains(), holds rcu_read_lock(&domlist_read_lock)
rather than rcu_lock_domain(). That is fine, but the comment should
match.

[...]


> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -33,6 +33,7 @@
>   #include <xen/dom0less-build.h>
>   #include <xen/sections.h>
>   #include <xen/consoled.h>
> +#include <xen/vuart.h>
>   
>   #ifdef CONFIG_X86
>   #include <asm/guest.h>
> @@ -639,11 +640,12 @@ static void __serial_rx(char c)
>       if ( !d )
>           return;
>   
> -    if ( is_hardware_domain(d) )
> +    if ( is_hardware_domain(d) && !domain_has_vuart(d) )
>       {
>           /*
>            * Deliver input to the hardware domain buffer, unless it is
>            * already full.
> +         * NB: must be the first check: hardware domain may have emulated UART.

The NB is now inside the block it refers to, which makes it hard to
follow. Since the condition itself excludes a hwdom with a vUART, does
the order still matter? If it does, I'd put the note above the if ().

>            */
>           if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
>               serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
> @@ -654,6 +656,8 @@ static void __serial_rx(char c)
>            */
>           send_global_virq(VIRQ_CONSOLE);
>       }
> +    else if ( domain_has_vuart(d) )
> +        rc = vuart_put_rx(d, c);

ns16x50_put_rx() (10/26) returns -EBUSY while LCR.DLAB is set, DLL is 0
or MCR.LOOP is set, i.e. while the guest is programming the UART, so
every character typed in that window is dropped and the warning below
is printed for each of them. Are we okay with that spam even during a 
short peroid?

>   #ifdef CONFIG_SBSA_VUART_CONSOLE
>       else
>           /* Deliver input to the emulated UART. */
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index ce1fa636db36..4fa7f62490ca 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -24,6 +24,7 @@
>   #include <asm/atomic.h>
>   #include <asm/current.h>
>   #include <xen/vpci.h>
> +#include <xen/vuart.h>

struct domain_console only needs a pointer, so a forward declaration
"struct vuart;" is enough.

>   #include <xen/wait.h>
>   #include <public/xen.h>
>   #include <public/domctl.h>
> @@ -382,6 +383,10 @@ struct domain_console {
>       unsigned int idx;
>       spinlock_t lock;
>       char buf[256];
> +
> +#ifdef CONFIG_VUART_FRAMEWORK
> +    struct vuart *vuart;
> +#endif
>   };
>   
>   enum __packed domain_shutdown_state {
> diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
> index 3a71da767dd7..ec481893fede 100644
> --- a/xen/include/xen/serial.h
> +++ b/xen/include/xen/serial.h
> @@ -32,10 +32,15 @@ enum serial_port_state {
>   
>   struct vuart_info {
>       paddr_t base_addr;          /* Base address of the UART */
> +    unsigned int base_type;     /* Base I/O resource type */
>       unsigned long size;         /* Size of the memory region */
>       unsigned long data_off;     /* Data register offset */
>       unsigned long status_off;   /* Status register offset */
>       unsigned long status;       /* Ready status value */
> +    unsigned long flags;        /* Emulation flags */
> +    unsigned int irq;           /* Emulated IRQ # */
> +    char compatible[16];        /* Compatible string */
> +    char name[16];              /* User-friendly name */
>   };

Today struct vuart_info describes a *physical* UART: ns16550.c,
cadence-uart.c and mvebu-uart.c fill it in for Arm's hwdom vuart. With
this change it also becomes the configuration of an *emulated* one, so
every physical driver's instance grows fields that are meaningless for
it, and data_off/status_off/status are meaningless for an emulator. A
separate structure for the emulator configuration would keep the two
apart.

>   
>   struct serial_port {
> diff --git a/xen/include/xen/vuart.h b/xen/include/xen/vuart.h
> new file mode 100644
> index 000000000000..b5785b3c6b8f
> --- /dev/null
> +++ b/xen/include/xen/vuart.h
> @@ -0,0 +1,115 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * UART emulator framework.
> + *

It seems like this line with start should be dropped, shouldn't it?

> + */
> +
> +#ifndef XEN_VUART_H
> +#define XEN_VUART_H
> +
> +#include <xen/serial.h>
> +#include <public/xen.h>
> +
> +struct vuart_emulator;
> +
> +enum {
> +    VUART_CONSOLE_INPUT = BIT(0, U), /* Physical console input forwarding. */
> +};
> +
> +/*
> + * FIXME: #ifdef is temporary to avoid clash with
> + *   arch/arm/include/asm/domain.h
> + */
> +#ifdef CONFIG_VUART_FRAMEWORK
> +struct vuart {

As long as the name clashes with Arm's struct vuart, the framework
can't be enabled on Arm. Picking a non-clashing name now looks simpler
than carrying the FIXME.

> +    const struct vuart_emulator *emulator;
> +    struct vuart_info *info;
> +    struct domain *owner;
> +    void *vdev;
> +};
> +#endif
> +
> +struct vuart_emulator {
> +    /* UART compatible string. Cannot be NULL or empty. */
> +    const char *compatible;
> +
> +    /*
> +     * Allocate emulated UART state (RX/TX FIFOs, locks, initialize registers,
> +     * hook I/O handlers, etc.)
> +     * Cannot be NULL.
> +     */
> +    void *(*alloc)(struct domain *d, const struct vuart_info *info);
> +
> +    /*
> +     * Release resources used to emulate UART state (flush RX/TX FIFOs, unhook
> +     * I/O handlers, etc.).
> +     * Cannot be NULL.
> +     */
> +    void (*free)(void *arg);
> +
> +    /*
> +     * Print emulated UART state (e.g. emulated registers) on the diagnostic
> +     * console.
> +     * Can be NULL.
> +     */
> +    void (*dump_state)(void *arg);
> +
> +    /*
> +     * Place character to the emulated RX FIFO.
> +     * Used to forward physical console input to the guest OS.
> +     * Can be NULL.
> +     */
> +    int (*put_rx)(void *arg, char c);
> +};
> +
> +#define VUART_REGISTER(name, x) \
> +    static const struct vuart_emulator name##_entry \
> +        __used_section(".data.rel.ro.vuart") = x
> +
> +struct vuart *vuart_find_by_resource(const struct domain *d,
> +                                     unsigned int type,
> +                                     unsigned long addr,
> +                                     unsigned long size);
> +
> +int vuart_put_rx(const struct domain *d, char c);
> +
> +#ifdef CONFIG_VUART_FRAMEWORK

These two are declared outside the #ifdef with no stubs. The console.c
call builds with the framework off only because domain_has_vuart() is
an inline returning false and the call gets eliminated. I'd move both
under the #ifdef, next to the other declarations, with a stub for
vuart_put_rx().

> +
> +int vuart_init(struct domain *d, const struct vuart_info *info);
> +void vuart_deinit(struct domain *d);
> +void vuart_dump_state(const struct domain *d);
> +bool domain_has_vuart(const struct domain *d);
> +
> +#else
> +
> +static inline int vuart_init(struct domain *d, const struct vuart_info *info)
> +{
> +    return 0;
> +}
> +
> +static inline void vuart_deinit(struct domain *d)
> +{
> +}
> +
> +static inline void vuart_dump_state(const struct domain *d)
> +{
> +}
> +
> +static inline bool domain_has_vuart(const struct domain *d)
> +{
> +    return false;
> +}
> +
> +#endif /* CONFIG_VUART_FRAMEWORK */
> +
> +#endif /* XEN_VUART_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> +

git reports "new blank line at EOF" here.

> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> index 958f8256b0fa..5e630d371471 100644
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -231,6 +231,16 @@
>   #define VPCI_ARRAY
>   #endif
>   
> +#ifdef CONFIG_VUART_FRAMEWORK
> +#define VUART_ARRAY              \
> +       . = ALIGN(POINTER_ALIGN); \
> +       vuart_array_start = .;    \
> +       *(.data.rel.ro.vuart)     \
> +       vuart_array_end = .;

Nit: VPCI_ARRAY right above uses __start_vpci_array/__end_vpci_array;
__start_vuart_array/__end_vuart_array would be consistent.

~ Oleksii

