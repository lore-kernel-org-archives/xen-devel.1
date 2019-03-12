From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen ARM smmu questions
Date: Tue, 12 Mar 2019 12:20:25 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1903121215420.665@sstabellini-ThinkPad-X260>
References: <tencent_4E03A65ACF45B3490239A3A479F5E64FA506@qq.com>
 <996e86f5-7059-9fb1-1aa1-734ab760f70a@arm.com>
 <59DDCDD7-B6EF-4F90-82F1-256D5AE10B14@qq.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-866366228-1552418426=:665"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1/Du=RP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1h3mwu-00013J-FY
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 19:20:28 +0000
In-Reply-To: <59DDCDD7-B6EF-4F90-82F1-256D5AE10B14@qq.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jinch <jinchen1227@qq.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-866366228-1552418426=:665
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hi Jinch,

Replies inline below.


On Tue, 12 Mar 2019, Jinch wrote:
> Thank you for your reply,
> I’m just researching the implementation of the SMMU driver in Xen and dom0 kernel.
> If my board has SMMU of arm,mmu-500, do you mean that the Xen use the stage 2 of it and the dom0 kernel use stage1?

Yes, that is the idea, however, it is not straightforward to implement
from what I have been told. For your information, today, only stage2 in
Xen works -- stage1 cannot be used by dom0 (or anybody else) and would
be left unused.


> And if I want to passthrough some device that use SMMU to domu, how the SMMU working in Xen and the domu kernel?

As I mentioned, today Xen makes use of the SMMU, and nobody else in the
system can access it, not dom0, not any domUs. I would love to have a
way to export the SMMU to dom0 and/or a domU. To do that, the easiest
way would be to introduce support for a paravirtualized IOMMU as Julien
mentioned: Xen would expose a "fake" SMMU to guests, and based on its
settings, it would program the real SMMU (it could even use stage1 to do
it). The "fake" SMMU is not implemented yet.


> > 在 2019年3月12日，下午7:42，Julien Grall <julien.grall@arm.com> 写道：
> > 
> > 
> > On 3/12/19 8:58 AM, jinchen wrote:
> >> Hello xen-devel,
> > 
> > Hello,
> > 
> >> I'm reading the code of xen arm smmu in drivers/passthrough/arm, and I have some questions that confused me.
> >> I think if the board use SMMU, xen will take charge of it before dom0 boot, and will not pass the node of SMMU to dom0 in device tree,
> >> so my question is how dom0 use SMMU? or can dom0 use SMMU? What dom0 use if it wants to use IOMMU?
> >> What about domU? The SMMU could be passed to domU?
> > 
> > Some SMMU are able to provide Stage 1 (Guest VA to Guest PA) and Stage 2 (Guest PA to Host PA) support. In the current configuration, Xen will use the Stage 2 part to isolate device passthrough. Stage 1 is not supported.
> > 
> > If you wanted a guest to use the SMMU, you would either need to provide Stage 1 support (requires HW support) or a PV IOMMU.
> > 
> > Alternatively, you might be able to give the SMMU to Dom0. I haven't explored it so far. Do you have a use case for using the IOMMU in guest?
> > 
> > Cheers,
> > 
> > -- 
> > Julien Grall
> > 
> 
> 
> 
--8323329-866366228-1552418426=:665
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-866366228-1552418426=:665--
