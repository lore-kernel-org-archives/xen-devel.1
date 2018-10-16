From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 3/4] xen: introduce __symbol
Date: Tue, 16 Oct 2018 21:01:26 +0800 (CST)
Message-ID: <alpine.DEB.2.10.1810162037480.5150@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1810142125100.4859@sstabellini-ThinkPad-X260>
 <1539597367-25807-3-git-send-email-sstabellini@kernel.org>
 <066c1266-8e5d-ae29-e5be-cf5271e7606c@arm.com>
 <alpine.DEB.2.10.1810160917290.4859@sstabellini-ThinkPad-X260>
 <3c36b1c6-f676-55b3-854b-c5ec79ce540b@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-220654993-1539693925=:5150"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pf7c=m4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gCOyc-0002di-P0
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 13:01:34 +0000
In-Reply-To: <3c36b1c6-f676-55b3-854b-c5ec79ce540b@citrix.com>
Content-ID: <alpine.DEB.2.10.1810162046330.5150@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-220654993-1539693925=:5150
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1810162046331.5150@sstabellini-ThinkPad-X260>

On Tue, 16 Oct 2018, Andrew Cooper wrote:
> On 16/10/18 02:34, Stefano Stabellini wrote:
> > On Mon, 15 Oct 2018, Julien Grall wrote:
> >> Hi,
> >>
> >> Please use scripts/get_maintainers.pl to CC relevant maintainers.
> >>
> >> On 15/10/2018 10:56, Stefano Stabellini wrote:
> >>> Introduce a macro, __symbol, which is a simple wrapper around RELOC_HIDE
> >>> to be used everywhere symbols such as _stext and _etext are used in the
> >>> code.
> >>>
> >>> RELOC_HIDE is needed when accessing symbols such as _stext and _etext
> >>> because the C standard forbids comparisons between pointers pointing to
> >>> different objects. _stext, _etext, etc. are all pointers to different
> >>> objects from ANCI C point of view.
> >>>
> >>> To work around potential C compiler issues (which have actually
> >>> been found, see the comment on top of RELOC_HIDE in Linux), and to help
> >>> with certifications, let's introduce some syntactic sugar to be used in
> >>> following patches.
> >>>
> >>> Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
> >>> ---
> >>>   xen/include/asm-arm/mm.h   | 6 ++++++
> >>>   xen/include/asm-x86/page.h | 6 ++++++
> >>>   2 files changed, 12 insertions(+)
> >>>
> >>> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
> >>> index 940b74b..02ce05a 100644
> >>> --- a/xen/include/asm-arm/mm.h
> >>> +++ b/xen/include/asm-arm/mm.h
> >>> @@ -284,6 +284,12 @@ static inline uint64_t gvirt_to_maddr(vaddr_t va,
> >>> paddr_t *pa,
> >>>   #define __mfn_to_virt(mfn) (maddr_to_virt((paddr_t)(mfn) << PAGE_SHIFT))
> >>>     /*
> >>> + * Use RELOC_HIDE with symbols such as _stext and _etext to avoid errors
> >>> + * on comparing pointers to different objects
> >>> + */
> >>> +#define __symbol(x)         ((char *)RELOC_HIDE((unsigned long)(x), 0))
> >> There are no different between arm and x86. A better place would be
> >> xen/compiler.h (or something common).
> > OK
> >
> >
> >> But, after this patch, there are even more chance the compiler will consider
> >> that 2 _symbol(...) will come from different objects. So how is this meant to
> >> help here?
> > I think the mistake was to cast the return to char*. If I remove the
> > cast, as Andrew suggested, then any comparison would be a comparison
> > between unsigned long, that should be accepted and safe.
> >
> > However, the parameter to RELOC_HIDE has to be casted to unsigned long,
> > because most often we pass char*:
> >
> > /local/repos/xen-upstream/xen/include/xen/compiler.h:100:5: error: cast specifies array type
> >      (typeof(ptr)) (__ptr + (off)); })
> >
> > So I think the __symbol macro should be:
> >
> > +#define __symbol(x)         (RELOC_HIDE((unsigned long)(x), 0))
> >
> 
> I don't see why the unsigned long cast is needed.  What is wrong by
> having "char *ptr + 0" which is legal pointer arithmetic, and has well
> defined behaviour?

The issue is that _stext is defined as char _stext[], so
__symbol(_stext) wouldn't work because _stext is an array type. As I
pasted above the error is "cast specifies array type". I guess it would
have to be __symbol(&_stext[0]) everywhere.

Also, I don't think it is a good idea for __symbol to return a pointer,
because then we are still left with the original issue of comparing
pointers of different sizes. We just moved the issue from the original
pointers to the ones returned by RELOC_HIDE.


> If it is necessary, then you need a (typeof(x)) cast again on the
> outside, because the unsigned long cast causes RELOC_HIDE's typeof to be
> wrong overall.

I am not sure I follow you here, do you mean:

  ((typeof(x)) RELOC_HIDE((unsigned long)(x), 0)

If so, I think it is best to have RELOC_HIDE return unsigned long (no
outside cast), hence removing all issues of comparing pointers to
different objects. Then, I'll adjust the few call sites that need
changes because of the char* -> unsigned long conversion. I have
already modified patch #4 following this strategy and the modifications
required were very few.
--8323329-220654993-1539693925=:5150
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-220654993-1539693925=:5150--
