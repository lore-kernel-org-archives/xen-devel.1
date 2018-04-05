From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 07/17] arm64: vgic-v3: Add ICV_EOIR1_EL1
 handler
Date: Thu, 5 Apr 2018 12:53:27 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1804051252040.6016@sstabellini-ThinkPad-X260>
References: <cover.1522135597.git.manish.jaggi@cavium.com>
 <e7402c406f8c894ee469cd8f7f08c16c4c2e90ad.1522135597.git.manish.jaggi@cavium.com>
 <05029e6f-6812-d02e-aa41-e5ff4f0c0cad@arm.com>
 <19b0fb42-711b-aada-0eef-133c593824b1@caviumnetworks.com>
 <5694b771-3e26-8ec2-fb4d-322beb749a2f@caviumnetworks.com>
 <fed8beaa-b00f-445c-d43b-1055f8a65b91@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1487743141-1522958008=:6016"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lmv8=g2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f4Aws-0001uo-9n
 for xen-devel@lists.xenproject.org; Thu, 05 Apr 2018 19:53:30 +0000
In-Reply-To: <fed8beaa-b00f-445c-d43b-1055f8a65b91@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: sstabellini@kernel.org, Manish Jaggi <mjaggi@caviumnetworks.com>, Marc Zyngier <marc.zyngier@arm.com>, andre.przywara@arm.com, Manish Jaggi <manish.jaggi@cavium.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1487743141-1522958008=:6016
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 5 Apr 2018, Julien Grall wrote:
> On 02/04/18 12:17, Manish Jaggi wrote:
> > 
> > 
> > On 04/02/2018 04:33 PM, Manish Jaggi wrote:
> > > 
> > > On 03/27/2018 03:48 PM, Marc Zyngier wrote:
> > > > On 27/03/18 10:07, Manish Jaggi wrote:
> > > > > This patch is ported to xen from linux commit
> > > > > b6f49035b4bf6e2709f2a5fed3107f5438c1fd02
> > > > > KVM: arm64: vgic-v3: Add ICV_EOIR1_EL1 handler
> > > > > 
> > > > > Add a handler for writing the guest's view of the ICC_EOIR1_EL1
> > > > > register. This involves dropping the priority of the interrupt,
> > > > > and deactivating it if required (EOImode == 0).
> > > > > 
> > > > > Signed-off-by : Manish Jaggi <manish.jaggi@cavium.com>
> > > > > ---
> > > > >   xen/arch/arm/arm64/vgic-v3-sr.c     | 136
> > > > > ++++++++++++++++++++++++++++++++++++
> > > > >   xen/include/asm-arm/arm64/sysregs.h |   1 +
> > > > >   xen/include/asm-arm/gic_v3_defs.h   |   4 ++
> > > > >   3 files changed, 141 insertions(+)
> > > > > 
> > > > > diff --git a/xen/arch/arm/arm64/vgic-v3-sr.c
> > > > > b/xen/arch/arm/arm64/vgic-v3-sr.c
> > > > > index 026d64506f..e32ec01f56 100644
> > > > > --- a/xen/arch/arm/arm64/vgic-v3-sr.c
> > > > > +++ b/xen/arch/arm/arm64/vgic-v3-sr.c
> > > > > @@ -33,6 +33,7 @@
> > > > >     #define ICC_IAR1_EL1_SPURIOUS    0x3ff
> > > > >   #define VGIC_MAX_SPI             1019
> > > > > +#define VGIC_MIN_LPI             8192
> > > > >     static int vgic_v3_bpr_min(void)
> > > > >   {
> > > > > @@ -482,6 +483,137 @@ static void vreg_emulate_iar(struct
> > > > > cpu_user_regs *regs, const union hsr hsr)
> > > > >       vgic_v3_read_iar(regs, hsr);
> > > > >   }
> > > > >   +static int vgic_v3_find_active_lr(int intid, uint64_t *lr_val)
> > > > > +{
> > > > > +    int i;
> > > > > +    unsigned int used_lrs =  gic_get_num_lrs();
> > > > This is quite a departure from the existing code. KVM always allocate
> > > > LRs sequentially, and used_lrs represents the current upper bound.
> > > IIUC, Xen uses a function gic_find_unused_lr to find an unused LR.
> > > 
> > > xen/arch/arm/gic.c:
> > > gic_raise_guest_irq
> > >     gic_find_unused_lr
> > > > Here,
> > > > you seem to be looking at *all* the LRs. Is that safe?
> > > IIUC Xen does not maintain a used_lrs, it does have an lr_mask, but that
> > > is static in gic.c
> > > 
> > > To do something like
> > > +for_each_set_bit(i, lr_mask, nr_lrs)
> > > + {
> > > +      u64 val = __gic_v3_get_lr(i);
> > > +      u8 lr_prio = (val & ICH_LR_PRIORITY_MASK) >> ICH_LR_PRIORITY_SHIFT;
> > > +     /* Not pending in the state? */
> > > +     if ((val & ICH_LR_STATE) != ICH_LR_PENDING_BIT)
> > > +         continue;
> > > 
> > > 
> > > I need to do some jugglery to make lr_mask visible outside of
> > > xen/arch/arm/gic.c
> > > The easiest would be to add an extern function, harder way would be to add
> > > it in gic_hw_operations
> > > 
> > > - vgic_v3_highest_priority_lr iterates is interested in used LR's which
> > > sre in Pending state.
> > > - emulating IAR is done with interrupts disabled
> > > - iterating over all the LRs and finding which ones are in Pending.
> > > 
> > > 
> > Just to add I was answering for using num_lrs for used_lrs, above was for
> > IAR flow.
> > This holds the same for EOIR flow as well.
> > 
> > The bigger point is unless I add some jugglery to access static value
> > outside gic.c
> > this is the only solution.
> > 
> > Stefano/Andre/Julien
> > Please suggest if there is some better way...
> 
> lr_mask is already exported. So I am not sure what you need here.
> 
> However, despite the fact the variable is living in gic.c it is only used by
> the old vGIC. Newer vGIC is based on KVM, so used_lrs would be fine to use.
> 
> For the old vGIC, see below.
> 
> > > >   Are you
> > > > guaranteed not to have any stale state?
> 
> LRs are zeroed when unused and AFAICT they should always be accurate. Stefano
> can you confirm it?
> 
> So it would be ok go through all the LRs (thought with a performance hit).

Yes, in the old vgic LRs are always accurate (obvioulsy when read on the
right pcpu).
--8323329-1487743141-1522958008=:6016
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1487743141-1522958008=:6016--
