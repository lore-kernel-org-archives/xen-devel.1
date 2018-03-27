From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v3a 14/39] ARM: new VGIC: Add GICv2 world
 switch backend
Date: Tue, 27 Mar 2018 00:16:59 +0000
Message-ID: <CAF3u54DYQm5acQ7ZB62kcBivYQ-ig8pC8gw00m6GFg2yVeHABQ@mail.gmail.com>
References: <20180322115649.5283-1-andre.przywara@linaro.org>
 <20180322115649.5283-3-andre.przywara@linaro.org>
 <alpine.DEB.2.10.1803261554540.12360@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2036764254998566215=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fdyk=gr=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1f0cIb-0000ZU-S2
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 00:17:13 +0000
Received: by mail-ot0-x244.google.com with SMTP id w12-v6so699620otj.7
 for <xen-devel@lists.xenproject.org>; Mon, 26 Mar 2018 17:17:11 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1803261554540.12360@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Andre Przywara <andre.przywara@linaro.org>
List-Id: xen-devel@lists.xenproject.org

--===============2036764254998566215==
Content-Type: multipart/alternative; boundary="000000000000c0e265056859cfac"

--000000000000c0e265056859cfac
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting.

On Tue, 27 Mar 2018, 07:25 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Thu, 22 Mar 2018, Andre Przywara wrote:
> > Processing maintenance interrupts and accessing the list registers
> > are dependent on the host's GIC version.
> > Introduce vgic-v2.c to contain GICv2 specific functions.
> > Implement the GICv2 specific code for syncing the emulation state
> > into the VGIC registers.
> > This also adds the hook to let Xen setup the host GIC addresses.
> >
> > This is based on Linux commit 140b086dd197, written by Marc Zyngier.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@linaro.org>
> > ---
> > Changelog v3 ... v3a:
> > - take hardware IRQ lock in vgic_v2_fold_lr_state()
> > - fix last remaining u32 usage
> > - print message when using new VGIC
> > - add TODO about racy _IRQ_INPROGRESS setting
> >
> > Changelog v2 ... v3:
> > - remove no longer needed asm/io.h header
> > - replace 0/1 with false/true for bool's
> > - clear _IRQ_INPROGRESS bit when retiring hardware mapped IRQ
> > - fix indentation and w/s issues
> >
> > Changelog v1 ... v2:
> > - remove v2 specific underflow function (now generic)
> > - re-add Linux code to properly handle acked level IRQs
> >
> >  xen/arch/arm/vgic/vgic-v2.c | 259
> ++++++++++++++++++++++++++++++++++++++++++++
> >  xen/arch/arm/vgic/vgic.c    |   6 +
> >  xen/arch/arm/vgic/vgic.h    |   9 ++
> >  3 files changed, 274 insertions(+)
> >  create mode 100644 xen/arch/arm/vgic/vgic-v2.c
> >
> > diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
> > new file mode 100644
> > index 0000000000..1773503cfb
> > --- /dev/null
> > +++ b/xen/arch/arm/vgic/vgic-v2.c
> > @@ -0,0 +1,259 @@
> > +/*
> > + * Copyright (C) 2015, 2016 ARM Ltd.
> > + * Imported from Linux ("new" KVM VGIC) and heavily adapted to Xen.
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program.  If not, see <http://www.gnu.org/licenses/
> >.
> > + */
> > +
> > +#include <asm/new_vgic.h>
> > +#include <asm/bug.h>
> > +#include <asm/gic.h>
> > +#include <xen/sched.h>
> > +#include <xen/sizes.h>
> > +
> > +#include "vgic.h"
> > +
> > +static struct {
> > +    bool enabled;
> > +    paddr_t dbase;          /* Distributor interface address */
> > +    paddr_t cbase;          /* CPU interface address & size */
> > +    paddr_t csize;
> > +    paddr_t vbase;          /* Virtual CPU interface address */
> > +
> > +    /* Offset to add to get an 8kB contiguous region if GIC is aliased
> */
> > +    uint32_t aliased_offset;
> > +} gic_v2_hw_data;
> > +
> > +void vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,
> > +                      paddr_t vbase, uint32_t aliased_offset)
> > +{
> > +    gic_v2_hw_data.enabled = true;
> > +    gic_v2_hw_data.dbase = dbase;
> > +    gic_v2_hw_data.cbase = cbase;
> > +    gic_v2_hw_data.csize = csize;
> > +    gic_v2_hw_data.vbase = vbase;
> > +    gic_v2_hw_data.aliased_offset = aliased_offset;
> > +
> > +    printk("Using the new VGIC implementation.\n");
> > +}
> > +
> > +/*
> > + * transfer the content of the LRs back into the corresponding ap_list:
> > + * - active bit is transferred as is
> > + * - pending bit is
> > + *   - transferred as is in case of edge sensitive IRQs
> > + *   - set to the line-level (resample time) for level sensitive IRQs
> > + */
> > +void vgic_v2_fold_lr_state(struct vcpu *vcpu)
> > +{
> > +    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
> > +    unsigned int used_lrs = vcpu->arch.vgic.used_lrs;
> > +    unsigned long flags;
> > +    unsigned int lr;
> > +
> > +    if ( !used_lrs )    /* No LRs used, so nothing to sync back here. */
> > +        return;
> > +
> > +    gic_hw_ops->update_hcr_status(GICH_HCR_UIE, false);
> > +
> > +    for ( lr = 0; lr < used_lrs; lr++ )
> > +    {
> > +        struct gic_lr lr_val;
> > +        uint32_t intid;
> > +        struct vgic_irq *irq;
> > +        struct irq_desc *desc = NULL;
> > +        bool have_desc_lock = false;
> > +
> > +        gic_hw_ops->read_lr(lr, &lr_val);
> > +
> > +        /*
> > +         * TODO: Possible optimization to avoid reading LRs:
> > +         * Read the ELRSR to find out which of our LRs have been cleared
> > +         * by the guest. We just need to know the IRQ number for those,
> which
> > +         * we could save in an array when populating the LRs.
> > +         * This trades one MMIO access (ELRSR) for possibly more than
> one (LRs),
> > +         * but requires some more code to save the IRQ number and to
> handle
> > +         * those finished IRQs according to the algorithm below.
> > +         * We need some numbers to justify this: chances are that we
> don't
> > +         * have many LRs in use most of the time, so we might not save
> much.
> > +         */
> > +        gic_hw_ops->clear_lr(lr);
> > +
> > +        intid = lr_val.virq;
> > +        irq = vgic_get_irq(vcpu->domain, vcpu, intid);
> > +
> > +        local_irq_save(flags);
>
> Shouldn't we disable interrupts earlier, maybe at the beginning of the
> function? Is it not a problem if we take an interrupt a couple of lines
> above with the read_lr and clear_lr that we do?
>
>
> > +        spin_lock(&irq->irq_lock);
> > +
> > +        /* The locking order forces us to drop and re-take the locks
> here. */
> > +        if ( irq->hw )
> > +        {
> > +            spin_unlock(&irq->irq_lock);
> > +
> > +            desc = irq_to_desc(irq->hwintid);
> > +            spin_lock(&desc->lock);
> > +            spin_lock(&irq->irq_lock);
> > +
> > +            /* This h/w IRQ should still be assigned to the virtual
> IRQ. */
> > +            ASSERT(irq->hw && desc->irq == irq->hwintid);
> > +
> > +            have_desc_lock = true;
> > +        }
>
> I agree with Julien that this looks very fragile. Instead, I think it
> would be best to always take the desc lock (if irq->hw) before the
> irq_lock earlier in this function. That way, we don't have to deal with
> this business of unlocking and relocking. Do you see any problems with
> it? We don't change irq->hw at run time, so it looks OK to me.
>
>
> > +        /*
> > +         * If a hardware mapped IRQ has been handled for good, we need
> to
> > +         * clear the _IRQ_INPROGRESS bit to allow handling of new IRQs.
> > +         *
> > +         * TODO: This is probably racy, but is so already in the
> existing
> > +         * VGIC. A fix does not seem to be trivial.
> > +         */
> > +        if ( irq->hw && !lr_val.active && !lr_val.pending )
> > +            clear_bit(_IRQ_INPROGRESS, &desc->status);
>
> I'll reply here to Julien's comment:
>
> > I realize the current vGIC is doing exactly the same thing. But this is
> racy.
> >
> > Imagine the interrupt is firing on another pCPU (I wasn't able to rule
> out this even when the interrupt is following the vCPU), that pCPU may set
> _IRQ_INPROGRESS before this
> > is cleared here.
>
> The assumption in the old vgic was that this scenario was not possible.
> vgic_migrate_irq would avoid changing physical interrupt affinity if a
> virtual interrupt was currently in an LR (see xen/arch/arm/vgic.c:L298).
> Instead, it would set the irq as GIC_IRQ_GUEST_MIGRATING, then at the
> time of clearing the LR we would change the physical irq affinity (see
> xen/arch/arm/gic-vgic.c:L240).


> I think we would need a similar mechanism here to protect ourselves from
> races. Is there something equivalent in the new vgic?
>

A mechanism that we know is already very racy on the old vGIC. You also
have to take into account that write to ITARGETR/IROUTER will take effect
in finite time. A interrupt may still get pending on the old pCPU.

To be honest we should migrate the interrupt on gues MMIO and finding a way
to handle the desc->state correctly.

One of the solution is to avoid relying in the desc->state when releasing
IRQ. So we would not need to care a potential.

Cheers,


>
> > +        /* Always preserve the active bit */
> > +        irq->active = lr_val.active;
> > +
> > +        /* Edge is the only case where we preserve the pending bit */
> > +        if ( irq->config == VGIC_CONFIG_EDGE && lr_val.pending )
> > +        {
> > +            irq->pending_latch = true;
> > +
> > +            if ( vgic_irq_is_sgi(intid) )
> > +                irq->source |= (1U << lr_val.virt.source);
> > +        }
> > +
> > +        /* Clear soft pending state when level irqs have been acked. */
> > +        if ( irq->config == VGIC_CONFIG_LEVEL && !lr_val.pending )
> > +            irq->pending_latch = false;
> > +
> > +        /*
> > +         * Level-triggered mapped IRQs are special because we only
> > +         * observe rising edges as input to the VGIC.
> > +         *
> > +         * If the guest never acked the interrupt we have to sample
> > +         * the physical line and set the line level, because the
> > +         * device state could have changed or we simply need to
> > +         * process the still pending interrupt later.
> > +         *
> > +         * If this causes us to lower the level, we have to also clear
> > +         * the physical active state, since we will otherwise never be
> > +         * told when the interrupt becomes asserted again.
> > +         */
> > +        if ( vgic_irq_is_mapped_level(irq) && lr_val.pending )
> > +        {
> > +            ASSERT(irq->hwintid >= VGIC_NR_PRIVATE_IRQS);
> > +
> > +            irq->line_level = gic_read_pending_state(desc);
> > +
> > +            if ( !irq->line_level )
> > +                gic_set_active_state(desc, false);
> > +        }
> > +
> > +        spin_unlock(&irq->irq_lock);
> > +        if ( have_desc_lock )
> > +            spin_unlock(&desc->lock);
> > +        local_irq_restore(flags);
> > +
> > +        vgic_put_irq(vcpu->domain, irq);
> > +    }
> > +
> > +    gic_hw_ops->update_hcr_status(GICH_HCR_EN, false);
> > +    vgic_cpu->used_lrs = 0;
> > +}
> > +
> > +/**
> > + * vgic_v2_populate_lr() - Populates an LR with the state of a given
> IRQ.
> > + * @vcpu: The VCPU which the given @irq belongs to.
> > + * @irq:  The IRQ to convert into an LR. The irq_lock must be held
> already.
> > + * @lr:   The LR number to transfer the state into.
> > + *
> > + * This moves a virtual IRQ, represented by its vgic_irq, into a list
> register.
> > + * Apart from translating the logical state into the LR bitfields, it
> also
> > + * changes some state in the vgic_irq.
> > + * For an edge sensitive IRQ the pending state is cleared in struct
> vgic_irq,
> > + * for a level sensitive IRQ the pending state value is unchanged, as
> it is
> > + * dictated directly by the input line level.
> > + *
> > + * If @irq describes an SGI with multiple sources, we choose the
> > + * lowest-numbered source VCPU and clear that bit in the source bitmap.
> > + *
> > + * The irq_lock must be held by the caller.
> > + */
> > +void vgic_v2_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq, int
> lr)
> > +{
> > +    struct gic_lr lr_val = {0};
> > +
> > +    lr_val.virq = irq->intid;
> > +
> > +    if ( irq_is_pending(irq) )
> > +    {
> > +        lr_val.pending = true;
> > +
> > +        if ( irq->config == VGIC_CONFIG_EDGE )
> > +            irq->pending_latch = false;
> > +
> > +        if ( vgic_irq_is_sgi(irq->intid) )
> > +        {
> > +            uint32_t src = ffs(irq->source);
> > +
> > +            BUG_ON(!src);
> > +            lr_val.virt.source = (src - 1);
> > +            irq->source &= ~(1 << (src - 1));
> > +            if ( irq->source )
> > +                irq->pending_latch = true;
> > +        }
> > +    }
> > +
> > +    lr_val.active = irq->active;
> > +
> > +    if ( irq->hw )
> > +    {
> > +        lr_val.hw_status = true;
> > +        lr_val.hw.pirq = irq->hwintid;
> > +        /*
> > +         * Never set pending+active on a HW interrupt, as the
> > +         * pending state is kept at the physical distributor
> > +         * level.
> > +         */
> > +        if ( irq->active && irq_is_pending(irq) )
> > +            lr_val.pending = false;
> > +    }
> > +    else
> > +    {
> > +        if ( irq->config == VGIC_CONFIG_LEVEL )
> > +            lr_val.virt.eoi = true;
> > +    }
> > +
> > +    /*
> > +     * Level-triggered mapped IRQs are special because we only observe
> > +     * rising edges as input to the VGIC.  We therefore lower the line
> > +     * level here, so that we can take new virtual IRQs.  See
> > +     * vgic_v2_fold_lr_state for more info.
> > +     */
> > +    if ( vgic_irq_is_mapped_level(irq) && lr_val.pending )
> > +        irq->line_level = false;
> > +
> > +    /* The GICv2 LR only holds five bits of priority. */
> > +    lr_val.priority = irq->priority >> 3;
> > +
> > +    gic_hw_ops->write_lr(lr, &lr_val);
> > +}
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
> > index d91ed29d96..214176c14e 100644
> > --- a/xen/arch/arm/vgic/vgic.c
> > +++ b/xen/arch/arm/vgic/vgic.c
> > @@ -520,6 +520,7 @@ retry:
> >
> >  static void vgic_fold_lr_state(struct vcpu *vcpu)
> >  {
> > +    vgic_v2_fold_lr_state(vcpu);
> >  }
> >
> >  /* Requires the irq_lock to be held. */
> > @@ -527,6 +528,8 @@ static void vgic_populate_lr(struct vcpu *vcpu,
> >                               struct vgic_irq *irq, int lr)
> >  {
> >      ASSERT(spin_is_locked(&irq->irq_lock));
> > +
> > +    vgic_v2_populate_lr(vcpu, irq, lr);
> >  }
> >
> >  static void vgic_set_underflow(struct vcpu *vcpu)
> > @@ -640,7 +643,10 @@ void vgic_sync_to_lrs(void)
> >      spin_lock(&current->arch.vgic.ap_list_lock);
> >      vgic_flush_lr_state(current);
> >      spin_unlock(&current->arch.vgic.ap_list_lock);
> > +
> > +    gic_hw_ops->update_hcr_status(GICH_HCR_EN, 1);
> >  }
> > +
> >  /*
> >   * Local variables:
> >   * mode: C
> > diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
> > index 1547478518..e2b6d51e47 100644
> > --- a/xen/arch/arm/vgic/vgic.h
> > +++ b/xen/arch/arm/vgic/vgic.h
> > @@ -27,6 +27,11 @@ static inline bool irq_is_pending(struct vgic_irq
> *irq)
> >          return irq->pending_latch || irq->line_level;
> >  }
> >
> > +static inline bool vgic_irq_is_mapped_level(struct vgic_irq *irq)
> > +{
> > +    return irq->config == VGIC_CONFIG_LEVEL && irq->hw;
> > +}
> > +
> >  struct vgic_irq *vgic_get_irq(struct domain *d, struct vcpu *vcpu,
> >                                uint32_t intid);
> >  void vgic_put_irq(struct domain *d, struct vgic_irq *irq);
> > @@ -41,6 +46,10 @@ static inline void vgic_get_irq_kref(struct vgic_irq
> *irq)
> >      atomic_inc(&irq->refcount);
> >  }
> >
> > +void vgic_v2_fold_lr_state(struct vcpu *vcpu);
> > +void vgic_v2_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq, int
> lr);
> > +void vgic_v2_set_underflow(struct vcpu *vcpu);
> > +
> >  #endif
> >
> >  /*
> > --
> > 2.14.1
> >
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000c0e265056859cfac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>Sorry for the formatting.<br><br><div class=3D"gmail=
_quote"><div dir=3D"ltr">On Tue, 27 Mar 2018, 07:25 Stefano Stabellini, &lt=
;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On Thu, 22 Mar 2018, Andre Pr=
zywara wrote:<br>
&gt; Processing maintenance interrupts and accessing the list registers<br>
&gt; are dependent on the host&#39;s GIC version.<br>
&gt; Introduce vgic-v2.c to contain GICv2 specific functions.<br>
&gt; Implement the GICv2 specific code for syncing the emulation state<br>
&gt; into the VGIC registers.<br>
&gt; This also adds the hook to let Xen setup the host GIC addresses.<br>
&gt;<br>
&gt; This is based on Linux commit 140b086dd197, written by Marc Zyngier.<b=
r>
&gt;<br>
&gt; Signed-off-by: Andre Przywara &lt;<a href=3D"mailto:andre.przywara@lin=
aro.org" target=3D"_blank">andre.przywara@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt; Changelog v3 ... v3a:<br>
&gt; - take hardware IRQ lock in vgic_v2_fold_lr_state()<br>
&gt; - fix last remaining u32 usage<br>
&gt; - print message when using new VGIC<br>
&gt; - add TODO about racy _IRQ_INPROGRESS setting<br>
&gt;<br>
&gt; Changelog v2 ... v3:<br>
&gt; - remove no longer needed asm/io.h header<br>
&gt; - replace 0/1 with false/true for bool&#39;s<br>
&gt; - clear _IRQ_INPROGRESS bit when retiring hardware mapped IRQ<br>
&gt; - fix indentation and w/s issues<br>
&gt;<br>
&gt; Changelog v1 ... v2:<br>
&gt; - remove v2 specific underflow function (now generic)<br>
&gt; - re-add Linux code to properly handle acked level IRQs<br>
&gt;<br>
&gt;=C2=A0 xen/arch/arm/vgic/vgic-v2.c | 259 ++++++++++++++++++++++++++++++=
++++++++++++++<br>
&gt;=C2=A0 xen/arch/arm/vgic/vgic.c=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
&gt;=C2=A0 xen/arch/arm/vgic/vgic.h=C2=A0 =C2=A0 |=C2=A0 =C2=A09 ++<br>
&gt;=C2=A0 3 files changed, 274 insertions(+)<br>
&gt;=C2=A0 create mode 100644 xen/arch/arm/vgic/vgic-v2.c<br>
&gt;<br>
&gt; diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c=
<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1773503cfb<br>
&gt; --- /dev/null<br>
&gt; +++ b/xen/arch/arm/vgic/vgic-v2.c<br>
&gt; @@ -0,0 +1,259 @@<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2015, 2016 ARM Ltd.<br>
&gt; + * Imported from Linux (&quot;new&quot; KVM VGIC) and heavily adapted=
 to Xen.<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License version 2 as<=
br>
&gt; + * published by the Free Software Foundation.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; + * GNU General Public License for more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License<=
br>
&gt; + * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;asm/new_vgic.h&gt;<br>
&gt; +#include &lt;asm/bug.h&gt;<br>
&gt; +#include &lt;asm/gic.h&gt;<br>
&gt; +#include &lt;xen/sched.h&gt;<br>
&gt; +#include &lt;xen/sizes.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;vgic.h&quot;<br>
&gt; +<br>
&gt; +static struct {<br>
&gt; +=C2=A0 =C2=A0 bool enabled;<br>
&gt; +=C2=A0 =C2=A0 paddr_t dbase;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Dis=
tributor interface address */<br>
&gt; +=C2=A0 =C2=A0 paddr_t cbase;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* CPU=
 interface address &amp; size */<br>
&gt; +=C2=A0 =C2=A0 paddr_t csize;<br>
&gt; +=C2=A0 =C2=A0 paddr_t vbase;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Vir=
tual CPU interface address */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Offset to add to get an 8kB contiguous region if GIC=
 is aliased */<br>
&gt; +=C2=A0 =C2=A0 uint32_t aliased_offset;<br>
&gt; +} gic_v2_hw_data;<br>
&gt; +<br>
&gt; +void vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 paddr_t vbase, uint32_t aliased_offset)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 gic_v2_hw_data.enabled =3D true;<br>
&gt; +=C2=A0 =C2=A0 gic_v2_hw_data.dbase =3D dbase;<br>
&gt; +=C2=A0 =C2=A0 gic_v2_hw_data.cbase =3D cbase;<br>
&gt; +=C2=A0 =C2=A0 gic_v2_hw_data.csize =3D csize;<br>
&gt; +=C2=A0 =C2=A0 gic_v2_hw_data.vbase =3D vbase;<br>
&gt; +=C2=A0 =C2=A0 gic_v2_hw_data.aliased_offset =3D aliased_offset;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 printk(&quot;Using the new VGIC implementation.\n&quot;=
);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * transfer the content of the LRs back into the corresponding ap_lis=
t:<br>
&gt; + * - active bit is transferred as is<br>
&gt; + * - pending bit is<br>
&gt; + *=C2=A0 =C2=A0- transferred as is in case of edge sensitive IRQs<br>
&gt; + *=C2=A0 =C2=A0- set to the line-level (resample time) for level sens=
itive IRQs<br>
&gt; + */<br>
&gt; +void vgic_v2_fold_lr_state(struct vcpu *vcpu)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct vgic_cpu *vgic_cpu =3D &amp;vcpu-&gt;arch.vgic;<=
br>
&gt; +=C2=A0 =C2=A0 unsigned int used_lrs =3D vcpu-&gt;arch.vgic.used_lrs;<=
br>
&gt; +=C2=A0 =C2=A0 unsigned long flags;<br>
&gt; +=C2=A0 =C2=A0 unsigned int lr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if ( !used_lrs )=C2=A0 =C2=A0 /* No LRs used, so nothin=
g to sync back here. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 gic_hw_ops-&gt;update_hcr_status(GICH_HCR_UIE, false);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for ( lr =3D 0; lr &lt; used_lrs; lr++ )<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct gic_lr lr_val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t intid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct vgic_irq *irq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct irq_desc *desc =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool have_desc_lock =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gic_hw_ops-&gt;read_lr(lr, &amp;lr_val);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* TODO: Possible optimization to av=
oid reading LRs:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Read the ELRSR to find out which =
of our LRs have been cleared<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* by the guest. We just need to kno=
w the IRQ number for those, which<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* we could save in an array when po=
pulating the LRs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* This trades one MMIO access (ELRS=
R) for possibly more than one (LRs),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* but requires some more code to sa=
ve the IRQ number and to handle<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* those finished IRQs according to =
the algorithm below.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* We need some numbers to justify t=
his: chances are that we don&#39;t<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* have many LRs in use most of the =
time, so we might not save much.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 gic_hw_ops-&gt;clear_lr(lr);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 intid =3D lr_val.virq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D vgic_get_irq(vcpu-&gt;domain, vcp=
u, intid);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 local_irq_save(flags);<br>
<br>
Shouldn&#39;t we disable interrupts earlier, maybe at the beginning of the<=
br>
function? Is it not a problem if we take an interrupt a couple of lines<br>
above with the read_lr and clear_lr that we do?<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock(&amp;irq-&gt;irq_lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The locking order forces us to drop an=
d re-take the locks here. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( irq-&gt;hw )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock(&amp;irq-&gt;ir=
q_lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 desc =3D irq_to_desc(irq-&g=
t;hwintid);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock(&amp;desc-&gt;loc=
k);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_lock(&amp;irq-&gt;irq_=
lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This h/w IRQ should stil=
l be assigned to the virtual IRQ. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASSERT(irq-&gt;hw &amp;&amp=
; desc-&gt;irq =3D=3D irq-&gt;hwintid);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 have_desc_lock =3D true;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
I agree with Julien that this looks very fragile. Instead, I think it<br>
would be best to always take the desc lock (if irq-&gt;hw) before the<br>
irq_lock earlier in this function. That way, we don&#39;t have to deal with=
<br>
this business of unlocking and relocking. Do you see any problems with<br>
it? We don&#39;t change irq-&gt;hw at run time, so it looks OK to me.<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If a hardware mapped IRQ has been=
 handled for good, we need to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* clear the _IRQ_INPROGRESS bit to =
allow handling of new IRQs.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* TODO: This is probably racy, but =
is so already in the existing<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* VGIC. A fix does not seem to be t=
rivial.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( irq-&gt;hw &amp;&amp; !lr_val.active=
 &amp;&amp; !lr_val.pending )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clear_bit(_IRQ_INPROGRESS, =
&amp;desc-&gt;status);<br>
<br>
I&#39;ll reply here to Julien&#39;s comment:<br>
<br>
&gt; I realize the current vGIC is doing exactly the same thing. But this i=
s racy.<br>
&gt;<br>
&gt; Imagine the interrupt is firing on another pCPU (I wasn&#39;t able to =
rule out this even when the interrupt is following the vCPU), that pCPU may=
 set _IRQ_INPROGRESS before this<br>
&gt; is cleared here.<br>
<br>
The assumption in the old vgic was that this scenario was not possible.<br>
vgic_migrate_irq would avoid changing physical interrupt affinity if a<br>
virtual interrupt was currently in an LR (see xen/arch/arm/vgic.c:L298).<br=
>
Instead, it would set the irq as GIC_IRQ_GUEST_MIGRATING, then at the<br>
time of clearing the LR we would change the physical irq affinity (see<br>
xen/arch/arm/gic-vgic.c:L240).</blockquote></div><div class=3D"gmail_quote"=
 dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">
<br>
I think we would need a similar mechanism here to protect ourselves from<br=
>
races. Is there something equivalent in the new vgic?<br></blockquote></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">A mechanism that we know is =
already very racy on the old vGIC. You also have to take into account that =
write to ITARGETR/IROUTER will take effect in finite time. A interrupt may =
still get pending on the old pCPU.=C2=A0</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">To be honest we should migrate the interrupt on gues MMIO =
and finding a way to handle the desc-&gt;state correctly.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">One of the solution is to avoid relying i=
n the desc-&gt;state when releasing IRQ. So we would not need to care a pot=
ential.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><di=
v dir=3D"auto"><br></div><div class=3D"gmail_quote" dir=3D"auto"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Always preserve the active bit */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq-&gt;active =3D lr_val.active;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Edge is the only case where we preserv=
e the pending bit */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( irq-&gt;config =3D=3D VGIC_CONFIG_ED=
GE &amp;&amp; lr_val.pending )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq-&gt;pending_latch =3D t=
rue;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( vgic_irq_is_sgi(intid)=
 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq-&gt;sourc=
e |=3D (1U &lt;&lt; lr_val.virt.source);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Clear soft pending state when level ir=
qs have been acked. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( irq-&gt;config =3D=3D VGIC_CONFIG_LE=
VEL &amp;&amp; !lr_val.pending )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq-&gt;pending_latch =3D f=
alse;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Level-triggered mapped IRQs are s=
pecial because we only<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* observe rising edges as input to =
the VGIC.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If the guest never acked the inte=
rrupt we have to sample<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the physical line and set the lin=
e level, because the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* device state could have changed o=
r we simply need to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* process the still pending interru=
pt later.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* If this causes us to lower the le=
vel, we have to also clear<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the physical active state, since =
we will otherwise never be<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* told when the interrupt becomes a=
sserted again.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( vgic_irq_is_mapped_level(irq) &amp;&=
amp; lr_val.pending )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASSERT(irq-&gt;hwintid &gt;=
=3D VGIC_NR_PRIVATE_IRQS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq-&gt;line_level =3D gic_=
read_pending_state(desc);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( !irq-&gt;line_level )<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gic_set_activ=
e_state(desc, false);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock(&amp;irq-&gt;irq_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( have_desc_lock )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spin_unlock(&amp;desc-&gt;l=
ock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 local_irq_restore(flags);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vgic_put_irq(vcpu-&gt;domain, irq);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 gic_hw_ops-&gt;update_hcr_status(GICH_HCR_EN, false);<b=
r>
&gt; +=C2=A0 =C2=A0 vgic_cpu-&gt;used_lrs =3D 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * vgic_v2_populate_lr() - Populates an LR with the state of a given =
IRQ.<br>
&gt; + * @vcpu: The VCPU which the given @irq belongs to.<br>
&gt; + * @irq:=C2=A0 The IRQ to convert into an LR. The irq_lock must be he=
ld already.<br>
&gt; + * @lr:=C2=A0 =C2=A0The LR number to transfer the state into.<br>
&gt; + *<br>
&gt; + * This moves a virtual IRQ, represented by its vgic_irq, into a list=
 register.<br>
&gt; + * Apart from translating the logical state into the LR bitfields, it=
 also<br>
&gt; + * changes some state in the vgic_irq.<br>
&gt; + * For an edge sensitive IRQ the pending state is cleared in struct v=
gic_irq,<br>
&gt; + * for a level sensitive IRQ the pending state value is unchanged, as=
 it is<br>
&gt; + * dictated directly by the input line level.<br>
&gt; + *<br>
&gt; + * If @irq describes an SGI with multiple sources, we choose the<br>
&gt; + * lowest-numbered source VCPU and clear that bit in the source bitma=
p.<br>
&gt; + *<br>
&gt; + * The irq_lock must be held by the caller.<br>
&gt; + */<br>
&gt; +void vgic_v2_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq, int=
 lr)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct gic_lr lr_val =3D {0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 lr_val.virq =3D irq-&gt;intid;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if ( irq_is_pending(irq) )<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lr_val.pending =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( irq-&gt;config =3D=3D VGIC_CONFIG_ED=
GE )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq-&gt;pending_latch =3D f=
alse;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( vgic_irq_is_sgi(irq-&gt;intid) )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t src =3D ffs(irq-&g=
t;source);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BUG_ON(!src);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lr_val.virt.source =3D (src=
 - 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq-&gt;source &amp;=3D ~(1=
 &lt;&lt; (src - 1));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( irq-&gt;source )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq-&gt;pendi=
ng_latch =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 lr_val.active =3D irq-&gt;active;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if ( irq-&gt;hw )<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lr_val.hw_status =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lr_val.hw.pirq =3D irq-&gt;hwintid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Never set pending+active on a HW =
interrupt, as the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* pending state is kept at the phys=
ical distributor<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* level.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( irq-&gt;active &amp;&amp; irq_is_pen=
ding(irq) )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lr_val.pending =3D false;<b=
r>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( irq-&gt;config =3D=3D VGIC_CONFIG_LE=
VEL )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lr_val.virt.eoi =3D true;<b=
r>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Level-triggered mapped IRQs are special because=
 we only observe<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* rising edges as input to the VGIC.=C2=A0 We the=
refore lower the line<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* level here, so that we can take new virtual IRQ=
s.=C2=A0 See<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* vgic_v2_fold_lr_state for more info.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if ( vgic_irq_is_mapped_level(irq) &amp;&amp; lr_val.pe=
nding )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq-&gt;line_level =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* The GICv2 LR only holds five bits of priority. */<br=
>
&gt; +=C2=A0 =C2=A0 lr_val.priority =3D irq-&gt;priority &gt;&gt; 3;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 gic_hw_ops-&gt;write_lr(lr, &amp;lr_val);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Local variables:<br>
&gt; + * mode: C<br>
&gt; + * c-file-style: &quot;BSD&quot;<br>
&gt; + * c-basic-offset: 4<br>
&gt; + * indent-tabs-mode: nil<br>
&gt; + * End:<br>
&gt; + */<br>
&gt; diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c<br>
&gt; index d91ed29d96..214176c14e 100644<br>
&gt; --- a/xen/arch/arm/vgic/vgic.c<br>
&gt; +++ b/xen/arch/arm/vgic/vgic.c<br>
&gt; @@ -520,6 +520,7 @@ retry:<br>
&gt;<br>
&gt;=C2=A0 static void vgic_fold_lr_state(struct vcpu *vcpu)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 vgic_v2_fold_lr_state(vcpu);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 /* Requires the irq_lock to be held. */<br>
&gt; @@ -527,6 +528,8 @@ static void vgic_populate_lr(struct vcpu *vcpu,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct vgic_irq *irq, int lr)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ASSERT(spin_is_locked(&amp;irq-&gt;irq_lock));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 vgic_v2_populate_lr(vcpu, irq, lr);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 static void vgic_set_underflow(struct vcpu *vcpu)<br>
&gt; @@ -640,7 +643,10 @@ void vgic_sync_to_lrs(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 spin_lock(&amp;current-&gt;arch.vgic.ap_list_lock)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 vgic_flush_lr_state(current);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 spin_unlock(&amp;current-&gt;arch.vgic.ap_list_loc=
k);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 gic_hw_ops-&gt;update_hcr_status(GICH_HCR_EN, 1);<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Local variables:<br>
&gt;=C2=A0 =C2=A0* mode: C<br>
&gt; diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h<br>
&gt; index 1547478518..e2b6d51e47 100644<br>
&gt; --- a/xen/arch/arm/vgic/vgic.h<br>
&gt; +++ b/xen/arch/arm/vgic/vgic.h<br>
&gt; @@ -27,6 +27,11 @@ static inline bool irq_is_pending(struct vgic_irq *=
irq)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return irq-&gt;pending_latch || irq-=
&gt;line_level;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static inline bool vgic_irq_is_mapped_level(struct vgic_irq *irq)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return irq-&gt;config =3D=3D VGIC_CONFIG_LEVEL &amp;&am=
p; irq-&gt;hw;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 struct vgic_irq *vgic_get_irq(struct domain *d, struct vcpu *vcp=
u,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t intid);<br>
&gt;=C2=A0 void vgic_put_irq(struct domain *d, struct vgic_irq *irq);<br>
&gt; @@ -41,6 +46,10 @@ static inline void vgic_get_irq_kref(struct vgic_ir=
q *irq)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 atomic_inc(&amp;irq-&gt;refcount);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +void vgic_v2_fold_lr_state(struct vcpu *vcpu);<br>
&gt; +void vgic_v2_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq, int=
 lr);<br>
&gt; +void vgic_v2_set_underflow(struct vcpu *vcpu);<br>
&gt; +<br>
&gt;=C2=A0 #endif<br>
&gt;<br>
&gt;=C2=A0 /*<br>
&gt; --<br>
&gt; 2.14.1<br>
&gt;<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div></div>

--000000000000c0e265056859cfac--


--===============2036764254998566215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2036764254998566215==--
