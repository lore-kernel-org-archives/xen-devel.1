From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Notes for xen summit 2018 design session] Graphic
 virtualization
Date: Thu, 2 Aug 2018 10:53:27 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808021053080.1127@sstabellini-ThinkPad-X260>
References: <c05f24a4-6c10-282f-3945-c63dcee168ba@arm.com>
 <c8de3993-cac5-0e94-22d9-63294d52095b@epam.com>
 <D1498146-8849-4D03-B8F2-9C62224FE706@citrix.com>
 <4a33c97b-7569-52e5-b165-eff6b37bb0bd@epam.com>
 <6b151a8d-f11f-29d9-20f5-499732bfb357@arm.com>
 <0800a925-7b32-85b4-67e6-7916829e01cb@epam.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1280138051-1533232435=:1127"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hjhm=kr=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1flHnS-0002sz-IJ
 for xen-devel@lists.xenproject.org; Thu, 02 Aug 2018 17:53:58 +0000
In-Reply-To: <0800a925-7b32-85b4-67e6-7916829e01cb@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Artem Mygaiev <artem_mygaiev@epam.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Rich Persaud <persaur@gmail.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1280138051-1533232435=:1127
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 2 Aug 2018, Artem Mygaiev wrote:
> On 02.08.18 18:57, Julien Grall wrote:
> > Hi Artem,
> > 
> > On 02/08/18 16:54, Artem Mygaiev wrote:
> > > On 02.08.18 18:29, Lars Kurth wrote:
> > > > 
> > > > 
> > > > ﻿On 02/08/2018, 16:27, "Artem Mygaiev" <artem_mygaiev@epam.com> wrote:
> > > > 
> > > >      Hello Julien
> > > >      On 02.08.18 12:56, Julien Grall wrote:
> > > >      > Hi,
> > > >      >
> > > >      > Sorry for the late posting. The notes were taken by Stefano
> > > > Stabellini.
> > > >      > Thank you.
> > > >      >
> > > >      > This has some clarifications requested from EPAM regarding
> > > > PowerVR.
> > > >      >
> > > >      > The existing graphics solutions on Xen today are:
> > > >      >     - PV DRM:
> > > >      >          * Supports multiple displays per VM
> > > >      >          * Based on Grant-tables.
> > > >      >          * Improvement of Xen FB which is based on foreign
> > > > mapping
> > > >      >
> > > >      Frontend driver will be part of LK starting 4.18
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/xen?h=v4.18-rc7 
> > > >      >     - Intel GVT: https://01.org/igvt-g
> > > >      >          * Based on IOREQ server infrastructure
> > > >      >          * Performance is 70% of direct assigned hardware
> > > >      >
> > > >      >     - NVIDIA:
> > > >      >          * Much more virtualizable
> > > >      >          * Provide mappable chunk of PCI BARs.
> > > >      >          * Userspace component emulates PCI config space
> > > >      >
> > > >      > Current effort for graphic virtualization on Arm:
> > > >      >     - Samsung: They have a PV OpenGL solution. This seems to be
> > > > fast.
> > > >      This is interesting. Do you know if there is any open benchmark
> > > > data?
> > > > 
> > > > The presentation and recording is at
> > > > https://www.slideshare.net/xen_com_mgr/design-and-implementation-of-automotive-xpdds18-virtualization-based-on-xen-sungmin-lee-samsung-electronics 
> > > > https://www.youtube.com/watch?v=mBD8o9X32fA&index=14&list=PLYyw7IQjL-zFlQYbY9BgsLhxqp1Ui67W7 
> > > 
> > > Thanks for pointing to XDS materials. Unfortunately, there is no
> > > comparison with "native" GPU performance (non-virtualized)... I guess I
> > > need to ask Samsung folks for details.
> > They do compare with Dom0 (slides 20 and onwards). Dom0 has the direct
> > access to the GPU, so this is very similar to native.
> > 
> > Did you expect other comparison?
> 
> Yes, implementation of sharing may impact Dom0 performance. In this case it
> seems that native GL applications in Dom0 are also reside in SVDM somehow
> (slide 14). I am not saying it is necessary impacting, but it is always better
> to have non-virtualized environment as a reference.
> 
> Too bad I couldn't make it to XDS due to conflict with AGL/OSS events :(

I took his business card, I'll try to make introductions.
--8323329-1280138051-1533232435=:1127
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1280138051-1533232435=:1127--
