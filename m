From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Supported hardware
Date: Mon, 29 Jan 2018 12:16:41 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801291154340.11958@sstabellini-ThinkPad-X260>
References: <1517137831941.78119@student.kuleuven.be>
 <a8060d2d-af2b-1014-c933-e5ede90613eb@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-569801765-1517255721=:11958"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=hmm/=ey=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1egFrB-0007hr-Gf
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2018 20:16:45 +0000
In-Reply-To: <a8060d2d-af2b-1014-c933-e5ede90613eb@arm.com>
Content-ID: <alpine.DEB.2.10.1801291202360.11958@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>, Pieter Dewachter <pieter.dewachter@student.kuleuven.be>, Andre Przywara <andre.przywara@arm.com>, Stewart.Hildebrand@dornerworks.com, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-569801765-1517255721=:11958
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1801291202361.11958@sstabellini-ThinkPad-X260>

On Mon, 29 Jan 2018, Julien Grall wrote:
> Hello,
> 
> On 28/01/18 11:10, Pieter Dewachter wrote:
> > Dear developers,
> 
> Hi Pieter,
> 
> Thank you for your interest on Xen.
> 
> > 
> > 
> > ​I'm doing my master thesis this year and I will be using the Xen hypervisor
> > for it. The domain for my thesis is more about the automotive sector, but
> > unfortunately the hardware is too expensive to actually use  > the
> > automotive drivers for Xen.
> > 
> > 
> > The goal is to set up a failover cluster by using two different processors,
> > but the first goal is to actually run Xen on them. Due to the limited
> > budget, we were looking at this development board specifically:
> > 
> > https://www.mouser.be/productdetail/nxp-freescale/frdm-ls1012a-pa?qs=sGAEpiMZZMtw0nEwywcFgPq18vRUkOhrFGI4%252bz5xG70HM4YISmdecw==
> > <https://www.mouser.be/productdetail/nxp-freescale/frdm-ls1012a-pa?qs=sGAEpiMZZMtw0nEwywcFgPq18vRUkOhrFGI4%252bz5xG70HM4YISmdecw>
> > 
> > 
> > This is a board based on a single Cortex A53 implemented by NXP, more
> > details can be found here:
> > 
> > https://www.nxp.com/products/processors-and-microcontrollers/arm-based-processors-and-mcus/qoriq-layerscape-arm-processors/qoriq-layerscape-1012a-low-power-communication-processor:LS1012A
> > 
> > 
> > 
> > Now I have heard the biggest problem is generally the GIC interrupt
> > controller, so I was wondering if it is possible to run Xen on these boards?
> 
> I would not consider the GIC as the main problem. Xen supports GICv2 and GICv3
> and nothing should be necessary if the platform has one (this is assuming no
> workaround is required). However, if the platform has a second interrupt
> controller (such as on Tegra) you may need to add some logic in Xen to get the
> interrupt routed to a Dom0/DomU.
> 
> > Once I have confirmation I can make the purchase to continue my thesis. It
> > would be a shame to buy unsupported hardware to start with.
> 
> I am not aware of anyone booting Xen on that platform. From the spec, it looks
> pretty standard. It looks like the UART driver in Xen may need some update to
> be usable. Other than that, I believe it would not be too much trouble.
> 
> However, I don't see an IOMMU. This might make more difficult to assign a
> device to a domain if that what you are aiming.
> 
> I have CCed few more person to get more feedback.

CC'ing some more people that might have experience with it.

Julien's right, the board looks good and the GIC shouldn't be an issue.
If you are interested in an IOMMU you might want to have a look at the
LS1043A:

https://www.nxp.com/products/processors-and-microcontrollers/arm-based-processors-and-mcus/qoriq-layerscape-arm-processors/qoriq-layerscape-1043a-and-1023a-multicore-communications-processors:LS1043A

--8323329-569801765-1517255721=:11958
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-569801765-1517255721=:11958--
