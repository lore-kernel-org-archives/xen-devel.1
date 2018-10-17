From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 4/6] xen/arm: zynqmp: eemi access control
Date: Wed, 17 Oct 2018 22:03:48 +0800 (CST)
Message-ID: <alpine.DEB.2.10.1810172201590.3835@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1808101435481.32304@sstabellini-ThinkPad-X260>
 <1533945710-15159-4-git-send-email-sstabellini@kernel.org>
 <79f450e4-7f96-3f9d-d267-a3aa38b1f26a@arm.com>
 <alpine.DEB.2.10.1810101455160.436@sstabellini-ThinkPad-X260>
 <0efa6dec-8800-f294-e16f-8cf6d4067a84@arm.com>
 <bb36e227-6c35-ed22-a2d0-bffec03a193d@arm.com>
 <alpine.DEB.2.10.1810160947370.4859@sstabellini-ThinkPad-X260>
 <d519296a-7076-d3fd-d6f8-27a9b9adfb76@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1433526422-1539785086=:3835"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d519296a-7076-d3fd-d6f8-27a9b9adfb76@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: edgar.iglesias@xilinx.com, Stefano Stabellini <stefanos@xilinx.com>, nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1433526422-1539785086=:3835
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 16 Oct 2018, Julien Grall wrote:
> Hi,
> 
> Sorry I forgot to answer to the rest of the e-mail.
> 
> On 10/16/2018 03:39 AM, Stefano Stabellini wrote:
> > On 15/10/2018 08:25, Julien Grall wrote:
> > > > > > +    bool hwdom_access;    /* HW domain gets access regardless.  */
> > > > > > +};
> > > > > > +
> > > > > > +/*
> > > > > > + * This table maps a node into a memory address.
> > > > > > + * If a guest has access to the address, it has enough control
> > > > > > + * over the node to grant it access to EEMI calls for that node.
> > > > > > + */
> > > > > > +static const struct pm_access pm_node_access[] = {
> > > > > 
> > > > > [...]
> > > > > 
> > > > > > +
> > > > > > +/*
> > > > > > + * This table maps reset line IDs into a memory address.
> > > > > > + * If a guest has access to the address, it has enough control
> > > > > > + * over the affected node to grant it access to EEMI calls for
> > > > > > + * resetting that node.
> > > > > > + */
> > > > > > +#define XILPM_RESET_IDX(n) (n - XILPM_RESET_PCIE_CFG)
> > > > > > +static const struct pm_access pm_reset_access[] = {
> > > > > 
> > > > > [...]
> > > > > 
> > > > > > +
> > > > > > +/*
> > > > > > + * This table maps reset line IDs into a memory address.
> > > > > > + * If a guest has access to the address, it has enough control
> > > > > > + * over the affected node to grant it access to EEMI calls for
> > > > > > + * resetting that node.
> > > > > > + */
> > > > > > +static const struct {
> > > > > > +    paddr_t start;
> > > > > > +    paddr_t size;
> > > > > > +    uint32_t mask;   /* Zero means no mask, i.e all bits.  */
> > > > > > +    enum pm_node_id node;
> > > > > > +    bool hwdom_access;
> > > > > > +    bool readonly;
> > > > > > +} pm_mmio_access[] = {
> > > > > 
> > > > > Those 3 arrays contains a lot of hardcoded value. Can't any of this be
> > > > > detected from the device-tree?
> > > > 
> > > > No, the information is not available on device tree unfortunately. >
> > > > 
> > > > > I would be interested to know how this is going to work with upstream
> > > > > Linux.
> > > > > Do you hardcode all the values there as well?
> > > > 
> > > > Yes: the IDs are specified on an header file, see
> > > > include/linux/firmware/xlnx-zynqmp.h on the zynq/firmware branch of the
> > > > arm-soc tree. In addition to the IDs, we also have the memory addresses
> > > > in Xen to do the permission checks.
> > > 
> > > I am afraid this is not linux upstream. Can you point to the code in
> > > Linus's
> > > git or explain the state of the review?
> > 
> > It hasn't been pulled into Linux yet, I was told it has already been
> > reviewed and is queued in arm-soc for upstreaming at the next merge
> > window, which should be imminent.
> 
> Looking at that branch, I can see some DT bindings at least for the clock. I
> also don't see any hardcoded value for device so far in that series. Is it
> going to be sent separately?

If you look at include/linux/firmware/xlnx-zynqmp.h, you'll see some
hardcode values, specifically enum pm_api_id matches numerically the
enum by the same name this series introduces in
xen/include/asm-arm/platforms/xilinx-zynqmp-eemi.h


> > > > > > +static bool pm_check_access(const struct pm_access *acl, struct
> > > > > > domain *d,
> > > > > > +                            uint32_t idx)
> > > > > > +{
> > > > > > +    unsigned long mfn;
> > > > > 
> > > > > mfn_t please. The code is not that nice but at least it add more
> > > > > safety
> > > > > in the
> > > > > code. Hopefully iommu_access_permitted will be converted to typesafe
> > > > > MFN
> > > > > soon.
> > > > 
> > > > Yes, I can make this change without issues.
> > > > 
> > > > 
> > > > > > +
> > > > > > +    if ( acl[idx].hwdom_access && is_hardware_domain(d) )
> > > > > > +        return true;
> > > > > > +
> > > > > > +    if ( !acl[idx].addr )
> > > > > > +        return false;
> > > > > > +
> > > > > > +    mfn = PFN_DOWN(acl[idx].addr);
> > > > > 
> > > > > maddr_to_mfn(...);
> > > > 
> > > > OK
> > > > 
> > > > 
> > > > > > +    return iomem_access_permitted(d, mfn, mfn);
> > > > > 
> > > > > Is the address something that a guest would be allowed to read/write
> > > > > directly?
> > > > > If not, then iomem_access_permitted(...) should not be used.
> > > > 
> > > > Yes, the address would be something remapped to the guest using iomem.
> > > 
> > > In the documentation at the beginning of the file you say that memory
> > > ranges
> > > are typically secure memory. So how a guest can access them directly?
> > > 
> > > I probably need a bit more background here... What is the address
> > > correspond
> > > to at the end?
> > 
> > The address corresponds to the MMIO region of the device. For instance,
> > MM_GEM0 is 0xff0b0000, which is the address of the network card. It is
> > accessible. The same goes for MM_CAN0, MM_TTC0, MM_SD0, and all the
> > others -- they are all accessible. These are the addresses used in this
> > check that should be remapped into the guest.
> > 
> > However, things are different for the pm_mmio_access array used in
> > domain_has_mmio_access to check for access rights. (That is also where
> > the mask is applied to writes and not to reads, see below.) In that
> > case, the addresses correspond to single registers inside the
> > zynqmp-psgtr region ("ZynqMP High Speed Processing System Gigabit
> > Transceiver") and pin controller region. As you can see, in
> > domain_has_mmio_access the access checks are still done on the
> > corresponding node address, which is the one that gets remapped. For
> > instance in the case of the network card, the remapped address is
> > 0xff0b0000, checks are done on it, but the zynqmp-psgtr and pin
> > contoller region registers are:
> > 
> > {
> >      .start = MM_CRL_APB + R_CRL_GEM0_REF_CTRL,
> >      .size = 4, .node = NODE_ETH_0
> > }
> > [...]
> > {
> >      .start = MM_IOU_SLCR + R_IOU_SLCR_IOU_RAM_GEM0,
> >      .size = 4, .node = NODE_ETH_0
> > }
> > 
> > The comment comes from Edgar, but I think that he meant that VMs won't
> > be able to write to these regions directly. I'll improve the comment.
> 
> Thank you for the explanation. Can you add something similar to what you wrote
> in the code?
 
Yes, I'll do that
--8323329-1433526422-1539785086=:3835
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1433526422-1539785086=:3835--
