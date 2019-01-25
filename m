From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC] virtio_ring: check dma_mem for xen_domain
Date: Fri, 25 Jan 2019 11:18:18 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901251116490.17936__11567.3957554222$1548443964$gmane$org@sstabellini-ThinkPad-X260>
References: <20190121050056.14325-1-peng.fan@nxp.com>
 <alpine.DEB.2.10.1901221113410.17936@sstabellini-ThinkPad-X260>
 <20190123071232.GA20526@infradead.org>
 <alpine.DEB.2.10.1901230935280.17936@sstabellini-ThinkPad-X260>
 <20190123211405.GA4971@infradead.org>
 <AM0PR04MB4481F3986CFB6D1EF26FA135889B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-143402054-1548443899=:17936"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=36PU=QB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gn6ze-0000T3-NQ
 for xen-devel@lists.xenproject.org; Fri, 25 Jan 2019 19:18:22 +0000
In-Reply-To: <AM0PR04MB4481F3986CFB6D1EF26FA135889B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "jgross@suse.com" <jgross@suse.com>, ohad@wizery.com, Stefano Stabellini <sstabellini@kernel.org>, Andy Duan <fugang.duan@nxp.com>, "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "hch@infradead.org" <hch@infradead.org>, "luto@kernel.org" <luto@kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, bjorn.andersson@linaro.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-143402054-1548443899=:17936
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 25 Jan 2019, Peng Fan wrote:
> > On Wed, Jan 23, 2019 at 01:04:33PM -0800, Stefano Stabellini wrote:
> > > If vring_use_dma_api is actually supposed to return true when
> > > dma_dev->dma_mem is set, then both Peng's patch and the patch I wrote
> > > are not fixing the real issue here.
> > >
> > > I don't know enough about remoteproc to know where the problem
> > > actually lies though.
> > 
> > The problem is the following:
> > 
> > Devices can declare a specific memory region that they want to use when the
> > driver calls dma_alloc_coherent for the device, this is done using the
> > shared-dma-pool DT attribute, which comes in two variants that would be a
> > little to much to explain here.
> > 
> > remoteproc makes use of that because apparently the device can only
> > communicate using that region.  But it then feeds back memory obtained
> > with dma_alloc_coherent into the virtio code.  For that it calls
> > vmalloc_to_page on the dma_alloc_coherent, which is a huge no-go for the
> > ĐMA API and only worked accidentally on a few platform, and apparently
> > arm64 just changed a few internals that made it stop working for remoteproc.
> > 
> > The right answer is to not use the DMA API to allocate memory from a
> > device-speficic region, but to tie the driver directly into the DT reserved
> > memory API in a way that allows it to easilt obtain a struct device for it.
> 
> Just have a question, 
> 
> Since vmalloc_to_page is ok for cma area, no need to take cma and per device
> cma into consideration right? 
> 
> we only need to implement a piece code to handle per device specific region
> using RESERVEDMEM_OF_DECLARE, just like:
> RESERVEDMEM_OF_DECLARE(rpmsg-dma, "rpmsg-dma-pool", 
> rmem_rpmsg_dma_setup);
> And implement the device_init call back and build a map between page and phys.
> Then in rpmsg driver, scatter list could use page structure, no need vmalloc_to_page
> for per device dma.
> 
> Is this the right way?

I CC'ed the rpmsg maintainers, you want to keep them in the loop on
this.
--8323329-143402054-1548443899=:17936
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-143402054-1548443899=:17936--
