From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v8 8/8] xen/arm: map reserved-memory regions
 as normal memory in dom0
Date: Wed, 7 Nov 2018 11:01:40 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811071055300.26758@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1810081606390.28877@sstabellini-ThinkPad-X260>
 <1539041841-17655-8-git-send-email-sstabellini@kernel.org>
 <6fb85adc-7bce-afc3-7a6e-e0abdee5d2b9@arm.com>
 <alpine.DEB.2.10.1811061631190.21987@sstabellini-ThinkPad-X260>
 <94712fd4-8568-a598-6918-d8a300653846@arm.com>
 <ddc98845-ea0d-cef2-4412-9592910a1a16@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1959534278-1541617301=:26758"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ddc98845-ea0d-cef2-4412-9592910a1a16@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, blackskygg@gmail.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1959534278-1541617301=:26758
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 7 Nov 2018, Julien Grall wrote:
> On 07/11/2018 12:18, Julien Grall wrote:
> > Hi Stefano,
> > 
> > On 07/11/2018 00:32, Stefano Stabellini wrote:
> > > On Mon, 22 Oct 2018, Julien Grall wrote:
> > > > Hi,
> > > > 
> > > > On 09/10/2018 00:37, Stefano Stabellini wrote:
> > > > > reserved-memory regions should be mapped as normal memory.
> > > > 
> > > > This is already the case with p2m_mmio_direct_c. The hardware domain
> > > > should
> > > > have full control on the resulting attributes via its stage-1 mappings.
> > > > So
> > > > what's wrong with that p2m type?
> > > 
> > > Shared mappings are prevented for any types other than p2m_ram_rw, see
> > > the p2m_is_ram checks in the implementation of XENMAPSPACE_gmfn_share.
> > 
> > This does not make any sense. This series is about mapping between any
> > domain but dom0. So if you end-up to map the reserved-memory region in dom0,
> > why are you using XENMAPSPACE_gmfn_share?
> 
> To clarify my question, what are you trying to achieve? Are you trying to
> share memory between Dom0 and a guest. Or are you trying to share memory
> between an external entity (i.e R* core/device) and the guest?

I have in my TODO list to achieve both the goals you mentioned. However,
with this patch I am trying to enable shared cacheable memory between
Dom0 and a guest. Specifically, I am setting up Dom0 as "owner" (with
the new terminology, formerly "master"), and a DomU as "borrower".

A lot of the steps automated by libxl have to be done manually, such as
advertising the memory region as "reserved-memory" on the Dom0 device
tree and adding the "owner" entries to xenstore, but once that is done,
it works just fine.


> > > The alternative is to remove or extend the p2m_is_ram check at
> > > xen/arch/arm/mm.c:1283
> > 
> > p2m_ram_* means the page is managed by Xen and accounting will be done.
> > Similarly XENMAPSPACE_gmfn_share will do accounting on the page mapped
> > through that.
> > 
> > In the case of reserved-memory, we never handled them properly in Xen (see
> > [1]).
> > 
> > There are 2 types of reserved-memory region: static and dynamic. The dynamic
> > one are not a concerned as addressed are not specified in them.
> > 
> > In the case of static one, they are backed by a page in Xen because we
> > didn't updated the code to carve them out from xenheap. This means that you
> > are mapping those pages in Dom0, yet they may not be assigned to Dom0 and
> > may get allocated for Xen internal use or to another domain.
> > 
> > As such, this patch is just a workaround to an already broken code. So the
> > first step is fixing the brokenness of reserved-memory region. Then we can
> > discuss whether this patch is relevant for any of your use case.

By fixing the brokenness of reserved-memory region, you mean remove them
from xenheap? Anything else you can think of that doesn't work right?


> > Cheers,
> > 
> > [1]
> > https://lists.xenproject.org/archives/html/xen-devel/2017-07/msg02674.html
> > 
> > > 
> > > 
> > > > >   At the
> > > > > moment, they get remapped as device memory because Xen doesn't know
> > > > > better. Add an explicit check for it.
> > > > > 
> > > > > Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
> > > > > ---
> > > > >    xen/arch/arm/domain_build.c | 7 +++++++
> > > > >    1 file changed, 7 insertions(+)
> > > > > 
> > > > > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > > > > index f552154..c7df4cf 100644
> > > > > --- a/xen/arch/arm/domain_build.c
> > > > > +++ b/xen/arch/arm/domain_build.c
> > > > > @@ -1307,6 +1307,13 @@ static int __init handle_node(struct domain *d,
> > > > > struct kernel_info *kinfo,
> > > > >                   "WARNING: Path %s is reserved, skip the node as we
> > > > > may
> > > > > re-use the path.\n",
> > > > >                   path);
> > > > >    +    /*
> > > > > +     * reserved-memory ranges should be mapped as normal memory in
> > > > > the
> > > > > +     * p2m.
> > > > > +     */
> > > > > +    if ( !strcmp(dt_node_name(node), "reserved-memory") )
> > > > > +        p2mt = p2m_ram_rw;
> > > > > +
> > > > >        res = handle_device(d, node, p2mt);
> > > > >        if ( res)
> > > > >            return res;
> > > > > 
> > > > 
> > > > -- 
> > > > Julien Grall

--8323329-1959534278-1541617301=:26758
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1959534278-1541617301=:26758--
