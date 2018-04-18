From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Setting up a call to discuss PCI Emulation - Future
 Direction
Date: Wed, 18 Apr 2018 10:48:05 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1804181042420.17714@sstabellini-ThinkPad-X260>
References: <4767D7C8-BB78-4B2E-8C9F-AE97CE5F02B5@citrix.com>
 <20180412164104.ymrule7rkdr2w4sb@MacBook-Pro-de-Roger.local>
 <6CF72FA0-688A-4D44-A87E-547DBCE4204D@citrix.com>
 <20180413100149.33jiaddx5spfblmd@MacBook-Pro-de-Roger.local>
 <A2852301-A0AF-45E2-BCC3-42A2F6090BA1@citrix.com>
 <20180413175302.hy7xoakd2lwuu2jq@MacBook-Pro-de-Roger.local>
 <5cb6841c689543c28405ce6bf56055bb@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-2017897903-1524073417=:17714"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kt56=hh=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f8rBi-0006GY-6D
 for xen-devel@lists.xenproject.org; Wed, 18 Apr 2018 17:48:10 +0000
In-Reply-To: <5cb6841c689543c28405ce6bf56055bb@AMSPEX02CL03.citrite.net>
Content-ID: <alpine.DEB.2.10.1804181047240.17714@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Daniel Smith <dpsmith@apertussolutions.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, Julien Grall <julien.grall@arm.com>, Alexey G <x1917x@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2017897903-1524073417=:17714
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1804181047241.17714@sstabellini-ThinkPad-X260>

On Sat, 14 Apr 2018, Paul Durrant wrote:
> > -----Original Message-----
> > From: Roger Pau Monne
> > Sent: 13 April 2018 20:53
> > To: Lars Kurth <lars.kurth@citrix.com>
> > Cc: xen-devel <xen-devel@lists.xenproject.org>; Daniel Smith
> > <dpsmith@apertussolutions.com>; Alexey G <x1917x@gmail.com>; Stefano
> > Stabellini <sstabellini@kernel.org>; Julien Grall <julien.grall@arm.com>; Paul
> > Durrant <Paul.Durrant@citrix.com>; Christopher Clark
> > <christopher.w.clark@gmail.com>; Rich Persaud <persaur@gmail.com>
> > Subject: Re: Setting up a call to discuss PCI Emulation - Future Direction
> > 
> > On Fri, Apr 13, 2018 at 12:59:15PM +0100, Lars Kurth wrote:
> > >
> > >
> > > ﻿On 13/04/2018, 11:01, "Roger Pau Monne" <roger.pau@citrix.com> wrote:
> > >
> > >     On Thu, Apr 12, 2018 at 05:50:00PM +0100, Lars Kurth wrote:
> > >     >
> > >     >
> > >     > On 12/04/2018, 17:41, "Roger Pau Monne" <roger.pau@citrix.com>
> > wrote:
> > >     >
> > >     >     On Thu, Apr 12, 2018 at 05:32:57PM +0100, Lars Kurth wrote:
> > >     >
> > >     >
> > >     >     >    may work. For me Mon, Wed and Fri’s generally work at those
> > time-slots.
> > >     >     >    Next week is a little busy for me, so I would prefer the following
> > week.
> > >     >     >    If you could fill out the following Google poll, if this week works
> > that
> > >     >     >    would be great. Otherwise please scream.
> > >     >
> > >     >     I'm afraid I'm on vacations from the 21st to the 29th of April, so I
> > >     >     won't be able to join the meeting unless we move it to the week
> > after.
> > >     >     Let's see what people think of the current dates.
> > >     >
> > >     >     Roger.
> > >     >
> > >     > Hi, I changed the dates to the week after. Poll so far has been
> > invalidated.
> > >     >
> > >     > See https://doodle.com/poll/gdnmcrvnibmw563n
> > >
> > >     Thanks! I've already fixed my vote.
> > >
> > >     I guess this will come later, but we need a clear agenda of items
> > >     because the x86 and ARM topics are probably going to be completely
> > >     different (albeit all related to PCI).
> > >
> > > Royger: I am OK with trying to get a draft agenda in place in this e-mail
> > thread. But I can't drive this, as I don’t understand the issues. But I am happy
> > to collate everything as for the x86 call and write up minutes
> > 
> > On the x86 side:
> > 
> >  - Q35 HVM emulation, adding MCFG support to guests.
> 
> One of the issues here is support for multiple external emulators w.r.t. config space access.
>
> >  - PVH guest pci-passthrough: using the internal vPCI infrastructure.
> 
> Let's not distinguish between HVM or PVH here. We want to use the same passthrough mechanisms for both.

Ideally, we'll use the same mechanism for ARM too.
--8323329-2017897903-1524073417=:17714
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2017897903-1524073417=:17714--
