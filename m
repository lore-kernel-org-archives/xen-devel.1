Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC90EC98304
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 15:25:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430884.1653296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9OqS-00069q-FO; Wed, 23 Sep 2026 15:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430884.1653296; Wed, 23 Sep 2026 15:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9OqS-00069j-Ch; Wed, 23 Sep 2026 15:25:16 +0000
Received: by outflank-mailman (input) for mailman id 1430884;
 Wed, 23 Sep 2026 15:25:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9OqQ-00069c-Ho
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:25:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9OqP-009ZwT-Uu
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 17:25:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0cedeee2900072c4@swg.vates.tech>)
 id 6ab3ef3c-2eae-0a2a0a5409dd-0a2a4503ac08-26
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:25:13 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0cedeee2900072c4@swg.vates.tech>)
 id 6ab3ef59-fae8-0a2a45030019-b9ff1c22a9d3-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 17:25:13 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0cedeee2900072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 23 Sep 2026 15:25:11 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id C3517823F1;
 Wed, 23 Sep 2026 17:25:10 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=A0O4widBrgTO8ppcYRp27L3uLQE6Gf1qHqFDj9Xx2Oc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=gvepFN4dWymtlorbhHWDWkSHTC9pup/Sz00qeWhOWQSH+Aqg+c4yFNIuh/8EDBQDilpxImlPy
 J83mR6Lag3AzVLJlBVOiQFRputIW2LC3+f9F8TnftodwIj8xrkRM9X/F9VjeFNSU+yj77DbKqDz
 Fq2ip9oLRSJ3+5X/DJPtv5pE/0nB84M0mwn9tNrHKKZLfOrDqBhB2SauA+AthLOqBlC9G2s+P3S
 RK2FND39skfF+iml7pd4gIoKMnf+m+UfU8gfD6MQIibqnR9OJmWPeidZFX+QPg8cew65+lhq7i7
 BmqBETMY7qldVJUMzi2Rhn8LR00HZTisNOBEI0uJJ4dg==
X-Zone-Loop: 73962a39929b42fb26a835d2ca0ce7cbd2db22c8681d
x-campaign-type: default
x-transaction-id: 534a30be-c4fa-4c9b-80b8-41a2ff631381
x-swg-uid: 01-2cf5f2e2-09d6-4702-93f8-bedf152545c3
X-Mailer: Sweego
Message-ID:
 <1790177111.8631fc262581453bbf619ec5b2062170.1a0cedeee2900072c4@vates.tech>
x-swg-bid: 1790177111.8631fc262581453bbf619ec5b2062170.1a0cedeee2900072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 23 Sep 2026 17:25:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/39] xen/riscv: remap interrupts to new IMSIC VS-file
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <948e94b6610586b84626c98da033d301335dc7b0.1787838835.git.oleksii.kurochko@gmail.com>
From: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Content-Language: en-US
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
In-Reply-To: <948e94b6610586b84626c98da033d301335dc7b0.1787838835.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790177110997
X-purgate-ID: tlsNG-33051d/1790177113-6D6D64E9-C4837BBE/10/73395122804
X-purgate-type: spam
X-purgate-size: 9071

 > xen/riscv: remap interrupts to new IMSIC VS-file

Nit: The next patch uses "restore" in its title, we might want to use
"save" terminology here for symmetry? e.g.:
     "xen/riscv: save old interrupt file state to memory"


On 8/27/26 5:22 PM, Oleksii Kurochko wrote:
> After new IMSIC VS-file is zeroed-out it is necessary to do G-stage remaping
> fo new IMSIC VS-file. Also, if any interrupts at an APLIC are forwarded by
> MSIs to the old interrupt file, reconfigure the APLIC to send them to the
> new interrupt file.
> 
> Generally it is needed also to modify the relevant translation tables at
> all IOMMUs so that MSIs for this virtual interrupt file are now sent to
> the new physical interrupt file but it is skipped for now there is no IOMMU
> support for RISC-V.
> 
> Synchronize with APLIC to ensure that no straggler MSIs will arrive at
> the old interrupt file by using of aplic_genmsi_barrier().
> 
> Technically there is no need for read_lock_irqsave() and
> read_unlock_irqrestore() around reading of ->guest_file_id, as a write
> cannot happen in parallel: any update to ->guest_file_id for a vCPU
> will happen either in imsic_migrate_vcpu() itself or before the vCPU
> first gains control (in continue_new_vcpu()), so there is no concurrent
> access to it in imsic_migrate_vcpu(). The lock is added here for
> potential future cases.
> 
> Keep BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
> against silent incorrect behaviour or unexpected panics in guest VMs until
> the function is fully implemented.
> 
> imsic_map_guest_file() and imsic_update_state() are stubs for now and will
> be introduced later in a separate patch.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>   - New patch.
> ---
> ---
>   xen/arch/riscv/imsic.c             | 103 +++++++++++++++++++++++++++++
>   xen/arch/riscv/include/asm/imsic.h |   3 +
>   2 files changed, 106 insertions(+)
> 
> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> index 5de45949610d..5e9f6995e443 100644
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -27,6 +27,7 @@
>   #include <xen/xvmalloc.h>
>   
>   #include <asm/aia.h>
> +#include <asm/aplic.h>
>   #include <asm/imsic.h>
>   
>   #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
> @@ -60,6 +61,12 @@ static unsigned int __ro_after_init guest_num_msis;
>   #define IMSIC_DISABLE_EITHRESHOLD   1
>   #define IMSIC_ENABLE_EITHRESHOLD    0
>   
> +#define imsic_csr_read(c)           \
> +({                                  \
> +    csr_write(CSR_SISELECT, (c));   \
> +    csr_read(CSR_SIREG);            \
> +})
> +
>   #define imsic_csr_write(c, v)   \
>   do {                            \
>       csr_write(CSR_SISELECT, c); \
> @@ -141,6 +148,11 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v)
>       return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
>   }
>   
> +void imsic_update_state(struct vcpu *v, unsigned int guest_file_id)
> +{
> +    BUG_ON("unimplemented\n");
> +}
> +
>   void __init imsic_ids_local_delivery(bool enable)
>   {
>       if ( enable )
> @@ -242,6 +254,15 @@ void imsic_irq_disable(unsigned int irq)
>       spin_unlock(&imsic_cfg.lock);
>   }
>   
> +static bool imsic_local_is_pending(unsigned int id)
> +{
> +    unsigned long isel =
> +        (id / BITS_PER_LONG) * (BITS_PER_LONG / IMSIC_EIPx_BITS) + IMSIC_EIP0;
> +    unsigned long bit = BIT(id % BITS_PER_LONG, UL);
> +
> +    return !!(imsic_csr_read(isel) & bit);
> +}
> +
>   /* Callers aren't intended to changed imsic_cfg so return const. */
>   const struct imsic_config *imsic_get_config(void)
>   {
> @@ -436,6 +457,11 @@ void cf_check imsic_ctxt_switch_to(struct vcpu *v)
>       /* Nothing to do */
>   }
>   
> +int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
>   int cf_check vcpu_imsic_init(struct vcpu *v)
>   {
>       struct vimsic_state *imsic_state;
> @@ -497,6 +523,27 @@ static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
>           on_selected_cpus(cpumask_of(cpu), func, data, 1);
>   }
>   
> +/*
> + * Ensure that all the MSIs the APLIC has already generated for the hart this
> + * runs on have really reached the hart's IMSIC.
> + *
> + * The barrier is the one described by the AIA specification in
> + * "Synchronizing interactions between a hart and the APLIC": ask the APLIC to
> + * send an MSI to the hart itself and wait until it shows up as pending in the
> + * hart's own interrupt file. As it says nothing about MSIs on their way to
> + * any other hart, it has to be executed by the pCPU owning the interrupt file
> + * the MSIs were being sent to.
> + */
> +static void cf_check imsic_aplic_sync(void *data)
> +{
> +    imsic_local_eix_update(imsic_cfg.sync_id, 1, true, false);
> +
> +    aplic_genmsi_barrier();
> +
> +    while ( !imsic_local_is_pending(imsic_cfg.sync_id) )
> +        cpu_relax();
> +}
> +
>   static void cf_check imsic_vsfile_local_clear(void *data)
>   {
>       unsigned int i;
> @@ -837,6 +884,10 @@ void imsic_migrate_vcpu(struct vcpu *v)
>       struct imsic_vsfile_data vsfile_data = {
>           .nr_eix = nr_hw_eix,
>       };
> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
> +    unsigned long flags;
> +    unsigned int old_vsfile_id;
> +    unsigned int old_vsfile_cpu;
>   
>       /*
>        * The scheduler can mark a freshly created vCPU's unit as migrated and
> @@ -848,8 +899,22 @@ void imsic_migrate_vcpu(struct vcpu *v)
>       if ( v->arch.last_cpu == NR_CPUS )
>           return;
>   
> +    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
> +    old_vsfile_id = imsic_state->guest_file_id;
> +    old_vsfile_cpu = imsic_state->vsfile_cpu;
> +    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
> +
> +    /*
> +     * We don't support SW interrupt files at the moment. Bail out before
> +     * anything is touched, as the old file has no owning pCPU in that case
> +     * and there is nothing to retarget the producers away from.
> +     */
> +    if ( old_vsfile_cpu == NR_CPUS )
> +        panic("IMSIC SW-file isn't supported\n");
> +
>       /*
>        * At this point, all interrupt producers are still using the old IMSIC
> +     * VS-file so we first move all interrupt producers to the new IMSIC
>        * VS-file.
>        */
>   
> @@ -870,5 +935,43 @@ void imsic_migrate_vcpu(struct vcpu *v)
>       /* Zero-out new IMSIC VS-file */
>       imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_clear, &vsfile_data);
>   
> +    /* Update G-stage mapping for the new IMSIC VS-file */
> +    if ( imsic_map_guest_file(v, new_vsfile_hgei) )
> +    {
> +        domain_crash(v->domain, "Migration to hw interrupt file failed\n");
> +
> +        return;
> +    }
> +
> +    imsic_update_state(v, new_vsfile_hgei);
> +
> +    /*
> +     * TODO: Modify the relevant translation tables at all IOMMUs so that MSIs
> +     *       for this virtual interrupt file are now sent to the new physical
> +     *       interrupt file.
> +     */
> +    if ( iommu_enabled )
> +        printk_once("IMSIC: IOMMU MSI retargeting is not implemented\n");
> +
> +    /*
> +     * If any interrupts at an APLIC are forwarded by MSIs to the old interrupt
> +     * file, reconfigure the APLIC to send them to the new interrupt file.
> +     */
> +    aplic_reconfigure_target(v, old_vsfile_id, old_vsfile_cpu);
> +
> +    /*
> +     * Synchronizing interactions between a hart and the APLIC.
> +     *
> +     * The MSIs to be flushed are the ones still on their way to the old
> +     * interrupt file, so the barrier has to be done by the pCPU which owns
> +     * that file.
> +     */
> +    imsic_call_on_cpu(old_vsfile_cpu, imsic_aplic_sync, NULL);
> +
> +    /*
> +     * At this point, all interrupt producers have been moved
> +     * to the new IMSIC VS-file.
> +     */
> +
>       BUG_ON("unimplemented");
>   }
> diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
> index 6ea2e4b8ca12..6395b539c52d 100644
> --- a/xen/arch/riscv/include/asm/imsic.h
> +++ b/xen/arch/riscv/include/asm/imsic.h
> @@ -114,12 +114,15 @@ void imsic_ids_local_delivery(bool enable);
>   int vcpu_imsic_init(struct vcpu *v);
>   void vcpu_imsic_deinit(struct vcpu *v);
>   unsigned int vcpu_guest_file_id(const struct vcpu *v);
> +void imsic_update_state(struct vcpu *v, unsigned int guest_file_id);
>   
>   int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
>   
>   void imsic_ctxt_switch_from(struct vcpu *v);
>   void imsic_ctxt_switch_to(struct vcpu *v);
>   
> +int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id);
> +
>   void imsic_migrate_vcpu(struct vcpu *v);
>   
>   #endif /* ASM_RISCV_IMSIC_H */


