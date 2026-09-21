Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39294C982ED
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 16:15:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427752.1650537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8gfj-00049h-R3; Mon, 21 Sep 2026 16:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427752.1650537; Mon, 21 Sep 2026 16:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8gfj-00049a-OU; Mon, 21 Sep 2026 16:15:15 +0000
Received: by outflank-mailman (input) for mailman id 1427752;
 Mon, 21 Sep 2026 16:15:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x8gfi-00049T-Ij
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 16:15:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8gfh-00Dj9s-FU
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 18:15:13 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c4bff57900072c4@swg.vates.tech>)
 id 6ab15809-8faa-0a2a0a5109dd-0a2a4506dcbc-34
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 18:15:13 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0c4bff57900072c4@swg.vates.tech>)
 id 6ab15811-195a-0a2a45060019-b9ff1c228781-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 18:15:13 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0c4bff57900072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 21 Sep 2026 16:15:09 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id CD00580B5E;
 Mon, 21 Sep 2026 18:15:08 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=2c6HMFbObZqp9M8tEUOgquC1OeMDygg1yWrZjcnVNus=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=FCx593TiAl23R5zH7Da28DNdMcGTPL+o3FOWDIszz9yxJYLvBrG+sDQZfaitJv2O7kcdEKHA6
 0G5k1fwLHXJlLPQ7Cv+s63uFkWmfAjqt16rQqtXxa6/dhuO9q+WHp2X33071HSuWacJvyGRnu1R
 P2cFKpe1Oyg15SBeMmpSnKhpsUzR1zlMduLcsPvG2x11jvV+YMLTUybvhhHL0O6kZwMu6tuPr99
 jmEUWWYPLcP1I4tNwjCDFWyA3rUjA15suwNffqBp15fD0PF8b/7MjsXHJBsa0VqmyMHypKkJXok
 OLn/wQnDVPGUxF2HiLpAiuZLtL+Y4UIU8he+VKjK1Dng==
X-Zone-Loop: 66803f35ba05bc9aa7abaa99e81e6389fe02bc6e9d1a
x-campaign-type: default
x-transaction-id: b1189af5-d8ef-4555-805c-a72dee02ca9f
x-swg-uid: 01-e94081c9-8dc9-4f77-876b-67bdf94f80e9
X-Mailer: Sweego
Message-ID:
 <1790007309.8631fc262581453bbf619ec5b2062170.1a0c4bff57900072c4@vates.tech>
x-swg-bid: 1790007309.8631fc262581453bbf619ec5b2062170.1a0c4bff57900072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 21 Sep 2026 18:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/39] xen/riscv: prepare new IMSIC VS-file
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <440bc07dfb72d09da72b49ded6f78dc1f54a3ad5.1787838835.git.oleksii.kurochko@gmail.com>
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Content-Language: en-US
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
Autocrypt: addr=baptiste.le-duc@vates.tech; keydata=
 xsBNBGoPSX8BCADSuTikqW3FD4mscQugY1thRaKlIhcJ2G9YCWYXAlp+xosvTlzfIftOZZim
 750MLvyKtLPkQzB6TZtFZBiexSraaF/MdDKRTT5DcVa3r7ZnHgqMclWlPa4ioysS4yFcJanL
 cyNOT7HUFvIdirMMqiViedfYtS0GORPBBPVISD6ClMz3ecHIxqllfq9CHYQn4amKEfHmh6tm
 Rufo4Gjl6x8cUFZZlRQf+aCmUzdSPA0P5u3sueYH1uEz4w/jbD53MlKqzCvxUeOsfS2swTQA
 6mS9jIgOjNadpUTOzKfDHMgFirtG+HFpm45Nwp6KQizxgDVOfTnOfVHm5Gwqm3ETl9y5ABEB
 AAHNPEJhcHRpc3RlIExlIER1YyAoVmF0ZXMgWXViaWtleSkgPGJhcHRpc3RlLmxlLWR1Y0B2
 YXRlcy50ZWNoPsLAjgQTAQoAOBYhBGiSJ6HgW88MgT/gfu2Cu2XL9M6QBQJqD0l/AhsDBQsJ
 CAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEO2Cu2XL9M6QuMcH/ihiy/Nrxp919AmY0ENnc0NK
 r/2LDvW/hrX4FfbpxAmrGmQ7MU1aQTk0JDbfcsG8OYH6wO5sqnXb1gz50YrEdpfVSbHz5YTZ
 EhDIxE4g7NrvJZh3Qc0m0CAyjYTNHen7J6olVaCMjrOH7uRHUYZ7Pl3am9mZosfLmez/aWJO
 a6ihQxBXHI75brlk1teIURkep2kP7P0Flmfl4cA//saREoTF7GXCtjOSQk/xg8PP0Sswqp5G
 TdJptn3FQn6lAzfz0eFSYqkaoX2c2k1MDa7o+UX9cfGPL8ybMKnYkasLxck6eOWGJWf+YTrm
 ga/r0kBaftmqNDgt5nI2jNTDwZcT9g3OwE0Eag9JfwEIAM6IWbuBSvz+erv27oGDDpo8M6Fp
 dGUvft7v+WceHUfxiXpYFx9qgIU6XGy6y+3lJMAvNcltS8DuhioqMlfKRSYGKZlpliY65dNP
 557IuM4ctVJ+I9CVclvv9eahARQKgF5auLJAAlvGSmU+ufNvlwTUmLIRcrPviTmB6X5jJYc+
 fiNeyI0HcsgcN21C0r62tUCypuZ+vgEJXw2bx1V8mVGZKxdGJPh58QF6kRK+xmd4kEComLGV
 BeM6BcVOtEjDcGNC0tLhXb0p9g1Ys55iA8sd6s4WacyolW2J6rwmcOkjiWexWw1caYgIWAV1
 004M3gwUaOz0dGq2i7HQ0AiVfVkAEQEAAcLAdgQYAQoAIBYhBGiSJ6HgW88MgT/gfu2Cu2XL
 9M6QBQJqD0l/AhsMAAoJEO2Cu2XL9M6QovYH/RjstyL5o/V5K74ylBtz0j5t3pLX5JKbwApi
 656rGgDdqElImyvvZppNMl/mgHNzvxmfFAhJXnSX9f1fqVEQKOGEhLUastnl/ssBiE5x7btM
 V0GAffxXbXJZbVv4b/DI+gVrOPc2YXlVwruapvTZNtD3hqPrkjrmq5WTtGR2loIVSe62hmh0
 BGD2Fy79b/hYWyBqhayPBEjwGW75u4/yn+Yqy1PgG3hIcvg7GSuT3akhHZSB2Mbguzcoyf9Q
 DJl6t33JxPRkkNrEdkPPmRlQCTSiUkVjKqMDF3jlINWsJ5t4jKFsNF91ksdw7aQgiX+tQIpE
 ugMC1NuNi5dDGip66bw=
In-Reply-To: <440bc07dfb72d09da72b49ded6f78dc1f54a3ad5.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790007309060
X-purgate-ID: tlsNG-16d1c6/1790007313-FE67277B-BE7FC686/10/73395122804
X-purgate-type: spam
X-purgate-size: 10263



On 8/27/26 5:24 PM, Oleksii Kurochko wrote:
> Implement first steps of migration a vCPU to a different guest interrupt file
> procedure:
> - At the old interrupt file, save to memory the values of registers
>    eidelivery and eithreshold, and set eidelivery = 0.
> - At the new interrupt file, set eidelivery = 0, and zero all
>    implemented interrupt-pending bits (the eip array).
> 
> The following steps will be introduced in follow-up patches.
> 
> Add a BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
> against silent incorrect behaviour or unexpected panics in guest VMs until
> the function is fully implemented.
> 
> vgein_assign() will be introduced later in a separate patch, for not it is
> only stub.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>   - New patch.
> ---
> ---
>   xen/arch/riscv/aia.c             |   9 ++
>   xen/arch/riscv/imsic.c           | 159 +++++++++++++++++++++++++++++++
>   xen/arch/riscv/include/asm/aia.h |   4 +
>   xen/include/xen/config.h         |   1 +
>   4 files changed, 173 insertions(+)
> 
> diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
> index e31c9c2d24b6..75c82bcfa1b3 100644
> --- a/xen/arch/riscv/aia.c
> +++ b/xen/arch/riscv/aia.c
> @@ -1,8 +1,10 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   
> +#include <xen/bug.h>
>   #include <xen/errno.h>
>   #include <xen/init.h>
>   #include <xen/sections.h>
> +#include <xen/sched.h>
>   #include <xen/types.h>
>   
>   #include <asm/cpufeature.h>
> @@ -21,3 +23,10 @@ void __init aia_init(void)
>   
>       _aia_usable = true;
>   }
> +
> +unsigned int vgein_assign(struct vcpu *v)
> +{
> +    BUG_ON("unimplemented\n");
> +
> +    return 0;
> +}
> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> index ad7fbe708bfd..516f0105352a 100644
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -26,6 +26,7 @@
>   #include <xen/spinlock.h>
>   #include <xen/xvmalloc.h>
>   
> +#include <asm/aia.h>
>   #include <asm/imsic.h>
>   
>   #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
> @@ -77,6 +78,64 @@ do {                            \
>       csr_clear(CSR_SIREG, v);    \
>   } while (0)
>   
> +#define imsic_vs_csr_write(c, v)    \
> +do {                                \
> +    csr_write(CSR_VSISELECT, (c));  \
> +    csr_write(CSR_VSIREG, (v));     \
> +} while ( 0 )
> +
> +/*
> + * Generic switchcase expansion pyramid.
> + * F is the per-operation leaf macro, ireg is the base register index.
> + * Optional extra args (e.g. an operation and/or a value) are forwarded to F
> + * via __VA_ARGS__.
> + *
> + * imsic_switchcase_break(ireg, op, v) - emit "case ireg: op(ireg,v); break;"
> + * imsic_switchcase_ret(ireg, op, ...) - emit "case ireg: return op(ireg[,v]);"
> + *   The variadic tail is optional so the same leaf works for both read (no v)
> + *   and swap (with v).
> + */
> +#define imsic_switchcase_break(ireg, op, v) \
> +    case ireg:                              \
> +        op(ireg, v);                        \
> +        break;
> +
> +#define imsic_switchcase_ret(ireg, op, ...) \
> +    case ireg:                              \
> +        return op(ireg, ##__VA_ARGS__);
> +
> +#define imsic_switchcase_2(F, ireg, ...)    \
> +    F(ireg + 0, ##__VA_ARGS__)              \
> +    F(ireg + 1, ##__VA_ARGS__)
> +#define imsic_switchcase_4(F, ireg, ...)    \
> +    imsic_switchcase_2(F, ireg + 0, ##__VA_ARGS__)  \
> +    imsic_switchcase_2(F, ireg + 2, ##__VA_ARGS__)
> +#define imsic_switchcase_8(F, ireg, ...)    \
> +    imsic_switchcase_4(F, ireg + 0, ##__VA_ARGS__)  \
> +    imsic_switchcase_4(F, ireg + 4, ##__VA_ARGS__)
> +#define imsic_switchcase_16(F, ireg, ...)   \
> +    imsic_switchcase_8(F, ireg + 0, ##__VA_ARGS__)  \
> +    imsic_switchcase_8(F, ireg + 8, ##__VA_ARGS__)
> +#define imsic_switchcase_32(F, ireg, ...)   \
> +    imsic_switchcase_16(F, ireg + 0, ##__VA_ARGS__) \
> +    imsic_switchcase_16(F, ireg + 16, ##__VA_ARGS__)
> +#define imsic_switchcase_64(F, ireg, ...)   \
> +    imsic_switchcase_32(F, ireg + 0, ##__VA_ARGS__) \
> +    imsic_switchcase_32(F, ireg + 32, ##__VA_ARGS__)
> +
> +static void imsic_eix_write(unsigned int ireg, unsigned long val)
> +{
> +    switch ( ireg )
> +    {
> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIP0,
> +                        imsic_vs_csr_write, val)
> +    imsic_switchcase_64(imsic_switchcase_break, IMSIC_EIE0,
> +                        imsic_vs_csr_write, val)
> +    default:
> +        ASSERT_UNREACHABLE();
> +    }
> +}
> +
>   unsigned int vcpu_guest_file_id(const struct vcpu *v)
>   {
>       return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
> @@ -389,6 +448,76 @@ int cf_check vcpu_imsic_init(struct vcpu *v)
>       return 0;
>   }
>   
> +/*
> + * Arguments of the imsic_vsfile_local_*() helpers, which are executed by the
> + * pCPU owning the interrupt file, thereby through imsic_call_on_cpu().
> + */
> +struct imsic_vsfile_data {
> +    unsigned int hgei;
> +    unsigned int nr_eix;
> +    struct imsic_mrif *mrif;
> +};
> +
> +/*
> + * Execute func() on the pCPU which owns the IMSIC interrupt file func() is
> + * going to work with.
> + *
> + * An IMSIC VS-file is reachable only through hstatus.VGEIN of the hart the
> + * file belongs to, and a guest interrupt file index is meaningless on any
> + * other hart, so such work always has to be done by that very hart.
> + *
> + * The local case runs with IRQs disabled to provide func() with the same
> + * environment it is given when it is called from the function call IPI
> + * handler.
> + */
> +static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
> +                              void *data)
> +{
> +    if ( cpu == smp_processor_id() )
> +    {
> +        unsigned long flags;
> +
> +        local_irq_save(flags);
> +        func(data);
> +        local_irq_restore(flags);
> +    }
> +    else
> +        on_selected_cpus(cpumask_of(cpu), func, data, 1);
> +}
> +
> +static void cf_check imsic_vsfile_local_clear(void *data)
I think the remark from Jan to direclty pass the type instead of void
could be applied here.
> +{
> +    unsigned int i;
> +    const struct imsic_vsfile_data *idata = data;
> +    unsigned long new_hstatus, old_hstatus, old_vsiselect;
> +
> +    /* We can only zero-out if we have a IMSIC VS-file */
> +    if ( !idata->hgei )
> +        return;
> +
> +    old_vsiselect = csr_read(CSR_VSISELECT);
> +    old_hstatus = csr_read(CSR_HSTATUS);
> +    new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
> +    new_hstatus |= MASK_INSR(idata->hgei, HSTATUS_VGEIN);
> +    csr_write(CSR_HSTATUS, new_hstatus);
> +
> +    imsic_vs_csr_write(IMSIC_EIDELIVERY, 0);
> +    imsic_vs_csr_write(IMSIC_EITHRESHOLD, 0);
> +
> +    for ( i = 0; i < idata->nr_eix; i++ )
> +    {
> +        imsic_eix_write(IMSIC_EIP0 + i * 2, 0);
> +        imsic_eix_write(IMSIC_EIE0 + i * 2, 0);
> +#ifdef CONFIG_RISCV_32
> +        imsic_eix_write(IMSIC_EIP0 + i * 2 + 1, 0);
> +        imsic_eix_write(IMSIC_EIE0 + i * 2 + 1, 0);
> +#endif
> +    }
> +
> +    csr_write(CSR_HSTATUS, old_hstatus);
> +    csr_write(CSR_VSISELECT, old_vsiselect);
> +}
> +
>   void cf_check vcpu_imsic_deinit(struct vcpu *v)
>   {
>       XVFREE(v->arch.vimsic_state);
> @@ -689,6 +818,14 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>   
>   void imsic_migrate_vcpu(struct vcpu *v)
>   {
> +    unsigned int new_vsfile_hgei;
> +    unsigned int new_vsfile_cpu;
> +    unsigned int nr_hw_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1,
> +                                          BITS_PER_TYPE(uint64_t));
This value appears to remain constant after initialization, since it 
depends directly on the hw,
so it is not necessary to calculate it each time.
> +    struct imsic_vsfile_data vsfile_data = {
> +        .nr_eix = nr_hw_eix,
> +    };
> +
>       /*
>        * The scheduler can mark a freshly created vCPU's unit as migrated and
>        * invoke this before the vCPU has ever run (see the migrated branch in
> @@ -699,5 +836,27 @@ void imsic_migrate_vcpu(struct vcpu *v)
>       if ( v->arch.last_cpu == NR_CPUS )
>           return;
>   
> +    /*
> +     * At this point, all interrupt producers are still using the old IMSIC
> +     * VS-file.
> +     */
> +
> +    /*
> +     * Latch the pCPU the new interrupt file is taken from: vgein_assign()
> +     * allocates it from v->processor's pool of guest interrupt files, and
> +     * only that hart can access the file afterwards.
> +     */
> +    new_vsfile_cpu = v->processor;
> +
> +    new_vsfile_hgei = vgein_assign(v);
> +
> +    /* We don't support SW interrupt files at the moment. */
> +    BUG_ON(!new_vsfile_hgei);
> +
> +    vsfile_data.hgei = new_vsfile_hgei;
> +
> +    /* Zero-out new IMSIC VS-file */
> +    imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_clear, &vsfile_data);
> +
>       BUG_ON("unimplemented");
>   }
> diff --git a/xen/arch/riscv/include/asm/aia.h b/xen/arch/riscv/include/asm/aia.h
> index aaa4bf91fc75..53a1efb042f8 100644
> --- a/xen/arch/riscv/include/asm/aia.h
> +++ b/xen/arch/riscv/include/asm/aia.h
> @@ -3,8 +3,12 @@
>   #ifndef RISCV_AIA_H
>   #define RISCV_AIA_H
>   
> +struct vcpu;
> +
>   bool aia_usable(void);
>   
>   void aia_init(void);
>   
> +unsigned int vgein_assign(struct vcpu *v);
> +
>   #endif /* RISCV_AIA_H */
> diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
> index dddc8e1920fe..0e29976e8203 100644
> --- a/xen/include/xen/config.h
> +++ b/xen/include/xen/config.h
> @@ -100,6 +100,7 @@
>   #define BITS_PER_INT    (BITS_PER_BYTE * __SIZEOF_INT__)
>   #define BITS_PER_LONG   (BITS_PER_BYTE * BYTES_PER_LONG)
>   #define BITS_PER_LLONG  (BITS_PER_BYTE * __SIZEOF_LONG_LONG__)
> +#define BITS_PER_TYPE(type) (sizeof(type) * BITS_PER_BYTE)
>   
>   /* It is assumed that sizeof(void *) == __alignof(void *) */
>   #define POINTER_ALIGN   __SIZEOF_POINTER__

