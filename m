From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Wed, 9 Jan 2019 21:40:50 -0500
Message-ID: <CAF3u54A9soG-fjO0ys3hcgcZwXa_KmwrnW_yRDKuiWPaGx2ysQ@mail.gmail.com>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <1547077324-9705-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2597167114017476526=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KFn8=PS=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ghQHJ-0005v6-Mh
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 02:41:05 +0000
Received: by mail-ua1-x941.google.com with SMTP id d21so3125452uap.9
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jan 2019 18:41:03 -0800 (PST)
In-Reply-To: <1547077324-9705-1-git-send-email-sstabellini@kernel.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, wei.liu2@citrix.com, andrew.cooper3@citrix.com, julien.grall@arm.com, JBeulich@suse.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============2597167114017476526==
Content-Type: multipart/alternative; boundary="0000000000006c42b0057f1182f0"

--0000000000006c42b0057f1182f0
Content-Type: text/plain; charset="UTF-8"

Hi,

Sorry for the formatting.

On Wed, 9 Jan 2019, 18:43 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> Introduce a macro, SYMBOL, which is similar to RELOC_HIDE, but it is
> meant to be used everywhere symbols such as _stext and _etext are used
> in the code. It can take an array type as a parameter, and it returns
> the same type.
>
> SYMBOL is needed when accessing symbols such as _stext and _etext
> because the C standard forbids for both comparisons and substraction
> (see C Standard, 6.5.6 [ISO/IEC 9899:2011] and [1]) between pointers
> pointing to different objects. _stext, _etext, etc. are all pointers to
> different objects from ANCI C point of view.
>

This does not make sense because you still return a pointer and therefore
the undefined behavior is still present.

I really don't believe this patch is going to make the MISRA tool happy.
Furthermore, IIRC, Linux to returns unsigned long. So I would like to
understand why the trick is no needed for us...

At that stage, we should probably involve MlSRA folks (PRQA) to have a
better understanding on what is expected.

Cheers,


> To work around potential C compiler issues (which have actually
> been found, see the comment on top of RELOC_HIDE in Linux), and to help
> with certifications, let's introduce some syntactic sugar to be used in
> following patches.


> [1]
> https://wiki.sei.cmu.edu/confluence/display/c/ARR36-C.+Do+not+subtract+or+compare+two+pointers+that+do+not+refer+to+the+same+array
>
> Signed-off-by: Stefano Stabellini <stefanos@xilinx.com>
> CC: JBeulich@suse.com
> CC: andrew.cooper3@citrix.com
> CC: wei.liu2@citrix.com
> ---
> Changes in v6:
> - drop acks
> - don't use RELOC_HIDE for the implementation
> - return native type from SYMBOL
>
> Changes in v4:
> - add acked-bys
> - remove unneeded parenthesis
>
> Changes in v3:
> - improve commit message
> - rename __symbol to SYMBOL to avoid name space violations
>
> Changes in v2:
> - do not cast return to char*
> - move to common header
> ---
>  xen/include/xen/compiler.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
> index ff6c0f5..d4c856c 100644
> --- a/xen/include/xen/compiler.h
> +++ b/xen/include/xen/compiler.h
> @@ -99,6 +99,16 @@
>      __asm__ ("" : "=r"(__ptr) : "0"(ptr));      \
>      (typeof(ptr)) (__ptr + (off)); })
>
> +/*
> + * Similar to RELOC_HIDE, but written to be used with symbols such as
> + * _stext and _etext to avoid undefined behavior comparing pointers to
> + * different objects. It can handle array types.
> + */
> +#define SYMBOL(ptr)                               \
> +  ({ unsigned long __ptr;                       \
> +    __asm__ ("" : "=r"(__ptr) : "0"(ptr));      \
> +    (typeof(*(ptr)) *) (__ptr); })
> +
>  #ifdef __GCC_ASM_FLAG_OUTPUTS__
>  # define ASM_FLAG_OUT(yes, no) yes
>  #else
> --
> 1.9.1
>
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--0000000000006c42b0057f1182f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>Sorry for the formatting.<br><br><div class=3D"gmail=
_quote"><div dir=3D"ltr">On Wed, 9 Jan 2019, 18:43 Stefano Stabellini, &lt;=
<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">Introduce a macro, SYMBOL, whi=
ch is similar to RELOC_HIDE, but it is<br>
meant to be used everywhere symbols such as _stext and _etext are used<br>
in the code. It can take an array type as a parameter, and it returns<br>
the same type.<br>
<br>
SYMBOL is needed when accessing symbols such as _stext and _etext<br>
because the C standard forbids for both comparisons and substraction<br>
(see C Standard, 6.5.6 [ISO/IEC 9899:2011] and [1]) between pointers<br>
pointing to different objects. _stext, _etext, etc. are all pointers to<br>
different objects from ANCI C point of view.<br></blockquote></div></div><d=
iv><br></div><div>This does not make sense because you still return a point=
er and therefore the undefined behavior is still present.</div><div><br></d=
iv><div>I really don&#39;t believe this patch is going to make the MISRA to=
ol happy. Furthermore, IIRC, Linux to returns unsigned long. So I would lik=
e to understand why the trick is no needed for us...</div><div><br></div><d=
iv>At that stage, we should probably involve MlSRA folks (PRQA) to have a b=
etter understanding on what is expected.</div><div><br></div><div>Cheers,<b=
r><br></div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
To work around potential C compiler issues (which have actually<br>
been found, see the comment on top of RELOC_HIDE in Linux), and to help<br>
with certifications, let&#39;s introduce some syntactic sugar to be used in=
<br>
following patches.</blockquote></div></div><div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
[1] <a href=3D"https://wiki.sei.cmu.edu/confluence/display/c/ARR36-C.+Do+no=
t+subtract+or+compare+two+pointers+that+do+not+refer+to+the+same+array" rel=
=3D"noreferrer" target=3D"_blank">https://wiki.sei.cmu.edu/confluence/displ=
ay/c/ARR36-C.+Do+not+subtract+or+compare+two+pointers+that+do+not+refer+to+=
the+same+array</a><br>
<br>
Signed-off-by: Stefano Stabellini &lt;<a href=3D"mailto:stefanos@xilinx.com=
" target=3D"_blank">stefanos@xilinx.com</a>&gt;<br>
CC: <a href=3D"mailto:JBeulich@suse.com" target=3D"_blank">JBeulich@suse.co=
m</a><br>
CC: <a href=3D"mailto:andrew.cooper3@citrix.com" target=3D"_blank">andrew.c=
ooper3@citrix.com</a><br>
CC: <a href=3D"mailto:wei.liu2@citrix.com" target=3D"_blank">wei.liu2@citri=
x.com</a><br>
---<br>
Changes in v6:<br>
- drop acks<br>
- don&#39;t use RELOC_HIDE for the implementation<br>
- return native type from SYMBOL<br>
<br>
Changes in v4:<br>
- add acked-bys<br>
- remove unneeded parenthesis<br>
<br>
Changes in v3:<br>
- improve commit message<br>
- rename __symbol to SYMBOL to avoid name space violations<br>
<br>
Changes in v2:<br>
- do not cast return to char*<br>
- move to common header<br>
---<br>
=C2=A0xen/include/xen/compiler.h | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h<br>
index ff6c0f5..d4c856c 100644<br>
--- a/xen/include/xen/compiler.h<br>
+++ b/xen/include/xen/compiler.h<br>
@@ -99,6 +99,16 @@<br>
=C2=A0 =C2=A0 =C2=A0__asm__ (&quot;&quot; : &quot;=3Dr&quot;(__ptr) : &quot=
;0&quot;(ptr));=C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0(typeof(ptr)) (__ptr + (off)); })<br>
<br>
+/*<br>
+ * Similar to RELOC_HIDE, but written to be used with symbols such as<br>
+ * _stext and _etext to avoid undefined behavior comparing pointers to<br>
+ * different objects. It can handle array types.<br>
+ */<br>
+#define SYMBOL(ptr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 ({ unsigned long __ptr;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 __asm__ (&quot;&quot; : &quot;=3Dr&quot;(__ptr) : &quot;0&qu=
ot;(ptr));=C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 (typeof(*(ptr)) *) (__ptr); })<br>
+<br>
=C2=A0#ifdef __GCC_ASM_FLAG_OUTPUTS__<br>
=C2=A0# define ASM_FLAG_OUT(yes, no) yes<br>
=C2=A0#else<br>
-- <br>
1.9.1<br>
<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank">Xen-dev=
el@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/mailman/listinfo=
/xen-devel</a></blockquote></div></div>

--0000000000006c42b0057f1182f0--


--===============2597167114017476526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2597167114017476526==--
