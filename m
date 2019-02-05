From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 02/15] argo: introduce the argo_op
 hypercall boilerplate
Date: Tue, 5 Feb 2019 13:34:15 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1902051145190.22962@sstabellini-ThinkPad-X260>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-3-git-send-email-christopher.w.clark@gmail.com>
 <alpine.DEB.2.10.1902041608190.22962@sstabellini-ThinkPad-X260>
 <5C5945F70200007800213D6E@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1902050911350.22962@sstabellini-ThinkPad-X260>
 <CAF3u54BZKRcTWTJkKyUb+wZqTwAcAn=GWDDOHKu37BJyvWR6=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1209993925-1549396638=:22962"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fYof=QM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gr8ME-0001Jz-Sl
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 21:34:18 +0000
In-Reply-To: <CAF3u54BZKRcTWTJkKyUb+wZqTwAcAn=GWDDOHKu37BJyvWR6=g@mail.gmail.com>
Content-ID: <alpine.DEB.2.10.1902051200070.22962@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1209993925-1549396638=:22962
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1902051200071.22962@sstabellini-ThinkPad-X260>

On Tue, 5 Feb 2019, Julien Grall wrote:
> Sorry for the formatting.
> 
> On Tue, 5 Feb 2019, 20:04 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       On Tue, 5 Feb 2019, Jan Beulich wrote:
>       > >>> On 05.02.19 at 01:39, <sstabellini@kernel.org> wrote:
>       > > On Wed, 30 Jan 2019, Christopher Clark wrote:
>       > >> +#include <xen/errno.h>
>       > >> +#include <xen/guest_access.h>
>       > >> +
>       > >> +long
>       > >> +do_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
>       > >> +           XEN_GUEST_HANDLE_PARAM(void) arg2, unsigned long arg3,
>       > >> +           unsigned long arg4)
>       > >> +{
>       > >> +    return -ENOSYS;
>       > >> +}
>       > >> +
>       > >> +#ifdef CONFIG_COMPAT
>       > >> +long
>       > >> +compat_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
>       > >> +               XEN_GUEST_HANDLE_PARAM(void) arg2, unsigned long arg3,
>       > >> +               unsigned long arg4)
>       > >> +{
>       > >> +    return -ENOSYS;
>       > >> +}
>       > >> +#endif
>       > >
>       > > From an ARM perspective, it is not a good idea to use unsigned long as
>       > > hypercall parameters because they are going to be of different size on
>       > > arm32 and arm64. On ARM, there is no COMPAT code, and we try to keep a
>       > > single stable ABI across 32bit and 64bit hypervisors (pointers size
>       > > being the only exception and we deal with that using
>       > > XEN_GUEST_HANDLE_PARAM).
>       > >
>       > > For this reason, given that we don't need arg3 and arg4 to actually be
>       > > 64bit, it would be best to use explicitly sized integers instead. I
>       > > would use uint32_t or unsigned int for arg3 and arg4. That way, there
>       > > are not going to be any ABI compatibility issues between arm32 and arm64
>       > > and we could run, and even migrate, 32bit guests to a 64bit hypervisor
>       > > without problems.
>       > >
>       > > I know that Andrew expressed concerns about using unsigned int before,
>       > > but don't we just need to make sure we are properly ignoring the top
>       > > 32bit of arg3 and arg4 when the hypervisor is compiled 64bit?
>       >
>       > Are you saying that hypercall arguments made by a 32-bit guest on a
>       > 64-bit hypervisor do not get zero-extended before reaching the C layer
>       > (or more specifically the individual handlers, since on x86 we deal with
>       > the necessary zero-extension in C nowadays)? What about
>       > do_memory_op()'s first parameter then?
> 
>       If I remember right, there is no zero-extension, however, they should
>       still be zero because they have always been zero -- nothing should
>       change them in the VM lifetime. However, it is not great to rely on
>       that, that is why I suggested to clear them on entry as an alternative,
>       and also to have a single ABI between 32bit and 64bit.
> 
> 
> I can't find the wording again on the Arm Arm (the pdf reader on the phone is not great).
> 
> But I am afraid this is not correct. Upper 32-bit of the register will be zeroed when writing a 32-bit value. So we never rely on
> the register to be zeroed on boot.

Hi Julien,

Thank you for checking your emails. I found the reference in the ARM
ARM, although it took me several minutes!

  "The upper 32 bits of the destination register are set to zero."

from C6.1.1 (ID092916).


>       FYI do_memory_op is declared as follows on the Linux side for arm32 and
>       arm64:
> 
>         int HYPERVISOR_memory_op(unsigned int cmd, void *arg);
> 
>       When I went through all existing hypercalls to introduce them on arm32,
>       I checked that we didn't actually need 64bit parameters, especially for
>       cmd. I introduced them as int instead of long on the Linux side when
>       possible (see include/xen/arm/hypercall.h), but I didn't attempt to
>       modify all the existing Xen headers.
> 
> 
> I don't understand your concern with unsigned long. We use them in __DEFINE_XEN_GUEST_HANDLE that are in turn to describe guest
> pointer.

__DEFINE_XEN_GUEST_HANDLE is for pointers inside memory structs, and we
defined it as:
 * XEN_GUEST_HANDLE represents a guest pointer, when passed as a field
 * in a struct in memory. On ARM is always 8 bytes sizes and 8 bytes
 * aligned.

You probably meant XEN_GUEST_HANDLE_PARAM which is the one for pointers
when passed as hypercall parameters, that is defined as:
 * XEN_GUEST_HANDLE_PARAM represents a guest pointer, when passed as an
 * hypercall argument. It is 4 bytes on aarch32 and 8 bytes on aarch64.

Yes, pointers as hypercalls parameters are the exception to the
single-ABI rule and we introduced XEN_GUEST_HANDLE_PARAM purposely to
handle them. However, I am not sure we took into account zero-extension
when we discussed hypercalls parameters for arm back in the day when I
wrote include/xen/arm/hypercall.h.


> The problem with explicitly sized (i.e 32-bit) is you ignore the top 32-bit. This means you can't check the upper bits are always
> 0 and would prevent extension.

That is true. I implicitly assumed that our desire for a common
32-bit/64-bit ABI would not apply just to structs in memory (where we
always define unsigned long and pointers as 64-bit) but also seamlessly
apply to hypercalls parameters (except for pointers as per the above).

There are still reasons for choosing unsigned int for cases like this
where unsigned long is not actually necessary, but not a strong as I
previously thought. For example, it could be natural to introduce a
value for a cmd or a flag parameter not available to 32-bit guests (i.e.
0xff00000000000000) by mistake, although I admit that the related Xen
code should throw a warning when compiled for arm32.

In conclusion, if you and other maintainers prefer unsigned long I'll
drop my reservation.
--8323329-1209993925-1549396638=:22962
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1209993925-1549396638=:22962--
