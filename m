From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 4/6] xen/arm: zynqmp: eemi access control
Date: Wed, 17 Oct 2018 21:58:15 +0800 (CST)
Message-ID: <alpine.DEB.2.10.1810172008170.3835@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1808101435481.32304@sstabellini-ThinkPad-X260>
 <1533945710-15159-4-git-send-email-sstabellini@kernel.org>
 <79f450e4-7f96-3f9d-d267-a3aa38b1f26a@arm.com>
 <alpine.DEB.2.10.1810101455160.436@sstabellini-ThinkPad-X260>
 <0efa6dec-8800-f294-e16f-8cf6d4067a84@arm.com>
 <bb36e227-6c35-ed22-a2d0-bffec03a193d@arm.com>
 <alpine.DEB.2.10.1810160947370.4859@sstabellini-ThinkPad-X260>
 <ea9e4900-c886-415c-585a-db620ac9194c@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-2053320843-1539778108=:3835"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <ea9e4900-c886-415c-585a-db620ac9194c@arm.com>
Content-ID: <alpine.DEB.2.10.1810172158090.3835@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: edgar.iglesias@xilinx.com, Stefano Stabellini <stefanos@xilinx.com>, nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2053320843-1539778108=:3835
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1810172158091.3835@sstabellini-ThinkPad-X260>

On Tue, 16 Oct 2018, Julien Grall wrote:
> Hi Stefano,
> 
> On 10/16/2018 03:39 AM, Stefano Stabellini wrote:
> > On 15/10/2018 08:25, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 10/10/2018 11:35 PM, Stefano Stabellini wrote:
> > > > On Tue, 28 Aug 2018, Julien Grall wrote:
> > > > > On 11/08/18 01:01, Stefano Stabellini wrote:
> > > > > >     #include <xen/iocap.h>
> > > > > >     #include <xen/sched.h>
> > > > > >     #include <xen/types.h>
> > > > > > @@ -23,6 +91,721 @@
> > > > > >     #include <asm/regs.h>
> > > > > >     #include <asm/platforms/xilinx-zynqmp-eemi.h>
> > > > > >     +struct pm_access
> > > > > > +{
> > > > > > +    paddr_t addr;
> > > > > 
> > > > > It seems that the address will always page-aligned. So could we store
> > > > > a
> > > > > frame
> > > > > using mfn_t?
> > > > 
> > > > Yes we could store just the frame. I started to make the change
> > > > suggested, and all the required corresponding changes to the
> > > > initializations below, for instance:
> > > > 
> > > >     [NODE_RPU] = { MM_RPU },
> > > > 
> > > > needs to become:
> > > > 
> > > >     [NODE_RPU] = { _mfn(MM_RPU) },
> > > > 
> > > > but when I tried to do that, I get a compilation error:
> > > > 
> > > >     xilinx-zynqmp-eemi.c:106:20: error: initializer element is not
> > > > constant
> > > >          [NODE_RPU] = { _mfn(MM_RPU) },
> > > > 
> > > > Unfortunately it is not possible to use mfn_t in static initializations,
> > > > because it is a static inline. I could do:
> > > > 
> > > 
> > > This is a bug in GCC older than 5.0.
> > > 
> > > >     [NODE_RPU] = { { MM_RPU } },
> > > > 
> > > > which would work for DEBUG builds but wouldn't work for non-DEBUG
> > > > builds.
> > > > 
> > > > I'll keep paddr_t for the next version of the series.
> > > 
> > > What is the issue with that on non-debug build? We are using this
> > > construction in another place without any compiler issue.
> > 
> > I modified the code as suggested again and tried with newer GCCs (both
> > 6.3.1 and 7.3.1) but I still get the same error:
> > 
> > xilinx-zynqmp-eemi.c:105:20: error: initializer element is not constant
> >       [NODE_RPU] = { _mfn(MM_RPU) },
> 
> I actually misremembered the problem. _mfn is using a static inline helper
> which is not considered as a constant.
> 
> The correct solution would be (mfn_t){ MM_RPU } but GCC 5.0 (and older) does
> not parse correctly the type cast. So we workaround by dropping the cast for
> the initializer.
> 
> On your previous e-mail you said that { { MM_RPU } } would not work for debug.
> One solution would be to introduce _mfn_initializer(...) that would be
> implemented differently for debug and non-debug.
> 
> I think such helper would be useful in other context as well.

OK, I'll do that
--8323329-2053320843-1539778108=:3835
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-2053320843-1539778108=:3835--
