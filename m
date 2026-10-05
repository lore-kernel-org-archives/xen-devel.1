Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8A2CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 10:02:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440686.1658139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfWk-0002vu-8Q; Mon, 05 Oct 2026 10:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440686.1658139; Mon, 05 Oct 2026 10:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDfWk-0002vj-4d; Mon, 05 Oct 2026 10:02:34 +0000
Received: by outflank-mailman (input) for mailman id 1440686;
 Mon, 05 Oct 2026 10:02:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDfWj-0002jg-7q
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 10:02:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDfWi-00C22F-Kc
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 12:02:32 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10b8384c50003f66@swg.vates.tech>)
 id 6ac375b2-2eae-0a2a0a5409dd-0a2a4507bfb6-18
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:02:32 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a10b8384c50003f66@swg.vates.tech>)
 id 6ac375b8-b4ea-0a2a45070019-b9ff1c22b187-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 12:02:32 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a10b8384c50003f66.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 05 Oct 2026 10:02:11 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5CE7782233;
 Mon,  5 Oct 2026 12:02:10 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=jYgBYO2+/pVSYOaFH86+bomzi3sUUgzqL/IMu7ODsKs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=jG9XRpt/li9GdxGfcsD4oRF/j1Dpv6wGlXn/V7lAQYh/L5iNG3WBq7MtSAS3gordPO5ML/iyZ
 BRFd9yVoFsS4dAYH+sJOp6ZDYizA1mBAAFZWALdWs4Oi7QauFrF9h2FgPxjHkPZWpjetFb4GaZC
 arJjfaFaYbdGP8WDiV0AZJTSpSIZNRxn8WBifQWTW3xKawGMOkXuac/X52YAfZmq9VFQyABlkP2
 +KYF22XlDiDmVxxjM1H+zJFVs0asCDrr8aLLcoZj0BEr0MXgnyO4qehVSuuYwbeXFBfSUV+0+pq
 KHSoR3t4/mRtkAiDXUjGASnPkk1uslUIuZHChg9Qg0DA==
X-Zone-Loop: 092ea1dffb59ccfa57fca626cad2b7a01157a8ec0909
x-campaign-type: default
x-transaction-id: a35cbfd6-00bd-462e-89b0-959ae06bd3b9
x-swg-uid: 01-94ed7337-9093-4faa-a79e-bdd141f90b69
X-Mailer: Sweego
Message-ID:
 <1791194531.8631fc262581453bbf619ec5b2062170.1a10b8384c50003f66@vates.tech>
x-swg-bid: 1791194531.8631fc262581453bbf619ec5b2062170.1a10b8384c50003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 06/39] xen/riscv: introduce device-agnostic MMIO
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
In-Reply-To: <cafb356d9cc3148d74df846e08c4961da72bea0e.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <cafb356d9cc3148d74df846e08c4961da72bea0e.1790779209.git.oleksii.kurochko@gmail.com>
Date: Mon, 05 Oct 2026 12:01:55 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791194522; l=10702;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=ah3KiSHFmBcrh/7SpADjFfm0QKjZcmYlujruQnPhoVQ=;
 b=3OPCgs+Ns3SdqXXQc5hgFOUPnLbf/OzN1l3as362seZRauBR+OULMciQvIBamo4xnRfA4QM1t
 fm5ac7ZBLEZBP+OnF2P3CbsvsRHIHFHB9WTCk1ST+FWGZy4E7cDauAU
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791194530573
X-purgate-ID: tlsNG-ef75cf/1791194552-342F4AE4-73CF6F90/10/73395122804
X-purgate-type: spam
X-purgate-size: 10702

> A RISC-V guest can be given several emulated devices at distinct GPA
> ranges; the virtual interrupt controllers alone account for vPLIC on
> legacy machines and vAPLIC together with vIMSIC on AIA-compliant ones.
> Routing MMIO faults via a per-device is_access() check in the trap
> handler would couple that handler to every device it must serve,
> requiring a new conditional branch in the fault path for each emulated
> device added.
> 
> Introduce a per-domain MMIO handler registration table, modeled
> after the equivalent ARM framework, so that virtual devices
> self-register their GPA ranges and read/write callbacks at domain
> creation time. The MMIO fault path delegates to a single do_mmio()
> entry point and remains agnostic of which device owns a particular
> address.
> 
> Nothing registers a handler and do_mmio() has no callers yet, so this
> patch is a no-op; the trap handler is left untouched.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> do_mmio() gets its first caller in "xen/riscv: add guest load emulation
> for trapped MMIO accesses" in this series.
> ---
> Changes in v3:
>  - Update the commit message.
>  - Capitalize the comments inside mmio_info_t and drop the list of access
>    widths from the one on len, as it could go stale.
>  - Drop the parentheses around the typedef names.
>  - Reject an access width which isn't a power of 2 in do_mmio().
>  - Fold the !size check of register_mmio_handler() into end <= addr.
>  - Return -EADDRINUSE instead of -EEXIST for an overlapping region.
>  - Drop setting d->arch.vmmio.num_entries to 0, as struct domain starts
>    out zero-filled.
> ---
> Changes in v2:
>  - Drop copyright from mmio.c as it will go stale anyway as code moves
>    around.
>  - Drop the max_count parameter of domain_io_init() (MAX_IO_HANDLER is a
>    global boundary) and embed the handler array directly in struct vmmio
>    as struct mmio_handler handlers[MAX_IO_HANDLER].  This removes the
>    xvzalloc_array() allocation, the max_num_entries field and
>    domain_io_free() altogether; domain_io_init() consequently cannot fail
>    any longer and now returns void. Note this goes slightly beyond the
>    suggested variant in that max_num_entries is dropped as well, since
>    ARRAY_SIZE(vmmio->handlers) serves the same purpose.
>  - Drop the separate register_t argument of mmio_read_t/mmio_write_t;
>    handlers now produce and consume the value through info->data.
>    handle_read()/handle_write() are gone as a result, with
>    try_handle_mmio() invoking ops->read()/ops->write() directly.
>  - Turn mmio_read_t/mmio_write_t into function types rather than
>    pointer-to-function types, so that pointer-ness is visible at the use
>    sites in struct mmio_handler_ops. Constify the mmio_info_t * of the
>    write callback, which has no reason to modify it any more.
>  - register_mmio_handler() returns int instead of BUG_ON()ing on a full
>    table: -ENOSPC now lets the caller fail domain creation. It also
>    validates its inputs, rejecting a NULL ops (or one with a missing
>    read/write callback) as well as zero-sized and address-wrapping
>    regions with -EINVAL.
>  - Guarantee the non-overlap property that cmp_mmio_handler() relies on:
>    register_mmio_handler() checks the new region against both neighbours
>    of its insertion slot and returns -EEXIST on overlap.
>  - Replace the sort() call per registration with an insertion into the
>    already sorted array: locate the slot and memmove() the tail up by
>    one. sort(), swap_mmio_handler() and <xen/sort.h> are gone.
>  - Extend cmp_mmio_handler()'s comment to state that it is a bsearch()
>    comparator and to explain the key/elem asymmetry; document why the
>    neighbours' addr + size cannot overflow.
>  - Fix over-long lines and a mis-indented label.
> ---
> ---
>  xen/arch/riscv/Makefile             |   1 +
>  xen/arch/riscv/domain.c             |   3 +
>  xen/arch/riscv/include/asm/domain.h |   3 +
>  xen/arch/riscv/include/asm/mmio.h   |  63 ++++++++++
>  xen/arch/riscv/mmio.c               | 175 ++++++++++++++++++++++++++++
>  5 files changed, 245 insertions(+)
>  create mode 100644 xen/arch/riscv/include/asm/mmio.h
>  create mode 100644 xen/arch/riscv/mmio.c
>
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 665ec26933..5454517724 100644
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
> index d94652809e..fd62296356 100644
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
> @@ -310,6 +311,8 @@ int arch_domain_create(struct domain *d,
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
> index 0000000000..1bf48571a9
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/mmio.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef RISCV_MMIO_H
Should be ASM__RISCV_MMIO_H instead to be consistant with other header
files in riscv/include/asm.
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
> +    unsigned int len;  /* Access width in bytes */
> +    bool is_write;
> +    /* Store: value to write; load: value read (set by handler) */
> +    register_t data;
> +} mmio_info_t;
> +
> +enum io_state
> +{
Style: should be directly after enum io_state.
> +    IO_ABORT,       /* The IO was handled and led to an abort. */
> +    IO_HANDLED,     /* The IO was successfully handled. */
> +    IO_UNHANDLED,   /* No handler found for the IO. */
> +};
> +
> +typedef enum io_state mmio_read_t(struct vcpu *v, mmio_info_t *info);
> +typedef enum io_state mmio_write_t(struct vcpu *v, const mmio_info_t *info);
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
> index 0000000000..cf739a790a
> --- /dev/null
> +++ b/xen/arch/riscv/mmio.c
> @@ -0,0 +1,175 @@
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
The else is not necessary here, misra would call that "dead code".
Here are two suggestions:

      if ( info->is_write )
          return handler.ops->write(v, info);

      return handler.ops->read(v, info);
or:

      return info->is_write ? handler.ops->write(v, info)
                            : handler.ops->read(v, info);

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

