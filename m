Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA01606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 12:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=bu2xfvtC
Received: from list by lists.xenproject.org with outflank-mailman.1459235.1671229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKEod-0003W2-IU; Fri, 23 Oct 2026 12:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459235.1671229; Fri, 23 Oct 2026 12:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKEod-0003Vv-FX; Fri, 23 Oct 2026 12:56:11 +0000
Received: by outflank-mailman (input) for mailman id 1459235;
 Fri, 23 Oct 2026 12:56:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a168d535ab000f79f@swg.vates.tech>)
 id 1xKEob-0003Vp-EF
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 12:56:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKEoa-00EM6L-Mr
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 14:56:08 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a168d535ab000f79f@swg.vates.tech>)
 id 6adb5956-8faa-0a2a0a5109dd-0a2a4502a15c-18
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 14:56:08 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a168d535ab000f79f@swg.vates.tech>)
 id 6adb5967-6ca4-0a2a45020019-b9ff1c2284d1-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 14:56:08 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a168d535ab000f79f.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 23 Oct 2026 12:56:05 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id E71A982A2E;
 Fri, 23 Oct 2026 14:56:04 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=ZLWcUEBEofWWRS9WLLImboQAyObHzTFKKSQIHkkOuRE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=bu2xfvtCeDfYqBDr9sMZipwQWzEUjTV1ZX73qXBrZMM1wc2eCV7mgMcr9SllcTCgb88QDFv7+
 V0PCRx/MOn4OwHZ3rTLUYGTkCoeItbFfiTMoHK78Z/E+CmfaV4b91mg6Rfaxfx3c6b/z9XCDdGB
 GDj+1yVw0pQzU76UmaqU8az9r+ln8B+/kpU0ZzvPq+lGgrX9ulcwGp2WYNbS0877FsVuYK8uFwL
 V64pdIDDNJJZcvqEKN0x3LbPWdOsDQIcCXnnHiO3havlLM49te8r46kemf4BfmWOKV5P0EO1vnh
 XLi51eZweyxNiS3If6hfSpbdLBzJ8POeUqAPgdJm3ILg==
X-Zone-Loop: be2c76e1fb2a453991b5adf3bbc31cf14b4ea2c95aa3
x-campaign-type: default
x-transaction-id: f321dc66-ee84-429c-b791-bc7e52416d0b
x-swg-uid: 01-2c519718-70c5-473a-b614-20adb0191076
X-Mailer: Sweego
Message-ID:
 <1792760165.8631fc262581453bbf619ec5b2062170.1a168d535ab000f79f@vates.tech>
x-swg-bid: 1792760165.8631fc262581453bbf619ec5b2062170.1a168d535ab000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 29/39] xen/riscv: prepare new IMSIC VS-file
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
In-Reply-To: <7f00946a6b1b67e79f94e3c665f8f0ce9d5d0e5a.1790779209.git.oleksii.kurochko@gmail.com>
References: <cover.1790779209.git.oleksii.kurochko@gmail.com>
 <7f00946a6b1b67e79f94e3c665f8f0ce9d5d0e5a.1790779209.git.oleksii.kurochko@gmail.com>
Date: Fri, 23 Oct 2026 14:55:57 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792760159; l=4718;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=7vLr5WKKYQLUMiTtOiKwXp5adFr+HrjqZkyMG0wyIVM=;
 b=eF7gZrQogzCzp8f69qMg3dNBuqpX8NaDke2iQQyL2LyPiAP4nxYknq6nP2M/KZL1xpzAWyLqo
 9y0aJ+5A2JxDw2/O/akfnwbKNtjJNhRaW5GTk9cRE61mPMkpzqufGMB
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792760165149
X-purgate-ID: tlsNG-720697/1792760168-F0AA52AC-B296FFDC/0/0
X-purgate-type: clean
X-purgate-size: 4718
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> [ ... 64 lines skipped ... ]
> diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
> index e31c9c2d24..229ab4b867 100644
> --- a/xen/arch/riscv/aia.c
> +++ b/xen/arch/riscv/aia.c
> @@ -1,8 +1,10 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
>  
> +#include <xen/bug.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/sections.h>
> +#include <xen/sched.h>
Nit: Why xen/sched.h? The stub doesn't dereference v, and asm/aia.h already
forward-declares struct vcpu. If it stays: sched < sections, so it goes one
line up.
> [ ... 30 lines skipped ... ]
> +#define imsic_vs_csr_write(c, v)    \
> +do {                                \
> +    csr_write(CSR_VSISELECT, c);    \
> +    csr_write(CSR_VSIREG, v);       \
> +} while (0)
> +
> +/*
> + * Leaf macros for the switchcase expansion pyramid below:
> + * imsic_switchcase_break(ireg, op, v) - emit "case ireg: op(ireg, v); break"
> + */
> +#define imsic_switchcase_break(ireg, op, v) \
> +    case ireg:                              \
> +        op(ireg, v);                        \
> +        break
> +
> +/*
> + * Generic switchcase expansion pyramid.
> + * F is the per-operation leaf macro, ireg is the base register index.
> + * Extra args (e.g. an operation and/or a value) are forwarded to F via
> + * __VA_ARGS__.
> + */
> +#define imsic_switchcase_2(F, ireg, ...)             \
> +    F((ireg) + 0, __VA_ARGS__);                      \
> +    F((ireg) + 1, __VA_ARGS__)
> +#define imsic_switchcase_4(F, ireg, ...)             \
> +    imsic_switchcase_2(F, (ireg) + 0, __VA_ARGS__);  \
> +    imsic_switchcase_2(F, (ireg) + 2, __VA_ARGS__)
> +#define imsic_switchcase_8(F, ireg, ...)             \
> +    imsic_switchcase_4(F, (ireg) + 0, __VA_ARGS__);  \
> +    imsic_switchcase_4(F, (ireg) + 4, __VA_ARGS__)
> +#define imsic_switchcase_16(F, ireg, ...)            \
> +    imsic_switchcase_8(F, (ireg) + 0, __VA_ARGS__);  \
> +    imsic_switchcase_8(F, (ireg) + 8, __VA_ARGS__)
> +#define imsic_switchcase_32(F, ireg, ...)            \
> +    imsic_switchcase_16(F, (ireg) + 0, __VA_ARGS__); \
> +    imsic_switchcase_16(F, (ireg) + 16, __VA_ARGS__)
> +#define imsic_switchcase_64(F, ireg, ...)            \
> +    imsic_switchcase_32(F, (ireg) + 0, __VA_ARGS__); \
> +    imsic_switchcase_32(F, (ireg) + 32, __VA_ARGS__)
> +
> +static void imsic_eix_write(unsigned int ireg, unsigned long val)
> +{
> +    switch ( ireg )
> +    {
> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIP0,
> +                        imsic_vs_csr_write, val);
> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIE0,
> +                        imsic_vs_csr_write, val);
> +    default:
> +        ASSERT_UNREACHABLE();
> +        break;
> +    }
> +}
> +
What does the switch buy? ireg only ends up as the value written to
vsiselect, not as a CSR number, so it doesn't need to be a compile-time
constant. imsic_vs_csr_write(ireg, val) does the same, without the 128 case
labels and the macro pyramid. If there's a reason, it wants stating in a
comment; otherwise please drop the pyramid (an ASSERT() on the range can
stay if you want one).

Typo (only if the macros stay): "Leaf macros" - there's only one here. And
`case ireg:` / `op(ireg, v)` as well as c and v in imsic_vs_csr_write()
want parenthesizing (MISRA 20.7).
> [ ... 67 lines skipped ... ]
> +static void cf_check imsic_vsfile_local_clear(void *data)
> +{
> +    unsigned int i;
> +    const struct imsic_vsfile_data *idata = data;
> +    unsigned long new_hstatus, old_hstatus, old_vsiselect;
> +
> +    /* We can only zero-out if we have a IMSIC VS-file */
Typo: s/a IMSIC/an IMSIC/
> [ ... 31 lines skipped ... ]
>  void imsic_migrate_vcpu(struct vcpu *v)
>  {
> +    struct imsic_vsfile_data vsfile_data = {
> +        .nr_eix = imsic_cfg.nr_eix,
> +    };
> +
>      /*
>       * The scheduler can mark a freshly created vCPU's unit as migrated and
>       * invoke this before the vCPU has ever run (see the migrated branch in
> @@ -703,5 +849,18 @@ void imsic_migrate_vcpu(struct vcpu *v)
>      if ( v->arch.last_cpu == CPU_NONE )
>          return;
>  
> +    /*
> +     * At this point, all interrupt producers are still using the old IMSIC
> +     * VS-file.
> +     */
> +
> +    vsfile_data.hgei = vgein_assign(v);
> +
> +    /* We don't support SW interrupt files at the moment. */
> +    BUG_ON(!vsfile_data.hgei);
> +
> +    /* Zero-out new IMSIC VS-file */
> +    imsic_call_on_cpu(v->processor, imsic_vsfile_local_clear, &vsfile_data);
Nit: The comment restates the call; drop it.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

