From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CONFIG_XEN_PV breaks
 xen_create_contiguous_region on ARM
Date: Tue, 16 Oct 2018 21:02:53 +0800 (CST)
Message-ID: <alpine.DEB.2.10.1810162102240.5150@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1810161627250.5150@sstabellini-ThinkPad-X260>
 <209b46f5-54db-72be-5d08-798550bc7d02@arm.com>
 <8deec21f-cb8a-a481-7f49-e9a8c1c7425a@oracle.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1287587876-1539694980=:5150"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pf7c=m4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gCP01-0002iw-Ok
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 13:03:01 +0000
In-Reply-To: <8deec21f-cb8a-a481-7f49-e9a8c1c7425a@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>, Jeff.Kubascik@dornerworks.com, Julien Grall <julien.grall@arm.com>, Nathan.Studer@dornerworks.com, xen-devel@lists.xenproject.org, vkuznets@redhat.com, Jarvis.Roach@dornerworks.com
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1287587876-1539694980=:5150
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 16 Oct 2018, Boris Ostrovsky wrote:
> On 10/16/18 6:56 AM, Julien Grall wrote:
> > Hi,
> >
> > On 10/16/2018 09:38 AM, Stefano Stabellini wrote:
> >> xen_create_contiguous_region has now only an implementation if
> >> CONFIG_XEN_PV is defined. However, on ARM we never set CONFIG_XEN_PV but
> >> we do have an implementation of xen_create_contiguous_region which is
> >> required for swiotlb-xen to work correctly (although it just sets
> >> *dma_handle). >
> >> This fixes a bug introduced by 16624390816c4c40df3d777b34665d3fd01e693d.
> >
> > Linux is using the tag "Fixes: sha1 ("commit title")" so it can be
> > picked up for backporting.
> 
> 
> SoB would also be good to have ;-)
> 
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Ooops, here it comes:

Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>


> >
> > Acked-by: Julien Grall <julien.grall@arm.com>
> >
> > Cheers,
> >>
> >> diff --git a/include/xen/xen-ops.h b/include/xen/xen-ops.h
> >> index fd18c97..939a962 100644
> >> --- a/include/xen/xen-ops.h
> >> +++ b/include/xen/xen-ops.h
> >> @@ -41,7 +41,7 @@ static inline uint32_t xen_vcpu_nr(int cpu)
> >>     extern unsigned long *xen_contiguous_bitmap;
> >>   -#ifdef CONFIG_XEN_PV
> >> +#ifdef CONFIG_XEN_PV || CONFIG_ARM || CONFIG_ARM64
> >>   int xen_create_contiguous_region(phys_addr_t pstart, unsigned int
> >> order,
> >>                   unsigned int address_bits,
> >>                   dma_addr_t *dma_handle);
> >>
> >> _______________________________________________
> >> Xen-devel mailing list
> >> Xen-devel@lists.xenproject.org
> >> https://lists.xenproject.org/mailman/listinfo/xen-devel
> >>
> >
> 
--8323329-1287587876-1539694980=:5150
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1287587876-1539694980=:5150--
