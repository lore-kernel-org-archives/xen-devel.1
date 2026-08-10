Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C88C5B56D
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 14:49:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387559.1628826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtRJw-0004Bb-5N; Mon, 10 Aug 2026 14:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387559.1628826; Mon, 10 Aug 2026 14:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtRJw-0004BU-1k; Mon, 10 Aug 2026 14:49:44 +0000
Received: by outflank-mailman (input) for mailman id 1387559;
 Mon, 10 Aug 2026 14:49:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wtRJu-0004BO-SP
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 14:49:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtRJu-0001Yw-5F
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 16:49:42 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec268e07000e099@swg.vates.tech>)
 id 6a79e501-8faa-0a2a0a5109dd-0a2a4501d10a-2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 16:49:42 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fec268e07000e099@swg.vates.tech>)
 id 6a79e505-5984-0a2a45010019-b9ff1c2396c9-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 16:49:41 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fec268e07000e099.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Aug 2026 14:49:37 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id C63A882207;
 Mon, 10 Aug 2026 16:49:36 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=8hzj2NizrqUYvebWcKT36+ktgNDru+858dceapaxZhg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=nQrpnSdu08xzASFK1N2seAmvfyAc4BdmSZkG+5iv0YPjjuvbQI/CL7ul8IBWlzJBrnpGwX9Vc
 811cKku0kEhi4VOLLH9qkpODaBmE7jP6qEY9C4mAi7To2WbLHhkTENmyKfYdGYaAZKU0gYnAqE4
 oiTaaOHsjWSEETdPqG/agsJDAHrRZk/t40QM9TsLAriG2+9boOmx0idRCNOmsQqwQQ7EVn645Bp
 ecIDLp516qxwdeSRD412gQZEei6Ra0rzzA/JWqwxONbD7tuD5lGrFzLRTimEdbbAqAXDUwCdFQB
 obUI0prf7qu5vb7wgURsHP0eQFq8AfKRGz60q+bGyACg==
X-Zone-Loop: e37e6a050a64299685ac3f4f3c4e3dbfecd4d29a4ca3
x-campaign-type: default
x-transaction-id: c97014f1-4772-476b-98f1-0d3f9e539b8f
x-swg-uid: 01-52b058f6-6e36-46e4-9a58-f129f24452a5
X-Mailer: Sweego
Message-ID:
 <1786373377.8631fc262581453bbf619ec5b2062170.19fec268e07000e099@vates.tech>
x-swg-bid: 1786373377.8631fc262581453bbf619ec5b2062170.19fec268e07000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Subject: Re: [PATCH v1 04/17] xen/riscv: introduce device-agnostic MMIO
 emulation dispatch
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
 Romain Caritey <Romain.Caritey@microchip.com>, 
 Baptiste Le Duc <baptiste.le-duc@vates.tech>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, 
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Julien Grall <julien@xen.org>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Stefano Stabellini <sstabellini@kernel.org>
In-Reply-To: <c12b69710d7b79bfc0c110f3fa043d871d8b8394.1784560663.git.oleksii.kurochko@gmail.com>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <c12b69710d7b79bfc0c110f3fa043d871d8b8394.1784560663.git.oleksii.kurochko@gmail.com>
Date: Mon, 10 Aug 2026 16:49:30 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786373376; l=5445;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=fmPG1sGGrW14MnmDh+vw1K0FhMsncCr8M+mT56ERHzk=;
 b=gOK7CD1jOyWuCSsquECy+s1gQu7CQBdyDNn07ynxTxy0ADI6qdVLbYeVOGc8VYl9u3f+FyORO
 aSv0c2I2J1NC8fFyC5PQZVAafquChPCDoDoWSPnrgmav8Kn2sGEIvrT
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2039.d3a9d985718257a9.19fec268bf5.69e8bf0c8ca29046=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1786373377014
X-purgate-ID: tlsNG-d62444/1786373381-BEA66757-4173BB55/10/73395122804
X-purgate-type: spam
X-purgate-size: 6007

---=Part.2039.d3a9d985718257a9.19fec268bf5.69e8bf0c8ca29046=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> RISC-V guests can expose several virtual interrupt controllers at
> distinct GPA ranges: vPLIC (hasn't been introduced yet) for legacy machi=
nes,
> vAPLIC and vIMSIC for AIA-compliant ones (is being introduced in the fol=
low
> up patches)=2E Routing MMIO faults via a per-device is_access() check in=
 the
> trap handler would couple it to every device it must serve, requiring a
> new conditional branch in the fault path each time a new emulated device=
 is
> added=2E
>=20
> Introduce a per-domain MMIO handler registration table, modeled
> after the equivalent ARM framework, so that virtual devices
> self-register their GPA ranges and read/write callbacks at domain
> creation time=2E The MMIO fault path delegates to a single
> try_handle_mmio() entry point and remains agnostic of which device
> owns a particular address=2E
>=20
> Subsequent patches wire this into arch_domain_create() and the MMIO faul=
t
> path in traps=2Ec=2E
>=20
> Signed-off-by: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>
> Reviewed-by: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
>
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 046f73f4d8=2E=2Ec452ebc3cf 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -14,6 +14,7 @@ obj-y +=3D intc=2Eo
>  obj-y +=3D irq=2Eo
>  obj-y +=3D kernel=2Einit=2Eo
>  obj-y +=3D mm=2Eo
> +obj-y +=3D mmio=2Eo
>  obj-y +=3D p2m=2Eo
>  obj-y +=3D paging=2Eo
>  obj-y +=3D pt=2Eo
> diff --git a/xen/arch/riscv/domain=2Ec b/xen/arch/riscv/domain=2Ec
> index 4db9c28662=2E=2E1e6f0ef66c 100644
> --- a/xen/arch/riscv/domain=2Ec
> +++ b/xen/arch/riscv/domain=2Ec
> @@ -12,6 +12,7 @@
>  #include <asm/cpufeature=2Eh>
>  #include <asm/csr=2Eh>
>  #include <asm/intc=2Eh>
> +#include <asm/mmio=2Eh>
>  #include <asm/riscv_encoding=2Eh>
>  #include <asm/vtimer=2Eh>
> =20
> @@ -308,6 +309,9 @@ int arch_domain_create(struct domain *d,
>      if ( (rc =3D p2m_init(d, config)) !=3D 0)
>          goto fail;
> =20
> +    if ( (rc =3D domain_io_init(d, MAX_IO_HANDLER)) !=3D 0 )


> +        goto fail;


> +
>      if ( (rc =3D domain_vintc_init(d)) )
>          goto fail;
> =20
> diff --git a/xen/arch/riscv/include/asm/domain=2Eh b/xen/arch/riscv/incl=
ude/asm/domain=2Eh
> index e035b33ddf=2E=2E15e8fa1968 100644
> --- a/xen/arch/riscv/include/asm/domain=2Eh
> +++ b/xen/arch/riscv/include/asm/domain=2Eh
> @@ -9,6 +9,7 @@
> =20
>  #include <asm/cpufeature=2Eh>
>  #include <asm/guest-layout=2Eh>
> +#include <asm/mmio=2Eh>
>  #include <asm/p2m=2Eh>
>  #include <asm/vtimer=2Eh>
> =20
> @@ -101,6 +102,8 @@ struct arch_domain {
>      const unsigned long *isa;
> =20
>      struct vintc *vintc;
> +
> +    struct vmmio vmmio;
>  };
> =20
>  #include <xen/sched=2Eh>
> diff --git a/xen/arch/riscv/include/asm/mmio=2Eh b/xen/arch/riscv/includ=
e/asm/mmio=2Eh
> new file mode 100644
> index 0000000000=2E=2E18df1133e6
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/mmio=2Eh
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2=2E0-or-later */

According to coding style, it should be GPL-2=2E0-only=2E

> +#ifndef RISCV_MMIO_H
> +#define RISCV_MMIO_H
> +
> +#include <xen/lib=2Eh>
> +#include <xen/rwlock=2Eh>
> +
> +#define MAX_IO_HANDLER  16
> +
> +typedef struct {
> +    paddr_t gpa;
> +    unsigned int len;  /* access width in bytes (1, 2, 4, 8) */
> +    bool is_write;
> +    register_t data;   /* store: value to write; load: value read (set =
by handler) */

Nit: line too long (85)

> +} mmio_info_t;
> +
> +enum io_state
> +{
> +    IO_ABORT,       /* The IO was handled and led to an abort=2E */
> +    IO_HANDLED,     /* The IO was successfully handled=2E */
> +    IO_UNHANDLED,   /* No handler found for the IO=2E */
> +};
> +
> +typedef enum io_state (*mmio_read_t)(struct vcpu *v, mmio_info_t *info,
> +                                     register_t *r);
> +typedef enum io_state (*mmio_write_t)(struct vcpu *v, mmio_info_t *info=
,
> +                                      register_t r);


> +
> +struct mmio_handler_ops {
> +    mmio_read_t read;
> +    mmio_write_t write;


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
> +    unsigned int max_num_entries;
> +    rwlock_t lock;
> +    struct mmio_handler *handlers;


> +};
> +
> +enum io_state try_handle_mmio(mmio_info_t *info);

> +void register_mmio_handler(struct domain *d,
> +                           const struct mmio_handler_ops *ops,
> +                           paddr_t addr, paddr_t size);
> +int domain_io_init(struct domain *d, unsigned int max_count);
> +void domain_io_free(struct domain *d);


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
> diff --git a/xen/arch/riscv/mmio=2Ec b/xen/arch/riscv/mmio=2Ec
> new file mode 100644
> index 0000000000=2E=2E7d56bc8b27
> --- /dev/null
> +++ b/xen/arch/riscv/mmio=2Ec
> @@ -0,0 +1,145 @@
> +/* SPDX-License-Identifier: GPL-2=2E0-or-later */
Should be GPL-2=2E0-only=2E
> +/*
> + * Copyright (C) Vates
> + */
Why have you included a copyright notice here, but not in the other
files? I don=E2=80=99t know if you can keep it, but I just wanted to point=
 out
that there are other files where this type of copyright notice includes
the year=2E

--=20
Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>


-- 
Baptiste Le Duc | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.2039.d3a9d985718257a9.19fec268bf5.69e8bf0c8ca29046=---

