From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC] virtio_ring: check dma_mem for xen_domain
Date: Thu, 24 Jan 2019 11:14:53 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901241110290.17936__9689.38322491653$1548357359$gmane$org@sstabellini-ThinkPad-X260>
References: <20190121050056.14325-1-peng.fan@nxp.com>
 <alpine.DEB.2.10.1901221113410.17936@sstabellini-ThinkPad-X260>
 <20190123071232.GA20526@infradead.org>
 <alpine.DEB.2.10.1901230935280.17936@sstabellini-ThinkPad-X260>
 <20190123211405.GA4971@infradead.org>
 <alpine.DEB.2.10.1901231427010.17936@sstabellini-ThinkPad-X260>
 <AM0PR04MB4481BE680ACB40E78456DA64889A0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-539770563-1548357127=:17936"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uamK=QA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gmkSm-0000Uz-8X
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 19:14:56 +0000
In-Reply-To: <AM0PR04MB4481BE680ACB40E78456DA64889A0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-ID: <alpine.DEB.2.10.1901241112100.17936@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "jgross@suse.com" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "hch@infradead.org" <hch@infradead.org>, "jliang@xilinx.com" <jliang@xilinx.com>, "luto@kernel.org" <luto@kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-539770563-1548357127=:17936
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1901241112101.17936@sstabellini-ThinkPad-X260>

On Thu, 24 Jan 2019, Peng Fan wrote:
> Hi stefano,
> 
> > -----Original Message-----
> > From: Stefano Stabellini [mailto:sstabellini@kernel.org]
> > Sent: 2019年1月24日 7:44
> > To: hch@infradead.org
> > Cc: Stefano Stabellini <sstabellini@kernel.org>; Peng Fan
> > <peng.fan@nxp.com>; mst@redhat.com; jasowang@redhat.com;
> > xen-devel@lists.xenproject.org; linux-remoteproc@vger.kernel.org;
> > linux-kernel@vger.kernel.org; virtualization@lists.linux-foundation.org;
> > luto@kernel.org; jgross@suse.com; boris.ostrovsky@oracle.com;
> > bjorn.andersson@linaro.org; jliang@xilinx.com
> > Subject: Re: [Xen-devel] [RFC] virtio_ring: check dma_mem for xen_domain
> > 
> > On Wed, 23 Jan 2019, hch@infradead.org wrote:
> > > On Wed, Jan 23, 2019 at 01:04:33PM -0800, Stefano Stabellini wrote:
> > > > If vring_use_dma_api is actually supposed to return true when
> > > > dma_dev->dma_mem is set, then both Peng's patch and the patch I
> > > > wrote are not fixing the real issue here.
> > > >
> > > > I don't know enough about remoteproc to know where the problem
> > > > actually lies though.
> > >
> > > The problem is the following:
> > >
> > > Devices can declare a specific memory region that they want to use
> > > when the driver calls dma_alloc_coherent for the device, this is done
> > > using the shared-dma-pool DT attribute, which comes in two variants
> > > that would be a little to much to explain here.
> > >
> > > remoteproc makes use of that because apparently the device can only
> > > communicate using that region.  But it then feeds back memory obtained
> > > with dma_alloc_coherent into the virtio code.  For that it calls
> > > vmalloc_to_page on the dma_alloc_coherent, which is a huge no-go for
> > > the ĐMA API and only worked accidentally on a few platform, and
> > > apparently arm64 just changed a few internals that made it stop
> > > working for remoteproc.
> > >
> > > The right answer is to not use the DMA API to allocate memory from a
> > > device-speficic region, but to tie the driver directly into the DT
> > > reserved memory API in a way that allows it to easilt obtain a struct
> > > device for it.
> > 
> > If I understand correctly, Peng should be able to reproduce the problem on
> > native Linux without any Xen involvement simply by forcing
> > vring_use_dma_api to return true. Peng, can you confirm?
> 
> It is another issue without xen involvement, 
> There is an thread talking this: https://patchwork.kernel.org/patch/10742923/
> 
> Without xen, vring_use_dma_api will return false.
> With xen, if vring_use_dma_api returns true, it will dma_map_xx and trigger dump.

It is true that for Xen on ARM DomUs it is not necessary today to return
true from vring_use_dma_api. However, returning true from
vring_use_dma_api should not break Linux. When the rpmesg issue is
fixed, this problem should also go away without any need for additional
changes on the xen side I think.
--8323329-539770563-1548357127=:17936
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-539770563-1548357127=:17936--
