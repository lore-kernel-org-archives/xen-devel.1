From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 10/18] xen/arm: Implement GIC suspend/resume
 functions (gicv2 only)
Date: Thu, 15 Nov 2018 10:26:30 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811151026250.22115@sstabellini-ThinkPad-X260>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-11-git-send-email-mirela.simonovic@aggios.com>
 <746b0ad8-4ce1-dfaf-eadc-939657426900@arm.com>
 <ed9f3dc5-7f91-6d49-ee09-b362afcee5b0@aggios.com>
 <64d1c6ba-de67-4757-5be6-2390286eb60e@arm.com>
 <alpine.DEB.2.10.1811141410250.302@sstabellini-ThinkPad-X260>
 <384421bf-3ce7-28b5-a360-a31f6e059c08@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-392878405-1542306397=:22115"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hzrU=N2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gNMLg-0007b5-4f
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 18:26:40 +0000
In-Reply-To: <384421bf-3ce7-28b5-a360-a31f6e059c08@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <Julien.Grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "saeed.nowshadi@xilinx.com" <saeed.nowshadi@xilinx.com>, "dm@aggios.com" <dm@aggios.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "stefano.stabellini@xilinx.com" <stefano.stabellini@xilinx.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-392878405-1542306397=:22115
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 14 Nov 2018, Julien Grall wrote:
> Hi,
> 
> On 14/11/2018 22:18, Stefano Stabellini wrote:
> > On Wed, 14 Nov 2018, Julien Grall wrote:
> >>>>>    @@ -1319,6 +1341,129 @@ static void gicv2_do_LPI(unsigned int lpi)
> >>>>>        BUG();
> >>>>>    }
> >>>>>    +static void gicv2_alloc_context(struct gicv2_context *gc)
> >>>>> +{
> >>>>
> >>>> Is it necessary to allocate them at boot? Can we make them static or
> >>>> allocate them when we suspend?
> >>>>
> >>>
> >>> We need to allocate dynamically because the size of allocated data depends
> >>> on the number of irq lines, which is not known at the compile time.
> >>
> >> Well you know the upper bound. Why can't you use the upper bound?
> >>
> >>> Alternative is to allocate on suspend, but I believe it is better to do this
> >>> when the system boots.
> >>
> >> Why is it better?
> > 
> > I'll reply here also to your other point because they are related:
> > 
> >> Suspend/resume is not a critical feature in common case. So I would
> >> prefer if we disable it when we can't alloc memory.
> > 
> > 
> > It is true that suspend/resume is not a critical feature for the common
> > case, but proceeding as "normal" when a memory allocation fails is not a
> > good idea: if the hypervisor is so low in memory as to fail in an
> > allocation like this one, it is not going to be able to work right. In
> > no other cases in Xen we continue on memory allocation failures, even
> > for less-critical features.
> > 
> > I suggest that we either allocate statically using the upper bound as
> > you suggested, although it leads to some memory being wasted.
> 
> We are speaking of at most 2KB of memory. I don't think it is going to 
> be waste given of the number of interrupts GIC usually supports.
> 
> The more that we already statically allocate irq_desc.

OK
--8323329-392878405-1542306397=:22115
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-392878405-1542306397=:22115--
