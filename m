From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3a 14/39] ARM: new VGIC: Add GICv2 world
 switch backend
Date: Mon, 26 Mar 2018 17:23:39 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803261721590.12360@sstabellini-ThinkPad-X260>
References: <20180322115649.5283-1-andre.przywara@linaro.org>
 <20180322115649.5283-3-andre.przywara@linaro.org>
 <alpine.DEB.2.10.1803261554540.12360@sstabellini-ThinkPad-X260>
 <CAF3u54DYQm5acQ7ZB62kcBivYQ-ig8pC8gw00m6GFg2yVeHABQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1592060599-1522110220=:12360"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=u3an=gr=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f0cOs-0001Lg-GO
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 00:23:42 +0000
In-Reply-To: <CAF3u54DYQm5acQ7ZB62kcBivYQ-ig8pC8gw00m6GFg2yVeHABQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@linaro.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1592060599-1522110220=:12360
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 27 Mar 2018, Julien Grall wrote:
> Hi,
> Sorry for the formatting.
> 
> On Tue, 27 Mar 2018, 07:25 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       On Thu, 22 Mar 2018, Andre Przywara wrote:
>       > Processing maintenance interrupts and accessing the list registers
>       > are dependent on the host's GIC version.
>       > Introduce vgic-v2.c to contain GICv2 specific functions.
>       > Implement the GICv2 specific code for syncing the emulation state
>       > into the VGIC registers.
>       > This also adds the hook to let Xen setup the host GIC addresses.
>       >
>       > This is based on Linux commit 140b086dd197, written by Marc Zyngier.
>       >
>       > Signed-off-by: Andre Przywara <andre.przywara@linaro.org>
>       > ---
>       > Changelog v3 ... v3a:
>       > - take hardware IRQ lock in vgic_v2_fold_lr_state()
>       > - fix last remaining u32 usage
>       > - print message when using new VGIC
>       > - add TODO about racy _IRQ_INPROGRESS setting
>       >
>       > Changelog v2 ... v3:
>       > - remove no longer needed asm/io.h header
>       > - replace 0/1 with false/true for bool's
>       > - clear _IRQ_INPROGRESS bit when retiring hardware mapped IRQ
>       > - fix indentation and w/s issues
>       >
>       > Changelog v1 ... v2:
>       > - remove v2 specific underflow function (now generic)
>       > - re-add Linux code to properly handle acked level IRQs
>       >
>       >  xen/arch/arm/vgic/vgic-v2.c | 259 ++++++++++++++++++++++++++++++++++++++++++++
>       >  xen/arch/arm/vgic/vgic.c    |   6 +
>       >  xen/arch/arm/vgic/vgic.h    |   9 ++
>       >  3 files changed, 274 insertions(+)
>       >  create mode 100644 xen/arch/arm/vgic/vgic-v2.c
>       >
>       > diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
>       > new file mode 100644
>       > index 0000000000..1773503cfb
>       > --- /dev/null
>       > +++ b/xen/arch/arm/vgic/vgic-v2.c
>       > @@ -0,0 +1,259 @@
>       > +/*
>       > + * Copyright (C) 2015, 2016 ARM Ltd.
>       > + * Imported from Linux ("new" KVM VGIC) and heavily adapted to Xen.
>       > + *
>       > + * This program is free software; you can redistribute it and/or modify
>       > + * it under the terms of the GNU General Public License version 2 as
>       > + * published by the Free Software Foundation.
>       > + *
>       > + * This program is distributed in the hope that it will be useful,
>       > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>       > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>       > + * GNU General Public License for more details.
>       > + *
>       > + * You should have received a copy of the GNU General Public License
>       > + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>       > + */
>       > +
>       > +#include <asm/new_vgic.h>
>       > +#include <asm/bug.h>
>       > +#include <asm/gic.h>
>       > +#include <xen/sched.h>
>       > +#include <xen/sizes.h>
>       > +
>       > +#include "vgic.h"
>       > +
>       > +static struct {
>       > +    bool enabled;
>       > +    paddr_t dbase;          /* Distributor interface address */
>       > +    paddr_t cbase;          /* CPU interface address & size */
>       > +    paddr_t csize;
>       > +    paddr_t vbase;          /* Virtual CPU interface address */
>       > +
>       > +    /* Offset to add to get an 8kB contiguous region if GIC is aliased */
>       > +    uint32_t aliased_offset;
>       > +} gic_v2_hw_data;
>       > +
>       > +void vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,
>       > +                      paddr_t vbase, uint32_t aliased_offset)
>       > +{
>       > +    gic_v2_hw_data.enabled = true;
>       > +    gic_v2_hw_data.dbase = dbase;
>       > +    gic_v2_hw_data.cbase = cbase;
>       > +    gic_v2_hw_data.csize = csize;
>       > +    gic_v2_hw_data.vbase = vbase;
>       > +    gic_v2_hw_data.aliased_offset = aliased_offset;
>       > +
>       > +    printk("Using the new VGIC implementation.\n");
>       > +}
>       > +
>       > +/*
>       > + * transfer the content of the LRs back into the corresponding ap_list:
>       > + * - active bit is transferred as is
>       > + * - pending bit is
>       > + *   - transferred as is in case of edge sensitive IRQs
>       > + *   - set to the line-level (resample time) for level sensitive IRQs
>       > + */
>       > +void vgic_v2_fold_lr_state(struct vcpu *vcpu)
>       > +{
>       > +    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
>       > +    unsigned int used_lrs = vcpu->arch.vgic.used_lrs;
>       > +    unsigned long flags;
>       > +    unsigned int lr;
>       > +
>       > +    if ( !used_lrs )    /* No LRs used, so nothing to sync back here. */
>       > +        return;
>       > +
>       > +    gic_hw_ops->update_hcr_status(GICH_HCR_UIE, false);
>       > +
>       > +    for ( lr = 0; lr < used_lrs; lr++ )
>       > +    {
>       > +        struct gic_lr lr_val;
>       > +        uint32_t intid;
>       > +        struct vgic_irq *irq;
>       > +        struct irq_desc *desc = NULL;
>       > +        bool have_desc_lock = false;
>       > +
>       > +        gic_hw_ops->read_lr(lr, &lr_val);
>       > +
>       > +        /*
>       > +         * TODO: Possible optimization to avoid reading LRs:
>       > +         * Read the ELRSR to find out which of our LRs have been cleared
>       > +         * by the guest. We just need to know the IRQ number for those, which
>       > +         * we could save in an array when populating the LRs.
>       > +         * This trades one MMIO access (ELRSR) for possibly more than one (LRs),
>       > +         * but requires some more code to save the IRQ number and to handle
>       > +         * those finished IRQs according to the algorithm below.
>       > +         * We need some numbers to justify this: chances are that we don't
>       > +         * have many LRs in use most of the time, so we might not save much.
>       > +         */
>       > +        gic_hw_ops->clear_lr(lr);
>       > +
>       > +        intid = lr_val.virq;
>       > +        irq = vgic_get_irq(vcpu->domain, vcpu, intid);
>       > +
>       > +        local_irq_save(flags);
> 
>       Shouldn't we disable interrupts earlier, maybe at the beginning of the
>       function? Is it not a problem if we take an interrupt a couple of lines
>       above with the read_lr and clear_lr that we do?
> 
> 
>       > +        spin_lock(&irq->irq_lock);
>       > +
>       > +        /* The locking order forces us to drop and re-take the locks here. */
>       > +        if ( irq->hw )
>       > +        {
>       > +            spin_unlock(&irq->irq_lock);
>       > +
>       > +            desc = irq_to_desc(irq->hwintid);
>       > +            spin_lock(&desc->lock);
>       > +            spin_lock(&irq->irq_lock);
>       > +
>       > +            /* This h/w IRQ should still be assigned to the virtual IRQ. */
>       > +            ASSERT(irq->hw && desc->irq == irq->hwintid);
>       > +
>       > +            have_desc_lock = true;
>       > +        }
> 
>       I agree with Julien that this looks very fragile. Instead, I think it
>       would be best to always take the desc lock (if irq->hw) before the
>       irq_lock earlier in this function. That way, we don't have to deal with
>       this business of unlocking and relocking. Do you see any problems with
>       it? We don't change irq->hw at run time, so it looks OK to me.
> 
> 
>       > +        /*
>       > +         * If a hardware mapped IRQ has been handled for good, we need to
>       > +         * clear the _IRQ_INPROGRESS bit to allow handling of new IRQs.
>       > +         *
>       > +         * TODO: This is probably racy, but is so already in the existing
>       > +         * VGIC. A fix does not seem to be trivial.
>       > +         */
>       > +        if ( irq->hw && !lr_val.active && !lr_val.pending )
>       > +            clear_bit(_IRQ_INPROGRESS, &desc->status);
> 
>       I'll reply here to Julien's comment:
> 
>       > I realize the current vGIC is doing exactly the same thing. But this is racy.
>       >
>       > Imagine the interrupt is firing on another pCPU (I wasn't able to rule out this even when the interrupt is following the vCPU), that pCPU may set _IRQ_INPROGRESS
>       before this
>       > is cleared here.
> 
>       The assumption in the old vgic was that this scenario was not possible.
>       vgic_migrate_irq would avoid changing physical interrupt affinity if a
>       virtual interrupt was currently in an LR (see xen/arch/arm/vgic.c:L298).
>       Instead, it would set the irq as GIC_IRQ_GUEST_MIGRATING, then at the
>       time of clearing the LR we would change the physical irq affinity (see
>       xen/arch/arm/gic-vgic.c:L240).
> 
> 
>       I think we would need a similar mechanism here to protect ourselves from
>       races. Is there something equivalent in the new vgic?
> 
> 
> A mechanism that we know is already very racy on the old vGIC. You also have to take into account that write to ITARGETR/IROUTER will take effect in finite time. A interrupt
> may still get pending on the old pCPU. 
> 
> To be honest we should migrate the interrupt on gues MMIO and finding a way to handle the desc->state correctly.
> 
> One of the solution is to avoid relying in the desc->state when releasing IRQ. So we would not need to care a potential.

I think I might have a simple suggestion to fix this, a suggestion that
doesn't require anything like the mechanism we had in the old vgic. I
hope I didn't miss anything :-)
--8323329-1592060599-1522110220=:12360
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1592060599-1522110220=:12360--
