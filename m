Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DD8C624D3
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 15:36:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404807.1638471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1QX5-0007xH-Sw; Tue, 01 Sep 2026 15:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404807.1638471; Tue, 01 Sep 2026 15:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1QX5-0007xA-QE; Tue, 01 Sep 2026 15:36:19 +0000
Received: by outflank-mailman (input) for mailman id 1404807;
 Tue, 01 Sep 2026 15:36:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x1QX4-0007wx-OP
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 15:36:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1QX4-004MtB-4C
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 17:36:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a05d9d0e85000c4f3@swg.vates.tech>)
 id 6a96f0e8-bab6-0a2a0a5309dd-0a2a450b8b1c-18
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 17:36:18 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a05d9d0e85000c4f3@swg.vates.tech>)
 id 6a96f0f1-b7e8-0a2a450b0019-b9ff1c128d75-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 17:36:18 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a05d9d0e85000c4f3.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Sep 2026 15:36:09 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 520D283D4D;
 Tue,  1 Sep 2026 17:36:08 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=+nkYcL2VZ0h4H8BaaEIV2R9AqnQKCo3UZXrnidMYJcQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=uBcCexC4gO+NSXfGdzer3oPCUCpCgYcIWVMFS/8LcCm0udVRss3IrGs0MJqoT6nzlEQWL0uAa
 kSxJ+HfKyqJfo6upqM3ngX/u7JnerTSvr6yhwam2BYVZY3eqM/v7+Lqla9580UWlOJOX9L8P3B3
 WEnQkkDjYagKVl6K73KG5lSVejba/9VRYn+5gxQqGXIyofK6vtjqPgLx03/Qxn/fQlg2I9zq4Qg
 vH1lcB3xHtZgCnEHiYdtvMWXIBKmZ+3EN9Kb86fzI4Zd25E+7IaQFCFW84z15GcanYECyAyCYfP
 QhpEOYxrf79+XvhOrkk/nmMG8Azf2I5oBFpUVGB4qrDQ==
X-Zone-Loop: 9af3bc120ed1fb46a2ad133be28d61b0166f49c0d44d
x-campaign-type: default
x-transaction-id: 8ed672a8-1281-4b5a-a233-c6e942a1fb4e
x-swg-uid: 01-ab0e654b-3c96-42c0-a914-ade1c077ef15
X-Mailer: Sweego
Message-ID:
 <1788276969.8631fc262581453bbf619ec5b2062170.1a05d9d0e85000c4f3@vates.tech>
x-swg-bid: 1788276969.8631fc262581453bbf619ec5b2062170.1a05d9d0e85000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 08/39] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Zheng Zhang <zhangzheng@iscas.ac.cn>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <a74ff916f76fb95e1e44bfadd45fbc477df00c51.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <a74ff916f76fb95e1e44bfadd45fbc477df00c51.1787838835.git.oleksii.kurochko@gmail.com>
Date: Tue, 01 Sep 2026 17:36:01 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788276967; l=8672;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=ih1vpbwXalYF59KB5ERVxms5sfakxHyR6Sqpt6uKN1k=;
 b=GhK5Yfau2vKxZNJOBYo20zhtNhl9+7mjYNwE++qND2bVdOEtZjGFZUOVxGnOVSo3pWuWTMZ/O
 x5woF4Wt7GAA5UNDASSvaXKOWZ4CEjmO9QyC8a5RbxwjlR8dUpRh/6h
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788276968547
X-purgate-ID: tlsNG-42698a/1788276978-AB8D19EA-0EF62459/10/73395122804
X-purgate-type: spam
X-purgate-size: 8672

> RISC-V guests can expose several virtual interrupt controllers at
> distinct GPA ranges: vPLIC (hasn't been introduced yet) for legacy machines,
> vAPLIC and vIMSIC for AIA-compliant ones (are being introduced in the follow
> up patches). 
As Jan said here [1], we shouldn't use "as later in this series" in
commit message...

[1]: https://lore.kernel.org/xen-devel/cover.1787838835.git.oleksii.kurochko@gmail.com/T/#m56fbac1ceb0642d5d868e9dcb2b5ed93ecbe5058
> Routing MMIO faults via a per-device is_access() check in the
> trap handler would couple it to every device it must serve, requiring a
> new conditional branch in the fault path each time a new emulated device is
> added.
> 
> Introduce a per-domain MMIO handler registration table, modeled
> after the equivalent ARM framework, so that virtual devices
> self-register their GPA ranges and read/write callbacks at domain
> creation time. The MMIO fault path delegates to a single
> try_handle_mmio() entry point and remains agnostic of which device
> owns a particular address.
> 
> A subsequent patch wires this into the MMIO fault path in traps.c.
...same here
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 3b948c11dd..ce6410a299 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -14,6 +14,7 @@ obj-y += intc.o
>  obj-y += irq.o
>  obj-y += kernel.init.o
>  obj-y += mm.o
> +obj-y += mmio.o
>  obj-y += p2m.o
>  obj-y += paging.o
>  obj-y += pt.o
> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
> index 57c37cb2df..ec327a5e8a 100644
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -12,6 +12,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/csr.h>
>  #include <asm/intc.h>
> +#include <asm/mmio.h>
>  #include <asm/riscv_encoding.h>
>  #include <asm/vtimer.h>
>  
> @@ -316,6 +317,8 @@ int arch_domain_create(struct domain *d,
>      if ( (rc = p2m_init(d, config)) != 0)
>          goto fail;
>  
> +    domain_io_init(d);
> +
>      if ( (rc = domain_vintc_init(d)) )
>          goto fail;
>  
> diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
> index e035b33ddf..15e8fa1968 100644
> --- a/xen/arch/riscv/include/asm/domain.h
> +++ b/xen/arch/riscv/include/asm/domain.h
> @@ -9,6 +9,7 @@
>  
>  #include <asm/cpufeature.h>
>  #include <asm/guest-layout.h>
> +#include <asm/mmio.h>
>  #include <asm/p2m.h>
>  #include <asm/vtimer.h>
>  
> @@ -101,6 +102,8 @@ struct arch_domain {
>      const unsigned long *isa;
>  
>      struct vintc *vintc;
> +
> +    struct vmmio vmmio;
>  };
>  
>  #include <xen/sched.h>
> diff --git a/xen/arch/riscv/include/asm/mmio.h b/xen/arch/riscv/include/asm/mmio.h
> new file mode 100644
> index 0000000000..582969e535
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/mmio.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef RISCV_MMIO_H
> +#define RISCV_MMIO_H
> +
> +#include <xen/lib.h>
> +#include <xen/rwlock.h>
> +
> +struct domain;
> +struct vcpu;
> +
> +#define MAX_IO_HANDLER  16
> +
> +typedef struct {
> +    paddr_t gpa;
> +    unsigned int len;  /* access width in bytes (1, 2, 4, 8) */
> +    bool is_write;
> +    /* store: value to write; load: value read (set by handler) */
> +    register_t data;
> +} mmio_info_t;
> +
> +enum io_state
> +{
> +    IO_ABORT,       /* The IO was handled and led to an abort. */
> +    IO_HANDLED,     /* The IO was successfully handled. */
> +    IO_UNHANDLED,   /* No handler found for the IO. */
> +};
> +
> +typedef enum io_state (mmio_read_t)(struct vcpu *v, mmio_info_t *info);
> +typedef enum io_state (mmio_write_t)(struct vcpu *v, const mmio_info_t *info);
> +
> +struct mmio_handler_ops {
> +    mmio_read_t *read;
> +    mmio_write_t *write;
> +};
> +
> +struct mmio_handler {
> +    paddr_t addr;
> +    paddr_t size;
> +    const struct mmio_handler_ops *ops;
> +};
> +
> +struct vmmio {
> +    unsigned int num_entries;
> +    rwlock_t lock;
> +    struct mmio_handler handlers[MAX_IO_HANDLER];
> +};
> +
> +int do_mmio(mmio_info_t *info, paddr_t fault_addr, unsigned int len);
> +int register_mmio_handler(struct domain *d,
> +                          const struct mmio_handler_ops *ops,
> +                          paddr_t addr, paddr_t size);
> +void domain_io_init(struct domain *d);
> +
> +#endif /* RISCV_MMIO_H */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/riscv/mmio.c b/xen/arch/riscv/mmio.c
> new file mode 100644
> index 0000000000..d241ab5ea1
> --- /dev/null
> +++ b/xen/arch/riscv/mmio.c
> @@ -0,0 +1,176 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/bsearch.h>
> +#include <xen/lib.h>
> +#include <xen/rwlock.h>
> +#include <xen/sched.h>
> +#include <xen/string.h>
> +
> +#include <asm/current.h>
> +#include <asm/mmio.h>
> +
> +/*
> + * bsearch() comparator: @key holds the address to look up in its addr field,
> + * @elem is an entry of vmmio->handlers. Relies on the regions not
> + * overlapping, which register_mmio_handler() enforces.
> + */
> +static int cmp_mmio_handler(const void *key, const void *elem)
> +{
> +    const struct mmio_handler *handler0 = key;
> +    const struct mmio_handler *handler1 = elem;
> +
> +    if ( handler0->addr < handler1->addr )
> +        return -1;
> +
> +    if ( handler0->addr >= (handler1->addr + handler1->size) )
> +        return 1;
> +
> +    return 0;
> +}
> +
> +/*
> + * Return a copy of the matching handler rather than a pointer into
> + * vmmio->handlers: a concurrent register_mmio_handler() shifts entries
> + * up to keep the array sorted, so an escaped pointer could refer to a
> + * different (or torn) entry once the lock is dropped. The copy stays
> + * valid as the ops structures are never freed.
> + */
> +static bool find_mmio_handler(struct domain *d, paddr_t gpa,
> +                              struct mmio_handler *out)
> +{
> +    struct vmmio *vmmio = &d->arch.vmmio;
> +    struct mmio_handler key = { .addr = gpa };
> +    const struct mmio_handler *handler;
> +
> +    read_lock(&vmmio->lock);
> +    handler = bsearch(&key, vmmio->handlers, vmmio->num_entries,
> +                      sizeof(*handler), cmp_mmio_handler);
> +    if ( handler )
> +        *out = *handler;
> +    read_unlock(&vmmio->lock);
> +
> +    return handler != NULL;
> +}
> +
> +static enum io_state try_handle_mmio(mmio_info_t *info)
> +{
> +    struct vcpu *v = current;
> +    struct mmio_handler handler = {};
> +
> +    if ( !find_mmio_handler(v->domain, info->gpa, &handler) )
> +        return IO_UNHANDLED;
> +
> +    if ( info->is_write )
> +        return handler.ops->write(v, info);
> +    else
> +        return handler.ops->read(v, info);
> +}
> +
> +/*
> + * Check alignment and dispatch a decoded MMIO access to a registered
> + * handler. On success (0), info->data holds the read value for loads.
> + *
> + * There is no "retry" outcome to handle: find_mmio_handler() returns a
> + * copy of the matching handler taken under vmmio->lock and the ops
> + * structures are never freed, so the lookup result cannot go stale
> + * between finding the handler and invoking it.
> + */
> +int do_mmio(mmio_info_t *info, paddr_t fault_addr, unsigned int len)
> +{
> +    /* Fault address should be aligned to length of MMIO */
> +    if ( fault_addr & (len - 1) )
> +        return -EIO;
> +
> +    info->gpa = fault_addr;
> +    info->len = len;
> +
> +    switch ( try_handle_mmio(info) )
> +    {
> +    case IO_HANDLED:
> +        return 0;
> +
> +    case IO_ABORT:
> +        return -EIO;
> +
> +    default:
> +        return -EOPNOTSUPP;
> +    }
> +}
> +
> +int register_mmio_handler(struct domain *d,
> +                          const struct mmio_handler_ops *ops,
> +                          paddr_t addr, paddr_t size)
> +{
> +    struct vmmio *vmmio = &d->arch.vmmio;
> +    struct mmio_handler *handlers = vmmio->handlers;
> +    paddr_t end = addr + size;
> +    unsigned int i;
> +    int rc = 0;
> +    bool overlap;
> +
> +    if ( !ops || !ops->read || !ops->write || !size || end < addr )
> +        return -EINVAL;
Just a question: is the aim of end < addr check to handle possible overflow of end?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

