From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] arch/arm/xen: Remove duplicate header
Date: Mon, 28 Jan 2019 14:40:35 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901281440010.17936__36401.3398926303$1548715311$gmane$org@sstabellini-ThinkPad-X260>
References: <20190107173719.GA30197@jordon-HP-15-Notebook-PC>
 <eab5c59d-cfb4-bd2a-de07-7db827830472@gmail.com>
 <CAFqt6zb0cU3TjAs0LO-DL3Ut98-7=b7cP9+hZ+bUxDLD2EN2vA@mail.gmail.com>
 <cd855c41-dca0-14dc-6703-886feccd34ea@gmail.com>
 <d386f867-715f-0667-93bf-b42d728f546a@oracle.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-120884440-1548715237=:17936"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y4lz=QE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1goFa2-0001LB-RN
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 22:40:38 +0000
In-Reply-To: <d386f867-715f-0667-93bf-b42d728f546a@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, Sabyasachi Gupta <sabyasachi.linux@gmail.com>, Oleksandr Andrushchenko <andr2000@gmail.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Souptick Joarder <jrdr.linux@gmail.com>, Brajeswar Ghosh <brajeswar.linux@gmail.com>, xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-120884440-1548715237=:17936
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 28 Jan 2019, Boris Ostrovsky wrote:
> On 1/28/19 3:29 AM, Oleksandr Andrushchenko wrote:
> > +Boris and Juergen who can also help getting it in
> 
> I can put this in but I'd like to have Stefano's ack, this being ARM.

The patch is OK. Sorry for not replying earlier, this thread fell off my
radar somehow.

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> >
> > On 1/28/19 8:34 AM, Souptick Joarder wrote:
> >> On Mon, Jan 14, 2019 at 4:08 PM Oleksandr Andrushchenko
> >> <andr2000@gmail.com> wrote:
> >>> On 1/7/19 7:37 PM, Souptick Joarder wrote:
> >>>> Remove duplicate header which is included twice.
> >>>>
> >>>> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> >>> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >> Can we get this patch in queue for 5.1 ?
> >>>> ---
> >>>>    arch/arm/xen/mm.c | 1 -
> >>>>    1 file changed, 1 deletion(-)
> >>>>
> >>>> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> >>>> index cb44aa2..e1d44b9 100644
> >>>> --- a/arch/arm/xen/mm.c
> >>>> +++ b/arch/arm/xen/mm.c
> >>>> @@ -7,7 +7,6 @@
> >>>>    #include <linux/of_address.h>
> >>>>    #include <linux/slab.h>
> >>>>    #include <linux/types.h>
> >>>> -#include <linux/dma-mapping.h>
> >>>>    #include <linux/vmalloc.h>
> >>>>    #include <linux/swiotlb.h>
> >>>>
> >
> 
--8323329-120884440-1548715237=:17936
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-120884440-1548715237=:17936--
