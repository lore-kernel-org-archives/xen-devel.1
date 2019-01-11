From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Thu, 10 Jan 2019 18:14:07 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901101745560.27759@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <1547077324-9705-1-git-send-email-sstabellini@kernel.org>
 <CAF3u54A9soG-fjO0ys3hcgcZwXa_KmwrnW_yRDKuiWPaGx2ysQ@mail.gmail.com>
 <5C37013C020000780020C17D@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901100924400.15373@sstabellini-ThinkPad-X260>
 <CAF3u54A-1_cum6u-nXm4m+60=7tFF=Y1vnR-0+fEKg2y6_68rw@mail.gmail.com>
 <alpine.DEB.2.10.1901101311110.27759@sstabellini-ThinkPad-X260>
 <CAF3u54Cfx3fGXY-bg2fYb+i_5kOA8qjrzOtK3sFF8j9bHQve8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1253413750-1547171200=:27759"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bhUh=PT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ghmKp-0001r8-FM
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 02:14:11 +0000
In-Reply-To: <CAF3u54Cfx3fGXY-bg2fYb+i_5kOA8qjrzOtK3sFF8j9bHQve8A@mail.gmail.com>
Content-ID: <alpine.DEB.2.10.1901101746470.27759@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: jgross@suse.com
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, julien.grall@gmail.com, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1253413750-1547171200=:27759
Content-Type: TEXT/PLAIN; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.10.1901101746471.27759@sstabellini-ThinkPad-X260>

Hi Juergen, Jan,

I spoke with Julien: we are both convinced that the unsigned long
solution is best. But Julien also did some research and he thinks that
Jan's version (returning pointer type) not only does not help with
MISRA-C, but also doesn't solve the potential GCC problem either. A
description of the GCC issue is available here:

https://kristerw.blogspot.com/2016/12/pointer-comparison-invalid-optimization.html?m=1

(Also keep in mind that Linux uses the unsigned long solution to solve
the GCC issue, deviating from it doesn't seem wise.)

I would like to ask for a freeze exception until Monday/Tuesday next
week when Julien will be back, and he and his team will be able to
provide more evidence that the unsigned long solution is correct, while
the other solution is not correct.

Cheers,

Stefano


P.S.
v7 of the series, SYMBOL_HIDE returning pointer type
http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git certifications-7
v7 of the series, SYMBOL_HIDE returning unsigned long
http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git certifications-7-unsigned_long



On Thu, 10 Jan 2019, Julien Grall wrote:
> On Thu, 10 Jan 2019, 15:36 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       On Thu, 10 Jan 2019, Julien Grall wrote:
>       > On Thu, 10 Jan 2019, 12:29 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       >       On Thu, 10 Jan 2019, Jan Beulich wrote:
>       >       > >>> On 10.01.19 at 03:40, <julien.grall@gmail.com> wrote:
>       >       > > On Wed, 9 Jan 2019, 18:43 Stefano Stabellini, <sstabellini@kernel.org>
>       >       > > wrote:
>       >       > >
>       >       > >> Introduce a macro, SYMBOL, which is similar to RELOC_HIDE, but it is
>       >       > >> meant to be used everywhere symbols such as _stext and _etext are used
>       >       > >> in the code. It can take an array type as a parameter, and it returns
>       >       > >> the same type.
>       >       > >>
>       >       > >> SYMBOL is needed when accessing symbols such as _stext and _etext
>       >       > >> because the C standard forbids for both comparisons and substraction
>       >       > >> (see C Standard, 6.5.6 [ISO/IEC 9899:2011] and [1]) between pointers
>       >       > >> pointing to different objects. _stext, _etext, etc. are all pointers to
>       >       > >> different objects from ANCI C point of view.
>       >       > >>
>       >       > >
>       >       > > This does not make sense because you still return a pointer and therefore
>       >       > > the undefined behavior is still present.
>       >       > >
>       >       > > I really don't believe this patch is going to make the MISRA tool happy.
>       >       >
>       >       > Well, till now I've been assuming that no version of this series was
>       >       > posted without being certain the changes achieve the goal (of
>       >       > making that tool happy).
>       >
>       >       No, Jan: unfortunately we cannot re-run the scanning tool against any
>       >       version of Xen we wish to :-(
>       >
>       >       We cannot know in advance if a set of changes will make the tool happy
>       >       or not.
>       >
>       >       If I knew that SYMBOL returning the native point type as in v6 is
>       >       sufficient to make the tool happy, I wouldn't be here arguing. We cannot
>       >       know for sure until we commit the changes, then we ask PRQA to re-scan
>       >       against a more recent version of Xen. It is an heavy process and for
>       >       this reason I preferred the safer of the two approaches.
>       >
>       >
>       >
>       >       Anyway, I would rather get something in, even if insufficient, than
>       >       nothing. So I'll address all your comments based on returning the
>       >       pointer type, and submit a new version. The bothersome changes are the
>       >       ones to the call sites, and I would like to get those in no matter the
>       >       implementation of SYMBOL.
>       >
>       >
>       > It is not only insufficient but wrong when you read the commit message. You also were not convinced about this
>       approach. 
>       >
>       > I understand that we need to commit so we can get the result from the PRQA tool. However, we should have talked
>       with people
>       > knowing MISRA to understand whether it could work.
>       >
>       > You also didn't address my point on why Linux needs to go through unsigned long.
>       >
>       > So I don't think it is right to merge it without more ground.
>       >
>       > On that basis:
>       >
>       > Nacked-by: Julien Grall <julien.grall@arm.com>
> 
>       Hi Julien,
> 
>       I well understanding your thinking, I am not happy with this approach.
> 
>       However, changing all the call sites to use SYMBOL, even if SYMBOL does
>       not do what you and I think it should, is still a valuable change to
>       have:
> 
>       1) it clearly highlight all the related violations
>       2) it is a burdensome set of changes to maintain off-tree which will be
>          difficult to rebase and will bitrot quickly
>       3) it will be simple to change the implementation of SYMBOL afterwards
>          as needed
>       4) regardless of MISRA, we still have a problem with gcc and symbols
>          like _start and _end, see the comment on top of RELOC_HIDE in linux
>          (include/linux/compiler-gcc.h)
> 
> 
>       In fact, even not caring about C compliance, this series is still an
>       improvement, a fix to a potential compiler problem. On that basis alone,
>       I think it is a bad decision not to merge this series.
> 
> 
> From the different reading (see link in one of my previous), I don't believe it will help the compiler. I would be interested to
> know the rationale you think otherwise.
> 
> I am also worried that any change in the definition will require to investigate all the callsite. This is a call for missing one.
> 
> So it still feels to me we are rushing the series.
> 
> 
> 
>       To answer your other questions: yes, we need more information about this
>       compliance issue and MISRA, this is a good reason for committing the
>       series so that we can have the tool a re-scan. It is also a great way
>       to show the problem to a MISRA expert not familiar with Xen: "look at
>       the way SYMBOL is used through the code..."
> 
>       I don't know why Linux is using unsigned long, I looked at the commit
>       messages and comments but there isn't an explanation. However, it just
>       makes sense to me. That is how I would have implemented the solution as
>       well. Jan's approach looks very much like a partial workaround to me.
> 
> 
> On one of my previous e-mail I provided a URL giving a bit more explanation on the problem.
> 
> 
> 
>       In conclusion, I still agree with you and disagree with Jan, but it
>       would be good to make progress regardless:
> 
>       - I think a series introducing the usage of SYMBOL through the code
>         should go in 4.12 regardless of the implementation of SYMBOL
>       - even the bad implementation of SYMBOL would still help with the
>         potential gcc problems mentioned by Linux, if not with certifications
> 
> 
> See above. I clearly don't believe it is solving anything. It will actually make any change of SYMBOL more difficult if you
> decide to switch to unsigned long.
> 
> 
> 
>       For everybody's reference, I have pushed both versions of the series,
>       the one returning the native type, as asked by Jan:
>       http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git certifications-7
> 
>       And the one returning unsigned long, as Julien and I would like:
>       http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git certifications-7-unsigned_long
> 
> 
>       Hoping we won't get stuck on this, regards,
--8323329-1253413750-1547171200=:27759
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-1253413750-1547171200=:27759--
