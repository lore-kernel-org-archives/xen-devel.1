From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC] virtio_ring: check dma_mem for xen_domain
Date: Wed, 23 Jan 2019 15:43:45 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901231427010.17936__11879.4635914796$1548287079$gmane$org@sstabellini-ThinkPad-X260>
References: <20190121050056.14325-1-peng.fan@nxp.com>
 <alpine.DEB.2.10.1901221113410.17936@sstabellini-ThinkPad-X260>
 <20190123071232.GA20526@infradead.org>
 <alpine.DEB.2.10.1901230935280.17936@sstabellini-ThinkPad-X260>
 <20190123211405.GA4971@infradead.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1172143826-1548282487=:17936"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3kqX=P7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gmSBP-0000sR-Vt
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 23:43:48 +0000
In-Reply-To: <20190123211405.GA4971@infradead.org>
Content-ID: <alpine.DEB.2.10.1901231428550.17936@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "hch@infradead.org" <hch@infradead.org>
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>, "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, jliang@xilinx.com, luto@kernel.org, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, boris.ostrovsky@oracle.com, bjorn.andersson@linaro.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1172143826-1548282487=:17936
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1901231428551.17936@sstabellini-ThinkPad-X260>

On Wed, 23 Jan 2019, hch@infradead.org wrote:
> On Wed, Jan 23, 2019 at 01:04:33PM -0800, Stefano Stabellini wrote:
> > If vring_use_dma_api is actually supposed to return true when
> > dma_dev->dma_mem is set, then both Peng's patch and the patch I wrote
> > are not fixing the real issue here.
> > 
> > I don't know enough about remoteproc to know where the problem actually
> > lies though.
> 
> The problem is the following:
> 
> Devices can declare a specific memory region that they want to use when
> the driver calls dma_alloc_coherent for the device, this is done using
> the shared-dma-pool DT attribute, which comes in two variants that
> would be a little to much to explain here.
> 
> remoteproc makes use of that because apparently the device can
> only communicate using that region.  But it then feeds back memory
> obtained with dma_alloc_coherent into the virtio code.  For that
> it calls vmalloc_to_page on the dma_alloc_coherent, which is a huge
> no-go for the ĐMA API and only worked accidentally on a few platform,
> and apparently arm64 just changed a few internals that made it stop
> working for remoteproc.
> 
> The right answer is to not use the DMA API to allocate memory from
> a device-speficic region, but to tie the driver directly into the
> DT reserved memory API in a way that allows it to easilt obtain
> a struct device for it.

If I understand correctly, Peng should be able to reproduce the problem
on native Linux without any Xen involvement simply by forcing
vring_use_dma_api to return true. Peng, can you confirm?

And the right fix is not to call vmalloc_to_page on a dma_alloc_coherent
buffer -- I don't know about the recent changes on arm64, but that's not
going to work with arm32 either AFAIK. Given that I don't have a repro,
I'll leave it to Peng and/or others to send the appropriate patch for
remoteproc.


> This is orthogonal to another issue, and that is that hardware
> virtio devices really always need to use the DMA API, otherwise
> we'll bypass such features as the device specific DMA pools,
> DMA offsets, cache flushing, etc, etc.

I understand, I'll drop my patch.
--8323329-1172143826-1548282487=:17936
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1172143826-1548282487=:17936--
