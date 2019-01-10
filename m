From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Thu, 10 Jan 2019 09:22:16 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901100917130.15373@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <1547077324-9705-1-git-send-email-sstabellini@kernel.org>
 <CAF3u54A9soG-fjO0ys3hcgcZwXa_KmwrnW_yRDKuiWPaGx2ysQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-626841642-1547140936=:15373"
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GXHB=PS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ghe27-0003mw-GC
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 17:22:19 +0000
In-Reply-To: <CAF3u54A9soG-fjO0ys3hcgcZwXa_KmwrnW_yRDKuiWPaGx2ysQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@gmail.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, andrew.cooper3@citrix.com, julien.grall@arm.com, JBeulich@suse.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-626841642-1547140936=:15373
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 9 Jan 2019, Julien Grall wrote:
> Hi,
> Sorry for the formatting.
> 
> On Wed, 9 Jan 2019, 18:43 Stefano Stabellini, <sstabellini@kernel.org> wrote:
>       Introduce a macro, SYMBOL, which is similar to RELOC_HIDE, but it is
>       meant to be used everywhere symbols such as _stext and _etext are used
>       in the code. It can take an array type as a parameter, and it returns
>       the same type.
> 
>       SYMBOL is needed when accessing symbols such as _stext and _etext
>       because the C standard forbids for both comparisons and substraction
>       (see C Standard, 6.5.6 [ISO/IEC 9899:2011] and [1]) between pointers
>       pointing to different objects. _stext, _etext, etc. are all pointers to
>       different objects from ANCI C point of view.
> 
> 
> This does not make sense because you still return a pointer and therefore the undefined behavior is still present.
> 
> I really don't believe this patch is going to make the MISRA tool happy. Furthermore, IIRC, Linux to returns unsigned long. So I
> would like to understand why the trick is no needed for us...
> 
> At that stage, we should probably involve MlSRA folks (PRQA) to have a better understanding on what is expected.

Julien, thanks for chiming in. Yes, I completely agree with you.

My thinking for the current changes is that they are better than nothing
as they clearly mark all problematic sites with "SYMBOL", even if the
implementation of SYMBOL might not be good enough. Then, we double-check
with PRQA and others, once we get their feedback we can still change the
return type of SYMBOL if we need to, and it will be easy to do at that
point (it only took me 1h yesterday to make the opposite change).



>       To work around potential C compiler issues (which have actually
>       been found, see the comment on top of RELOC_HIDE in Linux), and to help
>       with certifications, let's introduce some syntactic sugar to be used in
>       following patches.
> 
> 
>       [1]https://wiki.sei.cmu.edu/confluence/display/c/ARR36-C.+Do+not+subtract+or+compare+two+pointers+that+do+not+refer+to+the+same+arr
>       ay
> 
>       Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
>       CC: JBeulich@suse.com
>       CC: andrew.cooper3@citrix.com
>       CC: wei.liu2@citrix.com
>       ---
>       Changes in v6:
>       - drop acks
>       - don't use RELOC_HIDE for the implementation
>       - return native type from SYMBOL
> 
>       Changes in v4:
>       - add acked-bys
>       - remove unneeded parenthesis
> 
>       Changes in v3:
>       - improve commit message
>       - rename __symbol to SYMBOL to avoid name space violations
> 
>       Changes in v2:
>       - do not cast return to char*
>       - move to common header
>       ---
>        xen/include/xen/compiler.h | 10 ++++++++++
>        1 file changed, 10 insertions(+)
> 
>       diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
>       index ff6c0f5..d4c856c 100644
>       --- a/xen/include/xen/compiler.h
>       +++ b/xen/include/xen/compiler.h
>       @@ -99,6 +99,16 @@
>            __asm__ ("" : "=r"(__ptr) : "0"(ptr));      \
>            (typeof(ptr)) (__ptr + (off)); })
> 
>       +/*
>       + * Similar to RELOC_HIDE, but written to be used with symbols such as
>       + * _stext and _etext to avoid undefined behavior comparing pointers to
>       + * different objects. It can handle array types.
>       + */
>       +#define SYMBOL(ptr)                               \
>       +  ({ unsigned long __ptr;                       \
>       +    __asm__ ("" : "=r"(__ptr) : "0"(ptr));      \
>       +    (typeof(*(ptr)) *) (__ptr); })
>       +
>        #ifdef __GCC_ASM_FLAG_OUTPUTS__
>        # define ASM_FLAG_OUT(yes, no) yes
>        #else
>       --
>       1.9.1
> 
> 
>       _______________________________________________
>       Xen-devel mailing list
>       Xen-devel@lists.xenproject.org
>       https://lists.xenproject.org/mailman/listinfo/xen-devel
> 
> 
> 
--8323329-626841642-1547140936=:15373
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--8323329-626841642-1547140936=:15373--
