From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] arm: clean-up: correct find_*_bit()
 functions use
Date: Thu, 24 May 2018 11:56:02 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805241152000.25719@sstabellini-ThinkPad-X260>
References: <07610208-7c29-f8b4-3146-6bd36a994d33@epam.com>
 <18802f31-3c8a-5c6e-213b-32718690bb8a@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1031641540-1527187967=:25719"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rlfa=il=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fLvPA-00075M-LN
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 18:56:04 +0000
In-Reply-To: <18802f31-3c8a-5c6e-213b-32718690bb8a@arm.com>
Content-ID: <alpine.DEB.2.10.1805241155340.25719@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@linaro.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1031641540-1527187967=:25719
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1805241155341.25719@sstabellini-ThinkPad-X260>

On Thu, 24 May 2018, Julien Grall wrote:
> Hi Artem,
> 
> Title: It would be good to specify the subsystem you modify.
> 
> arm: vgic: ...
> 
> On 24/05/18 16:24, Artem Mygaiev wrote:
> > vgic_vcpu_pending_irq() uses find_next_bit() library function with single
> > 'unsigned long' variable, while it is designed to work with memory regions
> > and offsets. It would be more correct to use the find_first_bit() function
> > instead.
> 
> The commit message sounds like it is wrong to use find_next_bit(). However, as
> I mentioned earlier, find_first_bit() is just a wrapper of find_next_bit() on
> Arm64.
> 
> So I would reword the commit message as:
> 
> "arm: vgic: Use find_first_bit instead of find_next_bit when possible
> 
> find_next_bit(foo, sz, 0) is equivalent to find_first_bit(foo, sz). The latter
> is easier to understand. Some architecture may also have a optimized version
> of find_first_bit(...). So replace the occurrence of find_next_bit in
> vgic_vcpu_pending_irq()."

I was going to fix the commit message while committing the patch, using
Julien's wording, but we have a commit moratorium at the moment. I'll
commit when the tree reopens.


> 
> > 
> > Signed-off-by: Artem Mygaiev <artem_mygaiev@epam.com>
> > 
> > diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
> > index d831b35525..fd63906e9b 100644
> > --- a/xen/arch/arm/gic-vgic.c
> > +++ b/xen/arch/arm/gic-vgic.c
> > @@ -362,7 +362,7 @@ int vgic_vcpu_pending_irq(struct vcpu *v)
> >       ASSERT(v == current);
> > 
> >       mask_priority = gic_hw_ops->read_vmcr_priority();
> > -    active_priority = find_next_bit(&apr, 32, 0);
> > +    active_priority = find_first_bit(&apr, 32);
> > 
> >       spin_lock_irqsave(&v->arch.vgic.lock, flags);
> > 
> 
> -- 
> Julien Grall
> 
--8323329-1031641540-1527187967=:25719
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1031641540-1527187967=:25719--
