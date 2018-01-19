From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] fix potential null dereference
Date: Thu, 18 Jan 2018 16:18:29 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1801181612190.6440@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1801121538050.5767@sstabellini-ThinkPad-X260>
 <5ba8b0e5-21a9-1999-5aff-f9b9062827f6@linaro.org>
 <5A5C72F2020000780019EAB8@prv-mh.provo.novell.com>
 <alpine.DEB.2.10.1801151049130.5767@sstabellini-ThinkPad-X260>
 <5A5DB3A8020000780019EF05@prv-mh.provo.novell.com>
 <alpine.DEB.2.10.1801181355550.6440@sstabellini-ThinkPad-X260>
 <97c51ab4-2895-ddf5-88d9-618eca0f3591@citrix.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-802112096-1516320886=:6440"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jw1q=eo=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ecKOD-0001ju-R9
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 00:18:37 +0000
In-Reply-To: <97c51ab4-2895-ddf5-88d9-618eca0f3591@citrix.com>
Content-ID: <alpine.DEB.2.10.1801181615430.6440@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-802112096-1516320886=:6440
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1801181615431.6440@sstabellini-ThinkPad-X260>

On Thu, 18 Jan 2018, Andrew Cooper wrote:
> On 18/01/2018 22:11, Stefano Stabellini wrote:
> > On Tue, 16 Jan 2018, Jan Beulich wrote:
> >>>>> On 15.01.18 at 19:51, <sstabellini@kernel.org> wrote:
> >>> On Mon, 15 Jan 2018, Jan Beulich wrote:
> >>>>>>> On 13.01.18 at 07:21, <julien.grall@linaro.org> wrote:
> >>>>> On 01/12/2018 11:40 PM, Stefano Stabellini wrote:
> >>>>>> handles can theoretically be NULL, check for it explicitly before
> >>>>>> dereferencing it.
> >>>>> I doubt handles could be NULL if LocateHandle succeed. This seems to be 
> >>>>> confirmed by the spec (Page 208 in UEFI spec 2.7).
> >>>>>
> >>>>> So I am not entirely convince we should add yet another check in the 
> >>>>> code. An ASSERT might be better.
> >>>> Indeed if there is a platform where NULL is coming back in the
> >>>> success case, that platform should be named as a justification
> >>>> in the commit message. Otherwise I don't see the value of this
> >>>> change.
> >>> Truthfully, it is mostly to silence Coverity. We can all appreciate when
> >>> static analysts cannot find defects in the code.
> >> So what does Coverity dislike here (the more that this is on a
> >> boot path, i.e. not exploitable by guests at all in the first place)?
> >> Merely the NULL pointer? What if the interface gave back a
> >> pointer with a value of 0x123456789abcdef?
> > Coverity complains "Dereferencing null pointer handles". The code path
> > to get to that point is the following, as explained by Coverity:
> >
> >   - handles is set to NULL at the beginning of efi_get_gop
> >   - status is not EFI_BUFFER_TOO_SMALL, AllocatePool is not called, handles is still NULL
> >   - later we call efi_bs->HandleProtocol(handles[i], "Dereferencing null pointer handles"
> >
> > Given that in the first call to LocateHandle we pass size == 0, by the
> > spec I don't see how it can return anything other than EFI_BUFFER_TOO_SMALL.
> >
> > In other words, if LocateHandle complies, then the code is correct. I'll
> > mark it as won't fix.
> 
> EFI is full of UB because of needing to pass and cast pointers with
> *(void **), and Coverity has a hard time following these (as a direct
> consequence of the compilers having a hard time following them).
> 
> As for the spec however, that is irrelevant.  The point is that there
> are billions of other integers which could be returned which aren't
> TOO_SMALL and OK, and without the EFI firmware source code to inspect,
> Coverity can't know.
> 
> Also, I'd like to see any EFI anywhere which successfully implements the
> spec...

I guess the question is: do we want to make Xen more resilient against
possible firmware malfunctioning? In this specific case, a bug in the
firmware causes Xen to crash at boot, while with this patch Xen
could try to run past it. There are pros and cons both ways, and I
don't have a strong opinion on the approach to take in general. However,
in this specific case, given the simplicity of this patch, I would be
tempted to make the change.
--8323329-802112096-1516320886=:6440
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-802112096-1516320886=:6440--
