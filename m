Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2F0C9830C
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 13:35:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1430695.1653205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9N7l-0004ra-Oj; Wed, 23 Sep 2026 13:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1430695.1653205; Wed, 23 Sep 2026 13:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9N7l-0004rT-Lc; Wed, 23 Sep 2026 13:35:01 +0000
Received: by outflank-mailman (input) for mailman id 1430695;
 Wed, 23 Sep 2026 13:35:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9N7j-0004qD-Hh
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 13:35:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9N7i-00BSnW-Uc
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 15:34:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ce79f65d00072c4@swg.vates.tech>)
 id 6ab3d577-2eae-0a2a0a5409dd-0a2a4502a50a-28
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:34:58 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0ce79f65d00072c4@swg.vates.tech>)
 id 6ab3d582-6ca4-0a2a45020019-b9ff1c22b367-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 15:34:58 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0ce79f65d00072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 23 Sep 2026 13:34:54 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id B1A0D823C0;
 Wed, 23 Sep 2026 15:34:53 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=dFuIudNtE6oM2PjWLgsmu2jET1ZsEAt+xVFY2/KsvMo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=nskKXtmthWxVoMqcsvDkyQgxBB+ba6takTdVLMTg1ydVLru28T0kB3r15gq3VQ8dBSr/6dUW7
 CmnLK3nUQjlDCfjvN7BbFxDSdERC7YGNup8LQHq3WU80CE0Hgu6bDMy0hza50ra1wFXx/vC6hnS
 g0zUQuFdqkA42Oa18OAF9y/1EE/RGMxZeILrnIsXM/RdkOkW4prJStc2UvmgdfeTDQMjQA9eBQ2
 N/KYkSK1jLNF5fIbedqUVluXx9CFw+ShfkikVstV16cuLglIwUvckgGi5xNyDy+rDIyHs7Q8iK7
 MphJTmuFza9IgYVBuA4vDl0qLEB3MQpi36flftMRPv5w==
X-Zone-Loop: 6b28e4af744cc266a227bc57f616b11ab14635dfacd3
x-campaign-type: default
x-transaction-id: 2a8ee993-7704-4261-a27b-b280e175ec48
x-swg-uid: 01-781ff06c-eb71-4ce0-84b1-3cae80fa1eee
X-Mailer: Sweego
Message-ID:
 <1790170494.8631fc262581453bbf619ec5b2062170.1a0ce79f65d00072c4@vates.tech>
x-swg-bid: 1790170494.8631fc262581453bbf619ec5b2062170.1a0ce79f65d00072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 32/39] xen/riscv: remap interrupts to new IMSIC
 VS-file
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
In-Reply-To: <948e94b6610586b84626c98da033d301335dc7b0.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <948e94b6610586b84626c98da033d301335dc7b0.1787838835.git.oleksii.kurochko@gmail.com>
Date: Wed, 23 Sep 2026 15:34:46 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790170487; l=7073;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=Q0Q8nCD/NGSNdOI64l/GAgsGkm9DoUQ1ABw46i0/2hw=;
 b=MtUjOeZDcknlc+Bdg2XDgTOQuq+RAnvKTu0nObVSBzo0JYFbTFwgySmv8cgYYUA8LWhHTWbdk
 /nk7foteJAiDrG3zhMPzaZewpFp2CFtJnF1KL6xUSGz8MQ4TzjU3DWD
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790170493927
X-purgate-ID: tlsNG-720697/1790170498-F06A72AC-B7DE096D/10/73395122804
X-purgate-type: spam
X-purgate-size: 7073

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
"will be introduced later" would be stale in the future.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>


>
> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> index 5de4594961..5e9f6995e4 100644
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -27,6 +27,7 @@
>  #include <xen/xvmalloc.h>
>  
>  #include <asm/aia.h>
> +#include <asm/aplic.h>
>  #include <asm/imsic.h>
>  
>  #define IMSIC_HART_SIZE(guest_bits) (BIT(guest_bits, U) * IMSIC_MMIO_PAGE_SZ)
> @@ -60,6 +61,12 @@ static unsigned int __ro_after_init guest_num_msis;
>  #define IMSIC_DISABLE_EITHRESHOLD   1
>  #define IMSIC_ENABLE_EITHRESHOLD    0
>  
> +#define imsic_csr_read(c)           \
> +({                                  \
> +    csr_write(CSR_SISELECT, (c));   \
> +    csr_read(CSR_SIREG);            \
> +})
> +
>  #define imsic_csr_write(c, v)   \
>  do {                            \
>      csr_write(CSR_SISELECT, c); \
> @@ -141,6 +148,11 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v)
>      return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
>  }
>  
> +void imsic_update_state(struct vcpu *v, unsigned int guest_file_id)
> +{
> +    BUG_ON("unimplemented\n");
> +}
> +
>  void __init imsic_ids_local_delivery(bool enable)
>  {
>      if ( enable )
> @@ -242,6 +254,15 @@ void imsic_irq_disable(unsigned int irq)
>      spin_unlock(&imsic_cfg.lock);
>  }
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
>  /* Callers aren't intended to changed imsic_cfg so return const. */
>  const struct imsic_config *imsic_get_config(void)
>  {
> @@ -436,6 +457,11 @@ void cf_check imsic_ctxt_switch_to(struct vcpu *v)
>      /* Nothing to do */
>  }
>  
> +int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
> +{
> +    return -EOPNOTSUPP;
> +}
> +
>  int cf_check vcpu_imsic_init(struct vcpu *v)
>  {
>      struct vimsic_state *imsic_state;
> @@ -497,6 +523,27 @@ static void imsic_call_on_cpu(unsigned int cpu, void (*func)(void *),
>          on_selected_cpus(cpumask_of(cpu), func, data, 1);
>  }
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
It seems data arg is not used here
> +{
> +    imsic_local_eix_update(imsic_cfg.sync_id, 1, true, false);
> +
> +    aplic_genmsi_barrier();
> +
> +    while ( !imsic_local_is_pending(imsic_cfg.sync_id) )
> +        cpu_relax();
> +}
> +
>  static void cf_check imsic_vsfile_local_clear(void *data)
>  {
>      unsigned int i;
> @@ -837,6 +884,10 @@ void imsic_migrate_vcpu(struct vcpu *v)
>      struct imsic_vsfile_data vsfile_data = {
>          .nr_eix = nr_hw_eix,
>      };
> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
> +    unsigned long flags;
> +    unsigned int old_vsfile_id;
> +    unsigned int old_vsfile_cpu;
>  
>      /*
>       * The scheduler can mark a freshly created vCPU's unit as migrated and
> @@ -848,8 +899,22 @@ void imsic_migrate_vcpu(struct vcpu *v)
>      if ( v->arch.last_cpu == NR_CPUS )
>          return;
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
>      /*
>       * At this point, all interrupt producers are still using the old IMSIC
> +     * VS-file so we first move all interrupt producers to the new IMSIC
>       * VS-file.
>       */
>  
> @@ -870,5 +935,43 @@ void imsic_migrate_vcpu(struct vcpu *v)
>      /* Zero-out new IMSIC VS-file */
>      imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_clear, &vsfile_data);
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
This gets rewritten later in the series by "xen/riscv: introduce IMSIC h/w
interrupt file attaching to vcpu", which moves the clear/map/update sequence
into imsic_vsfile_acquire() (and adds vgein_release() on the error path).

Could imsic_vsfile_acquire() be introduced here (or in a prep patch) instead,
so that the later patch only adds imsic_vsfile_attach()? That would avoid the
churn.

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

