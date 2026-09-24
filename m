Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FB3C9830E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 14:26:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432409.1653737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9kOZ-0003bL-1A; Thu, 24 Sep 2026 14:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432409.1653737; Thu, 24 Sep 2026 14:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9kOY-0003bD-Tv; Thu, 24 Sep 2026 14:25:54 +0000
Received: by outflank-mailman (input) for mailman id 1432409;
 Thu, 24 Sep 2026 14:25:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x9kOX-0003b6-BP
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 14:25:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9kOW-00EwCk-OJ
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 16:25:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d3cee79600072c4@swg.vates.tech>)
 id 6ab532e8-bab6-0a2a0a5309dd-0a2a450380a8-18
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 16:25:52 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0d3cee79600072c4@swg.vates.tech>)
 id 6ab532f0-fae8-0a2a45030019-b9ff1c12a8df-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 16:25:52 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0d3cee79600072c4.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 24 Sep 2026 14:25:47 +0000
Received: from [192.168.1.46] (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: baptiste.le-duc)
 by mail2.vates.fr (Postfix) with ESMTPSA id 783CE81EA6;
 Thu, 24 Sep 2026 16:25:46 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=pgD99OPWhS2+dozYhllIuqvIxVyi9V2mn9n5kxDxa2U=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=YdibUOkf0q4M15+dxqFs4v+R9xo/iua2mPJrM1L8V03vPGIE5D2aSF5/4Vm9QK8P5T8dr0OEY
 2KtqA46nG0pNGAEAM6wepO11XXXoMikbR53QtLj26p1F6RH/Qd75eggFhFM1IMuw6Ao4exI6S05
 iSuypVZxMWGqnOU2PzyN9N7USuzYXOjE8TNJI0IVWTeszHMS4ovGqZ6jQlw2CR0r0kNOUpZEg7s
 Ov3a2EaTTMU28Qjy7dNBKaogfA+Lg+S6AzsLAJDohHW3lsg6G58usASer4QNQ/jyiqvQkaYDga/
 70bYDSjYO7cs3z2w1TqPM3r87Z7O9K/tRZQisTMy22Pw==
X-Zone-Loop: 34665cbd472bd0dba862fab8c3f08dcb1d37e41df772
x-campaign-type: default
x-transaction-id: 6b8d1706-cc5d-4a80-b176-856d61502683
x-swg-uid: 01-5c35a8cd-4bb4-406f-88a2-46012120e8e2
X-Mailer: Sweego
Message-ID:
 <1790259947.8631fc262581453bbf619ec5b2062170.1a0d3cee79600072c4@vates.tech>
x-swg-bid: 1790259947.8631fc262581453bbf619ec5b2062170.1a0d3cee79600072c4
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 36/39] xen/riscv: wake up a descheduled vCPU on a
 guest external interrupt
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
In-Reply-To: <ed5a8b4d8137d9ce2f291956d19fbeaf61cce7a9.1787838835.git.oleksii.kurochko@gmail.com>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <ed5a8b4d8137d9ce2f291956d19fbeaf61cce7a9.1787838835.git.oleksii.kurochko@gmail.com>
Date: Thu, 24 Sep 2026 16:25:39 +0200
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790259941; l=8777;
 i=baptiste.le-duc@vates.tech; s=20260810; h=from:subject:message-id;
 bh=9y056bptfxndkZj69JAMSiYN5GgS+GQvU6OJpjFDa4k=;
 b=MVDU3jEjo7H6uaRHWQPVl3x9ACcfAv+k+cgWFC5DzJOrTrGUFdJlApy95rNDvXz354Qt2blCf
 C/RxqmhRfMAAbk4sHIUNa4fYo6uDiHTAPpkBbsVuKzQnRAJtnJloUcn
X-Developer-Key: i=baptiste.le-duc@vates.tech; a=ed25519;
 pk=N+BbdvMXRzrCuX/ieh4RWodiAKcLNvI+KjflcZ0oXCo=
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790259946713
X-purgate-ID: tlsNG-33051d/1790259952-6CADC4E9-1643989F/10/73395122804
X-purgate-type: spam
X-purgate-size: 8777

> While a vCPU is running, MSIs written to its h/w IMSIC guest interrupt
> file are delivered straight to VS-mode. Once the vCPU is descheduled
> nobody observes that file anymore, so a guest blocked on such an
> interrupt would stay blocked until some unrelated event happens to
> schedule it again.
> 
> Let Xen observe the file in that window: on deschedule set the vCPU's
> bit in HGEIE, which turns an interrupt pending in its VS-file into an
> HS-level SGEI, and clear the bit again on schedule-in. HGEIP only
> reports a file number, so to get from it back to a vCPU keep an
> owners[] map per pCPU, filled by vgein_{assign,release} alongside the
> VGEIN bitmap, and kick the vCPU it points at.
Nit: I would reword the last sentence to make it more clear:

    HGEIP only reports an interrupt file number, so to find the vCPU to
    kick, keep a per-pCPU owners[] array indexed by file number and
    updated in vgein_assign()/vgein_release() together with the VGEIN
    bitmap.

> 
> v->arch.hie is only initialized here and is written to the CSR later,
> on the context switch to the vCPU.
> 
> vgein_release() still has no caller: a vCPU going away has to both free
> its VGEIN slot and drop the owners[] entry, but there is no vCPU
> teardown path to hook it into yet. vgein_deinit() only covers a pCPU
> going offline.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>
> diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
> index 1aca07c2f7..9642a9796e 100644
> --- a/xen/arch/riscv/aia.c
> +++ b/xen/arch/riscv/aia.c
> @@ -18,6 +18,13 @@ struct vgein_ctrl {
>      /* The least-significant bits are implemented first, apart from bit 0 */
>      unsigned long bmp;
>      spinlock_t lock;
> +    /*
> +     * Guest interrupt file IDs run from 1 to geilen inclusive (0 means that
> +     * no guest external interrupt source is selected), and geilen can never
> +     * exceed BITS_PER_LONG - 1, so indexing this array by the ID directly
> +     * always fits.
> +     */
> +    struct vcpu *owners[BITS_PER_LONG];
>      unsigned int geilen;
>  };
>  
> @@ -62,23 +69,25 @@ static int cf_check cpu_callback(struct notifier_block *nfb,
>                                   unsigned long action, void *hcpu)
>  {
>      unsigned int cpu = (unsigned long)hcpu;
> -    int rc = 0;
>  
>      switch ( action )
>      {
>      case CPU_STARTING:
> -        rc = vgein_init();
> +    {
> +        int rc = vgein_init();
> +
>          if ( rc )
>              printk(XENLOG_ERR "AIA: failed to init vgein for CPU%u: %d\n",
>                     cpu, rc);
>          break;
> +    }
>  
>      case CPU_DYING:
>          vgein_deinit();
>          break;
>      }
>  
> -    return notifier_from_errno(rc);
> +    return NOTIFY_DONE;
>  }


>  
>  static struct notifier_block cpu_nfb = {
> @@ -138,7 +147,10 @@ unsigned int vgein_assign(struct vcpu *v)
>      if ( vgein_id > vgein->geilen )
>          vgein_id = 0;
>      else
> +    {
>          __set_bit(vgein_id, bmp);
> +        vgein->owners[vgein_id] = v;
> +    }
>  
>      spin_unlock_irqrestore(&vgein->lock, flags);
>  
> @@ -161,6 +173,7 @@ void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
>      spin_lock_irqsave(&vgein->lock, flags);
>      if ( !__test_and_clear_bit(vgein_id, &vgein->bmp) )
>          ASSERT_UNREACHABLE();
> +    vgein->owners[vgein_id] = NULL;
>      spin_unlock_irqrestore(&vgein->lock, flags);
>  
>  #ifdef VGEIN_DEBUG
> @@ -168,3 +181,36 @@ void vgein_release(struct vcpu *v, unsigned int vgein_id, unsigned int cpu)
>              __func__, v, vgein_id, cpu, vgein->bmp);
>  #endif
>  }
> +
> +void hgei_interrupt(void)
> +{
> +    unsigned long hgei_mask, flags;
> +    struct vgein_ctrl *vgein = &this_cpu(vgein);
> +
> +    hgei_mask = csr_read(CSR_HGEIP) & csr_read(CSR_HGEIE);


> +    csr_clear(CSR_HGEIE, hgei_mask);
> +
> +    spin_lock_irqsave(&vgein->lock, flags);
> +
> +    for_each_set_bit ( guest_file_id, hgei_mask )
> +    {
> +        /*
> +         * guest_file_id shouldn't be zero, as it will indicate that no
> +         * guest external interrupt source is selected for VS-level external
> +         * interrupts.
> +         */
> +        ASSERT(guest_file_id);


> +
> +        if ( vgein->owners[guest_file_id] )
> +        {
> +#ifdef VGEIN_DEBUG
> +            gprintk(XENLOG_DEBUG, "%s: kick ->%pv, hgei_mask(%#lx)\n",
> +                    __func__, vgein->owners[guest_file_id], hgei_mask);
> +#endif


> +
> +            vcpu_kick(vgein->owners[guest_file_id]);
> +        }
> +    }
> +
> +    spin_unlock_irqrestore(&vgein->lock, flags);
> +}
> diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
> index 2dfe4c2e72..2918196822 100644
> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -136,6 +136,8 @@ static void vcpu_csr_init(struct vcpu *v)
>          v->arch.hstateen0 = (hstateen0 & csr_masks.hstateen0) |
>                              csr_masks.ro_one.hstateen0;
>      }
> +
> +    v->arch.hie = MIP_SGEIP;


>  }
>  
>  static void continue_new_vcpu(struct vcpu *prev)
> @@ -398,6 +400,7 @@ static void restore_csr_regs(struct vcpu *vcpu)
>      csr_write(CSR_HEDELEG, vcpu->arch.hedeleg);
>      csr_write(CSR_HIDELEG, vcpu->arch.hideleg);
>      csr_write(CSR_HVIP, vcpu->arch.hvip);
> +    csr_write(CSR_HIE, vcpu->arch.hie);
>      csr_write64(CSR_HENVCFG, vcpu->arch.henvcfg);
>      csr_write(CSR_HCOUNTEREN, vcpu->arch.hcounteren);
>      csr_write64(CSR_HTIMEDELTA, vcpu->arch.htimedelta);
> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> index d7b137a1f5..0715206611 100644
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -510,12 +510,31 @@ void cf_check imsic_ctxt_switch_from(struct vcpu *v)
>  
>      write_lock_irqsave(&imsic_state->vsfile_lock, flags);
>      imsic_state->vsfile_cpu = v->processor;
> +    /*
> +     * Start to observe the VS-file from HS-mode: while the vCPU isn't
> +     * running an interrupt pending in its VS-file is reported through HGEIP
> +     * instead of being delivered to VS-mode, which lets Xen wake the vCPU up.
> +     */
> +    csr_set(CSR_HGEIE, BIT(imsic_state->guest_file_id, UL));
>      write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>  }


>  
>  void cf_check imsic_ctxt_switch_to(struct vcpu *v)
>  {
> -    /* Nothing to do */
> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
> +    unsigned long flags;
> +
> +    /* A s/w VS-file is never observed through HGEIP. */
> +    if ( !vcpu_guest_file_id(v) )
> +        return;
> +
> +    /*
> +     * The vCPU is about to run, so hstatus.VGEIN delivers the VS-file's
> +     * interrupts to it directly and there is nothing left for Xen to observe.
> +     */
> +    read_lock_irqsave(&imsic_state->vsfile_lock, flags);
> +    csr_clear(CSR_HGEIE, BIT(imsic_state->guest_file_id, UL));
> +    read_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>  }


>  
>  int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
> @@ -646,6 +665,12 @@ static void cf_check imsic_vsfile_local_read_clear(void *data)
>      struct imsic_mrif *mrif = idata->mrif;
>      unsigned long new_hstatus, old_hstatus, old_vsiselect;
>  
> +    /*
> +     * The HGEIE bit imsic_ctxt_switch_from() armed belongs to the old owner
> +     * only.
> +     */
> +    csr_clear(CSR_HGEIE, BIT(idata->hgei, UL));
> +
>      old_vsiselect = csr_read(CSR_VSISELECT);
>      old_hstatus = csr_read(CSR_HSTATUS);
>      new_hstatus = old_hstatus & ~HSTATUS_VGEIN;
> @@ -991,6 +1016,21 @@ int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
>      return fdt_end_node(fdt);
>  }
>  
> +/*
> + * Start to observe the interrupt file from HS-mode, the same way
> + * imsic_ctxt_switch_from() does it for a vCPU which is switched out.
> + *
> + * The counterpart, clearing the bit of the interrupt file which is left
> + * behind, is done by imsic_vsfile_local_read_clear(), which already runs on
> + * the pCPU owning that file.
> + */
> +static void cf_check imsic_local_hgeie_set(void *data)
> +{
> +    const struct imsic_vsfile_data *idata = data;
> +
> +    csr_set(CSR_HGEIE, BIT(idata->hgei, UL));
> +}
> +
Sorry I'm a bit lost here, are you doing that for vCPUs migration?
Because in your commit message you only mentioned scheduled-out case
which needs to have Xen observing the descheduled vCPU to re-scheduled
it, but no other case that would need to have interrupt file observed is
explained

-- 
Baptiste Le Duc <baptiste.le-duc@vates.tech>

