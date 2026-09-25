Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD3BC9830E
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 13:12:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433941.1654178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA5ij-00082n-3B; Fri, 25 Sep 2026 13:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433941.1654178; Fri, 25 Sep 2026 13:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA5ii-00082f-VZ; Fri, 25 Sep 2026 13:12:08 +0000
Received: by outflank-mailman (input) for mailman id 1433941;
 Fri, 25 Sep 2026 13:12:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xA5ih-00082Z-Rt
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 13:12:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA5ih-008dsR-8a
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 15:12:07 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d8b1bfe100072c4@swg.vates.tech>)
 id 6ab67327-8faa-0a2a0a5109dd-0a2a4505cb5e-0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 15:12:07 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d8b1bfe100072c4@swg.vates.tech>)
 id 6ab67326-4cb1-0a2a45050019-b9ff1c23937f-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 15:12:07 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0d8b1bfe100072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 25 Sep 2026 13:12:02 +0000
Received: from [192.168.1.37] (lfbn-gre-1-371-96.w90-112.abo.wanadoo.fr
 [90.112.87.96]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id AF5A981CD1;
 Fri, 25 Sep 2026 15:12:01 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=w9eBIw9fJ6ESu8YTJFgjQ7jbXsbgaKYaXGed1VaQ7xA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=baXy+O2gcvSC6mJvkHXU6KYV8cRgh3OXT//3T2NfYfkaJOL7ius0ujmx4ThUvcUaVOfLyN4ZE
 tWlQQ7lw0IeE6LOyaOEZcFLB7x5jkVupQoX/+Shy73a0AvkqaHShnCRhrXiGPOyXOoLeYGegswb
 Sw5ePYp7LK1hMoRPHt9mM74Kv+wMPJdufnd/33rtbE98rJFwBKX9SHdQOwOQa6Sj0Bh66mftWs2
 2/aJBuMncNDhVuSlgb7yltS39cUGRKrrN4Xhh5aEnkNTDqR+uI+1/cJjIiE/m3ONU37pIrBbA4l
 91T0cV3/FvKxhe4iGgLFK4myb/oWVOyxQlE6/SXDrx6Q==
X-Zone-Loop: 1290357f7e27a7124f587660a1550ed236990954d75f
x-campaign-type: default
x-transaction-id: 178cb50c-5ad4-426c-9c49-53c00debe465
x-swg-uid: 01-4af9c8aa-e81f-439d-ac2a-5bc558c5aaed
X-Mailer: Sweego
Message-ID:
 <1790341922.8631fc262581453bbf619ec5b2062170.1a0d8b1bfe100072c4@vates.tech>
x-swg-bid: 1790341922.8631fc262581453bbf619ec5b2062170.1a0d8b1bfe100072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 39/39] xen/riscv: introduce IMSIC h/w interrupt file
 attaching to vcpu
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
In-Reply-To: <4df9cf63943d0f371c8a25c6c9e84adbd3083a61.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4df9cf63943d0f371c8a25c6c9e84adbd3083a61.1787838835.git.oleksii.kurochko@gmail.com>
Date: Fri, 25 Sep 2026 15:11:54 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790341916; l=8963;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=363shaoP1PKMvVqQ4rcQQTRNgWRYhD5p1oIMkSS7WCI=;
 b=UaAnpPOqSofDyk83hPMUdy/pOiGXCLg5pIe5/qYKvDB6NybeDlFfjaIrxieVq6msIFq4GZPvA
 I/oVqXv4xwUCBT9du+owyA/W6XhV9JjrtNf9UYIzQPSnlKt03atDiEH
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790341921937
X-purgate-ID: tlsNG-c201ff/1790341927-F4EA12A1-570026C2/10/73395122804
X-purgate-type: spam
X-purgate-size: 8963

> Introduce imsic_vsfile_attach() to initialize the AIA-related state needed
> for a vCPU to have a working guest interrupt file.
> 
> A guest (VS) interrupt file must be mapped to one of a pCPU's
> hardware interrupt files (if they exist), so the pCPU a vCPU will actually
> run on needs to be known first. arch_vcpu_create() is therefore not a
> suitable place to call vcpu_aia_init(), since the pCPU assigned to a
> vCPU can still change before it is first scheduled. To avoid
> reassigning the VS interrupt file id and remapping it to a different
> pCPU's hardware interrupt file, imsic_vsfile_attach() is called from a
> later point in the scheduling path (e.g. continue_new_vcpu()). Since
> it will end up being called from a non-__init context, it is not
> itself marked __init.
> 
> Introduce imsic_update_state() to update a vCPU's guest IMSIC state
> (the guest interrupt file id and the pCPU whose hardware interrupt
> file it is mapped to) as a single consistent unit. This state can be
> read concurrently, e.g. by a future helper that checks whether a
> vCPU has a pending IMSIC interrupt, though no such consumer exists
> yet at this stage, so it is protected by a lock.
I have difficulties to clearly understand the aim of this function. In
fact, if we want to know if a vCPU has a pending interrupts, wouldn't be
enough to check hgeip[guest_file_id]?

In any case, why does updating vCPU's guest IMSIC state would be
required?
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
> index 0782148b72..15b6bfffa9 100644
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -155,6 +155,8 @@ static void continue_new_vcpu(struct vcpu *prev)
>          reset_stack_and_jump(idle_loop);
>      else
>      {
> +        imsic_vsfile_attach(current);
> +
>          /*
>           * During a context switch to a new vCPU, interrupts must be disabled
>           * to guarantee that the vCPU's CSR state can be safely restored into
> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> index 374a21ace1..ad638d7485 100644
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -212,7 +212,14 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v)
>  
>  void imsic_update_state(struct vcpu *v, unsigned int guest_file_id)
>  {
> -    BUG_ON("unimplemented\n");
> +    unsigned long flags;
> +    struct vimsic_state *vimsic_state = v->arch.vimsic_state;
> +    unsigned int cpu = guest_file_id ? v->processor : NR_CPUS;
> +
> +    write_lock_irqsave(&vimsic_state->vsfile_lock, flags);
> +    vimsic_state->guest_file_id = guest_file_id;
> +    vimsic_state->vsfile_cpu = cpu;
> +    write_unlock_irqrestore(&vimsic_state->vsfile_lock, flags);
>  }
>  
>  void __init imsic_ids_local_delivery(bool enable)
> @@ -640,6 +647,16 @@ struct imsic_vsfile_data {
>      struct imsic_mrif *mrif;
>  };
>  
> +/*
> + * Number of 64-bit EIx groups needed to cover all the interrupt identities an
> + * IMSIC interrupt file provides, which are 0 (never valid, but it still
> + * occupies a bit) up to and including imsic_cfg.nr_ids.
> + */
> +static unsigned int imsic_nr_eix(void)
> +{
> +    return DIV_ROUND_UP(imsic_cfg.nr_ids + 1, BITS_PER_TYPE(uint64_t));
> +}
> +
>  /*
>   * Execute func() on the pCPU which owns the IMSIC interrupt file func() is
>   * going to work with.
> @@ -1138,20 +1155,90 @@ static void cf_check imsic_vsfile_local_update(void *data)
>      csr_write(CSR_VSISELECT, old_vsiselect);
>  }
>  
> +/*
> + * Point the vCPU's HSTATUS.VGEIN at the guest interrupt file it has been
> + * given. It is applied to the hart when the vCPU's context is restored.
> + */
> +static void vcpu_set_vgein(struct vcpu *v, unsigned int vsfile_id)
> +{
> +    unsigned long hstatus = vcpu_guest_cpu_user_regs(v)->hstatus;
> +
> +    hstatus &= ~HSTATUS_VGEIN;
> +    hstatus |= MASK_INSR(vsfile_id, HSTATUS_VGEIN);
> +
> +    vcpu_guest_cpu_user_regs(v)->hstatus = hstatus;
> +}
> +
> +/*
> + * Take a h/w guest interrupt file of 'cpu' for the vCPU: zero the file out,
> + * map it into the domain's G-stage at the vCPU's virtual IMSIC page and
> + * record the new location in the per-vCPU IMSIC state.
> + *
> + * HSTATUS.VGEIN is deliberately left alone: the vCPU may be pointed at the
> + * file only when the file already holds the vCPU's interrupt state, which in
> + * the case of imsic_migrate_vcpu() happens only after the old file has been
> + * moved to the new one. Thereby it is up to the caller to call
> + * vcpu_set_vgein() at the right moment.
Nit: would clarify the paragraph here:
  HSTATUS.VGEIN is deliberately left alone: it must only point at a file
  which already holds the vCPU's interrupt state. The file taken here is
  zeroed, so for imsic_migrate_vcpu() VGEIN can only be updated once the
  state of the old file has been copied into it. Thereby it is up to the
  caller to call vcpu_set_vgein() at the right moment.
> + *
> + * Returns the id of the taken interrupt file, or 0 if none could be taken, in
> + * which case the domain is crashed.
> + */
> +static unsigned int imsic_vsfile_acquire(struct vcpu *v, unsigned int cpu)
> +{
> +    struct imsic_vsfile_data vsfile_data = { .nr_eix = imsic_nr_eix() };
> +    unsigned int vsfile_id;
> +    int rc;
> +
> +    vsfile_id = vgein_assign(v);
> +    if ( !vsfile_id )
> +    {
> +        /*
> +         * vgein_assign() returns 0 when no free h/w guest interrupt file is
> +         * available. s/w guest interrupt files aren't supported yet, so such
> +         * a vCPU can't be run.
> +         */
> +        domain_crash(v->domain,
> +                     "%pv: no free h/w guest interrupt file on CPU%u\n",
> +                     v, cpu);
> +        return 0;
> +    }
> +
> +    vsfile_data.hgei = vsfile_id;
> +
> +    /* The file could still hold the state of its previous owner */
> +    imsic_call_on_cpu(cpu, imsic_vsfile_local_clear, &vsfile_data);
> +
> +    rc = imsic_map_guest_file(v, vsfile_id);
> +    if ( rc )
> +    {
> +        vgein_release(v, vsfile_id, cpu);
> +
> +        /* Can't continue w/o correctly mapped IMSIC interrupt file */
> +        domain_crash(v->domain,
> +                     "%pv: failed to map h/w guest interrupt file %u: %d\n",
> +                     v, vsfile_id, rc);
> +        return 0;
> +    }
> +
> +    imsic_update_state(v, vsfile_id);
> +
> +    return vsfile_id;
> +}
> +
>  void imsic_migrate_vcpu(struct vcpu *v)
>  {
> -    unsigned int new_vsfile_hgei;
> +    unsigned int new_vsfile_id;
>      unsigned int new_vsfile_cpu;
> -    unsigned int nr_hw_eix = DIV_ROUND_UP(imsic_cfg.nr_ids + 1,
> -                                          BITS_PER_TYPE(uint64_t));
> -    struct imsic_vsfile_data vsfile_data = {
> -        .nr_eix = nr_hw_eix,
> -    };
> +    unsigned int nr_hw_eix = imsic_nr_eix();
>      struct vimsic_state *imsic_state = v->arch.vimsic_state;
>      unsigned long flags;
>      unsigned int old_vsfile_id;
>      unsigned int old_vsfile_cpu;
>      struct imsic_mrif tmrif = { };
> +    struct imsic_vsfile_data vsfile_data = {
> +        .nr_eix = nr_hw_eix,
> +        .mrif = &tmrif,
> +    };
>  
>      /*
>       * The scheduler can mark a freshly created vCPU's unit as migrated and
> @@ -1189,25 +1276,10 @@ void imsic_migrate_vcpu(struct vcpu *v)
>       */
>      new_vsfile_cpu = v->processor;
>  
> -    new_vsfile_hgei = vgein_assign(v);
> -
> -    /* We don't support SW interrupt files at the moment. */
> -    BUG_ON(!new_vsfile_hgei);
> -
> -    vsfile_data.hgei = new_vsfile_hgei;
> -
> -    /* Zero-out new IMSIC VS-file */
> -    imsic_call_on_cpu(new_vsfile_cpu, imsic_vsfile_local_clear, &vsfile_data);
> -
> -    /* Update G-stage mapping for the new IMSIC VS-file */
> -    if ( imsic_map_guest_file(v, new_vsfile_hgei) )
> -    {
> -        domain_crash(v->domain, "Migration to hw interrupt file failed\n");
> -
> +    /* Zero-out, map and start to use the new IMSIC VS-file */
> +    new_vsfile_id = imsic_vsfile_acquire(v, new_vsfile_cpu);
> +    if ( !new_vsfile_id )
>          return;
> -    }
> -
> -    imsic_update_state(v, new_vsfile_hgei);
>  
>      /*
>       * TODO: Modify the relevant translation tables at all IOMMUs so that MSIs
> @@ -1245,7 +1317,7 @@ void imsic_migrate_vcpu(struct vcpu *v)
>      vgein_release(v, old_vsfile_id, old_vsfile_cpu);
>  
>      /* Restore register state in the new IMSIC VS-file */
> -    vsfile_data.mrif = &tmrif;
> +    vsfile_data.hgei = new_vsfile_id;
Isn't this already done by imsic_vsfile_acquire()? Couldn't we pass a
&vsfile_data in their arg so it could fill it instead of allocating one
in the stack?

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

