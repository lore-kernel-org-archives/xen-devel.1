From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 15/39] ARM: new VGIC: Implement
 vgic_vcpu_pending_irq
Date: Mon, 26 Mar 2018 16:34:21 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803261634140.12360@sstabellini-ThinkPad-X260>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-16-andre.przywara@linaro.org>
 <21172163-9617-235b-15c4-224b60be6c53@arm.com>
 <46b871c0-dfcc-0300-f838-e0c0fd820e10@linaro.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-608898209-1522107261=:12360"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=desu=gq=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f0bd9-0005Vi-Mg
 for xen-devel@lists.xenproject.org; Mon, 26 Mar 2018 23:34:23 +0000
In-Reply-To: <46b871c0-dfcc-0300-f838-e0c0fd820e10@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-608898209-1522107261=:12360
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 22 Mar 2018, Andre Przywara wrote:
> Hi,
> 
> On 22/03/18 03:52, Julien Grall wrote:
> > Hi Andre,
> > 
> > On 03/21/2018 04:32 PM, Andre Przywara wrote:
> >> Tell Xen whether a particular VCPU has an IRQ that needs handling
> >> in the guest. This is used to decide whether a VCPU is runnable or
> >> if a hypercall should be preempted to let the guest handle the IRQ.
> >>
> >> This is based on Linux commit 90eee56c5f90, written by Eric Auger.
> >>
> >> Signed-off-by: Andre Przywara <andre.przywara@linaro.org>
> >> ---
> >> Changelog v2 ... v3:
> >> - adjust vgic_vcpu_pending_irq() to return integers, not false/true
> > 
> > I would have preferred to have the return switch to bool instead. I
> > guess this can be done on a follow-up. With one comment below:
> 
> I did that originally, but then you meanwhile merged that first patch
> already. So I didn't want to add another patch to this series.
> I am fine with changing this afterwards, probably as part of a fixup series.
> 
> > Reviewed-by: Julien Grall <julien.grall@arm.com>
> 
> Thanks!

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> Cheers,
> Andre.
> 
> >>
> >> Changelog v1 ... v2:
> >> - adjust to new vgic_vcpu_pending_irq() prototype, drop wrapper
> >>
> >>   xen/arch/arm/vgic/vgic.c | 37 +++++++++++++++++++++++++++++++++++++
> >>   1 file changed, 37 insertions(+)
> >>
> >> diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
> >> index 2fa595f4f7..925cda4580 100644
> >> --- a/xen/arch/arm/vgic/vgic.c
> >> +++ b/xen/arch/arm/vgic/vgic.c
> >> @@ -647,6 +647,43 @@ void vgic_sync_to_lrs(void)
> >>       gic_hw_ops->update_hcr_status(GICH_HCR_EN, 1);
> >>   }
> >>   +/**
> >> + * vgic_vcpu_pending_irq() - determine if interrupts need to be injected
> >> + * @vcpu: The vCPU on which to check for interrupts.
> >> + *
> >> + * Checks whether there is an interrupt on the given VCPU which needs
> >> + * handling in the guest. This requires at least one IRQ to be pending
> >> + * and enabled.
> >> + *
> >> + * Returns: 1 if the guest should run to handle interrupts, 0 otherwise.
> > 
> > NIT: Because of "ret = irq_is_pending(irq) && irq->enabled", you will
> > return a non-zero value if the guest should run to handle interrupts.
> > 
> >> + */
> >> +int vgic_vcpu_pending_irq(struct vcpu *vcpu)
> >> +{
> >> +    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
> >> +    struct vgic_irq *irq;
> >> +    unsigned long flags;
> >> +    int ret = 0;
> >> +
> >> +    if ( !vcpu->domain->arch.vgic.enabled )
> >> +        return 0;
> >> +
> >> +    spin_lock_irqsave(&vgic_cpu->ap_list_lock, flags);
> >> +
> >> +    list_for_each_entry(irq, &vgic_cpu->ap_list_head, ap_list)
> >> +    {
> >> +        spin_lock(&irq->irq_lock);
> >> +        ret = irq_is_pending(irq) && irq->enabled;
> >> +        spin_unlock(&irq->irq_lock);
> >> +
> >> +        if ( ret )
> >> +            break;
> >> +    }
> >> +
> >> +    spin_unlock_irqrestore(&vgic_cpu->ap_list_lock, flags);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >>   /*
> >>    * Local variables:
> >>    * mode: C
> >>
> > 
> > Cheers,
> > 
> 
--8323329-608898209-1522107261=:12360
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-608898209-1522107261=:12360--
