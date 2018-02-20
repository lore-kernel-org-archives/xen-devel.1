From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 5/6] xen/arm: read cacheline size when
	needed
Date: Tue, 20 Feb 2018 15:28:31 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1802201515190.19448@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1802191253100.12137@sstabellini-ThinkPad-X260>
 <1519077510-22405-1-git-send-email-sstabellini@kernel.org>
 <1519077510-22405-5-git-send-email-sstabellini@kernel.org>
 <10f32edc-2d5d-ace8-40e1-6ed177c96a39@arm.com>
 <alpine.DEB.2.10.1802201255280.19448@sstabellini-ThinkPad-X260>
 <295740bc-053e-0ba1-315b-392e0e931d74@arm.com>
 <024ab473-6d8e-dc95-88a2-ac706be90ff0@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-717504448-1519169312=:19448"
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <024ab473-6d8e-dc95-88a2-ac706be90ff0@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-717504448-1519169312=:19448
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 20 Feb 2018, Julien Grall wrote:
> On 20/02/2018 21:16, Julien Grall wrote:
> > Hi,
> > 
> > On 20/02/2018 21:03, Stefano Stabellini wrote:
> >> On Tue, 20 Feb 2018, Julien Grall wrote:
> >>> On 19/02/18 21:58, Stefano Stabellini wrote:
> >>>> +        mrc   CP32(r6, CSSELR_EL1)
> >>>
> >>> The size of the cache is read using CSSIDR_EL1. But it looks like the 
> >>> way we
> >>> get the cache line size in Xen is fragile.
> >>>
> >>> We are retrieving the cache line size of Level 1 and assume this will 
> >>> be valid
> >>> for all the other caches. Indeed cache maintenance ops may propagate 
> >>> to other
> >>> caches depending the target (Point of Coherency vs Point of 
> >>> Unification).
> >>>
> >>> Looking at the ARM ARM "Cache hierarchy abstraction for address-based
> >>> operations" (D3-2061 DDI 0487C.a), CTR_EL0/CTR will holds the minimum 
> >>> line
> >>> lenght values for the data caches. The value will be the most efficient
> >>> address stride to use to apply a sequence of VA-based maintenance 
> >>> instructions
> >>> to a range of VAs.
> >>>
> >>> So it would be best and safer for Xen to use CTR/CTLR_EL0.DminLine.
> >>
> >> This is insightful, thank you. Given that this patch is a backport
> >> candidate, I would prefer to retain the same behavior we had before in
> >> setup_cache. I can write a separate patch on top of this to make the
> >> change to use CTR/CTLR_EL0.DminLine. That way, we can make a separate
> >> decision on each of them on whether we want to backport them (and
> >> potentially revert them) or not. In other words: this patch as-is is
> >> suboptimal but is of very little risk. Making changes to the way we
> >> determine the cacheline size improves the patch but significantly
> >> increases the risk factor associated with it.
> >>
> >> Does it make sense?
> > 
> > By this patch you mean big.LITTLE? If so, then I don't consider it as a 
> > potential backport. big.LITTLE has never been supported on Xen and hence 
> > should be considered as a new feature. What is backportable is the patch 
> > #1 that forbid big.LITTLE.

Patch #1 ends up forcing people to use big cores only on many platforms,
which from what you wrote can be unsafe. I suggest we backport the whole
series, so that at least users can configure the system to use LITTLE
cores only, or a mix of the two. The big.LITTLE doc in particular is
certainly worth backporting but only makes sense with the rest of the
series.

On support statements: I noticed that big.LITTLE is actually lacking from
SUPPORT.md.


> > Regarding the cache line size, I didn't suggest the change because it is 
> > more efficient. I suggested the patch because the current code to find 
> > the cache line size is wrong. Imagine there is a cache in the hierarchy 
> > that has a smaller cache line than your L1 cache. Then you would not 
> > clean/invalidate correctly that cache.

I didn't mean to imply that what you are suggesting is not important, or
less important than the purpose of patch. I just meant to say that this
patch is about removing the cacheline_bytes variable, it is not about
fixing the way we read the cacheline size. I like to keep one patch
doing one thing only.

The fix you are suggesting is important, in fact it is probably more
important than this series. I am OK writing a patch for it. It is just
that it is a separate issue, and should be fix separately.

I'll have a look at it and propose it a separate patch.


> >>>> +        and   r6, r6, #0x7
> >>>> +        add   r6, r6, #4
> >>>> +        mov   r7, #1
> >>>> +        lsl   r6, r7, r6
> >>>>            mov   r7, r3
> >>>>      1:      mcr   CP32(r7, DCCMVAC)
> >>>> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> >>>> index fa0ef70..edea300 100644
> >>>> --- a/xen/arch/arm/arm64/head.S
> >>>> +++ b/xen/arch/arm/arm64/head.S
> >>>> @@ -631,8 +631,14 @@ ENTRY(relocate_xen)
> >>>>            dsb   sy        /* So the CPU issues all writes to the 
> >>>> range */
> >>>>              mov   x9, x3
> >>>> -        ldr   x10, =cacheline_bytes /* x10 := step */
> >>>> -        ldr   x10, [x10]
> >>>> +
> >>>> +        mov   x10, #0
> >>>> +        msr   CSSELR_EL1, x10
> >>>> +        mrs   x10, CSSELR_EL1
> >>>> +        and   x10, x10, #0x7
> >>>> +        add   x10, x10, #4
> >>>> +        mov   x11, #1
> >>>> +        lsl   x10, x11, x10
> >>>
> >>> Please use dcache_line_size macro (see cache.S).
> >>
> >> Similarly, I would prefer to retain the same old behavior here, and
> >> fix it/improve it in a separate patch.
> > 
> > See above, you got the wrong end of the stick about the cache line size.
> 
> You might want to look at the following patch in Linux:
> 
> commit f91e2c3bd427239c198351f44814dd39db91afe0
> Author: Catalin Marinas <catalin.marinas@arm.com>
> Date:   Tue Dec 7 16:52:04 2010 +0100
> 
>     ARM: 6527/1: Use CTR instead of CCSIDR for the D-cache line size on ARMv7
> 
>     The current implementation of the dcache_line_size macro reads the L1
>     cache size from the CCSIDR register. This, however, is not guaranteed to
>     be the smallest cache line in the cache hierarchy. The patch changes to
>     the macro to use the more architecturally correct CTR register.
> 
>     Reported-by: Kevin Sapp <ksapp@quicinc.com>
>     Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>     Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>

Thank you for the pointer, I'll give it a look.
--8323329-717504448-1519169312=:19448
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-717504448-1519169312=:19448--
