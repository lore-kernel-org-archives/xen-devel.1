From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 02/15] argo: introduce the argo_op
 hypercall boilerplate
Date: Wed, 6 Feb 2019 11:35:24 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902061123370.2723@sstabellini-ThinkPad-X260>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-3-git-send-email-christopher.w.clark@gmail.com>
 <alpine.DEB.2.10.1902041608190.22962@sstabellini-ThinkPad-X260>
 <5C5945F70200007800213D6E@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1902050911350.22962@sstabellini-ThinkPad-X260>
 <CAF3u54BZKRcTWTJkKyUb+wZqTwAcAn=GWDDOHKu37BJyvWR6=g@mail.gmail.com>
 <alpine.DEB.2.10.1902051145190.22962@sstabellini-ThinkPad-X260>
 <58a03a79-3622-5e3c-42fe-87094a9a01c1@arm.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-845281846-1549481725=:2723"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+4Jx=QN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1grSyl-0002Z0-Ei
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 19:35:27 +0000
In-Reply-To: <58a03a79-3622-5e3c-42fe-87094a9a01c1@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, James McKenzie <james@bromium.com>, Julien Grall <julien.grall@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-845281846-1549481725=:2723
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 6 Feb 2019, Julien Grall wrote:
> Hi Stefano,
> 
> On 2/5/19 9:34 PM, Stefano Stabellini wrote:
> > On Tue, 5 Feb 2019, Julien Grall wrote:
> > > Sorry for the formatting.
> > > 
> > > On Tue, 5 Feb 2019, 20:04 Stefano Stabellini, <sstabellini@kernel.org>
> > > wrote:
> > >        On Tue, 5 Feb 2019, Jan Beulich wrote:
> 
> > > But I am afraid this is not correct. Upper 32-bit of the register will be
> > > zeroed when writing a 32-bit value. So we never rely on
> > > the register to be zeroed on boot.
> > 
> > Thank you for checking your emails. I found the reference in the ARM
> > ARM, although it took me several minutes!
> > 
> >    "The upper 32 bits of the destination register are set to zero."
> > 
> > from C6.1.1 (ID092916).
> 
> Actually, you were right and I was wrong. This paragraph only talks about
> 32-bit access from AArch64. I found a paragraph on the Arm Arm (D1.20.2 in DDI
> 0487D.a) stating that the upper 32-bits can either "be zeroed, or hold the
> value that the same architectural register held before any AArch32".

Understanding the ARM ARM is really difficult, I am glad we clarified
this (and that my memory didn't completely fail me yet).


> So we do rely the upper bits are zeroed when the vCPU is created. The
> registers are set by arch_set_info_guest via a context. The context can be set
> by either virtual PSCI call CPU_ON or via DOMCTL setvcpucontext (so the
> tools).
> 
> We fully control PSCI call CPU_ON and zero the registers. So no question here.
> 
> For the DOMCTL, per XSA-77, we trust how operation will be used. The toolstack
> (vcpu_arm32 libxc/xc_dom_arm.c) will zero the context before. So I think we
> should be safe here.
> 
> However, I think we should add some sanity check in arch_set_info_guest for
> our peace of mind. For guest entry/exit, rather than zero the upper 32-bits I
> would also add sanity check in enter_hypervisor_head and leave_hypervisor_tail
> but only in debug build. Any opinions?

Definitely we should have sanity checks.


> > >        FYI do_memory_op is declared as follows on the Linux side for arm32
> > > and
> > >        arm64:
> > > 
> > >          int HYPERVISOR_memory_op(unsigned int cmd, void *arg);
> > > 
> > >        When I went through all existing hypercalls to introduce them on
> > > arm32,
> > >        I checked that we didn't actually need 64bit parameters, especially
> > > for
> > >        cmd. I introduced them as int instead of long on the Linux side
> > > when
> > >        possible (see include/xen/arm/hypercall.h), but I didn't attempt to
> > >        modify all the existing Xen headers.
> > > 
> > > 
> > > I don't understand your concern with unsigned long. We use them in
> > > __DEFINE_XEN_GUEST_HANDLE that are in turn to describe guest
> > > pointer.
> > 
> > __DEFINE_XEN_GUEST_HANDLE is for pointers inside memory structs, and we
> > defined it as:
> >   * XEN_GUEST_HANDLE represents a guest pointer, when passed as a field
> >   * in a struct in memory. On ARM is always 8 bytes sizes and 8 bytes
> >   * aligned.
> > 
> > You probably meant XEN_GUEST_HANDLE_PARAM which is the one for pointers
> > when passed as hypercall parameters, that is defined as:
> >   * XEN_GUEST_HANDLE_PARAM represents a guest pointer, when passed as an
> >   * hypercall argument. It is 4 bytes on aarch32 and 8 bytes on aarch64.
> 
> Yes, I meant XEN_GUEST_HANDLE_PARAM. I should have waited to have my laptop in
> hand rather looking on my phone :).
> 
> > 
> > Yes, pointers as hypercalls parameters are the exception to the
> > single-ABI rule and we introduced XEN_GUEST_HANDLE_PARAM purposely to
> > handle them. However, I am not sure we took into account zero-extension
> > when we discussed hypercalls parameters for arm back in the day when I
> > wrote include/xen/arm/hypercall.h.
> 
> I am not sure to follow your thoughts about taking into account zero-extension
> in the Linux header. Could you expand it?
> 
> In the official public headers, I can't find anything telling you the size of
> each arguments and the number of arguments. Instead you have to look at Xen
> code to know the exact number of arguments and the size. Did I miss anything?

No, it is like you wrote. I think I should have pushed the discussion
further and added more information to the Xen public headers back in
those days.


> Regarding Argo, there seem to have some kind of documentation per-hypercalls
> although some does not specify the size. But I can't find anything telling you
> the command number is in arg0. The mapping to from argN the hypercalls
> arguments is also not that clear.
> 
> But I guess this kind of improvement can be done afterwards.
> 
> > > The problem with explicitly sized (i.e 32-bit) is you ignore the top
> > > 32-bit. This means you can't check the upper bits are always
> > > 0 and would prevent extension.
> > 
> > That is true. I implicitly assumed that our desire for a common
> > 32-bit/64-bit ABI would not apply just to structs in memory (where we
> > always define unsigned long and pointers as 64-bit) but also seamlessly
> > apply to hypercalls parameters (except for pointers as per the above).
> 
> There are no documentation in the public interface about the size of each
> arguments. When looking at traps.c, we assume that hypercalls arguments are
> the size of a register:
> 
> typedef register_t (*arm_hypercall_fn_t)(register_t, register_t, register_t,
> register_t, register_t).
> 
> So for 64-bit Xen, the hypercalls arguments will be 64-bit.
> 
> If we want to impose 32-bit value, then we need to update the callback, add
> sanity check (?) and probably document it.

Good point.


> > There are still reasons for choosing unsigned int for cases like this
> > where unsigned long is not actually necessary, but not a strong as I
> > previously thought. For example, it could be natural to introduce a
> > value for a cmd or a flag parameter not available to 32-bit guests (i.e.
> > 0xff00000000000000) by mistake, although I admit that the related Xen
> > code should throw a warning when compiled for arm32.
> 
> I think the compiler should catch it. However, I think allowing up to 64-bit
> arguments is nice to have if we want to introduce extension for 64-bit only
> guest (i.e larger buffer...).

That's true. In this case, Christopher was telling me the arguments
could easily be 32bit only.


> > In conclusion, if you and other maintainers prefer unsigned long I'll
> > drop my reservation.
> 
> The summary of my e-mail is:
>     - we need to add sanity check (or zero) upper-bits for 32-bit guest
>     - unsigned long should be fine for 64-bit only features

I take that you mean that unsigned long should be fine, and would also
allow us to introduce 64-bit only features in the future, right? You are
*not* saying that unsigned long should only be used with 64-bit
guests/hypervisor?


>     - we need to document the behavior of each hypercall and provide
> guidelines for new one.
> 
> None of this is specific to Argo and I would be happy to defer this as a
> follow-up series.

Assuming my understanding is right, I agree with you.
--8323329-845281846-1549481725=:2723
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-845281846-1549481725=:2723--
