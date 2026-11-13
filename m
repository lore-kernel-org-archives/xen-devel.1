Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2699C606A31C
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rdu7Aa3k
Received: from list by lists.xenproject.org with outflank-mailman.1487344.1689772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRplL-00081R-1K; Fri, 13 Nov 2026 11:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1487344.1689772; Fri, 13 Nov 2026 11:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRplK-00081K-Ut; Fri, 13 Nov 2026 11:48:10 +0000
Received: by outflank-mailman (input) for mailman id 1487344;
 Fri, 13 Nov 2026 11:48:10 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRplK-00081B-5u
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 11:48:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRplJ-009yb8-Ex
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 12:48:09 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af6f8f2-8faa-0a2a0a5109dd-0a2a450bb256-18
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 12:48:09 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6af6f8f9-b7e8-0a2a450b0019-d155802ad917-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 12:48:09 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so5850965e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 03:48:09 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-65-71.play-internet.pl.
 [109.243.65.71]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5fb58fefsm5405789f8f.26.2026.11.13.03.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 03:48:08 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1794570489; x=1795175289; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kT5AakMM7bhWHzM4vswrNL0FHCSeO06mbVWNVLkUTaQ=;
        b=Rdu7Aa3kBlyjAR5mjuY2G/QDIZBbc0yvCvYmj+RahtPbLAt2ljjkq02H15NPx7yJEE
         tJ1clrVVWs2ICs35LiWeJV5FzrU0pyEAda1lGmofA7EJw68hORuaE9NJSvF0IX4y36cE
         tJCWdWQKGL+ryR3lwoDG07+46+HGPqjmcYvq35dcQm9/AFpPmulpJDmcc+7gE5N1TCUE
         WiD7Lv5PtX5+uK+kNoSXiBQQUBE8ZjXlRyXf/6pdEg9t/ab7w6v6Mg4DErZSxP26qrdr
         owwD55LPNTMREpAv4uFt31FdVQK0Bv5oZ+xD6gSVQsQ9VfLCed+ln8a9CHdrv5yIc8S7
         vh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570489; x=1795175289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kT5AakMM7bhWHzM4vswrNL0FHCSeO06mbVWNVLkUTaQ=;
        b=giSDTAijGp5eh4EzK0opofZPXHkKoN6POR0NmJPvMkQ/xuzc1dHUKhJzTiisXdvgOd
         ZDZtJGlJMw5sb5KT63MZG12YE3yaUnu9WMug5on0ttJiVRDznb80t6YnGf95KvPmGZE6
         09BcM1twEyvn99UmJMUS+og+LLvHR8FmMW5bhpr7RkSVXKGywOE9MmgDd+SdybdLEYny
         uImraKOjbscmvXgkluFA7axSMz1EuG/MzQRj1fNafSQF/+3wIUpxzyRAd6PSnidfq7hY
         ec0HURtQI24wETicWS/2xDaIBDUXKfz17UZfJFnEYkYCgDng+wyyDCtN8YbiEv1zOWKa
         y0xQ==
X-Forwarded-Encrypted: i=1; AL+hErHLZBdtfNoq27LALPHCi9IMS3nWHeXIGa96B3fG1BDnwh3fEYfWM3lYrUzJwUi5zhSuZDFtlDn8MpI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8vAQDUvXHs3tRg27ro2bpV7agTrOumjB5pDnoRhPoR7QE9BQ1v
	S7OwPF6hIFTeY/FqTUUdVBI9W23syD4AH6f32QsZgALpk4eRbrS+BNc7
X-Gm-Gg: AYBFou1W+AdReAOq3rAxOdr70FWMfmbECjGdvkgE79hKQmad1kGku7umdAphPbdwDrL
	g7yZOwQLaD3UjvA5Dk8r7Ie8QIP1s7vxbgyxpri8A3RYhPuR3Xy6+vc+EqUWZYA5hg14L0tJed6
	c0/DJSosLD4J187ztIuO1eRaXCo3uphz4BRfMueKSGuyx+U3DWmru99M0ZHG0EvZbhAC1HsrrxX
	uODSvmve1koLEaTY7bwO/F+0vGmuhSzBE0uklIS2Bfy/NA4QQFhrSwMhwDSQvzysZBTqXyXUu43
	Y6kqWJeJoJUyfB6uEuPtEYsb48OViU18gaf7vXc7SS5LACU22wkZ+oeohiyXb3l2hnAGdGCeyK/
	3lOazifDghWBBMnVOz+HX0kHs/OSdC/zYnKYVFTJx7DexapuWtcFr2nnFH378kt1aUcCT/Vx9gk
	MgYtWt3vw+HGCOhYOnJPbfuG8SRakJ2ITIjybElpz1jHB/nLVTg+GbeiyAHr64LoOT9HsFhhV10
	SXNx8Sg/1vyZ+ly3eL8kbrI0HOes/xN0CLOcMA7/HVHMAkZbjP77hvrW2rAnNJtfS/XpRC7pp2Y
	gG/GSLAdMyuDhrKhtO8DY7mcEre8McwKwt6AG7LpBbL7et+tj618XdIlF2AuQ4zT5pLDhWVkSC5
	dfA==
X-Received: by 2002:a05:600c:870f:b0:4ba:495c:3798 with SMTP id 5b1f17b1804b1-4bb55af1377mr43811575e9.35.1794570488624;
        Fri, 13 Nov 2026 03:48:08 -0800 (PST)
Message-ID: <5de39c17-a325-4702-8145-036c7258cca6@gmail.com>
Date: Fri, 13 Nov 2026 12:48:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/26] emul/ns16x50: implement emulator stub
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, michal.orzel@amd.com, roger@xenproject.org,
 sstabellini@kernel.org, xakep.amatop@gmail.com, dmukhin@xen.org
References: <20261111194800.1070016-1-dmukhin@ford.com>
 <20261111194800.1070016-5-dmukhin@ford.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261111194800.1070016-5-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1794570489-19AC09EA-58DD8F3D/10/73395122804
X-purgate-type: spam
X-purgate-size: 13782
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
> Define the placeholder for NS16550 UART emulator.
> 
> Implement alloc/free vUART hooks, add stub for I/O port handler,
> initialize emulator state and define debug logging facilities.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/common/emul/vuart/Makefile  |   1 +
>   xen/common/emul/vuart/ns16x50.c | 417 ++++++++++++++++++++++++++++++++
>   2 files changed, 418 insertions(+)
>   create mode 100644 xen/common/emul/vuart/ns16x50.c
> 
> diff --git a/xen/common/emul/vuart/Makefile b/xen/common/emul/vuart/Makefile
> index 97f792dc6641..fe904f6cb65d 100644
> --- a/xen/common/emul/vuart/Makefile
> +++ b/xen/common/emul/vuart/Makefile
> @@ -1 +1,2 @@
>   obj-y += vuart.o
> +obj-$(CONFIG_VUART_NS16X50) += ns16x50.o

CONFIG_VUART_NS16X50 appears only in 16/26, so this file and everything
added to it by 05..15 isn't compiled at all until then. Introducing the
Kconfig option (EXPERT, default n) in this patch would make each of the
following patches build-tested on its own.

> diff --git a/xen/common/emul/vuart/ns16x50.c b/xen/common/emul/vuart/ns16x50.c
> new file mode 100644
> index 000000000000..6e1cfecbaa55
> --- /dev/null
> +++ b/xen/common/emul/vuart/ns16x50.c
> @@ -0,0 +1,417 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * NS16550-compatible UART Emulator.
> + *
> + * See:
> + * - Serial and UART Tutorial:
> + *     https://download.freebsd.org/doc/en/articles/serial-uart/serial-uart_en.pdf
> + * - UART w/ 16 byte FIFO:
> + *     https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
> + * - UART w/ 64 byte FIFO:
> + *     https://www.ti.com/lit/ds/symlink/tl16c750.pdf
> + * - DesignWare DW_apb_uart Databook, v4.02a:
> + *     https://iccircle.com/static/upload/img20240313113905.pdf

I can't open this link: "The requested URL was not found on this server.".

> + *
> + * Limitations:
> + * - Only x86;
> + * - Only Xen console as a backend, no inter-domain communication (similar to
> + *   vpl011 on Arm);
> + * - Only 8n1 emulation (8-bit data, no parity, 1 stop bit);
> + * - No baud rate emulation (reports 115200 baud to the guest OS);
> + * - No FIFO-less mode emulation;
> + * - No RX FIFO interrupt moderation (FCR) emulation;
> + * - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
> + *   friends);
> + * - No ISA IRQ sharing allowed;
> + * - No MMIO-based UART emulation.
> + */
> +
> +#define pr_prefix               "ns16x50"
> +#define pr_fmt(fmt)             pr_prefix ": " fmt
> +
> +#ifdef CONFIG_VUART_NS16X50_DEBUG
> +#define guest_prefix            "FROM GUEST "

Nit: unused until 11/26; I'd introduce it together with its user.

> +#define ns16x50_log_level       2
> +#else
> +#define guest_prefix            ""
> +#define ns16x50_log_level       0
> +#endif

Are these defines used anywhere outside this file? I couldn't find any 
usage outside this file, so please move them after the includes.

I'm not sure whether there is a specific CODING_STYLE rule for this, but 
looking at other files, includes usually come before defines, except in 
cases where there is a good reason to use the opposite order.

> +
> +#include <asm/x86_emulate.h>
> +
> +#include <xen/8250-uart.h>

This is common code, but it depends on x86 in several places:
X86EMUL_OKAY (and with it the whole x86 instruction emulator header),
register_portio_handler(), and later in the series vPIC/vIOAPIC,
ioports_deny_access() and the emuirq claim. The register model itself
(registers, FIFOs, IIR) is architecture-neutral, though. I'd separate
the two: keep ns16x50_access() and the register emulation common, and
put the transport (portio handler) and the IRQ line handling behind a
couple of per-arch hooks, either under #ifdef CONFIG_X86 or in a small
arch file. An MMIO-based variant would then only need another
transport.

Nit: xen/ headers usually come before asm/ ones.

> +#include <xen/console.h>
> +#include <xen/err.h>
> +#include <xen/iocap.h>
> +#include <xen/resource.h>
> +#include <xen/vuart.h>
> +#include <xen/xvmalloc.h>
> +
> +#include <public/io/console.h>
> +
> +#define ns16x50_log(n, lvl, vdev, fmt, args...) \
> +do { \
> +    if ( ns16x50_log_level >= n ) \
> +        gprintk(lvl, pr_fmt("%s: " fmt), (vdev)->name, ## args); \
> +} while (0)
> +
> +#define ns16x50_err(vdev, fmt, args...) \
> +    ns16x50_log(0, XENLOG_ERR, vdev, fmt, ## args)
> +#define ns16x50_warn(vdev, fmt, args...) \
> +    ns16x50_log(1, XENLOG_WARNING, vdev, fmt, ## args)
> +#define ns16x50_info(vdev, fmt, args...) \
> +    ns16x50_log(2, XENLOG_INFO, vdev, fmt, ## args)
> +#define ns16x50_debug(vdev, fmt, args...) \
> +    ns16x50_log(3, XENLOG_DEBUG, vdev, fmt, ## args)

ns16x50_log_level is at most 2, so ns16x50_debug() never prints, even
with CONFIG_VUART_NS16X50_DEBUG=y. Is that intended? The same applies
to the "ns16x50_log_level >= 3" checks added later in the series.

> +
> +/*
> + * Number of supported registers in the UART.
> + */
> +#define NS16X50_REGS_NUM        (UART_SCR + 1)
> +
> +/*
> + * Number of emulated registers.
> + *
> + * - Emulated registers [0..NS16X50_REGS_NUM] are R/W registers for DLAB=0.
> + * - DLAB=1, R/W, DLL         = (NS16X50_REGS_NUM + 0)
> + * - DLAB=1, R/W, DLM         = (NS16X50_REGS_NUM + 1)
> + */
> +#define NS16X50_EMU_REGS_NUM    (NS16X50_REGS_NUM + 2)
> +
> +/*
> + * Virtual ns16x50 device state.
> + */
> +struct vuart_ns16x50 {
> +    uint8_t regs[NS16X50_EMU_REGS_NUM]; /* Emulated registers */
> +    const struct vuart_info *info;      /* UART description */
> +    struct domain *owner;               /* Owner domain */
> +    const char *name;                   /* Device name */
> +    spinlock_t lock;                    /* Protection */

The comment here isn't really useful. Could we clarify, at least, then 
what it protects?

> +    struct xencons_interface cons;      /* Emulated RX/TX FIFOs */
> +};
> +
> +static inline void ns16x50_lock_init(struct vuart_ns16x50 *vdev)
> +{
> +    spin_lock_init(&vdev->lock);
> +}
> +
> +static inline void ns16x50_lock(struct vuart_ns16x50 *vdev,
> +                                unsigned long *flags)
> +{
> +    spin_lock(&vdev->lock);
> +}
> +
> +static inline bool ns16x50_trylock(struct vuart_ns16x50 *vdev,
> +                                   unsigned long *flags)
> +{
> +    return spin_trylock(&vdev->lock);
> +}
> +
> +static inline void ns16x50_unlock(struct vuart_ns16x50 *vdev,
> +                                  unsigned long *flags)
> +{
> +    spin_unlock(&vdev->lock);
> +}

Are these wrappers are really useful?

Also, flags is never used by any of the wrappers. If they are meant to 
become spin_lock_irqsave() at some point, please say so; otherwise plain
spin_lock() calls would be simpler.

> +
> +/*
> + * Emulate 8-bit write access to ns16x50 register.
> + */

Will this comment be extended in later patches? if no, then it should be 
/* ... */ style here. The similar could be applied then for other 
similar functions.

> +static int ns16x50_io_write8(
> +    struct vuart_ns16x50 *vdev, uint32_t reg, uint8_t *data)
> +{
> +    int rc = 0;
> +
> +    return rc;
> +}
> +

[ ... ]

> +
> +static void ns16x50_access(int dir, unsigned int type,
> +                           unsigned long addr, unsigned int size,
> +                           uint32_t *data)
> +{
> +    const char op = (dir == IOREQ_WRITE) ? 'W' : 'R';
> +    struct domain *d = rcu_lock_current_domain();
> +    struct vuart *vuart = vuart_find_by_resource(d, type, addr, size);
> +    struct vuart_ns16x50 *vdev = NULL;
> +    const struct domain *owner;
> +    const struct vuart_info *info;
> +    const char *as;
> +    uint32_t reg;
> +    unsigned long flags;
> +    int rc;
> +
> +    if ( !vuart )
> +    {
> +        printk(XENLOG_ERR "%c @ %#"PRIx64" %d: not initialized\n",
> +               op, addr, size);

addr is unsigned long and size is unsigned int: %#lx and %u.
PRIx64 only happens to work on x86-64, and this is common code. The
same goes for the other messages in this function.

> +
> +        ASSERT_UNREACHABLE();
> +        goto out;
> +    }
> +
> +    vdev = vuart->vdev;
> +    ASSERT(vdev);
> +
> +    ns16x50_lock(vdev, &flags);
> +
> +    owner = vuart->owner;
> +    ASSERT(owner);
> +
> +    if ( d != owner )
> +    {
> +        ns16x50_err(vdev, "%c @ %#"PRIx64" %d: does not match current domain %pd\n",
> +                    op, addr, size, d);
> +
> +        ASSERT_UNREACHABLE();
> +        goto out_unlock;
> +    }
> +
> +    info = vuart->info;
> +    ASSERT(info);
> +    as = (info->base_type & IORESOURCE_IO) ? "ioport": "iomem";
> +
> +    reg = addr - info->base_addr;
> +    if ( !IS_ALIGNED(reg, size) )
> +    {
> +        ns16x50_err(vdev, "%c %s %#"PRIx64" %d: unaligned access\n",
> +                    op, as, addr, size);
> +        goto out_unlock;
> +    }
> +
> +    if ( reg >= NS16X50_REGS_NUM )
> +    {
> +        ns16x50_err(vdev, "%c %s %#"PRIx64" %d: LCR=%#02x %#02x %#x: not implemented\n",
> +                    op, as, addr, size, vdev->regs[UART_LCR], reg, *data);
> +        goto out_unlock;
> +    }
> +
> +    if ( dir == IOREQ_WRITE )
> +        rc = ns16x50_io_write(vdev, reg, size, data);
> +    else
> +        rc = ns16x50_io_read(vdev, reg, size, data);
> +
> +

Nit: double blank line.

> +    if ( rc == 0 )
> +        ns16x50_debug(vdev, "%c %s %#"PRIx64" %d: LCR=%#02x %#02x %#08x\n",
> +                      op, as, addr, size, vdev->regs[UART_LCR], reg, *data);
> +    else
> +        ns16x50_err(vdev, "%c %s %#"PRIx64" %d: LCR=%#02x %#02x %#08x: unsupported access\n",
> +                    op, as, addr, size, vdev->regs[UART_LCR], reg, *data);
> +
> +out_unlock:
> +    ns16x50_unlock(vdev, &flags);
> +out:
> +    rcu_unlock_domain(d);
> +}
> +
> +/*
> + * Emulate I/O access to ns16x50 register.
> + * Note, emulation always returns X86EMUL_OKAY, once I/O port trap is enabled.
> + */
> +static int cf_check ns16x50_io_handle(
> +    int dir, unsigned int addr, unsigned int size, uint32_t *data)
> +{
> +    ns16x50_access(dir, IORESOURCE_IO, addr, size, data);
> +
> +    return X86EMUL_OKAY;

As I mentioned above I am not sure that we should have x86-specific 
things in common code.

> +}
> +
> +static void ns16x50_reset(struct vuart_ns16x50 *vdev)
> +{
> +    memset(vdev->regs, 0, sizeof(vdev->regs));
> +}
> +
> +static int ns16x50_init(void *arg)
> +{
> +    struct vuart_ns16x50 *vdev = arg;
> +    const struct vuart_info *info;
> +    struct domain *d;
> +
> +    ASSERT(vdev);
> +
> +    d = vdev->owner;
> +    info = vdev->info;
> +
> +    if ( info->base_type & IORESOURCE_IO )
> +    {
> +        register_portio_handler(d, info->base_addr, info->size, ns16x50_io_handle);
> +    }
> +    else if ( info->base_type & IORESOURCE_MEM )
> +    {
> +        BUG_ON("unimplemented");
> +    }

Nit: no braces around single statements.

> +    else
> +        ASSERT_UNREACHABLE();
> +
> +    ns16x50_reset(vdev);
> +
> +    return 0;
> +}

Bringing the host down for an unsupported configuration is a bit harsh;
returning -EOPNOTSUPP would make domain creation fail instead. And in a
release build, the last branch returns success without any I/O handler
registered; it should return an error (e.g. -EINVAL) after the
ASSERT_UNREACHABLE().

> +
> +static void cf_check ns16x50_deinit(void *arg)

Nit: ns16x50_deinit() is only called directly, so cf_check isn't
needed (ns16x50_init() doesn't have it either).

> +{
> +    struct vuart_ns16x50 *vdev = arg;
> +
> +    ASSERT(vdev);
> +}
> +
> +static void * cf_check ns16x50_alloc(struct domain *d, const struct vuart_info *info)
> +{
> +    struct vuart_ns16x50 *vdev;
> +    int rc;
> +
> +    if ( !is_hvm_domain(d) )
> +    {
> +        ns16x50_err(info, "not an HVM domain\n");
> +        return ERR_PTR(-ENOSYS);

Why ENOSYS?

Also, ns16x50_err() is meant to take a struct vuart_ns16x50 and
dereferences (vdev)->name; passing a struct vuart_info only compiles
because both happen to have a name member. A separate macro (or passing
info->name explicitly) would make that less accidental.

The same is true for other use cases of nx16x50_err() below.

> +    }
> +
> +    if ( vuart_find_by_resource(d, info->base_type, info->base_addr,
> +                                info->size) )
> +    {
> +        ns16x50_err(info, "already registered\n");
> +        return ERR_PTR(-EBUSY);
> +    }

Can it be triggered?

vuart_find_by_resource() only looks at d->console->vuart, vuart_init() 
returns -EBUSY before calling alloc() if that is set, and it assigns it 
only after alloc() has returned. So inside alloc() it is always NULL. 
Unless multiple vUARTs per domain are planned, I'd drop the check; the 
-EBUSY in vuart_init() already covers it. Am I missing something?

> +
> +    vdev = xvzalloc(typeof(*vdev));
> +    if ( !vdev )
> +    {
> +        ns16x50_err(info, "failed to allocate memory\n");
> +        return ERR_PTR(-ENOMEM);
> +    }
> +
> +    ns16x50_lock_init(vdev);
> +
> +    vdev->name = info->name;
> +    vdev->owner = d;
> +    vdev->info = info;

Nit: vdev->name duplicates vdev->info->name.

> +
> +    rc = ns16x50_init(vdev);
> +    if ( rc )
> +    {
> +        xvfree(vdev);
> +        return ERR_PTR(rc);
> +    }
> +
> +    return vdev;
> +}
> +

[ ... ]

~ Oleksii


