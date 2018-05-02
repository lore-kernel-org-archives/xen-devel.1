From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen and safety certification,
 Minutes of the meeting on Apr 4th (Notes on MISRA,
 ISO 26262 static code analysis requirements)
Date: Wed, 2 May 2018 11:02:55 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1805021102430.15949@sstabellini-ThinkPad-X260>
References: <5B133C0D-B062-4135-84A7-E4B342B15324@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-163604794-1525284176=:15949"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ctca=hv=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fDw5k-0005vr-3p
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 18:03:00 +0000
In-Reply-To: <5B133C0D-B062-4135-84A7-E4B342B15324@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth@citrix.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, "davorin.mista@aggios.com" <davorin.mista@aggios.com>, Stefano Stabellini <sstabellini@kernel.org>, "paul_luperto@prqa.com" <paul_luperto@prqa.com>, "Richard_Bellairs@prqa.com" <Richard_Bellairs@prqa.com>, Denys Balatsko <denys.balatsko@globallogic.com>, Rich Persaud <persaur@gmail.com>, Jonathan Daugherty <jtd@galois.com>, "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>, "julien.grall@arm.com" <julien.grall@arm.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>, "committers@xenproject.org" <committers@xenproject.org>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, mirela.simonovic@aggios.c
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-163604794-1525284176=:15949
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 23 Apr 2018, Lars Kurth wrote:
> Hi all,
> 
> ﻿On 06/04/2018, 15:13, "Lars Kurth" <lars.kurth@citrix.com> wrote:
>      
>     > 1) Requirements to the code, a subset of MISRA for ASIL B
>     > Next step: get more information about requirements and publish it to
>     > xen-devel.
>     
>     I see a few problems here:
>     
>     * The MISRA 2012 spec has to be bought and it is rather big (100's of pages): 
>     so, I don't think it is practical to work from the spec
>     
>     * Some coding style patterns will likely be perceived as odd and unreasonable 
>     by community members: as some common code would be affected we cannot 
>     treat this in isolation say on ARM only. Although it is recognized that some of 
>     the coding style patterns may not make sense, compliance to MISRA is 
>     necessary and cannot normally be discussed away.
>     
>     * PRQA has set up an environment and initial MISRA compliance report for a Xen on ARM build 
>     ** The question is what (if anything) can be shared publicly
>     ** The other open question is whether we can come to some sort of longer term agreement between the Xen Project and PRQA to use their tools
>     ** As an aside, what PRQA have done would need to reflect what we do in step 2 is. We also want to minimize the work for PRQA: in other words, it has to be very simple to enable the minimal config coming out of task 2 such that PRQA can 
>     ** As far as I recall 90% of all MISRA violations come down to around 70 issues. A large number are in tools
>     ** Also, I believe that MISRA compliance tools will likely lead to a large amount of false positives, due to the distributed nature of Xen: process boundaries, kernel/user space boundaries, etc. would all lead to false positives, which somehow have to be managed.
>     
>     ACTION => Lars to follow up with Paul Luperto from PRQA
>     
> Hi all. I had a good meeting with Richard and Paul from PRQA today and it looks like we came up with a workable plan. There are a few things that will need checking, but this should be done in about 2 weeks. 
> 
> In essence there is a possibility for PRQA to make an instance of their QA·Verify Management Dashboard (see http://www.prqa.com/static-analysis-software/qa-verify/) to a small number (to be agreed) of community members initially on a suitable baseline for Xen on ARM (I would say Xen 4.11 or an RC would be a good starting point). I believe access should be restricted to committers, maybe people which committers delegate work to. After all, we want to enable an upsell route for PRQA, in return for providing a free service to the community. 
> 
> In any case, this would allow us to use the tool to follow the process I laid out above and get started.

Fantastic!
--8323329-163604794-1525284176=:15949
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-163604794-1525284176=:15949--
