From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Does XEN ARM support RTC in domu?
Date: Tue, 6 Nov 2018 09:14:22 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811060911240.18518@sstabellini-ThinkPad-X260>
References: <AM0PR04MB44819354E4855B72C4C7F82388CD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <0c0ce589-d65f-429d-9a2f-dd267b949c29@arm.com>
 <AM0PR04MB44814D7E3A6A14BA18C9A93788CE0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <009ad6b6-f2f3-9e53-6ab4-bb712feb7dfd@arm.com>
 <AM0PR04MB448159C762A0CF5FD4B51AD388CA0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <AM0PR04MB44816F5DA1692D40BB484C5088CB0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1429427675-1541524354=:18518"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0zrd=nr=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gK4vq-0000Qy-Am
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 17:14:26 +0000
In-Reply-To: <AM0PR04MB44816F5DA1692D40BB484C5088CB0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-ID: <alpine.DEB.2.10.1811060912360.18518@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1429427675-1541524354=:18518
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1811060912361.18518@sstabellini-ThinkPad-X260>

On Tue, 6 Nov 2018, Peng Fan wrote:
> Hi Julien,
> 
> > -----Original Message-----
> > From: Xen-devel [mailto:xen-devel-bounces@lists.xenproject.org] On Behalf Of
> > Peng Fan
> > Sent: 2018年11月5日 10:11
> > To: Julien Grall <julien.grall@arm.com>; xen-devel@lists.xenproject.org;
> > Stefano Stabellini <sstabellini@kernel.org>
> > Subject: Re: [Xen-devel] Does XEN ARM support RTC in domu?
> > 
> > Hi Julien,
> > 
> > > >>
> > > >>>
> > > >>> Just have a question, does XEN ARM support RTC in domu? To support
> > > >>> Android
> > > >> in DomU, RTC is needed for alarm, but I did not find information
> > > >> about RTC on xen for domu. So this need a new RTC paravirtualization
> > driver?
> > > Any suggestions?
> > > >>
> > > >> By RTC, do you mean Real-Time Clock? Something like PL031? Or do
> > > >> you have something else in mind?
> > > >
> > > > Yes, Real Time Clock like PL031 in DomU. I do not have a good idea
> > > > support RTC in ARM DomU, KVM and XEN x86 seems use emulated RTC in
> > > > qemu. Thinking of paravirtual RTC, and dom0 control the expire time
> > > > for
> > > alarm.
> > >
> > > The PL031 is quite small (based on the QEMU version). So I think it
> > > would be fine to provide an emulation in the hypervisor.
> > 
> > Ok. Just like the hvm x86, implement emulate PL031 inside XEN. I'll give a try.
> 
> Just a follow up question, emulating PL031 in xen, do you have idea how to inject virtual interrupt to domu?
> The interrupt should be only cpu interface interrupt, I think.

Have a loop at the existing virtual timer: xen/arch/arm/vtimer.c
It should give you a decent idea.
--8323329-1429427675-1541524354=:18518
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1429427675-1541524354=:18518--
