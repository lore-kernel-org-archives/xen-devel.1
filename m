From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH 37/57] ARM: new VGIC: Add ENABLE registers
	handlers
Date: Wed, 07 Mar 2018 18:33:36 +0000
Message-ID: <CAF3u54CCSAvxSzbLkA8ARF0evLBA9db6-nPqY2BRYE6ab3g9Lg@mail.gmail.com>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
 <20180305160415.16760-38-andre.przywara@linaro.org>
 <3733c743-388b-ce02-aa35-caccbc0af058@arm.com>
 <8fad70c0-af95-1e5e-efdf-27e6446fcf77@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6442640534185411984=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rnhg=f5=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1etdsv-0005Qq-9E
 for xen-devel@lists.xenproject.org; Wed, 07 Mar 2018 18:33:53 +0000
Received: by mail-ot0-x22b.google.com with SMTP id r30so3009480otr.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Mar 2018 10:33:50 -0800 (PST)
In-Reply-To: <8fad70c0-af95-1e5e-efdf-27e6446fcf77@linaro.org>
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

--===============6442640534185411984==
Content-Type: multipart/alternative; boundary="001a11417fb2e0ab100566d6cc7d"

--001a11417fb2e0ab100566d6cc7d
Content-Type: text/plain; charset="UTF-8"

(sorry for the formatting)

On Wed, 7 Mar 2018, 18:23 Andre Przywara, <andre.przywara@linaro.org> wrote:

> Hi,
>
> On 07/03/18 17:01, Julien Grall wrote:
> > Hi Andre,
> >
> > On 03/05/2018 04:03 PM, Andre Przywara wrote:
> >> As the enable register handlers are shared between the v2 and v3
> >> emulation, their implementation goes into vgic-mmio.c, to be easily
> >> referenced from the v3 emulation as well later.
> >> This introduces a vgic_sync_hardware_irq() function, which updates the
> >> physical side of a hardware mapped virtual IRQ.
> >> Because the existing locking order between vgic_irq->irq_lock and
> >> irq_desc->lock dictates so, we dropu the irq_lock and retake them in the
> >> proper order.
> >>
> >> Signed-off-by: Andre Przywara <andre.przywara@linaro.org>
> >> ---
> >> Changelog RFC ... v1:
> >> - extend and move vgic_sync_hardware_irq()
> >> - do proper locking sequence
> >> - skip already disabled/enabled IRQs
> >>
> >>   xen/arch/arm/vgic/vgic-mmio-v2.c |   4 +-
> >>   xen/arch/arm/vgic/vgic-mmio.c    | 117
> >> +++++++++++++++++++++++++++++++++++++++
> >>   xen/arch/arm/vgic/vgic-mmio.h    |  11 ++++
> >>   xen/arch/arm/vgic/vgic.c         |  38 +++++++++++++
> >>   xen/arch/arm/vgic/vgic.h         |   3 +
> >>   5 files changed, 171 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c
> >> b/xen/arch/arm/vgic/vgic-mmio-v2.c
> >> index 2e015ed0b1..3dd983f885 100644
> >> --- a/xen/arch/arm/vgic/vgic-mmio-v2.c
> >> +++ b/xen/arch/arm/vgic/vgic-mmio-v2.c
> >> @@ -80,10 +80,10 @@ static const struct vgic_register_region
> >> vgic_v2_dist_registers[] = {
> >>           vgic_mmio_read_rao, vgic_mmio_write_wi, 1,
> >>           VGIC_ACCESS_32bit),
> >>       REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ISENABLER,
> >> -        vgic_mmio_read_raz, vgic_mmio_write_wi, 1,
> >> +        vgic_mmio_read_enable, vgic_mmio_write_senable, 1,
> >>           VGIC_ACCESS_32bit),
> >>       REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ICENABLER,
> >> -        vgic_mmio_read_raz, vgic_mmio_write_wi, 1,
> >> +        vgic_mmio_read_enable, vgic_mmio_write_cenable, 1,
> >>           VGIC_ACCESS_32bit),
> >>       REGISTER_DESC_WITH_BITS_PER_IRQ(GICD_ISPENDR,
> >>           vgic_mmio_read_raz, vgic_mmio_write_wi, 1,
> >> diff --git a/xen/arch/arm/vgic/vgic-mmio.c
> >> b/xen/arch/arm/vgic/vgic-mmio.c
> >> index 284a92d288..f8f0252eff 100644
> >> --- a/xen/arch/arm/vgic/vgic-mmio.c
> >> +++ b/xen/arch/arm/vgic/vgic-mmio.c
> >> @@ -39,6 +39,123 @@ void vgic_mmio_write_wi(struct vcpu *vcpu, paddr_t
> >> addr,
> >>       /* Ignore */
> >>   }
> >>   +/*
> >> + * Read accesses to both GICD_ICENABLER and GICD_ISENABLER return the
> >> value
> >> + * of the enabled bit, so there is only one function for both here.
> >> + */
> >> +unsigned long vgic_mmio_read_enable(struct vcpu *vcpu,
> >> +                                    paddr_t addr, unsigned int len)
> >> +{
> >> +    uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
> >> +    uint32_t value = 0;
> >> +    unsigned int i;
> >> +
> >> +    /* Loop over all IRQs affected by this read */
> >> +    for ( i = 0; i < len * 8; i++ )
> >> +    {
> >> +        struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid
> >> + i);
> >> +
> >> +        if ( irq->enabled )
> >> +            value |= (1U << i);
> >> +
> >> +        vgic_put_irq(vcpu->domain, irq);
> >> +    }
> >> +
> >> +    return value;
> >> +}
> >> +
> >> +void vgic_mmio_write_senable(struct vcpu *vcpu,
> >> +                             paddr_t addr, unsigned int len,
> >> +                             unsigned long val)
> >> +{
> >> +    uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
> >> +    unsigned int i;
> >> +
> >> +    for_each_set_bit( i, &val, len * 8 )
> >> +    {
> >> +        struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid
> >> + i);
> >> +        unsigned long flags;
> >> +        irq_desc_t *desc;
> >> +
> >> +        spin_lock_irqsave(&irq->irq_lock, flags);
> >> +
> >> +        if ( irq->enabled )            /* skip already enabled IRQs */
> >> +        {
> >> +            spin_unlock_irqrestore(&irq->irq_lock, flags);
> >> +            vgic_put_irq(vcpu->domain, irq);
> >> +            continue;
> >> +        }
> >> +
> >> +        irq->enabled = true;
> >> +        if ( irq->hw )
> >> +        {
> >> +            /*
> >> +             * The irq cannot be a PPI, we only support delivery
> >> +             * of SPIs to guests.
> >> +             */
> >> +            ASSERT(irq->hwintid >= VGIC_NR_PRIVATE_IRQS);
> >> +
> >> +            desc = irq_to_desc(irq->hwintid);
> >> +        }
> >> +        else
> >> +            desc = NULL;
> >
> > You could just initialize desc to NULL at the declaration time and drop
> > the else part.
>
> Can we rely on the initializer to be called on every loop iteration? I
> wasn't sure about this and what the standard has to say about this.
>

Every loop is a new scope. So everything declared within that scope is
initialized again. We do use that extensively in Xen.



> >> +
> >> +        vgic_queue_irq_unlock(vcpu->domain, irq, flags);
> >> +
> >> +        if ( desc )
> >> +            vgic_sync_hardware_irq(vcpu->domain, desc, irq);
> >
> > A comment explaining why desc is done outside the locking would be
> > useful. This would avoid to loose time using git blame.
> >
> >> +
> >> +        vgic_put_irq(vcpu->domain, irq);
> >> +    }
> >> +}
> >> +
> >> +void vgic_mmio_write_cenable(struct vcpu *vcpu,
> >> +                 paddr_t addr, unsigned int len,
> >> +                 unsigned long val)
> >> +{
> >> +    uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
> >> +    unsigned int i;
> >> +
> >> +    for_each_set_bit( i, &val, len * 8 )
> >> +    {
> >> +        struct vgic_irq *irq;
> >> +        unsigned long flags;
> >> +        irq_desc_t *desc;
> >> +
> >> +        irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
> >> +        spin_lock_irqsave(&irq->irq_lock, flags);
> >> +
> >> +        if ( !irq->enabled )            /* skip already disabled IRQs
> */
> >> +        {
> >> +            spin_unlock_irqrestore(&irq->irq_lock, flags);
> >> +            vgic_put_irq(vcpu->domain, irq);
> >> +            continue;
> >> +        }
> >> +
> >> +        irq->enabled = false;
> >> +
> >> +        if ( irq->hw )
> >> +        {
> >> +            /*
> >> +             * The irq cannot be a PPI, we only support delivery
> >> +             * of SPIs to guests.
> >> +             */
> >> +            ASSERT(irq->hwintid >= VGIC_NR_PRIVATE_IRQS);
> >> +
> >> +            desc = irq_to_desc(irq->hwintid);
> >> +        }
> >> +        else
> >> +            desc = NULL;
> >> +
> >> +        spin_unlock_irqrestore(&irq->irq_lock, flags);
> >> +
> >> +        if ( desc )
> >> +            vgic_sync_hardware_irq(vcpu->domain, desc, irq);
> >
> > Ditto.
> >
> >> +
> >> +        vgic_put_irq(vcpu->domain, irq);
> >> +    }
> >> +}
> >> +
> >>   static int match_region(const void *key, const void *elt)
> >>   {
> >>       const unsigned int offset = (unsigned long)key;
> >> diff --git a/xen/arch/arm/vgic/vgic-mmio.h
> >> b/xen/arch/arm/vgic/vgic-mmio.h
> >> index 621b9a281c..2ddcbbf58d 100644
> >> --- a/xen/arch/arm/vgic/vgic-mmio.h
> >> +++ b/xen/arch/arm/vgic/vgic-mmio.h
> >> @@ -96,6 +96,17 @@ unsigned long vgic_mmio_read_rao(struct vcpu *vcpu,
> >>   void vgic_mmio_write_wi(struct vcpu *vcpu, paddr_t addr,
> >>                           unsigned int len, unsigned long val);
> >>   +unsigned long vgic_mmio_read_enable(struct vcpu *vcpu,
> >> +                                    paddr_t addr, unsigned int len);
> >> +
> >> +void vgic_mmio_write_senable(struct vcpu *vcpu,
> >> +                             paddr_t addr, unsigned int len,
> >> +                             unsigned long val);
> >> +
> >> +void vgic_mmio_write_cenable(struct vcpu *vcpu,
> >> +                             paddr_t addr, unsigned int len,
> >> +                             unsigned long val);
> >> +
> >>   unsigned int vgic_v2_init_dist_iodev(struct vgic_io_device *dev);
> >>     #endif
> >> diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
> >> index 465a95f415..5246d7c2e7 100644
> >> --- a/xen/arch/arm/vgic/vgic.c
> >> +++ b/xen/arch/arm/vgic/vgic.c
> >> @@ -698,6 +698,44 @@ void vgic_kick_vcpus(struct domain *d)
> >>       }
> >>   }
> >>   +static unsigned int translate_irq_type(bool is_level)
> >> +{
> >> +    return is_level ? IRQ_TYPE_LEVEL_HIGH : IRQ_TYPE_EDGE_RISING;
> >> +}
> >> +
> >> +void vgic_sync_hardware_irq(struct domain *d,
> >> +                            irq_desc_t *desc, struct vgic_irq *irq)
> >> +{
> >> +    unsigned long flags;
> >> +
> >> +    spin_lock_irqsave(&desc->lock, flags);
> >> +    spin_lock(&irq->irq_lock);
> >> +
> >> +    /* Is that association actually still valid? (we entered with no
> >> locks) */
> >
> > If the association is not valid, then you need to fetch the new desc.
> > Right?
>
> I am not so sure it's that easy. If the association changed, then the
> whole reason of this call might have become invalid. So I rather bail
> out here and do nothing. The check is just to prevent doing the wrong
> thing, not necessarily to always do the right thing.
> To be honest this whole "lock drop dance" is just to cope with the
> locking order, which I consider wrong, according to my gut feeling.
>

If you don't do the dance here, you would have to do in other place. I
still think taking the desc->lock first is the right thing to do as Xen
deal with physical first then it might be a virtual (so second) or handled
by a driver.



> This function here is called from several places, so it seems a bit
> fragile to assume a way how to fix a broken association here. I can go
> back and check every existing caller in this respect, but to be honest
> I'd rather change the locking order, so we don't need to worry about
> this. But I feel like we should do this as a fixup on top later.
>

See some thought in the next patch. We might be able to simplify the whole
logic by forbidding the interrupt to be removed.



> Cheers,
> Andre.
>
>
> >
> >> +    if ( desc->irq == irq->hwintid )
> >> +    {
> >> +        if ( irq->enabled )
> >> +        {
> >> +            /*
> >> +             * We might end up from various callers, so check that the
> >> +             * interrrupt is disabled before trying to change the
> >> config.
> >> +             */
> >> +            if ( irq_type_set_by_domain(d) &&
> >> +                 test_bit(_IRQ_DISABLED, &desc->status) )
> >> +                gic_set_irq_type(desc,
> translate_irq_type(irq->config));
> >> +
> >> +            if ( irq->target_vcpu )
> >> +                irq_set_affinity(desc,
> >> cpumask_of(irq->target_vcpu->processor));
> >> +            desc->handler->enable(desc);
> >> +        }
> >> +        else
> >> +            desc->handler->disable(desc);
> >> +    }
> >> +
> >> +    spin_unlock(&irq->irq_lock);
> >> +    spin_unlock_irqrestore(&desc->lock, flags);
> >> +}
> >> +
> >>   /*
> >>    * Local variables:
> >>    * mode: C
> >> diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h
> >> index 588bd067b7..68e205d10a 100644
> >> --- a/xen/arch/arm/vgic/vgic.h
> >> +++ b/xen/arch/arm/vgic/vgic.h
> >> @@ -50,6 +50,9 @@ static inline void vgic_get_irq_kref(struct vgic_irq
> >> *irq)
> >>       atomic_inc(&irq->refcount);
> >>   }
> >>   +void vgic_sync_hardware_irq(struct domain *d,
> >> +                            irq_desc_t *desc, struct vgic_irq *irq);
> >> +
> >>   void vgic_v2_fold_lr_state(struct vcpu *vcpu);
> >>   void vgic_v2_populate_lr(struct vcpu *vcpu, struct vgic_irq *irq,
> >> int lr);
> >>   void vgic_v2_set_underflow(struct vcpu *vcpu);
> >>
> >
> > Cheers,
> >
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--001a11417fb2e0ab100566d6cc7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span>(sorry for the formatting)</span><br><br><div class=3D"gmail_quote"><=
div dir=3D"ltr">On Wed, 7 Mar 2018, 18:23 Andre Przywara, &lt;<a href=3D"ma=
ilto:andre.przywara@linaro.org">andre.przywara@linaro.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
On 07/03/18 17:01, Julien Grall wrote:<br>
&gt; Hi Andre,<br>
&gt;<br>
&gt; On 03/05/2018 04:03 PM, Andre Przywara wrote:<br>
&gt;&gt; As the enable register handlers are shared between the v2 and v3<b=
r>
&gt;&gt; emulation, their implementation goes into vgic-mmio.c, to be easil=
y<br>
&gt;&gt; referenced from the v3 emulation as well later.<br>
&gt;&gt; This introduces a vgic_sync_hardware_irq() function, which updates=
 the<br>
&gt;&gt; physical side of a hardware mapped virtual IRQ.<br>
&gt;&gt; Because the existing locking order between vgic_irq-&gt;irq_lock a=
nd<br>
&gt;&gt; irq_desc-&gt;lock dictates so, we dropu the irq_lock and retake th=
em in the<br>
&gt;&gt; proper order.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Andre Przywara &lt;<a href=3D"mailto:andre.przywara=
@linaro.org" target=3D"_blank">andre.przywara@linaro.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; Changelog RFC ... v1:<br>
&gt;&gt; - extend and move vgic_sync_hardware_irq()<br>
&gt;&gt; - do proper locking sequence<br>
&gt;&gt; - skip already disabled/enabled IRQs<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 xen/arch/arm/vgic/vgic-mmio-v2.c |=C2=A0=C2=A0 4 +-<br>
&gt;&gt; =C2=A0 xen/arch/arm/vgic/vgic-mmio.c=C2=A0=C2=A0=C2=A0 | 117<br>
&gt;&gt; +++++++++++++++++++++++++++++++++++++++<br>
&gt;&gt; =C2=A0 xen/arch/arm/vgic/vgic-mmio.h=C2=A0=C2=A0=C2=A0 |=C2=A0 11 =
++++<br>
&gt;&gt; =C2=A0 xen/arch/arm/vgic/vgic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 38 +++++++++++++<br>
&gt;&gt; =C2=A0 xen/arch/arm/vgic/vgic.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +<br>
&gt;&gt; =C2=A0 5 files changed, 171 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c<br>
&gt;&gt; b/xen/arch/arm/vgic/vgic-mmio-v2.c<br>
&gt;&gt; index 2e015ed0b1..3dd983f885 100644<br>
&gt;&gt; --- a/xen/arch/arm/vgic/vgic-mmio-v2.c<br>
&gt;&gt; +++ b/xen/arch/arm/vgic/vgic-mmio-v2.c<br>
&gt;&gt; @@ -80,10 +80,10 @@ static const struct vgic_register_region<br>
&gt;&gt; vgic_v2_dist_registers[] =3D {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vgic_mmio_r=
ead_rao, vgic_mmio_write_wi, 1,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VGIC_ACCESS=
_32bit),<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REGISTER_DESC_WITH_BITS_PER_IRQ(GIC=
D_ISENABLER,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vgic_mmio_read_raz, vg=
ic_mmio_write_wi, 1,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vgic_mmio_read_enable,=
 vgic_mmio_write_senable, 1,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VGIC_ACCESS=
_32bit),<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REGISTER_DESC_WITH_BITS_PER_IRQ(GIC=
D_ICENABLER,<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vgic_mmio_read_raz, vg=
ic_mmio_write_wi, 1,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vgic_mmio_read_enable,=
 vgic_mmio_write_cenable, 1,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VGIC_ACCESS=
_32bit),<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 REGISTER_DESC_WITH_BITS_PER_IRQ(GIC=
D_ISPENDR,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vgic_mmio_r=
ead_raz, vgic_mmio_write_wi, 1,<br>
&gt;&gt; diff --git a/xen/arch/arm/vgic/vgic-mmio.c<br>
&gt;&gt; b/xen/arch/arm/vgic/vgic-mmio.c<br>
&gt;&gt; index 284a92d288..f8f0252eff 100644<br>
&gt;&gt; --- a/xen/arch/arm/vgic/vgic-mmio.c<br>
&gt;&gt; +++ b/xen/arch/arm/vgic/vgic-mmio.c<br>
&gt;&gt; @@ -39,6 +39,123 @@ void vgic_mmio_write_wi(struct vcpu *vcpu, pad=
dr_t<br>
&gt;&gt; addr,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Ignore */<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; =C2=A0 +/*<br>
&gt;&gt; + * Read accesses to both GICD_ICENABLER and GICD_ISENABLER return=
 the<br>
&gt;&gt; value<br>
&gt;&gt; + * of the enabled bit, so there is only one function for both her=
e.<br>
&gt;&gt; + */<br>
&gt;&gt; +unsigned long vgic_mmio_read_enable(struct vcpu *vcpu,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pa=
ddr_t addr, unsigned int len)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t intid =3D VGIC_ADDR_TO_INTID(addr, 1)=
;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t value =3D 0;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 unsigned int i;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 /* Loop over all IRQs affected by this read */=
<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 for ( i =3D 0; i &lt; len * 8; i++ )<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vgic_irq *irq =
=3D vgic_get_irq(vcpu-&gt;domain, vcpu, intid<br>
&gt;&gt; + i);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( irq-&gt;enabled )=
<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 value |=3D (1U &lt;&lt; i);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vgic_put_irq(vcpu-&gt;=
domain, irq);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 return value;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +void vgic_mmio_write_senable(struct vcpu *vcpu,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t addr, unsigned int len,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long val)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t intid =3D VGIC_ADDR_TO_INTID(addr, 1)=
;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 unsigned int i;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 for_each_set_bit( i, &amp;val, len * 8 )<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vgic_irq *irq =
=3D vgic_get_irq(vcpu-&gt;domain, vcpu, intid<br>
&gt;&gt; + i);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long flags;<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq_desc_t *desc;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&amp=
;irq-&gt;irq_lock, flags);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( irq-&gt;enabled )=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* skip =
already enabled IRQs */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 spin_unlock_irqrestore(&amp;irq-&gt;irq_lock, flags);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 vgic_put_irq(vcpu-&gt;domain, irq);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 continue;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq-&gt;enabled =3D tr=
ue;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( irq-&gt;hw )<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /*<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * The irq cannot be a PPI, we only support delivery<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * of SPIs to guests.<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ASSERT(irq-&gt;hwintid &gt;=3D VGIC_NR_PRIVATE_IRQS);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 desc =3D irq_to_desc(irq-&gt;hwintid);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 desc =3D NULL;<br>
&gt;<br>
&gt; You could just initialize desc to NULL at the declaration time and dro=
p<br>
&gt; the else part.<br>
<br>
Can we rely on the initializer to be called on every loop iteration? I<br>
wasn&#39;t sure about this and what the standard has to say about this.<br>=
</blockquote></div><div><br></div><div>Every loop is a new scope. So everyt=
hing declared within that scope is initialized again. We do use that extens=
ively in Xen.</div><div><br></div><div><br></div><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vgic_queue_irq_unlock(=
vcpu-&gt;domain, irq, flags);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( desc )<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 vgic_sync_hardware_irq(vcpu-&gt;domain, desc, irq);<br>
&gt;<br>
&gt; A comment explaining why desc is done outside the locking would be<br>
&gt; useful. This would avoid to loose time using git blame.<br>
&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vgic_put_irq(vcpu-&gt;=
domain, irq);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +void vgic_mmio_write_cenable(struct vcpu *vcpu,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t addr, unsigned int len,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long val)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 uint32_t intid =3D VGIC_ADDR_TO_INTID(addr, 1)=
;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 unsigned int i;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 for_each_set_bit( i, &amp;val, len * 8 )<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vgic_irq *irq;<=
br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long flags;<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq_desc_t *desc;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq =3D vgic_get_irq(v=
cpu-&gt;domain, vcpu, intid + i);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&amp=
;irq-&gt;irq_lock, flags);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !irq-&gt;enabled =
)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* skip=
 already disabled IRQs */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 spin_unlock_irqrestore(&amp;irq-&gt;irq_lock, flags);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 vgic_put_irq(vcpu-&gt;domain, irq);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 continue;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq-&gt;enabled =3D fa=
lse;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( irq-&gt;hw )<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /*<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * The irq cannot be a PPI, we only support delivery<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * of SPIs to guests.<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ASSERT(irq-&gt;hwintid &gt;=3D VGIC_NR_PRIVATE_IRQS);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 desc =3D irq_to_desc(irq-&gt;hwintid);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 desc =3D NULL;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore=
(&amp;irq-&gt;irq_lock, flags);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( desc )<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 vgic_sync_hardware_irq(vcpu-&gt;domain, desc, irq);<br>
&gt;<br>
&gt; Ditto.<br>
&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vgic_put_irq(vcpu-&gt;=
domain, irq);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; =C2=A0 static int match_region(const void *key, const void *elt)<b=
r>
&gt;&gt; =C2=A0 {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const unsigned int offset =3D (unsi=
gned long)key;<br>
&gt;&gt; diff --git a/xen/arch/arm/vgic/vgic-mmio.h<br>
&gt;&gt; b/xen/arch/arm/vgic/vgic-mmio.h<br>
&gt;&gt; index 621b9a281c..2ddcbbf58d 100644<br>
&gt;&gt; --- a/xen/arch/arm/vgic/vgic-mmio.h<br>
&gt;&gt; +++ b/xen/arch/arm/vgic/vgic-mmio.h<br>
&gt;&gt; @@ -96,6 +96,17 @@ unsigned long vgic_mmio_read_rao(struct vcpu *v=
cpu,<br>
&gt;&gt; =C2=A0 void vgic_mmio_write_wi(struct vcpu *vcpu, paddr_t addr,<br=
>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 unsigned int len, unsigned long val);<br>
&gt;&gt; =C2=A0 +unsigned long vgic_mmio_read_enable(struct vcpu *vcpu,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pa=
ddr_t addr, unsigned int len);<br>
&gt;&gt; +<br>
&gt;&gt; +void vgic_mmio_write_senable(struct vcpu *vcpu,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t addr, unsigned int len,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long val);<br>
&gt;&gt; +<br>
&gt;&gt; +void vgic_mmio_write_cenable(struct vcpu *vcpu,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 paddr_t addr, unsigned int len,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long val);<br>
&gt;&gt; +<br>
&gt;&gt; =C2=A0 unsigned int vgic_v2_init_dist_iodev(struct vgic_io_device =
*dev);<br>
&gt;&gt; =C2=A0 =C2=A0 #endif<br>
&gt;&gt; diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c<b=
r>
&gt;&gt; index 465a95f415..5246d7c2e7 100644<br>
&gt;&gt; --- a/xen/arch/arm/vgic/vgic.c<br>
&gt;&gt; +++ b/xen/arch/arm/vgic/vgic.c<br>
&gt;&gt; @@ -698,6 +698,44 @@ void vgic_kick_vcpus(struct domain *d)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; =C2=A0 +static unsigned int translate_irq_type(bool is_level)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 return is_level ? IRQ_TYPE_LEVEL_HIGH : IRQ_TY=
PE_EDGE_RISING;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +void vgic_sync_hardware_irq(struct domain *d,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 irq_desc_t *desc, struct vgic_irq *irq)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 unsigned long flags;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 spin_lock_irqsave(&amp;desc-&gt;lock, flags);<=
br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 spin_lock(&amp;irq-&gt;irq_lock);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 /* Is that association actually still valid? (=
we entered with no<br>
&gt;&gt; locks) */<br>
&gt;<br>
&gt; If the association is not valid, then you need to fetch the new desc.<=
br>
&gt; Right?<br>
<br>
I am not so sure it&#39;s that easy. If the association changed, then the<b=
r>
whole reason of this call might have become invalid. So I rather bail<br>
out here and do nothing. The check is just to prevent doing the wrong<br>
thing, not necessarily to always do the right thing.<br>
To be honest this whole &quot;lock drop dance&quot; is just to cope with th=
e<br>
locking order, which I consider wrong, according to my gut feeling.<br></bl=
ockquote></div><div><br></div><div>If you don&#39;t do the dance here, you =
would have to do in other place. I still think taking the desc-&gt;lock fir=
st is the right thing to do as Xen deal with physical first then it might b=
e a virtual (so second) or handled by a driver.</div><div><br></div><div><b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
This function here is called from several places, so it seems a bit<br>
fragile to assume a way how to fix a broken association here. I can go<br>
back and check every existing caller in this respect, but to be honest<br>
I&#39;d rather change the locking order, so we don&#39;t need to worry abou=
t<br>
this. But I feel like we should do this as a fixup on top later.<br></block=
quote></div><div><br></div><div>See some thought in the next patch. We migh=
t be able to simplify the whole logic by forbidding the interrupt to be rem=
oved.</div><div><br></div><div><br></div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<br>
Cheers,<br>
Andre.<br>
<br>
<br>
&gt;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if ( desc-&gt;irq =3D=3D irq-&gt;hwintid )<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( irq-&gt;enabled )=
<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /*<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * We might end up from various callers, so check that the<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 * interrrupt is disabled before trying to change the<br>
&gt;&gt; config.<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 */<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if ( irq_type_set_by_domain(d) &amp;&amp;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_bit(_IRQ_DISABLED, &amp;desc-&gt;sta=
tus) )<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 gic_set_irq_type(desc, translate_irq_type(irq-&=
gt;config));<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if ( irq-&gt;target_vcpu )<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 irq_set_affinity(desc,<br>
&gt;&gt; cpumask_of(irq-&gt;target_vcpu-&gt;processor));<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 desc-&gt;handler-&gt;enable(desc);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 desc-&gt;handler-&gt;disable(desc);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 spin_unlock(&amp;irq-&gt;irq_lock);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 spin_unlock_irqrestore(&amp;desc-&gt;lock, fla=
gs);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; =C2=A0 /*<br>
&gt;&gt; =C2=A0=C2=A0 * Local variables:<br>
&gt;&gt; =C2=A0=C2=A0 * mode: C<br>
&gt;&gt; diff --git a/xen/arch/arm/vgic/vgic.h b/xen/arch/arm/vgic/vgic.h<b=
r>
&gt;&gt; index 588bd067b7..68e205d10a 100644<br>
&gt;&gt; --- a/xen/arch/arm/vgic/vgic.h<br>
&gt;&gt; +++ b/xen/arch/arm/vgic/vgic.h<br>
&gt;&gt; @@ -50,6 +50,9 @@ static inline void vgic_get_irq_kref(struct vgic=
_irq<br>
&gt;&gt; *irq)<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic_inc(&amp;irq-&gt;refcount);<=
br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; =C2=A0 +void vgic_sync_hardware_irq(struct domain *d,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 irq_desc_t *desc, struct vgic_irq *irq);<br>
&gt;&gt; +<br>
&gt;&gt; =C2=A0 void vgic_v2_fold_lr_state(struct vcpu *vcpu);<br>
&gt;&gt; =C2=A0 void vgic_v2_populate_lr(struct vcpu *vcpu, struct vgic_irq=
 *irq,<br>
&gt;&gt; int lr);<br>
&gt;&gt; =C2=A0 void vgic_v2_set_underflow(struct vcpu *vcpu);<br>
&gt;&gt;<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div>

--001a11417fb2e0ab100566d6cc7d--


--===============6442640534185411984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6442640534185411984==--
