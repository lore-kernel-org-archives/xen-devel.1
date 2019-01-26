From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Backport candidate for Arm
Date: Fri, 25 Jan 2019 17:30:51 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901251719390.17936@sstabellini-ThinkPad-X260>
References: <80edd4d5-e2b7-bcb5-32ac-9d2c9096299f@arm.com>
 <cc1466b5-fbc3-0e1f-6092-4f559866337c@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-2089432952-1548466251=:17936"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J9Y9=QC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gnCoA-0008C5-DT
 for xen-devel@lists.xenproject.org; Sat, 26 Jan 2019 01:30:54 +0000
In-Reply-To: <cc1466b5-fbc3-0e1f-6092-4f559866337c@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2089432952-1548466251=:17936
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 21 Jan 2019, Julien Grall wrote:
> Hi,
> 
> Ping?
> 
> Cheers,
> 
> On 30/11/2018 17:25, Julien Grall wrote:
> > Hi,
> > 
> > Below a list of backport candidate for Arm.
> > 
> > 
> > For Xen 4.10+ to handle correctly SMC call parameters and result
> > 
> > 35fc608612    xen/arm: smccc-1.1: Make return values unsigned long
> > fa7974f743      xen/arm: smccc-1.1: Handle function result as parameters
> > 
> > For Xen 4.9+ to avoid Dom0 crash when using less vCPUs than pCPUs on GICv3
> > 
> > 703d9d5ec1      xen/arm: vgic-v3: Delay the initialization of the domain
> > information
> > 54ec59f6b0       xen/arm: vgic-v3: Don't create empty re-distributor regions
> > 
> > The following patch is required in Xen 4.11 to avoid breaking the new vGIC
> > after applying the 2 previous patches.
> > 
> > 62aa9e7f1b    xen/arm: Don't build GICv3 with the new vGIC

For the moment I skipped 54ec59f6b0 and 62aa9e7f1b because 62aa9e7f1b is
not a trivial backport. Everything else is done.


> > For 4.9+ to make the interrupt path safer by adding missing barriers
> > 
> > 177afec455    xen/arm: gic: Ensure we have an ISB between ack and do_IRQ()
> > 555e5f1bd2      xen/arm: gic: Ensure ordering between read of INTACK and
> > shared data
> > 
> > For 4.9+ to comply with the binding description
> > 
> > 3689c54630    xen/arm: check for multiboot nodes only under /chosen
> > 
> > Cheers,
> > 
> 
> -- 
> Julien Grall
> 
--8323329-2089432952-1548466251=:17936
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2089432952-1548466251=:17936--
